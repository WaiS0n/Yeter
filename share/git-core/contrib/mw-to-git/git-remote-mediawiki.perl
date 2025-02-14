#!/usr/local/bin/perl

# Copyright (C) 2011
#     Jérémie Nikaes <jeremie.nikaes@ensimag.imag.fr>
#     Arnaud Lacurie <arnaud.lacurie@ensimag.imag.fr>
#     Claire Fousse <claire.fousse@ensimag.imag.fr>
#     David Amouyal <david.amouyal@ensimag.imag.fr>
#     Matthieu Moy <matthieu.moy@grenoble-inp.fr>
# License: GPL v2 or later

# Gateway between Git and MediaWiki.
# Documentation & bugtracker: https://github.com/Git-Mediawiki/Git-Mediawiki

use strict;
use MediaWiki::API;
use Git;
use Git::Mediawiki qw(clean_filename smudge_filename connect_maybe
					EMPTY HTTP_CODE_OK);
use DateTime::Format::ISO8601;
use warnings;

# By default, use UTF-8 to communicate with Git and the user
binmode STDERR, ':encoding(UTF-8)';
binmode STDOUT, ':encoding(UTF-8)';

use URI::Escape;

# It's not always possible to delete pages (may require some
# privileges). Deleted pages are replaced with this content.
use constant DELETED_CONTENT => "[[Category:Deleted]]\n";

# It's not possible to create empty pages. New empty files in Git are
# sent with this content instead.
use constant EMPTY_CONTENT => "<!-- empty page -->\n";

# used to reflect file creation or deletion in diff.
use constant NULL_SHA1 => '0000000000000000000000000000000000000000';

# Used on Git's side to reflect empty edit messages on the wiki
use constant EMPTY_MESSAGE => '*Empty MediaWiki Message*';

# Number of pages taken into account at once in submodule get_mw_page_list
use constant SLICE_SIZE => 50;

# Number of linked mediafile to get at once in get_linked_mediafiles
# The query is split in small batches because of the MW API limit of
# the number of links to be returned (500 links max).
use constant BATCH_SIZE => 10;

if (@ARGV != 2) {
	exit_error_usage();
}

my $remotename = $ARGV[0];
my $url = $ARGV[1];

# Accept both space-separated and multiple keys in config file.
# Spaces should be written as _ anyway because we'll use chomp.
my @tracked_pages = split(/[ \n]/, run_git_quoted(["config", "--get-all", "remote.${remotename}.pages"]));
chomp(@tracked_pages);

# Just like @tracked_pages, but for MediaWiki categories.
my @tracked_categories = split(/[ \n]/, run_git_quoted(["config", "--get-all", "remote.${remotename}.categories"]));
chomp(@tracked_categories);

# Just like @tracked_categories, but for MediaWiki namespaces.
my @tracked_namespaces = split(/[ \n]/, run_git_quoted(["config", "--get-all", "remote.${remotename}.namespaces"]));
for (@tracked_namespaces) { s/_/ /g; }
chomp(@tracked_namespaces);

# Import media files on pull
my $import_media = run_git_quoted(["config", "--get", "--bool", "remote.${remotename}.mediaimport"]);
chomp($import_media);
$import_media = ($import_media eq 'true');

# Export media files on push
my $export_media = run_git_quoted(["config", "--get", "--bool", "remote.${remotename}.mediaexport"]);
chomp($export_media);
$export_media = !($export_media eq 'false');

my $wiki_login = run_git_quoted(["config", "--get", "remote.${remotename}.mwLogin"]);
# Note: mwPassword is discouraged. Use the credential system instead.
my $wiki_passwd = run_git_quoted(["config", "--get", "remote.${remotename}.mwPassword"]);
my $wiki_domain = run_git_quoted(["config", "--get", "remote.${remotename}.mwDomain"]);
chomp($wiki_login);
chomp($wiki_passwd);
chomp($wiki_domain);

# Import only last revisions (both for clone and fetch)
my $shallow_import = run_git_quoted(["config", "--get", "--bool", "remote.${remotename}.shallow"]);
chomp($shallow_import);
$shallow_import = ($shallow_import eq 'true');

# Fetch (clone and pull) by revisions instead of by pages. This behavior
# is more efficient when we have a wiki with lots of pages and we fetch
# the revisions quite often so that they concern only few pages.
# Possible values:
# - by_rev: perform one query per new revision on the remote wiki
# - by_page: query each tracked page for new revision
my $fetch_strategy = run_git_quoted(["config", "--get", "remote.${remotename}.fetchStrategy"]);
if (!$fetch_strategy) {
	$fetch_strategy = run_git_quoted(["config", "--get", "mediawiki.fetchStrategy"]);
}
chomp($fetch_strategy);
if (!$fetch_strategy) {
	$fetch_strategy = 'by_page';
}

# Remember the timestamp corresponding to a revision id.
my %basetimestamps;

# Dumb push: don't update notes and mediawiki ref to reflect the last push.
#
# Configurable with mediawiki.dumbPush, or per-remote with
# remote.<remotename>.dumbPush.
#
# This means the user will have to re-import the just-pushed
# revisions. On the other hand, this means that the Git revisions
# corresponding to MediaWiki revisions are all imported from the wiki,
# regardless of whether they were initially created in Git or from the
# web interface, hence all users will get the same history (i.e. if
# the push from Git to MediaWiki loses some information, everybody
# will get the history with information lost). If the import is
# deterministic, this means everybody gets the same sha1 for each
# MediaWiki revision.
my $dumb_push = run_git_quoted(["config", "--get", "--bool", "remote.${remotename}.dumbPush"]);
if (!$dumb_push) {
	$dumb_push = run_git_quoted(["config", "--get", "--bool", "mediawiki.dumbPush"]);
}
chomp($dumb_push);
$dumb_push = ($dumb_push eq 'true');

my $wiki_name = $url;
$wiki_name =~ s{[^/]*://}{};
# If URL is like http://user:password@example.com/, we clearly don't
# want the password in $wiki_name. While we're there, also remove user
# and '@' sign, to avoid author like MWUser@HTTPUser@host.com
$wiki_name =~ s/^.*@//;

# Commands parser
while (<STDIN>) {
	chomp;

	if (!parse_command($_)) {
		last;
	}

	BEGIN { $| = 1 } # flush STDOUT, to make sure the previous
			 # command is fully processed.
}

########################## Functions ##############################

## error handling
sub exit_error_usage {
	die "ERROR: git-remote-mediawiki module was not called with a correct number of\n" .
	    "parameters\n" .
	    "You may obtain this error because you attempted to run the git-remote-mediawiki\n" .
            "module directly.\n" .
	    "This module can be used the following way:\n" .
	    "\tgit clone mediawiki://<address of a mediawiki>\n" .
	    "Then, use git commit, push and pull as with every normal git repository.\n";
}

sub parse_command {
	my ($line) = @_;
	my @cmd = split(/ /, $line);
	if (!defined $cmd[0]) {
		return 0;
	}
	if ($cmd[0] eq 'capabilities') {
		die("Too many arguments for capabilities\n")
		    if (defined($cmd[1]));
		mw_capabilities();
	} elsif ($cmd[0] eq 'list') {
		die("Too many arguments for list\n") if (defined($cmd[2]));
		mw_list($cmd[1]);
	} elsif ($cmd[0] eq 'import') {
		die("Invalid argument for import\n")
		    if ($cmd[1] eq EMPTY);
		die("Too many arguments for import\n")
		    if (defined($cmd[2]));
		mw_import($cmd[1]);
	} elsif ($cmd[0] eq 'option') {
		die("Invalid arguments for option\n")
		    if ($cmd[1] eq EMPTY || $cmd[2] eq EMPTY);
		die("Too many arguments for option\n")
		    if (defined($cmd[3]));
		mw_option($cmd[1],$cmd[2]);
	} elsif ($cmd[0] eq 'push') {
		mw_push($cmd[1]);
	} else {
		print {*STDERR} "Unknown command. Aborting...\n";
		return 0;
	}
	return 1;
}

# MediaWiki API instance, created lazily.
my $mediawiki;

sub fatal_mw_error {
	my $action = shift;
	print STDERR "fatal: could not $action.\n";
	print STDERR "fatal: '$url' does not appear to be a mediawiki\n";
	if ($url =~ /^https/) {
		print STDERR "fatal: make sure '$url/api.php' is a valid page\n";
		print STDERR "fatal: and the SSL certificate is correct.\n";
	} else {
		print STDERR "fatal: make sure '$url/api.php' is a valid page.\n";
	}
	print STDERR "fatal: (error " .
	    $mediawiki->{error}->{code} . ': ' .
	    $mediawiki->{error}->{details} . ")\n";
	exit 1;
}

## Functions for listing pages on the remote wiki
sub get_mw_tracked_pages {
	my $pages = shift;
	get_mw_page_list(\@tracked_pages, $pages);
	return;
}

sub get_mw_page_list {
	my $page_list = shift;
	my $pages = shift;
	my @some_pages = @{$page_list};
	while (@some_pages) {
		my $last_page = SLICE_SIZE;
		if ($#some_pages < $last_page) {
			$last_page = $#some_pages;
		}
		my @slice = @some_pages[0..$last_page];
		get_mw_first_pages(\@slice, $pages);
		@some_pages = @some_pages[(SLICE_SIZE + 1)..$#some_pages];
	}
	return;
}

sub get_mw_tracked_categories {
	my $pages = shift;
	foreach my $category (@tracked_categories) {
		if (index($category, ':') < 0) {
			# Mediawiki requires the Category
			# prefix, but let's not force the user
			# to specify it.
			$category = "Category:${category}";
		}
		my $mw_pages = $mediawiki->list( {
			action => 'query',
			list => 'categorymembers',
			cmtitle => $category,
			cmlimit => 'max' } )
			|| die $mediawiki->{error}->{code} . ': '
				. $mediawiki->{error}->{details} . "\n";
		foreach my $page (@{$mw_pages}) {
			$pages->{$page->{title}} = $page;
		}
	}
	return;
}

sub get_mw_tracked_namespaces {
    my $pages = shift;
    foreach my $local_namespace (sort @tracked_namespaces) {
        my $namespace_id;
        if ($local_namespace eq "(Main)") {
            $namespace_id = 0;
        } else {
            $namespace_id = get_mw_namespace_id($local_namespace);
        }
        # virtual namespaces don't support allpages
        next if !defined($namespace_id) || $namespace_id < 0;
        my $mw_pages = $mediawiki->list( {
            action => 'query',
            list => 'allpages',
            apnamespace => $namespace_id,
            aplimit => 'max' } )
            || die $mediawiki->{error}->{code} . ': '
                . $mediawiki->{error}->{details} . "\n";
        print {*STDERR} "$#{$mw_pages} found in namespace $local_namespace ($namespace_id)\n";
        foreach my $page (@{$mw_pages}) {
            $pages->{$page->{title}} = $page;
        }
    }
    return;
}

sub get_mw_all_pages {
	my $pages = shift;
	# No user-provided list, get the list of pages from the API.
	my $mw_pages = $mediawiki->list({
		action => 'query',
		list => 'allpages',
		aplimit => 'max'
	});
	if (!defined($mw_pages)) {
		fatal_mw_error("get the list of wiki pages");
	}
	foreach my $page (@{$mw_pages}) {
		$pages->{$page->{title}} = $page;
	}
	return;
}

# queries the wiki for a set of pages. Meant to be used within a loop
# querying the wiki for slices of page list.
sub get_mw_first_pages {
	my $some_pages = shift;
	my @some_pages = @{$some_pages};

	my $pages = shift;

	# pattern 'page1|page2|...' required by the API
	my $titles = join('|', @some_pages);

	my $mw_pages = $mediawiki->api({
		action => 'query',
		titles => $titles,
	});
	if (!defined($mw_pages)) {
		fatal_mw_error("query the list of wiki pages");
	}
	while (my ($id, $page) = each(%{$mw_pages->{query}->{pages}})) {
		if ($id < 0) {
			print {*STDERR} "Warning: page $page->{title} not found on wiki\n";
		} else {
			$pages->{$page->{title}} = $page;
		}
	}
	return;
}

# Get the list of pages to be fetched according to configuration.
sub get_mw_pages {
	$mediawiki = connect_maybe($mediawiki, $remotename, $url);

	print {*STDERR} "Listing pages on remote wiki...\n";

	my %pages; # hash on page titles to avoid duplicates
	my $user_defined;
	if (@tracked_pages) {
		$user_defined = 1;
		# The user provided a list of pages titles, but we
		# still need to query the API to get the page IDs.
		get_mw_tracked_pages(\%pages);
	}
	if (@tracked_categories) {
		$user_defined = 1;
		get_mw_tracked_categories(\%pages);
	}
	if (@tracked_namespaces) {
		$user_defined = 1;
		get_mw_tracked_namespaces(\%pages);
	}
	if (!$user_defined) {
		get_mw_all_pages(\%pages);
	}
	if ($import_media) {
		print {*STDERR} "Getting media files for selected pages...\n";
		if ($user_defined) {
			get_linked_mediafiles(\%pages);
		} else {
			get_all_mediafiles(\%pages);
		}
	}
	print {*STDERR} (scalar keys %pages) . " pages found.\n";
	return %pages;
}

# usage: $out = run_git_quoted(["command", "args", ...]);
#        $out = run_git_quoted(["command", "args", ...], "raw"); # don't interpret output as UTF-8.
#        $out = run_git_quoted_nostderr(["command", "args", ...]); # discard stderr
#        $out = run_git_quoted_nostderr(["command", "args", ...], "raw"); # ditto but raw instead of UTF-8 as above
sub _run_git {
	my $args = shift;
	my $encoding = (shift || 'encoding(UTF-8)');
	open(my $git, "-|:${encoding}", @$args)
	    or die "Unable to fork: $!\n";
	my $res = do {
		local $/ = undef;
		<$git>
	};
	close($git);

	return $res;
}

sub run_git_quoted {
    _run_git(["git", @{$_[0]}], $_[1]);
}

sub run_git_quoted_nostderr {
    _run_git(['sh', '-c', 'git "$@" 2>/dev/null', '--', @{$_[0]}], $_[1]);
}

sub get_all_mediafiles {
	my $pages = shift;
	# Attach list of all pages for media files from the API,
	# they are in a different namespace, only one namespace
	# can be queried at the same moment
	my $mw_pages = $mediawiki->list({
		action => 'query',
		list => 'allpages',
		apnamespace => get_mw_namespace_id('File'),
		aplimit => 'max'
	});
	if (!defined($mw_pages)) {
		print {*STDERR} "fatal: could not get the list of pages for media files.\n";
		print {*STDERR} "fatal: '$url' does not appear to be a mediawiki\n";
		print {*STDERR} "fatal: make sure '$url/api.php' is a valid page.\n";
		exit 1;
	}
	foreach my $page (@{$mw_pages}) {
		$pages->{$page->{title}} = $page;
	}
	return;
}

sub get_linked_mediafiles {
	my $pages = shift;
	my @titles = map { $_->{title} } values(%{$pages});

	my $batch = BATCH_SIZE;
	while (@titles) {
		if ($#titles < $batch) {
			$batch = $#titles;
		}
		my @slice = @titles[0..$batch];

		# pattern 'page1|page2|...' required by the API
		my $mw_titles = join('|', @slice);

		# Media files could be included or linked from
		# a page, get all related
		my $query = {
			action => 'query',
			prop => 'links|images',
			titles => $mw_titles,
			plnamespace => get_mw_namespace_id('File'),
			pllimit => 'max'
		};
		my $result = $mediawiki->api($query);

		while (my ($id, $page) = each(%{$result->{query}->{pages}})) {
			my @media_titles;
			if (defined($page->{links})) {
				my @link_titles
				    = map { $_->{title} } @{$page->{links}};
				push(@media_titles, @link_titles);
			}
			if (defined($page->{images})) {
				my @image_titles
				    = map { $_->{title} } @{$page->{images}};
				push(@media_titles, @image_titles);
			}
			if (@media_titles) {
				get_mw_page_list(\@media_titles, $pages);
			}
		}

		@titles = @titles[($batch+1)..$#titles];
	}
	return;
}

sub get_mw_mediafile_for_page_revision {
	# Name of the file on Wiki, with the prefix.
	my $filename = shift;
	my $timestamp = shift;
	my %mediafile;

	# Search if on a media file with given timestamp exists on
	# MediaWiki. In that case download the file.
	my $query = {
		action => 'query',
		prop => 'imageinfo',
		titles => "File:${filename}",
		iistart => $timestamp,
		iiend => $timestamp,
		iiprop => 'timestamp|archivename|url',
		iilimit => 1
	};
	my $result = $mediawiki->api($query);

	my ($fileid, $file) = each( %{$result->{query}->{pages}} );
	# If not defined it means there is no revision of the file for
	# given timestamp.
	if (defined($file->{imageinfo})) {
		$mediafile{title} = $filename;

		my $fileinfo = pop(@{$file->{imageinfo}});
		$mediafile{timestamp} = $fileinfo->{timestamp};
		# Mediawiki::API's download function doesn't support https URLs
		# and can't download old versions of files.
		print {*STDERR} "\tDownloading file $mediafile{title}, version $mediafile{timestamp}\n";
		$mediafile{content} = download_mw_mediafile($fileinfo->{url});
	}
	return %mediafile;
}

sub download_mw_mediafile {
	my $download_url = shift;

	my $response = $mediawiki->{ua}->get($download_url);
	if ($response->code == HTTP_CODE_OK) {
		# It is tempting to return
		# $response->decoded_content({charset => "none"}), but
		# when doing so, utf8::downgrade($content) fails with
		# "Wide character in subroutine entry".
		$response->decode();
		return $response->content();
	} else {
		print {*STDERR} "Error downloading mediafile from :\n";
		print {*STDERR} "URL: ${download_url}\n";
		print {*STDERR} 'Server response: ' . $response->code . q{ } . $response->message . "\n";
		exit 1;
	}
}

sub get_last_local_revision {
	# Get note regarding last mediawiki revision.
	my $note = run_git_quoted_nostderr(["notes", "--ref=${remotename}/mediawiki",
					    "show", "refs/mediawiki/${remotename}/master"]);
	my @note_info = split(/ /, $note);

	my $lastrevision_number;
	if (!(defined($note_info[0]) && $note_info[0] eq 'mediawiki_revision:')) {
		print {*STDERR} 'No previous mediawiki revision found';
		$lastrevision_number = 0;
	} else {
		# Notes are formatted : mediawiki_revision: #number
		$lastrevision_number = $note_info[1];
		chomp($lastrevision_number);
		print {*STDERR} "Last local mediawiki revision found is ${lastrevision_number}";
	}
	return $lastrevision_number;
}

# Get the last remote revision without taking in account which pages are
# tracked or not. This function makes a single request to the wiki thus
# avoid a loop onto all tracked pages. This is useful for the fetch-by-rev
# option.
sub get_last_global_remote_rev {
	$mediawiki = connect_maybe($mediawiki, $remotename, $url);

	my $query = {
		action => 'query',
		list => 'recentchanges',
		prop => 'revisions',
		rclimit => '1',
		rcdir => 'older',
	};
	my $result = $mediawiki->api($query);
	return $result->{query}->{recentchanges}[0]->{revid};
}

# Get the last remote revision concerning the tracked pages and the tracked
# categories.
sub get_last_remote_revision {
	$mediawiki = connect_maybe($mediawiki, $remotename, $url);

	my %pages_hash = get_mw_pages();
	my @pages = values(%pages_hash);

	my $max_rev_num = 0;

	print {*STDERR} "Getting last revision id on tracked pages...\n";

	foreach my $page (@pages) {
		my $id = $page->{pageid};

		my $query = {
			action => 'query',
			prop => 'revisions',
			rvprop => 'ids|timestamp',
			pageids => $id,
		};

		my $result = $mediawiki->api($query);

		my $lastrev = pop(@{$result->{query}->{pages}->{$id}->{revisions}});

		$basetimestamps{$lastrev->{revid}} = $lastrev->{timestamp};

		$max_rev_num = ($lastrev->{revid} > $max_rev_num ? $lastrev->{revid} : $max_rev_num);
	}

	print {*STDERR} "Last remote revision found is $max_rev_num.\n";
	return $max_rev_num;
}

# Clean content before sending it to MediaWiki
sub mediawiki_clean {
	my $string = shift;
	my $page_created = shift;
	# Mediawiki does not allow blank space at the end of a page and ends with a single \n.
	# This function right trims a string and adds a \n at the end to follow this rule
	$string =~ s/\s+$//;
	if ($string eq EMPTY && $page_created) {
		# Creating empty pages is forbidden.
		$string = EMPTY_CONTENT;
	}
	return $string."\n";
}

# Filter applied on MediaWiki data before adding them to Git
sub mediawiki_smudge {
	my $string = shift;
	if ($string eq EMPTY_CONTENT) {
		$string = EMPTY;
	}
	# This \n is important. This is due to mediawiki's way to handle end of files.
	return "${string}\n";
}

sub literal_data {
	my ($content) = @_;
	print {*STDOUT} 'data ', bytes::length($content), "\n", $content;
	return;
}

sub literal_data_raw {
	# Output possibly binary content.
	my ($content) = @_;
	# Avoid confusion between size in bytes and in characters
	utf8::downgrade($content);
	binmode STDOUT, ':raw';
	print {*STDOUT} 'data ', bytes::length($content), "\n", $content;
	binmode STDOUT, ':encoding(UTF-8)';
	return;
}

sub mw_capabilities {
	# Revisions are imported to the private namespace
	# refs/mediawiki/$remotename/ by the helper and fetched into
	# refs/remotes/$remotename later by fetch.
	print {*STDOUT} "refspec refs/heads/*:refs/mediawiki/${remotename}/*\n";
	print {*STDOUT} "import\n";
	print {*STDOUT} "list\n";
	print {*STDOUT} "push\n";
	if ($dumb_push) {
		print {*STDOUT} "no-private-update\n";
	}
	print {*STDOUT} "\n";
	return;
}

sub mw_list {
	# MediaWiki do not have branches, we consider one branch arbitrarily
	# called master, and HEAD pointing to it.
	print {*STDOUT} "? refs/heads/master\n";
	print {*STDOUT} "\@refs/heads/master HEAD\n";
	print {*STDOUT} "\n";
	return;
}

sub mw_option {
	print {*STDERR} "remote-helper command 'option $_[0]' not yet implemented\n";
	print {*STDOUT} "unsupported\n";
	return;
}

sub fetch_mw_revisions_for_page {
	my $page = shift;
	my $id = shift;
	my $fetch_from = shift;
	my @page_revs = ();
	my $query = {
		action => 'query',
		prop => 'revisions',
		rvprop => 'ids',
		rvdir => 'newer',
		rvstartid => $fetch_from,
		rvlimit => 500,
		pageids => $id,

		# Let MediaWiki know that we support the latest API.
		continue => '',
	};

	my $revnum = 0;
	# Get 500 revisions at a time due to the mediawiki api limit
	while (1) {
		my $result = $mediawiki->api($query);

		# Parse each of those 500 revisions
		foreach my $revision (@{$result->{query}->{pages}->{$id}->{revisions}}) {
			my $page_rev_ids;
			$page_rev_ids->{pageid} = $page->{pageid};
			$page_rev_ids->{revid} = $revision->{revid};
			push(@page_revs, $page_rev_ids);
			$revnum++;
		}

		if ($result->{'query-continue'}) { # For legacy APIs
			$query->{rvstartid} = $result->{'query-continue'}->{revisions}->{rvstartid};
		} elsif ($result->{continue}) { # For newer APIs
			$query->{rvstartid} = $result->{continue}->{rvcontinue};
			$query->{continue} = $result->{continue}->{continue};
		} else {
			last;
		}
	}
	if ($shallow_import && @page_revs) {
		print {*STDERR} "  Found 1 revision (shallow import).\n";
		@page_revs = sort {$b->{revid} <=> $a->{revid}} (@page_revs);
		return $page_revs[0];
	}
	print {*STDERR} "  Found ${revnum} revision(s).\n";
	return @page_revs;
}

sub fetch_mw_revisions {
	my $pages = shift; my @pages = @{$pages};
	my $fetch_from = shift;

	my @revisions = ();
	my $n = 1;
	foreach my $page (@pages) {
		my $id = $page->{pageid};
		print {*STDERR} "page ${n}/", scalar(@pages), ': ', $page->{title}, "\n";
		$n++;
		my @page_revs = fetch_mw_revisions_for_page($page, $id, $fetch_from);
		@revisions = (@page_revs, @revisions);
	}

	return ($n, @revisions);
}

sub fe_escape_path {
    my $path = shift;
    $path =~ s/\\/\\\\/g;
    $path =~ s/"/\\"/g;
    $path =~ s/\n/\\n/g;
    return qq("${path}");
}

sub import_file_revision {
	my $commit = shift;
	my %commit = %{$commit};
	my $full_import = shift;
	my $n = shift;
	my $mediafile = shift;
	my %mediafile;
	if ($mediafile) {
		%mediafile = %{$mediafile};
	}

	my $title = $commit{title};
	my $comment = $commit{comment};
	my $content = $commit{content};
	my $author = $commit{author};
	my $date = $commit{date};

	print {*STDOUT} "commit refs/mediawiki/${remotename}/master\n";
	print {*STDOUT} "mark :${n}\n";
	print {*STDOUT} "committer ${author} <${author}\@${wiki_name}> " . $date->epoch . " +0000\n";
	literal_data($comment);

	# If it's not a clone, we need to know where to start from
	if (!$full_import && $n == 1) {
		print {*STDOUT} "from refs/mediawiki/${remotename}/master^0\n";
	}
	if ($content ne DELETED_CONTENT) {
		print {*STDOUT} 'M 644 inline ' .
		    fe_escape_path("${title}.mw") . "\n";
		literal_data($content);
		if (%mediafile) {
			print {*STDOUT} 'M 644 inline '
			    . fe_escape_path($mediafile{title}) . "\n";
			literal_data_raw($mediafile{content});
		}
		print {*STDOUT} "\n\n";
	} else {
		print {*STDOUT} 'D ' . fe_escape_path("${title}.mw") . "\n";
	}

	# mediawiki revision number in the git note
	if ($full_import && $n == 1) {
		print {*STDOUT} "reset refs/notes/${remotename}/mediawiki\n";
	}
	print {*STDOUT} "commit refs/notes/${remotename}/mediawiki\n";
	print {*STDOUT} "committer ${author} <${author}\@${wiki_name}> " . $date->epoch . " +0000\n";
	literal_data('Note added by git-mediawiki during import');
	if (!$full_import && $n == 1) {
		print {*STDOUT} "from refs/notes/${remotename}/mediawiki^0\n";
	}
	print {*STDOUT} "N inline :${n}\n";
	literal_data("mediawiki_revision: $commit{mw_revision}");
	print {*STDOUT} "\n\n";
	return;
}

# parse a sequence of
# <cmd> <arg1>
# <cmd> <arg2>
# \n
# (like batch sequence of import and sequence of push statements)
sub get_more_refs {
	my $cmd = shift;
	my @refs;
	while (1) {
		my $line = <STDIN>;
		if ($line =~ /^$cmd (.*)$/) {
			push(@refs, $1);
		} elsif ($line eq "\n") {
			return @refs;
		} else {
			die("Invalid command in a '$cmd' batch: $_\n");
		}
	}
	return;
}

sub mw_import {
	# multiple import commands can follow each other.
	my @refs = (shift, get_more_refs('import'));
	my $processedRefs;
	foreach my $ref (@refs) {
		next if $processedRefs->{$ref}; # skip duplicates: "import refs/heads/master" being issued twice; TODO: why?
		$processedRefs->{$ref} = 1;
		mw_import_ref($ref);
	}
	print {*STDOUT} "done\n";
	return;
}

sub mw_import_ref {
	my $ref = shift;
	# The remote helper will call "import HEAD" and
	# "import refs/heads/master".
	# Since HEAD is a symbolic ref to master (by convention,
	# followed by the output of the command "list" that we gave),
	# we don't need to do anything in this case.
	if ($ref eq 'HEAD') {
		return;
	}

	$mediawiki = connect_maybe($mediawiki, $remotename, $url);

	print {*STDERR} "Searching revisions...\n";
	my $last_local = get_last_local_revision();
	my $fetch_from = $last_local + 1;
	if ($fetch_from == 1) {
		print {*STDERR} ", fetching from beginning.\n";
	} else {
		print {*STDERR} ", fetching from here.\n";
	}

	my $n = 0;
	if ($fetch_strategy eq 'by_rev') {
		print {*STDERR} "Fetching & writing export data by revs...\n";
		$n = mw_import_ref_by_revs($fetch_from);
	} elsif ($fetch_strategy eq 'by_page') {
		print {*STDERR} "Fetching & writing export data by pages...\n";
		$n = mw_import_ref_by_pages($fetch_from);
	} else {
		print {*STDERR} qq(fatal: invalid fetch strategy "${fetch_strategy}".\n);
		print {*STDERR} "Check your configuration variables remote.${remotename}.fetchStrategy and mediawiki.fetchStrategy\n";
		exit 1;
	}

	if ($fetch_from == 1 && $n == 0) {
		print {*STDERR} "You appear to have cloned an empty MediaWiki.\n";
		# Something has to be done remote-helper side. If nothing is done, an error is
		# thrown saying that HEAD is referring to unknown object 0000000000000000000
		# and the clone fails.
	}
	return;
}

sub mw_import_ref_by_pages {

	my $fetch_from = shift;
	my %pages_hash = get_mw_pages();
	my @pages = values(%pages_hash);

	my ($n, @revisions) = fetch_mw_revisions(\@pages, $fetch_from);

	@revisions = sort {$a->{revid} <=> $b->{revid}} @revisions;
	my @revision_ids = map { $_->{revid} } @revisions;

	return mw_import_revids($fetch_from, \@revision_ids, \%pages_hash);
}

sub mw_import_ref_by_revs {

	my $fetch_from = shift;
	my %pages_hash = get_mw_pages();

	my $last_remote = get_last_global_remote_rev();
	my @revision_ids = $fetch_from..$last_remote;
	return mw_import_revids($fetch_from, \@revision_ids, \%pages_hash);
}

# Import revisions given in second argument (array of integers).
# Only pages appearing in the third argument (hash indexed by page titles)
# will be imported.
sub mw_import_revids {
	my $fetch_from = shift;
	my $revision_ids = shift;
	my $pages = shift;

	my $n = 0;
	my $n_actual = 0;
	my $last_timestamp = 0; # Placeholder in case $rev->timestamp is undefined

	foreach my $pagerevid (@{$revision_ids}) {
	        # Count page even if we skip it, since we display
		# $n/$total and $total includes skipped pages.
		$n++;

		# fetch the content of the pages
		my $query = {
			action => 'query',
			prop => 'revisions',
			rvprop => 'content|timestamp|comment|user|ids',
			revids => $pagerevid,
		};

		my $result = $mediawiki->api($query);

		if (!$result) {
			die "Failed to retrieve modified page for revision $pagerevid\n";
		}

		if (defined($result->{query}->{badrevids}->{$pagerevid})) {
			# The revision id does not exist on the remote wiki.
			next;
		}

		if (!defined($result->{query}->{pages})) {
			die "Invalid revision ${pagerevid}.\n";
		}

		my @result_pages = values(%{$result->{query}->{pages}});
		my $result_page = $result_pages[0];
		my $rev = $result_pages[0]->{revisions}->[0];

		my $page_title = $result_page->{title};

		if (!exists($pages->{$page_title})) {
			print {*STDERR} "${n}/", scalar(@{$revision_ids}),
				": Skipping revision #$rev->{revid} of ${page_title}\n";
			next;
		}

		$n_actual++;

		my %commit;
		$commit{author} = $rev->{user} || 'Anonymous';
		$commit{comment} = $rev->{comment} || EMPTY_MESSAGE;
		$commit{title} = smudge_filename($page_title);
		$commit{mw_revision} = $rev->{revid};
		$commit{content} = mediawiki_smudge($rev->{'*'});

		if (!defined($rev->{timestamp})) {
			$last_timestamp++;
		} else {
			$last_timestamp = $rev->{timestamp};
		}
		$commit{date} = DateTime::Format::ISO8601->parse_datetime($last_timestamp);

		# Differentiates classic pages and media files.
		my ($namespace, $filename) = $page_title =~ /^([^:]*):(.*)$/;
		my %mediafile;
		if ($namespace) {
			my $id = get_mw_namespace_id($namespace);
			if ($id && $id == get_mw_namespace_id('File')) {
				%mediafile = get_mw_mediafile_for_page_revision($filename, $rev->{timestamp});
			}
		}
		# If this is a revision of the media page for new version
		# of a file do one common commit for both file and media page.
		# Else do commit only for that page.
		print {*STDERR} "${n}/", scalar(@{$revision_ids}), ": Revision #$rev->{revid} of $commit{title}\n";
		import_file_revision(\%commit, ($fetch_from == 1), $n_actual, \%mediafile);
	}

	return $n_actual;
}

sub error_non_fast_forward {
	my $advice = run_git_quoted(["config", "--bool", "advice.pushNonFastForward"]);
	chomp($advice);
	if ($advice ne 'false') {
		# Native git-push would show this after the summary.
		# We can't ask it to display it cleanly, so print it
		# ourselves before.
		print {*STDERR} "To prevent you from losing history, non-fast-forward updates were rejected\n";
		print {*STDERR} "Merge the remote changes (e.g. 'git pull') before pushing again. See the\n";
		print {*STDERR} "'Note about fast-forwards' section of 'git push --help' for details.\n";
	}
	print {*STDOUT} qq(error $_[0] "non-fast-forward"\n);
	return 0;
}

sub mw_upload_file {
	my $complete_file_name = shift;
	my $new_sha1 = shift;
	my $extension = shift;
	my $file_deleted = shift;
	my $summary = shift;
	my $newrevid;
	my $path = "File:${complete_file_name}";
	my %hashFiles = get_allowed_file_extensions();
	if (!exists($hashFiles{$extension})) {
		print {*STDERR} "${complete_file_name} is not a permitted file on this wiki.\n";
		print {*STDERR} "Check the configuration of file uploads in your mediawiki.\n";
		return $newrevid;
	}
	# Deleting and uploading a file requires a privileged user
	if ($file_deleted) {
		$mediawiki = connect_maybe($mediawiki, $remotename, $url);
		my $query = {
			action => 'delete',
			title => $path,
			reason => $summary
		};
		if (!$mediawiki->edit($query)) {
			print {*STDERR} "Failed to delete file on remote wiki\n";
			print {*STDERR} "Check your permissions on the remote site. Error code:\n";
			print {*STDERR} $mediawiki->{error}->{code} . ':' . $mediawiki->{error}->{details};
			exit 1;
		}
	} else {
		# Don't let perl try to interpret file content as UTF-8 => use "raw"
		my $content = run_git_quoted(["cat-file", "blob", $new_sha1], 'raw');
		if ($content ne EMPTY) {
			$mediawiki = connect_maybe($mediawiki, $remotename, $url);
			$mediawiki->{config}->{upload_url} =
				"${url}/index.php/Special:Upload";
			$mediawiki->edit({
				action => 'upload',
				filename => $complete_file_name,
				comment => $summary,
				file => [undef,
					 $complete_file_name,
					 Content => $content],
				ignorewarnings => 1,
			}, {
				skip_encoding => 1
			} ) || die $mediawiki->{error}->{code} . ':'
				 . $mediawiki->{error}->{details} . "\n";
			my $last_file_page = $mediawiki->get_page({title => $path});
			$newrevid = $last_file_page->{revid};
			print {*STDERR} "Pushed file: ${new_sha1} - ${complete_file_name}.\n";
		} else {
			print {*STDERR} "Empty file ${complete_file_name} not pushed.\n";
		}
	}
	return $newrevid;
}

sub mw_push_file {
	my $diff_info = shift;
	# $diff_info contains a string in this format:
	# 100644 100644 <sha1_of_blob_before_commit> <sha1_of_blob_now> <status>
	my @diff_info_split = split(/[ \t]/, $diff_info);

	# Filename, including .mw extension
	my $complete_file_name = shift;
	# Commit message
	my $summary = shift;
	# MediaWiki revision number. Keep the previous one by default,
	# in case there's no edit to perform.
	my $oldrevid = shift;
	my $newrevid;

	if ($summary eq EMPTY_MESSAGE) {
		$summary = EMPTY;
	}

	my $new_sha1 = $diff_info_split[3];
	my $old_sha1 = $diff_info_split[2];
	my $page_created = ($old_sha1 eq NULL_SHA1);
	my $page_deleted = ($new_sha1 eq NULL_SHA1);
	$complete_file_name = clean_filename($complete_file_name);

	my ($title, $extension) = $complete_file_name =~ /^(.*)\.([^\.]*)$/;
	if (!defined($extension)) {
		$extension = EMPTY;
	}
	if ($extension eq 'mw') {
		my $ns = get_mw_namespace_id_for_page($complete_file_name);
		if ($ns && $ns == get_mw_namespace_id('File') && (!$export_media)) {
			print {*STDERR} "Ignoring media file related page: ${complete_file_name}\n";
			return ($oldrevid, 'ok');
		}
		my $file_content;
		if ($page_deleted) {
			# Deleting a page usually requires
			# special privileges. A common
			# convention is to replace the page
			# with this content instead:
			$file_content = DELETED_CONTENT;
		} else {
			$file_content = run_git_quoted(["cat-file", "blob", $new_sha1]);
		}

		$mediawiki = connect_maybe($mediawiki, $remotename, $url);

		my $result = $mediawiki->edit( {
			action => 'edit',
			summary => $summary,
			title => $title,
			basetimestamp => $basetimestamps{$oldrevid},
			text => mediawiki_clean($file_content, $page_created),
				  }, {
					  skip_encoding => 1 # Helps with names with accentuated characters
				  });
		if (!$result) {
			if ($mediawiki->{error}->{code} == 3) {
				# edit conflicts, considered as non-fast-forward
				print {*STDERR} 'Warning: Error ' .
				    $mediawiki->{error}->{code} .
				    ' from mediawiki: ' . $mediawiki->{error}->{details} .
				    ".\n";
				return ($oldrevid, 'non-fast-forward');
			} else {
				# Other errors. Shouldn't happen => just die()
				die 'Fatal: Error ' .
				    $mediawiki->{error}->{code} .
				    ' from mediawiki: ' . $mediawiki->{error}->{details} . "\n";
			}
		}
		$newrevid = $result->{edit}->{newrevid};
		print {*STDERR} "Pushed file: ${new_sha1} - ${title}\n";
	} elsif ($export_media) {
		$newrevid = mw_upload_file($complete_file_name, $new_sha1,
					   $extension, $page_deleted,
					   $summary);
	} else {
		print {*STDERR} "Ignoring media file ${title}\n";
	}
	$newrevid = ($newrevid or $oldrevid);
	return ($newrevid, 'ok');
}

sub mw_push {
	# multiple push statements can follow each other
	my @refsspecs = (shift, get_more_refs('push'));
	my $pushed;
	for my $refspec (@refsspecs) {
		my ($force, $local, $remote) = $refspec =~ /^(\+)?([^:]*):([^:]*)$/
		    or die("Invalid refspec for push. Expected <src>:<dst> or +<src>:<dst>\n");
		if ($force) {
			print {*STDERR} "Warning: forced push not allowed on a MediaWiki.\n";
		}
		if ($local eq EMPTY) {
			print {*STDERR} "Cannot delete remote branch on a MediaWiki\n";
			print {*STDOUT} "error ${remote} cannot delete\n";
			next;
		}
		if ($remote ne 'refs/heads/master') {
			print {*STDERR} "Only push to the branch 'master' is supported on a MediaWiki\n";
			print {*STDOUT} "error ${remote} only master allowed\n";
			next;
		}
		if (mw_push_revision($local, $remote)) {
			$pushed = 1;
		}
	}

	# Notify Git that the push is done
	print {*STDOUT} "\n";

	if ($pushed && $dumb_push) {
		print {*STDERR} "Just pushed some revisions to MediaWiki.\n";
		print {*STDERR} "The pushed revisions now have to be re-imported, and your current branch\n";
		print {*STDERR} "needs to be updated with these re-imported commits. You can do this with\n";
		print {*STDERR} "\n";
		print {*STDERR} "  git pull --rebase\n";
		print {*STDERR} "\n";
	}
	return;
}

sub mw_push_revision {
	my $local = shift;
	my $remote = shift; # actually, this has to be "refs/heads/master" at this point.
	my $last_local_revid = get_last_local_revision();
	print {*STDERR} ".\n"; # Finish sentence started by get_last_local_revision()
	my $last_remote_revid = get_last_remote_revision();
	my $mw_revision = $last_remote_revid;

	# Get sha1 of commit pointed by local HEAD
	my $HEAD_sha1 = run_git_quoted_nostderr(["rev-parse", $local]);
	chomp($HEAD_sha1);
	# Get sha1 of commit pointed by remotes/$remotename/master
	my $remoteorigin_sha1 = run_git_quoted_nostderr(["rev-parse", "refs/remotes/${remotename}/master"]);
	chomp($remoteorigin_sha1);

	if ($last_local_revid > 0 &&
	    $last_local_revid < $last_remote_revid) {
		return error_non_fast_forward($remote);
	}

	if ($HEAD_sha1 eq $remoteorigin_sha1) {
		# nothing to push
		return 0;
	}

	# Get every commit in between HEAD and refs/remotes/origin/master,
	# including HEAD and refs/remotes/origin/master
	my @commit_pairs = ();
	if ($last_local_revid > 0) {
		my $parsed_sha1 = $remoteorigin_sha1;
		# Find a path from last MediaWiki commit to pushed commit
		print {*STDERR} "Computing path from local to remote ...\n";
		my @local_ancestry = split(/\n/, run_git_quoted(["rev-list", "--boundary", "--parents", $local, "^${parsed_sha1}"]));
		my %local_ancestry;
		foreach my $line (@local_ancestry) {
			if (my ($child, $parents) = $line =~ /^-?([a-f0-9]+) ([a-f0-9 ]+)/) {
				foreach my $parent (split(/ /, $parents)) {
					$local_ancestry{$parent} = $child;
				}
			} elsif (!$line =~ /^([a-f0-9]+)/) {
				die "Unexpected output from git rev-list: ${line}\n";
			}
		}
		while ($parsed_sha1 ne $HEAD_sha1) {
			my $child = $local_ancestry{$parsed_sha1};
			if (!$child) {
				print {*STDERR} "Cannot find a path in history from remote commit to last commit\n";
				return error_non_fast_forward($remote);
			}
			push(@commit_pairs, [$parsed_sha1, $child]);
			$parsed_sha1 = $child;
		}
	} else {
		# No remote mediawiki revision. Export the whole
		# history (linearized with --first-parent)
		print {*STDERR} "Warning: no common ancestor, pushing complete history\n";
		my $history = run_git_quoted(["rev-list", "--first-parent", "--children", $local]);
		my @history = split(/\n/, $history);
		@history = @history[1..$#history];
		foreach my $line (reverse @history) {
			my @commit_info_split = split(/[ \n]/, $line);
			push(@commit_pairs, \@commit_info_split);
		}
	}

	foreach my $commit_info_split (@commit_pairs) {
		my $sha1_child = @{$commit_info_split}[0];
		my $sha1_commit = @{$commit_info_split}[1];
		my $diff_infos = run_git_quoted(["diff-tree", "-r", "--raw", "-z", $sha1_child, $sha1_commit]);
		# TODO: we could detect rename, and encode them with a #redirect on the wiki.
		# TODO: for now, it's just a delete+add
		my @diff_info_list = split(/\0/, $diff_infos);
		# Keep the subject line of the commit message as mediawiki comment for the revision
		my $commit_msg = run_git_quoted(["log", "--no-walk", '--format="%s"', $sha1_commit]);
		chomp($commit_msg);
		# Push every blob
		while (@diff_info_list) {
			my $status;
			# git diff-tree -z gives an output like
			# <metadata>\0<filename1>\0
			# <metadata>\0<filename2>\0
			# and we've split on \0.
			my $info = shift(@diff_info_list);
			my $file = shift(@diff_info_list);
			($mw_revision, $status) = mw_push_file($info, $file, $commit_msg, $mw_revision);
			if ($status eq 'non-fast-forward') {
				# we may already have sent part of the
				# commit to MediaWiki, but it's too
				# late to cancel it. Stop the push in
				# the middle, but still give an
				# accurate error message.
				return error_non_fast_forward($remote);
			}
			if ($status ne 'ok') {
				die("Unknown error from mw_push_file()\n");
			}
		}
		if (!$dumb_push) {
			run_git_quoted(["notes", "--ref=${remotename}/mediawiki",
					"add", "-f", "-m",
					"mediawiki_revision: ${mw_revision}",
					$sha1_commit]);
		}
	}

	print {*STDOUT} "ok ${remote}\n";
	return 1;
}

sub get_allowed_file_extensions {
	$mediawiki = connect_maybe($mediawiki, $remotename, $url);

	my $query = {
		action => 'query',
		meta => 'siteinfo',
		siprop => 'fileextensions'
		};
	my $result = $mediawiki->api($query);
	my @file_extensions = map { $_->{ext}} @{$result->{query}->{fileextensions}};
	my %hashFile = map { $_ => 1 } @file_extensions;

	return %hashFile;
}

# In memory cache for MediaWiki namespace ids.
my %namespace_id;

# Namespaces whose id is cached in the configuration file
# (to avoid duplicates)
my %cached_mw_namespace_id;

# Return MediaWiki id for a canonical namespace name.
# Ex.: "File", "Project".
sub get_mw_namespace_id {
	$mediawiki = connect_maybe($mediawiki, $remotename, $url);
	my $name = shift;

	if (!exists $namespace_id{$name}) {
		# Look at configuration file, if the record for that namespace is
		# already cached. Namespaces are stored in form:
		# "Name_of_namespace:Id_namespace", ex.: "File:6".
		my @temp = split(/\n/,
				 run_git_quoted(["config", "--get-all", "remote.${remotename}.namespaceCache"]));
		chomp(@temp);
		foreach my $ns (@temp) {
			my ($n, $id) = split(/:/, $ns);
			if ($id eq 'notANameSpace') {
				$namespace_id{$n} = {is_namespace => 0};
			} else {
				$namespace_id{$n} = {is_namespace => 1, id => $id};
			}
			$cached_mw_namespace_id{$n} = 1;
		}
	}

	if (!exists $namespace_id{$name}) {
		print {*STDERR} "Namespace ${name} not found in cache, querying the wiki ...\n";
		# NS not found => get namespace id from MW and store it in
	        # configuration file.
	        my $query = {
	                action => 'query',
	                meta => 'siteinfo',
	                siprop => 'namespaces'
	        };
	        my $result = $mediawiki->api($query);

	        while (my ($id, $ns) = each(%{$result->{query}->{namespaces}})) {
	                if (defined($ns->{id}) && defined($ns->{canonical})) {
				$namespace_id{$ns->{canonical}} = {is_namespace => 1, id => $ns->{id}};
				if ($ns->{'*'}) {
					# alias (e.g. french Fichier: as alias for canonical File:)
					$namespace_id{$ns->{'*'}} = {is_namespace => 1, id => $ns->{id}};
				}
			}
	        }
	}

	my $ns = $namespace_id{$name};
	my $id;

	if (!defined $ns) {
		my @namespaces = map { s/ /_/g; $_; } sort keys %namespace_id;
		print {*STDERR} "No such namespace ${name} on MediaWiki, known namespaces: @namespaces\n";
		$ns = {is_namespace => 0};
		$namespace_id{$name} = $ns;
	}

	if ($ns->{is_namespace}) {
		$id = $ns->{id};
	}

	# Store "notANameSpace" as special value for inexisting namespaces
	my $store_id = ($id || 'notANameSpace');

	# Store explicitly requested namespaces on disk
	if (!exists $cached_mw_namespace_id{$name}) {
		run_git_quoted(["config", "--add", "remote.${remotename}.namespaceCache", "${name}:${store_id}"]);
		$cached_mw_namespace_id{$name} = 1;
	}
	return $id;
}

sub get_mw_namespace_id_for_page {
	my $namespace = shift;
	if ($namespace =~ /^([^:]*):/) {
		return get_mw_namespace_id($namespace);
	} else {
		return;
	}
}

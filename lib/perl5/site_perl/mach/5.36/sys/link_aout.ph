require '_h2ph_pre.ph';

no warnings qw(redefine misc);

unless(defined(&_SYS_LINK_AOUT_H_)) {
    eval 'sub _SYS_LINK_AOUT_H_ () {1;}' unless defined(&_SYS_LINK_AOUT_H_);
    eval 'sub nz_un () { ($nlist->{n_un});}' unless defined(&nz_un);
    eval 'sub nz_strx () { ($nlist->{n_un}->{n_strx});}' unless defined(&nz_strx);
    eval 'sub nz_name () { ($nlist->{n_un}->{n_name});}' unless defined(&nz_name);
    eval 'sub nz_type () { ($nlist->{n_type});}' unless defined(&nz_type);
    eval 'sub nz_value () { ($nlist->{n_value});}' unless defined(&nz_value);
    eval 'sub nz_desc () { ($nlist->{n_desc});}' unless defined(&nz_desc);
    eval 'sub nz_other () { ($nlist->{n_other});}' unless defined(&nz_other);
    eval 'sub LDSO_VERSION_NONE () {0;}' unless defined(&LDSO_VERSION_NONE);
    eval 'sub LDSO_VERSION_HAS_DLEXIT () {1;}' unless defined(&LDSO_VERSION_HAS_DLEXIT);
    eval 'sub LDSO_VERSION_HAS_DLSYM3 () {2;}' unless defined(&LDSO_VERSION_HAS_DLSYM3);
    eval 'sub LDSO_VERSION_HAS_DLADDR () {3;}' unless defined(&LDSO_VERSION_HAS_DLADDR);
    eval 'sub LD_VERSION_SUN () {(3);}' unless defined(&LD_VERSION_SUN);
    eval 'sub LD_VERSION_BSD () {(8);}' unless defined(&LD_VERSION_BSD);
    eval 'sub LD_VERSION_NZLIST_P {
        my($v) = @_;
	    eval q((($v) >= 8));
    }' unless defined(&LD_VERSION_NZLIST_P);
    eval 'sub LD_GOT {
        my($x) = @_;
	    eval q((($x)-> ($d_un->{d_sdt}->{sdt_got})));
    }' unless defined(&LD_GOT);
    eval 'sub LD_PLT {
        my($x) = @_;
	    eval q((($x)-> ($d_un->{d_sdt}->{sdt_plt})));
    }' unless defined(&LD_PLT);
    eval 'sub LD_REL {
        my($x) = @_;
	    eval q((($x)-> ($d_un->{d_sdt}->{sdt_rel})));
    }' unless defined(&LD_REL);
    eval 'sub LD_SYMBOL {
        my($x) = @_;
	    eval q((($x)-> ($d_un->{d_sdt}->{sdt_nzlist})));
    }' unless defined(&LD_SYMBOL);
    eval 'sub LD_HASH {
        my($x) = @_;
	    eval q((($x)-> ($d_un->{d_sdt}->{sdt_hash})));
    }' unless defined(&LD_HASH);
    eval 'sub LD_STRINGS {
        my($x) = @_;
	    eval q((($x)-> ($d_un->{d_sdt}->{sdt_strings})));
    }' unless defined(&LD_STRINGS);
    eval 'sub LD_NEED {
        my($x) = @_;
	    eval q((($x)-> ($d_un->{d_sdt}->{sdt_sods})));
    }' unless defined(&LD_NEED);
    eval 'sub LD_BUCKETS {
        my($x) = @_;
	    eval q((($x)-> ($d_un->{d_sdt}->{sdt_buckets})));
    }' unless defined(&LD_BUCKETS);
    eval 'sub LD_PATHS {
        my($x) = @_;
	    eval q((($x)-> ($d_un->{d_sdt}->{sdt_paths})));
    }' unless defined(&LD_PATHS);
    eval 'sub LD_GOTSZ {
        my($x) = @_;
	    eval q((($x)-> ($d_un->{d_sdt}->{sdt_plt}) - ($x)-> ($d_un->{d_sdt}->{sdt_got})));
    }' unless defined(&LD_GOTSZ);
    eval 'sub LD_RELSZ {
        my($x) = @_;
	    eval q((($x)-> ($d_un->{d_sdt}->{sdt_hash}) - ($x)-> ($d_un->{d_sdt}->{sdt_rel})));
    }' unless defined(&LD_RELSZ);
    eval 'sub LD_HASHSZ {
        my($x) = @_;
	    eval q((($x)-> ($d_un->{d_sdt}->{sdt_nzlist}) - ($x)-> ($d_un->{d_sdt}->{sdt_hash})));
    }' unless defined(&LD_HASHSZ);
    eval 'sub LD_STABSZ {
        my($x) = @_;
	    eval q((($x)-> ($d_un->{d_sdt}->{sdt_strings}) - ($x)-> ($d_un->{d_sdt}->{sdt_nzlist})));
    }' unless defined(&LD_STABSZ);
    eval 'sub LD_PLTSZ {
        my($x) = @_;
	    eval q((($x)-> ($d_un->{d_sdt}->{sdt_plt_sz})));
    }' unless defined(&LD_PLTSZ);
    eval 'sub LD_STRSZ {
        my($x) = @_;
	    eval q((($x)-> ($d_un->{d_sdt}->{sdt_str_sz})));
    }' unless defined(&LD_STRSZ);
    eval 'sub LD_TEXTSZ {
        my($x) = @_;
	    eval q((($x)-> ($d_un->{d_sdt}->{sdt_text_sz})));
    }' unless defined(&LD_TEXTSZ);
    eval 'sub CRT_VERSION_SUN () {1;}' unless defined(&CRT_VERSION_SUN);
    eval 'sub CRT_VERSION_BSD_2 () {2;}' unless defined(&CRT_VERSION_BSD_2);
    eval 'sub CRT_VERSION_BSD_3 () {3;}' unless defined(&CRT_VERSION_BSD_3);
    eval 'sub CRT_VERSION_BSD_4 () {4;}' unless defined(&CRT_VERSION_BSD_4);
    eval 'sub CRT_VERSION_BSD_5 () {5;}' unless defined(&CRT_VERSION_BSD_5);
    eval 'sub MAXDEWEY () {8;}' unless defined(&MAXDEWEY);
    eval 'sub HH_MAGIC () {011421044151;}' unless defined(&HH_MAGIC);
    eval 'sub LD_HINTS_VERSION_1 () {1;}' unless defined(&LD_HINTS_VERSION_1);
    eval 'sub LD_HINTS_VERSION_2 () {2;}' unless defined(&LD_HINTS_VERSION_2);
    eval 'sub HH_BADMAG {
        my($hdr) = @_;
	    eval q((($hdr). &hh_magic !=  &HH_MAGIC));
    }' unless defined(&HH_BADMAG);
    eval 'sub hi_major () { $hi_dewey[0];}' unless defined(&hi_major);
    eval 'sub hi_minor () { $hi_dewey[1];}' unless defined(&hi_minor);
    eval 'sub _PATH_LD_HINTS () {"/var/run/ld.so.hints";}' unless defined(&_PATH_LD_HINTS);
}
1;

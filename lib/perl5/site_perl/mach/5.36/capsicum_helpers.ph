require '_h2ph_pre.ph';

no warnings qw(redefine misc);

unless(defined(&_CAPSICUM_HELPERS_H_)) {
    eval 'sub _CAPSICUM_HELPERS_H_ () {1;}' unless defined(&_CAPSICUM_HELPERS_H_);
    require 'sys/param.ph';
    require 'sys/capsicum.ph';
    require 'sys/ioctl.ph';
    require 'errno.ph';
    require 'nl_types.ph';
    require 'termios.ph';
    require 'time.ph';
    require 'unistd.ph';
    require 'libcasper.ph';
    eval 'sub CAPH_IGNORE_EBADF () {0x1;}' unless defined(&CAPH_IGNORE_EBADF);
    eval 'sub CAPH_READ () {0x2;}' unless defined(&CAPH_READ);
    eval 'sub CAPH_WRITE () {0x4;}' unless defined(&CAPH_WRITE);
    eval 'sub CAPH_LOOKUP () {0x8;}' unless defined(&CAPH_LOOKUP);
    if(defined(&TIOCGETA)) {
    }
    if(defined(&TIOCGWINSZ)) {
    }
    if(defined(&FIODTYPE)) {
    }
    eval 'sub caph_stream_rights {
        my($rights,$flags) = @_;
	    eval q({  &cap_rights_init($rights,  &CAP_EVENT,  &CAP_FCNTL,  &CAP_FSTAT,  &CAP_IOCTL,  &CAP_SEEK);  &if (($flags &  &CAPH_READ) != 0)  &cap_rights_set($rights,  &CAP_READ);  &if (($flags &  &CAPH_WRITE) != 0)  &cap_rights_set($rights,  &CAP_WRITE);  &if (($flags &  &CAPH_LOOKUP) != 0)  &cap_rights_set($rights,  &CAP_LOOKUP); });
    }' unless defined(&caph_stream_rights);
    eval 'sub caph_limit_stream {
        my($fd,$flags) = @_;
	    eval q({  &cap_rights_t  &rights;  &caph_stream_rights( &rights, $flags);  &if ( &cap_rights_limit($fd,  &rights) < 0 &&  &errno !=  &ENOSYS) {  &if ( &errno ==  &EBADF  && ($flags &  &CAPH_IGNORE_EBADF) != 0) (0); (-1); }  &if ( &cap_ioctls_limit($fd,  &caph_stream_cmds,  &nitems( &caph_stream_cmds)) < 0 &&  &errno !=  &ENOSYS) (-1);  &if ( &cap_fcntls_limit($fd,  &caph_stream_fcntls) < 0 &&  &errno !=  &ENOSYS) (-1); (0); });
    }' unless defined(&caph_limit_stream);
    eval 'sub caph_limit_stdin {
        my($void) = @_;
	    eval q({ ( &caph_limit_stream( &STDIN_FILENO,  &CAPH_READ)); });
    }' unless defined(&caph_limit_stdin);
    eval 'sub caph_limit_stderr {
        my($void) = @_;
	    eval q({ ( &caph_limit_stream( &STDERR_FILENO,  &CAPH_WRITE)); });
    }' unless defined(&caph_limit_stderr);
    eval 'sub caph_limit_stdout {
        my($void) = @_;
	    eval q({ ( &caph_limit_stream( &STDOUT_FILENO,  &CAPH_WRITE)); });
    }' unless defined(&caph_limit_stdout);
    eval 'sub caph_limit_stdio {
        my($void) = @_;
	    eval q({  &const \'int\'  &iebadf =  &CAPH_IGNORE_EBADF;  &if ( &caph_limit_stream( &STDIN_FILENO,  &CAPH_READ |  &iebadf) == -1||  &caph_limit_stream( &STDOUT_FILENO,  &CAPH_WRITE |  &iebadf) == -1||  &caph_limit_stream( &STDERR_FILENO,  &CAPH_WRITE |  &iebadf) == -1) (-1); (0); });
    }' unless defined(&caph_limit_stdio);
    eval 'sub caph_cache_tzdata {
        my($void) = @_;
	    eval q({  &tzset(); });
    }' unless defined(&caph_cache_tzdata);
    eval 'sub caph_cache_catpages {
        my($void) = @_;
	    eval q({ ($void) &catopen(\\"libc\\",  &NL_CAT_LOCALE); });
    }' unless defined(&caph_cache_catpages);
    eval 'sub caph_enter {
        my($void) = @_;
	    eval q({  &if ( &cap_enter() < 0 &&  &errno !=  &ENOSYS) (-1); (0); });
    }' unless defined(&caph_enter);
    eval 'sub caph_rights_limit {
        my($fd,$rights) = @_;
	    eval q({  &if ( &cap_rights_limit($fd, $rights) < 0 &&  &errno !=  &ENOSYS) (-1); (0); });
    }' unless defined(&caph_rights_limit);
    eval 'sub caph_ioctls_limit {
        my($fd,$cmds,$ncmds) = @_;
	    eval q({  &if ( &cap_ioctls_limit($fd, $cmds, $ncmds) < 0 &&  &errno !=  &ENOSYS) (-1); (0); });
    }' unless defined(&caph_ioctls_limit);
    eval 'sub caph_fcntls_limit {
        my($fd,$fcntlrights) = @_;
	    eval q({  &if ( &cap_fcntls_limit($fd, $fcntlrights) < 0 &&  &errno !=  &ENOSYS) (-1); (0); });
    }' unless defined(&caph_fcntls_limit);
    eval 'sub caph_enter_casper {
        my($void) = @_;
	    eval q({ ( &CASPER_SUPPORT == 0? 0:  &caph_enter()); });
    }' unless defined(&caph_enter_casper);
}
1;

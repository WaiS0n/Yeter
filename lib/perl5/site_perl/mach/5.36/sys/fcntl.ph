require '_h2ph_pre.ph';

no warnings qw(redefine misc);

unless(defined(&_SYS_FCNTL_H_)) {
    eval 'sub _SYS_FCNTL_H_ () {1;}' unless defined(&_SYS_FCNTL_H_);
    require 'sys/cdefs.ph';
    require 'sys/_types.ph';
    unless(defined(&_MODE_T_DECLARED)) {
	eval 'sub _MODE_T_DECLARED () {1;}' unless defined(&_MODE_T_DECLARED);
    }
    unless(defined(&_OFF_T_DECLARED)) {
	eval 'sub _OFF_T_DECLARED () {1;}' unless defined(&_OFF_T_DECLARED);
    }
    unless(defined(&_PID_T_DECLARED)) {
	eval 'sub _PID_T_DECLARED () {1;}' unless defined(&_PID_T_DECLARED);
    }
    eval 'sub O_RDONLY () {0x;}' unless defined(&O_RDONLY);
    eval 'sub O_WRONLY () {0x1;}' unless defined(&O_WRONLY);
    eval 'sub O_RDWR () {0x2;}' unless defined(&O_RDWR);
    eval 'sub O_ACCMODE () {0x3;}' unless defined(&O_ACCMODE);
    if((defined(&__BSD_VISIBLE) ? &__BSD_VISIBLE : undef)) {
	eval 'sub FREAD () {0x1;}' unless defined(&FREAD);
	eval 'sub FWRITE () {0x2;}' unless defined(&FWRITE);
    }
    eval 'sub O_NONBLOCK () {0x4;}' unless defined(&O_NONBLOCK);
    eval 'sub O_APPEND () {0x8;}' unless defined(&O_APPEND);
    if((defined(&__BSD_VISIBLE) ? &__BSD_VISIBLE : undef)) {
	eval 'sub O_SHLOCK () {0x10;}' unless defined(&O_SHLOCK);
	eval 'sub O_EXLOCK () {0x20;}' unless defined(&O_EXLOCK);
	eval 'sub O_ASYNC () {0x40;}' unless defined(&O_ASYNC);
	eval 'sub O_FSYNC () {0x80;}' unless defined(&O_FSYNC);
    }
    eval 'sub O_SYNC () {0x80;}' unless defined(&O_SYNC);
    if((defined(&__POSIX_VISIBLE) ? &__POSIX_VISIBLE : undef) >= 200809) {
	eval 'sub O_NOFOLLOW () {0x100;}' unless defined(&O_NOFOLLOW);
    }
    eval 'sub O_CREAT () {0x200;}' unless defined(&O_CREAT);
    eval 'sub O_TRUNC () {0x400;}' unless defined(&O_TRUNC);
    eval 'sub O_EXCL () {0x800;}' unless defined(&O_EXCL);
    if(defined(&_KERNEL)) {
	eval 'sub FHASLOCK () {0x4000;}' unless defined(&FHASLOCK);
    }
    eval 'sub O_NOCTTY () {0x8000;}' unless defined(&O_NOCTTY);
    if((defined(&__BSD_VISIBLE) ? &__BSD_VISIBLE : undef)) {
	eval 'sub O_DIRECT () {0x10000;}' unless defined(&O_DIRECT);
    }
    if((defined(&__POSIX_VISIBLE) ? &__POSIX_VISIBLE : undef) >= 200809) {
	eval 'sub O_DIRECTORY () {0x20000;}' unless defined(&O_DIRECTORY);
	eval 'sub O_EXEC () {0x40000;}' unless defined(&O_EXEC);
	eval 'sub O_SEARCH () { &O_EXEC;}' unless defined(&O_SEARCH);
    }
    if(defined(&_KERNEL)) {
	eval 'sub FEXEC () { &O_EXEC;}' unless defined(&FEXEC);
	eval 'sub FSEARCH () { &O_SEARCH;}' unless defined(&FSEARCH);
    }
    if((defined(&__POSIX_VISIBLE) ? &__POSIX_VISIBLE : undef) >= 200809) {
	eval 'sub O_TTY_INIT () {0x80000;}' unless defined(&O_TTY_INIT);
	eval 'sub O_CLOEXEC () {0x100000;}' unless defined(&O_CLOEXEC);
    }
    if((defined(&__BSD_VISIBLE) ? &__BSD_VISIBLE : undef)) {
	eval 'sub O_VERIFY () {0x200000;}' unless defined(&O_VERIFY);
	eval 'sub O_PATH () {0x400000;}' unless defined(&O_PATH);
	eval 'sub O_RESOLVE_BENEATH () {0x800000;}' unless defined(&O_RESOLVE_BENEATH);
    }
    eval 'sub O_DSYNC () {0x1000000;}' unless defined(&O_DSYNC);
    if((defined(&__BSD_VISIBLE) ? &__BSD_VISIBLE : undef)) {
	eval 'sub O_EMPTY_PATH () {0x2000000;}' unless defined(&O_EMPTY_PATH);
    }
    if(defined(&_KERNEL)) {
	eval 'sub FLASTCLOSE () { &O_DIRECTORY;}' unless defined(&FLASTCLOSE);
	eval 'sub FREVOKE () { &O_VERIFY;}' unless defined(&FREVOKE);
	eval 'sub FOPENFAILED () { &O_TTY_INIT;}' unless defined(&FOPENFAILED);
	eval 'sub FKQALLOWED () { &O_RESOLVE_BENEATH;}' unless defined(&FKQALLOWED);
	eval 'sub FFLAGS {
	    my($oflags) = @_;
    	    eval q((($oflags) &  &O_EXEC ? ($oflags) : ($oflags) + 1));
	}' unless defined(&FFLAGS);
	eval 'sub OFLAGS {
	    my($fflags) = @_;
    	    eval q(((($fflags) & ( &O_EXEC |  &O_PATH)) != 0? ($fflags) : ($fflags) - 1));
	}' unless defined(&OFLAGS);
	eval 'sub FMASK () {( &FREAD| &FWRITE| &FAPPEND| &FASYNC| &FFSYNC| &FDSYNC| &FNONBLOCK|  &O_DIRECT| &FEXEC| &O_PATH);}' unless defined(&FMASK);
	eval 'sub FCNTLFLAGS () {( &FAPPEND| &FASYNC| &FFSYNC| &FDSYNC| &FNONBLOCK| &FRDAHEAD| &O_DIRECT);}' unless defined(&FCNTLFLAGS);
	if(defined(&COMPAT_FREEBSD7) || defined(&COMPAT_FREEBSD6) || defined(&COMPAT_FREEBSD5) || defined(&COMPAT_FREEBSD4)) {
	    eval 'sub FPOSIXSHM () { &O_NOFOLLOW;}' unless defined(&FPOSIXSHM);
	    undef(&FCNTLFLAGS) if defined(&FCNTLFLAGS);
	    eval 'sub FCNTLFLAGS () {( &FAPPEND| &FASYNC| &FFSYNC| &FNONBLOCK| &FPOSIXSHM| &FRDAHEAD|  &O_DIRECT);}' unless defined(&FCNTLFLAGS);
	}
    }
    if((defined(&__BSD_VISIBLE) ? &__BSD_VISIBLE : undef)) {
	eval 'sub FAPPEND () { &O_APPEND;}' unless defined(&FAPPEND);
	eval 'sub FASYNC () { &O_ASYNC;}' unless defined(&FASYNC);
	eval 'sub FFSYNC () { &O_FSYNC;}' unless defined(&FFSYNC);
	eval 'sub FDSYNC () { &O_DSYNC;}' unless defined(&FDSYNC);
	eval 'sub FNONBLOCK () { &O_NONBLOCK;}' unless defined(&FNONBLOCK);
	eval 'sub FNDELAY () { &O_NONBLOCK;}' unless defined(&FNDELAY);
	eval 'sub O_NDELAY () { &O_NONBLOCK;}' unless defined(&O_NDELAY);
    }
    if((defined(&__BSD_VISIBLE) ? &__BSD_VISIBLE : undef)) {
	eval 'sub FRDAHEAD () { &O_CREAT;}' unless defined(&FRDAHEAD);
    }
    if((defined(&__POSIX_VISIBLE) ? &__POSIX_VISIBLE : undef) >= 200809) {
	eval 'sub AT_FDCWD () {-100;}' unless defined(&AT_FDCWD);
	eval 'sub AT_EACCESS () {0x100;}' unless defined(&AT_EACCESS);
	eval 'sub AT_SYMLINK_NOFOLLOW () {0x200;}' unless defined(&AT_SYMLINK_NOFOLLOW);
	eval 'sub AT_SYMLINK_FOLLOW () {0x400;}' unless defined(&AT_SYMLINK_FOLLOW);
	eval 'sub AT_REMOVEDIR () {0x800;}' unless defined(&AT_REMOVEDIR);
    }
    if((defined(&__BSD_VISIBLE) ? &__BSD_VISIBLE : undef)) {
	eval 'sub AT_RESOLVE_BENEATH () {0x2000;}' unless defined(&AT_RESOLVE_BENEATH);
	eval 'sub AT_EMPTY_PATH () {0x4000;}' unless defined(&AT_EMPTY_PATH);
    }
    eval 'sub F_DUPFD () {0;}' unless defined(&F_DUPFD);
    eval 'sub F_GETFD () {1;}' unless defined(&F_GETFD);
    eval 'sub F_SETFD () {2;}' unless defined(&F_SETFD);
    eval 'sub F_GETFL () {3;}' unless defined(&F_GETFL);
    eval 'sub F_SETFL () {4;}' unless defined(&F_SETFL);
    if((defined(&__XSI_VISIBLE) ? &__XSI_VISIBLE : undef) || (defined(&__POSIX_VISIBLE) ? &__POSIX_VISIBLE : undef) >= 200112) {
	eval 'sub F_GETOWN () {5;}' unless defined(&F_GETOWN);
	eval 'sub F_SETOWN () {6;}' unless defined(&F_SETOWN);
    }
    if((defined(&__BSD_VISIBLE) ? &__BSD_VISIBLE : undef)) {
	eval 'sub F_OGETLK () {7;}' unless defined(&F_OGETLK);
	eval 'sub F_OSETLK () {8;}' unless defined(&F_OSETLK);
	eval 'sub F_OSETLKW () {9;}' unless defined(&F_OSETLKW);
	eval 'sub F_DUP2FD () {10;}' unless defined(&F_DUP2FD);
    }
    eval 'sub F_GETLK () {11;}' unless defined(&F_GETLK);
    eval 'sub F_SETLK () {12;}' unless defined(&F_SETLK);
    eval 'sub F_SETLKW () {13;}' unless defined(&F_SETLKW);
    if((defined(&__BSD_VISIBLE) ? &__BSD_VISIBLE : undef)) {
	eval 'sub F_SETLK_REMOTE () {14;}' unless defined(&F_SETLK_REMOTE);
	eval 'sub F_READAHEAD () {15;}' unless defined(&F_READAHEAD);
	eval 'sub F_RDAHEAD () {16;}' unless defined(&F_RDAHEAD);
    }
    if((defined(&__POSIX_VISIBLE) ? &__POSIX_VISIBLE : undef) >= 200809) {
	eval 'sub F_DUPFD_CLOEXEC () {17;}' unless defined(&F_DUPFD_CLOEXEC);
    }
    if((defined(&__BSD_VISIBLE) ? &__BSD_VISIBLE : undef)) {
	eval 'sub F_DUP2FD_CLOEXEC () {18;}' unless defined(&F_DUP2FD_CLOEXEC);
	eval 'sub F_ADD_SEALS () {19;}' unless defined(&F_ADD_SEALS);
	eval 'sub F_GET_SEALS () {20;}' unless defined(&F_GET_SEALS);
	eval 'sub F_ISUNIONSTACK () {21;}' unless defined(&F_ISUNIONSTACK);
	eval 'sub F_KINFO () {22;}' unless defined(&F_KINFO);
	eval 'sub F_SEAL_SEAL () {0x1;}' unless defined(&F_SEAL_SEAL);
	eval 'sub F_SEAL_SHRINK () {0x2;}' unless defined(&F_SEAL_SHRINK);
	eval 'sub F_SEAL_GROW () {0x4;}' unless defined(&F_SEAL_GROW);
	eval 'sub F_SEAL_WRITE () {0x8;}' unless defined(&F_SEAL_WRITE);
    }
    eval 'sub FD_CLOEXEC () {1;}' unless defined(&FD_CLOEXEC);
    eval 'sub F_RDLCK () {1;}' unless defined(&F_RDLCK);
    eval 'sub F_UNLCK () {2;}' unless defined(&F_UNLCK);
    eval 'sub F_WRLCK () {3;}' unless defined(&F_WRLCK);
    if((defined(&__BSD_VISIBLE) ? &__BSD_VISIBLE : undef)) {
	eval 'sub F_UNLCKSYS () {4;}' unless defined(&F_UNLCKSYS);
	eval 'sub F_CANCEL () {5;}' unless defined(&F_CANCEL);
    }
    if(defined(&_KERNEL)) {
	eval 'sub F_WAIT () {0x10;}' unless defined(&F_WAIT);
	eval 'sub F_FLOCK () {0x20;}' unless defined(&F_FLOCK);
	eval 'sub F_POSIX () {0x40;}' unless defined(&F_POSIX);
	eval 'sub F_REMOTE () {0x80;}' unless defined(&F_REMOTE);
	eval 'sub F_NOINTR () {0x100;}' unless defined(&F_NOINTR);
	eval 'sub F_FIRSTOPEN () {0x200;}' unless defined(&F_FIRSTOPEN);
    }
    if((defined(&__BSD_VISIBLE) ? &__BSD_VISIBLE : undef)) {
    }
    if((defined(&__BSD_VISIBLE) ? &__BSD_VISIBLE : undef)) {
	eval 'sub LOCK_SH () {0x1;}' unless defined(&LOCK_SH);
	eval 'sub LOCK_EX () {0x2;}' unless defined(&LOCK_EX);
	eval 'sub LOCK_NB () {0x4;}' unless defined(&LOCK_NB);
	eval 'sub LOCK_UN () {0x8;}' unless defined(&LOCK_UN);
    }
    if((defined(&__POSIX_VISIBLE) ? &__POSIX_VISIBLE : undef) >= 200112) {
	eval 'sub POSIX_FADV_NORMAL () {0;}' unless defined(&POSIX_FADV_NORMAL);
	eval 'sub POSIX_FADV_RANDOM () {1;}' unless defined(&POSIX_FADV_RANDOM);
	eval 'sub POSIX_FADV_SEQUENTIAL () {2;}' unless defined(&POSIX_FADV_SEQUENTIAL);
	eval 'sub POSIX_FADV_WILLNEED () {3;}' unless defined(&POSIX_FADV_WILLNEED);
	eval 'sub POSIX_FADV_DONTNEED () {4;}' unless defined(&POSIX_FADV_DONTNEED);
	eval 'sub POSIX_FADV_NOREUSE () {5;}' unless defined(&POSIX_FADV_NOREUSE);
    }
    if(defined(&__BSD_VISIBLE)) {
	eval 'sub FD_NONE () {-200;}' unless defined(&FD_NONE);
	eval 'sub SPACECTL_DEALLOC () {1;}' unless defined(&SPACECTL_DEALLOC);
	eval 'sub SPACECTL_F_SUPPORTED () {0;}' unless defined(&SPACECTL_F_SUPPORTED);
    }
    unless(defined(&_KERNEL)) {
	if((defined(&__BSD_VISIBLE) ? &__BSD_VISIBLE : undef)) {
	}
	if((defined(&__POSIX_VISIBLE) ? &__POSIX_VISIBLE : undef) >= 200809) {
	}
	if((defined(&__POSIX_VISIBLE) ? &__POSIX_VISIBLE : undef) >= 200112) {
	}
    }
}
1;

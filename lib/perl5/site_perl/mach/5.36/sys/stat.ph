require '_h2ph_pre.ph';

no warnings qw(redefine misc);

unless(defined(&_SYS_STAT_H_)) {
    eval 'sub _SYS_STAT_H_ () {1;}' unless defined(&_SYS_STAT_H_);
    require 'sys/cdefs.ph';
    require 'sys/_timespec.ph';
    require 'sys/_types.ph';
    unless(defined(&_BLKSIZE_T_DECLARED)) {
	eval 'sub _BLKSIZE_T_DECLARED () {1;}' unless defined(&_BLKSIZE_T_DECLARED);
    }
    unless(defined(&_BLKCNT_T_DECLARED)) {
	eval 'sub _BLKCNT_T_DECLARED () {1;}' unless defined(&_BLKCNT_T_DECLARED);
    }
    unless(defined(&_DEV_T_DECLARED)) {
	eval 'sub _DEV_T_DECLARED () {1;}' unless defined(&_DEV_T_DECLARED);
    }
    unless(defined(&_FFLAGS_T_DECLARED)) {
	eval 'sub _FFLAGS_T_DECLARED () {1;}' unless defined(&_FFLAGS_T_DECLARED);
    }
    unless(defined(&_GID_T_DECLARED)) {
	eval 'sub _GID_T_DECLARED () {1;}' unless defined(&_GID_T_DECLARED);
    }
    unless(defined(&_INO_T_DECLARED)) {
	eval 'sub _INO_T_DECLARED () {1;}' unless defined(&_INO_T_DECLARED);
    }
    unless(defined(&_MODE_T_DECLARED)) {
	eval 'sub _MODE_T_DECLARED () {1;}' unless defined(&_MODE_T_DECLARED);
    }
    unless(defined(&_NLINK_T_DECLARED)) {
	eval 'sub _NLINK_T_DECLARED () {1;}' unless defined(&_NLINK_T_DECLARED);
    }
    unless(defined(&_OFF_T_DECLARED)) {
	eval 'sub _OFF_T_DECLARED () {1;}' unless defined(&_OFF_T_DECLARED);
    }
    unless(defined(&_UID_T_DECLARED)) {
	eval 'sub _UID_T_DECLARED () {1;}' unless defined(&_UID_T_DECLARED);
    }
    if(!defined(&_KERNEL)  && (defined(&__BSD_VISIBLE) ? &__BSD_VISIBLE : undef)) {
	require 'sys/time.ph';
    }
    if(defined(&_KERNEL)) {
    }
    if(defined(&_WANT_FREEBSD11_STAT) || defined(&_KERNEL)) {
    }
    if(defined(&__i386__)) {
	eval 'sub __STAT_TIME_T_EXT () {1;}' unless defined(&__STAT_TIME_T_EXT);
    }
    if(defined(&__STAT_TIME_T_EXT)) {
    }
    if(defined(&__STAT_TIME_T_EXT)) {
    }
    if(defined(&__STAT_TIME_T_EXT)) {
    }
    if(defined(&__STAT_TIME_T_EXT)) {
    }
    if(defined(&_KERNEL)) {
    }
    unless(defined(&_KERNEL)) {
	eval 'sub st_atime () { ($st_atim->{tv_sec});}' unless defined(&st_atime);
	eval 'sub st_mtime () { ($st_mtim->{tv_sec});}' unless defined(&st_mtime);
	eval 'sub st_ctime () { ($st_ctim->{tv_sec});}' unless defined(&st_ctime);
	if((defined(&__BSD_VISIBLE) ? &__BSD_VISIBLE : undef)) {
	    eval 'sub st_birthtime () { ($st_birthtim->{tv_sec});}' unless defined(&st_birthtime);
	    eval 'sub st_atimensec () { ($st_atim->{tv_nsec});}' unless defined(&st_atimensec);
	    eval 'sub st_mtimensec () { ($st_mtim->{tv_nsec});}' unless defined(&st_mtimensec);
	    eval 'sub st_ctimensec () { ($st_ctim->{tv_nsec});}' unless defined(&st_ctimensec);
	    eval 'sub st_birthtimensec () { ($st_birthtim->{tv_nsec});}' unless defined(&st_birthtimensec);
	}
	if((defined(&__BSD_VISIBLE) ? &__BSD_VISIBLE : undef)) {
	    eval 'sub st_atimespec () { &st_atim;}' unless defined(&st_atimespec);
	    eval 'sub st_mtimespec () { &st_mtim;}' unless defined(&st_mtimespec);
	    eval 'sub st_ctimespec () { &st_ctim;}' unless defined(&st_ctimespec);
	    eval 'sub st_birthtimespec () { &st_birthtim;}' unless defined(&st_birthtimespec);
	}
    }
    eval 'sub S_ISUID () {0004000;}' unless defined(&S_ISUID);
    eval 'sub S_ISGID () {0002000;}' unless defined(&S_ISGID);
    if((defined(&__BSD_VISIBLE) ? &__BSD_VISIBLE : undef)) {
	eval 'sub S_ISTXT () {0001000;}' unless defined(&S_ISTXT);
    }
    eval 'sub S_IRWXU () {0000700;}' unless defined(&S_IRWXU);
    eval 'sub S_IRUSR () {0000400;}' unless defined(&S_IRUSR);
    eval 'sub S_IWUSR () {0000200;}' unless defined(&S_IWUSR);
    eval 'sub S_IXUSR () {0000100;}' unless defined(&S_IXUSR);
    if((defined(&__BSD_VISIBLE) ? &__BSD_VISIBLE : undef)) {
	eval 'sub S_IREAD () { &S_IRUSR;}' unless defined(&S_IREAD);
	eval 'sub S_IWRITE () { &S_IWUSR;}' unless defined(&S_IWRITE);
	eval 'sub S_IEXEC () { &S_IXUSR;}' unless defined(&S_IEXEC);
    }
    eval 'sub S_IRWXG () {0000070;}' unless defined(&S_IRWXG);
    eval 'sub S_IRGRP () {0000040;}' unless defined(&S_IRGRP);
    eval 'sub S_IWGRP () {0000020;}' unless defined(&S_IWGRP);
    eval 'sub S_IXGRP () {0000010;}' unless defined(&S_IXGRP);
    eval 'sub S_IRWXO () {0000007;}' unless defined(&S_IRWXO);
    eval 'sub S_IROTH () {0000004;}' unless defined(&S_IROTH);
    eval 'sub S_IWOTH () {0000002;}' unless defined(&S_IWOTH);
    eval 'sub S_IXOTH () {0000001;}' unless defined(&S_IXOTH);
    if((defined(&__XSI_VISIBLE) ? &__XSI_VISIBLE : undef)) {
	eval 'sub S_IFMT () {0170000;}' unless defined(&S_IFMT);
	eval 'sub S_IFIFO () {0010000;}' unless defined(&S_IFIFO);
	eval 'sub S_IFCHR () {0020000;}' unless defined(&S_IFCHR);
	eval 'sub S_IFDIR () {0040000;}' unless defined(&S_IFDIR);
	eval 'sub S_IFBLK () {0060000;}' unless defined(&S_IFBLK);
	eval 'sub S_IFREG () {0100000;}' unless defined(&S_IFREG);
	eval 'sub S_IFLNK () {0120000;}' unless defined(&S_IFLNK);
	eval 'sub S_IFSOCK () {0140000;}' unless defined(&S_IFSOCK);
	eval 'sub S_ISVTX () {0001000;}' unless defined(&S_ISVTX);
    }
    if((defined(&__BSD_VISIBLE) ? &__BSD_VISIBLE : undef)) {
	eval 'sub S_IFWHT () {0160000;}' unless defined(&S_IFWHT);
    }
    eval 'sub S_ISDIR {
        my($m) = @_;
	    eval q(((($m) & 0170000) == 0040000));
    }' unless defined(&S_ISDIR);
    eval 'sub S_ISCHR {
        my($m) = @_;
	    eval q(((($m) & 0170000) == 0020000));
    }' unless defined(&S_ISCHR);
    eval 'sub S_ISBLK {
        my($m) = @_;
	    eval q(((($m) & 0170000) == 0060000));
    }' unless defined(&S_ISBLK);
    eval 'sub S_ISREG {
        my($m) = @_;
	    eval q(((($m) & 0170000) == 0100000));
    }' unless defined(&S_ISREG);
    eval 'sub S_ISFIFO {
        my($m) = @_;
	    eval q(((($m) & 0170000) == 0010000));
    }' unless defined(&S_ISFIFO);
    if((defined(&__POSIX_VISIBLE) ? &__POSIX_VISIBLE : undef) >= 200112) {
	eval 'sub S_ISLNK {
	    my($m) = @_;
    	    eval q(((($m) & 0170000) == 0120000));
	}' unless defined(&S_ISLNK);
	eval 'sub S_ISSOCK {
	    my($m) = @_;
    	    eval q(((($m) & 0170000) == 0140000));
	}' unless defined(&S_ISSOCK);
    }
    if((defined(&__BSD_VISIBLE) ? &__BSD_VISIBLE : undef)) {
	eval 'sub S_ISWHT {
	    my($m) = @_;
    	    eval q(((($m) & 0170000) == 0160000));
	}' unless defined(&S_ISWHT);
    }
    if((defined(&__BSD_VISIBLE) ? &__BSD_VISIBLE : undef)) {
	eval 'sub ACCESSPERMS () {( &S_IRWXU| &S_IRWXG| &S_IRWXO);}' unless defined(&ACCESSPERMS);
	eval 'sub ALLPERMS () {( &S_ISUID| &S_ISGID| &S_ISTXT| &S_IRWXU| &S_IRWXG| &S_IRWXO);}' unless defined(&ALLPERMS);
	eval 'sub DEFFILEMODE () {( &S_IRUSR| &S_IWUSR| &S_IRGRP| &S_IWGRP| &S_IROTH| &S_IWOTH);}' unless defined(&DEFFILEMODE);
	eval 'sub S_BLKSIZE () {512;}' unless defined(&S_BLKSIZE);
	eval 'sub UF_SETTABLE () {0xffff;}' unless defined(&UF_SETTABLE);
	eval 'sub UF_NODUMP () {0x1;}' unless defined(&UF_NODUMP);
	eval 'sub UF_IMMUTABLE () {0x2;}' unless defined(&UF_IMMUTABLE);
	eval 'sub UF_APPEND () {0x4;}' unless defined(&UF_APPEND);
	eval 'sub UF_OPAQUE () {0x8;}' unless defined(&UF_OPAQUE);
	eval 'sub UF_NOUNLINK () {0x10;}' unless defined(&UF_NOUNLINK);
	if(0) {
	    eval 'sub UF_COMPRESSED () {0x20;}' unless defined(&UF_COMPRESSED);
	    eval 'sub UF_TRACKED () {0x40;}' unless defined(&UF_TRACKED);
	}
	eval 'sub UF_SYSTEM () {0x80;}' unless defined(&UF_SYSTEM);
	eval 'sub UF_SPARSE () {0x100;}' unless defined(&UF_SPARSE);
	eval 'sub UF_OFFLINE () {0x200;}' unless defined(&UF_OFFLINE);
	eval 'sub UF_REPARSE () {0x400;}' unless defined(&UF_REPARSE);
	eval 'sub UF_ARCHIVE () {0x800;}' unless defined(&UF_ARCHIVE);
	eval 'sub UF_READONLY () {0x1000;}' unless defined(&UF_READONLY);
	eval 'sub UF_HIDDEN () {0x8000;}' unless defined(&UF_HIDDEN);
	eval 'sub SF_SETTABLE () {0xffff0000;}' unless defined(&SF_SETTABLE);
	eval 'sub SF_ARCHIVED () {0x10000;}' unless defined(&SF_ARCHIVED);
	eval 'sub SF_IMMUTABLE () {0x20000;}' unless defined(&SF_IMMUTABLE);
	eval 'sub SF_APPEND () {0x40000;}' unless defined(&SF_APPEND);
	eval 'sub SF_NOUNLINK () {0x100000;}' unless defined(&SF_NOUNLINK);
	eval 'sub SF_SNAPSHOT () {0x200000;}' unless defined(&SF_SNAPSHOT);
	if(defined(&_KERNEL)) {
	    eval 'sub OPAQUE () {( &UF_OPAQUE);}' unless defined(&OPAQUE);
	    eval 'sub APPEND () {( &UF_APPEND |  &SF_APPEND);}' unless defined(&APPEND);
	    eval 'sub IMMUTABLE () {( &UF_IMMUTABLE |  &SF_IMMUTABLE);}' unless defined(&IMMUTABLE);
	    eval 'sub NOUNLINK () {( &UF_NOUNLINK |  &SF_NOUNLINK);}' unless defined(&NOUNLINK);
	}
    }
    if((defined(&__POSIX_VISIBLE) ? &__POSIX_VISIBLE : undef) >= 200809) {
	eval 'sub UTIME_NOW () {-1;}' unless defined(&UTIME_NOW);
	eval 'sub UTIME_OMIT () {-2;}' unless defined(&UTIME_OMIT);
    }
    unless(defined(&_KERNEL)) {
	if((defined(&__BSD_VISIBLE) ? &__BSD_VISIBLE : undef)) {
	}
	if((defined(&__BSD_VISIBLE) ? &__BSD_VISIBLE : undef)) {
	}
	if((defined(&__POSIX_VISIBLE) ? &__POSIX_VISIBLE : undef) >= 200112) {
	}
	if((defined(&__POSIX_VISIBLE) ? &__POSIX_VISIBLE : undef) >= 200809) {
	}
	if((defined(&__BSD_VISIBLE) ? &__BSD_VISIBLE : undef)) {
	}
	if((defined(&__POSIX_VISIBLE) ? &__POSIX_VISIBLE : undef) >= 200112) {
	}
	if(!defined(&_MKNOD_DECLARED)  && (defined(&__XSI_VISIBLE) ? &__XSI_VISIBLE : undef)) {
	    eval 'sub _MKNOD_DECLARED () {1;}' unless defined(&_MKNOD_DECLARED);
	}
	if((defined(&__POSIX_VISIBLE) ? &__POSIX_VISIBLE : undef) >= 200809) {
	}
	if((defined(&__XSI_VISIBLE) ? &__XSI_VISIBLE : undef) >= 700) {
	}
    }
}
1;

require '_h2ph_pre.ph';

no warnings qw(redefine misc);

unless(defined(&_DIRENT_H_)) {
    eval 'sub _DIRENT_H_ () {1;}' unless defined(&_DIRENT_H_);
    require 'sys/cdefs.ph';
    require 'sys/_types.ph';
    require 'sys/dirent.ph';
    if((defined(&__BSD_VISIBLE) ? &__BSD_VISIBLE : undef)) {
	unless(defined(&_SIZE_T_DECLARED)) {
	    eval 'sub _SIZE_T_DECLARED () {1;}' unless defined(&_SIZE_T_DECLARED);
	}
	unless(defined(&_SSIZE_T_DECLARED)) {
	    eval 'sub _SSIZE_T_DECLARED () {1;}' unless defined(&_SSIZE_T_DECLARED);
	}
	unless(defined(&_OFF_T_DECLARED)) {
	    eval 'sub _OFF_T_DECLARED () {1;}' unless defined(&_OFF_T_DECLARED);
	}
    }
    if((defined(&__XSI_VISIBLE) ? &__XSI_VISIBLE : undef)) {
	unless(defined(&_INO_T_DECLARED)) {
	    eval 'sub _INO_T_DECLARED () {1;}' unless defined(&_INO_T_DECLARED);
	}
	eval 'sub d_ino () { &d_fileno;}' unless defined(&d_ino);
    }
    if((defined(&__BSD_VISIBLE) ? &__BSD_VISIBLE : undef)) {
	require 'sys/_null.ph';
	eval 'sub DIRBLKSIZ () {1024;}' unless defined(&DIRBLKSIZ);
	eval 'sub DTF_HIDEW () {0x1;}' unless defined(&DTF_HIDEW);
	eval 'sub DTF_NODUP () {0x2;}' unless defined(&DTF_NODUP);
	eval 'sub DTF_REWIND () {0x4;}' unless defined(&DTF_REWIND);
	eval 'sub __DTF_READALL () {0x8;}' unless defined(&__DTF_READALL);
	eval 'sub __DTF_SKIPREAD () {0x10;}' unless defined(&__DTF_SKIPREAD);
    } else {
    }
    unless(defined(&_KERNEL)) {
	if((defined(&__POSIX_VISIBLE) ? &__POSIX_VISIBLE : undef) >= 200809|| (defined(&__XSI_VISIBLE) ? &__XSI_VISIBLE : undef) >= 700) {
	}
	if((defined(&__BSD_VISIBLE) ? &__BSD_VISIBLE : undef)) {
	}
	if((defined(&__POSIX_VISIBLE) ? &__POSIX_VISIBLE : undef) >= 199506|| (defined(&__XSI_VISIBLE) ? &__XSI_VISIBLE : undef) >= 500) {
	}
	if((defined(&__POSIX_VISIBLE) ? &__POSIX_VISIBLE : undef) >= 200809|| (defined(&__XSI_VISIBLE) ? &__XSI_VISIBLE : undef) >= 700) {
	    if(defined(&__BLOCKS__)) {
	    }
	}
	if((defined(&__BSD_VISIBLE) ? &__BSD_VISIBLE : undef)) {
	}
	if((defined(&__XSI_VISIBLE) ? &__XSI_VISIBLE : undef)) {
	}
    }
}
1;

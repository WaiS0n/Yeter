require '_h2ph_pre.ph';

no warnings qw(redefine misc);

unless(defined(&_STRING_H_)) {
    eval 'sub _STRING_H_ () {1;}' unless defined(&_STRING_H_);
    require 'sys/cdefs.ph';
    require 'sys/_null.ph';
    require 'sys/_types.ph';
    if((defined(&__BSD_VISIBLE) ? &__BSD_VISIBLE : undef)) {
	require 'strings.ph';
    }
    unless(defined(&_SIZE_T_DECLARED)) {
	eval 'sub _SIZE_T_DECLARED () {1;}' unless defined(&_SIZE_T_DECLARED);
    }
    if((defined(&__XSI_VISIBLE) ? &__XSI_VISIBLE : undef) >= 600) {
    }
    if((defined(&__BSD_VISIBLE) ? &__BSD_VISIBLE : undef)) {
    }
    if((defined(&__BSD_VISIBLE) ? &__BSD_VISIBLE : undef)) {
    }
    if((defined(&__BSD_VISIBLE) ? &__BSD_VISIBLE : undef)) {
    }
    if((defined(&__POSIX_VISIBLE) ? &__POSIX_VISIBLE : undef) >= 200809) {
    }
    if((defined(&__BSD_VISIBLE) ? &__BSD_VISIBLE : undef)) {
    }
    if((defined(&__BSD_VISIBLE) ? &__BSD_VISIBLE : undef)) {
    }
    if((defined(&__POSIX_VISIBLE) ? &__POSIX_VISIBLE : undef) >= 200112|| (defined(&__XSI_VISIBLE) ? &__XSI_VISIBLE : undef)) {
    }
    if((defined(&__POSIX_VISIBLE) ? &__POSIX_VISIBLE : undef) >= 200112) {
    }
    if((defined(&__BSD_VISIBLE) ? &__BSD_VISIBLE : undef)) {
    }
    if((defined(&__BSD_VISIBLE) ? &__BSD_VISIBLE : undef)) {
	unless(defined(&_MODE_T_DECLARED)) {
	    eval 'sub _MODE_T_DECLARED () {1;}' unless defined(&_MODE_T_DECLARED);
	}
    }
    if((defined(&__POSIX_VISIBLE) ? &__POSIX_VISIBLE : undef) >= 200809) {
    }
    if((defined(&__BSD_VISIBLE) ? &__BSD_VISIBLE : undef)) {
    }
    if((defined(&__BSD_VISIBLE) ? &__BSD_VISIBLE : undef)) {
    }
    if((defined(&__POSIX_VISIBLE) ? &__POSIX_VISIBLE : undef) >= 200809) {
    }
    if((defined(&__POSIX_VISIBLE) ? &__POSIX_VISIBLE : undef) >= 199506|| (defined(&__XSI_VISIBLE) ? &__XSI_VISIBLE : undef) >= 500) {
    }
    if((defined(&__BSD_VISIBLE) ? &__BSD_VISIBLE : undef)) {
	unless(defined(&_SWAB_DECLARED)) {
	    eval 'sub _SWAB_DECLARED () {1;}' unless defined(&_SWAB_DECLARED);
	    unless(defined(&_SSIZE_T_DECLARED)) {
		eval 'sub _SSIZE_T_DECLARED () {1;}' unless defined(&_SSIZE_T_DECLARED);
	    }
	}
    }
    if((defined(&__POSIX_VISIBLE) ? &__POSIX_VISIBLE : undef) >= 200112|| defined(&_XLOCALE_H_)) {
	require 'xlocale/_string.ph';
    }
    if((defined(&__EXT1_VISIBLE) ? &__EXT1_VISIBLE : undef)) {
	unless(defined(&_RSIZE_T_DEFINED)) {
	    eval 'sub _RSIZE_T_DEFINED () {1;}' unless defined(&_RSIZE_T_DEFINED);
	}
	unless(defined(&_ERRNO_T_DEFINED)) {
	    eval 'sub _ERRNO_T_DEFINED () {1;}' unless defined(&_ERRNO_T_DEFINED);
	}
    }
}
1;

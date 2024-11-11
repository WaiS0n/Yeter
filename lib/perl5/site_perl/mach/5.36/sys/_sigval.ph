require '_h2ph_pre.ph';

no warnings qw(redefine misc);

unless(defined(&__SYS__SIGVAL_H)) {
    eval 'sub __SYS__SIGVAL_H () {1;}' unless defined(&__SYS__SIGVAL_H);
    if((defined(&__POSIX_VISIBLE) ? &__POSIX_VISIBLE : undef) >= 199309|| (defined(&__XSI_VISIBLE) ? &__XSI_VISIBLE : undef) >= 500) {
	if(defined(&_WANT_LWPINFO32) || (defined(&_KERNEL)  && defined(&__LP64__))) {
	}
    }
}
1;

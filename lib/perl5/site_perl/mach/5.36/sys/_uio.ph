require '_h2ph_pre.ph';

no warnings qw(redefine misc);

unless(defined(&_SYS__UIO_H_)) {
    eval 'sub _SYS__UIO_H_ () {1;}' unless defined(&_SYS__UIO_H_);
    if((defined(&__BSD_VISIBLE) ? &__BSD_VISIBLE : undef)) {
	eval("sub UIO_READ () { 0; }") unless defined(&UIO_READ);
	eval("sub UIO_WRITE () { 1; }") unless defined(&UIO_WRITE);
	eval("sub UIO_USERSPACE () { 0; }") unless defined(&UIO_USERSPACE);
	eval("sub UIO_SYSSPACE () { 1; }") unless defined(&UIO_SYSSPACE);
	eval("sub UIO_NOCOPY () { 2; }") unless defined(&UIO_NOCOPY);
    }
}
1;

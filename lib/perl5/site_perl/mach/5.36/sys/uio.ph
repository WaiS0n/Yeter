require '_h2ph_pre.ph';

no warnings qw(redefine misc);

unless(defined(&_SYS_UIO_H_)) {
    eval 'sub _SYS_UIO_H_ () {1;}' unless defined(&_SYS_UIO_H_);
    require 'sys/cdefs.ph';
    require 'sys/_types.ph';
    require 'sys/_iovec.ph';
    require 'sys/_uio.ph';
    unless(defined(&_SSIZE_T_DECLARED)) {
	eval 'sub _SSIZE_T_DECLARED () {1;}' unless defined(&_SSIZE_T_DECLARED);
    }
    unless(defined(&_OFF_T_DECLARED)) {
	eval 'sub _OFF_T_DECLARED () {1;}' unless defined(&_OFF_T_DECLARED);
    }
    if(defined(&_KERNEL)) {
	eval 'sub UIO_MAXIOV () {1024;}' unless defined(&UIO_MAXIOV);
    } else {
	if((defined(&__BSD_VISIBLE) ? &__BSD_VISIBLE : undef)) {
	}
    }
}
1;

require '_h2ph_pre.ph';

no warnings qw(redefine misc);

unless(defined(&_MONETARY_H_)) {
    eval 'sub _MONETARY_H_ () {1;}' unless defined(&_MONETARY_H_);
    require 'sys/cdefs.ph';
    require 'sys/_types.ph';
    unless(defined(&_SIZE_T_DECLARED)) {
	eval 'sub _SIZE_T_DECLARED () {1;}' unless defined(&_SIZE_T_DECLARED);
    }
    unless(defined(&_SSIZE_T_DECLARED)) {
	eval 'sub _SSIZE_T_DECLARED () {1;}' unless defined(&_SSIZE_T_DECLARED);
    }
    if((defined(&__POSIX_VISIBLE) ? &__POSIX_VISIBLE : undef) >= 200809|| defined(&_XLOCALE_H_)) {
	require 'xlocale/_monetary.ph';
    }
}
1;

require '_h2ph_pre.ph';

no warnings qw(redefine misc);

unless(defined(&_SYS__IOVEC_H_)) {
    eval 'sub _SYS__IOVEC_H_ () {1;}' unless defined(&_SYS__IOVEC_H_);
    require 'sys/_types.ph';
    unless(defined(&_SIZE_T_DECLARED)) {
	eval 'sub _SIZE_T_DECLARED () {1;}' unless defined(&_SIZE_T_DECLARED);
    }
}
1;

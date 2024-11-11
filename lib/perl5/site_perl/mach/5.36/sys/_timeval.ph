require '_h2ph_pre.ph';

no warnings qw(redefine misc);

unless(defined(&_SYS__TIMEVAL_H_)) {
    eval 'sub _SYS__TIMEVAL_H_ () {1;}' unless defined(&_SYS__TIMEVAL_H_);
    require 'sys/_types.ph';
    unless(defined(&_SUSECONDS_T_DECLARED)) {
	eval 'sub _SUSECONDS_T_DECLARED () {1;}' unless defined(&_SUSECONDS_T_DECLARED);
    }
    unless(defined(&_TIME_T_DECLARED)) {
	eval 'sub _TIME_T_DECLARED () {1;}' unless defined(&_TIME_T_DECLARED);
    }
}
1;

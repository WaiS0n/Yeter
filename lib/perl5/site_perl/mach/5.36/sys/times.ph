require '_h2ph_pre.ph';

no warnings qw(redefine misc);

unless(defined(&_SYS_TIMES_H_)) {
    eval 'sub _SYS_TIMES_H_ () {1;}' unless defined(&_SYS_TIMES_H_);
    require 'sys/_types.ph';
    unless(defined(&_CLOCK_T_DECLARED)) {
	eval 'sub _CLOCK_T_DECLARED () {1;}' unless defined(&_CLOCK_T_DECLARED);
    }
    unless(defined(&_KERNEL)) {
	require 'sys/cdefs.ph';
    }
}
1;

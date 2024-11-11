require '_h2ph_pre.ph';

no warnings qw(redefine misc);

unless(defined(&_UTIME_H_)) {
    eval 'sub _UTIME_H_ () {1;}' unless defined(&_UTIME_H_);
    require 'sys/cdefs.ph';
    require 'sys/_types.ph';
    unless(defined(&_TIME_T_DECLARED)) {
	eval 'sub _TIME_T_DECLARED () {1;}' unless defined(&_TIME_T_DECLARED);
    }
}
1;

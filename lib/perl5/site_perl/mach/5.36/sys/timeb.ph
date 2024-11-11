require '_h2ph_pre.ph';

no warnings qw(redefine misc);

unless(defined(&_SYS_TIMEB_H_)) {
    eval 'sub _SYS_TIMEB_H_ () {1;}' unless defined(&_SYS_TIMEB_H_);
    if(defined(&__GNUC__)) {
	warn("\"this\ file\ includes\ \<sys\/timeb\.h\>\ which\ is\ deprecated\"");
    }
    require 'sys/_types.ph';
    unless(defined(&_TIME_T_DECLARED)) {
	eval 'sub _TIME_T_DECLARED () {1;}' unless defined(&_TIME_T_DECLARED);
    }
    unless(defined(&_KERNEL)) {
	require 'sys/cdefs.ph';
    }
}
1;

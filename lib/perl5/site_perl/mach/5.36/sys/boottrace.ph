require '_h2ph_pre.ph';

no warnings qw(redefine misc);

unless(defined(&_SYS_BOOTTRACE_H_)) {
    eval 'sub _SYS_BOOTTRACE_H_ () {1;}' unless defined(&_SYS_BOOTTRACE_H_);
    eval 'sub _BOOTTRACE_BOOTTRACE () {"kern.boottrace.boottrace";}' unless defined(&_BOOTTRACE_BOOTTRACE);
    eval 'sub _BOOTTRACE_RUNTRACE () {"kern.boottrace.runtrace";}' unless defined(&_BOOTTRACE_RUNTRACE);
    eval 'sub _BOOTTRACE_SHUTTRACE () {"kern.boottrace.shuttrace";}' unless defined(&_BOOTTRACE_SHUTTRACE);
    eval 'sub BT_EVENT_TDNAMELEN () {24;}' unless defined(&BT_EVENT_TDNAMELEN);
    eval 'sub BT_EVENT_NAMELEN () {40;}' unless defined(&BT_EVENT_NAMELEN);
    eval 'sub BT_MSGLEN () {( &BT_EVENT_NAMELEN + 1+  &BT_EVENT_TDNAMELEN);}' unless defined(&BT_MSGLEN);
    unless(defined(&_KERNEL)) {
	require 'stdarg.ph';
	require 'stdio.ph';
	require 'string.ph';
	require 'sys/sysctl.ph';
	eval 'sub BOOTTRACE () {(...)  &_boottrace( &_BOOTTRACE_BOOTTRACE,  &__VA_ARGS__);}' unless defined(&BOOTTRACE);
	eval 'sub RUNTRACE () {(...)  &_boottrace( &_BOOTTRACE_RUNTRACE,  &__VA_ARGS__);}' unless defined(&RUNTRACE);
	eval 'sub SHUTTRACE () {(...)  &_boottrace( &_BOOTTRACE_SHUTTRACE,  &__VA_ARGS__);}' unless defined(&SHUTTRACE);
    } else {
	eval 'sub _BOOTTRACE () {( &tdname, ...)  &do {  &if ( &boottrace_enabled) ( &void) &boottrace( &tdname,  &__VA_ARGS__); }  &while (0);}' unless defined(&_BOOTTRACE);
	eval 'sub BOOTTRACE () {(...)  &_BOOTTRACE( &NULL,  &__VA_ARGS__);}' unless defined(&BOOTTRACE);
	eval 'sub BOOTTRACE_INIT () {(...)  &_BOOTTRACE("kernel",  &__VA_ARGS__);}' unless defined(&BOOTTRACE_INIT);
    }
}
1;

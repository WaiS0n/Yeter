require '_h2ph_pre.ph';

no warnings qw(redefine misc);

unless(defined(&_SPAWN_H_)) {
    eval 'sub _SPAWN_H_ () {1;}' unless defined(&_SPAWN_H_);
    require 'sys/cdefs.ph';
    require 'sys/_types.ph';
    require 'sys/_sigset.ph';
    unless(defined(&_MODE_T_DECLARED)) {
	eval 'sub _MODE_T_DECLARED () {1;}' unless defined(&_MODE_T_DECLARED);
    }
    unless(defined(&_PID_T_DECLARED)) {
	eval 'sub _PID_T_DECLARED () {1;}' unless defined(&_PID_T_DECLARED);
    }
    unless(defined(&_SIGSET_T_DECLARED)) {
	eval 'sub _SIGSET_T_DECLARED () {1;}' unless defined(&_SIGSET_T_DECLARED);
    }
    eval 'sub POSIX_SPAWN_RESETIDS () {0x1;}' unless defined(&POSIX_SPAWN_RESETIDS);
    eval 'sub POSIX_SPAWN_SETPGROUP () {0x2;}' unless defined(&POSIX_SPAWN_SETPGROUP);
    eval 'sub POSIX_SPAWN_SETSCHEDPARAM () {0x4;}' unless defined(&POSIX_SPAWN_SETSCHEDPARAM);
    eval 'sub POSIX_SPAWN_SETSCHEDULER () {0x8;}' unless defined(&POSIX_SPAWN_SETSCHEDULER);
    eval 'sub POSIX_SPAWN_SETSIGDEF () {0x10;}' unless defined(&POSIX_SPAWN_SETSIGDEF);
    eval 'sub POSIX_SPAWN_SETSIGMASK () {0x20;}' unless defined(&POSIX_SPAWN_SETSIGMASK);
    eval 'sub POSIX_SPAWN_DISABLE_ASLR_NP () {0x40;}' unless defined(&POSIX_SPAWN_DISABLE_ASLR_NP);
    if((defined(&__BSD_VISIBLE) ? &__BSD_VISIBLE : undef)) {
    }
}
1;

require '_h2ph_pre.ph';

no warnings qw(redefine misc);

unless(defined(&_SYS_MSG_H_)) {
    eval 'sub _SYS_MSG_H_ () {1;}' unless defined(&_SYS_MSG_H_);
    require 'sys/cdefs.ph';
    require 'sys/_types.ph';
    if(defined(&_WANT_SYSVMSG_INTERNALS)) {
	eval 'sub _WANT_SYSVIPC_INTERNALS () {1;}' unless defined(&_WANT_SYSVIPC_INTERNALS);
    }
    require 'sys/ipc.ph';
    eval 'sub MSG_NOERROR () {010000;}' unless defined(&MSG_NOERROR);
    unless(defined(&_PID_T_DECLARED)) {
	eval 'sub _PID_T_DECLARED () {1;}' unless defined(&_PID_T_DECLARED);
    }
    unless(defined(&_SIZE_T_DECLARED)) {
	eval 'sub _SIZE_T_DECLARED () {1;}' unless defined(&_SIZE_T_DECLARED);
    }
    unless(defined(&_SSIZE_T_DECLARED)) {
	eval 'sub _SSIZE_T_DECLARED () {1;}' unless defined(&_SSIZE_T_DECLARED);
    }
    unless(defined(&_TIME_T_DECLARED)) {
	eval 'sub _TIME_T_DECLARED () {1;}' unless defined(&_TIME_T_DECLARED);
    }
    if(defined(&COMPAT_FREEBSD4) || defined(&COMPAT_FREEBSD5) || defined(&COMPAT_FREEBSD6) || defined(&COMPAT_FREEBSD7)) {
    }
    if(defined(&_KERNEL)) {
    }
    if(defined(&_KERNEL) || defined(&_WANT_SYSVMSG_INTERNALS)) {
    }
    if(defined(&_KERNEL)) {
    } else {
	if((defined(&__BSD_VISIBLE) ? &__BSD_VISIBLE : undef)) {
	}
    }
}
1;

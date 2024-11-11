require '_h2ph_pre.ph';

no warnings qw(redefine misc);

unless(defined(&_SYS_SEM_H_)) {
    eval 'sub _SYS_SEM_H_ () {1;}' unless defined(&_SYS_SEM_H_);
    if(defined(&_WANT_SYSVSEM_INTERNALS)) {
	eval 'sub _WANT_SYSVIPC_INTERNALS () {1;}' unless defined(&_WANT_SYSVIPC_INTERNALS);
    }
    require 'sys/ipc.ph';
    unless(defined(&_PID_T_DECLARED)) {
	eval 'sub _PID_T_DECLARED () {1;}' unless defined(&_PID_T_DECLARED);
    }
    unless(defined(&_SIZE_T_DECLARED)) {
	eval 'sub _SIZE_T_DECLARED () {1;}' unless defined(&_SIZE_T_DECLARED);
    }
    unless(defined(&_TIME_T_DECLARED)) {
	eval 'sub _TIME_T_DECLARED () {1;}' unless defined(&_TIME_T_DECLARED);
    }
    if(defined(&COMPAT_FREEBSD4) || defined(&COMPAT_FREEBSD5) || defined(&COMPAT_FREEBSD6) || defined(&COMPAT_FREEBSD7)) {
    }
    eval 'sub SEM_UNDO () {010000;}' unless defined(&SEM_UNDO);
    if(defined(&COMPAT_FREEBSD4) || defined(&COMPAT_FREEBSD5) || defined(&COMPAT_FREEBSD6) || defined(&COMPAT_FREEBSD7) || defined(&_WANT_SEMUN_OLD)) {
    }
    if(defined(&_KERNEL) || defined(&_WANT_SEMUN)) {
    }
    eval 'sub GETNCNT () {3;}' unless defined(&GETNCNT);
    eval 'sub GETPID () {4;}' unless defined(&GETPID);
    eval 'sub GETVAL () {5;}' unless defined(&GETVAL);
    eval 'sub GETALL () {6;}' unless defined(&GETALL);
    eval 'sub GETZCNT () {7;}' unless defined(&GETZCNT);
    eval 'sub SETVAL () {8;}' unless defined(&SETVAL);
    eval 'sub SETALL () {9;}' unless defined(&SETALL);
    eval 'sub SEM_STAT () {10;}' unless defined(&SEM_STAT);
    eval 'sub SEM_INFO () {11;}' unless defined(&SEM_INFO);
    eval 'sub SEM_A () { &IPC_W;}' unless defined(&SEM_A);
    eval 'sub SEM_R () { &IPC_R;}' unless defined(&SEM_R);
    if(defined(&_KERNEL) || defined(&_WANT_SYSVSEM_INTERNALS)) {
	eval 'sub SEM_ALLOC () {01000;}' unless defined(&SEM_ALLOC);
	eval 'sub SEM_DEST () {02000;}' unless defined(&SEM_DEST);
    }
    if(defined(&_KERNEL)) {
    } else {
	if((defined(&__BSD_VISIBLE) ? &__BSD_VISIBLE : undef)) {
	}
    }
}
1;

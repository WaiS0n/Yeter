require '_h2ph_pre.ph';

no warnings qw(redefine misc);

unless(defined(&_SYS_SHM_H_)) {
    eval 'sub _SYS_SHM_H_ () {1;}' unless defined(&_SYS_SHM_H_);
    require 'sys/cdefs.ph';
    if(defined(&_WANT_SYSVSHM_INTERNALS)) {
	eval 'sub _WANT_SYSVIPC_INTERNALS () {1;}' unless defined(&_WANT_SYSVIPC_INTERNALS);
    }
    require 'sys/ipc.ph';
    require 'sys/_types.ph';
    require 'machine/param.ph';
    eval 'sub SHM_RDONLY () {010000;}' unless defined(&SHM_RDONLY);
    eval 'sub SHM_RND () {020000;}' unless defined(&SHM_RND);
    eval 'sub SHM_REMAP () {030000;}' unless defined(&SHM_REMAP);
    eval 'sub SHMLBA () { &PAGE_SIZE;}' unless defined(&SHMLBA);
    eval 'sub SHM_R () {( &IPC_R);}' unless defined(&SHM_R);
    eval 'sub SHM_W () {( &IPC_W);}' unless defined(&SHM_W);
    eval 'sub SHM_LOCK () {11;}' unless defined(&SHM_LOCK);
    eval 'sub SHM_UNLOCK () {12;}' unless defined(&SHM_UNLOCK);
    eval 'sub SHM_STAT () {13;}' unless defined(&SHM_STAT);
    eval 'sub SHM_INFO () {14;}' unless defined(&SHM_INFO);
    unless(defined(&_PID_T_DECLARED)) {
	eval 'sub _PID_T_DECLARED () {1;}' unless defined(&_PID_T_DECLARED);
    }
    unless(defined(&_TIME_T_DECLARED)) {
	eval 'sub _TIME_T_DECLARED () {1;}' unless defined(&_TIME_T_DECLARED);
    }
    unless(defined(&_SIZE_T_DECLARED)) {
	eval 'sub _SIZE_T_DECLARED () {1;}' unless defined(&_SIZE_T_DECLARED);
    }
    if(defined(&COMPAT_FREEBSD4) || defined(&COMPAT_FREEBSD5) || defined(&COMPAT_FREEBSD6) || defined(&COMPAT_FREEBSD7)) {
    }
    if(defined(&_KERNEL) || defined(&_WANT_SYSVSHM_INTERNALS)) {
    }
    if(defined(&_KERNEL)) {
    } else {
	require 'sys/cdefs.ph';
	unless(defined(&_SIZE_T_DECLARED)) {
	    eval 'sub _SIZE_T_DECLARED () {1;}' unless defined(&_SIZE_T_DECLARED);
	}
	if((defined(&__BSD_VISIBLE) ? &__BSD_VISIBLE : undef)) {
	}
    }
}
1;

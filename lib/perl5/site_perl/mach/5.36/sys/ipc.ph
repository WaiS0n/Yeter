require '_h2ph_pre.ph';

no warnings qw(redefine misc);

unless(defined(&_SYS_IPC_H_)) {
    eval 'sub _SYS_IPC_H_ () {1;}' unless defined(&_SYS_IPC_H_);
    require 'sys/cdefs.ph';
    require 'sys/_types.ph';
    unless(defined(&_GID_T_DECLARED)) {
	eval 'sub _GID_T_DECLARED () {1;}' unless defined(&_GID_T_DECLARED);
    }
    unless(defined(&_KEY_T_DECLARED)) {
	eval 'sub _KEY_T_DECLARED () {1;}' unless defined(&_KEY_T_DECLARED);
    }
    unless(defined(&_MODE_T_DECLARED)) {
	eval 'sub _MODE_T_DECLARED () {1;}' unless defined(&_MODE_T_DECLARED);
    }
    unless(defined(&_UID_T_DECLARED)) {
	eval 'sub _UID_T_DECLARED () {1;}' unless defined(&_UID_T_DECLARED);
    }
    if(defined(&COMPAT_FREEBSD4) || defined(&COMPAT_FREEBSD5) || defined(&COMPAT_FREEBSD6) || defined(&COMPAT_FREEBSD7) || defined(&COMPAT_43)) {
    }
    if((defined(&__BSD_VISIBLE) ? &__BSD_VISIBLE : undef)) {
	eval 'sub IPC_R () {000400;}' unless defined(&IPC_R);
	eval 'sub IPC_W () {000200;}' unless defined(&IPC_W);
	eval 'sub IPC_M () {010000;}' unless defined(&IPC_M);
    }
    eval 'sub IPC_CREAT () {001000;}' unless defined(&IPC_CREAT);
    eval 'sub IPC_EXCL () {002000;}' unless defined(&IPC_EXCL);
    eval 'sub IPC_NOWAIT () {004000;}' unless defined(&IPC_NOWAIT);
    eval 'sub IPC_PRIVATE () {0;}' unless defined(&IPC_PRIVATE);
    eval 'sub IPC_RMID () {0;}' unless defined(&IPC_RMID);
    eval 'sub IPC_SET () {1;}' unless defined(&IPC_SET);
    eval 'sub IPC_STAT () {2;}' unless defined(&IPC_STAT);
    if((defined(&__BSD_VISIBLE) ? &__BSD_VISIBLE : undef)) {
	eval 'sub IPC_INFO () {3;}' unless defined(&IPC_INFO);
    }
    if(defined(&_KERNEL) || defined(&_WANT_SYSVIPC_INTERNALS)) {
	eval 'sub IPCID_TO_IX {
	    my($id) = @_;
    	    eval q((($id) & 0xffff));
	}' unless defined(&IPCID_TO_IX);
	eval 'sub IPCID_TO_SEQ {
	    my($id) = @_;
    	    eval q(((($id) >> 16) & 0xffff));
	}' unless defined(&IPCID_TO_SEQ);
	eval 'sub IXSEQ_TO_IPCID {
	    my($ix,$perm) = @_;
    	    eval q(((( ($perm->{seq})) << 16) | ($ix & 0xffff)));
	}' unless defined(&IXSEQ_TO_IPCID);
    }
    if(defined(&_KERNEL)) {
	if(defined(&COMPAT_FREEBSD4) || defined(&COMPAT_FREEBSD5) || defined(&COMPAT_FREEBSD6) || defined(&COMPAT_FREEBSD7)) {
	}
    } else {
    }
}
1;

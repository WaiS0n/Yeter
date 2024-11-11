require '_h2ph_pre.ph';

no warnings qw(redefine misc);

unless(defined(&_SYS_PROCDESC_H_)) {
    eval 'sub _SYS_PROCDESC_H_ () {1;}' unless defined(&_SYS_PROCDESC_H_);
    if(defined(&_KERNEL)) {
	require 'sys/selinfo.ph';
	require 'sys/_lock.ph';
	require 'sys/_mutex.ph';
	eval 'sub PROCDESC_LOCK_DESTROY {
	    my($pd) = @_;
    	    eval q( &mtx_destroy(($pd)-> &pd_lock));
	}' unless defined(&PROCDESC_LOCK_DESTROY);
	eval 'sub PROCDESC_LOCK_INIT {
	    my($pd) = @_;
    	    eval q( &mtx_init(($pd)-> &pd_lock, \\"procdesc\\",  &NULL,  &MTX_DEF));
	}' unless defined(&PROCDESC_LOCK_INIT);
	eval 'sub PROCDESC_LOCK {
	    my($pd) = @_;
    	    eval q( &mtx_lock(($pd)-> &pd_lock));
	}' unless defined(&PROCDESC_LOCK);
	eval 'sub PROCDESC_UNLOCK {
	    my($pd) = @_;
    	    eval q( &mtx_unlock(($pd)-> &pd_lock));
	}' unless defined(&PROCDESC_UNLOCK);
	eval 'sub PDF_CLOSED () {0x1;}' unless defined(&PDF_CLOSED);
	eval 'sub PDF_SELECTED () {0x2;}' unless defined(&PDF_SELECTED);
	eval 'sub PDF_EXITED () {0x4;}' unless defined(&PDF_EXITED);
	eval 'sub PDF_DAEMON () {0x8;}' unless defined(&PDF_DAEMON);
    } else {
	require 'sys/_types.ph';
	unless(defined(&_PID_T_DECLARED)) {
	    eval 'sub _PID_T_DECLARED () {1;}' unless defined(&_PID_T_DECLARED);
	}
    }
    eval 'sub PD_DAEMON () {0x1;}' unless defined(&PD_DAEMON);
    eval 'sub PD_CLOEXEC () {0x2;}' unless defined(&PD_CLOEXEC);
    eval 'sub PD_ALLOWED_AT_FORK () {( &PD_DAEMON |  &PD_CLOEXEC);}' unless defined(&PD_ALLOWED_AT_FORK);
}
1;

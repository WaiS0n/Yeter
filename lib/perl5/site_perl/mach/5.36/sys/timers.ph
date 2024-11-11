require '_h2ph_pre.ph';

no warnings qw(redefine misc);

unless(defined(&_SYS_TIMERS_H_)) {
    eval 'sub _SYS_TIMERS_H_ () {1;}' unless defined(&_SYS_TIMERS_H_);
    require 'sys/time.ph';
    if(defined(&_KERNEL)) {
	eval 'sub ITF_DELETING () {0x1;}' unless defined(&ITF_DELETING);
	eval 'sub ITF_WANTED () {0x2;}' unless defined(&ITF_WANTED);
	eval 'sub ITF_PSTOPPED () {0x4;}' unless defined(&ITF_PSTOPPED);
	eval 'sub TIMER_MAX () {32;}' unless defined(&TIMER_MAX);
	eval 'sub ITIMER_LOCK {
	    my($it) = @_;
    	    eval q( &mtx_lock(($it)-> &it_mtx));
	}' unless defined(&ITIMER_LOCK);
	eval 'sub ITIMER_UNLOCK {
	    my($it) = @_;
    	    eval q( &mtx_unlock(($it)-> &it_mtx));
	}' unless defined(&ITIMER_UNLOCK);
    }
}
1;

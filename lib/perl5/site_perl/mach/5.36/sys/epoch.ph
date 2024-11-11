require '_h2ph_pre.ph';

no warnings qw(redefine misc);

unless(defined(&_SYS_EPOCH_H_)) {
    eval 'sub _SYS_EPOCH_H_ () {1;}' unless defined(&_SYS_EPOCH_H_);
    require 'sys/cdefs.ph';
    if(defined(&_KERNEL)) {
	require 'sys/lock.ph';
	require 'sys/pcpu.ph';
	require 'ck_epoch.ph';
	eval 'sub EPOCH_PREEMPT () {0x1;}' unless defined(&EPOCH_PREEMPT);
	eval 'sub EPOCH_LOCKED () {0x2;}' unless defined(&EPOCH_LOCKED);
	if(defined(&EPOCH_TRACE)) {
	    eval 'sub ET_REPORT_EXIT () {0x1;}' unless defined(&ET_REPORT_EXIT);
	}
	if(defined(&EPOCH_TRACE)) {
	    eval 'sub EPOCH_FILE_LINE () {,  &const \'char\' * &file, \'int\'  &line;}' unless defined(&EPOCH_FILE_LINE);
	} else {
	    eval 'sub EPOCH_FILE_LINE () {1;}' unless defined(&EPOCH_FILE_LINE);
	}
	if(defined(&EPOCH_TRACE)) {
	    eval 'sub epoch_enter_preempt {
	        my($epoch, $et) = @_;
    		eval q( &_epoch_enter_preempt($epoch, $et,  &__FILE__,  &__LINE__));
	    }' unless defined(&epoch_enter_preempt);
	    eval 'sub epoch_exit_preempt {
	        my($epoch, $et) = @_;
    		eval q( &_epoch_exit_preempt($epoch, $et,  &__FILE__,  &__LINE__));
	    }' unless defined(&epoch_exit_preempt);
	} else {
	    eval 'sub epoch_enter_preempt {
	        my($epoch, $et) = @_;
    		eval q( &_epoch_enter_preempt($epoch, $et));
	    }' unless defined(&epoch_enter_preempt);
	    eval 'sub epoch_exit_preempt {
	        my($epoch, $et) = @_;
    		eval q( &_epoch_exit_preempt($epoch, $et));
	    }' unless defined(&epoch_exit_preempt);
	}
	eval 'sub NET_EPOCH_ENTER {
	    my($et) = @_;
    	    eval q( &epoch_enter_preempt( &net_epoch_preempt, ($et)));
	}' unless defined(&NET_EPOCH_ENTER);
	eval 'sub NET_EPOCH_EXIT {
	    my($et) = @_;
    	    eval q( &epoch_exit_preempt( &net_epoch_preempt, ($et)));
	}' unless defined(&NET_EPOCH_EXIT);
	eval 'sub NET_EPOCH_WAIT () {
	    eval q( &epoch_wait_preempt( &net_epoch_preempt));
	}' unless defined(&NET_EPOCH_WAIT);
	eval 'sub NET_EPOCH_CALL {
	    my($f, $c) = @_;
    	    eval q( &epoch_call( &net_epoch_preempt, ($f), ($c)));
	}' unless defined(&NET_EPOCH_CALL);
	eval 'sub NET_EPOCH_DRAIN_CALLBACKS () {
	    eval q( &epoch_drain_callbacks( &net_epoch_preempt));
	}' unless defined(&NET_EPOCH_DRAIN_CALLBACKS);
	eval 'sub NET_EPOCH_ASSERT () {
	    eval q( &MPASS( &in_epoch( &net_epoch_preempt)));
	}' unless defined(&NET_EPOCH_ASSERT);
	eval 'sub NET_TASK_INIT {
	    my($t, $p, $f, $c) = @_;
    	    eval q( &TASK_INIT_FLAGS($t, $p, $f, $c,  &TASK_NETWORK));
	}' unless defined(&NET_TASK_INIT);
	eval 'sub NET_GROUPTASK_INIT {
	    my($gtask, $prio, $func, $ctx) = @_;
    	    eval q( &GTASK_INIT(($gtask)-> &gt_task,  &TASK_NETWORK, ($prio), ($func), ($ctx)));
	}' unless defined(&NET_GROUPTASK_INIT);
    }
}
1;

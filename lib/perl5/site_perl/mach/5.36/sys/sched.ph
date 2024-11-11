require '_h2ph_pre.ph';

no warnings qw(redefine misc);

unless(defined(&_SCHED_H_)) {
    eval 'sub _SCHED_H_ () {1;}' unless defined(&_SCHED_H_);
    if(defined(&_KERNEL)) {
	if(defined(&RACCT)) {
	    if(defined(&SCHED_4BSD)) {
	    }
	}
	eval 'sub sched_userret {
	    my($td) = @_;
    	    eval q({  &KASSERT(( ($td->{td_flags}) &  &TDF_BORROWING) == 0, (\\"thread with borrowed priority returning to userland\\"));  &if ( &__predict_false( ($td->{td_priority}) !=  ($td->{td_user_pri})))  &sched_userret_slowpath($td); });
	}' unless defined(&sched_userret);
	if(defined(&KTR)) {
	}
	eval 'sub sched_pin {
	    my($void) = @_;
    	    eval q({  ($curthread->{td_pinned})++;  &atomic_interrupt_fence(); });
	}' unless defined(&sched_pin);
	eval 'sub sched_unpin {
	    my($void) = @_;
    	    eval q({  &atomic_interrupt_fence();  ($curthread->{td_pinned})--; });
	}' unless defined(&sched_unpin);
	eval 'sub SRQ_BORING () {0x;}' unless defined(&SRQ_BORING);
	eval 'sub SRQ_YIELDING () {0x1;}' unless defined(&SRQ_YIELDING);
	eval 'sub SRQ_OURSELF () {0x2;}' unless defined(&SRQ_OURSELF);
	eval 'sub SRQ_INTR () {0x4;}' unless defined(&SRQ_INTR);
	eval 'sub SRQ_PREEMPTED () {0x8;}' unless defined(&SRQ_PREEMPTED);
	eval 'sub SRQ_BORROWING () {0x10;}' unless defined(&SRQ_BORROWING);
	eval 'sub SRQ_HOLD () {0x20;}' unless defined(&SRQ_HOLD);
	eval 'sub SRQ_HOLDTD () {0x40;}' unless defined(&SRQ_HOLDTD);
	if(defined(&SCHED_STATS)) {
	    eval 'sub SCHED_STAT_DEFINE_VAR {
	        my($name, $ptr, $descr) = @_;
    		eval q( &static  &void $name   &_add_proc( &void * &dummy  &__unused) {  &SYSCTL_ADD_PROC( &NULL,  &SYSCTL_STATIC_CHILDREN( &_kern_sched_stats),  &OID_AUTO, $name,  &CTLTYPE_LONG| &CTLFLAG_RD| &CTLFLAG_MPSAFE, $ptr, 0, \'sysctl_dpcpu_long\', \\"LU\\", $descr); }  &SYSINIT($name,  &SI_SUB_LAST,  &SI_ORDER_MIDDLE, $name   &_add_proc,  &NULL););
	    }' unless defined(&SCHED_STAT_DEFINE_VAR);
	    eval 'sub SCHED_STAT_DEFINE {
	        my($name, $descr) = @_;
    		eval q( &DPCPU_DEFINE(\'unsigned long\', $name);  &SCHED_STAT_DEFINE_VAR($name,  &DPCPU_NAME($name), $descr));
	    }' unless defined(&SCHED_STAT_DEFINE);
	    eval 'sub SCHED_STAT_INC {
	        my($var) = @_;
    		eval q( &DPCPU_GET($var)++;);
	    }' unless defined(&SCHED_STAT_INC);
	} else {
	    eval 'sub SCHED_STAT_DEFINE_VAR {
	        my($name, $descr, $ptr) = @_;
    		eval q();
	    }' unless defined(&SCHED_STAT_DEFINE_VAR);
	    eval 'sub SCHED_STAT_DEFINE {
	        my($name, $descr) = @_;
    		eval q();
	    }' unless defined(&SCHED_STAT_DEFINE);
	    eval 'sub SCHED_STAT_INC {
	        my($var) = @_;
    		eval q(( &void)0);
	    }' unless defined(&SCHED_STAT_INC);
	}
    }
    eval 'sub SCHED_FIFO () {1;}' unless defined(&SCHED_FIFO);
    eval 'sub SCHED_OTHER () {2;}' unless defined(&SCHED_OTHER);
    eval 'sub SCHED_RR () {3;}' unless defined(&SCHED_RR);
    unless(defined(&_KERNEL)) {
	require 'sys/cdefs.ph';
	require 'sys/_timespec.ph';
	require 'sys/_types.ph';
	unless(defined(&_PID_T_DECLARED)) {
	    eval 'sub _PID_T_DECLARED () {1;}' unless defined(&_PID_T_DECLARED);
	}
    }
}
1;

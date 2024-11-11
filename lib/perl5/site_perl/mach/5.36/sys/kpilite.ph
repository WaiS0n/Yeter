require '_h2ph_pre.ph';

no warnings qw(redefine misc);

unless(defined(&_SYS_KPILITE_H_)) {
    eval 'sub _SYS_KPILITE_H_ () {1;}' unless defined(&_SYS_KPILITE_H_);
    if(!defined(&GENOFFSET)  && (!defined(&KLD_MODULE) || defined(&KLD_TIED))  && defined(&_KERNEL)) {
	require 'sys/offset.inc';
	eval 'sub sched_pin_lite {
	    my($td) = @_;
    	    eval q({  &KASSERT($td ==  &curthread, (\\"sched_pin called on non curthread\\"));  ($td->{td_pinned})++;  &atomic_interrupt_fence(); });
	}' unless defined(&sched_pin_lite);
	eval 'sub sched_unpin_lite {
	    my($td) = @_;
    	    eval q({  &KASSERT($td ==  &curthread, (\\"sched_unpin called on non curthread\\"));  &KASSERT( ($td->{td_pinned}) > 0, (\\"sched_unpin called on non pinned thread\\"));  &atomic_interrupt_fence();  ($td->{td_pinned})--; });
	}' unless defined(&sched_unpin_lite);
    }
}
1;

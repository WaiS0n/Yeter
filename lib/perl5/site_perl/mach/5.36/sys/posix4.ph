require '_h2ph_pre.ph';

no warnings qw(redefine misc);

unless(defined(&_P1003_1B_P1003_1B_H_)) {
    eval 'sub _P1003_1B_P1003_1B_H_ () {1;}' unless defined(&_P1003_1B_P1003_1B_H_);
    require 'sys/param.ph';
    require 'sys/ioccom.ph';
    require 'sys/malloc.ph';
    require 'sys/sched.ph';
    eval 'sub SYSCALL_NOT_PRESENT_GEN {
        my($SC) = @_;
	    eval q(\'int\'  &sys_  $SC (\'struct thread\' * &td, \'struct SC\' &_args * &uap) {  &return  &syscall_not_present( &td, $SC ,  &uap); });
    }' unless defined(&SYSCALL_NOT_PRESENT_GEN);
    if(defined(&_KPOSIX_PRIORITY_SCHEDULING)) {
	eval("sub SCHED_GETPARAM () { 0; }") unless defined(&SCHED_GETPARAM);
	eval("sub SCHED_SETSCHEDULER () { 1; }") unless defined(&SCHED_SETSCHEDULER);
	eval("sub SCHED_GETSCHEDULER () { 2; }") unless defined(&SCHED_GETSCHEDULER);
	eval("sub SCHED_YIELD () { 3; }") unless defined(&SCHED_YIELD);
	eval("sub SCHED_GET_PRIORITY_MAX () { 4; }") unless defined(&SCHED_GET_PRIORITY_MAX);
	eval("sub SCHED_GET_PRIORITY_MIN () { 5; }") unless defined(&SCHED_GET_PRIORITY_MIN);
	eval("sub SCHED_RR_GET_INTERVAL () { 6; }") unless defined(&SCHED_RR_GET_INTERVAL);
	eval("sub SCHED_OP_MAX () { 7; }") unless defined(&SCHED_OP_MAX);
    }
}
1;

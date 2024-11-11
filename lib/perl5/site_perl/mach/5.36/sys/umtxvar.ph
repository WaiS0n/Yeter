require '_h2ph_pre.ph';

no warnings qw(redefine misc);

unless(defined(&_SYS_UMTXVAR_H_)) {
    eval 'sub _SYS_UMTXVAR_H_ () {1;}' unless defined(&_SYS_UMTXVAR_H_);
    if(defined(&_KERNEL)) {
	require 'sys/_timespec.ph';
	eval("sub TYPE_SIMPLE_WAIT () { 0; }") unless defined(&TYPE_SIMPLE_WAIT);
	eval("sub TYPE_CV () { 1; }") unless defined(&TYPE_CV);
	eval("sub TYPE_SEM () { 2; }") unless defined(&TYPE_SEM);
	eval("sub TYPE_SIMPLE_LOCK () { 3; }") unless defined(&TYPE_SIMPLE_LOCK);
	eval("sub TYPE_NORMAL_UMUTEX () { 4; }") unless defined(&TYPE_NORMAL_UMUTEX);
	eval("sub TYPE_PI_UMUTEX () { 5; }") unless defined(&TYPE_PI_UMUTEX);
	eval("sub TYPE_PP_UMUTEX () { 6; }") unless defined(&TYPE_PP_UMUTEX);
	eval("sub TYPE_RWLOCK () { 7; }") unless defined(&TYPE_RWLOCK);
	eval("sub TYPE_FUTEX () { 8; }") unless defined(&TYPE_FUTEX);
	eval("sub TYPE_SHM () { 9; }") unless defined(&TYPE_SHM);
	eval("sub TYPE_PI_ROBUST_UMUTEX () { 10; }") unless defined(&TYPE_PI_ROBUST_UMUTEX);
	eval("sub TYPE_PP_ROBUST_UMUTEX () { 11; }") unless defined(&TYPE_PP_ROBUST_UMUTEX);
	eval("sub TYPE_PI_FUTEX () { 12; }") unless defined(&TYPE_PI_FUTEX);
	eval 'sub THREAD_SHARE () {0;}' unless defined(&THREAD_SHARE);
	eval 'sub PROCESS_SHARE () {1;}' unless defined(&PROCESS_SHARE);
	eval 'sub AUTO_SHARE () {2;}' unless defined(&AUTO_SHARE);
	eval 'sub UQF_UMTXQ () {0x1;}' unless defined(&UQF_UMTXQ);
	eval 'sub UMTX_SHARED_QUEUE () {0;}' unless defined(&UMTX_SHARED_QUEUE);
	eval 'sub UMTX_EXCLUSIVE_QUEUE () {1;}' unless defined(&UMTX_EXCLUSIVE_QUEUE);
	if(defined(&UMTX_PROFILING)) {
	}
	eval 'sub umtx_key_match {
	    my($k1,$k2) = @_;
    	    eval q({ ( ($k1->{type}) ==  ($k2->{type})  &&  ($k1->{info}->{both}->{a}) ==  ($k2->{info}->{both}->{a})  &&  ($k1->{info}->{both}->{b}) ==  ($k2->{info}->{both}->{b})); });
	}' unless defined(&umtx_key_match);
	eval 'sub umtxq_insert {
	    my($uq) = @_;
    	    eval q( &umtxq_insert_queue(($uq),  &UMTX_SHARED_QUEUE));
	}' unless defined(&umtxq_insert);
	eval 'sub umtxq_remove {
	    my($uq) = @_;
    	    eval q( &umtxq_remove_queue(($uq),  &UMTX_SHARED_QUEUE));
	}' unless defined(&umtxq_remove);
	eval 'sub umtxq_lock {
	    my($key) = @_;
    	    eval q( &do { \'struct umtx_key\' * &_key = ($key); \'struct umtxq_chain\' * &_uc;  &_uc =  &umtxq_getchain( &_key);  &mtx_lock(& ($_uc->{uc_lock})); }  &while (0));
	}' unless defined(&umtxq_lock);
    }
}
1;

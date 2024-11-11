require '_h2ph_pre.ph';

no warnings qw(redefine misc);

unless(defined(&_SYS_TIMEEC_H_)) {
    eval 'sub _SYS_TIMEEC_H_ () {1;}' unless defined(&_SYS_TIMEEC_H_);
    unless(defined(&_KERNEL)) {
	die("no user-serviceable parts inside");
    }
    require 'sys/lock.ph';
    require 'sys/mutex.ph';
    require 'sys/queue.ph';
    require 'sys/time.ph';
    eval 'sub ET_FLAGS_PERIODIC () {1;}' unless defined(&ET_FLAGS_PERIODIC);
    eval 'sub ET_FLAGS_ONESHOT () {2;}' unless defined(&ET_FLAGS_ONESHOT);
    eval 'sub ET_FLAGS_PERCPU () {4;}' unless defined(&ET_FLAGS_PERCPU);
    eval 'sub ET_FLAGS_C3STOP () {8;}' unless defined(&ET_FLAGS_C3STOP);
    eval 'sub ET_FLAGS_POW2DIV () {16;}' unless defined(&ET_FLAGS_POW2DIV);
    eval 'sub ET_LOCK () {
        eval q( &mtx_lock( &et_eventtimers_mtx));
    }' unless defined(&ET_LOCK);
    eval 'sub ET_UNLOCK () {
        eval q( &mtx_unlock( &et_eventtimers_mtx));
    }' unless defined(&ET_UNLOCK);
    if(defined(&SYSCTL_DECL)) {
    }
}
1;

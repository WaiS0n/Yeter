require '_h2ph_pre.ph';

no warnings qw(redefine misc);

unless(defined(&_THREADS_H_)) {
    eval 'sub _THREADS_H_ () {1;}' unless defined(&_THREADS_H_);
    require 'time.ph';
    eval("sub mtx_plain () { 0x1; }") unless defined(&mtx_plain);
    eval("sub mtx_recursive () { 0x2; }") unless defined(&mtx_recursive);
    eval("sub mtx_timed () { 0x4; }") unless defined(&mtx_timed);
    eval("sub thrd_busy () { 1; }") unless defined(&thrd_busy);
    eval("sub thrd_error () { 2; }") unless defined(&thrd_error);
    eval("sub thrd_nomem () { 3; }") unless defined(&thrd_nomem);
    eval("sub thrd_success () { 4; }") unless defined(&thrd_success);
    eval("sub thrd_timedout () { 5; }") unless defined(&thrd_timedout);
    if(!defined(&__cplusplus) || (defined(&__cplusplus) ? &__cplusplus : undef) < 201103) {
	eval 'sub thread_local () { &_Thread_local;}' unless defined(&thread_local);
    }
    eval 'sub ONCE_FLAG_INIT () {{ 0,  &NULL };}' unless defined(&ONCE_FLAG_INIT);
    eval 'sub TSS_DTOR_ITERATIONS () {4;}' unless defined(&TSS_DTOR_ITERATIONS);
}
1;

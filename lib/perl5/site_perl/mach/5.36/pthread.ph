require '_h2ph_pre.ph';

no warnings qw(redefine misc);

unless(defined(&_PTHREAD_H_)) {
    eval 'sub _PTHREAD_H_ () {1;}' unless defined(&_PTHREAD_H_);
    require 'sys/cdefs.ph';
    require 'sys/_pthreadtypes.ph';
    require 'machine/_limits.ph';
    require 'sys/_types.ph';
    require 'sys/_sigset.ph';
    if((defined(&__BSD_VISIBLE) ? &__BSD_VISIBLE : undef)) {
	require 'sys/_sigval.ph';
    }
    require 'sched.ph';
    require 'time.ph';
    eval 'sub PTHREAD_DESTRUCTOR_ITERATIONS () {4;}' unless defined(&PTHREAD_DESTRUCTOR_ITERATIONS);
    eval 'sub PTHREAD_KEYS_MAX () {256;}' unless defined(&PTHREAD_KEYS_MAX);
    eval 'sub PTHREAD_STACK_MIN () { &__MINSIGSTKSZ;}' unless defined(&PTHREAD_STACK_MIN);
    eval 'sub PTHREAD_THREADS_MAX () { &__ULONG_MAX;}' unless defined(&PTHREAD_THREADS_MAX);
    eval 'sub PTHREAD_BARRIER_SERIAL_THREAD () {-1;}' unless defined(&PTHREAD_BARRIER_SERIAL_THREAD);
    eval 'sub PTHREAD_DETACHED () {0x1;}' unless defined(&PTHREAD_DETACHED);
    eval 'sub PTHREAD_SCOPE_SYSTEM () {0x2;}' unless defined(&PTHREAD_SCOPE_SYSTEM);
    eval 'sub PTHREAD_INHERIT_SCHED () {0x4;}' unless defined(&PTHREAD_INHERIT_SCHED);
    eval 'sub PTHREAD_NOFLOAT () {0x8;}' unless defined(&PTHREAD_NOFLOAT);
    eval 'sub PTHREAD_CREATE_DETACHED () { &PTHREAD_DETACHED;}' unless defined(&PTHREAD_CREATE_DETACHED);
    eval 'sub PTHREAD_CREATE_JOINABLE () {0;}' unless defined(&PTHREAD_CREATE_JOINABLE);
    eval 'sub PTHREAD_SCOPE_PROCESS () {0;}' unless defined(&PTHREAD_SCOPE_PROCESS);
    eval 'sub PTHREAD_EXPLICIT_SCHED () {0;}' unless defined(&PTHREAD_EXPLICIT_SCHED);
    eval 'sub PTHREAD_PROCESS_PRIVATE () {0;}' unless defined(&PTHREAD_PROCESS_PRIVATE);
    eval 'sub PTHREAD_PROCESS_SHARED () {1;}' unless defined(&PTHREAD_PROCESS_SHARED);
    eval 'sub PTHREAD_CANCEL_ENABLE () {0;}' unless defined(&PTHREAD_CANCEL_ENABLE);
    eval 'sub PTHREAD_CANCEL_DISABLE () {1;}' unless defined(&PTHREAD_CANCEL_DISABLE);
    eval 'sub PTHREAD_CANCEL_DEFERRED () {0;}' unless defined(&PTHREAD_CANCEL_DEFERRED);
    eval 'sub PTHREAD_CANCEL_ASYNCHRONOUS () {2;}' unless defined(&PTHREAD_CANCEL_ASYNCHRONOUS);
    eval 'sub PTHREAD_CANCELED () {(( &void *) 1);}' unless defined(&PTHREAD_CANCELED);
    eval 'sub PTHREAD_NEEDS_INIT () {0;}' unless defined(&PTHREAD_NEEDS_INIT);
    eval 'sub PTHREAD_DONE_INIT () {1;}' unless defined(&PTHREAD_DONE_INIT);
    eval 'sub PTHREAD_ONCE_INIT () {{  &PTHREAD_NEEDS_INIT,  &NULL };}' unless defined(&PTHREAD_ONCE_INIT);
    eval 'sub PTHREAD_MUTEX_INITIALIZER () { &NULL;}' unless defined(&PTHREAD_MUTEX_INITIALIZER);
    eval 'sub PTHREAD_ADAPTIVE_MUTEX_INITIALIZER_NP () {(( &pthread_mutex_t)1);}' unless defined(&PTHREAD_ADAPTIVE_MUTEX_INITIALIZER_NP);
    eval 'sub PTHREAD_COND_INITIALIZER () { &NULL;}' unless defined(&PTHREAD_COND_INITIALIZER);
    eval 'sub PTHREAD_RWLOCK_INITIALIZER () { &NULL;}' unless defined(&PTHREAD_RWLOCK_INITIALIZER);
    unless(defined(&PTHREAD_KERNEL)) {
	eval 'sub pthread_condattr_default () { &NULL;}' unless defined(&pthread_condattr_default);
	eval 'sub pthread_mutexattr_default () { &NULL;}' unless defined(&pthread_mutexattr_default);
	eval 'sub pthread_attr_default () { &NULL;}' unless defined(&pthread_attr_default);
    }
    eval 'sub PTHREAD_PRIO_NONE () {0;}' unless defined(&PTHREAD_PRIO_NONE);
    eval 'sub PTHREAD_PRIO_INHERIT () {1;}' unless defined(&PTHREAD_PRIO_INHERIT);
    eval 'sub PTHREAD_PRIO_PROTECT () {2;}' unless defined(&PTHREAD_PRIO_PROTECT);
    eval("sub PTHREAD_MUTEX_ERRORCHECK () { 1; }") unless defined(&PTHREAD_MUTEX_ERRORCHECK);
    eval("sub PTHREAD_MUTEX_RECURSIVE () { 2; }") unless defined(&PTHREAD_MUTEX_RECURSIVE);
    eval("sub PTHREAD_MUTEX_NORMAL () { 3; }") unless defined(&PTHREAD_MUTEX_NORMAL);
    eval("sub PTHREAD_MUTEX_ADAPTIVE_NP () { 4; }") unless defined(&PTHREAD_MUTEX_ADAPTIVE_NP);
    eval("sub PTHREAD_MUTEX_TYPE_MAX () { 5; }") unless defined(&PTHREAD_MUTEX_TYPE_MAX);
    eval 'sub PTHREAD_MUTEX_DEFAULT () { &PTHREAD_MUTEX_ERRORCHECK;}' unless defined(&PTHREAD_MUTEX_DEFAULT);
    eval 'sub PTHREAD_MUTEX_STALLED () {0;}' unless defined(&PTHREAD_MUTEX_STALLED);
    eval 'sub PTHREAD_MUTEX_ROBUST () {1;}' unless defined(&PTHREAD_MUTEX_ROBUST);
    eval 'sub pthread_cleanup_push {
        my($cleanup_routine, $cleanup_arg) = @_;
	    eval q({ \'struct _pthread_cleanup_info\'  &__cleanup_info__;  &__pthread_cleanup_push_imp($cleanup_routine, $cleanup_arg, & &__cleanup_info__); {);
    }' unless defined(&pthread_cleanup_push);
    eval 'sub pthread_cleanup_pop {
        my($execute) = @_;
	    eval q(( &void)0; }  &__pthread_cleanup_pop_imp($execute); });
    }' unless defined(&pthread_cleanup_pop);
    if((defined(&__BSD_VISIBLE) ? &__BSD_VISIBLE : undef)) {
    }
    if((defined(&__XSI_VISIBLE) ? &__XSI_VISIBLE : undef)) {
    }
}
1;

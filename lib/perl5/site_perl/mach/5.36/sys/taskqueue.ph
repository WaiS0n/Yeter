require '_h2ph_pre.ph';

no warnings qw(redefine misc);

unless(defined(&_SYS_TASKQUEUE_H_)) {
    eval 'sub _SYS_TASKQUEUE_H_ () {1;}' unless defined(&_SYS_TASKQUEUE_H_);
    unless(defined(&_KERNEL)) {
	die("no user-serviceable parts inside");
    }
    require 'sys/queue.ph';
    require 'sys/_task.ph';
    require 'sys/_callout.ph';
    require 'sys/_cpuset.ph';
    eval("sub TASKQUEUE_CALLBACK_TYPE_INIT () { 0; }") unless defined(&TASKQUEUE_CALLBACK_TYPE_INIT);
    eval("sub TASKQUEUE_CALLBACK_TYPE_SHUTDOWN () { 1; }") unless defined(&TASKQUEUE_CALLBACK_TYPE_SHUTDOWN);
    eval 'sub TASKQUEUE_CALLBACK_TYPE_MIN () { &TASKQUEUE_CALLBACK_TYPE_INIT;}' unless defined(&TASKQUEUE_CALLBACK_TYPE_MIN);
    eval 'sub TASKQUEUE_CALLBACK_TYPE_MAX () { &TASKQUEUE_CALLBACK_TYPE_SHUTDOWN;}' unless defined(&TASKQUEUE_CALLBACK_TYPE_MAX);
    eval 'sub TASKQUEUE_NUM_CALLBACKS () { &TASKQUEUE_CALLBACK_TYPE_MAX + 1;}' unless defined(&TASKQUEUE_NUM_CALLBACKS);
    eval 'sub TASKQUEUE_NAMELEN () {32;}' unless defined(&TASKQUEUE_NAMELEN);
    eval 'sub TASKQUEUE_FAIL_IF_PENDING () {(1<< 0);}' unless defined(&TASKQUEUE_FAIL_IF_PENDING);
    eval 'sub TASKQUEUE_FAIL_IF_CANCELING () {(1<< 1);}' unless defined(&TASKQUEUE_FAIL_IF_CANCELING);
    eval 'sub TASK_INITIALIZER {
        my($priority, $func, $context) = @_;
	    eval q({ . &ta_priority = ($priority), . &ta_func = ($func), . &ta_context = ($context) });
    }' unless defined(&TASK_INITIALIZER);
    eval 'sub TASK_INIT_FLAGS {
        my($task, $priority, $func, $context, $flags) = @_;
	    eval q( &do { ($task)-> &ta_pending = 0; ($task)-> &ta_priority = ($priority); ($task)-> &ta_flags = ($flags); ($task)-> &ta_func = ($func); ($task)-> &ta_context = ($context); }  &while (0));
    }' unless defined(&TASK_INIT_FLAGS);
    eval 'sub TASK_INIT {
        my($t, $p, $f, $c) = @_;
	    eval q( &TASK_INIT_FLAGS($t, $p, $f, $c, 0));
    }' unless defined(&TASK_INIT);
    eval 'sub TIMEOUT_TASK_INIT {
        my($queue, $timeout_task, $priority, $func, $context) = @_;
	    eval q( &do {  &_Static_assert(($priority) >= 0 && ($priority) <= 255, \\"struct task priority is 8 bit in size\\");  &_timeout_task_init($queue, $timeout_task, $priority, $func, $context); }  &while (0));
    }' unless defined(&TIMEOUT_TASK_INIT);
    eval 'sub TASKQUEUE_DECLARE {
        my($name) = @_;
	    eval q( &extern \'struct taskqueue\' * &taskqueue_$name);
    }' unless defined(&TASKQUEUE_DECLARE);
    eval 'sub TASKQUEUE_DEFINE {
        my($name, $enqueue, $context, $init) = @_;
	    eval q(\'struct taskqueue\' * &taskqueue_$name;  &static  &void  &taskqueue_define_$name( &void * &arg) {  &taskqueue_$name =  &taskqueue_create($name,  &M_WAITOK, ($enqueue), ($context)); $init; }  &SYSINIT( &taskqueue_$name,  &SI_SUB_TASKQ,  &SI_ORDER_SECOND,  &taskqueue_define_$name,  &NULL); \'struct __hack\');
    }' unless defined(&TASKQUEUE_DEFINE);
    eval 'sub TASKQUEUE_DEFINE_THREAD {
        my($name) = @_;
	    eval q( &TASKQUEUE_DEFINE($name,  &taskqueue_thread_enqueue,  &taskqueue_$name,  &taskqueue_start_threads( &taskqueue_$name, 1,  &PWAIT, \\"%s taskq\\", $name)));
    }' unless defined(&TASKQUEUE_DEFINE_THREAD);
    eval 'sub TASKQUEUE_FAST_DEFINE {
        my($name, $enqueue, $context, $init) = @_;
	    eval q(\'struct taskqueue\' * &taskqueue_$name;  &static  &void  &taskqueue_define_$name( &void * &arg) {  &taskqueue_$name =  &taskqueue_create_fast($name,  &M_WAITOK, ($enqueue), ($context)); $init; }  &SYSINIT( &taskqueue_$name,  &SI_SUB_TASKQ,  &SI_ORDER_SECOND,  &taskqueue_define_$name,  &NULL); \'struct __hack\');
    }' unless defined(&TASKQUEUE_FAST_DEFINE);
    eval 'sub TASKQUEUE_FAST_DEFINE_THREAD {
        my($name) = @_;
	    eval q( &TASKQUEUE_FAST_DEFINE($name,  &taskqueue_thread_enqueue,  &taskqueue_$name,  &taskqueue_start_threads( &taskqueue_$name, 1,  &PWAIT, \\"%s taskq\\", $name)));
    }' unless defined(&TASKQUEUE_FAST_DEFINE_THREAD);
}
1;

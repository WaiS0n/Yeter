require '_h2ph_pre.ph';

no warnings qw(redefine misc);

unless(defined(&_SYS_GTASKQUEUE_H_)) {
    eval 'sub _SYS_GTASKQUEUE_H_ () {1;}' unless defined(&_SYS_GTASKQUEUE_H_);
    unless(defined(&_KERNEL)) {
	die("no user-serviceable parts inside");
    }
    require 'sys/_task.ph';
    require 'sys/bus.ph';
    require 'sys/taskqueue.ph';
    require 'sys/types.ph';
    eval 'sub GROUPTASK_NAMELEN () {32;}' unless defined(&GROUPTASK_NAMELEN);
    eval 'sub GTASK_INIT {
        my($gtask, $flags, $priority, $func, $context) = @_;
	    eval q( &do { ($gtask)-> &ta_flags = $flags; ($gtask)-> &ta_priority = ($priority); ($gtask)-> &ta_func = ($func); ($gtask)-> &ta_context = ($context); }  &while (0));
    }' unless defined(&GTASK_INIT);
    eval 'sub GROUPTASK_INIT {
        my($gtask, $priority, $func, $context) = @_;
	    eval q( &GTASK_INIT(($gtask)-> &gt_task, 0, $priority, $func, $context));
    }' unless defined(&GROUPTASK_INIT);
    eval 'sub GROUPTASK_ENQUEUE {
        my($gtask) = @_;
	    eval q( &grouptaskqueue_enqueue(($gtask)-> &gt_taskqueue, ($gtask)-> &gt_task));
    }' unless defined(&GROUPTASK_ENQUEUE);
    eval 'sub TASKQGROUP_DECLARE {
        my($name) = @_;
	    eval q( &extern \'struct taskqgroup\' * &qgroup_$name);
    }' unless defined(&TASKQGROUP_DECLARE);
    eval 'sub TASKQGROUP_DEFINE {
        my($name, $cnt, $stride) = @_;
	    eval q(\'struct taskqgroup\' * &qgroup_$name;  &static  &void  &taskqgroup_define_$name( &void * &arg) {  &qgroup_$name =  &taskqgroup_create($name, ($cnt), ($stride)); }  &SYSINIT( &taskqgroup_$name,  &SI_SUB_TASKQ,  &SI_ORDER_FIRST,  &taskqgroup_define_$name,  &NULL);  &static  &void  &taskqgroup_bind_$name( &void * &arg) {  &taskqgroup_bind( &qgroup_$name); }  &SYSINIT( &taskqgroup_bind_$name,  &SI_SUB_SMP,  &SI_ORDER_ANY,  &taskqgroup_bind_$name,  &NULL));
    }' unless defined(&TASKQGROUP_DEFINE);
}
1;

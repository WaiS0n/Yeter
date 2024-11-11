require '_h2ph_pre.ph';

no warnings qw(redefine misc);

unless(defined(&_SYS_FAIL_H_)) {
    eval 'sub _SYS_FAIL_H_ () {1;}' unless defined(&_SYS_FAIL_H_);
    require 'sys/param.ph';
    require 'sys/cdefs.ph';
    require 'sys/linker_set.ph';
    require 'sys/queue.ph';
    require 'sys/sysctl.ph';
    require 'sys/condvar.ph';
    require 'sys/kernel.ph';
    require 'sys/lock.ph';
    require 'sys/mutex.ph';
    require 'sys/systm.ph';
    eval("sub FAIL_POINT_RC_CONTINUE () { 0; }") unless defined(&FAIL_POINT_RC_CONTINUE);
    eval("sub FAIL_POINT_RC_RETURN () { 1; }") unless defined(&FAIL_POINT_RC_RETURN);
    eval("sub FAIL_POINT_RC_QUEUED () { 2; }") unless defined(&FAIL_POINT_RC_QUEUED);
    eval 'sub FAIL_POINT_DYNAMIC_NAME () {0x1;}' unless defined(&FAIL_POINT_DYNAMIC_NAME);
    eval 'sub FAIL_POINT_USE_TIMEOUT_PATH () {0x2;}' unless defined(&FAIL_POINT_USE_TIMEOUT_PATH);
    eval 'sub FAIL_POINT_NONSLEEPABLE () {0x4;}' unless defined(&FAIL_POINT_NONSLEEPABLE);
    eval 'sub FAIL_POINT_CV_DESC () {"fp cv no iterators";}' unless defined(&FAIL_POINT_CV_DESC);
    eval 'sub FAIL_POINT_IS_OFF {
        my($fp) = @_;
	    eval q(( &__predict_true(($fp)-> &fp_setting ==  &NULL) ||  &__predict_true( &fail_point_is_off($fp))));
    }' unless defined(&FAIL_POINT_IS_OFF);
    eval 'sub fail_point_sleep_set_pre_arg {
        my($fp,$sleep_arg) = @_;
	    eval q({  ($fp->{fp_pre_sleep_arg}) = $sleep_arg; });
    }' unless defined(&fail_point_sleep_set_pre_arg);
    eval 'sub fail_point_sleep_set_post_arg {
        my($fp,$sleep_arg) = @_;
	    eval q({  ($fp->{fp_post_sleep_arg}) = $sleep_arg; });
    }' unless defined(&fail_point_sleep_set_post_arg);
    eval 'sub KFAIL_POINT_DECLARE {
        my($name) = @_;
	    eval q( &extern \'struct fail_point\'  &_FAIL_POINT_NAME($name));
    }' unless defined(&KFAIL_POINT_DECLARE);
    eval 'sub _FAIL_POINT_NAME {
        my($name) = @_;
	    eval q( &_fail_point_$name);
    }' unless defined(&_FAIL_POINT_NAME);
    eval 'sub _FAIL_POINT_LOCATION () {
        eval q(\\"(\\"  &__FILE__ \\":\\"  &__XSTRING( &__LINE__) \\")\\");
    }' unless defined(&_FAIL_POINT_LOCATION);
    eval 'sub KFAIL_POINT_DEFINE {
        my($parent, $name, $flags) = @_;
	    eval q(\'struct fail_point\'  &_FAIL_POINT_NAME($name) = { . &fp_name = $name, . &fp_location =  &_FAIL_POINT_LOCATION(), . &fp_ref_cnt = 0, . &fp_setting =  &NULL, . &fp_flags = ($flags), . &fp_pre_sleep_fn =  &NULL, . &fp_pre_sleep_arg =  &NULL, . &fp_post_sleep_fn =  &NULL, . &fp_post_sleep_arg =  &NULL, };  &SYSCTL_OID($parent,  &OID_AUTO, $name,  &CTLTYPE_STRING |  &CTLFLAG_RW |  &CTLFLAG_MPSAFE, & &_FAIL_POINT_NAME($name), 0,  &fail_point_sysctl, \\"A\\", \\"\\");  &SYSCTL_OID($parent,  &OID_AUTO,  &status_$name,  &CTLTYPE_STRING |  &CTLFLAG_RD |  &CTLFLAG_MPSAFE, & &_FAIL_POINT_NAME($name), 0,  &fail_point_sysctl_status, \\"A\\", \\"\\"););
    }' unless defined(&KFAIL_POINT_DEFINE);
    eval 'sub _FAIL_POINT_INIT {
        my($parent, $name, $flags) = @_;
	    eval q( &static  &KFAIL_POINT_DEFINE($parent, $name, $flags));
    }' unless defined(&_FAIL_POINT_INIT);
    eval 'sub _FAIL_POINT_EVAL () {( &name,  &cond,  &code...) \'int\'  &RETURN_VALUE;  &if ( &__predict_false( &cond  &&  &fail_point_eval(& &_FAIL_POINT_NAME( &name),  &RETURN_VALUE))) {  &code; };}' unless defined(&_FAIL_POINT_EVAL);
    eval 'sub KFAIL_POINT_EVAL () {( &name,  &code...)  &_FAIL_POINT_EVAL( &name,  &true,  &code);}' unless defined(&KFAIL_POINT_EVAL);
    eval 'sub KFAIL_POINT_RETURN {
        my($parent, $name) = @_;
	    eval q( &KFAIL_POINT_CODE($parent, $name,  &return  &RETURN_VALUE));
    }' unless defined(&KFAIL_POINT_RETURN);
    eval 'sub KFAIL_POINT_RETURN_VOID {
        my($parent, $name) = @_;
	    eval q( &KFAIL_POINT_CODE($parent, $name,  &return));
    }' unless defined(&KFAIL_POINT_RETURN_VOID);
    eval 'sub KFAIL_POINT_ERROR {
        my($parent, $name, $error_var) = @_;
	    eval q( &KFAIL_POINT_CODE($parent, $name, ($error_var) =  &RETURN_VALUE));
    }' unless defined(&KFAIL_POINT_ERROR);
    eval 'sub KFAIL_POINT_GOTO {
        my($parent, $name, $error_var, $label) = @_;
	    eval q( &KFAIL_POINT_CODE($parent, $name, ($error_var) =  &RETURN_VALUE;  &goto $label));
    }' unless defined(&KFAIL_POINT_GOTO);
    eval 'sub KFAIL_POINT_SLEEP_CALLBACKS {
        my($parent, $name, $pre_func, $pre_arg,	 $post_func, $post_arg) = @_;
	    eval q( &KFAIL_POINT_CODE_SLEEP_CALLBACKS($parent, $name, $pre_func, $pre_arg, $post_func, $post_arg,  &return  &RETURN_VALUE));
    }' unless defined(&KFAIL_POINT_SLEEP_CALLBACKS);
    eval 'sub KFAIL_POINT_CODE_SLEEP_CALLBACKS () {( &parent,  &name,  &pre_func,  &pre_arg,  &post_func,  &post_arg,  &code...)  &do {  &_FAIL_POINT_INIT( &parent,  &name)  &_FAIL_POINT_NAME( &name). &fp_pre_sleep_fn =  &pre_func;  &_FAIL_POINT_NAME( &name). &fp_pre_sleep_arg =  &pre_arg;  &_FAIL_POINT_NAME( &name). &fp_post_sleep_fn =  &post_func;  &_FAIL_POINT_NAME( &name). &fp_post_sleep_arg =  &post_arg;  &_FAIL_POINT_EVAL( &name,  &true,  &code) }  &while (0);}' unless defined(&KFAIL_POINT_CODE_SLEEP_CALLBACKS);
    eval 'sub KFAIL_POINT_CODE () {( &parent,  &name,  &code...)  &do {  &_FAIL_POINT_INIT( &parent,  &name, 0)  &_FAIL_POINT_EVAL( &name,  &true,  &code) }  &while (0);}' unless defined(&KFAIL_POINT_CODE);
    eval 'sub KFAIL_POINT_CODE_FLAGS () {( &parent,  &name,  &flags,  &code...)  &do {  &_FAIL_POINT_INIT( &parent,  &name,  &flags)  &_FAIL_POINT_EVAL( &name,  &true,  &code) }  &while (0);}' unless defined(&KFAIL_POINT_CODE_FLAGS);
    eval 'sub KFAIL_POINT_CODE_COND () {( &parent,  &name,  &cond,  &flags,  &code...)  &do {  &_FAIL_POINT_INIT( &parent,  &name,  &flags)  &_FAIL_POINT_EVAL( &name,  &cond,  &code) }  &while (0);}' unless defined(&KFAIL_POINT_CODE_COND);
    if(defined(&_KERNEL)) {
	eval 'sub DEBUG_FP () { &_debug_fail_point;}' unless defined(&DEBUG_FP);
    }
}
1;

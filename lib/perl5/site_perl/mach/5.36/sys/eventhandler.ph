require '_h2ph_pre.ph';

no warnings qw(redefine misc);

unless(defined(&_SYS_EVENTHANDLER_H_)) {
    eval 'sub _SYS_EVENTHANDLER_H_ () {1;}' unless defined(&_SYS_EVENTHANDLER_H_);
    require 'sys/_eventhandler.ph';
    require 'sys/lock.ph';
    require 'sys/ktr.ph';
    require 'sys/mutex.ph';
    require 'sys/queue.ph';
    if(defined(&VIMAGE)) {
    }
    eval 'sub EHL_LOCK {
        my($p) = @_;
	    eval q( &mtx_lock(($p)-> &el_lock));
    }' unless defined(&EHL_LOCK);
    eval 'sub EHL_UNLOCK {
        my($p) = @_;
	    eval q( &mtx_unlock(($p)-> &el_lock));
    }' unless defined(&EHL_UNLOCK);
    eval 'sub EHL_LOCK_ASSERT {
        my($p, $x) = @_;
	    eval q( &mtx_assert(($p)-> &el_lock, $x));
    }' unless defined(&EHL_LOCK_ASSERT);
    eval 'sub _EVENTHANDLER_INVOKE () {( &name,  &list, ...)  &do { \'struct eventhandler_entry\' * &_ep; \'struct eventhandler_entry_\'   &name * &_t;  &EHL_LOCK_ASSERT(( &list),  &MA_OWNED); ( &list)-> &el_runcount++;  &KASSERT(( &list)-> &el_runcount > 0, ("eventhandler_invoke: runcount overflow"));  &CTR0( &KTR_EVH, "eventhandler_invoke(\\""  &__STRING( &name) "\\")");  &TAILQ_FOREACH( &_ep, (( &list)-> &el_entries),  &ee_link) {  &if ( ($_ep->{ee_priority}) !=  &EHE_DEAD_PRIORITY) {  &EHL_UNLOCK(( &list));  &_t = (\'struct eventhandler_entry_\'   &name *) &_ep;  &CTR1( &KTR_EVH, "eventhandler_invoke: executing %p", ( &void *) ($_t->{eh_func}));  ($_t->{eh_func})( ($_ep->{ee_arg}) ,   &__VA_ARGS__);  &EHL_LOCK(( &list)); } }  &KASSERT(( &list)-> &el_runcount > 0, ("eventhandler_invoke: runcount underflow")); ( &list)-> &el_runcount--;  &if (( &list)-> &el_runcount == 0)  &eventhandler_prune_list( &list);  &EHL_UNLOCK(( &list)); }  &while (0);}' unless defined(&_EVENTHANDLER_INVOKE);
    eval 'sub EVENTHANDLER_LIST_DEFINE {
        my($name) = @_;
	    eval q(\'struct eventhandler_list\' * &_eventhandler_list_  $name ;  &static  &void  &_ehl_init_  $name ( &void *  &ctx  &__unused) {  &_eventhandler_list_  $name =  &eventhandler_create_list($name); }  &SYSINIT($name   &_ehl_init,  &SI_SUB_EVENTHANDLER,  &SI_ORDER_ANY,  &_ehl_init_  $name,  &NULL); \'struct __hack\');
    }' unless defined(&EVENTHANDLER_LIST_DEFINE);
    eval 'sub EVENTHANDLER_DIRECT_INVOKE () {( &name, ...)  &do { \'struct eventhandler_list\' * &_el;  &_el =  &_eventhandler_list_   &name ;  &if (! &TAILQ_EMPTY(& ($_el->{el_entries}))) {  &EHL_LOCK( &_el);  &_EVENTHANDLER_INVOKE( &name,  &_el ,   &__VA_ARGS__); } }  &while (0);}' unless defined(&EVENTHANDLER_DIRECT_INVOKE);
    eval 'sub EVENTHANDLER_DEFINE {
        my($name, $func, $arg, $priority) = @_;
	    eval q( &static  &eventhandler_tag $name   &_tag;  &static  &void $name   &_evh_init( &void * &ctx) { $name   &_tag =  &EVENTHANDLER_REGISTER($name, $func,  &ctx, $priority); }  &SYSINIT($name   &_evh_init,  &SI_SUB_CONFIGURE,  &SI_ORDER_ANY, $name   &_evh_init, $arg); \'struct __hack\');
    }' unless defined(&EVENTHANDLER_DEFINE);
    eval 'sub EVENTHANDLER_INVOKE () {( &name, ...)  &do { \'struct eventhandler_list\' * &_el;  &if (( &_el =  &eventhandler_find_list( &name)) !=  &NULL)  &_EVENTHANDLER_INVOKE( &name,  &_el ,   &__VA_ARGS__); }  &while (0);}' unless defined(&EVENTHANDLER_INVOKE);
    eval 'sub EVENTHANDLER_REGISTER {
        my($name, $func, $arg, $priority) = @_;
	    eval q( &eventhandler_register( &NULL, $name, $func, $arg, $priority));
    }' unless defined(&EVENTHANDLER_REGISTER);
    eval 'sub EVENTHANDLER_DEREGISTER {
        my($name, $tag) = @_;
	    eval q( &do { \'struct eventhandler_list\' * &_el;  &if (( &_el =  &eventhandler_find_list($name)) !=  &NULL)  &eventhandler_deregister( &_el, $tag); }  &while (0));
    }' unless defined(&EVENTHANDLER_DEREGISTER);
    eval 'sub EVENTHANDLER_DEREGISTER_NOWAIT {
        my($name, $tag) = @_;
	    eval q( &do { \'struct eventhandler_list\' * &_el;  &if (( &_el =  &eventhandler_find_list($name)) !=  &NULL)  &eventhandler_deregister_nowait( &_el, $tag); }  &while (0));
    }' unless defined(&EVENTHANDLER_DEREGISTER_NOWAIT);
    if(defined(&VIMAGE)) {
    }
    eval 'sub EVENTHANDLER_PRI_FIRST () {0;}' unless defined(&EVENTHANDLER_PRI_FIRST);
    eval 'sub EVENTHANDLER_PRI_ANY () {10000;}' unless defined(&EVENTHANDLER_PRI_ANY);
    eval 'sub EVENTHANDLER_PRI_LAST () {20000;}' unless defined(&EVENTHANDLER_PRI_LAST);
    eval 'sub SHUTDOWN_PRI_FIRST () { &EVENTHANDLER_PRI_FIRST;}' unless defined(&SHUTDOWN_PRI_FIRST);
    eval 'sub SHUTDOWN_PRI_DEFAULT () { &EVENTHANDLER_PRI_ANY;}' unless defined(&SHUTDOWN_PRI_DEFAULT);
    eval 'sub SHUTDOWN_PRI_LAST () { &EVENTHANDLER_PRI_LAST;}' unless defined(&SHUTDOWN_PRI_LAST);
    eval 'sub LOWMEM_PRI_DEFAULT () { &EVENTHANDLER_PRI_FIRST;}' unless defined(&LOWMEM_PRI_DEFAULT);
    eval("sub EVHDEV_DETACH_BEGIN () { 0; }") unless defined(&EVHDEV_DETACH_BEGIN);
    eval("sub EVHDEV_DETACH_COMPLETE () { 1; }") unless defined(&EVHDEV_DETACH_COMPLETE);
    eval("sub EVHDEV_DETACH_FAILED () { 2; }") unless defined(&EVHDEV_DETACH_FAILED);
}
1;

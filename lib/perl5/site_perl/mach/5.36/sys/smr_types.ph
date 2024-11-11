require '_h2ph_pre.ph';

no warnings qw(redefine misc);

unless(defined(&_SYS_SMR_TYPES_H_)) {
    eval 'sub _SYS_SMR_TYPES_H_ () {1;}' unless defined(&_SYS_SMR_TYPES_H_);
    require 'sys/_smr.ph';
    eval 'sub SMR_POINTER {
        my($type) = @_;
	    eval q(\'struct struct\' { $type  &__ptr; });
    }' unless defined(&SMR_POINTER);
    eval 'sub smr_entered_load {
        my($p, $smr) = @_;
	    eval q(({  &SMR_ASSERT( &SMR_ENTERED(($smr)), \\"smr_entered_load\\"); ( &__typeof(($p)-> &__ptr)) &atomic_load_acq_ptr(( &uintptr_t *)($p)-> &__ptr); }));
    }' unless defined(&smr_entered_load);
    eval 'sub smr_serialized_load {
        my($p, $ex) = @_;
	    eval q(({  &SMR_ASSERT($ex, \\"smr_serialized_load\\"); ( &__typeof(($p)-> &__ptr)) &atomic_load_ptr(($p)-> &__ptr); }));
    }' unless defined(&smr_serialized_load);
    eval 'sub smr_serialized_store {
        my($p, $v, $ex) = @_;
	    eval q( &do {  &SMR_ASSERT($ex, \\"smr_serialized_store\\");  &__typeof(($p)-> &__ptr)  &_v = ($v);  &atomic_store_rel_ptr(( &uintptr_t *)($p)-> &__ptr, ( &uintptr_t) &_v); }  &while (0));
    }' unless defined(&smr_serialized_store);
    eval 'sub smr_serialized_swap {
        my($p, $v, $ex) = @_;
	    eval q(({  &SMR_ASSERT($ex, \\"smr_serialized_swap\\");  &__typeof(($p)-> &__ptr)  &_v = ($v);  &atomic_thread_fence_rel(); ( &__typeof(($p)-> &__ptr)) &atomic_swap_ptr( ( &uintptr_t *)($p)-> &__ptr, ( &uintptr_t) &_v); }));
    }' unless defined(&smr_serialized_swap);
    eval 'sub smr_unserialized_load {
        my($p, $ex) = @_;
	    eval q(({  &SMR_ASSERT($ex, \\"smr_unserialized_load\\"); ( &__typeof(($p)-> &__ptr)) &atomic_load_ptr(($p)-> &__ptr); }));
    }' unless defined(&smr_unserialized_load);
    eval 'sub smr_unserialized_store {
        my($p, $v, $ex) = @_;
	    eval q( &do {  &SMR_ASSERT($ex, \\"smr_unserialized_store\\");  &__typeof(($p)-> &__ptr)  &_v = ($v);  &atomic_store_ptr(( &uintptr_t *)($p)-> &__ptr, ( &uintptr_t) &_v); }  &while (0));
    }' unless defined(&smr_unserialized_store);
    unless(defined(&_KERNEL)) {
	eval 'sub smr_kvm_load {
	    my($p) = @_;
    	    eval q((($p)-> &__ptr));
	}' unless defined(&smr_kvm_load);
    }
}
1;

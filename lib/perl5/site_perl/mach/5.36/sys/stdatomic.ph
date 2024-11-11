require '_h2ph_pre.ph';

no warnings qw(redefine misc);

unless(defined(&_STDATOMIC_H_)) {
    eval 'sub _STDATOMIC_H_ () {1;}' unless defined(&_STDATOMIC_H_);
    require 'sys/cdefs.ph';
    require 'sys/_types.ph';
    if( &__has_extension((defined(&c_atomic) ? &c_atomic : undef)) ||  &__has_extension((defined(&cxx_atomic) ? &cxx_atomic : undef))) {
	eval 'sub __CLANG_ATOMICS () {1;}' unless defined(&__CLANG_ATOMICS);
    }
 elsif( &__GNUC_PREREQ__(4, 7)) {
	eval 'sub __GNUC_ATOMICS () {1;}' unless defined(&__GNUC_ATOMICS);
    }
 elsif(defined(&__GNUC__)) {
	eval 'sub __SYNC_ATOMICS () {1;}' unless defined(&__SYNC_ATOMICS);
    } else {
	die("stdatomic.h does not support your compiler");
    }
    if(defined(&__GCC_ATOMIC_BOOL_LOCK_FREE)) {
	eval 'sub ATOMIC_BOOL_LOCK_FREE () { &__GCC_ATOMIC_BOOL_LOCK_FREE;}' unless defined(&ATOMIC_BOOL_LOCK_FREE);
    }
    if(defined(&__GCC_ATOMIC_CHAR_LOCK_FREE)) {
	eval 'sub ATOMIC_CHAR_LOCK_FREE () { &__GCC_ATOMIC_CHAR_LOCK_FREE;}' unless defined(&ATOMIC_CHAR_LOCK_FREE);
    }
    if(defined(&__GCC_ATOMIC_CHAR16_T_LOCK_FREE)) {
	eval 'sub ATOMIC_CHAR16_T_LOCK_FREE () { &__GCC_ATOMIC_CHAR16_T_LOCK_FREE;}' unless defined(&ATOMIC_CHAR16_T_LOCK_FREE);
    }
    if(defined(&__GCC_ATOMIC_CHAR32_T_LOCK_FREE)) {
	eval 'sub ATOMIC_CHAR32_T_LOCK_FREE () { &__GCC_ATOMIC_CHAR32_T_LOCK_FREE;}' unless defined(&ATOMIC_CHAR32_T_LOCK_FREE);
    }
    if(defined(&__GCC_ATOMIC_WCHAR_T_LOCK_FREE)) {
	eval 'sub ATOMIC_WCHAR_T_LOCK_FREE () { &__GCC_ATOMIC_WCHAR_T_LOCK_FREE;}' unless defined(&ATOMIC_WCHAR_T_LOCK_FREE);
    }
    if(defined(&__GCC_ATOMIC_SHORT_LOCK_FREE)) {
	eval 'sub ATOMIC_SHORT_LOCK_FREE () { &__GCC_ATOMIC_SHORT_LOCK_FREE;}' unless defined(&ATOMIC_SHORT_LOCK_FREE);
    }
    if(defined(&__GCC_ATOMIC_INT_LOCK_FREE)) {
	eval 'sub ATOMIC_INT_LOCK_FREE () { &__GCC_ATOMIC_INT_LOCK_FREE;}' unless defined(&ATOMIC_INT_LOCK_FREE);
    }
    if(defined(&__GCC_ATOMIC_LONG_LOCK_FREE)) {
	eval 'sub ATOMIC_LONG_LOCK_FREE () { &__GCC_ATOMIC_LONG_LOCK_FREE;}' unless defined(&ATOMIC_LONG_LOCK_FREE);
    }
    if(defined(&__GCC_ATOMIC_LLONG_LOCK_FREE)) {
	eval 'sub ATOMIC_LLONG_LOCK_FREE () { &__GCC_ATOMIC_LLONG_LOCK_FREE;}' unless defined(&ATOMIC_LLONG_LOCK_FREE);
    }
    if(defined(&__GCC_ATOMIC_POINTER_LOCK_FREE)) {
	eval 'sub ATOMIC_POINTER_LOCK_FREE () { &__GCC_ATOMIC_POINTER_LOCK_FREE;}' unless defined(&ATOMIC_POINTER_LOCK_FREE);
    }
    if(defined(&__CLANG_ATOMICS)) {
	eval 'sub ATOMIC_VAR_INIT {
	    my($value) = @_;
    	    eval q(($value));
	}' unless defined(&ATOMIC_VAR_INIT);
	eval 'sub atomic_init {
	    my($obj, $value) = @_;
    	    eval q( &__c11_atomic_init($obj, $value));
	}' unless defined(&atomic_init);
    } else {
	eval 'sub ATOMIC_VAR_INIT {
	    my($value) = @_;
    	    eval q({ . &__val = ($value) });
	}' unless defined(&ATOMIC_VAR_INIT);
	eval 'sub atomic_init {
	    my($obj, $value) = @_;
    	    eval q((( &void)(($obj)-> &__val = ($value))));
	}' unless defined(&atomic_init);
    }
    unless(defined(&__ATOMIC_RELAXED)) {
	eval 'sub __ATOMIC_RELAXED () {0;}' unless defined(&__ATOMIC_RELAXED);
    }
    unless(defined(&__ATOMIC_CONSUME)) {
	eval 'sub __ATOMIC_CONSUME () {1;}' unless defined(&__ATOMIC_CONSUME);
    }
    unless(defined(&__ATOMIC_ACQUIRE)) {
	eval 'sub __ATOMIC_ACQUIRE () {2;}' unless defined(&__ATOMIC_ACQUIRE);
    }
    unless(defined(&__ATOMIC_RELEASE)) {
	eval 'sub __ATOMIC_RELEASE () {3;}' unless defined(&__ATOMIC_RELEASE);
    }
    unless(defined(&__ATOMIC_ACQ_REL)) {
	eval 'sub __ATOMIC_ACQ_REL () {4;}' unless defined(&__ATOMIC_ACQ_REL);
    }
    unless(defined(&__ATOMIC_SEQ_CST)) {
	eval 'sub __ATOMIC_SEQ_CST () {5;}' unless defined(&__ATOMIC_SEQ_CST);
    }
    eval("sub memory_order_relaxed () { __ATOMIC_RELAXED; }") unless defined(&memory_order_relaxed);
    eval("sub memory_order_consume () { __ATOMIC_CONSUME; }") unless defined(&memory_order_consume);
    eval("sub memory_order_acquire () { __ATOMIC_ACQUIRE; }") unless defined(&memory_order_acquire);
    eval("sub memory_order_release () { __ATOMIC_RELEASE; }") unless defined(&memory_order_release);
    eval("sub memory_order_acq_rel () { __ATOMIC_ACQ_REL; }") unless defined(&memory_order_acq_rel);
    eval("sub memory_order_seq_cst () { __ATOMIC_SEQ_CST; }") unless defined(&memory_order_seq_cst);
    if(defined(&__CLANG_ATOMICS)) {
    }
 elsif(defined(&__GNUC_ATOMICS)) {
    } else {
    }
# some #ifdef were dropped here -- fill in the blanks
    eval 'sub atomic_signal_fence {
        my($__unused) = @_;
	    eval q({ });
    }' unless defined(&atomic_signal_fence);
    if(defined(&__cplusplus)  && !defined(&_Bool)) {
	eval 'sub _Bool () { &bool;}' unless defined(&_Bool);
	eval 'sub __bool_locally_defined () {1;}' unless defined(&__bool_locally_defined);
    }
    if(defined(&_KERNEL)) {
	eval 'sub atomic_is_lock_free {
	    my($obj) = @_;
    	    eval q((( &void)($obj), ( &_Bool)1));
	}' unless defined(&atomic_is_lock_free);
    }
 elsif(defined(&__CLANG_ATOMICS) || defined(&__GNUC_ATOMICS)) {
	eval 'sub atomic_is_lock_free {
	    my($obj) = @_;
    	    eval q( &__atomic_is_lock_free($sizeof{($obj)}, $obj));
	}' unless defined(&atomic_is_lock_free);
    } else {
	eval 'sub atomic_is_lock_free {
	    my($obj) = @_;
    	    eval q((( &void)($obj), $sizeof{($obj)-> &__val} <= $sizeof{ &void }));
	}' unless defined(&atomic_is_lock_free);
    }
    if(defined(&__CLANG_ATOMICS)) {
	eval 'sub atomic_compare_exchange_strong_explicit {
	    my($object, $expected,	    $desired, $success, $failure) = @_;
    	    eval q( &__c11_atomic_compare_exchange_strong($object, $expected, $desired, $success, $failure));
	}' unless defined(&atomic_compare_exchange_strong_explicit);
	eval 'sub atomic_compare_exchange_weak_explicit {
	    my($object, $expected,		    $desired, $success, $failure) = @_;
    	    eval q( &__c11_atomic_compare_exchange_weak($object, $expected, $desired, $success, $failure));
	}' unless defined(&atomic_compare_exchange_weak_explicit);
	eval 'sub atomic_exchange_explicit {
	    my($object, $desired, $order) = @_;
    	    eval q( &__c11_atomic_exchange($object, $desired, $order));
	}' unless defined(&atomic_exchange_explicit);
	eval 'sub atomic_fetch_add_explicit {
	    my($object, $operand, $order) = @_;
    	    eval q( &__c11_atomic_fetch_add($object, $operand, $order));
	}' unless defined(&atomic_fetch_add_explicit);
	eval 'sub atomic_fetch_and_explicit {
	    my($object, $operand, $order) = @_;
    	    eval q( &__c11_atomic_fetch_and($object, $operand, $order));
	}' unless defined(&atomic_fetch_and_explicit);
	eval 'sub atomic_fetch_or_explicit {
	    my($object, $operand, $order) = @_;
    	    eval q( &__c11_atomic_fetch_or($object, $operand, $order));
	}' unless defined(&atomic_fetch_or_explicit);
	eval 'sub atomic_fetch_sub_explicit {
	    my($object, $operand, $order) = @_;
    	    eval q( &__c11_atomic_fetch_sub($object, $operand, $order));
	}' unless defined(&atomic_fetch_sub_explicit);
	eval 'sub atomic_fetch_xor_explicit {
	    my($object, $operand, $order) = @_;
    	    eval q( &__c11_atomic_fetch_xor($object, $operand, $order));
	}' unless defined(&atomic_fetch_xor_explicit);
	eval 'sub atomic_load_explicit {
	    my($object, $order) = @_;
    	    eval q( &__c11_atomic_load($object, $order));
	}' unless defined(&atomic_load_explicit);
	eval 'sub atomic_store_explicit {
	    my($object, $desired, $order) = @_;
    	    eval q( &__c11_atomic_store($object, $desired, $order));
	}' unless defined(&atomic_store_explicit);
    }
 elsif(defined(&__GNUC_ATOMICS)) {
	eval 'sub atomic_compare_exchange_strong_explicit {
	    my($object, $expected,	    $desired, $success, $failure) = @_;
    	    eval q( &__atomic_compare_exchange_n($object, $expected, $desired, 0, $success, $failure));
	}' unless defined(&atomic_compare_exchange_strong_explicit);
	eval 'sub atomic_compare_exchange_weak_explicit {
	    my($object, $expected,		    $desired, $success, $failure) = @_;
    	    eval q( &__atomic_compare_exchange_n($object, $expected, $desired, 1, $success, $failure));
	}' unless defined(&atomic_compare_exchange_weak_explicit);
	eval 'sub atomic_exchange_explicit {
	    my($object, $desired, $order) = @_;
    	    eval q( &__atomic_exchange_n($object, $desired, $order));
	}' unless defined(&atomic_exchange_explicit);
	eval 'sub atomic_fetch_add_explicit {
	    my($object, $operand, $order) = @_;
    	    eval q( &__atomic_fetch_add($object, $operand, $order));
	}' unless defined(&atomic_fetch_add_explicit);
	eval 'sub atomic_fetch_and_explicit {
	    my($object, $operand, $order) = @_;
    	    eval q( &__atomic_fetch_and($object, $operand, $order));
	}' unless defined(&atomic_fetch_and_explicit);
	eval 'sub atomic_fetch_or_explicit {
	    my($object, $operand, $order) = @_;
    	    eval q( &__atomic_fetch_or($object, $operand, $order));
	}' unless defined(&atomic_fetch_or_explicit);
	eval 'sub atomic_fetch_sub_explicit {
	    my($object, $operand, $order) = @_;
    	    eval q( &__atomic_fetch_sub($object, $operand, $order));
	}' unless defined(&atomic_fetch_sub_explicit);
	eval 'sub atomic_fetch_xor_explicit {
	    my($object, $operand, $order) = @_;
    	    eval q( &__atomic_fetch_xor($object, $operand, $order));
	}' unless defined(&atomic_fetch_xor_explicit);
	eval 'sub atomic_load_explicit {
	    my($object, $order) = @_;
    	    eval q( &__atomic_load_n($object, $order));
	}' unless defined(&atomic_load_explicit);
	eval 'sub atomic_store_explicit {
	    my($object, $desired, $order) = @_;
    	    eval q( &__atomic_store_n($object, $desired, $order));
	}' unless defined(&atomic_store_explicit);
    } else {
	eval 'sub __atomic_apply_stride {
	    my($object, $operand) = @_;
    	    eval q(((( &__typeof__(($object)-> &__val))0) + ($operand)));
	}' unless defined(&__atomic_apply_stride);
	eval 'sub atomic_compare_exchange_strong_explicit {
	    my($object, $expected,	    $desired, $success, $failure) = @_;
    	    eval q( &__extension__ ({  &__typeof__($expected)  &__ep = ($expected);  &__typeof__(* &__ep)  &__e = * &__ep; ( &void)($success); ( &void)($failure); ( &_Bool)((* &__ep =  &__sync_val_compare_and_swap(($object)-> &__val,  &__e, $desired)) ==  &__e); }));
	}' unless defined(&atomic_compare_exchange_strong_explicit);
	eval 'sub atomic_compare_exchange_weak_explicit {
	    my($object, $expected,		    $desired, $success, $failure) = @_;
    	    eval q( &atomic_compare_exchange_strong_explicit($object, $expected, $desired, $success, $failure));
	}' unless defined(&atomic_compare_exchange_weak_explicit);
	if( &__has_builtin((defined(&__sync_swap) ? &__sync_swap : undef))) {
	    eval 'sub atomic_exchange_explicit {
	        my($object, $desired, $order) = @_;
    		eval q((( &void)($order),  &__sync_swap(($object)-> &__val, $desired)));
	    }' unless defined(&atomic_exchange_explicit);
	} else {
	    eval 'sub atomic_exchange_explicit {
	        my($object, $desired, $order) = @_;
    		eval q( &__extension__ ({  &__typeof__($object)  &__o = ($object);  &__typeof__($desired)  &__d = ($desired); ( &void)($order);  &__sync_synchronize();  &__sync_lock_test_and_set(( &__o)-> &__val,  &__d); }));
	    }' unless defined(&atomic_exchange_explicit);
	}
	eval 'sub atomic_fetch_add_explicit {
	    my($object, $operand, $order) = @_;
    	    eval q((( &void)($order),  &__sync_fetch_and_add(($object)-> &__val,  &__atomic_apply_stride($object, $operand))));
	}' unless defined(&atomic_fetch_add_explicit);
	eval 'sub atomic_fetch_and_explicit {
	    my($object, $operand, $order) = @_;
    	    eval q((( &void)($order),  &__sync_fetch_and_and(($object)-> &__val, $operand)));
	}' unless defined(&atomic_fetch_and_explicit);
	eval 'sub atomic_fetch_or_explicit {
	    my($object, $operand, $order) = @_;
    	    eval q((( &void)($order),  &__sync_fetch_and_or(($object)-> &__val, $operand)));
	}' unless defined(&atomic_fetch_or_explicit);
	eval 'sub atomic_fetch_sub_explicit {
	    my($object, $operand, $order) = @_;
    	    eval q((( &void)($order),  &__sync_fetch_and_sub(($object)-> &__val,  &__atomic_apply_stride($object, $operand))));
	}' unless defined(&atomic_fetch_sub_explicit);
	eval 'sub atomic_fetch_xor_explicit {
	    my($object, $operand, $order) = @_;
    	    eval q((( &void)($order),  &__sync_fetch_and_xor(($object)-> &__val, $operand)));
	}' unless defined(&atomic_fetch_xor_explicit);
	eval 'sub atomic_load_explicit {
	    my($object, $order) = @_;
    	    eval q((( &void)($order),  &__sync_fetch_and_add(($object)-> &__val, 0)));
	}' unless defined(&atomic_load_explicit);
	eval 'sub atomic_store_explicit {
	    my($object, $desired, $order) = @_;
    	    eval q((( &void) &atomic_exchange_explicit($object, $desired, $order)));
	}' unless defined(&atomic_store_explicit);
    }
    unless(defined(&_KERNEL)) {
	eval 'sub atomic_compare_exchange_strong {
	    my($object, $expected, $desired) = @_;
    	    eval q( &atomic_compare_exchange_strong_explicit($object, $expected, $desired,  &memory_order_seq_cst,  &memory_order_seq_cst));
	}' unless defined(&atomic_compare_exchange_strong);
	eval 'sub atomic_compare_exchange_weak {
	    my($object, $expected, $desired) = @_;
    	    eval q( &atomic_compare_exchange_weak_explicit($object, $expected, $desired,  &memory_order_seq_cst,  &memory_order_seq_cst));
	}' unless defined(&atomic_compare_exchange_weak);
	eval 'sub atomic_exchange {
	    my($object, $desired) = @_;
    	    eval q( &atomic_exchange_explicit($object, $desired,  &memory_order_seq_cst));
	}' unless defined(&atomic_exchange);
	eval 'sub atomic_fetch_add {
	    my($object, $operand) = @_;
    	    eval q( &atomic_fetch_add_explicit($object, $operand,  &memory_order_seq_cst));
	}' unless defined(&atomic_fetch_add);
	eval 'sub atomic_fetch_and {
	    my($object, $operand) = @_;
    	    eval q( &atomic_fetch_and_explicit($object, $operand,  &memory_order_seq_cst));
	}' unless defined(&atomic_fetch_and);
	eval 'sub atomic_fetch_or {
	    my($object, $operand) = @_;
    	    eval q( &atomic_fetch_or_explicit($object, $operand,  &memory_order_seq_cst));
	}' unless defined(&atomic_fetch_or);
	eval 'sub atomic_fetch_sub {
	    my($object, $operand) = @_;
    	    eval q( &atomic_fetch_sub_explicit($object, $operand,  &memory_order_seq_cst));
	}' unless defined(&atomic_fetch_sub);
	eval 'sub atomic_fetch_xor {
	    my($object, $operand) = @_;
    	    eval q( &atomic_fetch_xor_explicit($object, $operand,  &memory_order_seq_cst));
	}' unless defined(&atomic_fetch_xor);
	eval 'sub atomic_load {
	    my($object) = @_;
    	    eval q( &atomic_load_explicit($object,  &memory_order_seq_cst));
	}' unless defined(&atomic_load);
	eval 'sub atomic_store {
	    my($object, $desired) = @_;
    	    eval q( &atomic_store_explicit($object, $desired,  &memory_order_seq_cst));
	}' unless defined(&atomic_store);
    }
    eval 'sub ATOMIC_FLAG_INIT () {{  &ATOMIC_VAR_INIT(0) };}' unless defined(&ATOMIC_FLAG_INIT);
    eval 'sub atomic_flag_test_and_set_explicit {
        my($__object,$__order) = @_;
	    eval q({ ( &atomic_exchange_explicit(& ($__object->{__flag}), 1, $__order)); });
    }' unless defined(&atomic_flag_test_and_set_explicit);
    eval 'sub atomic_flag_clear_explicit {
        my($__object,$__order) = @_;
	    eval q({  &atomic_store_explicit(& ($__object->{__flag}), 0, $__order); });
    }' unless defined(&atomic_flag_clear_explicit);
    unless(defined(&_KERNEL)) {
	eval 'sub atomic_flag_test_and_set {
	    my($__object) = @_;
    	    eval q({ ( &atomic_flag_test_and_set_explicit($__object,  &memory_order_seq_cst)); });
	}' unless defined(&atomic_flag_test_and_set);
	eval 'sub atomic_flag_clear {
	    my($__object) = @_;
    	    eval q({  &atomic_flag_clear_explicit($__object,  &memory_order_seq_cst); });
	}' unless defined(&atomic_flag_clear);
    }
    if(defined(&__bool_locally_defined)) {
	undef(&_Bool) if defined(&_Bool);
	undef(&__bool_locally_defined) if defined(&__bool_locally_defined);
    }
}
1;

require '_h2ph_pre.ph';

no warnings qw(redefine misc);

unless(defined(&_SYS_KASSERT_H_)) {
    eval 'sub _SYS_KASSERT_H_ () {1;}' unless defined(&_SYS_KASSERT_H_);
    require 'sys/cdefs.ph';
    if(defined(&_KERNEL)) {
	eval 'sub KERNEL_PANICKED () {
	    eval q( &__predict_false( &panicked));
	}' unless defined(&KERNEL_PANICKED);
	if(defined(&INVARIANTS)) {
	    eval 'sub VNASSERT {
	        my($exp, $vp, $msg) = @_;
    		eval q( &do {  &if ( &__predict_false(!($exp))) {  &vn_printf($vp, \\"VNASSERT failed: %s not true at %s:%d (%s)\\\\n\\", $exp,  &__FILE__,  &__LINE__,  &__func__);  &kassert_panic $msg; } }  &while (0));
	    }' unless defined(&VNASSERT);
	    eval 'sub MPASSERT {
	        my($exp, $mp, $msg) = @_;
    		eval q( &do {  &if ( &__predict_false(!($exp))) {  &printf(\\"MPASSERT mp %p failed: %s not true at %s:%d (%s)\\\\n\\", ($mp), $exp,  &__FILE__,  &__LINE__,  &__func__);  &kassert_panic $msg; } }  &while (0));
	    }' unless defined(&MPASSERT);
	    eval 'sub VNPASS {
	        my($exp, $vp) = @_;
    		eval q( &do {  &const \'char\' * &_exp = $exp;  &VNASSERT($exp, $vp, (\\"condition %s not met at %s:%d (%s)\\",  &_exp,  &__FILE__,  &__LINE__,  &__func__)); }  &while (0));
	    }' unless defined(&VNPASS);
	    eval 'sub MPPASS {
	        my($exp, $mp) = @_;
    		eval q( &do {  &const \'char\' * &_exp = $exp;  &MPASSERT($exp, $mp, (\\"condition %s not met at %s:%d (%s)\\",  &_exp,  &__FILE__,  &__LINE__,  &__func__)); }  &while (0));
	    }' unless defined(&MPPASS);
	    eval 'sub __assert_unreachable () {
	        eval q( &panic(\\"executing segment marked as unreachable at %s:%d (%s)\\\\n\\",  &__FILE__,  &__LINE__,  &__func__));
	    }' unless defined(&__assert_unreachable);
	} else {
	    eval 'sub VNASSERT {
	        my($exp, $vp, $msg) = @_;
    		eval q( &do { }  &while (0));
	    }' unless defined(&VNASSERT);
	    eval 'sub MPASSERT {
	        my($exp, $mp, $msg) = @_;
    		eval q( &do { }  &while (0));
	    }' unless defined(&MPASSERT);
	    eval 'sub VNPASS {
	        my($exp, $vp) = @_;
    		eval q( &do { }  &while (0));
	    }' unless defined(&VNPASS);
	    eval 'sub MPPASS {
	        my($exp, $mp) = @_;
    		eval q( &do { }  &while (0));
	    }' unless defined(&MPPASS);
	    eval 'sub __assert_unreachable () {
	        eval q( &__unreachable());
	    }' unless defined(&__assert_unreachable);
	}
	unless(defined(&CTASSERT)) {
	    eval 'sub CTASSERT {
	        my($x) = @_;
    		eval q( &_Static_assert($x, \\"compile-time assertion failed\\"));
	    }' unless defined(&CTASSERT);
	}
    }
    if(defined(&_STANDALONE)) {
	eval 'sub kassert_panic () { &printf;}' unless defined(&kassert_panic);
    } else {
	if(defined(&WITNESS) || defined(&INVARIANT_SUPPORT)) {
	    if(defined(&KASSERT_PANIC_OPTIONAL)) {
	    } else {
		eval 'sub kassert_panic () { &panic;}' unless defined(&kassert_panic);
	    }
	}
    }
    if((defined(&_KERNEL)  && defined(&INVARIANTS)) || defined(&_STANDALONE)) {
	eval 'sub KASSERT {
	    my($exp,$msg) = @_;
    	    eval q( &do {  &if ( &__predict_false(!($exp)))  &kassert_panic $msg; }  &while (0));
	}' unless defined(&KASSERT);
    } else {
	eval 'sub KASSERT {
	    my($exp,$msg) = @_;
    	    eval q( &do { }  &while (0));
	}' unless defined(&KASSERT);
    }
    if(defined(&_KERNEL)) {
	eval 'sub MPASS {
	    my($ex) = @_;
    	    eval q( &MPASS4($ex, $ex,  &__FILE__,  &__LINE__));
	}' unless defined(&MPASS);
	eval 'sub MPASS2 {
	    my($ex, $what) = @_;
    	    eval q( &MPASS4($ex, $what,  &__FILE__,  &__LINE__));
	}' unless defined(&MPASS2);
	eval 'sub MPASS3 {
	    my($ex, $file, $line) = @_;
    	    eval q( &MPASS4($ex, $ex, $file, $line));
	}' unless defined(&MPASS3);
	eval 'sub MPASS4 {
	    my($ex, $what, $file, $line) = @_;
    	    eval q( &KASSERT(($ex), (\\"Assertion %s failed at %s:%d\\", $what, $file, $line)));
	}' unless defined(&MPASS4);
	eval 'sub ASSERT_ATOMIC_LOAD_PTR {
	    my($var, $msg) = @_;
    	    eval q( &KASSERT($sizeof{$var} == $sizeof{ &void }  && (( &uintptr_t)($var) & ($sizeof{ &void } - 1)) == 0, $msg));
	}' unless defined(&ASSERT_ATOMIC_LOAD_PTR);
	eval 'sub CRITICAL_ASSERT {
	    my($td) = @_;
    	    eval q( &KASSERT(($td)-> &td_critnest >= 1, (\\"Not in critical section\\")));
	}' unless defined(&CRITICAL_ASSERT);
    }
}
1;

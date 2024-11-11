require '_h2ph_pre.ph';

no warnings qw(redefine misc);

unless(defined(&__SYS_REFCOUNT_H__)) {
    eval 'sub __SYS_REFCOUNT_H__ () {1;}' unless defined(&__SYS_REFCOUNT_H__);
    require 'machine/atomic.ph';
    if(defined(&_KERNEL) || defined(&_STANDALONE)) {
	require 'sys/systm.ph';
    } else {
	require 'stdbool.ph';
	eval 'sub KASSERT {
	    my($exp, $msg) = @_;
    	    eval q();
	}' unless defined(&KASSERT);
    }
    eval 'sub REFCOUNT_SATURATED {
        my($val) = @_;
	    eval q(((($val) & (1 << 31)) != 0));
    }' unless defined(&REFCOUNT_SATURATED);
    eval 'sub REFCOUNT_SATURATION_VALUE () {(3 << 30);}' unless defined(&REFCOUNT_SATURATION_VALUE);
    if(defined(&INVARIANTS)) {
    } else {
    }
    eval 'sub refcount_init {
        my($count,$value) = @_;
	    eval q({  &KASSERT(! &REFCOUNT_SATURATED($value), (\\"invalid initial refcount value %u\\", $value));  &atomic_store_int($count, $value); });
    }' unless defined(&refcount_init);
    eval 'sub refcount_load {
        my($count) = @_;
	    eval q({ ( &atomic_load_int($count)); });
    }' unless defined(&refcount_load);
    eval 'sub refcount_acquire {
        my($count) = @_;
	    eval q({ \'u_int\'  &old;  &old =  &atomic_fetchadd_int($count, 1);  &if ( &__predict_false( &REFCOUNT_SATURATED( &old)))  &_refcount_update_saturated($count); ( &old); });
    }' unless defined(&refcount_acquire);
    eval 'sub refcount_acquiren {
        my($count,$n) = @_;
	    eval q({ \'u_int\'  &old;  &KASSERT($n <  &REFCOUNT_SATURATION_VALUE / 2, (\\"refcount_acquiren: n=%u too large\\", $n));  &old =  &atomic_fetchadd_int($count, $n);  &if ( &__predict_false( &REFCOUNT_SATURATED( &old)))  &_refcount_update_saturated($count); ( &old); });
    }' unless defined(&refcount_acquiren);
    eval 'sub refcount_acquire_checked {
        my($count) = @_;
	    eval q({ \'u_int\'  &old;  &old =  &atomic_load_int($count);  &for (;;) {  &if ( &__predict_false( &REFCOUNT_SATURATED( &old + 1))) ( &false);  &if ( &__predict_true( &atomic_fcmpset_int($count,  &old,  &old + 1) == 1)) ( &true); } });
    }' unless defined(&refcount_acquire_checked);
    eval 'sub refcount_acquire_if_not_zero {
        my($count) = @_;
	    eval q({ ( &refcount_acquire_if_gt($count, 0)); });
    }' unless defined(&refcount_acquire_if_not_zero);
    eval 'sub refcount_releasen {
        my($count,$n) = @_;
	    eval q({ \'u_int\'  &old;  &KASSERT($n <  &REFCOUNT_SATURATION_VALUE / 2, (\\"refcount_releasen: n=%u too large\\", $n));  &atomic_thread_fence_rel();  &old =  &atomic_fetchadd_int($count, -$n);  &if ( &__predict_false( &old < $n ||  &REFCOUNT_SATURATED( &old))) {  &_refcount_update_saturated($count); ( &false); }  &if ( &old > $n) ( &false);  &atomic_thread_fence_acq(); ( &true); });
    }' unless defined(&refcount_releasen);
    eval 'sub refcount_release {
        my($count) = @_;
	    eval q({ ( &refcount_releasen($count, 1)); });
    }' unless defined(&refcount_release);
    eval 'sub _refcount_release_if_cond {
        my($cond, $name) = @_;
	    eval q( &static  &__inline  &__result_use_check  &bool  &_refcount_release_if_$name( &volatile \'u_int\' * &count, \'u_int\'  &n) { \'u_int\'  &old;  &KASSERT( &n > 0, (\\"%s: zero increment\\",  &__func__));  &old =  &atomic_load_int( &count);  &for (;;) {  &if (!($cond))  &return ( &false);  &if ( &__predict_false( &REFCOUNT_SATURATED( &old)))  &return ( &false);  &if ( &atomic_fcmpset_rel_int( &count,  &old,  &old - 1))  &return ( &true); } });
    }' unless defined(&_refcount_release_if_cond);
    eval 'sub refcount_release_if_gt {
        my($count,$n) = @_;
	    eval q({ ( &_refcount_release_if_gt($count, $n)); });
    }' unless defined(&refcount_release_if_gt);
    eval 'sub refcount_release_if_last {
        my($count) = @_;
	    eval q({  &if ( &_refcount_release_if_eq($count, 1)) {  &atomic_thread_fence_acq(); ( &true); } ( &false); });
    }' unless defined(&refcount_release_if_last);
    eval 'sub refcount_release_if_not_last {
        my($count) = @_;
	    eval q({ ( &_refcount_release_if_gt($count, 1)); });
    }' unless defined(&refcount_release_if_not_last);
}
1;

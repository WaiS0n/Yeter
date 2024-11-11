require '_h2ph_pre.ph';

no warnings qw(redefine misc);

unless(defined(&__STDC_VERSION_STDCKDINT_H__)) {
    eval 'sub __STDC_VERSION_STDCKDINT_H__ () {202311;}' unless defined(&__STDC_VERSION_STDCKDINT_H__);
    require 'sys/cdefs.ph';
    if((defined(&__BSD_VISIBLE) ? &__BSD_VISIBLE : undef) || (defined(&__ISO_C_VISIBLE) ? &__ISO_C_VISIBLE : undef) >= 2023) {
	if( &__GNUC_PREREQ__(5, 1) ||  &__has_builtin((defined(&__builtin_add_overflow) ? &__builtin_add_overflow : undef))) {
	    eval 'sub ckd_add {
	        my($result, $a, $b) = @_;
    		eval q(( &_Bool) &__builtin_add_overflow(($a), ($b), ($result)));
	    }' unless defined(&ckd_add);
	} else {
	    eval 'sub ckd_add {
	        my($result, $a, $b) = @_;
    		eval q( &_Static_assert(0, \\"checked addition not supported\\"));
	    }' unless defined(&ckd_add);
	}
	if( &__GNUC_PREREQ__(5, 1) ||  &__has_builtin((defined(&__builtin_sub_overflow) ? &__builtin_sub_overflow : undef))) {
	    eval 'sub ckd_sub {
	        my($result, $a, $b) = @_;
    		eval q(( &_Bool) &__builtin_sub_overflow(($a), ($b), ($result)));
	    }' unless defined(&ckd_sub);
	} else {
	    eval 'sub ckd_sub {
	        my($result, $a, $b) = @_;
    		eval q( &_Static_assert(0, \\"checked subtraction not supported\\"));
	    }' unless defined(&ckd_sub);
	}
	if( &__GNUC_PREREQ__(5, 1) ||  &__has_builtin((defined(&__builtin_mul_overflow) ? &__builtin_mul_overflow : undef))) {
	    eval 'sub ckd_mul {
	        my($result, $a, $b) = @_;
    		eval q(( &_Bool) &__builtin_mul_overflow(($a), ($b), ($result)));
	    }' unless defined(&ckd_mul);
	} else {
	    eval 'sub ckd_mul {
	        my($result, $a, $b) = @_;
    		eval q( &_Static_assert(0, \\"checked multiplication not supported\\"));
	    }' unless defined(&ckd_mul);
	}
    }
}
1;

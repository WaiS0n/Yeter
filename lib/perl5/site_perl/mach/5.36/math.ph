require '_h2ph_pre.ph';

no warnings qw(redefine misc);

unless(defined(&_MATH_H_)) {
    eval 'sub _MATH_H_ () {1;}' unless defined(&_MATH_H_);
    require 'sys/_types.ph';
    require 'machine/_limits.ph';
    if( &__GNUC_PREREQ__(3, 3)) {
	eval 'sub __MATH_BUILTIN_CONSTANTS () {1;}' unless defined(&__MATH_BUILTIN_CONSTANTS);
    }
    if( &__GNUC_PREREQ__(3, 0)) {
	eval 'sub __MATH_BUILTIN_RELOPS () {1;}' unless defined(&__MATH_BUILTIN_RELOPS);
    }
    if(defined(&__MATH_BUILTIN_CONSTANTS)) {
	eval 'sub HUGE_VAL () { &__builtin_huge_val();}' unless defined(&HUGE_VAL);
    } else {
	eval 'sub HUGE_VAL () {( ($__infinity->{__ud}));}' unless defined(&HUGE_VAL);
    }
    if((defined(&__ISO_C_VISIBLE) ? &__ISO_C_VISIBLE : undef) >= 1999) {
	eval 'sub FP_ILOGB0 () {(- &__INT_MAX);}' unless defined(&FP_ILOGB0);
	eval 'sub FP_ILOGBNAN () { &__INT_MAX;}' unless defined(&FP_ILOGBNAN);
	if(defined(&__MATH_BUILTIN_CONSTANTS)) {
	    eval 'sub HUGE_VALF () { &__builtin_huge_valf();}' unless defined(&HUGE_VALF);
	    eval 'sub HUGE_VALL () { &__builtin_huge_vall();}' unless defined(&HUGE_VALL);
	    eval 'sub INFINITY () { &__builtin_inff();}' unless defined(&INFINITY);
	    eval 'sub NAN () { &__builtin_nanf("");}' unless defined(&NAN);
	} else {
	    eval 'sub HUGE_VALF () { &HUGE_VAL;}' unless defined(&HUGE_VALF);
	    eval 'sub HUGE_VALL () { &HUGE_VAL;}' unless defined(&HUGE_VALL);
	    eval 'sub INFINITY () { &HUGE_VALF;}' unless defined(&INFINITY);
	    eval 'sub NAN () {( ($__nan->{__uf}));}' unless defined(&NAN);
	}
	eval 'sub MATH_ERRNO () {1;}' unless defined(&MATH_ERRNO);
	eval 'sub MATH_ERREXCEPT () {2;}' unless defined(&MATH_ERREXCEPT);
	eval 'sub math_errhandling () { &MATH_ERREXCEPT;}' unless defined(&math_errhandling);
	eval 'sub FP_FAST_FMAF () {1;}' unless defined(&FP_FAST_FMAF);
	eval 'sub FP_INFINITE () {0x1;}' unless defined(&FP_INFINITE);
	eval 'sub FP_NAN () {0x2;}' unless defined(&FP_NAN);
	eval 'sub FP_NORMAL () {0x4;}' unless defined(&FP_NORMAL);
	eval 'sub FP_SUBNORMAL () {0x8;}' unless defined(&FP_SUBNORMAL);
	eval 'sub FP_ZERO () {0x10;}' unless defined(&FP_ZERO);
	if((defined(&__STDC_VERSION__) ? &__STDC_VERSION__ : undef) >= 201112 ||  &__has_extension((defined(&c_generic_selections) ? &c_generic_selections : undef))) {
	    eval 'sub __fp_type_select {
	        my($x, $f, $d, $ld) = @_;
    		eval q( &__extension__  &_Generic(($x), \'float\': $f($x), \'double\': $d($x), \'long double\': $ld($x)));
	    }' unless defined(&__fp_type_select);
	}
 elsif( &__GNUC_PREREQ__(3, 1)  && !defined(&__cplusplus)) {
	    eval 'sub __fp_type_select {
	        my($x, $f, $d, $ld) = @_;
    		eval q( &__builtin_choose_expr(  &__builtin_types_compatible_p( &__typeof($x), \'long double\'), $ld($x),  &__builtin_choose_expr(  &__builtin_types_compatible_p( &__typeof($x), \'double\'), $d($x),  &__builtin_choose_expr(  &__builtin_types_compatible_p( &__typeof($x), \'float\'), $f($x), ( &void)0))));
	    }' unless defined(&__fp_type_select);
	} else {
	    eval 'sub __fp_type_select {
	        my($x, $f, $d, $ld) = @_;
    		eval q((($sizeof{$x} == $sizeof{\'float\'}) ? $f($x) : ($sizeof{$x} == $sizeof{\'double\'}) ? $d($x) : $ld($x)));
	    }' unless defined(&__fp_type_select);
	}
	eval 'sub fpclassify {
	    my($x) = @_;
    	    eval q( &__fp_type_select($x,  &__fpclassifyf,  &__fpclassifyd,  &__fpclassifyl));
	}' unless defined(&fpclassify);
	eval 'sub isfinite {
	    my($x) = @_;
    	    eval q( &__fp_type_select($x,  &__isfinitef,  &__isfinite,  &__isfinitel));
	}' unless defined(&isfinite);
	eval 'sub isinf {
	    my($x) = @_;
    	    eval q( &__fp_type_select($x,  &__isinff,  &__isinf,  &__isinfl));
	}' unless defined(&isinf);
	eval 'sub isnan {
	    my($x) = @_;
    	    eval q( &__fp_type_select($x,  &__inline_isnanf,  &__inline_isnan,  &__inline_isnanl));
	}' unless defined(&isnan);
	eval 'sub isnormal {
	    my($x) = @_;
    	    eval q( &__fp_type_select($x,  &__isnormalf,  &__isnormal,  &__isnormall));
	}' unless defined(&isnormal);
	if(defined(&__MATH_BUILTIN_RELOPS)) {
	    eval 'sub isgreater {
	        my($x, $y) = @_;
    		eval q( &__builtin_isgreater(($x), ($y)));
	    }' unless defined(&isgreater);
	    eval 'sub isgreaterequal {
	        my($x, $y) = @_;
    		eval q( &__builtin_isgreaterequal(($x), ($y)));
	    }' unless defined(&isgreaterequal);
	    eval 'sub isless {
	        my($x, $y) = @_;
    		eval q( &__builtin_isless(($x), ($y)));
	    }' unless defined(&isless);
	    eval 'sub islessequal {
	        my($x, $y) = @_;
    		eval q( &__builtin_islessequal(($x), ($y)));
	    }' unless defined(&islessequal);
	    eval 'sub islessgreater {
	        my($x, $y) = @_;
    		eval q( &__builtin_islessgreater(($x), ($y)));
	    }' unless defined(&islessgreater);
	    eval 'sub isunordered {
	        my($x, $y) = @_;
    		eval q( &__builtin_isunordered(($x), ($y)));
	    }' unless defined(&isunordered);
	} else {
	    eval 'sub isgreater {
	        my($x, $y) = @_;
    		eval q((! &isunordered(($x), ($y))  && ($x) > ($y)));
	    }' unless defined(&isgreater);
	    eval 'sub isgreaterequal {
	        my($x, $y) = @_;
    		eval q((! &isunordered(($x), ($y))  && ($x) >= ($y)));
	    }' unless defined(&isgreaterequal);
	    eval 'sub isless {
	        my($x, $y) = @_;
    		eval q((! &isunordered(($x), ($y))  && ($x) < ($y)));
	    }' unless defined(&isless);
	    eval 'sub islessequal {
	        my($x, $y) = @_;
    		eval q((! &isunordered(($x), ($y))  && ($x) <= ($y)));
	    }' unless defined(&islessequal);
	    eval 'sub islessgreater {
	        my($x, $y) = @_;
    		eval q((! &isunordered(($x), ($y))  && (($x) > ($y) || ($y) > ($x))));
	    }' unless defined(&islessgreater);
	    eval 'sub isunordered {
	        my($x, $y) = @_;
    		eval q(( &isnan($x) ||  &isnan($y)));
	    }' unless defined(&isunordered);
	}
	eval 'sub signbit {
	    my($x) = @_;
    	    eval q( &__fp_type_select($x,  &__signbitf,  &__signbit,  &__signbitl));
	}' unless defined(&signbit);
    }
    if((defined(&__BSD_VISIBLE) ? &__BSD_VISIBLE : undef) || (defined(&__XSI_VISIBLE) ? &__XSI_VISIBLE : undef)) {
	eval 'sub M_E () {2.7182818284590452354;}' unless defined(&M_E);
	eval 'sub M_LOG2E () {1.4426950408889634074;}' unless defined(&M_LOG2E);
	eval 'sub M_LOG10E () {0.43429448190325182765;}' unless defined(&M_LOG10E);
	eval 'sub M_LN2 () {0.69314718055994530942;}' unless defined(&M_LN2);
	eval 'sub M_LN10 () {2.30258509299404568402;}' unless defined(&M_LN10);
	eval 'sub M_PI () {3.14159265358979323846;}' unless defined(&M_PI);
	eval 'sub M_PI_2 () {1.57079632679489661923;}' unless defined(&M_PI_2);
	eval 'sub M_PI_4 () {0.78539816339744830962;}' unless defined(&M_PI_4);
	eval 'sub M_1_PI () {0.31830988618379067154;}' unless defined(&M_1_PI);
	eval 'sub M_2_PI () {0.63661977236758134308;}' unless defined(&M_2_PI);
	eval 'sub M_2_SQRTPI () {1.12837916709551257390;}' unless defined(&M_2_SQRTPI);
	eval 'sub M_SQRT2 () {1.41421356237309504880;}' unless defined(&M_SQRT2);
	eval 'sub M_SQRT1_2 () {0.70710678118654752440;}' unless defined(&M_SQRT1_2);
	eval 'sub MAXFLOAT () {(3.40282346638528860e+38);}' unless defined(&MAXFLOAT);
    }
    if((defined(&__BSD_VISIBLE) ? &__BSD_VISIBLE : undef)) {
	if(0) {
	    eval 'sub HUGE () { &HUGE_VAL;}' unless defined(&HUGE);
	} else {
	    eval 'sub HUGE () { &MAXFLOAT;}' unless defined(&HUGE);
	}
    }
    eval 'sub __inline_isnan {
        my($__x) = @_;
	    eval q({ ($__x != $__x); });
    }' unless defined(&__inline_isnan);
    eval 'sub __inline_isnanf {
        my($__x) = @_;
	    eval q({ ($__x != $__x); });
    }' unless defined(&__inline_isnanf);
    eval 'sub __inline_isnanl {
        my($__x) = @_;
	    eval q({ ($__x != $__x); });
    }' unless defined(&__inline_isnanl);
    eval 'sub __isnan () { &__inline_isnan;}' unless defined(&__isnan);
    eval 'sub __isnanf () { &__inline_isnanf;}' unless defined(&__isnanf);
    if((defined(&__XSI_VISIBLE) ? &__XSI_VISIBLE : undef) > 0 && (defined(&__XSI_VISIBLE) ? &__XSI_VISIBLE : undef) < 600 && (defined(&__ISO_C_VISIBLE) ? &__ISO_C_VISIBLE : undef) < 1999) {
	undef(&isinf) if defined(&isinf);
	undef(&isnan) if defined(&isnan);
    }
    if((defined(&__BSD_VISIBLE) ? &__BSD_VISIBLE : undef) || (defined(&__ISO_C_VISIBLE) ? &__ISO_C_VISIBLE : undef) >= 1999|| (defined(&__XSI_VISIBLE) ? &__XSI_VISIBLE : undef)) {
    }
    if((defined(&__BSD_VISIBLE) ? &__BSD_VISIBLE : undef) || (defined(&__XSI_VISIBLE) ? &__XSI_VISIBLE : undef)) {
	if((defined(&__XSI_VISIBLE) ? &__XSI_VISIBLE : undef) <= 500|| (defined(&__BSD_VISIBLE) ? &__BSD_VISIBLE : undef)) {
	}
	if((defined(&__XSI_VISIBLE) ? &__XSI_VISIBLE : undef) <= 600|| (defined(&__BSD_VISIBLE) ? &__BSD_VISIBLE : undef)) {
	}
    }
    if((defined(&__BSD_VISIBLE) ? &__BSD_VISIBLE : undef) || (defined(&__ISO_C_VISIBLE) ? &__ISO_C_VISIBLE : undef) >= 1999) {
    }
    if((defined(&__BSD_VISIBLE) ? &__BSD_VISIBLE : undef)) {
    }
    if((defined(&__ISO_C_VISIBLE) ? &__ISO_C_VISIBLE : undef) >= 1999) {
    }
    if((defined(&__BSD_VISIBLE) ? &__BSD_VISIBLE : undef)) {
    }
    if((defined(&__ISO_C_VISIBLE) ? &__ISO_C_VISIBLE : undef) >= 1999) {
    }
    if((defined(&__BSD_VISIBLE) ? &__BSD_VISIBLE : undef)) {
    }
}
1;

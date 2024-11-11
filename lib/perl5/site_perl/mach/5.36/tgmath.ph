require '_h2ph_pre.ph';

no warnings qw(redefine misc);

unless(defined(&_TGMATH_H_)) {
    eval 'sub _TGMATH_H_ () {1;}' unless defined(&_TGMATH_H_);
    require 'complex.ph';
    require 'math.ph';
    if((defined(&__STDC_VERSION__)  && (defined(&__STDC_VERSION__) ? &__STDC_VERSION__ : undef) >= 201112) ||  &__has_extension((defined(&c_generic_selections) ? &c_generic_selections : undef))) {
	eval 'sub __tg_generic {
	    my($x, $cfnl, $cfn, $cfnf, $fnl, $fn, $fnf) = @_;
    	    eval q( &_Generic($x, \'long double _Complex\': $cfnl, \'double\'  &_Complex: $cfn, \'float\'  &_Complex: $cfnf, \'long double\': $fnl,  &default: $fn, \'float\': $fnf ));
	}' unless defined(&__tg_generic);
	eval 'sub __tg_type {
	    my($x) = @_;
    	    eval q( &__tg_generic($x, 0, (\'double\'  &_Complex)0, (\'float\'  &_Complex)0, 0, 0, 0));
	}' unless defined(&__tg_type);
	eval 'sub __tg_impl_simple () {( &x,  &y,  &z,  &fnl,  &fn,  &fnf, ...)  &__tg_generic(  &__tg_type( &x) +  &__tg_type( &y) +  &__tg_type( &z),  &fnl,  &fn,  &fnf,  &fnl,  &fn,  &fnf)( &__VA_ARGS__);}' unless defined(&__tg_impl_simple);
	eval 'sub __tg_impl_full () {( &x,  &y,  &cfnl,  &cfn,  &cfnf,  &fnl,  &fn,  &fnf, ...)  &__tg_generic(  &__tg_type( &x) +  &__tg_type( &y),  &cfnl,  &cfn,  &cfnf,  &fnl,  &fn,  &fnf)( &__VA_ARGS__);}' unless defined(&__tg_impl_full);
    }
 elsif(defined(&__generic)) {
	eval 'sub __tg_generic_simple {
	    my($x, $fnl, $fn, $fnf) = @_;
    	    eval q( &__generic($x, \'long double _Complex\', $fnl,  &__generic($x, \'double\'  &_Complex, $fn,  &__generic($x, \'float\'  &_Complex, $fnf,  &__generic($x, \'long double\', $fnl,  &__generic($x, \'float\', $fnf, $fn))))));
	}' unless defined(&__tg_generic_simple);
	eval 'sub __tg_impl_simple () {( &x,  &y,  &z,  &fnl,  &fn,  &fnf, ...)  &__tg_generic_simple( &x,  &__tg_generic_simple( &y,  &__tg_generic_simple( &z,  &fnl,  &fnl,  &fnl),  &__tg_generic_simple( &z,  &fnl,  &fnl,  &fnl),  &__tg_generic_simple( &z,  &fnl,  &fnl,  &fnl)),  &__tg_generic_simple( &y,  &__tg_generic_simple( &z,  &fnl,  &fnl,  &fnl),  &__tg_generic_simple( &z,  &fnl,  &fn ,  &fn ),  &__tg_generic_simple( &z,  &fnl,  &fn ,  &fn )),  &__tg_generic_simple( &y,  &__tg_generic_simple( &z,  &fnl,  &fnl,  &fnl),  &__tg_generic_simple( &z,  &fnl,  &fn ,  &fn ),  &__tg_generic_simple( &z,  &fnl,  &fn ,  &fnf)))( &__VA_ARGS__);}' unless defined(&__tg_impl_simple);
	eval 'sub __tg_generic_full {
	    my($x, $cfnl, $cfn, $cfnf, $fnl, $fn, $fnf) = @_;
    	    eval q( &__generic($x, \'long double _Complex\', $cfnl,  &__generic($x, \'double\'  &_Complex, $cfn,  &__generic($x, \'float\'  &_Complex, $cfnf,  &__generic($x, \'long double\', $fnl,  &__generic($x, \'float\', $fnf, $fn))))));
	}' unless defined(&__tg_generic_full);
	eval 'sub __tg_impl_full () {( &x,  &y,  &cfnl,  &cfn,  &cfnf,  &fnl,  &fn,  &fnf, ...)  &__tg_generic_full( &x,  &__tg_generic_full( &y,  &cfnl,  &cfnl,  &cfnl,  &cfnl,  &cfnl,  &cfnl),  &__tg_generic_full( &y,  &cfnl,  &cfn ,  &cfn ,  &cfnl,  &cfn ,  &cfn ),  &__tg_generic_full( &y,  &cfnl,  &cfn ,  &cfnf,  &cfnl,  &cfn ,  &cfnf),  &__tg_generic_full( &y,  &cfnl,  &cfnl,  &cfnl,  &fnl ,  &fnl ,  &fnl ),  &__tg_generic_full( &y,  &cfnl,  &cfn ,  &cfn ,  &fnl ,  &fn ,  &fn ),  &__tg_generic_full( &y,  &cfnl,  &cfn ,  &cfnf,  &fnl ,  &fn ,  &fnf )) ( &__VA_ARGS__);}' unless defined(&__tg_impl_full);
    } else {
	die("<tgmath.h> not implemented for this compiler");
    }
    eval 'sub __tg_simple {
        my($x, $fn) = @_;
	    eval q( &__tg_impl_simple($x, $x, $x, $fn &l, $fn, $fn &f, $x));
    }' unless defined(&__tg_simple);
    eval 'sub __tg_simple2 {
        my($x, $y, $fn) = @_;
	    eval q( &__tg_impl_simple($x, $x, $y, $fn &l, $fn, $fn &f, $x, $y));
    }' unless defined(&__tg_simple2);
    eval 'sub __tg_simple3 {
        my($x, $y, $z, $fn) = @_;
	    eval q( &__tg_impl_simple($x, $y, $z, $fn &l, $fn, $fn &f, $x, $y, $z));
    }' unless defined(&__tg_simple3);
    eval 'sub __tg_simplev () {( &x,  &fn, ...)  &__tg_impl_simple( &x,  &x,  &x,  &fn &l,  &fn,  &fn &f,  &__VA_ARGS__);}' unless defined(&__tg_simplev);
    eval 'sub __tg_full {
        my($x, $fn) = @_;
	    eval q( &__tg_impl_full($x, $x,  &c$fn &l,  &c$fn,  &c$fn &f, $fn &l, $fn, $fn &f, $x));
    }' unless defined(&__tg_full);
    eval 'sub __tg_full2 {
        my($x, $y, $fn) = @_;
	    eval q( &__tg_impl_full($x, $y,  &c$fn &l,  &c$fn,  &c$fn &f, $fn &l, $fn, $fn &f, $x, $y));
    }' unless defined(&__tg_full2);
    eval 'sub acos {
        my($x) = @_;
	    eval q( &__tg_full($x,  &acos));
    }' unless defined(&acos);
    eval 'sub asin {
        my($x) = @_;
	    eval q( &__tg_full($x,  &asin));
    }' unless defined(&asin);
    eval 'sub atan {
        my($x) = @_;
	    eval q( &__tg_full($x,  &atan));
    }' unless defined(&atan);
    eval 'sub acosh {
        my($x) = @_;
	    eval q( &__tg_full($x,  &acosh));
    }' unless defined(&acosh);
    eval 'sub asinh {
        my($x) = @_;
	    eval q( &__tg_full($x,  &asinh));
    }' unless defined(&asinh);
    eval 'sub atanh {
        my($x) = @_;
	    eval q( &__tg_full($x,  &atanh));
    }' unless defined(&atanh);
    eval 'sub cos {
        my($x) = @_;
	    eval q( &__tg_full($x,  &cos));
    }' unless defined(&cos);
    eval 'sub sin {
        my($x) = @_;
	    eval q( &__tg_full($x,  &sin));
    }' unless defined(&sin);
    eval 'sub tan {
        my($x) = @_;
	    eval q( &__tg_full($x,  &tan));
    }' unless defined(&tan);
    eval 'sub cosh {
        my($x) = @_;
	    eval q( &__tg_full($x,  &cosh));
    }' unless defined(&cosh);
    eval 'sub sinh {
        my($x) = @_;
	    eval q( &__tg_full($x,  &sinh));
    }' unless defined(&sinh);
    eval 'sub tanh {
        my($x) = @_;
	    eval q( &__tg_full($x,  &tanh));
    }' unless defined(&tanh);
    eval 'sub exp {
        my($x) = @_;
	    eval q( &__tg_full($x,  &exp));
    }' unless defined(&exp);
    eval 'sub log {
        my($x) = @_;
	    eval q( &__tg_full($x,  &log));
    }' unless defined(&log);
    eval 'sub pow {
        my($x, $y) = @_;
	    eval q( &__tg_full2($x, $y,  &pow));
    }' unless defined(&pow);
    eval 'sub sqrt {
        my($x) = @_;
	    eval q( &__tg_full($x,  &sqrt));
    }' unless defined(&sqrt);
    eval 'sub fabs {
        my($x) = @_;
	    eval q( &__tg_impl_full($x, $x,  &cabsl,  &cabs,  &cabsf,  &fabsl,  &fabs,  &fabsf, $x));
    }' unless defined(&fabs);
    eval 'sub atan2 {
        my($x, $y) = @_;
	    eval q( &__tg_simple2($x, $y,  &atan2));
    }' unless defined(&atan2);
    eval 'sub cbrt {
        my($x) = @_;
	    eval q( &__tg_simple($x,  &cbrt));
    }' unless defined(&cbrt);
    eval 'sub ceil {
        my($x) = @_;
	    eval q( &__tg_simple($x,  &ceil));
    }' unless defined(&ceil);
    eval 'sub copysign {
        my($x, $y) = @_;
	    eval q( &__tg_simple2($x, $y,  &copysign));
    }' unless defined(&copysign);
    eval 'sub erf {
        my($x) = @_;
	    eval q( &__tg_simple($x,  &erf));
    }' unless defined(&erf);
    eval 'sub erfc {
        my($x) = @_;
	    eval q( &__tg_simple($x,  &erfc));
    }' unless defined(&erfc);
    eval 'sub exp2 {
        my($x) = @_;
	    eval q( &__tg_simple($x,  &exp2));
    }' unless defined(&exp2);
    eval 'sub expm1 {
        my($x) = @_;
	    eval q( &__tg_simple($x,  &expm1));
    }' unless defined(&expm1);
    eval 'sub fdim {
        my($x, $y) = @_;
	    eval q( &__tg_simple2($x, $y,  &fdim));
    }' unless defined(&fdim);
    eval 'sub floor {
        my($x) = @_;
	    eval q( &__tg_simple($x,  &floor));
    }' unless defined(&floor);
    eval 'sub fma {
        my($x, $y, $z) = @_;
	    eval q( &__tg_simple3($x, $y, $z,  &fma));
    }' unless defined(&fma);
    eval 'sub fmax {
        my($x, $y) = @_;
	    eval q( &__tg_simple2($x, $y,  &fmax));
    }' unless defined(&fmax);
    eval 'sub fmin {
        my($x, $y) = @_;
	    eval q( &__tg_simple2($x, $y,  &fmin));
    }' unless defined(&fmin);
    eval 'sub fmod {
        my($x, $y) = @_;
	    eval q( &__tg_simple2($x, $y,  &fmod));
    }' unless defined(&fmod);
    eval 'sub frexp {
        my($x, $y) = @_;
	    eval q( &__tg_simplev($x,  &frexp, $x, $y));
    }' unless defined(&frexp);
    eval 'sub hypot {
        my($x, $y) = @_;
	    eval q( &__tg_simple2($x, $y,  &hypot));
    }' unless defined(&hypot);
    eval 'sub ilogb {
        my($x) = @_;
	    eval q( &__tg_simple($x,  &ilogb));
    }' unless defined(&ilogb);
    eval 'sub ldexp {
        my($x, $y) = @_;
	    eval q( &__tg_simplev($x,  &ldexp, $x, $y));
    }' unless defined(&ldexp);
    eval 'sub lgamma {
        my($x) = @_;
	    eval q( &__tg_simple($x,  &lgamma));
    }' unless defined(&lgamma);
    eval 'sub llrint {
        my($x) = @_;
	    eval q( &__tg_simple($x,  &llrint));
    }' unless defined(&llrint);
    eval 'sub llround {
        my($x) = @_;
	    eval q( &__tg_simple($x,  &llround));
    }' unless defined(&llround);
    eval 'sub log10 {
        my($x) = @_;
	    eval q( &__tg_simple($x,  &log10));
    }' unless defined(&log10);
    eval 'sub log1p {
        my($x) = @_;
	    eval q( &__tg_simple($x,  &log1p));
    }' unless defined(&log1p);
    eval 'sub log2 {
        my($x) = @_;
	    eval q( &__tg_simple($x,  &log2));
    }' unless defined(&log2);
    eval 'sub logb {
        my($x) = @_;
	    eval q( &__tg_simple($x,  &logb));
    }' unless defined(&logb);
    eval 'sub lrint {
        my($x) = @_;
	    eval q( &__tg_simple($x,  &lrint));
    }' unless defined(&lrint);
    eval 'sub lround {
        my($x) = @_;
	    eval q( &__tg_simple($x,  &lround));
    }' unless defined(&lround);
    eval 'sub nearbyint {
        my($x) = @_;
	    eval q( &__tg_simple($x,  &nearbyint));
    }' unless defined(&nearbyint);
    eval 'sub nextafter {
        my($x, $y) = @_;
	    eval q( &__tg_simple2($x, $y,  &nextafter));
    }' unless defined(&nextafter);
    eval 'sub nexttoward {
        my($x, $y) = @_;
	    eval q( &__tg_simplev($x,  &nexttoward, $x, $y));
    }' unless defined(&nexttoward);
    eval 'sub remainder {
        my($x, $y) = @_;
	    eval q( &__tg_simple2($x, $y,  &remainder));
    }' unless defined(&remainder);
    eval 'sub remquo {
        my($x, $y, $z) = @_;
	    eval q( &__tg_impl_simple($x, $x, $y,  &remquol,  &remquo,  &remquof, $x, $y, $z));
    }' unless defined(&remquo);
    eval 'sub rint {
        my($x) = @_;
	    eval q( &__tg_simple($x,  &rint));
    }' unless defined(&rint);
    eval 'sub round {
        my($x) = @_;
	    eval q( &__tg_simple($x,  &round));
    }' unless defined(&round);
    eval 'sub scalbn {
        my($x, $y) = @_;
	    eval q( &__tg_simplev($x,  &scalbn, $x, $y));
    }' unless defined(&scalbn);
    eval 'sub scalbln {
        my($x, $y) = @_;
	    eval q( &__tg_simplev($x,  &scalbln, $x, $y));
    }' unless defined(&scalbln);
    eval 'sub tgamma {
        my($x) = @_;
	    eval q( &__tg_simple($x,  &tgamma));
    }' unless defined(&tgamma);
    eval 'sub trunc {
        my($x) = @_;
	    eval q( &__tg_simple($x,  &trunc));
    }' unless defined(&trunc);
    eval 'sub carg {
        my($x) = @_;
	    eval q( &__tg_simple($x,  &carg));
    }' unless defined(&carg);
    eval 'sub cimag {
        my($x) = @_;
	    eval q( &__tg_simple($x,  &cimag));
    }' unless defined(&cimag);
    eval 'sub conj {
        my($x) = @_;
	    eval q( &__tg_simple($x,  &conj));
    }' unless defined(&conj);
    eval 'sub cproj {
        my($x) = @_;
	    eval q( &__tg_simple($x,  &cproj));
    }' unless defined(&cproj);
    eval 'sub creal {
        my($x) = @_;
	    eval q( &__tg_simple($x,  &creal));
    }' unless defined(&creal);
}
1;

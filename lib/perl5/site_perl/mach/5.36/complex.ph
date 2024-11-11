require '_h2ph_pre.ph';

no warnings qw(redefine misc);

unless(defined(&_COMPLEX_H)) {
    eval 'sub _COMPLEX_H () {1;}' unless defined(&_COMPLEX_H);
    require 'sys/cdefs.ph';
    if(defined(&__GNUC__)) {
	if((defined(&__STDC_VERSION__) ? &__STDC_VERSION__ : undef) < 199901) {
	    eval 'sub _Complex () { &__complex__;}' unless defined(&_Complex);
	}
	eval 'sub _Complex_I () {((\'float\'  &_Complex)1.0 &i);}' unless defined(&_Complex_I);
    }
    if(defined(&__generic)) {
    }
    eval 'sub complex () { &_Complex;}' unless defined(&complex);
    eval 'sub I () { &_Complex_I;}' unless defined(&I);
    if((defined(&__ISO_C_VISIBLE) ? &__ISO_C_VISIBLE : undef) >= 2011) {
	if(defined(&__clang__)) {
	    eval 'sub CMPLX {
	        my($x, $y) = @_;
    		eval q(((\'double\'  &complex){ $x, $y }));
	    }' unless defined(&CMPLX);
	    eval 'sub CMPLXF {
	        my($x, $y) = @_;
    		eval q(((\'float\'  &complex){ $x, $y }));
	    }' unless defined(&CMPLXF);
	    eval 'sub CMPLXL {
	        my($x, $y) = @_;
    		eval q(({ $x, $y }));
	    }' unless defined(&CMPLXL);
	}
 elsif( &__GNUC_PREREQ__(4, 7)) {
	    eval 'sub CMPLX {
	        my($x, $y) = @_;
    		eval q( &__builtin_complex(, ($y)));
	    }' unless defined(&CMPLX);
	    eval 'sub CMPLXF {
	        my($x, $y) = @_;
    		eval q( &__builtin_complex(, ($y)));
	    }' unless defined(&CMPLXF);
	    eval 'sub CMPLXL {
	        my($x, $y) = @_;
    		eval q( &__builtin_complex(, ($y)));
	    }' unless defined(&CMPLXL);
	}
    }
}
1;

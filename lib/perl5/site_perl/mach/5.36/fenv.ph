require '_h2ph_pre.ph';

no warnings qw(redefine misc);

unless(defined(&_FENV_H_)) {
    eval 'sub _FENV_H_ () {1;}' unless defined(&_FENV_H_);
    require 'sys/cdefs.ph';
    require 'sys/_types.ph';
    require 'ieeefp.ph';
    unless(defined(&__fenv_static)) {
	eval 'sub __fenv_static () { &static;}' unless defined(&__fenv_static);
    }
    eval 'sub FE_INVALID () {0x1;}' unless defined(&FE_INVALID);
    eval 'sub FE_DENORMAL () {0x2;}' unless defined(&FE_DENORMAL);
    eval 'sub FE_DIVBYZERO () {0x4;}' unless defined(&FE_DIVBYZERO);
    eval 'sub FE_OVERFLOW () {0x8;}' unless defined(&FE_OVERFLOW);
    eval 'sub FE_UNDERFLOW () {0x10;}' unless defined(&FE_UNDERFLOW);
    eval 'sub FE_INEXACT () {0x20;}' unless defined(&FE_INEXACT);
    eval 'sub FE_ALL_EXCEPT () {( &FE_DIVBYZERO |  &FE_DENORMAL |  &FE_INEXACT |  &FE_INVALID |  &FE_OVERFLOW |  &FE_UNDERFLOW);}' unless defined(&FE_ALL_EXCEPT);
    eval 'sub FE_TONEAREST () {0x;}' unless defined(&FE_TONEAREST);
    eval 'sub FE_DOWNWARD () {0x400;}' unless defined(&FE_DOWNWARD);
    eval 'sub FE_UPWARD () {0x800;}' unless defined(&FE_UPWARD);
    eval 'sub FE_TOWARDZERO () {0xc00;}' unless defined(&FE_TOWARDZERO);
    eval 'sub _ROUND_MASK () {( &FE_TONEAREST |  &FE_DOWNWARD |  &FE_UPWARD |  &FE_TOWARDZERO);}' unless defined(&_ROUND_MASK);
    eval 'sub _SSE_ROUND_SHIFT () {3;}' unless defined(&_SSE_ROUND_SHIFT);
    eval 'sub _SSE_EMASK_SHIFT () {7;}' unless defined(&_SSE_EMASK_SHIFT);
    if(defined(&__i386__)) {
    } else {
    }
    eval 'sub FE_DFL_ENV () {(& &__fe_dfl_env);}' unless defined(&FE_DFL_ENV);
    eval 'sub __fldenvx {
        my($__env) = @_;
	    eval q( &__asm  &__volatile(\\"fldenv %0\\" : : \\"m\\" ($__env) : \\"st\\", \\"st(1)\\", \\"st(2)\\", \\"st(3)\\", \\"st(4)\\", \\"st(5)\\", \\"st(6)\\", \\"st(7)\\"));
    }' unless defined(&__fldenvx);
    eval 'sub __fwait () {
        eval q( &__asm  &__volatile(\\"fwait\\"));
    }' unless defined(&__fwait);
    if((defined(&__BSD_VISIBLE) ? &__BSD_VISIBLE : undef)) {
    }
    if(defined(&__i386__)) {
	eval("sub __SSE_YES () { 0; }") unless defined(&__SSE_YES);
	eval("sub __SSE_NO () { 1; }") unless defined(&__SSE_NO);
	eval("sub __SSE_UNK () { 2; }") unless defined(&__SSE_UNK);
	if(defined(&__SSE__)) {
	    eval 'sub __HAS_SSE () {
	        eval q(1);
	    }' unless defined(&__HAS_SSE);
	} else {
	    eval 'sub __HAS_SSE () {
	        eval q(( &__has_sse ==  &__SSE_YES || ( &__has_sse ==  &__SSE_UNK  &&  &__test_sse())));
	    }' unless defined(&__HAS_SSE);
	}
	eval 'sub __get_mxcsr {
	    my($env) = @_;
    	    eval q(((($env). &__mxcsr_hi << 16) | (($env). &__mxcsr_lo)));
	}' unless defined(&__get_mxcsr);
	eval 'sub __set_mxcsr {
	    my($env, $x) = @_;
    	    eval q( &do { ($env). &__mxcsr_hi = ( &__uint32_t)($x) >> 16; ($env). &__mxcsr_lo = ( &__uint16_t)($x); }  &while (0));
	}' unless defined(&__set_mxcsr);
    } else {
    }
}
1;

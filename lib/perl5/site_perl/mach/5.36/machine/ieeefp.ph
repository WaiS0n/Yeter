require '_h2ph_pre.ph';

no warnings qw(redefine misc);

unless(defined(&_MACHINE_IEEEFP_H_)) {
    eval 'sub _MACHINE_IEEEFP_H_ () {1;}' unless defined(&_MACHINE_IEEEFP_H_);
    require 'x86/x86_ieeefp.ph';
    eval 'sub SSE_STKY_FLD () {0x3f;}' unless defined(&SSE_STKY_FLD);
    eval 'sub SSE_DAZ_FLD () {0x40;}' unless defined(&SSE_DAZ_FLD);
    eval 'sub SSE_MSKS_FLD () {0x1f80;}' unless defined(&SSE_MSKS_FLD);
    eval 'sub SSE_RND_FLD () {0x6000;}' unless defined(&SSE_RND_FLD);
    eval 'sub SSE_FZ_FLD () {0x8000;}' unless defined(&SSE_FZ_FLD);
    eval 'sub SSE_STKY_OFF () {0;}' unless defined(&SSE_STKY_OFF);
    eval 'sub SSE_DAZ_OFF () {6;}' unless defined(&SSE_DAZ_OFF);
    eval 'sub SSE_MSKS_OFF () {7;}' unless defined(&SSE_MSKS_OFF);
    eval 'sub SSE_RND_OFF () {13;}' unless defined(&SSE_RND_OFF);
    eval 'sub SSE_FZ_OFF () {15;}' unless defined(&SSE_FZ_OFF);
    eval 'sub __fpsetround {
        my($_m) = @_;
	    eval q({  &fp_rnd_t  &_p; my $_mxcsr; my $_cw,  &_newcw;  &__fnstcw(& $_cw);  &_p = ( &fp_rnd_t)(( $_cw &  &FP_RND_FLD) >>  &FP_RND_OFF);  &_newcw =  $_cw & ~ &FP_RND_FLD;  &_newcw |= ($_m <<  &FP_RND_OFF) &  &FP_RND_FLD;  &__fnldcw( $_cw,  &_newcw);  &__stmxcsr(& $_mxcsr);  $_mxcsr &= ~ &SSE_RND_FLD;  $_mxcsr |= ($_m <<  &SSE_RND_OFF) &  &SSE_RND_FLD;  &__ldmxcsr(& $_mxcsr); ( &_p); });
    }' unless defined(&__fpsetround);
    eval 'sub __fpsetprec {
        my($_m) = @_;
	    eval q({  &fp_prec_t  &_p; my $_cw,  &_newcw;  &__fnstcw(& $_cw);  &_p = ( &fp_prec_t)(( $_cw &  &FP_PRC_FLD) >>  &FP_PRC_OFF);  &_newcw =  $_cw & ~ &FP_PRC_FLD;  &_newcw |= ($_m <<  &FP_PRC_OFF) &  &FP_PRC_FLD;  &__fnldcw( $_cw,  &_newcw); ( &_p); });
    }' unless defined(&__fpsetprec);
    eval 'sub __fpsetmask {
        my($_m) = @_;
	    eval q({  &fp_except_t  &_p; my $_mxcsr; my $_cw,  &_newcw;  &__fnstcw(& $_cw);  &_p = (~ $_cw &  &FP_MSKS_FLD) >>  &FP_MSKS_OFF;  &_newcw =  $_cw & ~ &FP_MSKS_FLD;  &_newcw |= (~$_m <<  &FP_MSKS_OFF) &  &FP_MSKS_FLD;  &__fnldcw( $_cw,  &_newcw);  &__stmxcsr(& $_mxcsr);  $_mxcsr &= ~ &SSE_MSKS_FLD;  $_mxcsr |= (~$_m <<  &SSE_MSKS_OFF) &  &SSE_MSKS_FLD;  &__ldmxcsr(& $_mxcsr); ( &_p); });
    }' unless defined(&__fpsetmask);
    eval 'sub __fpgetsticky {
        my($void) = @_;
	    eval q({ my $_ex,  &_mxcsr; my $_sw;  &__fnstsw(& $_sw);  $_ex = ( $_sw &  &FP_STKY_FLD) >>  &FP_STKY_OFF;  &__stmxcsr(& &_mxcsr);  $_ex |= ( &_mxcsr &  &SSE_STKY_FLD) >>  &SSE_STKY_OFF; (( &fp_except_t) $_ex); });
    }' unless defined(&__fpgetsticky);
    if(!defined(&__IEEEFP_NOINLINES__)) {
	eval 'sub fpgetmask () {
	    eval q( &__fpgetmask());
	}' unless defined(&fpgetmask);
	eval 'sub fpgetprec () {
	    eval q( &__fpgetprec());
	}' unless defined(&fpgetprec);
	eval 'sub fpgetround () {
	    eval q( &__fpgetround());
	}' unless defined(&fpgetround);
	eval 'sub fpgetsticky () {
	    eval q( &__fpgetsticky());
	}' unless defined(&fpgetsticky);
	eval 'sub fpsetmask {
	    my($m) = @_;
    	    eval q( &__fpsetmask($m));
	}' unless defined(&fpsetmask);
	eval 'sub fpsetprec {
	    my($m) = @_;
    	    eval q( &__fpsetprec($m));
	}' unless defined(&fpsetprec);
	eval 'sub fpsetround {
	    my($m) = @_;
    	    eval q( &__fpsetround($m));
	}' unless defined(&fpsetround);
    } else {
    }
}
1;

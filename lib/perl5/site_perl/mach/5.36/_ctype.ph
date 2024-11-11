require '_h2ph_pre.ph';

no warnings qw(redefine misc);

unless(defined(&__CTYPE_H_)) {
    eval 'sub __CTYPE_H_ () {1;}' unless defined(&__CTYPE_H_);
    require 'sys/cdefs.ph';
    require 'sys/_types.ph';
    eval 'sub _CTYPE_A () {0x100;}' unless defined(&_CTYPE_A);
    eval 'sub _CTYPE_C () {0x200;}' unless defined(&_CTYPE_C);
    eval 'sub _CTYPE_D () {0x400;}' unless defined(&_CTYPE_D);
    eval 'sub _CTYPE_G () {0x800;}' unless defined(&_CTYPE_G);
    eval 'sub _CTYPE_L () {0x1000;}' unless defined(&_CTYPE_L);
    eval 'sub _CTYPE_P () {0x2000;}' unless defined(&_CTYPE_P);
    eval 'sub _CTYPE_S () {0x4000;}' unless defined(&_CTYPE_S);
    eval 'sub _CTYPE_U () {0x8000;}' unless defined(&_CTYPE_U);
    eval 'sub _CTYPE_X () {0x10000;}' unless defined(&_CTYPE_X);
    eval 'sub _CTYPE_B () {0x20000;}' unless defined(&_CTYPE_B);
    eval 'sub _CTYPE_R () {0x40000;}' unless defined(&_CTYPE_R);
    eval 'sub _CTYPE_I () {0x80000;}' unless defined(&_CTYPE_I);
    eval 'sub _CTYPE_T () {0x100000;}' unless defined(&_CTYPE_T);
    eval 'sub _CTYPE_Q () {0x200000;}' unless defined(&_CTYPE_Q);
    eval 'sub _CTYPE_N () {0x400000;}' unless defined(&_CTYPE_N);
    eval 'sub _CTYPE_SW0 () {0x20000000;}' unless defined(&_CTYPE_SW0);
    eval 'sub _CTYPE_SW1 () {0x40000000;}' unless defined(&_CTYPE_SW1);
    eval 'sub _CTYPE_SW2 () {0x80000000;}' unless defined(&_CTYPE_SW2);
    eval 'sub _CTYPE_SW3 () {0xc0000000;}' unless defined(&_CTYPE_SW3);
    eval 'sub _CTYPE_SWM () {0xe0000000;}' unless defined(&_CTYPE_SWM);
    eval 'sub _CTYPE_SWS () {30;}' unless defined(&_CTYPE_SWS);
    if(defined(&_EXTERNALIZE_CTYPE_INLINES_)) {
	eval 'sub _USE_CTYPE_INLINE_ () {1;}' unless defined(&_USE_CTYPE_INLINE_);
	eval 'sub static () {1;}' unless defined(&static);
	eval 'sub __inline () {1;}' unless defined(&__inline);
    }
    if(!defined(&_DONT_USE_CTYPE_INLINE_)  && (defined(&_USE_CTYPE_INLINE_) || defined(&__GNUC__) || defined(&__cplusplus))) {
	require 'runetype.ph';
	eval 'sub __maskrune {
	    my($_c,$_f) = @_;
    	    eval q({ (($_c < 0|| $_c >=  &_CACHED_RUNES) ?  &___runetype($_c) :  ($_CurrentRuneLocale->{__runetype[$_c]})) & $_f; });
	}' unless defined(&__maskrune);
	eval 'sub __sbmaskrune {
	    my($_c,$_f) = @_;
    	    eval q({ ($_c < 0|| $_c >=  &__mb_sb_limit) ? 0:  ($_CurrentRuneLocale->{__runetype[$_c]}) & $_f; });
	}' unless defined(&__sbmaskrune);
	eval 'sub __istype {
	    my($_c,$_f) = @_;
    	    eval q({ (!! &__maskrune($_c, $_f)); });
	}' unless defined(&__istype);
	eval 'sub __sbistype {
	    my($_c,$_f) = @_;
    	    eval q({ (!! &__sbmaskrune($_c, $_f)); });
	}' unless defined(&__sbistype);
	eval 'sub __isctype {
	    my($_c,$_f) = @_;
    	    eval q({ ($_c < 0|| $_c >= 128) ? 0: !!( ($_DefaultRuneLocale->{__runetype[$_c]}) & $_f); });
	}' unless defined(&__isctype);
	eval 'sub __toupper {
	    my($_c) = @_;
    	    eval q({ ($_c < 0|| $_c >=  &_CACHED_RUNES) ?  &___toupper($_c) :  ($_CurrentRuneLocale->{__mapupper[$_c]}); });
	}' unless defined(&__toupper);
	eval 'sub __sbtoupper {
	    my($_c) = @_;
    	    eval q({ ($_c < 0|| $_c >=  &__mb_sb_limit) ? $_c :  ($_CurrentRuneLocale->{__mapupper[$_c]}); });
	}' unless defined(&__sbtoupper);
	eval 'sub __tolower {
	    my($_c) = @_;
    	    eval q({ ($_c < 0|| $_c >=  &_CACHED_RUNES) ?  &___tolower($_c) :  ($_CurrentRuneLocale->{__maplower[$_c]}); });
	}' unless defined(&__tolower);
	eval 'sub __sbtolower {
	    my($_c) = @_;
    	    eval q({ ($_c < 0|| $_c >=  &__mb_sb_limit) ? $_c :  ($_CurrentRuneLocale->{__maplower[$_c]}); });
	}' unless defined(&__sbtolower);
	eval 'sub __wcwidth {
	    my($_c) = @_;
    	    eval q({ my $_x;  &if ($_c == 0) (0);  $_x =  &__maskrune($_c,  &_CTYPE_SWM| &_CTYPE_R);  &if (( $_x &  &_CTYPE_SWM) != 0) (( $_x &  &_CTYPE_SWM) >>  &_CTYPE_SWS); (( $_x &  &_CTYPE_R) != 0? 1: -1); });
	}' unless defined(&__wcwidth);
    } else {
    }
}
1;

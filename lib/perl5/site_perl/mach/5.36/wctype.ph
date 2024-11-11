require '_h2ph_pre.ph';

no warnings qw(redefine misc);

unless(defined(&_WCTYPE_H_)) {
    eval 'sub _WCTYPE_H_ () {1;}' unless defined(&_WCTYPE_H_);
    require 'sys/cdefs.ph';
    require 'sys/_types.ph';
    require '_ctype.ph';
    unless(defined(&_WCTRANS_T)) {
	eval 'sub _WCTRANS_T () {1;}' unless defined(&_WCTRANS_T);
    }
    unless(defined(&_WCTYPE_T)) {
	eval 'sub _WCTYPE_T () {1;}' unless defined(&_WCTYPE_T);
    }
    unless(defined(&_WINT_T_DECLARED)) {
	eval 'sub _WINT_T_DECLARED () {1;}' unless defined(&_WINT_T_DECLARED);
    }
    unless(defined(&WEOF)) {
	eval 'sub WEOF () {(( &wint_t)-1);}' unless defined(&WEOF);
    }
    if((defined(&__BSD_VISIBLE) ? &__BSD_VISIBLE : undef)) {
    }
    if((defined(&__POSIX_VISIBLE) ? &__POSIX_VISIBLE : undef) >= 200809) {
	eval 'sub _XLOCALE_WCTYPES () {1;}' unless defined(&_XLOCALE_WCTYPES);
	require 'xlocale/_ctype.ph';
    }
    unless(defined(&__cplusplus)) {
	eval 'sub iswalnum {
	    my($wc) = @_;
    	    eval q( &__istype(($wc),  &_CTYPE_A| &_CTYPE_D| &_CTYPE_N));
	}' unless defined(&iswalnum);
	eval 'sub iswalpha {
	    my($wc) = @_;
    	    eval q( &__istype(($wc),  &_CTYPE_A));
	}' unless defined(&iswalpha);
	eval 'sub iswblank {
	    my($wc) = @_;
    	    eval q( &__istype(($wc),  &_CTYPE_B));
	}' unless defined(&iswblank);
	eval 'sub iswcntrl {
	    my($wc) = @_;
    	    eval q( &__istype(($wc),  &_CTYPE_C));
	}' unless defined(&iswcntrl);
	eval 'sub iswctype {
	    my($wc, $charclass) = @_;
    	    eval q( &__istype(($wc), ($charclass)));
	}' unless defined(&iswctype);
	eval 'sub iswdigit {
	    my($wc) = @_;
    	    eval q( &__istype(($wc),  &_CTYPE_D));
	}' unless defined(&iswdigit);
	eval 'sub iswgraph {
	    my($wc) = @_;
    	    eval q( &__istype(($wc),  &_CTYPE_G));
	}' unless defined(&iswgraph);
	eval 'sub iswlower {
	    my($wc) = @_;
    	    eval q( &__istype(($wc),  &_CTYPE_L));
	}' unless defined(&iswlower);
	eval 'sub iswprint {
	    my($wc) = @_;
    	    eval q( &__istype(($wc),  &_CTYPE_R));
	}' unless defined(&iswprint);
	eval 'sub iswpunct {
	    my($wc) = @_;
    	    eval q( &__istype(($wc),  &_CTYPE_P));
	}' unless defined(&iswpunct);
	eval 'sub iswspace {
	    my($wc) = @_;
    	    eval q( &__istype(($wc),  &_CTYPE_S));
	}' unless defined(&iswspace);
	eval 'sub iswupper {
	    my($wc) = @_;
    	    eval q( &__istype(($wc),  &_CTYPE_U));
	}' unless defined(&iswupper);
	eval 'sub iswxdigit {
	    my($wc) = @_;
    	    eval q( &__istype(($wc),  &_CTYPE_X));
	}' unless defined(&iswxdigit);
	eval 'sub towlower {
	    my($wc) = @_;
    	    eval q( &__tolower($wc));
	}' unless defined(&towlower);
	eval 'sub towupper {
	    my($wc) = @_;
    	    eval q( &__toupper($wc));
	}' unless defined(&towupper);
	if((defined(&__BSD_VISIBLE) ? &__BSD_VISIBLE : undef)) {
	    eval 'sub iswascii {
	        my($wc) = @_;
    		eval q(((($wc) & ~0x7f) == 0));
	    }' unless defined(&iswascii);
	    eval 'sub iswhexnumber {
	        my($wc) = @_;
    		eval q( &__istype(($wc),  &_CTYPE_X));
	    }' unless defined(&iswhexnumber);
	    eval 'sub iswideogram {
	        my($wc) = @_;
    		eval q( &__istype(($wc),  &_CTYPE_I));
	    }' unless defined(&iswideogram);
	    eval 'sub iswnumber {
	        my($wc) = @_;
    		eval q( &__istype(($wc),  &_CTYPE_D| &_CTYPE_N));
	    }' unless defined(&iswnumber);
	    eval 'sub iswphonogram {
	        my($wc) = @_;
    		eval q( &__istype(($wc),  &_CTYPE_Q));
	    }' unless defined(&iswphonogram);
	    eval 'sub iswrune {
	        my($wc) = @_;
    		eval q( &__istype(($wc), 0xffffff00));
	    }' unless defined(&iswrune);
	    eval 'sub iswspecial {
	        my($wc) = @_;
    		eval q( &__istype(($wc),  &_CTYPE_T));
	    }' unless defined(&iswspecial);
	}
    }
}
1;

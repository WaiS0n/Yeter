require '_h2ph_pre.ph';

no warnings qw(redefine misc);

unless(defined(&_CTYPE_H_)) {
    eval 'sub _CTYPE_H_ () {1;}' unless defined(&_CTYPE_H_);
    require 'sys/cdefs.ph';
    require 'sys/_types.ph';
    require '_ctype.ph';
    if((defined(&__XSI_VISIBLE) ? &__XSI_VISIBLE : undef)) {
    }
    if((defined(&__ISO_C_VISIBLE) ? &__ISO_C_VISIBLE : undef) >= 1999) {
    }
    if((defined(&__BSD_VISIBLE) ? &__BSD_VISIBLE : undef)) {
    }
    if((defined(&__POSIX_VISIBLE) ? &__POSIX_VISIBLE : undef) >= 200809|| defined(&_XLOCALE_H_)) {
	require 'xlocale/_ctype.ph';
    }
    unless(defined(&__cplusplus)) {
	eval 'sub isalnum {
	    my($c) = @_;
    	    eval q( &__sbistype(($c),  &_CTYPE_A| &_CTYPE_D| &_CTYPE_N));
	}' unless defined(&isalnum);
	eval 'sub isalpha {
	    my($c) = @_;
    	    eval q( &__sbistype(($c),  &_CTYPE_A));
	}' unless defined(&isalpha);
	eval 'sub iscntrl {
	    my($c) = @_;
    	    eval q( &__sbistype(($c),  &_CTYPE_C));
	}' unless defined(&iscntrl);
	eval 'sub isdigit {
	    my($c) = @_;
    	    eval q( &__sbistype(($c),  &_CTYPE_D));
	}' unless defined(&isdigit);
	eval 'sub isgraph {
	    my($c) = @_;
    	    eval q( &__sbistype(($c),  &_CTYPE_G));
	}' unless defined(&isgraph);
	eval 'sub islower {
	    my($c) = @_;
    	    eval q( &__sbistype(($c),  &_CTYPE_L));
	}' unless defined(&islower);
	eval 'sub isprint {
	    my($c) = @_;
    	    eval q( &__sbistype(($c),  &_CTYPE_R));
	}' unless defined(&isprint);
	eval 'sub ispunct {
	    my($c) = @_;
    	    eval q( &__sbistype(($c),  &_CTYPE_P));
	}' unless defined(&ispunct);
	eval 'sub isspace {
	    my($c) = @_;
    	    eval q( &__sbistype(($c),  &_CTYPE_S));
	}' unless defined(&isspace);
	eval 'sub isupper {
	    my($c) = @_;
    	    eval q( &__sbistype(($c),  &_CTYPE_U));
	}' unless defined(&isupper);
	eval 'sub isxdigit {
	    my($c) = @_;
    	    eval q( &__sbistype(($c),  &_CTYPE_X));
	}' unless defined(&isxdigit);
	eval 'sub tolower {
	    my($c) = @_;
    	    eval q( &__sbtolower($c));
	}' unless defined(&tolower);
	eval 'sub toupper {
	    my($c) = @_;
    	    eval q( &__sbtoupper($c));
	}' unless defined(&toupper);
    }
    if((defined(&__XSI_VISIBLE) ? &__XSI_VISIBLE : undef)) {
	eval 'sub _tolower {
	    my($c) = @_;
    	    eval q( &__sbtolower($c));
	}' unless defined(&_tolower);
	eval 'sub _toupper {
	    my($c) = @_;
    	    eval q( &__sbtoupper($c));
	}' unless defined(&_toupper);
	eval 'sub isascii {
	    my($c) = @_;
    	    eval q(((($c) & ~0x7f) == 0));
	}' unless defined(&isascii);
	eval 'sub toascii {
	    my($c) = @_;
    	    eval q((($c) & 0x7f));
	}' unless defined(&toascii);
    }
    if((defined(&__ISO_C_VISIBLE) ? &__ISO_C_VISIBLE : undef) >= 1999 && !defined(&__cplusplus)) {
	eval 'sub isblank {
	    my($c) = @_;
    	    eval q( &__sbistype(($c),  &_CTYPE_B));
	}' unless defined(&isblank);
    }
    if((defined(&__BSD_VISIBLE) ? &__BSD_VISIBLE : undef)) {
	eval 'sub digittoint {
	    my($c) = @_;
    	    eval q( &__sbmaskrune(($c), 0xff));
	}' unless defined(&digittoint);
	eval 'sub ishexnumber {
	    my($c) = @_;
    	    eval q( &__sbistype(($c),  &_CTYPE_X));
	}' unless defined(&ishexnumber);
	eval 'sub isideogram {
	    my($c) = @_;
    	    eval q( &__sbistype(($c),  &_CTYPE_I));
	}' unless defined(&isideogram);
	eval 'sub isnumber {
	    my($c) = @_;
    	    eval q( &__sbistype(($c),  &_CTYPE_D| &_CTYPE_N));
	}' unless defined(&isnumber);
	eval 'sub isphonogram {
	    my($c) = @_;
    	    eval q( &__sbistype(($c),  &_CTYPE_Q));
	}' unless defined(&isphonogram);
	eval 'sub isrune {
	    my($c) = @_;
    	    eval q( &__sbistype(($c), 0xffffff00));
	}' unless defined(&isrune);
	eval 'sub isspecial {
	    my($c) = @_;
    	    eval q( &__sbistype(($c),  &_CTYPE_T));
	}' unless defined(&isspecial);
    }
}
1;

require '_h2ph_pre.ph';

no warnings qw(redefine misc);

unless(defined(&_WCHAR_H_)) {
    eval 'sub _WCHAR_H_ () {1;}' unless defined(&_WCHAR_H_);
    require 'sys/cdefs.ph';
    require 'sys/_null.ph';
    require 'sys/_types.ph';
    require 'machine/_limits.ph';
    require '_ctype.ph';
    unless(defined(&_MBSTATE_T_DECLARED)) {
	eval 'sub _MBSTATE_T_DECLARED () {1;}' unless defined(&_MBSTATE_T_DECLARED);
    }
    unless(defined(&_SIZE_T_DECLARED)) {
	eval 'sub _SIZE_T_DECLARED () {1;}' unless defined(&_SIZE_T_DECLARED);
    }
    if((defined(&__POSIX_VISIBLE) ? &__POSIX_VISIBLE : undef) >= 200809|| (defined(&__XSI_VISIBLE) ? &__XSI_VISIBLE : undef)) {
	unless(defined(&_VA_LIST_DECLARED)) {
	    eval 'sub _VA_LIST_DECLARED () {1;}' unless defined(&_VA_LIST_DECLARED);
	}
    }
    unless(defined(&__cplusplus)) {
	unless(defined(&_WCHAR_T_DECLARED)) {
	    eval 'sub _WCHAR_T_DECLARED () {1;}' unless defined(&_WCHAR_T_DECLARED);
	}
    }
    unless(defined(&_WINT_T_DECLARED)) {
	eval 'sub _WINT_T_DECLARED () {1;}' unless defined(&_WINT_T_DECLARED);
    }
    eval 'sub WCHAR_MIN () { &__WCHAR_MIN;}' unless defined(&WCHAR_MIN);
    eval 'sub WCHAR_MAX () { &__WCHAR_MAX;}' unless defined(&WCHAR_MAX);
    unless(defined(&WEOF)) {
	eval 'sub WEOF () {(( &wint_t)-1);}' unless defined(&WEOF);
    }
    unless(defined(&_STDFILE_DECLARED)) {
	eval 'sub _STDFILE_DECLARED () {1;}' unless defined(&_STDFILE_DECLARED);
    }
    if((defined(&__BSD_VISIBLE) ? &__BSD_VISIBLE : undef)) {
    }
    unless(defined(&_STDSTREAM_DECLARED)) {
	eval 'sub _STDSTREAM_DECLARED () {1;}' unless defined(&_STDSTREAM_DECLARED);
    }
    eval 'sub getwc {
        my($fp) = @_;
	    eval q( &fgetwc($fp));
    }' unless defined(&getwc);
    eval 'sub getwchar () {
        eval q( &fgetwc( &__stdinp));
    }' unless defined(&getwchar);
    eval 'sub putwc {
        my($wc, $fp) = @_;
	    eval q( &fputwc($wc, $fp));
    }' unless defined(&putwc);
    eval 'sub putwchar {
        my($wc) = @_;
	    eval q( &fputwc($wc,  &__stdoutp));
    }' unless defined(&putwchar);
    if((defined(&__ISO_C_VISIBLE) ? &__ISO_C_VISIBLE : undef) >= 1999) {
	if(defined(&__LONG_LONG_SUPPORTED)) {
	}
    }
    if((defined(&__XSI_VISIBLE) ? &__XSI_VISIBLE : undef)) {
	eval 'sub wcwidth {
	    my($_c) = @_;
    	    eval q( &__wcwidth($_c));
	}' unless defined(&wcwidth);
    }
    if((defined(&__POSIX_VISIBLE) ? &__POSIX_VISIBLE : undef) >= 200809) {
    }
    if((defined(&__BSD_VISIBLE) ? &__BSD_VISIBLE : undef)) {
    }
    if((defined(&__POSIX_VISIBLE) ? &__POSIX_VISIBLE : undef) >= 200809|| defined(&_XLOCALE_H_)) {
	require 'xlocale/_wchar.ph';
    }
}
1;

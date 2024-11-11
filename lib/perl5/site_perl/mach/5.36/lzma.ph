require '_h2ph_pre.ph';

no warnings qw(redefine misc);

unless(defined(&LZMA_H)) {
    eval 'sub LZMA_H () {1;}' unless defined(&LZMA_H);
    unless(defined(&LZMA_MANUAL_HEADERS)) {
	require 'stddef.ph';
	if(!defined(&UINT32_C) || !defined(&UINT64_C) || !defined(&UINT32_MAX) || !defined(&UINT64_MAX)) {
	    if(defined(&_WIN32)  && defined(&_MSC_VER)  && (defined(&_MSC_VER) ? &_MSC_VER : undef) < 1800) {
	    } else {
		if(defined(&__cplusplus)) {
		    unless(defined(&__STDC_LIMIT_MACROS)) {
			eval 'sub __STDC_LIMIT_MACROS () {1;}' unless defined(&__STDC_LIMIT_MACROS);
		    }
		    unless(defined(&__STDC_CONSTANT_MACROS)) {
			eval 'sub __STDC_CONSTANT_MACROS () {1;}' unless defined(&__STDC_CONSTANT_MACROS);
		    }
		}
		require 'inttypes.ph';
	    }
	    unless(defined(&UINT32_C)) {
		if(defined(&_WIN32)  && defined(&_MSC_VER)) {
		    eval 'sub UINT32_C {
		        my($n) = @_;
    			eval q($n   &UI32);
		    }' unless defined(&UINT32_C);
		} else {
		    eval 'sub UINT32_C {
		        my($n) = @_;
    			eval q($n   &U);
		    }' unless defined(&UINT32_C);
		}
	    }
	    unless(defined(&UINT64_C)) {
		if(defined(&_WIN32)  && defined(&_MSC_VER)) {
		    eval 'sub UINT64_C {
		        my($n) = @_;
    			eval q($n   &UI64);
		    }' unless defined(&UINT64_C);
		} else {
		    require 'limits.ph';
		    if((defined(&ULONG_MAX) ? &ULONG_MAX : undef) == 4294967295) {
			eval 'sub UINT64_C {
			    my($n) = @_;
    			    eval q($n   &ULL);
			}' unless defined(&UINT64_C);
		    } else {
			eval 'sub UINT64_C {
			    my($n) = @_;
    			    eval q($n   &UL);
			}' unless defined(&UINT64_C);
		    }
		}
	    }
	    unless(defined(&UINT32_MAX)) {
		eval 'sub UINT32_MAX () {( &UINT32_C(4294967295));}' unless defined(&UINT32_MAX);
	    }
	    unless(defined(&UINT64_MAX)) {
		eval 'sub UINT64_MAX () {( &UINT64_C(18446744073709551615));}' unless defined(&UINT64_MAX);
	    }
	}
    }
    unless(defined(&LZMA_API_IMPORT)) {
	if(!defined(&LZMA_API_STATIC)  && defined(&_WIN32)  && !defined(&__GNUC__)) {
	    eval 'sub LZMA_API_IMPORT () { &__declspec( &dllimport);}' unless defined(&LZMA_API_IMPORT);
	} else {
	    eval 'sub LZMA_API_IMPORT () {1;}' unless defined(&LZMA_API_IMPORT);
	}
    }
    unless(defined(&LZMA_API_CALL)) {
	if(defined(&_WIN32)  && !defined(&__CYGWIN__)) {
	    eval 'sub LZMA_API_CALL () { &__cdecl;}' unless defined(&LZMA_API_CALL);
	} else {
	    eval 'sub LZMA_API_CALL () {1;}' unless defined(&LZMA_API_CALL);
	}
    }
    unless(defined(&LZMA_API)) {
	eval 'sub LZMA_API {
	    my($type) = @_;
    	    eval q( &LZMA_API_IMPORT $type  &LZMA_API_CALL);
	}' unless defined(&LZMA_API);
    }
    unless(defined(&lzma_nothrow)) {
	if(defined(&__cplusplus)) {
	    if((defined(&__cplusplus) ? &__cplusplus : undef) >= 201103 || (defined(&_MSVC_LANG)  && (defined(&_MSVC_LANG) ? &_MSVC_LANG : undef) >= 201103)) {
		eval 'sub lzma_nothrow () { &noexcept;}' unless defined(&lzma_nothrow);
	    } else {
		eval 'sub lzma_nothrow () { &throw();}' unless defined(&lzma_nothrow);
	    }
	}
 elsif(defined(&__GNUC__)  && ((defined(&__GNUC__) ? &__GNUC__ : undef) > 3|| ((defined(&__GNUC__) ? &__GNUC__ : undef) == 3 && (defined(&__GNUC_MINOR__) ? &__GNUC_MINOR__ : undef) >= 3))) {
	    eval 'sub lzma_nothrow () { &__attribute__(( &__nothrow__));}' unless defined(&lzma_nothrow);
	} else {
	    eval 'sub lzma_nothrow () {1;}' unless defined(&lzma_nothrow);
	}
    }
    if(defined(&__GNUC__)  && (defined(&__GNUC__) ? &__GNUC__ : undef) >= 3) {
	unless(defined(&lzma_attribute)) {
	    eval 'sub lzma_attribute {
	        my($attr) = @_;
    		eval q( &__attribute__($attr));
	    }' unless defined(&lzma_attribute);
	}
	unless(defined(&lzma_attr_warn_unused_result)) {
	    if((defined(&__GNUC__) ? &__GNUC__ : undef) == 3 && (defined(&__GNUC_MINOR__) ? &__GNUC_MINOR__ : undef) < 4) {
		eval 'sub lzma_attr_warn_unused_result () {1;}' unless defined(&lzma_attr_warn_unused_result);
	    }
	}
    } else {
	unless(defined(&lzma_attribute)) {
	    eval 'sub lzma_attribute {
	        my($attr) = @_;
    		eval q();
	    }' unless defined(&lzma_attribute);
	}
    }
    unless(defined(&lzma_attr_pure)) {
	eval 'sub lzma_attr_pure () { &lzma_attribute(( &__pure__));}' unless defined(&lzma_attr_pure);
    }
    unless(defined(&lzma_attr_const)) {
	eval 'sub lzma_attr_const () { &lzma_attribute(( &__const__));}' unless defined(&lzma_attr_const);
    }
    unless(defined(&lzma_attr_warn_unused_result)) {
	eval 'sub lzma_attr_warn_unused_result () { &lzma_attribute(( &__warn_unused_result__));}' unless defined(&lzma_attr_warn_unused_result);
    }
    if(defined(&__cplusplus)) {
    }
    eval 'sub LZMA_H_INTERNAL () {1;}' unless defined(&LZMA_H_INTERNAL);
    require 'lzma/version.ph';
    require 'lzma/base.ph';
    require 'lzma/vli.ph';
    require 'lzma/check.ph';
    require 'lzma/filter.ph';
    require 'lzma/bcj.ph';
    require 'lzma/delta.ph';
    require 'lzma/lzma12.ph';
    require 'lzma/container.ph';
    require 'lzma/stream_flags.ph';
    require 'lzma/block.ph';
    require 'lzma/index.ph';
    require 'lzma/index_hash.ph';
    require 'lzma/hardware.ph';
    undef(&LZMA_H_INTERNAL) if defined(&LZMA_H_INTERNAL);
    if(defined(&__cplusplus)) {
    }
}
1;

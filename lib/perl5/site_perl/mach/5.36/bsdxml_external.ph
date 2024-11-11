require '_h2ph_pre.ph';

no warnings qw(redefine misc);

unless(defined(&Expat_External_INCLUDED)) {
    eval 'sub Expat_External_INCLUDED () {1;}' unless defined(&Expat_External_INCLUDED);
    unless(defined(&XMLCALL)) {
	if(defined(&_MSC_VER)) {
	    eval 'sub XMLCALL () { &__cdecl;}' unless defined(&XMLCALL);
	}
 elsif(defined(&__GNUC__)  && defined(&__i386)  && ! defined(&__INTEL_COMPILER)) {
	    eval 'sub XMLCALL () { &__attribute__(( &cdecl));}' unless defined(&XMLCALL);
	} else {
	    eval 'sub XMLCALL () {1;}' unless defined(&XMLCALL);
	}
    }
    if(! defined(&XML_STATIC)  && ! defined(&XMLIMPORT)) {
	unless(defined(&XML_BUILDING_EXPAT)) {
	    if(defined(&_MSC_EXTENSIONS)  && ! defined(&__BEOS__)  && ! defined(&__CYGWIN__)) {
		eval 'sub XMLIMPORT () { &__declspec( &dllimport);}' unless defined(&XMLIMPORT);
	    }
	}
    }
    unless(defined(&XML_ENABLE_VISIBILITY)) {
	eval 'sub XML_ENABLE_VISIBILITY () {0;}' unless defined(&XML_ENABLE_VISIBILITY);
    }
    if(! defined(&XMLIMPORT)  && (defined(&XML_ENABLE_VISIBILITY) ? &XML_ENABLE_VISIBILITY : undef)) {
	eval 'sub XMLIMPORT () { &__attribute__(( &visibility("default")));}' unless defined(&XMLIMPORT);
    }
    unless(defined(&XMLIMPORT)) {
	eval 'sub XMLIMPORT () {1;}' unless defined(&XMLIMPORT);
    }
    if(defined(&__GNUC__)  && ((defined(&__GNUC__) ? &__GNUC__ : undef) > 2|| ((defined(&__GNUC__) ? &__GNUC__ : undef) == 2 && (defined(&__GNUC_MINOR__) ? &__GNUC_MINOR__ : undef) >= 96))) {
	eval 'sub XML_ATTR_MALLOC () { &__attribute__(( &__malloc__));}' unless defined(&XML_ATTR_MALLOC);
    } else {
	eval 'sub XML_ATTR_MALLOC () {1;}' unless defined(&XML_ATTR_MALLOC);
    }
    if(defined(&__GNUC__)  && (((defined(&__GNUC__) ? &__GNUC__ : undef) > 4) || ((defined(&__GNUC__) ? &__GNUC__ : undef) == 4 && (defined(&__GNUC_MINOR__) ? &__GNUC_MINOR__ : undef) >= 3))) {
	eval 'sub XML_ATTR_ALLOC_SIZE {
	    my($x) = @_;
    	    eval q( &__attribute__(( &__alloc_size__($x))));
	}' unless defined(&XML_ATTR_ALLOC_SIZE);
    } else {
	eval 'sub XML_ATTR_ALLOC_SIZE {
	    my($x) = @_;
    	    eval q();
	}' unless defined(&XML_ATTR_ALLOC_SIZE);
    }
    eval 'sub XMLPARSEAPI {
        my($type) = @_;
	    eval q( &XMLIMPORT $type  &XMLCALL);
    }' unless defined(&XMLPARSEAPI);
    if(defined(&__cplusplus)) {
    }
    if(defined(&XML_UNICODE_WCHAR_T)) {
	unless(defined(&XML_UNICODE)) {
	    eval 'sub XML_UNICODE () {1;}' unless defined(&XML_UNICODE);
	}
	if(defined(&__SIZEOF_WCHAR_T__)  && ((defined(&__SIZEOF_WCHAR_T__) ? &__SIZEOF_WCHAR_T__ : undef) != 2)) {
	    die("sizeof(wchar_t) != 2; Need -fshort-wchar for both Expat and libc");
	}
    }
    if(defined(&XML_UNICODE)) {
	if(defined(&XML_UNICODE_WCHAR_T)) {
	} else {
	}
    } else {
    }
    if(defined(&XML_LARGE_SIZE)) {
    } else {
    }
    if(defined(&__cplusplus)) {
    }
}
1;

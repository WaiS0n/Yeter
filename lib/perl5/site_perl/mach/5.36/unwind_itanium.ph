require '_h2ph_pre.ph';

no warnings qw(redefine misc);

unless(defined(&__ITANIUM_UNWIND_H__)) {
    eval 'sub __ITANIUM_UNWIND_H__ () {1;}' unless defined(&__ITANIUM_UNWIND_H__);
    if(defined(&__SEH__)  && !defined(&__USING_SJLJ_EXCEPTIONS__)) {
    } else {
    }
    if((defined(&__SIZEOF_POINTER__) ? &__SIZEOF_POINTER__ : undef) == 4) {
    }
    if(defined(&__cplusplus)) {
    }
    if(defined(&__USING_SJLJ_EXCEPTIONS__)) {
    } else {
    }
    if(defined(&__cplusplus)) {
    }
}
1;

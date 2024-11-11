require '_h2ph_pre.ph';

no warnings qw(redefine misc);

unless(defined(&__UNWIND_H__)) {
    eval 'sub __UNWIND_H__ () {1;}' unless defined(&__UNWIND_H__);
    require '__libunwind_config.ph';
    require 'stdint.ph';
    require 'stddef.ph';
    if(defined(&__SEH__)  && !defined(&__USING_SJLJ_EXCEPTIONS__)  && defined(&_WIN32)) {
	require 'windows.ph';
	require 'ntverp.ph';
    }
    if(defined(&__APPLE__)) {
	eval 'sub LIBUNWIND_UNAVAIL () { &__attribute__ ((  &unavailable ));}' unless defined(&LIBUNWIND_UNAVAIL);
    } else {
	eval 'sub LIBUNWIND_UNAVAIL () {1;}' unless defined(&LIBUNWIND_UNAVAIL);
    }
    eval("sub _URC_NO_REASON () { 0; }") unless defined(&_URC_NO_REASON);
    eval("sub _URC_OK () { 0; }") unless defined(&_URC_OK);
    eval("sub _URC_FOREIGN_EXCEPTION_CAUGHT () { 1; }") unless defined(&_URC_FOREIGN_EXCEPTION_CAUGHT);
    eval("sub _URC_FATAL_PHASE2_ERROR () { 2; }") unless defined(&_URC_FATAL_PHASE2_ERROR);
    eval("sub _URC_FATAL_PHASE1_ERROR () { 3; }") unless defined(&_URC_FATAL_PHASE1_ERROR);
    eval("sub _URC_NORMAL_STOP () { 4; }") unless defined(&_URC_NORMAL_STOP);
    eval("sub _URC_END_OF_STACK () { 5; }") unless defined(&_URC_END_OF_STACK);
    eval("sub _URC_HANDLER_FOUND () { 6; }") unless defined(&_URC_HANDLER_FOUND);
    eval("sub _URC_INSTALL_CONTEXT () { 7; }") unless defined(&_URC_INSTALL_CONTEXT);
    eval("sub _URC_CONTINUE_UNWIND () { 8; }") unless defined(&_URC_CONTINUE_UNWIND);
    eval("sub _UA_SEARCH_PHASE () { 1; }") unless defined(&_UA_SEARCH_PHASE);
    eval("sub _UA_CLEANUP_PHASE () { 2; }") unless defined(&_UA_CLEANUP_PHASE);
    eval("sub _UA_HANDLER_FRAME () { 4; }") unless defined(&_UA_HANDLER_FRAME);
    eval("sub _UA_FORCE_UNWIND () { 8; }") unless defined(&_UA_FORCE_UNWIND);
    eval("sub _UA_END_OF_STACK () { 16; }") unless defined(&_UA_END_OF_STACK);
    if(defined(&_LIBUNWIND_ARM_EHABI)) {
	require 'unwind_arm_ehabi.ph';
    } else {
	require 'unwind_itanium.ph';
    }
    if(defined(&__cplusplus)) {
    }
    if(defined(&__USING_SJLJ_EXCEPTIONS__)) {
    } else {
    }
    if(defined(&__USING_SJLJ_EXCEPTIONS__)) {
    }
    if(defined(&__USING_SJLJ_EXCEPTIONS__)) {
    } else {
    }
    if(defined(&__SEH__)  && !defined(&__USING_SJLJ_EXCEPTIONS__)) {
	unless(defined(&_WIN32)) {
	}
 elsif(!defined(&__MINGW32__)  && (defined(&VER_PRODUCTBUILD) ? &VER_PRODUCTBUILD : undef) < 8000) {
	}
    }
    if(defined(&__cplusplus)) {
    }
}
1;

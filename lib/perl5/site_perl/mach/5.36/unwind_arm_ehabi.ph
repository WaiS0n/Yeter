require '_h2ph_pre.ph';

no warnings qw(redefine misc);

unless(defined(&__ARM_EHABI_UNWIND_H__)) {
    eval 'sub __ARM_EHABI_UNWIND_H__ () {1;}' unless defined(&__ARM_EHABI_UNWIND_H__);
    if(defined(&__cplusplus)) {
    }
    if(defined(&__USING_SJLJ_EXCEPTIONS__)) {
    } else {
    }
    eval("sub _UVRSC_CORE () { 0; }") unless defined(&_UVRSC_CORE);
    eval("sub _UVRSC_VFP () { 1; }") unless defined(&_UVRSC_VFP);
    eval("sub _UVRSC_WMMXD () { 3; }") unless defined(&_UVRSC_WMMXD);
    eval("sub _UVRSC_WMMXC () { 4; }") unless defined(&_UVRSC_WMMXC);
    eval("sub _UVRSC_PSEUDO () { 5; }") unless defined(&_UVRSC_PSEUDO);
    eval("sub _UVRSD_UINT32 () { 0; }") unless defined(&_UVRSD_UINT32);
    eval("sub _UVRSD_VFPX () { 1; }") unless defined(&_UVRSD_VFPX);
    eval("sub _UVRSD_UINT64 () { 3; }") unless defined(&_UVRSD_UINT64);
    eval("sub _UVRSD_FLOAT () { 4; }") unless defined(&_UVRSD_FLOAT);
    eval("sub _UVRSD_DOUBLE () { 5; }") unless defined(&_UVRSD_DOUBLE);
    eval("sub _UVRSR_OK () { 0; }") unless defined(&_UVRSR_OK);
    eval("sub _UVRSR_NOT_IMPLEMENTED () { 1; }") unless defined(&_UVRSR_NOT_IMPLEMENTED);
    eval("sub _UVRSR_FAILED () { 2; }") unless defined(&_UVRSR_FAILED);
    if(defined(&_LIBUNWIND_UNWIND_LEVEL1_EXTERNAL_LINKAGE)) {
	eval 'sub _LIBUNWIND_EXPORT_UNWIND_LEVEL1 () { &extern;}' unless defined(&_LIBUNWIND_EXPORT_UNWIND_LEVEL1);
    } else {
	eval 'sub _LIBUNWIND_EXPORT_UNWIND_LEVEL1 () { &static  &__inline__;}' unless defined(&_LIBUNWIND_EXPORT_UNWIND_LEVEL1);
    }
    if(defined(&__cplusplus)) {
    }
}
1;

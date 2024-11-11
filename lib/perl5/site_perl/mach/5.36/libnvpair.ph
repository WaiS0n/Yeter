require '_h2ph_pre.ph';

no warnings qw(redefine misc);

unless(defined(&_LIBNVPAIR_H)) {
    eval 'sub _LIBNVPAIR_H () { &extern  &__attribute__(( &visibility("default")));}' unless defined(&_LIBNVPAIR_H);
    require 'sys/nvpair.ph';
    require 'stdlib.ph';
    require 'stdio.ph';
    require 'regex.ph';
    if(defined(&__cplusplus)) {
    }
    eval("sub NVLIST_INDENT_ABS () { 0; }") unless defined(&NVLIST_INDENT_ABS);
    eval("sub NVLIST_INDENT_TABBED () { 1; }") unless defined(&NVLIST_INDENT_TABBED);
    eval("sub NVLIST_FMT_MEMBER_NAME () { 0; }") unless defined(&NVLIST_FMT_MEMBER_NAME);
    eval("sub NVLIST_FMT_MEMBER_POSTAMBLE () { 1; }") unless defined(&NVLIST_FMT_MEMBER_POSTAMBLE);
    eval("sub NVLIST_FMT_BTWN_ARRAY () { 2; }") unless defined(&NVLIST_FMT_BTWN_ARRAY);
    eval 'sub NVLIST_PRINTCTL_SVDECL {
        my($funcname, $valtype) = @_;
	    eval q( &_LIBNVPAIR_H  &void $funcname( &nvlist_prtctl_t,  &int (*)( &nvlist_prtctl_t,  &void *,  &nvlist_t *,  &const \'char\' *, $valtype),  &void *));
    }' unless defined(&NVLIST_PRINTCTL_SVDECL);
    undef(&NVLIST_PRINTCTL_SVDECL) if defined(&NVLIST_PRINTCTL_SVDECL);
    eval 'sub NVLIST_PRINTCTL_AVDECL {
        my($funcname, $vtype) = @_;
	    eval q( &_LIBNVPAIR_H  &void $funcname( &nvlist_prtctl_t,  &int (*)( &nvlist_prtctl_t,  &void *,  &nvlist_t *,  &const \'char\' *, $vtype,  &uint_t),  &void *));
    }' unless defined(&NVLIST_PRINTCTL_AVDECL);
    undef(&NVLIST_PRINTCTL_AVDECL) if defined(&NVLIST_PRINTCTL_AVDECL);
    if(defined(&__cplusplus)) {
    }
}
1;

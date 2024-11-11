require '_h2ph_pre.ph';

no warnings qw(redefine misc);

unless(defined(&_SYS_NVPAIR_H)) {
    eval 'sub _SYS_NVPAIR_H () { &extern  &__attribute__(( &visibility("default")));}' unless defined(&_SYS_NVPAIR_H);
    require 'sys/types.ph';
    require 'sys/time.ph';
    require 'sys/errno.ph';
    if(defined(&__cplusplus)) {
    }
    eval("sub DATA_TYPE_DONTCARE () { -1; }") unless defined(&DATA_TYPE_DONTCARE);
    eval("sub DATA_TYPE_UNKNOWN () { 0; }") unless defined(&DATA_TYPE_UNKNOWN);
    eval("sub DATA_TYPE_BOOLEAN () { 1; }") unless defined(&DATA_TYPE_BOOLEAN);
    eval("sub DATA_TYPE_BYTE () { 2; }") unless defined(&DATA_TYPE_BYTE);
    eval("sub DATA_TYPE_INT16 () { 3; }") unless defined(&DATA_TYPE_INT16);
    eval("sub DATA_TYPE_UINT16 () { 4; }") unless defined(&DATA_TYPE_UINT16);
    eval("sub DATA_TYPE_INT32 () { 5; }") unless defined(&DATA_TYPE_INT32);
    eval("sub DATA_TYPE_UINT32 () { 6; }") unless defined(&DATA_TYPE_UINT32);
    eval("sub DATA_TYPE_INT64 () { 7; }") unless defined(&DATA_TYPE_INT64);
    eval("sub DATA_TYPE_UINT64 () { 8; }") unless defined(&DATA_TYPE_UINT64);
    eval("sub DATA_TYPE_STRING () { 9; }") unless defined(&DATA_TYPE_STRING);
    eval("sub DATA_TYPE_BYTE_ARRAY () { 10; }") unless defined(&DATA_TYPE_BYTE_ARRAY);
    eval("sub DATA_TYPE_INT16_ARRAY () { 11; }") unless defined(&DATA_TYPE_INT16_ARRAY);
    eval("sub DATA_TYPE_UINT16_ARRAY () { 12; }") unless defined(&DATA_TYPE_UINT16_ARRAY);
    eval("sub DATA_TYPE_INT32_ARRAY () { 13; }") unless defined(&DATA_TYPE_INT32_ARRAY);
    eval("sub DATA_TYPE_UINT32_ARRAY () { 14; }") unless defined(&DATA_TYPE_UINT32_ARRAY);
    eval("sub DATA_TYPE_INT64_ARRAY () { 15; }") unless defined(&DATA_TYPE_INT64_ARRAY);
    eval("sub DATA_TYPE_UINT64_ARRAY () { 16; }") unless defined(&DATA_TYPE_UINT64_ARRAY);
    eval("sub DATA_TYPE_STRING_ARRAY () { 17; }") unless defined(&DATA_TYPE_STRING_ARRAY);
    eval("sub DATA_TYPE_HRTIME () { 18; }") unless defined(&DATA_TYPE_HRTIME);
    eval("sub DATA_TYPE_NVLIST () { 19; }") unless defined(&DATA_TYPE_NVLIST);
    eval("sub DATA_TYPE_NVLIST_ARRAY () { 20; }") unless defined(&DATA_TYPE_NVLIST_ARRAY);
    eval("sub DATA_TYPE_BOOLEAN_VALUE () { 21; }") unless defined(&DATA_TYPE_BOOLEAN_VALUE);
    eval("sub DATA_TYPE_INT8 () { 22; }") unless defined(&DATA_TYPE_INT8);
    eval("sub DATA_TYPE_UINT8 () { 23; }") unless defined(&DATA_TYPE_UINT8);
    eval("sub DATA_TYPE_BOOLEAN_ARRAY () { 24; }") unless defined(&DATA_TYPE_BOOLEAN_ARRAY);
    eval("sub DATA_TYPE_INT8_ARRAY () { 25; }") unless defined(&DATA_TYPE_INT8_ARRAY);
    eval 'sub NV_VERSION () {0;}' unless defined(&NV_VERSION);
    eval 'sub NV_ENCODE_NATIVE () {0;}' unless defined(&NV_ENCODE_NATIVE);
    eval 'sub NV_ENCODE_XDR () {1;}' unless defined(&NV_ENCODE_XDR);
    eval 'sub NV_UNIQUE_NAME () {0x1;}' unless defined(&NV_UNIQUE_NAME);
    eval 'sub NV_UNIQUE_NAME_TYPE () {0x2;}' unless defined(&NV_UNIQUE_NAME_TYPE);
    eval 'sub NV_FLAG_NOENTOK () {0x1;}' unless defined(&NV_FLAG_NOENTOK);
    eval 'sub NV_ALIGN {
        my($x) = @_;
	    eval q(((($x) + 7) & ~7));
    }' unless defined(&NV_ALIGN);
    eval 'sub NV_ALIGN4 {
        my($x) = @_;
	    eval q(((($x) + 3) & ~3));
    }' unless defined(&NV_ALIGN4);
    eval 'sub NVP_SIZE {
        my($nvp) = @_;
	    eval q((($nvp)-> &nvp_size));
    }' unless defined(&NVP_SIZE);
    eval 'sub NVP_NAME {
        my($nvp) = @_;
	    eval q((($nvp)-> &nvp_name));
    }' unless defined(&NVP_NAME);
    eval 'sub NVP_TYPE {
        my($nvp) = @_;
	    eval q((($nvp)-> &nvp_type));
    }' unless defined(&NVP_TYPE);
    eval 'sub NVP_NELEM {
        my($nvp) = @_;
	    eval q((($nvp)-> &nvp_value_elem));
    }' unless defined(&NVP_NELEM);
    eval 'sub NVP_VALUE {
        my($nvp) = @_;
	    eval q((($nvp) +  &NV_ALIGN($sizeof{ &nvpair_t} + ($nvp)-> &nvp_name_sz)));
    }' unless defined(&NVP_VALUE);
    eval 'sub NVL_VERSION {
        my($nvl) = @_;
	    eval q((($nvl)-> &nvl_version));
    }' unless defined(&NVL_VERSION);
    eval 'sub NVL_SIZE {
        my($nvl) = @_;
	    eval q((($nvl)-> &nvl_size));
    }' unless defined(&NVL_SIZE);
    eval 'sub NVL_FLAG {
        my($nvl) = @_;
	    eval q((($nvl)-> &nvl_flag));
    }' unless defined(&NVL_FLAG);
    if(defined(&_KERNEL)) {
    }
    if(!defined(&_KERNEL)  && !defined(&_STANDALONE)) {
    }
    if(!defined(&_KERNEL)  && !defined(&_STANDALONE)) {
    }
    if(!defined(&_KERNEL)  && !defined(&_STANDALONE)) {
    }
    if(defined(&__cplusplus)) {
    }
}
1;

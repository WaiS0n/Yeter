require '_h2ph_pre.ph';

no warnings qw(redefine misc);

unless(defined(&_SYS_CTF_H_)) {
    eval 'sub _SYS_CTF_H_ () {1;}' unless defined(&_SYS_CTF_H_);
    require 'sys/_types.ph';
    eval 'sub cth_magic () { ($cth_preamble->{ctp_magic});}' unless defined(&cth_magic);
    eval 'sub cth_version () { ($cth_preamble->{ctp_version});}' unless defined(&cth_version);
    eval 'sub cth_flags () { ($cth_preamble->{ctp_flags});}' unless defined(&cth_flags);
    eval 'sub CTF_F_COMPRESS () {(1<< 0);}' unless defined(&CTF_F_COMPRESS);
    eval 'sub ctt_size () { ($_u->{_size});}' unless defined(&ctt_size);
    eval 'sub ctt_type () { ($_u->{_type});}' unless defined(&ctt_type);
    eval 'sub CTF_V2_LSTRUCT_THRESH () {(1<< 13);}' unless defined(&CTF_V2_LSTRUCT_THRESH);
    eval 'sub CTF_V3_LSTRUCT_THRESH () {(1<< 29);}' unless defined(&CTF_V3_LSTRUCT_THRESH);
    eval 'sub CTF_MAGIC () {0xcff1;}' unless defined(&CTF_MAGIC);
    eval 'sub CTF_VERSION () { &CTF_VERSION_3;}' unless defined(&CTF_VERSION);
    eval 'sub CTF_VERSION_3 () {3;}' unless defined(&CTF_VERSION_3);
    eval 'sub CTF_VERSION_2 () {2;}' unless defined(&CTF_VERSION_2);
    eval 'sub CTF_VERSION_1 () {1;}' unless defined(&CTF_VERSION_1);
    eval 'sub CTF_MAX_NAME () {0x7fffffff;}' unless defined(&CTF_MAX_NAME);
    eval 'sub CTF_V2_MAX_VLEN () {0x3ff;}' unless defined(&CTF_V2_MAX_VLEN);
    eval 'sub CTF_V2_MAX_SIZE () {0xfffe;}' unless defined(&CTF_V2_MAX_SIZE);
    eval 'sub CTF_V2_LSIZE_SENT () {( &CTF_V2_MAX_SIZE + 1);}' unless defined(&CTF_V2_LSIZE_SENT);
    eval 'sub CTF_V3_MAX_VLEN () {0xffffff;}' unless defined(&CTF_V3_MAX_VLEN);
    eval 'sub CTF_V3_MAX_SIZE () {0xfffffffe;}' unless defined(&CTF_V3_MAX_SIZE);
    eval 'sub CTF_V3_LSIZE_SENT () {( &CTF_V3_MAX_SIZE + 1);}' unless defined(&CTF_V3_LSIZE_SENT);
    eval 'sub CTF_V2_PARENT_SHIFT () {15;}' unless defined(&CTF_V2_PARENT_SHIFT);
    eval 'sub CTF_V2_MAX_TYPE () {0xffff;}' unless defined(&CTF_V2_MAX_TYPE);
    eval 'sub CTF_V2_TYPE_ISPARENT {
        my($id) = @_;
	    eval q((($id) < 0x8000));
    }' unless defined(&CTF_V2_TYPE_ISPARENT);
    eval 'sub CTF_V2_TYPE_ISCHILD {
        my($id) = @_;
	    eval q((($id) > 0x7fff));
    }' unless defined(&CTF_V2_TYPE_ISCHILD);
    eval 'sub CTF_V2_TYPE_TO_INDEX {
        my($type) = @_;
	    eval q((($type) & 0x7fff));
    }' unless defined(&CTF_V2_TYPE_TO_INDEX);
    eval 'sub CTF_V2_INDEX_TO_TYPE {
        my($type, $ischild) = @_;
	    eval q(((($type) & 0x7fff) | (($ischild) != 0? 0x8000 : 0)));
    }' unless defined(&CTF_V2_INDEX_TO_TYPE);
    eval 'sub CTF_V2_TYPE_INFO {
        my($kind, $isroot, $vlen) = @_;
	    eval q(((($kind) << 11) | (($isroot) != 0? (1<< 10) : 0) | (($vlen) &  &CTF_V2_MAX_VLEN)));
    }' unless defined(&CTF_V2_TYPE_INFO);
    eval 'sub CTF_V3_PARENT_SHIFT () {31;}' unless defined(&CTF_V3_PARENT_SHIFT);
    eval 'sub CTF_V3_MAX_TYPE () {0xfffffffe;}' unless defined(&CTF_V3_MAX_TYPE);
    eval 'sub CTF_V3_TYPE_ISPARENT {
        my($id) = @_;
	    eval q((( &__uint32_t)($id) < 0x80000000));
    }' unless defined(&CTF_V3_TYPE_ISPARENT);
    eval 'sub CTF_V3_TYPE_ISCHILD {
        my($id) = @_;
	    eval q((( &__uint32_t)($id) > 0x7fffffff));
    }' unless defined(&CTF_V3_TYPE_ISCHILD);
    eval 'sub CTF_V3_TYPE_TO_INDEX {
        my($type) = @_;
	    eval q((($type) & 0x7fffffff));
    }' unless defined(&CTF_V3_TYPE_TO_INDEX);
    eval 'sub CTF_V3_INDEX_TO_TYPE {
        my($type, $ischild) = @_;
	    eval q(((($type) & 0x7fffffff) | (($ischild) != 0? 0x80000000 : 0)));
    }' unless defined(&CTF_V3_INDEX_TO_TYPE);
    eval 'sub CTF_V3_TYPE_INFO {
        my($kind, $isroot, $vlen) = @_;
	    eval q(((($kind) << 26) | (($isroot) != 0? (1<< 25) : 0) | (($vlen) &  &CTF_V3_MAX_VLEN)));
    }' unless defined(&CTF_V3_TYPE_INFO);
    eval 'sub CTF_STRTAB_0 () {0;}' unless defined(&CTF_STRTAB_0);
    eval 'sub CTF_STRTAB_1 () {1;}' unless defined(&CTF_STRTAB_1);
    eval 'sub CTF_TYPE_NAME {
        my($t, $o) = @_;
	    eval q(((($t) << 31) | (($o) & ((1 << 31) - 1))));
    }' unless defined(&CTF_TYPE_NAME);
    eval 'sub CTF_V2_INFO_VLEN {
        my($i) = @_;
	    eval q((($i) &  &CTF_V2_MAX_VLEN));
    }' unless defined(&CTF_V2_INFO_VLEN);
    eval 'sub CTF_V2_INFO_ISROOT {
        my($i) = @_;
	    eval q(((($i) & 0x400) >> 10));
    }' unless defined(&CTF_V2_INFO_ISROOT);
    eval 'sub CTF_V2_INFO_KIND {
        my($i) = @_;
	    eval q(((($i) & 0xf800) >> 11));
    }' unless defined(&CTF_V2_INFO_KIND);
    eval 'sub CTF_V3_INFO_VLEN {
        my($i) = @_;
	    eval q((($i) &  &CTF_V3_MAX_VLEN));
    }' unless defined(&CTF_V3_INFO_VLEN);
    eval 'sub CTF_V3_INFO_ISROOT {
        my($i) = @_;
	    eval q(((($i) & 0x2000000) >> 25));
    }' unless defined(&CTF_V3_INFO_ISROOT);
    eval 'sub CTF_V3_INFO_KIND {
        my($i) = @_;
	    eval q(((($i) & 0xfc000000) >> 26));
    }' unless defined(&CTF_V3_INFO_KIND);
    eval 'sub CTF_K_UNKNOWN () {0;}' unless defined(&CTF_K_UNKNOWN);
    eval 'sub CTF_K_INTEGER () {1;}' unless defined(&CTF_K_INTEGER);
    eval 'sub CTF_K_FLOAT () {2;}' unless defined(&CTF_K_FLOAT);
    eval 'sub CTF_K_POINTER () {3;}' unless defined(&CTF_K_POINTER);
    eval 'sub CTF_K_ARRAY () {4;}' unless defined(&CTF_K_ARRAY);
    eval 'sub CTF_K_FUNCTION () {5;}' unless defined(&CTF_K_FUNCTION);
    eval 'sub CTF_K_STRUCT () {6;}' unless defined(&CTF_K_STRUCT);
    eval 'sub CTF_K_UNION () {7;}' unless defined(&CTF_K_UNION);
    eval 'sub CTF_K_ENUM () {8;}' unless defined(&CTF_K_ENUM);
    eval 'sub CTF_K_FORWARD () {9;}' unless defined(&CTF_K_FORWARD);
    eval 'sub CTF_K_TYPEDEF () {10;}' unless defined(&CTF_K_TYPEDEF);
    eval 'sub CTF_K_VOLATILE () {11;}' unless defined(&CTF_K_VOLATILE);
    eval 'sub CTF_K_CONST () {12;}' unless defined(&CTF_K_CONST);
    eval 'sub CTF_K_RESTRICT () {13;}' unless defined(&CTF_K_RESTRICT);
    eval 'sub CTF_K_MAX () {63;}' unless defined(&CTF_K_MAX);
    eval 'sub _CTF_ENCODING {
        my($e) = @_;
	    eval q(((($e) & 0xff000000) >> 24));
    }' unless defined(&_CTF_ENCODING);
    eval 'sub _CTF_OFFSET {
        my($e) = @_;
	    eval q(((($e) & 0xff0000) >> 16));
    }' unless defined(&_CTF_OFFSET);
    eval 'sub _CTF_BITS {
        my($e) = @_;
	    eval q(((($e) & 0xffff)));
    }' unless defined(&_CTF_BITS);
    eval 'sub _CTF_DATA {
        my($encoding, $offset, $bits) = @_;
	    eval q(((($encoding) << 24) | (($offset) << 16) | ($bits)));
    }' unless defined(&_CTF_DATA);
    eval 'sub CTF_INT_ENCODING {
        my($e) = @_;
	    eval q( &_CTF_ENCODING($e));
    }' unless defined(&CTF_INT_ENCODING);
    eval 'sub CTF_INT_SIGNED () {(1<< 0);}' unless defined(&CTF_INT_SIGNED);
    eval 'sub CTF_INT_CHAR () {(1<< 1);}' unless defined(&CTF_INT_CHAR);
    eval 'sub CTF_INT_BOOL () {(1<< 2);}' unless defined(&CTF_INT_BOOL);
    eval 'sub CTF_INT_VARARGS () {(1<< 3);}' unless defined(&CTF_INT_VARARGS);
    eval 'sub CTF_INT_OFFSET {
        my($e) = @_;
	    eval q( &_CTF_OFFSET($e));
    }' unless defined(&CTF_INT_OFFSET);
    eval 'sub CTF_INT_BITS {
        my($e) = @_;
	    eval q( &_CTF_BITS($e));
    }' unless defined(&CTF_INT_BITS);
    eval 'sub CTF_INT_DATA {
        my($e, $o, $b) = @_;
	    eval q( &_CTF_DATA($e, $o, $b));
    }' unless defined(&CTF_INT_DATA);
    eval 'sub CTF_FP_ENCODING {
        my($e) = @_;
	    eval q( &_CTF_ENCODING($e));
    }' unless defined(&CTF_FP_ENCODING);
    eval 'sub CTF_FP_SINGLE () {1;}' unless defined(&CTF_FP_SINGLE);
    eval 'sub CTF_FP_DOUBLE () {2;}' unless defined(&CTF_FP_DOUBLE);
    eval 'sub CTF_FP_CPLX () {3;}' unless defined(&CTF_FP_CPLX);
    eval 'sub CTF_FP_DCPLX () {4;}' unless defined(&CTF_FP_DCPLX);
    eval 'sub CTF_FP_LDCPLX () {5;}' unless defined(&CTF_FP_LDCPLX);
    eval 'sub CTF_FP_LDOUBLE () {6;}' unless defined(&CTF_FP_LDOUBLE);
    eval 'sub CTF_FP_INTRVL () {7;}' unless defined(&CTF_FP_INTRVL);
    eval 'sub CTF_FP_DINTRVL () {8;}' unless defined(&CTF_FP_DINTRVL);
    eval 'sub CTF_FP_LDINTRVL () {9;}' unless defined(&CTF_FP_LDINTRVL);
    eval 'sub CTF_FP_IMAGRY () {10;}' unless defined(&CTF_FP_IMAGRY);
    eval 'sub CTF_FP_DIMAGRY () {11;}' unless defined(&CTF_FP_DIMAGRY);
    eval 'sub CTF_FP_LDIMAGRY () {12;}' unless defined(&CTF_FP_LDIMAGRY);
    eval 'sub CTF_FP_OFFSET {
        my($e) = @_;
	    eval q( &_CTF_OFFSET($e));
    }' unless defined(&CTF_FP_OFFSET);
    eval 'sub CTF_FP_BITS {
        my($e) = @_;
	    eval q( &_CTF_BITS($e));
    }' unless defined(&CTF_FP_BITS);
    eval 'sub CTF_FP_DATA {
        my($e, $o, $b) = @_;
	    eval q( &_CTF_DATA($e, $o, $b));
    }' unless defined(&CTF_FP_DATA);
    eval 'sub CTF_NAME_STID {
        my($n) = @_;
	    eval q((($n) >> 31));
    }' unless defined(&CTF_NAME_STID);
    eval 'sub CTF_NAME_OFFSET {
        my($n) = @_;
	    eval q((($n) &  &CTF_MAX_NAME));
    }' unless defined(&CTF_NAME_OFFSET);
    eval 'sub CTF_SIZE_TO_LSIZE_HI {
        my($s) = @_;
	    eval q((( &uint32_t)(( &uint64_t)($s) >> 32)));
    }' unless defined(&CTF_SIZE_TO_LSIZE_HI);
    eval 'sub CTF_SIZE_TO_LSIZE_LO {
        my($s) = @_;
	    eval q((( &uint32_t)($s)));
    }' unless defined(&CTF_SIZE_TO_LSIZE_LO);
    eval 'sub CTF_TYPE_LSIZE {
        my($t) = @_;
	    eval q(((( &uint64_t)($t)-> &ctt_lsizehi) << 32| ($t)-> &ctt_lsizelo));
    }' unless defined(&CTF_TYPE_LSIZE);
    eval 'sub CTF_LMEM_OFFSET {
        my($m) = @_;
	    eval q(((( &__uint64_t)($m)-> &ctlm_offsethi) << 32| ($m)-> &ctlm_offsetlo));
    }' unless defined(&CTF_LMEM_OFFSET);
    eval 'sub CTF_OFFSET_TO_LMEMHI {
        my($off) = @_;
	    eval q((( &__uint32_t)(( &__uint64_t)($off) >> 32)));
    }' unless defined(&CTF_OFFSET_TO_LMEMHI);
    eval 'sub CTF_OFFSET_TO_LMEMLO {
        my($off) = @_;
	    eval q((( &__uint32_t)($off)));
    }' unless defined(&CTF_OFFSET_TO_LMEMLO);
    eval 'sub CTF_INFO_KIND () { &CTF_V2_INFO_KIND;}' unless defined(&CTF_INFO_KIND);
    eval 'sub CTF_INFO_VLEN () { &CTF_V2_INFO_VLEN;}' unless defined(&CTF_INFO_VLEN);
    eval 'sub CTF_INFO_ISROOT () { &CTF_V2_INFO_ISROOT;}' unless defined(&CTF_INFO_ISROOT);
    eval 'sub CTF_TYPE_INFO () { &CTF_V2_TYPE_INFO;}' unless defined(&CTF_TYPE_INFO);
    eval 'sub CTF_TYPE_ISPARENT () { &CTF_V2_TYPE_ISPARENT;}' unless defined(&CTF_TYPE_ISPARENT);
    eval 'sub CTF_TYPE_ISCHILD () { &CTF_V2_TYPE_ISCHILD;}' unless defined(&CTF_TYPE_ISCHILD);
    eval 'sub CTF_TYPE_TO_INDEX () { &CTF_V2_TYPE_TO_INDEX;}' unless defined(&CTF_TYPE_TO_INDEX);
    eval 'sub CTF_INDEX_TO_TYPE () { &CTF_V2_INDEX_TO_TYPE;}' unless defined(&CTF_INDEX_TO_TYPE);
    eval 'sub CTF_LSIZE_SENT () { &CTF_V2_LSIZE_SENT;}' unless defined(&CTF_LSIZE_SENT);
    eval 'sub CTF_LSTRUCT_THRESH () { &CTF_V2_LSTRUCT_THRESH;}' unless defined(&CTF_LSTRUCT_THRESH);
    eval 'sub CTF_MAX_SIZE () { &CTF_V2_MAX_SIZE;}' unless defined(&CTF_MAX_SIZE);
    eval 'sub CTF_MAX_TYPE () { &CTF_V2_MAX_TYPE;}' unless defined(&CTF_MAX_TYPE);
    eval 'sub CTF_MAX_VLEN () { &CTF_V2_MAX_VLEN;}' unless defined(&CTF_MAX_VLEN);
}
1;

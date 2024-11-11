require '_h2ph_pre.ph';

no warnings qw(redefine misc);

unless(defined(&_SYS_SYSCTL_H_)) {
    eval 'sub _SYS_SYSCTL_H_ () {1;}' unless defined(&_SYS_SYSCTL_H_);
    if(defined(&_KERNEL)) {
	require 'sys/queue.ph';
	require 'sys/tree.ph';
    }
    eval 'sub CTL_MAXNAME () {24;}' unless defined(&CTL_MAXNAME);
    eval 'sub CTLTYPE () {0xf;}' unless defined(&CTLTYPE);
    eval 'sub CTLTYPE_NODE () {1;}' unless defined(&CTLTYPE_NODE);
    eval 'sub CTLTYPE_INT () {2;}' unless defined(&CTLTYPE_INT);
    eval 'sub CTLTYPE_STRING () {3;}' unless defined(&CTLTYPE_STRING);
    eval 'sub CTLTYPE_S64 () {4;}' unless defined(&CTLTYPE_S64);
    eval 'sub CTLTYPE_OPAQUE () {5;}' unless defined(&CTLTYPE_OPAQUE);
    eval 'sub CTLTYPE_STRUCT () { &CTLTYPE_OPAQUE;}' unless defined(&CTLTYPE_STRUCT);
    eval 'sub CTLTYPE_UINT () {6;}' unless defined(&CTLTYPE_UINT);
    eval 'sub CTLTYPE_LONG () {7;}' unless defined(&CTLTYPE_LONG);
    eval 'sub CTLTYPE_ULONG () {8;}' unless defined(&CTLTYPE_ULONG);
    eval 'sub CTLTYPE_U64 () {9;}' unless defined(&CTLTYPE_U64);
    eval 'sub CTLTYPE_U8 () {0xa;}' unless defined(&CTLTYPE_U8);
    eval 'sub CTLTYPE_U16 () {0xb;}' unless defined(&CTLTYPE_U16);
    eval 'sub CTLTYPE_S8 () {0xc;}' unless defined(&CTLTYPE_S8);
    eval 'sub CTLTYPE_S16 () {0xd;}' unless defined(&CTLTYPE_S16);
    eval 'sub CTLTYPE_S32 () {0xe;}' unless defined(&CTLTYPE_S32);
    eval 'sub CTLTYPE_U32 () {0xf;}' unless defined(&CTLTYPE_U32);
    eval 'sub CTLFLAG_RD () {0x80000000;}' unless defined(&CTLFLAG_RD);
    eval 'sub CTLFLAG_WR () {0x40000000;}' unless defined(&CTLFLAG_WR);
    eval 'sub CTLFLAG_RW () {( &CTLFLAG_RD| &CTLFLAG_WR);}' unless defined(&CTLFLAG_RW);
    eval 'sub CTLFLAG_DORMANT () {0x20000000;}' unless defined(&CTLFLAG_DORMANT);
    eval 'sub CTLFLAG_ANYBODY () {0x10000000;}' unless defined(&CTLFLAG_ANYBODY);
    eval 'sub CTLFLAG_SECURE () {0x8000000;}' unless defined(&CTLFLAG_SECURE);
    eval 'sub CTLFLAG_PRISON () {0x4000000;}' unless defined(&CTLFLAG_PRISON);
    eval 'sub CTLFLAG_DYN () {0x2000000;}' unless defined(&CTLFLAG_DYN);
    eval 'sub CTLFLAG_SKIP () {0x1000000;}' unless defined(&CTLFLAG_SKIP);
    eval 'sub CTLMASK_SECURE () {0xf00000;}' unless defined(&CTLMASK_SECURE);
    eval 'sub CTLFLAG_TUN () {0x80000;}' unless defined(&CTLFLAG_TUN);
    eval 'sub CTLFLAG_RDTUN () {( &CTLFLAG_RD| &CTLFLAG_TUN);}' unless defined(&CTLFLAG_RDTUN);
    eval 'sub CTLFLAG_RWTUN () {( &CTLFLAG_RW| &CTLFLAG_TUN);}' unless defined(&CTLFLAG_RWTUN);
    eval 'sub CTLFLAG_MPSAFE () {0x40000;}' unless defined(&CTLFLAG_MPSAFE);
    eval 'sub CTLFLAG_VNET () {0x20000;}' unless defined(&CTLFLAG_VNET);
    eval 'sub CTLFLAG_DYING () {0x10000;}' unless defined(&CTLFLAG_DYING);
    eval 'sub CTLFLAG_CAPRD () {0x8000;}' unless defined(&CTLFLAG_CAPRD);
    eval 'sub CTLFLAG_CAPWR () {0x4000;}' unless defined(&CTLFLAG_CAPWR);
    eval 'sub CTLFLAG_STATS () {0x2000;}' unless defined(&CTLFLAG_STATS);
    eval 'sub CTLFLAG_NOFETCH () {0x1000;}' unless defined(&CTLFLAG_NOFETCH);
    eval 'sub CTLFLAG_CAPRW () {( &CTLFLAG_CAPRD| &CTLFLAG_CAPWR);}' unless defined(&CTLFLAG_CAPRW);
    eval 'sub CTLFLAG_NEEDGIANT () {0x800;}' unless defined(&CTLFLAG_NEEDGIANT);
    eval 'sub CTLSHIFT_SECURE () {20;}' unless defined(&CTLSHIFT_SECURE);
    eval 'sub CTLFLAG_SECURE1 () {( &CTLFLAG_SECURE | (0<<  &CTLSHIFT_SECURE));}' unless defined(&CTLFLAG_SECURE1);
    eval 'sub CTLFLAG_SECURE2 () {( &CTLFLAG_SECURE | (1<<  &CTLSHIFT_SECURE));}' unless defined(&CTLFLAG_SECURE2);
    eval 'sub CTLFLAG_SECURE3 () {( &CTLFLAG_SECURE | (2<<  &CTLSHIFT_SECURE));}' unless defined(&CTLFLAG_SECURE3);
    eval 'sub OID_AUTO () {(-1);}' unless defined(&OID_AUTO);
    eval 'sub CTL_AUTO_START () {0x100;}' unless defined(&CTL_AUTO_START);
    if(defined(&_KERNEL)) {
	require 'sys/linker_set.ph';
	if(defined(&KLD_MODULE)) {
	    eval 'sub SYSCTL_CT_ASSERT_MASK () { &CTLTYPE;}' unless defined(&SYSCTL_CT_ASSERT_MASK);
	} else {
	    eval 'sub SYSCTL_CT_ASSERT_MASK () {0;}' unless defined(&SYSCTL_CT_ASSERT_MASK);
	}
	eval 'sub SYSCTL_HANDLER_ARGS () {\'struct sysctl_oid\' * &oidp,  &void * &arg1,  &intmax_t  &arg2, \'struct sysctl_req\' * &req;}' unless defined(&SYSCTL_HANDLER_ARGS);
	eval 'sub REQ_UNWIRED () {1;}' unless defined(&REQ_UNWIRED);
	eval 'sub REQ_WIRED () {2;}' unless defined(&REQ_WIRED);
	if(defined(&COMPAT_FREEBSD32)) {
	    eval 'sub SCTL_MASK32 () {1;}' unless defined(&SCTL_MASK32);
	}
	eval 'sub cmp_sysctl_oid {
	    my($a,$b) = @_;
    	    eval q({  &if ( ($a->{oid_number}) >  ($b->{oid_number})) (1);  &else  &if ( ($a->{oid_number}) <  ($b->{oid_number})) (-1);  &else (0); });
	}' unless defined(&cmp_sysctl_oid);
	eval 'sub SYSCTL_IN {
	    my($r, $p, $l) = @_;
    	    eval q(( ($r->{newfunc}))($r, $p, $l));
	}' unless defined(&SYSCTL_IN);
	eval 'sub SYSCTL_OUT {
	    my($r, $p, $l) = @_;
    	    eval q(( ($r->{o$ldfunc}))($r, $p, $l));
	}' unless defined(&SYSCTL_OUT);
	eval 'sub SYSCTL_OUT_STR {
	    my($r, $p) = @_;
    	    eval q(( ($r->{oldfunc}))($r, $p,  &strlen($p) + 1));
	}' unless defined(&SYSCTL_OUT_STR);
	eval 'sub SYSCTL_DECL {
	    my($name) = @_;
    	    eval q( &extern \'struct sysctl_oid\'  &sysctl__$name);
	}' unless defined(&SYSCTL_DECL);
	eval 'sub SYSCTL_CHILDREN {
	    my($oid_ptr) = @_;
    	    eval q((($oid_ptr)-> &oid_children));
	}' unless defined(&SYSCTL_CHILDREN);
	eval 'sub SYSCTL_PARENT {
	    my($oid_ptr) = @_;
    	    eval q(((($oid_ptr)-> &oid_parent !=  &sysctl__children) ?  &__containerof(($oid_ptr)-> &oid_parent, \'struct sysctl_oid\',  &oid_children) :  &NULL));
	}' unless defined(&SYSCTL_PARENT);
	eval 'sub SYSCTL_STATIC_CHILDREN {
	    my($oid_name) = @_;
    	    eval q(( &sysctl__ ($oid_name->{oid_children})));
	}' unless defined(&SYSCTL_STATIC_CHILDREN);
	eval 'sub SYSCTL_NODE_CHILDREN {
	    my($parent, $name) = @_;
    	    eval q( &sysctl__$parent &_ ($name->{oid_children}));
	}' unless defined(&SYSCTL_NODE_CHILDREN);
	unless(defined(&NO_SYSCTL_DESCR)) {
	    eval 'sub __DESCR {
	        my($d) = @_;
    		eval q($d);
	    }' unless defined(&__DESCR);
	} else {
	    eval 'sub __DESCR {
	        my($d) = @_;
    		eval q(\\"\\");
	    }' unless defined(&__DESCR);
	}
	if(defined(&notyet)) {
	    eval 'sub SYSCTL_ENFORCE_FLAGS {
	        my($x) = @_;
    		eval q( &_Static_assert(((($x) &  &CTLFLAG_MPSAFE) != 0) ^ ((($x) &  &CTLFLAG_NEEDGIANT) != 0), \\"Has to be either CTLFLAG_MPSAFE or CTLFLAG_NEEDGIANT\\"));
	    }' unless defined(&SYSCTL_ENFORCE_FLAGS);
	} else {
	    eval 'sub SYSCTL_ENFORCE_FLAGS {
	        my($x) = @_;
    		eval q();
	    }' unless defined(&SYSCTL_ENFORCE_FLAGS);
	}
	eval 'sub SYSCTL_OID_RAW {
	    my($id, $parent_child_head, $nbr, $name, $kind, $a1, $a2, $handler, $fmt, $descr, $label) = @_;
    	    eval q(\'struct sysctl_oid\' $id = { . &oid_parent = ($parent_child_head), . &oid_children =  &RB_INITIALIZER( ($id->{o$id_children})), . &oid_number = ($nbr), . &oid_kind = ($kind), . &oid_arg1 = ($a1), . &oid_arg2 = ($a2), . &oid_name = ($name), . &oid_handler = ($handler), . &oid_fmt = ($fmt), . &oid_descr =  &__DESCR($descr), . &oid_label = ($label), };  &DATA_SET( &sysctl_set, $id);  &SYSCTL_ENFORCE_FLAGS($kind));
	}' unless defined(&SYSCTL_OID_RAW);
	eval 'sub SYSCTL_OID {
	    my($parent, $nbr, $name, $kind, $a1, $a2, $handler, $fmt, $descr) = @_;
    	    eval q( &SYSCTL_OID_WITH_LABEL($parent, $nbr, $name, $kind, $a1, $a2, $handler, $fmt, $descr,  &NULL));
	}' unless defined(&SYSCTL_OID);
	eval 'sub SYSCTL_OID_WITH_LABEL {
	    my($parent, $nbr, $name, $kind, $a1, $a2, $handler, $fmt, $descr, $label) = @_;
    	    eval q( &static  &SYSCTL_OID_RAW( &sysctl__$parent &_$name,  &SYSCTL_CHILDREN( &sysctl__$parent), $nbr, $name, $kind, $a1, $a2, $handler, $fmt, $descr, $label));
	}' unless defined(&SYSCTL_OID_WITH_LABEL);
	eval 'sub SYSCTL_OID_GLOBAL {
	    my($parent, $nbr, $name, $kind, $a1, $a2, $handler, $fmt, $descr, $label) = @_;
    	    eval q( &SYSCTL_OID_RAW( &sysctl__$parent &_$name,  &SYSCTL_CHILDREN( &sysctl__$parent), $nbr, $name, $kind, $a1, $a2, $handler, $fmt, $descr, $label));
	}' unless defined(&SYSCTL_OID_GLOBAL);
	eval 'sub SYSCTL_ADD_OID {
	    my($ctx, $parent, $nbr, $name, $kind, $a1, $a2, $handler, $fmt, $descr) = @_;
    	    eval q(({  &SYSCTL_ENFORCE_FLAGS($kind);  &sysctl_add_oid($ctx, $parent, $nbr, $name, $kind, $a1, $a2,$handler, $fmt,  &__DESCR($descr),  &NULL); }));
	}' unless defined(&SYSCTL_ADD_OID);
	eval 'sub SYSCTL_ROOT_NODE {
	    my($nbr, $name, $access, $handler, $descr) = @_;
    	    eval q( &SYSCTL_OID_RAW( &sysctl___$name,  &sysctl__children, $nbr, $name,  &CTLTYPE_NODE|($access),  &NULL, 0, $handler, \\"N\\", $descr,  &NULL);  &CTASSERT((($access) &  &CTLTYPE) == 0|| (($access) &  &SYSCTL_CT_ASSERT_MASK) ==  &CTLTYPE_NODE));
	}' unless defined(&SYSCTL_ROOT_NODE);
	eval 'sub SYSCTL_NODE {
	    my($parent, $nbr, $name, $access, $handler, $descr) = @_;
    	    eval q( &SYSCTL_NODE_WITH_LABEL($parent, $nbr, $name, $access, $handler, $descr,  &NULL));
	}' unless defined(&SYSCTL_NODE);
	eval 'sub SYSCTL_NODE_WITH_LABEL {
	    my($parent, $nbr, $name, $access, $handler, $descr, $label) = @_;
    	    eval q( &SYSCTL_OID_GLOBAL($parent, $nbr, $name,  &CTLTYPE_NODE|($access),  &NULL, 0, $handler, \\"N\\", $descr, $label);  &SYSCTL_ENFORCE_FLAGS($access);  &CTASSERT((($access) &  &CTLTYPE) == 0|| (($access) &  &SYSCTL_CT_ASSERT_MASK) ==  &CTLTYPE_NODE));
	}' unless defined(&SYSCTL_NODE_WITH_LABEL);
	eval 'sub SYSCTL_ADD_NODE {
	    my($ctx, $parent, $nbr, $name, $access, $handler, $descr) = @_;
    	    eval q( &SYSCTL_ADD_NODE_WITH_LABEL($ctx, $parent, $nbr, $name, $access, $handler, $descr,  &NULL));
	}' unless defined(&SYSCTL_ADD_NODE);
	eval 'sub SYSCTL_ADD_NODE_WITH_LABEL {
	    my($ctx, $parent, $nbr, $name, $access, $handler, $descr, $label) = @_;
    	    eval q(({  &CTASSERT((($access) &  &CTLTYPE) == 0|| (($access) &  &SYSCTL_CT_ASSERT_MASK) ==  &CTLTYPE_NODE);  &SYSCTL_ENFORCE_FLAGS($access);  &sysctl_add_oid($ctx, $parent, $nbr, $name,  &CTLTYPE_NODE|($access),  &NULL, 0, $handler, \\"N\\",  &__DESCR($descr), $label); }));
	}' unless defined(&SYSCTL_ADD_NODE_WITH_LABEL);
	eval 'sub SYSCTL_ADD_ROOT_NODE {
	    my($ctx, $nbr, $name, $access, $handler, $descr) = @_;
    	    eval q(({  &CTASSERT((($access) &  &CTLTYPE) == 0|| (($access) &  &SYSCTL_CT_ASSERT_MASK) ==  &CTLTYPE_NODE);  &SYSCTL_ENFORCE_FLAGS($access);  &sysctl_add_oid($ctx,  &sysctl__children, $nbr, $name,  &CTLTYPE_NODE|($access),  &NULL, 0, $handler, \\"N\\",  &__DESCR($descr),  &NULL); }));
	}' unless defined(&SYSCTL_ADD_ROOT_NODE);
	eval 'sub SYSCTL_STRING {
	    my($parent, $nbr, $name, $access, $arg, $len, $descr) = @_;
    	    eval q( &SYSCTL_OID($parent, $nbr, $name,  &CTLTYPE_STRING |  &CTLFLAG_MPSAFE | ($access), $arg, $len,  &sysctl_handle_string, \\"A\\", $descr);  &CTASSERT((($access) &  &CTLTYPE) == 0|| (($access) &  &SYSCTL_CT_ASSERT_MASK) ==  &CTLTYPE_STRING));
	}' unless defined(&SYSCTL_STRING);
	eval 'sub SYSCTL_ADD_STRING {
	    my($ctx, $parent, $nbr, $name, $access, $arg, $len, $descr) = @_;
    	    eval q(({ \'char\' * &__arg = ($arg);  &CTASSERT((($access) &  &CTLTYPE) == 0|| (($access) &  &SYSCTL_CT_ASSERT_MASK) ==  &CTLTYPE_STRING);  &sysctl_add_oid($ctx, $parent, $nbr, $name,  &CTLTYPE_STRING |  &CTLFLAG_MPSAFE | ($access),  &__arg, $len,  &sysctl_handle_string, \\"A\\",  &__DESCR($descr),  &NULL); }));
	}' unless defined(&SYSCTL_ADD_STRING);
	eval 'sub SYSCTL_CONST_STRING {
	    my($parent, $nbr, $name, $access, $arg, $descr) = @_;
    	    eval q( &SYSCTL_OID($parent, $nbr, $name,  &CTLTYPE_STRING |  &CTLFLAG_MPSAFE | ($access),  &__DECONST(\'char\' *, $arg), 0,  &sysctl_handle_string, \\"A\\", $descr);  &CTASSERT(!($access &  &CTLFLAG_WR));  &CTASSERT((($access) &  &CTLTYPE) == 0|| (($access) &  &SYSCTL_CT_ASSERT_MASK) ==  &CTLTYPE_STRING));
	}' unless defined(&SYSCTL_CONST_STRING);
	eval 'sub SYSCTL_ADD_CONST_STRING {
	    my($ctx, $parent, $nbr, $name, $access, $arg, $descr) = @_;
    	    eval q(({ \'char\' * &__arg =  &__DECONST(\'char\' *, $arg);  &CTASSERT(!($access &  &CTLFLAG_WR));  &CTASSERT((($access) &  &CTLTYPE) == 0|| (($access) &  &SYSCTL_CT_ASSERT_MASK) ==  &CTLTYPE_STRING);  &sysctl_add_oid($ctx, $parent, $nbr, $name,  &CTLTYPE_STRING |  &CTLFLAG_MPSAFE | ($access),  &__arg, 0,  &sysctl_handle_string, \\"A\\",  &__DESCR($descr),  &NULL); }));
	}' unless defined(&SYSCTL_ADD_CONST_STRING);
	eval 'sub SYSCTL_NULL_BOOL_PTR () {(( &bool *) &NULL);}' unless defined(&SYSCTL_NULL_BOOL_PTR);
	eval 'sub SYSCTL_BOOL {
	    my($parent, $nbr, $name, $access, $ptr, $val, $descr) = @_;
    	    eval q( &SYSCTL_OID($parent, $nbr, $name,  &CTLTYPE_U8 |  &CTLFLAG_MPSAFE | ($access), $ptr, $val,  &sysctl_handle_bool, \\"CU\\", $descr);  &CTASSERT((($access) &  &CTLTYPE) == 0 && $sizeof{ &bool} == $sizeof{($ptr)}));
	}' unless defined(&SYSCTL_BOOL);
	eval 'sub SYSCTL_ADD_BOOL {
	    my($ctx, $parent, $nbr, $name, $access, $ptr, $val, $descr) = @_;
    	    eval q(({  &bool * &__ptr = ($ptr);  &CTASSERT((($access) &  &CTLTYPE) == 0);  &sysctl_add_oid($ctx, $parent, $nbr, $name,  &CTLTYPE_U8 |  &CTLFLAG_MPSAFE | ($access),  &__ptr, $val,  &sysctl_handle_bool, \\"CU\\",  &__DESCR($descr),  &NULL); }));
	}' unless defined(&SYSCTL_ADD_BOOL);
	eval 'sub SYSCTL_NULL_S8_PTR () {(( &int8_t *) &NULL);}' unless defined(&SYSCTL_NULL_S8_PTR);
	eval 'sub SYSCTL_S8 {
	    my($parent, $nbr, $name, $access, $ptr, $val, $descr) = @_;
    	    eval q( &SYSCTL_OID($parent, $nbr, $name,  &CTLTYPE_S8 |  &CTLFLAG_MPSAFE | ($access), $ptr, $val,  &sysctl_handle_8, \\"C\\", $descr);  &CTASSERT(((($access) &  &CTLTYPE) == 0|| (($access) &  &SYSCTL_CT_ASSERT_MASK) ==  &CTLTYPE_S8)  && $sizeof{ &int8_t} == $sizeof{($ptr)}));
	}' unless defined(&SYSCTL_S8);
	eval 'sub SYSCTL_ADD_S8 {
	    my($ctx, $parent, $nbr, $name, $access, $ptr, $val, $descr) = @_;
    	    eval q(({  &int8_t * &__ptr = ($ptr);  &CTASSERT((($access) &  &CTLTYPE) == 0|| (($access) &  &SYSCTL_CT_ASSERT_MASK) ==  &CTLTYPE_S8);  &sysctl_add_oid($ctx, $parent, $nbr, $name,  &CTLTYPE_S8 |  &CTLFLAG_MPSAFE | ($access),  &__ptr, $val,  &sysctl_handle_8, \\"C\\",  &__DESCR($descr),  &NULL); }));
	}' unless defined(&SYSCTL_ADD_S8);
	eval 'sub SYSCTL_NULL_U8_PTR () {(( &uint8_t *) &NULL);}' unless defined(&SYSCTL_NULL_U8_PTR);
	eval 'sub SYSCTL_U8 {
	    my($parent, $nbr, $name, $access, $ptr, $val, $descr) = @_;
    	    eval q( &SYSCTL_OID($parent, $nbr, $name,  &CTLTYPE_U8 |  &CTLFLAG_MPSAFE | ($access), $ptr, $val,  &sysctl_handle_8, \\"CU\\", $descr);  &CTASSERT(((($access) &  &CTLTYPE) == 0|| (($access) &  &SYSCTL_CT_ASSERT_MASK) ==  &CTLTYPE_U8)  && $sizeof{ &uint8_t} == $sizeof{($ptr)}));
	}' unless defined(&SYSCTL_U8);
	eval 'sub SYSCTL_ADD_U8 {
	    my($ctx, $parent, $nbr, $name, $access, $ptr, $val, $descr) = @_;
    	    eval q(({  &uint8_t * &__ptr = ($ptr);  &CTASSERT((($access) &  &CTLTYPE) == 0|| (($access) &  &SYSCTL_CT_ASSERT_MASK) ==  &CTLTYPE_U8);  &sysctl_add_oid($ctx, $parent, $nbr, $name,  &CTLTYPE_U8 |  &CTLFLAG_MPSAFE | ($access),  &__ptr, $val,  &sysctl_handle_8, \\"CU\\",  &__DESCR($descr),  &NULL); }));
	}' unless defined(&SYSCTL_ADD_U8);
	eval 'sub SYSCTL_NULL_S16_PTR () {(( &int16_t *) &NULL);}' unless defined(&SYSCTL_NULL_S16_PTR);
	eval 'sub SYSCTL_S16 {
	    my($parent, $nbr, $name, $access, $ptr, $val, $descr) = @_;
    	    eval q( &SYSCTL_OID($parent, $nbr, $name,  &CTLTYPE_S16 |  &CTLFLAG_MPSAFE | ($access), $ptr, $val,  &sysctl_handle_16, \\"S\\", $descr);  &CTASSERT(((($access) &  &CTLTYPE) == 0|| (($access) &  &SYSCTL_CT_ASSERT_MASK) ==  &CTLTYPE_S16)  && $sizeof{ &int16_t} == $sizeof{($ptr)}));
	}' unless defined(&SYSCTL_S16);
	eval 'sub SYSCTL_ADD_S16 {
	    my($ctx, $parent, $nbr, $name, $access, $ptr, $val, $descr) = @_;
    	    eval q(({  &int16_t * &__ptr = ($ptr);  &CTASSERT((($access) &  &CTLTYPE) == 0|| (($access) &  &SYSCTL_CT_ASSERT_MASK) ==  &CTLTYPE_S16);  &sysctl_add_oid($ctx, $parent, $nbr, $name,  &CTLTYPE_S16 |  &CTLFLAG_MPSAFE | ($access),  &__ptr, $val,  &sysctl_handle_16, \\"S\\",  &__DESCR($descr),  &NULL); }));
	}' unless defined(&SYSCTL_ADD_S16);
	eval 'sub SYSCTL_NULL_U16_PTR () {(( &uint16_t *) &NULL);}' unless defined(&SYSCTL_NULL_U16_PTR);
	eval 'sub SYSCTL_U16 {
	    my($parent, $nbr, $name, $access, $ptr, $val, $descr) = @_;
    	    eval q( &SYSCTL_OID($parent, $nbr, $name,  &CTLTYPE_U16 |  &CTLFLAG_MPSAFE | ($access), $ptr, $val,  &sysctl_handle_16, \\"SU\\", $descr);  &CTASSERT(((($access) &  &CTLTYPE) == 0|| (($access) &  &SYSCTL_CT_ASSERT_MASK) ==  &CTLTYPE_U16)  && $sizeof{ &uint16_t} == $sizeof{($ptr)}));
	}' unless defined(&SYSCTL_U16);
	eval 'sub SYSCTL_ADD_U16 {
	    my($ctx, $parent, $nbr, $name, $access, $ptr, $val, $descr) = @_;
    	    eval q(({  &uint16_t * &__ptr = ($ptr);  &CTASSERT((($access) &  &CTLTYPE) == 0|| (($access) &  &SYSCTL_CT_ASSERT_MASK) ==  &CTLTYPE_U16);  &sysctl_add_oid($ctx, $parent, $nbr, $name,  &CTLTYPE_U16 |  &CTLFLAG_MPSAFE | ($access),  &__ptr, $val,  &sysctl_handle_16, \\"SU\\",  &__DESCR($descr),  &NULL); }));
	}' unless defined(&SYSCTL_ADD_U16);
	eval 'sub SYSCTL_NULL_S32_PTR () {(( &int32_t *) &NULL);}' unless defined(&SYSCTL_NULL_S32_PTR);
	eval 'sub SYSCTL_S32 {
	    my($parent, $nbr, $name, $access, $ptr, $val, $descr) = @_;
    	    eval q( &SYSCTL_OID($parent, $nbr, $name,  &CTLTYPE_S32 |  &CTLFLAG_MPSAFE | ($access), $ptr, $val,  &sysctl_handle_32, \\"I\\", $descr);  &CTASSERT(((($access) &  &CTLTYPE) == 0|| (($access) &  &SYSCTL_CT_ASSERT_MASK) ==  &CTLTYPE_S32)  && $sizeof{ &int32_t} == $sizeof{($ptr)}));
	}' unless defined(&SYSCTL_S32);
	eval 'sub SYSCTL_ADD_S32 {
	    my($ctx, $parent, $nbr, $name, $access, $ptr, $val, $descr) = @_;
    	    eval q(({  &int32_t * &__ptr = ($ptr);  &CTASSERT((($access) &  &CTLTYPE) == 0|| (($access) &  &SYSCTL_CT_ASSERT_MASK) ==  &CTLTYPE_S32);  &sysctl_add_oid($ctx, $parent, $nbr, $name,  &CTLTYPE_S32 |  &CTLFLAG_MPSAFE | ($access),  &__ptr, $val,  &sysctl_handle_32, \\"I\\",  &__DESCR($descr),  &NULL); }));
	}' unless defined(&SYSCTL_ADD_S32);
	eval 'sub SYSCTL_NULL_U32_PTR () {(( &uint32_t *) &NULL);}' unless defined(&SYSCTL_NULL_U32_PTR);
	eval 'sub SYSCTL_U32 {
	    my($parent, $nbr, $name, $access, $ptr, $val, $descr) = @_;
    	    eval q( &SYSCTL_OID($parent, $nbr, $name,  &CTLTYPE_U32 |  &CTLFLAG_MPSAFE | ($access), $ptr, $val,  &sysctl_handle_32, \\"IU\\", $descr);  &CTASSERT(((($access) &  &CTLTYPE) == 0|| (($access) &  &SYSCTL_CT_ASSERT_MASK) ==  &CTLTYPE_U32)  && $sizeof{ &uint32_t} == $sizeof{($ptr)}));
	}' unless defined(&SYSCTL_U32);
	eval 'sub SYSCTL_ADD_U32 {
	    my($ctx, $parent, $nbr, $name, $access, $ptr, $val, $descr) = @_;
    	    eval q(({  &uint32_t * &__ptr = ($ptr);  &CTASSERT((($access) &  &CTLTYPE) == 0|| (($access) &  &SYSCTL_CT_ASSERT_MASK) ==  &CTLTYPE_U32);  &sysctl_add_oid($ctx, $parent, $nbr, $name,  &CTLTYPE_U32 |  &CTLFLAG_MPSAFE | ($access),  &__ptr, $val,  &sysctl_handle_32, \\"IU\\",  &__DESCR($descr),  &NULL); }));
	}' unless defined(&SYSCTL_ADD_U32);
	eval 'sub SYSCTL_NULL_S64_PTR () {(( &int64_t *) &NULL);}' unless defined(&SYSCTL_NULL_S64_PTR);
	eval 'sub SYSCTL_S64 {
	    my($parent, $nbr, $name, $access, $ptr, $val, $descr) = @_;
    	    eval q( &SYSCTL_OID($parent, $nbr, $name,  &CTLTYPE_S64 |  &CTLFLAG_MPSAFE | ($access), $ptr, $val,  &sysctl_handle_64, \\"Q\\", $descr);  &CTASSERT(((($access) &  &CTLTYPE) == 0|| (($access) &  &SYSCTL_CT_ASSERT_MASK) ==  &CTLTYPE_S64)  && $sizeof{ &int64_t} == $sizeof{($ptr)}));
	}' unless defined(&SYSCTL_S64);
	eval 'sub SYSCTL_ADD_S64 {
	    my($ctx, $parent, $nbr, $name, $access, $ptr, $val, $descr) = @_;
    	    eval q(({  &int64_t * &__ptr = ($ptr);  &CTASSERT((($access) &  &CTLTYPE) == 0|| (($access) &  &SYSCTL_CT_ASSERT_MASK) ==  &CTLTYPE_S64);  &sysctl_add_oid($ctx, $parent, $nbr, $name,  &CTLTYPE_S64 |  &CTLFLAG_MPSAFE | ($access),  &__ptr, $val,  &sysctl_handle_64, \\"Q\\",  &__DESCR($descr),  &NULL); }));
	}' unless defined(&SYSCTL_ADD_S64);
	eval 'sub SYSCTL_NULL_U64_PTR () {(( &uint64_t *) &NULL);}' unless defined(&SYSCTL_NULL_U64_PTR);
	eval 'sub SYSCTL_U64 {
	    my($parent, $nbr, $name, $access, $ptr, $val, $descr) = @_;
    	    eval q( &SYSCTL_OID($parent, $nbr, $name,  &CTLTYPE_U64 |  &CTLFLAG_MPSAFE | ($access), $ptr, $val,  &sysctl_handle_64, \\"QU\\", $descr);  &CTASSERT(((($access) &  &CTLTYPE) == 0|| (($access) &  &SYSCTL_CT_ASSERT_MASK) ==  &CTLTYPE_U64)  && $sizeof{ &uint64_t} == $sizeof{($ptr)}));
	}' unless defined(&SYSCTL_U64);
	eval 'sub SYSCTL_ADD_U64 {
	    my($ctx, $parent, $nbr, $name, $access, $ptr, $val, $descr) = @_;
    	    eval q(({  &uint64_t * &__ptr = ($ptr);  &CTASSERT((($access) &  &CTLTYPE) == 0|| (($access) &  &SYSCTL_CT_ASSERT_MASK) ==  &CTLTYPE_U64);  &sysctl_add_oid($ctx, $parent, $nbr, $name,  &CTLTYPE_U64 |  &CTLFLAG_MPSAFE | ($access),  &__ptr, $val,  &sysctl_handle_64, \\"QU\\",  &__DESCR($descr),  &NULL); }));
	}' unless defined(&SYSCTL_ADD_U64);
	eval 'sub SYSCTL_NULL_INT_PTR () {( &NULL);}' unless defined(&SYSCTL_NULL_INT_PTR);
	eval 'sub SYSCTL_INT {
	    my($parent, $nbr, $name, $access, $ptr, $val, $descr) = @_;
    	    eval q( &SYSCTL_INT_WITH_LABEL($parent, $nbr, $name, $access, $ptr, $val, $descr,  &NULL));
	}' unless defined(&SYSCTL_INT);
	eval 'sub SYSCTL_INT_WITH_LABEL {
	    my($parent, $nbr, $name, $access, $ptr, $val, $descr, $label) = @_;
    	    eval q( &SYSCTL_OID_WITH_LABEL($parent, $nbr, $name,  &CTLTYPE_INT |  &CTLFLAG_MPSAFE | ($access), $ptr, $val,  &sysctl_handle_int, \\"I\\", $descr, $label);  &CTASSERT(((($access) &  &CTLTYPE) == 0|| (($access) &  &SYSCTL_CT_ASSERT_MASK) ==  &CTLTYPE_INT)  && $sizeof{\'int\'} == $sizeof{($ptr)}));
	}' unless defined(&SYSCTL_INT_WITH_LABEL);
	eval 'sub SYSCTL_ADD_INT {
	    my($ctx, $parent, $nbr, $name, $access, $ptr, $val, $descr) = @_;
    	    eval q(({ \'int\' * &__ptr = ($ptr);  &CTASSERT((($access) &  &CTLTYPE) == 0|| (($access) &  &SYSCTL_CT_ASSERT_MASK) ==  &CTLTYPE_INT);  &sysctl_add_oid($ctx, $parent, $nbr, $name,  &CTLTYPE_INT |  &CTLFLAG_MPSAFE | ($access),  &__ptr, $val,  &sysctl_handle_int, \\"I\\",  &__DESCR($descr),  &NULL); }));
	}' unless defined(&SYSCTL_ADD_INT);
	eval 'sub SYSCTL_NULL_UINT_PTR () {( &NULL);}' unless defined(&SYSCTL_NULL_UINT_PTR);
	eval 'sub SYSCTL_UINT {
	    my($parent, $nbr, $name, $access, $ptr, $val, $descr) = @_;
    	    eval q( &SYSCTL_OID($parent, $nbr, $name,  &CTLTYPE_UINT |  &CTLFLAG_MPSAFE | ($access), $ptr, $val,  &sysctl_handle_int, \\"IU\\", $descr);  &CTASSERT(((($access) &  &CTLTYPE) == 0|| (($access) &  &SYSCTL_CT_ASSERT_MASK) ==  &CTLTYPE_UINT)  && $sizeof{\'unsigned\'} == $sizeof{($ptr)}));
	}' unless defined(&SYSCTL_UINT);
	eval 'sub SYSCTL_ADD_UINT {
	    my($ctx, $parent, $nbr, $name, $access, $ptr, $val, $descr) = @_;
    	    eval q(({ \'unsigned\' * &__ptr = ($ptr);  &CTASSERT((($access) &  &CTLTYPE) == 0|| (($access) &  &SYSCTL_CT_ASSERT_MASK) ==  &CTLTYPE_UINT);  &sysctl_add_oid($ctx, $parent, $nbr, $name,  &CTLTYPE_UINT |  &CTLFLAG_MPSAFE | ($access),  &__ptr, $val,  &sysctl_handle_int, \\"IU\\",  &__DESCR($descr),  &NULL); }));
	}' unless defined(&SYSCTL_ADD_UINT);
	eval 'sub SYSCTL_NULL_LONG_PTR () {( &NULL);}' unless defined(&SYSCTL_NULL_LONG_PTR);
	eval 'sub SYSCTL_LONG {
	    my($parent, $nbr, $name, $access, $ptr, $val, $descr) = @_;
    	    eval q( &SYSCTL_OID($parent, $nbr, $name,  &CTLTYPE_LONG |  &CTLFLAG_MPSAFE | ($access), $ptr, $val, \'sysctl_handle_long\', \\"L\\", $descr);  &CTASSERT(((($access) &  &CTLTYPE) == 0|| (($access) &  &SYSCTL_CT_ASSERT_MASK) ==  &CTLTYPE_LONG)  && $sizeof{\'long\'} == $sizeof{($ptr)}));
	}' unless defined(&SYSCTL_LONG);
	eval 'sub SYSCTL_ADD_LONG {
	    my($ctx, $parent, $nbr, $name, $access, $ptr, $descr) = @_;
    	    eval q(({ \'long\' * &__ptr = ($ptr);  &CTASSERT((($access) &  &CTLTYPE) == 0|| (($access) &  &SYSCTL_CT_ASSERT_MASK) ==  &CTLTYPE_LONG);  &sysctl_add_oid($ctx, $parent, $nbr, $name,  &CTLTYPE_LONG |  &CTLFLAG_MPSAFE | ($access),  &__ptr, 0, \'sysctl_handle_long\', \\"L\\",  &__DESCR($descr),  &NULL); }));
	}' unless defined(&SYSCTL_ADD_LONG);
	eval 'sub SYSCTL_NULL_ULONG_PTR () {( &NULL);}' unless defined(&SYSCTL_NULL_ULONG_PTR);
	eval 'sub SYSCTL_ULONG {
	    my($parent, $nbr, $name, $access, $ptr, $val, $descr) = @_;
    	    eval q( &SYSCTL_OID($parent, $nbr, $name,  &CTLTYPE_ULONG |  &CTLFLAG_MPSAFE | ($access), $ptr, $val, \'sysctl_handle_long\', \\"LU\\", $descr);  &CTASSERT(((($access) &  &CTLTYPE) == 0|| (($access) &  &SYSCTL_CT_ASSERT_MASK) ==  &CTLTYPE_ULONG)  && $sizeof{\'unsigned long\'} == $sizeof{($ptr)}));
	}' unless defined(&SYSCTL_ULONG);
	eval 'sub SYSCTL_ADD_ULONG {
	    my($ctx, $parent, $nbr, $name, $access, $ptr, $descr) = @_;
    	    eval q(({ \'unsigned long\' * &__ptr = ($ptr);  &CTASSERT((($access) &  &CTLTYPE) == 0|| (($access) &  &SYSCTL_CT_ASSERT_MASK) ==  &CTLTYPE_ULONG);  &sysctl_add_oid($ctx, $parent, $nbr, $name,  &CTLTYPE_ULONG |  &CTLFLAG_MPSAFE | ($access),  &__ptr, 0, \'sysctl_handle_long\', \\"LU\\",  &__DESCR($descr),  &NULL); }));
	}' unless defined(&SYSCTL_ADD_ULONG);
	eval 'sub SYSCTL_NULL_QUAD_PTR () {(( &int64_t *) &NULL);}' unless defined(&SYSCTL_NULL_QUAD_PTR);
	eval 'sub SYSCTL_QUAD {
	    my($parent, $nbr, $name, $access, $ptr, $val, $descr) = @_;
    	    eval q( &SYSCTL_OID($parent, $nbr, $name,  &CTLTYPE_S64 |  &CTLFLAG_MPSAFE | ($access), $ptr, $val,  &sysctl_handle_64, \\"Q\\", $descr);  &CTASSERT(((($access) &  &CTLTYPE) == 0|| (($access) &  &SYSCTL_CT_ASSERT_MASK) ==  &CTLTYPE_S64)  && $sizeof{ &int64_t} == $sizeof{($ptr)}));
	}' unless defined(&SYSCTL_QUAD);
	eval 'sub SYSCTL_ADD_QUAD {
	    my($ctx, $parent, $nbr, $name, $access, $ptr, $descr) = @_;
    	    eval q(({  &int64_t * &__ptr = ($ptr);  &CTASSERT((($access) &  &CTLTYPE) == 0|| (($access) &  &SYSCTL_CT_ASSERT_MASK) ==  &CTLTYPE_S64);  &sysctl_add_oid($ctx, $parent, $nbr, $name,  &CTLTYPE_S64 |  &CTLFLAG_MPSAFE | ($access),  &__ptr, 0,  &sysctl_handle_64, \\"Q\\",  &__DESCR($descr),  &NULL); }));
	}' unless defined(&SYSCTL_ADD_QUAD);
	eval 'sub SYSCTL_NULL_UQUAD_PTR () {(( &uint64_t *) &NULL);}' unless defined(&SYSCTL_NULL_UQUAD_PTR);
	eval 'sub SYSCTL_UQUAD {
	    my($parent, $nbr, $name, $access, $ptr, $val, $descr) = @_;
    	    eval q( &SYSCTL_OID($parent, $nbr, $name,  &CTLTYPE_U64 |  &CTLFLAG_MPSAFE | ($access), $ptr, $val,  &sysctl_handle_64, \\"QU\\", $descr);  &CTASSERT(((($access) &  &CTLTYPE) == 0|| (($access) &  &SYSCTL_CT_ASSERT_MASK) ==  &CTLTYPE_U64)  && $sizeof{ &uint64_t} == $sizeof{($ptr)}));
	}' unless defined(&SYSCTL_UQUAD);
	eval 'sub SYSCTL_ADD_UQUAD {
	    my($ctx, $parent, $nbr, $name, $access, $ptr, $descr) = @_;
    	    eval q(({  &uint64_t * &__ptr = ($ptr);  &CTASSERT((($access) &  &CTLTYPE) == 0|| (($access) &  &SYSCTL_CT_ASSERT_MASK) ==  &CTLTYPE_U64);  &sysctl_add_oid($ctx, $parent, $nbr, $name,  &CTLTYPE_U64 |  &CTLFLAG_MPSAFE | ($access),  &__ptr, 0,  &sysctl_handle_64, \\"QU\\",  &__DESCR($descr),  &NULL); }));
	}' unless defined(&SYSCTL_ADD_UQUAD);
	eval 'sub SYSCTL_ADD_UAUTO {
	    my($ctx, $parent, $nbr, $name, $access, $ptr, $descr) = @_;
    	    eval q(({ \'struct sysctl_oid\' * &__ret;  &CTASSERT(($sizeof{ &uint64_t} == $sizeof{($ptr)} || $sizeof{\'unsigned\'} == $sizeof{($ptr)})  && (($access) &  &CTLTYPE) == 0);  &if ($sizeof{ &uint64_t} == $sizeof{($ptr)}) {  &__ret =  &sysctl_add_oid($ctx, $parent, $nbr, $name,  &CTLTYPE_U64 |  &CTLFLAG_MPSAFE | ($access), ($ptr), 0,  &sysctl_handle_64, \\"QU\\",  &__DESCR($descr),  &NULL); }  &else {  &__ret =  &sysctl_add_oid($ctx, $parent, $nbr, $name,  &CTLTYPE_UINT |  &CTLFLAG_MPSAFE | ($access), ($ptr), 0,  &sysctl_handle_int, \\"IU\\",  &__DESCR($descr),  &NULL); }  &__ret; }));
	}' unless defined(&SYSCTL_ADD_UAUTO);
	eval 'sub SYSCTL_COUNTER_U64 {
	    my($parent, $nbr, $name, $access, $ptr, $descr) = @_;
    	    eval q( &SYSCTL_OID($parent, $nbr, $name,  &CTLTYPE_U64 |  &CTLFLAG_MPSAFE |  &CTLFLAG_STATS | ($access), ($ptr), 0,  &sysctl_handle_counter_u64, \\"QU\\", $descr);  &CTASSERT(((($access) &  &CTLTYPE) == 0|| (($access) &  &SYSCTL_CT_ASSERT_MASK) ==  &CTLTYPE_U64)  && $sizeof{ &counter_u64_t} == $sizeof{($ptr)}  && $sizeof{ &uint64_t} == $sizeof{($ptr)}));
	}' unless defined(&SYSCTL_COUNTER_U64);
	eval 'sub SYSCTL_ADD_COUNTER_U64 {
	    my($ctx, $parent, $nbr, $name, $access, $ptr, $descr) = @_;
    	    eval q(({  &counter_u64_t * &__ptr = ($ptr);  &CTASSERT((($access) &  &CTLTYPE) == 0|| (($access) &  &SYSCTL_CT_ASSERT_MASK) ==  &CTLTYPE_U64);  &sysctl_add_oid($ctx, $parent, $nbr, $name,  &CTLTYPE_U64 |  &CTLFLAG_MPSAFE |  &CTLFLAG_STATS | ($access),  &__ptr, 0,  &sysctl_handle_counter_u64, \\"QU\\",  &__DESCR($descr),  &NULL); }));
	}' unless defined(&SYSCTL_ADD_COUNTER_U64);
	eval 'sub SYSCTL_COUNTER_U64_ARRAY {
	    my($parent, $nbr, $name, $access, $ptr, $len, $descr) = @_;
    	    eval q( &SYSCTL_OID($parent, $nbr, $name,  &CTLTYPE_U64 |  &CTLFLAG_MPSAFE |  &CTLFLAG_STATS | ($access), ($ptr), ($len),  &sysctl_handle_counter_u64_array, \\"QU\\", $descr);  &CTASSERT(((($access) &  &CTLTYPE) == 0|| (($access) &  &SYSCTL_CT_ASSERT_MASK) ==  &CTLTYPE_OPAQUE)  && $sizeof{ &counter_u64_t} == $sizeof{($ptr)}  && $sizeof{ &uint64_t} == $sizeof{($ptr)}));
	}' unless defined(&SYSCTL_COUNTER_U64_ARRAY);
	eval 'sub SYSCTL_ADD_COUNTER_U64_ARRAY {
	    my($ctx, $parent, $nbr, $name, $access,	    $ptr, $len, $descr) = @_;
    	    eval q(({  &counter_u64_t * &__ptr = ($ptr);  &CTASSERT((($access) &  &CTLTYPE) == 0|| (($access) &  &SYSCTL_CT_ASSERT_MASK) ==  &CTLTYPE_OPAQUE);  &sysctl_add_oid($ctx, $parent, $nbr, $name,  &CTLTYPE_OPAQUE |  &CTLFLAG_MPSAFE |  &CTLFLAG_STATS | ($access),  &__ptr, $len,  &sysctl_handle_counter_u64_array, \\"S\\",  &__DESCR($descr),  &NULL); }));
	}' unless defined(&SYSCTL_ADD_COUNTER_U64_ARRAY);
	eval 'sub SYSCTL_OPAQUE {
	    my($parent, $nbr, $name, $access, $ptr, $len, $fmt, $descr) = @_;
    	    eval q( &SYSCTL_OID($parent, $nbr, $name,  &CTLTYPE_OPAQUE |  &CTLFLAG_MPSAFE | ($access), $ptr, $len,  &sysctl_handle_opaque, $fmt, $descr);  &CTASSERT((($access) &  &CTLTYPE) == 0|| (($access) &  &SYSCTL_CT_ASSERT_MASK) ==  &CTLTYPE_OPAQUE));
	}' unless defined(&SYSCTL_OPAQUE);
	eval 'sub SYSCTL_ADD_OPAQUE {
	    my($ctx, $parent, $nbr, $name, $access, $ptr, $len, $fmt, $descr) = @_;
    	    eval q(({  &CTASSERT((($access) &  &CTLTYPE) == 0|| (($access) &  &SYSCTL_CT_ASSERT_MASK) ==  &CTLTYPE_OPAQUE);  &sysctl_add_oid($ctx, $parent, $nbr, $name,  &CTLTYPE_OPAQUE |  &CTLFLAG_MPSAFE | ($access), $ptr, $len,  &sysctl_handle_opaque, $fmt,  &__DESCR($descr),  &NULL); }));
	}' unless defined(&SYSCTL_ADD_OPAQUE);
	eval 'sub SYSCTL_STRUCT {
	    my($parent, $nbr, $name, $access, $ptr, $type, $descr) = @_;
    	    eval q( &SYSCTL_OID($parent, $nbr, $name,  &CTLTYPE_OPAQUE |  &CTLFLAG_MPSAFE | ($access), $ptr, $sizeof{\'struct type\'},  &sysctl_handle_opaque, \\"S,\\" $type, $descr);  &CTASSERT((($access) &  &CTLTYPE) == 0|| (($access) &  &SYSCTL_CT_ASSERT_MASK) ==  &CTLTYPE_OPAQUE));
	}' unless defined(&SYSCTL_STRUCT);
	eval 'sub SYSCTL_ADD_STRUCT {
	    my($ctx, $parent, $nbr, $name, $access, $ptr, $type, $descr) = @_;
    	    eval q(({  &CTASSERT((($access) &  &CTLTYPE) == 0|| (($access) &  &SYSCTL_CT_ASSERT_MASK) ==  &CTLTYPE_OPAQUE);  &sysctl_add_oid($ctx, $parent, $nbr, $name,  &CTLTYPE_OPAQUE |  &CTLFLAG_MPSAFE | ($access), ($ptr), $sizeof{\'struct type\'},  &sysctl_handle_opaque, \\"S,\\" $type,  &__DESCR($descr),  &NULL); }));
	}' unless defined(&SYSCTL_ADD_STRUCT);
	eval 'sub SYSCTL_PROC {
	    my($parent, $nbr, $name, $access, $ptr, $arg, $handler, $fmt, $descr) = @_;
    	    eval q( &SYSCTL_OID($parent, $nbr, $name, ($access), $ptr, $arg, $handler, $fmt, $descr);  &CTASSERT((($access) &  &CTLTYPE) != 0));
	}' unless defined(&SYSCTL_PROC);
	eval 'sub SYSCTL_ADD_PROC {
	    my($ctx, $parent, $nbr, $name, $access, $ptr, $arg, $handler, $fmt, $descr) = @_;
    	    eval q(({  &CTASSERT((($access) &  &CTLTYPE) != 0);  &SYSCTL_ENFORCE_FLAGS($access);  &sysctl_add_oid($ctx, $parent, $nbr, $name, ($access), ($ptr), ($arg), ($handler), ($fmt),  &__DESCR($descr),  &NULL); }));
	}' unless defined(&SYSCTL_ADD_PROC);
	eval 'sub SYSCTL_UMA_MAX {
	    my($parent, $nbr, $name, $access, $ptr, $descr) = @_;
    	    eval q( &SYSCTL_OID($parent, $nbr, $name,  &CTLTYPE_INT |  &CTLFLAG_MPSAFE | ($access), ($ptr), 0,  &sysctl_handle_uma_zone_max, \\"I\\", $descr);  &CTASSERT((($access) &  &CTLTYPE) == 0|| (($access) &  &SYSCTL_CT_ASSERT_MASK) ==  &CTLTYPE_INT));
	}' unless defined(&SYSCTL_UMA_MAX);
	eval 'sub SYSCTL_ADD_UMA_MAX {
	    my($ctx, $parent, $nbr, $name, $access, $ptr, $descr) = @_;
    	    eval q(({  &uma_zone_t  &__ptr = ($ptr);  &CTASSERT((($access) &  &CTLTYPE) == 0|| (($access) &  &SYSCTL_CT_ASSERT_MASK) ==  &CTLTYPE_INT);  &sysctl_add_oid($ctx, $parent, $nbr, $name,  &CTLTYPE_INT |  &CTLFLAG_MPSAFE | ($access),  &__ptr, 0,  &sysctl_handle_uma_zone_max, \\"I\\",  &__DESCR($descr),  &NULL); }));
	}' unless defined(&SYSCTL_ADD_UMA_MAX);
	eval 'sub SYSCTL_UMA_CUR {
	    my($parent, $nbr, $name, $access, $ptr, $descr) = @_;
    	    eval q( &SYSCTL_OID($parent, $nbr, $name,  &CTLTYPE_INT |  &CTLFLAG_MPSAFE |  &CTLFLAG_RD | ($access), ($ptr), 0,  &sysctl_handle_uma_zone_cur, \\"I\\", $descr);  &CTASSERT((($access) &  &CTLTYPE) == 0|| (($access) &  &SYSCTL_CT_ASSERT_MASK) ==  &CTLTYPE_INT));
	}' unless defined(&SYSCTL_UMA_CUR);
	eval 'sub SYSCTL_ADD_UMA_CUR {
	    my($ctx, $parent, $nbr, $name, $access, $ptr, $descr) = @_;
    	    eval q(({  &uma_zone_t  &__ptr = ($ptr);  &CTASSERT((($access) &  &CTLTYPE) == 0|| (($access) &  &SYSCTL_CT_ASSERT_MASK) ==  &CTLTYPE_INT);  &sysctl_add_oid($ctx, $parent, $nbr, $name,  &CTLTYPE_INT |  &CTLFLAG_MPSAFE |  &CTLFLAG_RD | ($access),  &__ptr, 0,  &sysctl_handle_uma_zone_cur, \\"I\\",  &__DESCR($descr),  &NULL); }));
	}' unless defined(&SYSCTL_ADD_UMA_CUR);
	eval 'sub SYSCTL_SBINTIME_USEC {
	    my($parent, $nbr, $name, $access, $ptr, $descr) = @_;
    	    eval q( &SYSCTL_OID($parent, $nbr, $name,  &CTLTYPE_INT |  &CTLFLAG_MPSAFE |  &CTLFLAG_RD | ($access), ($ptr), 0,  &sysctl_usec_to_sbintime, \\"Q\\", $descr);  &CTASSERT((($access) &  &CTLTYPE) == 0|| (($access) &  &SYSCTL_CT_ASSERT_MASK) ==  &CTLTYPE_S64));
	}' unless defined(&SYSCTL_SBINTIME_USEC);
	eval 'sub SYSCTL_ADD_SBINTIME_USEC {
	    my($ctx, $parent, $nbr, $name, $access, $ptr, $descr) = @_;
    	    eval q(({  &sbintime_t * &__ptr = ($ptr);  &CTASSERT((($access) &  &CTLTYPE) == 0|| (($access) &  &SYSCTL_CT_ASSERT_MASK) ==  &CTLTYPE_S64);  &sysctl_add_oid($ctx, $parent, $nbr, $name,  &CTLTYPE_INT |  &CTLFLAG_MPSAFE |  &CTLFLAG_RD | ($access),  &__ptr, 0,  &sysctl_usec_to_sbintime, \\"Q\\",  &__DESCR($descr),  &NULL); }));
	}' unless defined(&SYSCTL_ADD_SBINTIME_USEC);
	eval 'sub SYSCTL_SBINTIME_MSEC {
	    my($parent, $nbr, $name, $access, $ptr, $descr) = @_;
    	    eval q( &SYSCTL_OID($parent, $nbr, $name,  &CTLTYPE_INT |  &CTLFLAG_MPSAFE |  &CTLFLAG_RD | ($access), ($ptr), 0,  &sysctl_msec_to_sbintime, \\"Q\\", $descr);  &CTASSERT((($access) &  &CTLTYPE) == 0|| (($access) &  &SYSCTL_CT_ASSERT_MASK) ==  &CTLTYPE_S64));
	}' unless defined(&SYSCTL_SBINTIME_MSEC);
	eval 'sub SYSCTL_ADD_SBINTIME_MSEC {
	    my($ctx, $parent, $nbr, $name, $access, $ptr, $descr) = @_;
    	    eval q(({  &sbintime_t * &__ptr = ($ptr);  &CTASSERT((($access) &  &CTLTYPE) == 0|| (($access) &  &SYSCTL_CT_ASSERT_MASK) ==  &CTLTYPE_S64);  &sysctl_add_oid($ctx, $parent, $nbr, $name,  &CTLTYPE_INT |  &CTLFLAG_MPSAFE |  &CTLFLAG_RD | ($access),  &__ptr, 0,  &sysctl_msec_to_sbintime, \\"Q\\",  &__DESCR($descr),  &NULL); }));
	}' unless defined(&SYSCTL_ADD_SBINTIME_MSEC);
	eval 'sub SYSCTL_TIMEVAL_SEC {
	    my($parent, $nbr, $name, $access, $ptr, $descr) = @_;
    	    eval q( &SYSCTL_OID($parent, $nbr, $name,  &CTLTYPE_INT |  &CTLFLAG_MPSAFE |  &CTLFLAG_RD | ($access), ($ptr), 0,  &sysctl_sec_to_timeval, \\"I\\", $descr);  &CTASSERT((($access) &  &CTLTYPE) == 0|| (($access) &  &SYSCTL_CT_ASSERT_MASK) ==  &CTLTYPE_INT));
	}' unless defined(&SYSCTL_TIMEVAL_SEC);
	eval 'sub SYSCTL_ADD_TIMEVAL_SEC {
	    my($ctx, $parent, $nbr, $name, $access, $ptr, $descr) = @_;
    	    eval q(({ \'struct timeval\' * &__ptr = ($ptr);  &CTASSERT((($access) &  &CTLTYPE) == 0|| (($access) &  &SYSCTL_CT_ASSERT_MASK) ==  &CTLTYPE_INT);  &sysctl_add_oid($ctx, $parent, $nbr, $name,  &CTLTYPE_INT |  &CTLFLAG_MPSAFE |  &CTLFLAG_RD | ($access),  &__ptr, 0,  &sysctl_sec_to_timeval, \\"I\\",  &__DESCR($descr),  &NULL); }));
	}' unless defined(&SYSCTL_ADD_TIMEVAL_SEC);
	eval 'sub SYSCTL_FOREACH {
	    my($oidp, $list) = @_;
    	    eval q( &RB_FOREACH($oidp,  &sysctl_oid_list, $list));
	}' unless defined(&SYSCTL_FOREACH);
	eval 'sub FEATURE {
	    my($name, $desc) = @_;
    	    eval q( &SYSCTL_INT_WITH_LABEL( &_kern_features,  &OID_AUTO, $name,  &CTLFLAG_RD |  &CTLFLAG_CAPRD,  &SYSCTL_NULL_INT_PTR, 1, $desc, \\"feature\\"));
	}' unless defined(&FEATURE);
	eval 'sub FEATURE_ADD {
	    my($name, $desc) = @_;
    	    eval q( &sysctl_add_oid( &NULL,  &SYSCTL_CHILDREN( &sysctl___kern_features),  &OID_AUTO, $name,  &CTLFLAG_RD |  &CTLFLAG_CAPRD |  &CTLTYPE_INT |  &CTLFLAG_MPSAFE,  &NULL, 1,  &sysctl_handle_int, \\"I\\", $desc, \\"feature\\"););
	}' unless defined(&FEATURE_ADD);
    }
    eval 'sub CTL_SYSCTL () {0;}' unless defined(&CTL_SYSCTL);
    eval 'sub CTL_KERN () {1;}' unless defined(&CTL_KERN);
    eval 'sub CTL_VM () {2;}' unless defined(&CTL_VM);
    eval 'sub CTL_VFS () {3;}' unless defined(&CTL_VFS);
    eval 'sub CTL_NET () {4;}' unless defined(&CTL_NET);
    eval 'sub CTL_DEBUG () {5;}' unless defined(&CTL_DEBUG);
    eval 'sub CTL_HW () {6;}' unless defined(&CTL_HW);
    eval 'sub CTL_MACHDEP () {7;}' unless defined(&CTL_MACHDEP);
    eval 'sub CTL_USER () {8;}' unless defined(&CTL_USER);
    eval 'sub CTL_P1003_1B () {9;}' unless defined(&CTL_P1003_1B);
    eval 'sub CTL_SYSCTL_DEBUG () {0;}' unless defined(&CTL_SYSCTL_DEBUG);
    eval 'sub CTL_SYSCTL_NAME () {1;}' unless defined(&CTL_SYSCTL_NAME);
    eval 'sub CTL_SYSCTL_NEXT () {2;}' unless defined(&CTL_SYSCTL_NEXT);
    eval 'sub CTL_SYSCTL_NAME2OID () {3;}' unless defined(&CTL_SYSCTL_NAME2OID);
    eval 'sub CTL_SYSCTL_OIDFMT () {4;}' unless defined(&CTL_SYSCTL_OIDFMT);
    eval 'sub CTL_SYSCTL_OIDDESCR () {5;}' unless defined(&CTL_SYSCTL_OIDDESCR);
    eval 'sub CTL_SYSCTL_OIDLABEL () {6;}' unless defined(&CTL_SYSCTL_OIDLABEL);
    eval 'sub CTL_SYSCTL_NEXTNOSKIP () {7;}' unless defined(&CTL_SYSCTL_NEXTNOSKIP);
    eval 'sub KERN_OSTYPE () {1;}' unless defined(&KERN_OSTYPE);
    eval 'sub KERN_OSRELEASE () {2;}' unless defined(&KERN_OSRELEASE);
    eval 'sub KERN_OSREV () {3;}' unless defined(&KERN_OSREV);
    eval 'sub KERN_VERSION () {4;}' unless defined(&KERN_VERSION);
    eval 'sub KERN_MAXVNODES () {5;}' unless defined(&KERN_MAXVNODES);
    eval 'sub KERN_MAXPROC () {6;}' unless defined(&KERN_MAXPROC);
    eval 'sub KERN_MAXFILES () {7;}' unless defined(&KERN_MAXFILES);
    eval 'sub KERN_ARGMAX () {8;}' unless defined(&KERN_ARGMAX);
    eval 'sub KERN_SECURELVL () {9;}' unless defined(&KERN_SECURELVL);
    eval 'sub KERN_HOSTNAME () {10;}' unless defined(&KERN_HOSTNAME);
    eval 'sub KERN_HOSTID () {11;}' unless defined(&KERN_HOSTID);
    eval 'sub KERN_CLOCKRATE () {12;}' unless defined(&KERN_CLOCKRATE);
    eval 'sub KERN_PROC () {14;}' unless defined(&KERN_PROC);
    eval 'sub KERN_FILE () {15;}' unless defined(&KERN_FILE);
    eval 'sub KERN_PROF () {16;}' unless defined(&KERN_PROF);
    eval 'sub KERN_POSIX1 () {17;}' unless defined(&KERN_POSIX1);
    eval 'sub KERN_NGROUPS () {18;}' unless defined(&KERN_NGROUPS);
    eval 'sub KERN_JOB_CONTROL () {19;}' unless defined(&KERN_JOB_CONTROL);
    eval 'sub KERN_SAVED_IDS () {20;}' unless defined(&KERN_SAVED_IDS);
    eval 'sub KERN_BOOTTIME () {21;}' unless defined(&KERN_BOOTTIME);
    eval 'sub KERN_NISDOMAINNAME () {22;}' unless defined(&KERN_NISDOMAINNAME);
    eval 'sub KERN_UPDATEINTERVAL () {23;}' unless defined(&KERN_UPDATEINTERVAL);
    eval 'sub KERN_OSRELDATE () {24;}' unless defined(&KERN_OSRELDATE);
    eval 'sub KERN_NTP_PLL () {25;}' unless defined(&KERN_NTP_PLL);
    eval 'sub KERN_BOOTFILE () {26;}' unless defined(&KERN_BOOTFILE);
    eval 'sub KERN_MAXFILESPERPROC () {27;}' unless defined(&KERN_MAXFILESPERPROC);
    eval 'sub KERN_MAXPROCPERUID () {28;}' unless defined(&KERN_MAXPROCPERUID);
    eval 'sub KERN_DUMPDEV () {29;}' unless defined(&KERN_DUMPDEV);
    eval 'sub KERN_IPC () {30;}' unless defined(&KERN_IPC);
    eval 'sub KERN_DUMMY () {31;}' unless defined(&KERN_DUMMY);
    eval 'sub KERN_PS_STRINGS () {32;}' unless defined(&KERN_PS_STRINGS);
    eval 'sub KERN_USRSTACK () {33;}' unless defined(&KERN_USRSTACK);
    eval 'sub KERN_LOGSIGEXIT () {34;}' unless defined(&KERN_LOGSIGEXIT);
    eval 'sub KERN_IOV_MAX () {35;}' unless defined(&KERN_IOV_MAX);
    eval 'sub KERN_HOSTUUID () {36;}' unless defined(&KERN_HOSTUUID);
    eval 'sub KERN_ARND () {37;}' unless defined(&KERN_ARND);
    eval 'sub KERN_MAXPHYS () {38;}' unless defined(&KERN_MAXPHYS);
    eval 'sub KERN_LOCKF () {39;}' unless defined(&KERN_LOCKF);
    eval 'sub KERN_PROC_ALL () {0;}' unless defined(&KERN_PROC_ALL);
    eval 'sub KERN_PROC_PID () {1;}' unless defined(&KERN_PROC_PID);
    eval 'sub KERN_PROC_PGRP () {2;}' unless defined(&KERN_PROC_PGRP);
    eval 'sub KERN_PROC_SESSION () {3;}' unless defined(&KERN_PROC_SESSION);
    eval 'sub KERN_PROC_TTY () {4;}' unless defined(&KERN_PROC_TTY);
    eval 'sub KERN_PROC_UID () {5;}' unless defined(&KERN_PROC_UID);
    eval 'sub KERN_PROC_RUID () {6;}' unless defined(&KERN_PROC_RUID);
    eval 'sub KERN_PROC_ARGS () {7;}' unless defined(&KERN_PROC_ARGS);
    eval 'sub KERN_PROC_PROC () {8;}' unless defined(&KERN_PROC_PROC);
    eval 'sub KERN_PROC_SV_NAME () {9;}' unless defined(&KERN_PROC_SV_NAME);
    eval 'sub KERN_PROC_RGID () {10;}' unless defined(&KERN_PROC_RGID);
    eval 'sub KERN_PROC_GID () {11;}' unless defined(&KERN_PROC_GID);
    eval 'sub KERN_PROC_PATHNAME () {12;}' unless defined(&KERN_PROC_PATHNAME);
    eval 'sub KERN_PROC_OVMMAP () {13;}' unless defined(&KERN_PROC_OVMMAP);
    eval 'sub KERN_PROC_OFILEDESC () {14;}' unless defined(&KERN_PROC_OFILEDESC);
    eval 'sub KERN_PROC_KSTACK () {15;}' unless defined(&KERN_PROC_KSTACK);
    eval 'sub KERN_PROC_INC_THREAD () {0x10;}' unless defined(&KERN_PROC_INC_THREAD);
    eval 'sub KERN_PROC_VMMAP () {32;}' unless defined(&KERN_PROC_VMMAP);
    eval 'sub KERN_PROC_FILEDESC () {33;}' unless defined(&KERN_PROC_FILEDESC);
    eval 'sub KERN_PROC_GROUPS () {34;}' unless defined(&KERN_PROC_GROUPS);
    eval 'sub KERN_PROC_ENV () {35;}' unless defined(&KERN_PROC_ENV);
    eval 'sub KERN_PROC_AUXV () {36;}' unless defined(&KERN_PROC_AUXV);
    eval 'sub KERN_PROC_RLIMIT () {37;}' unless defined(&KERN_PROC_RLIMIT);
    eval 'sub KERN_PROC_PS_STRINGS () {38;}' unless defined(&KERN_PROC_PS_STRINGS);
    eval 'sub KERN_PROC_UMASK () {39;}' unless defined(&KERN_PROC_UMASK);
    eval 'sub KERN_PROC_OSREL () {40;}' unless defined(&KERN_PROC_OSREL);
    eval 'sub KERN_PROC_SIGTRAMP () {41;}' unless defined(&KERN_PROC_SIGTRAMP);
    eval 'sub KERN_PROC_CWD () {42;}' unless defined(&KERN_PROC_CWD);
    eval 'sub KERN_PROC_NFDS () {43;}' unless defined(&KERN_PROC_NFDS);
    eval 'sub KERN_PROC_SIGFASTBLK () {44;}' unless defined(&KERN_PROC_SIGFASTBLK);
    eval 'sub KERN_PROC_VM_LAYOUT () {45;}' unless defined(&KERN_PROC_VM_LAYOUT);
    eval 'sub KIPC_MAXSOCKBUF () {1;}' unless defined(&KIPC_MAXSOCKBUF);
    eval 'sub KIPC_SOCKBUF_WASTE () {2;}' unless defined(&KIPC_SOCKBUF_WASTE);
    eval 'sub KIPC_SOMAXCONN () {3;}' unless defined(&KIPC_SOMAXCONN);
    eval 'sub KIPC_MAX_LINKHDR () {4;}' unless defined(&KIPC_MAX_LINKHDR);
    eval 'sub KIPC_MAX_PROTOHDR () {5;}' unless defined(&KIPC_MAX_PROTOHDR);
    eval 'sub KIPC_MAX_HDR () {6;}' unless defined(&KIPC_MAX_HDR);
    eval 'sub KIPC_MAX_DATALEN () {7;}' unless defined(&KIPC_MAX_DATALEN);
    eval 'sub HW_MACHINE () {1;}' unless defined(&HW_MACHINE);
    eval 'sub HW_MODEL () {2;}' unless defined(&HW_MODEL);
    eval 'sub HW_NCPU () {3;}' unless defined(&HW_NCPU);
    eval 'sub HW_BYTEORDER () {4;}' unless defined(&HW_BYTEORDER);
    eval 'sub HW_PHYSMEM () {5;}' unless defined(&HW_PHYSMEM);
    eval 'sub HW_USERMEM () {6;}' unless defined(&HW_USERMEM);
    eval 'sub HW_PAGESIZE () {7;}' unless defined(&HW_PAGESIZE);
    eval 'sub HW_DISKNAMES () {8;}' unless defined(&HW_DISKNAMES);
    eval 'sub HW_DISKSTATS () {9;}' unless defined(&HW_DISKSTATS);
    eval 'sub HW_FLOATINGPT () {10;}' unless defined(&HW_FLOATINGPT);
    eval 'sub HW_MACHINE_ARCH () {11;}' unless defined(&HW_MACHINE_ARCH);
    eval 'sub HW_REALMEM () {12;}' unless defined(&HW_REALMEM);
    eval 'sub USER_CS_PATH () {1;}' unless defined(&USER_CS_PATH);
    eval 'sub USER_BC_BASE_MAX () {2;}' unless defined(&USER_BC_BASE_MAX);
    eval 'sub USER_BC_DIM_MAX () {3;}' unless defined(&USER_BC_DIM_MAX);
    eval 'sub USER_BC_SCALE_MAX () {4;}' unless defined(&USER_BC_SCALE_MAX);
    eval 'sub USER_BC_STRING_MAX () {5;}' unless defined(&USER_BC_STRING_MAX);
    eval 'sub USER_COLL_WEIGHTS_MAX () {6;}' unless defined(&USER_COLL_WEIGHTS_MAX);
    eval 'sub USER_EXPR_NEST_MAX () {7;}' unless defined(&USER_EXPR_NEST_MAX);
    eval 'sub USER_LINE_MAX () {8;}' unless defined(&USER_LINE_MAX);
    eval 'sub USER_RE_DUP_MAX () {9;}' unless defined(&USER_RE_DUP_MAX);
    eval 'sub USER_POSIX2_VERSION () {10;}' unless defined(&USER_POSIX2_VERSION);
    eval 'sub USER_POSIX2_C_BIND () {11;}' unless defined(&USER_POSIX2_C_BIND);
    eval 'sub USER_POSIX2_C_DEV () {12;}' unless defined(&USER_POSIX2_C_DEV);
    eval 'sub USER_POSIX2_CHAR_TERM () {13;}' unless defined(&USER_POSIX2_CHAR_TERM);
    eval 'sub USER_POSIX2_FORT_DEV () {14;}' unless defined(&USER_POSIX2_FORT_DEV);
    eval 'sub USER_POSIX2_FORT_RUN () {15;}' unless defined(&USER_POSIX2_FORT_RUN);
    eval 'sub USER_POSIX2_LOCALEDEF () {16;}' unless defined(&USER_POSIX2_LOCALEDEF);
    eval 'sub USER_POSIX2_SW_DEV () {17;}' unless defined(&USER_POSIX2_SW_DEV);
    eval 'sub USER_POSIX2_UPE () {18;}' unless defined(&USER_POSIX2_UPE);
    eval 'sub USER_STREAM_MAX () {19;}' unless defined(&USER_STREAM_MAX);
    eval 'sub USER_TZNAME_MAX () {20;}' unless defined(&USER_TZNAME_MAX);
    eval 'sub USER_LOCALBASE () {21;}' unless defined(&USER_LOCALBASE);
    eval 'sub CTL_P1003_1B_ASYNCHRONOUS_IO () {1;}' unless defined(&CTL_P1003_1B_ASYNCHRONOUS_IO);
    eval 'sub CTL_P1003_1B_MAPPED_FILES () {2;}' unless defined(&CTL_P1003_1B_MAPPED_FILES);
    eval 'sub CTL_P1003_1B_MEMLOCK () {3;}' unless defined(&CTL_P1003_1B_MEMLOCK);
    eval 'sub CTL_P1003_1B_MEMLOCK_RANGE () {4;}' unless defined(&CTL_P1003_1B_MEMLOCK_RANGE);
    eval 'sub CTL_P1003_1B_MEMORY_PROTECTION () {5;}' unless defined(&CTL_P1003_1B_MEMORY_PROTECTION);
    eval 'sub CTL_P1003_1B_MESSAGE_PASSING () {6;}' unless defined(&CTL_P1003_1B_MESSAGE_PASSING);
    eval 'sub CTL_P1003_1B_PRIORITIZED_IO () {7;}' unless defined(&CTL_P1003_1B_PRIORITIZED_IO);
    eval 'sub CTL_P1003_1B_PRIORITY_SCHEDULING () {8;}' unless defined(&CTL_P1003_1B_PRIORITY_SCHEDULING);
    eval 'sub CTL_P1003_1B_REALTIME_SIGNALS () {9;}' unless defined(&CTL_P1003_1B_REALTIME_SIGNALS);
    eval 'sub CTL_P1003_1B_SEMAPHORES () {10;}' unless defined(&CTL_P1003_1B_SEMAPHORES);
    eval 'sub CTL_P1003_1B_FSYNC () {11;}' unless defined(&CTL_P1003_1B_FSYNC);
    eval 'sub CTL_P1003_1B_SHARED_MEMORY_OBJECTS () {12;}' unless defined(&CTL_P1003_1B_SHARED_MEMORY_OBJECTS);
    eval 'sub CTL_P1003_1B_SYNCHRONIZED_IO () {13;}' unless defined(&CTL_P1003_1B_SYNCHRONIZED_IO);
    eval 'sub CTL_P1003_1B_TIMERS () {14;}' unless defined(&CTL_P1003_1B_TIMERS);
    eval 'sub CTL_P1003_1B_AIO_LISTIO_MAX () {15;}' unless defined(&CTL_P1003_1B_AIO_LISTIO_MAX);
    eval 'sub CTL_P1003_1B_AIO_MAX () {16;}' unless defined(&CTL_P1003_1B_AIO_MAX);
    eval 'sub CTL_P1003_1B_AIO_PRIO_DELTA_MAX () {17;}' unless defined(&CTL_P1003_1B_AIO_PRIO_DELTA_MAX);
    eval 'sub CTL_P1003_1B_DELAYTIMER_MAX () {18;}' unless defined(&CTL_P1003_1B_DELAYTIMER_MAX);
    eval 'sub CTL_P1003_1B_MQ_OPEN_MAX () {19;}' unless defined(&CTL_P1003_1B_MQ_OPEN_MAX);
    eval 'sub CTL_P1003_1B_PAGESIZE () {20;}' unless defined(&CTL_P1003_1B_PAGESIZE);
    eval 'sub CTL_P1003_1B_RTSIG_MAX () {21;}' unless defined(&CTL_P1003_1B_RTSIG_MAX);
    eval 'sub CTL_P1003_1B_SEM_NSEMS_MAX () {22;}' unless defined(&CTL_P1003_1B_SEM_NSEMS_MAX);
    eval 'sub CTL_P1003_1B_SEM_VALUE_MAX () {23;}' unless defined(&CTL_P1003_1B_SEM_VALUE_MAX);
    eval 'sub CTL_P1003_1B_SIGQUEUE_MAX () {24;}' unless defined(&CTL_P1003_1B_SIGQUEUE_MAX);
    eval 'sub CTL_P1003_1B_TIMER_MAX () {25;}' unless defined(&CTL_P1003_1B_TIMER_MAX);
    if(defined(&_KERNEL)) {
	eval 'sub CTL_P1003_1B_MAXID () {26;}' unless defined(&CTL_P1003_1B_MAXID);
    } else {
	require 'sys/cdefs.ph';
	require 'sys/_types.ph';
	unless(defined(&_SIZE_T_DECLARED)) {
	    eval 'sub _SIZE_T_DECLARED () {1;}' unless defined(&_SIZE_T_DECLARED);
	}
    }
}
1;

require '_h2ph_pre.ph';

no warnings qw(redefine misc);

unless(defined(&_SYS_STATS_H_)) {
    eval 'sub _SYS_STATS_H_ () {1;}' unless defined(&_SYS_STATS_H_);
    require 'sys/limits.ph';
    if(defined(&DIAGNOSTIC)) {
	require 'sys/tree.ph';
    }
    unless(defined(&_KERNEL)) {
	eval 'sub VNET {
	    my($n) = @_;
    	    eval q($n);
	}' unless defined(&VNET);
	eval 'sub VNET_DEFINE {
	    my($t, $n) = @_;
    	    eval q( &static $t $n  &__unused);
	}' unless defined(&VNET_DEFINE);
    }
    eval 'sub TPL_MAX_NAME_LEN () {64;}' unless defined(&TPL_MAX_NAME_LEN);
    eval 'sub STATS_TPL_MAX_STR_SPEC_LEN () {( &TPL_MAX_NAME_LEN + 13);}' unless defined(&STATS_TPL_MAX_STR_SPEC_LEN);
    eval("sub SB_STRFMT_FREEFORM () { 0; }") unless defined(&SB_STRFMT_FREEFORM);
    eval("sub SB_STRFMT_JSON () { 1; }") unless defined(&SB_STRFMT_JSON);
    eval("sub SB_STRFMT_NUM_FMTS () { 2; }") unless defined(&SB_STRFMT_NUM_FMTS);
    eval("sub VS_STYPE_VOISTATE () { 0; }") unless defined(&VS_STYPE_VOISTATE);
    eval("sub VS_STYPE_SUM () { 1; }") unless defined(&VS_STYPE_SUM);
    eval("sub VS_STYPE_MAX () { 2; }") unless defined(&VS_STYPE_MAX);
    eval("sub VS_STYPE_MIN () { 3; }") unless defined(&VS_STYPE_MIN);
    eval("sub VS_STYPE_HIST () { 4; }") unless defined(&VS_STYPE_HIST);
    eval("sub VS_STYPE_TDGST () { 5; }") unless defined(&VS_STYPE_TDGST);
    eval("sub VS_NUM_STYPES () { 6; }") unless defined(&VS_NUM_STYPES);
    eval("sub VSD_DTYPE_VOISTATE () { 0; }") unless defined(&VSD_DTYPE_VOISTATE);
    eval("sub VSD_DTYPE_INT_S32 () { 1; }") unless defined(&VSD_DTYPE_INT_S32);
    eval("sub VSD_DTYPE_INT_U32 () { 2; }") unless defined(&VSD_DTYPE_INT_U32);
    eval("sub VSD_DTYPE_INT_S64 () { 3; }") unless defined(&VSD_DTYPE_INT_S64);
    eval("sub VSD_DTYPE_INT_U64 () { 4; }") unless defined(&VSD_DTYPE_INT_U64);
    eval("sub VSD_DTYPE_INT_SLONG () { 5; }") unless defined(&VSD_DTYPE_INT_SLONG);
    eval("sub VSD_DTYPE_INT_ULONG () { 6; }") unless defined(&VSD_DTYPE_INT_ULONG);
    eval("sub VSD_DTYPE_Q_S32 () { 7; }") unless defined(&VSD_DTYPE_Q_S32);
    eval("sub VSD_DTYPE_Q_U32 () { 8; }") unless defined(&VSD_DTYPE_Q_U32);
    eval("sub VSD_DTYPE_Q_S64 () { 9; }") unless defined(&VSD_DTYPE_Q_S64);
    eval("sub VSD_DTYPE_Q_U64 () { 10; }") unless defined(&VSD_DTYPE_Q_U64);
    eval("sub VSD_DTYPE_CRHIST32 () { 11; }") unless defined(&VSD_DTYPE_CRHIST32);
    eval("sub VSD_DTYPE_DRHIST32 () { 12; }") unless defined(&VSD_DTYPE_DRHIST32);
    eval("sub VSD_DTYPE_DVHIST32 () { 13; }") unless defined(&VSD_DTYPE_DVHIST32);
    eval("sub VSD_DTYPE_CRHIST64 () { 14; }") unless defined(&VSD_DTYPE_CRHIST64);
    eval("sub VSD_DTYPE_DRHIST64 () { 15; }") unless defined(&VSD_DTYPE_DRHIST64);
    eval("sub VSD_DTYPE_DVHIST64 () { 16; }") unless defined(&VSD_DTYPE_DVHIST64);
    eval("sub VSD_DTYPE_TDGSTCLUST32 () { 17; }") unless defined(&VSD_DTYPE_TDGSTCLUST32);
    eval("sub VSD_DTYPE_TDGSTCLUST64 () { 18; }") unless defined(&VSD_DTYPE_TDGSTCLUST64);
    eval("sub VSD_NUM_DTYPES () { 19; }") unless defined(&VSD_NUM_DTYPES);
    if((defined(&BYTE_ORDER) ? &BYTE_ORDER : undef) == (defined(&BIG_ENDIAN) ? &BIG_ENDIAN : undef)) {
    }
    if((defined(&BYTE_ORDER) ? &BYTE_ORDER : undef) == (defined(&LITTLE_ENDIAN) ? &LITTLE_ENDIAN : undef)) {
    }
    if((defined(&BYTE_ORDER) ? &BYTE_ORDER : undef) == (defined(&BIG_ENDIAN) ? &BIG_ENDIAN : undef)) {
    }
    if((defined(&BYTE_ORDER) ? &BYTE_ORDER : undef) == (defined(&LITTLE_ENDIAN) ? &LITTLE_ENDIAN : undef)) {
    }
    if((defined(&BYTE_ORDER) ? &BYTE_ORDER : undef) == (defined(&BIG_ENDIAN) ? &BIG_ENDIAN : undef)  && (defined(&LONG_BIT) ? &LONG_BIT : undef) == 32) {
    }
    if((defined(&BYTE_ORDER) ? &BYTE_ORDER : undef) == (defined(&LITTLE_ENDIAN) ? &LITTLE_ENDIAN : undef)  && (defined(&LONG_BIT) ? &LONG_BIT : undef) == 32) {
    }
    if(defined(&DIAGNOSTIC)) {
    }
    if(defined(&DIAGNOSTIC)) {
    }
    if(defined(&DIAGNOSTIC)) {
    }
    if(defined(&DIAGNOSTIC)) {
    }
    eval 'sub VSD_HIST_LBOUND_INF () {0x1;}' unless defined(&VSD_HIST_LBOUND_INF);
    eval 'sub VSD_HIST_UBOUND_INF () {0x2;}' unless defined(&VSD_HIST_UBOUND_INF);
    eval("sub BKT_LIN () { 0; }") unless defined(&BKT_LIN);
    eval("sub BKT_EXP () { 1; }") unless defined(&BKT_EXP);
    eval("sub BKT_LINEXP () { 2; }") unless defined(&BKT_LINEXP);
    eval("sub BKT_USR () { 3; }") unless defined(&BKT_USR);
    eval 'sub LIM_MIN () {0;}' unless defined(&LIM_MIN);
    eval 'sub LIM_MAX () {1;}' unless defined(&LIM_MAX);
    eval 'sub TYPEOF_MEMBER {
        my($type, $member) = @_;
	    eval q( &__typeof((($type *)0)->$member));
    }' unless defined(&TYPEOF_MEMBER);
    eval 'sub TYPEOF_MEMBER_PTR {
        my($type, $member) = @_;
	    eval q( &__typeof(*((($type *)0)->$member)));
    }' unless defined(&TYPEOF_MEMBER_PTR);
    eval 'sub SIZEOF_MEMBER {
        my($type, $member) = @_;
	    eval q($sizeof{ &TYPEOF_MEMBER($type, $member)});
    }' unless defined(&SIZEOF_MEMBER);
    eval 'sub _VSD {
        my($cnst, $type, $ptr) = @_;
	    eval q((($cnst \'struct voistatdata_\'$type *)($ptr)));
    }' unless defined(&_VSD);
    eval 'sub VSD {
        my($type, $ptr) = @_;
	    eval q( &_VSD(, $type, $ptr));
    }' unless defined(&VSD);
    eval 'sub CONSTVSD {
        my($type, $ptr) = @_;
	    eval q( &_VSD( &const, $type, $ptr));
    }' unless defined(&CONSTVSD);
    eval 'sub NVSS {
        my($vss_slots) = @_;
	    eval q(($sizeof{($vss_slots)} / $sizeof{\'struct voistatspec\'}));
    }' unless defined(&NVSS);
    eval 'sub STATS_VSS {
        my($st, $vsf, $dt, $hlp, $hlpi) = @_;
	    eval q(({ . &stype = ($st), . &flags = ($vsf), . &vs_dtype = ($dt), . &hlpr = ($hlp), . &hlprinfo = ($hlpi), }));
    }' unless defined(&STATS_VSS);
    eval 'sub STATS_VSS_SUM () {
        eval q( &STATS_VSS( &VS_STYPE_SUM, 0, 0, ( &vss_hlpr_fn) &stats_vss_numeric_hlpr,  &NULL));
    }' unless defined(&STATS_VSS_SUM);
    eval 'sub STATS_VSS_MAX () {
        eval q( &STATS_VSS( &VS_STYPE_MAX, 0, 0, ( &vss_hlpr_fn) &stats_vss_numeric_hlpr,  &NULL));
    }' unless defined(&STATS_VSS_MAX);
    eval 'sub STATS_VSS_MIN () {
        eval q( &STATS_VSS( &VS_STYPE_MIN, 0, 0, ( &vss_hlpr_fn) &stats_vss_numeric_hlpr,  &NULL));
    }' unless defined(&STATS_VSS_MIN);
    eval 'sub STATS_VSS_HIST {
        my($htype, $hist_hlpr_info) = @_;
	    eval q( &STATS_VSS( &VS_STYPE_HIST, 0, $htype, ( &vss_hlpr_fn) &stats_vss_hist_hlpr, ($hist_hlpr_info)));
    }' unless defined(&STATS_VSS_HIST);
    eval 'sub STATS_VSS_TDIGEST {
        my($tdtype, $tdgst_hlpr_info) = @_;
	    eval q( &STATS_VSS( &VS_STYPE_TDGST, 0, $tdtype, ( &vss_hlpr_fn) &stats_vss_tdgst_hlpr, ($tdgst_hlpr_info)));
    }' unless defined(&STATS_VSS_TDIGEST);
    eval 'sub TDGST_NCTRS2VSDSZ {
        my($tdtype, $nctds) = @_;
	    eval q(($sizeof{\'struct voistatdata_\'$tdtype} + (($nctds) * $sizeof{ &TYPEOF_MEMBER_PTR(\'struct voistatdata_\'$tdtype,  ($ctdtree->{arb_nodes}))})));
    }' unless defined(&TDGST_NCTRS2VSDSZ);
    eval 'sub TDGST_HLPR_INFO {
        my($dt, $nc, $nf) = @_;
	    eval q(({ . &tdgst_dtype = ($dt), . &nctds = ($nc), . &prec = ($nf) }));
    }' unless defined(&TDGST_HLPR_INFO);
    eval 'sub STATS_VSS_TDGSTCLUST32 {
        my($nctds, $prec) = @_;
	    eval q( &STATS_VSS_TDIGEST( &VSD_DTYPE_TDGSTCLUST32,  &TDGST_HLPR_INFO( &VSD_DTYPE_TDGSTCLUST32, $nctds, $prec)));
    }' unless defined(&STATS_VSS_TDGSTCLUST32);
    eval 'sub STATS_VSS_TDGSTCLUST64 {
        my($nctds, $prec) = @_;
	    eval q( &STATS_VSS_TDIGEST( &VSD_DTYPE_TDGSTCLUST64,  &TDGST_HLPR_INFO( &VSD_DTYPE_TDGSTCLUST64, $nctds, $prec)));
    }' unless defined(&STATS_VSS_TDGSTCLUST64);
    eval 'sub HIST_VSDSZ2NBKTS {
        my($htype, $dsz) = @_;
	    eval q((($dsz - $sizeof{\'struct voistatdata_\'$htype}) / $sizeof{ &TYPEOF_MEMBER(\'struct voistatdata_\'$htype,  $bkts[0])}));
    }' unless defined(&HIST_VSDSZ2NBKTS);
    eval 'sub HIST_NBKTS2VSDSZ {
        my($htype, $nbkts) = @_;
	    eval q(($sizeof{\'struct voistatdata_\'$htype} + (($nbkts) * $sizeof{ &TYPEOF_MEMBER_PTR(\'struct voistatdata_\'$htype,  &bkts)})));
    }' unless defined(&HIST_NBKTS2VSDSZ);
    eval 'sub HIST_HLPR_INFO_LIN_FIELDS {
        my($si) = @_;
	    eval q(. ($lin->{stepinc}) = ($si));
    }' unless defined(&HIST_HLPR_INFO_LIN_FIELDS);
    eval 'sub HIST_HLPR_INFO_EXP_FIELDS {
        my($sb, $se) = @_;
	    eval q(. ($exp->{stepbase}) = ($sb), . ($exp->{stepexp}) = ($se));
    }' unless defined(&HIST_HLPR_INFO_EXP_FIELDS);
    eval 'sub HIST_HLPR_INFO_LINEXP_FIELDS {
        my($nss, $sb) = @_;
	    eval q(. ($linexp->{linstepdiv}) = ($nss), . ($linexp->{stepbase}) = ($sb));
    }' unless defined(&HIST_HLPR_INFO_LINEXP_FIELDS);
    eval 'sub HIST_HLPR_INFO_USR_FIELDS {
        my($bbs) = @_;
	    eval q(. ($usr->{bkts}) = ( &TYPEOF_MEMBER(\'struct vss_hist_hlpr_info\',  ($usr->{bkts})))($bbs), . ($usr->{nbkts}) = ($sizeof{$bbs} / $sizeof{\'struct voistatdata_numeric\'[2]}));
    }' unless defined(&HIST_HLPR_INFO_USR_FIELDS);
    eval 'sub HIST_HLPR_INFO {
        my($dt, $sch, $f, $lbd, $ubd, $bkthlpr_fields) = @_;
	    eval q(({ . &scheme = ($sch), . &hist_dtype = ($dt), . &flags = ($f), . &lb =  &stats_ctor_vsd_numeric($lbd), . &ub =  &stats_ctor_vsd_numeric($ubd), $bkthlpr_fields }));
    }' unless defined(&HIST_HLPR_INFO);
    eval 'sub STATS_VSS_CRHIST32_LIN {
        my($lb, $ub, $stepinc, $vsdflags) = @_;
	    eval q( &STATS_VSS_HIST( &VSD_DTYPE_CRHIST32,  &HIST_HLPR_INFO( &VSD_DTYPE_CRHIST32,  &BKT_LIN, $vsdflags, $lb, $ub,  &HIST_HLPR_INFO_LIN_FIELDS($stepinc))));
    }' unless defined(&STATS_VSS_CRHIST32_LIN);
    eval 'sub STATS_VSS_CRHIST64_LIN {
        my($lb, $ub, $stepinc, $vsdflags) = @_;
	    eval q( &STATS_VSS_HIST( &VSD_DTYPE_CRHIST64,  &HIST_HLPR_INFO( &VSD_DTYPE_CRHIST64,  &BKT_LIN, $vsdflags, $lb, $ub,  &HIST_HLPR_INFO_LIN_FIELDS($stepinc))));
    }' unless defined(&STATS_VSS_CRHIST64_LIN);
    eval 'sub STATS_VSS_CRHIST32_EXP {
        my($lb, $ub, $stepbase, $stepexp, $vsdflags) = @_;
	    eval q( &STATS_VSS_HIST( &VSD_DTYPE_CRHIST32,  &HIST_HLPR_INFO( &VSD_DTYPE_CRHIST32,  &BKT_EXP, $vsdflags, $lb, $ub,  &HIST_HLPR_INFO_EXP_FIELDS($stepbase, $stepexp))));
    }' unless defined(&STATS_VSS_CRHIST32_EXP);
    eval 'sub STATS_VSS_CRHIST64_EXP {
        my($lb, $ub, $stepbase, $stepexp, $vsdflags) = @_;
	    eval q( &STATS_VSS_HIST( &VSD_DTYPE_CRHIST64,  &HIST_HLPR_INFO( &VSD_DTYPE_CRHIST64,  &BKT_EXP, $vsdflags, $lb, $ub,  &HIST_HLPR_INFO_EXP_FIELDS($stepbase, $stepexp))));
    }' unless defined(&STATS_VSS_CRHIST64_EXP);
    eval 'sub STATS_VSS_CRHIST32_LINEXP {
        my($lb, $ub, $nlinsteps, $stepbase, $vsdflags) = @_;
	    eval q( &STATS_VSS_HIST( &VSD_DTYPE_CRHIST32,  &HIST_HLPR_INFO( &VSD_DTYPE_CRHIST32,  &BKT_LINEXP, $vsdflags, $lb, $ub,  &HIST_HLPR_INFO_LINEXP_FIELDS($nlinsteps, $stepbase))));
    }' unless defined(&STATS_VSS_CRHIST32_LINEXP);
    eval 'sub STATS_VSS_CRHIST64_LINEXP {
        my($lb, $ub, $nlinsteps, $stepbase, $vsdflags) = @_;
	    eval q( &STATS_VSS_HIST( &VSD_DTYPE_CRHIST64,  &HIST_HLPR_INFO( &VSD_DTYPE_CRHIST64,  &BKT_LINEXP, $vsdflags, $lb, $ub,  &HIST_HLPR_INFO_LINEXP_FIELDS($nlinsteps, $stepbase))));
    }' unless defined(&STATS_VSS_CRHIST64_LINEXP);
    eval 'sub STATS_VSS_CRHIST32_USR {
        my($bkts, $vsdflags) = @_;
	    eval q( &STATS_VSS_HIST( &VSD_DTYPE_CRHIST32,  &HIST_HLPR_INFO( &VSD_DTYPE_CRHIST32,  &BKT_USR, $vsdflags, 0, 0,  &HIST_HLPR_INFO_USR_FIELDS($bkts))));
    }' unless defined(&STATS_VSS_CRHIST32_USR);
    eval 'sub STATS_VSS_CRHIST64_USR {
        my($bkts, $vsdflags) = @_;
	    eval q( &STATS_VSS_HIST( &VSD_DTYPE_CRHIST64,  &HIST_HLPR_INFO( &VSD_DTYPE_CRHIST64,  &BKT_USR, $vsdflags, 0, 0,  &HIST_HLPR_INFO_USR_FIELDS($bkts))));
    }' unless defined(&STATS_VSS_CRHIST64_USR);
    eval 'sub STATS_VSS_DRHIST32_USR {
        my($bkts, $vsdflags) = @_;
	    eval q( &STATS_VSS_HIST( &VSD_DTYPE_DRHIST32,  &HIST_HLPR_INFO( &VSD_DTYPE_DRHIST32,  &BKT_USR, $vsdflags, 0, 0,  &HIST_HLPR_INFO_USR_FIELDS($bkts))));
    }' unless defined(&STATS_VSS_DRHIST32_USR);
    eval 'sub STATS_VSS_DRHIST64_USR {
        my($bkts, $vsdflags) = @_;
	    eval q( &STATS_VSS_HIST( &VSD_DTYPE_DRHIST64,  &HIST_HLPR_INFO( &VSD_DTYPE_DRHIST64,  &BKT_USR, $vsdflags, 0, 0,  &HIST_HLPR_INFO_USR_FIELDS($bkts))));
    }' unless defined(&STATS_VSS_DRHIST64_USR);
    eval 'sub STATS_VSS_DVHIST32_USR {
        my($vals, $vsdflags) = @_;
	    eval q( &STATS_VSS_HIST( &VSD_DTYPE_DVHIST32,  &HIST_HLPR_INFO( &VSD_DTYPE_DVHIST32,  &BKT_USR, $vsdflags, 0, 0,  &HIST_HLPR_INFO_USR_FIELDS($vals))));
    }' unless defined(&STATS_VSS_DVHIST32_USR);
    eval 'sub STATS_VSS_DVHIST64_USR {
        my($vals, $vsdflags) = @_;
	    eval q( &STATS_VSS_HIST( &VSD_DTYPE_DVHIST64,  &HIST_HLPR_INFO( &VSD_DTYPE_DVHIST64,  &BKT_USR, $vsdflags, 0, 0,  &HIST_HLPR_INFO_USR_FIELDS($vals))));
    }' unless defined(&STATS_VSS_DVHIST64_USR);
    eval 'sub DRBKT {
        my($lb, $ub) = @_;
	    eval q({  &stats_ctor_vsd_numeric($lb),  &stats_ctor_vsd_numeric($ub) });
    }' unless defined(&DRBKT);
    eval 'sub DVBKT {
        my($val) = @_;
	    eval q( &DRBKT($val, $val));
    }' unless defined(&DVBKT);
    eval 'sub CRBKT {
        my($lb) = @_;
	    eval q( &DRBKT($lb, $lb));
    }' unless defined(&CRBKT);
    eval 'sub HBKTS () {(...) ((\'struct voistatdata_numeric\' [][2]){ &__VA_ARGS__});}' unless defined(&HBKTS);
    eval 'sub VSD_HIST_FIELD {
        my($hist, $cnst, $hist_dtype, $op, $field) = @_;
	    eval q(( &VSD_DTYPE_CRHIST32 == ($hist_dtype) ? $op( &_VSD($cnst,  &crhist32, $hist)->$field) : ( &VSD_DTYPE_DRHIST32 == ($hist_dtype) ? $op( &_VSD($cnst,  &drhist32, $hist)->$field) : ( &VSD_DTYPE_DVHIST32 == ($hist_dtype) ? $op( &_VSD($cnst,  &dvhist32, $hist)->$field) : ( &VSD_DTYPE_CRHIST64 == ($hist_dtype) ? $op( &_VSD($cnst,  &crhist64, $hist)->$field) : ( &VSD_DTYPE_DRHIST64 == ($hist_dtype) ? $op( &_VSD($cnst,  &drhist64, $hist)->$field) : ($op( &_VSD($cnst,  &dvhist64, $hist)->$field))))))));
    }' unless defined(&VSD_HIST_FIELD);
    eval 'sub VSD_HIST_FIELDVAL {
        my($hist, $hist_dtype, $field) = @_;
	    eval q( &VSD_HIST_FIELD($hist, , $hist_dtype, ,$field));
    }' unless defined(&VSD_HIST_FIELDVAL);
    eval 'sub VSD_CONSTHIST_FIELDVAL {
        my($hist, $hist_dtype, $field) = @_;
	    eval q( &VSD_HIST_FIELD($hist,  &const, $hist_dtype, ,$field));
    }' unless defined(&VSD_CONSTHIST_FIELDVAL);
    eval 'sub VSD_HIST_FIELDPTR {
        my($hist, $hist_dtype, $field) = @_;
	    eval q( &VSD_HIST_FIELD($hist, , $hist_dtype, ( &void *)&,$field));
    }' unless defined(&VSD_HIST_FIELDPTR);
    eval 'sub VSD_CONSTHIST_FIELDPTR {
        my($hist, $hist_dtype, $field) = @_;
	    eval q( &VSD_HIST_FIELD($hist,  &const, $hist_dtype, ( &void *)&,$field));
    }' unless defined(&VSD_CONSTHIST_FIELDPTR);
    eval 'sub VSD_CRHIST_FIELD {
        my($hist, $cnst, $hist_dtype, $op, $field) = @_;
	    eval q(( &VSD_DTYPE_CRHIST32 == ($hist_dtype) ? $op( &_VSD($cnst,  &crhist32, $hist)->$field) : $op( &_VSD($cnst,  &crhist64, $hist)->$field)));
    }' unless defined(&VSD_CRHIST_FIELD);
    eval 'sub VSD_CRHIST_FIELDVAL {
        my($hist, $hist_dtype, $field) = @_;
	    eval q( &VSD_CRHIST_FIELD($hist, , $hist_dtype, , $field));
    }' unless defined(&VSD_CRHIST_FIELDVAL);
    eval 'sub VSD_CONSTCRHIST_FIELDVAL {
        my($hist, $hist_dtype, $field) = @_;
	    eval q( &VSD_CRHIST_FIELD($hist,  &const, $hist_dtype, , $field));
    }' unless defined(&VSD_CONSTCRHIST_FIELDVAL);
    eval 'sub VSD_CRHIST_FIELDPTR {
        my($hist, $hist_dtype, $field) = @_;
	    eval q( &VSD_CRHIST_FIELD($hist, , $hist_dtype, &, $field));
    }' unless defined(&VSD_CRHIST_FIELDPTR);
    eval 'sub VSD_CONSTCRHIST_FIELDPTR {
        my($hist, $hist_dtype, $field) = @_;
	    eval q( &VSD_CRHIST_FIELD($hist,  &const, $hist_dtype, &, $field));
    }' unless defined(&VSD_CONSTCRHIST_FIELDPTR);
    eval 'sub VSD_DRHIST_FIELD {
        my($hist, $cnst, $hist_dtype, $op, $field) = @_;
	    eval q(( &VSD_DTYPE_DRHIST32 == ($hist_dtype) ? $op( &_VSD($cnst,  &drhist32, $hist)->$field) : $op( &_VSD($cnst,  &drhist64, $hist)->$field)));
    }' unless defined(&VSD_DRHIST_FIELD);
    eval 'sub VSD_DRHIST_FIELDVAL {
        my($hist, $hist_dtype, $field) = @_;
	    eval q( &VSD_DRHIST_FIELD($hist, , $hist_dtype, , $field));
    }' unless defined(&VSD_DRHIST_FIELDVAL);
    eval 'sub VSD_CONSTDRHIST_FIELDVAL {
        my($hist, $hist_dtype, $field) = @_;
	    eval q( &VSD_DRHIST_FIELD($hist,  &const, $hist_dtype, , $field));
    }' unless defined(&VSD_CONSTDRHIST_FIELDVAL);
    eval 'sub VSD_DRHIST_FIELDPTR {
        my($hist, $hist_dtype, $field) = @_;
	    eval q( &VSD_DRHIST_FIELD($hist, , $hist_dtype, &, $field));
    }' unless defined(&VSD_DRHIST_FIELDPTR);
    eval 'sub VSD_CONSTDRHIST_FIELDPTR {
        my($hist, $hist_dtype, $field) = @_;
	    eval q( &VSD_DRHIST_FIELD($hist,  &const, $hist_dtype, &, $field));
    }' unless defined(&VSD_CONSTDRHIST_FIELDPTR);
    eval 'sub VSD_DVHIST_FIELD {
        my($hist, $cnst, $hist_dtype, $op, $field) = @_;
	    eval q(( &VSD_DTYPE_DVHIST32 == ($hist_dtype) ? $op( &_VSD($cnst,  &dvhist32, $hist)->$field) : $op( &_VSD($cnst,  &dvhist64, $hist)->$field)));
    }' unless defined(&VSD_DVHIST_FIELD);
    eval 'sub VSD_DVHIST_FIELDVAL {
        my($hist, $hist_dtype, $field) = @_;
	    eval q( &VSD_DVHIST_FIELD($hist, , $hist_dtype, , $field));
    }' unless defined(&VSD_DVHIST_FIELDVAL);
    eval 'sub VSD_CONSTDVHIST_FIELDVAL {
        my($hist, $hist_dtype, $field) = @_;
	    eval q( &VSD_DVHIST_FIELD($hist,  &const, $hist_dtype, , $field));
    }' unless defined(&VSD_CONSTDVHIST_FIELDVAL);
    eval 'sub VSD_DVHIST_FIELDPTR {
        my($hist, $hist_dtype, $field) = @_;
	    eval q( &VSD_DVHIST_FIELD($hist, , $hist_dtype, &, $field));
    }' unless defined(&VSD_DVHIST_FIELDPTR);
    eval 'sub VSD_CONSTDVHIST_FIELDPTR {
        my($hist, $hist_dtype, $field) = @_;
	    eval q( &VSD_DVHIST_FIELD($hist,  &const, $hist_dtype, &, $field));
    }' unless defined(&VSD_CONSTDVHIST_FIELDPTR);
    eval 'sub STATS_ABI_V1 () {1;}' unless defined(&STATS_ABI_V1);
    eval("sub SB_UE () { 0; }") unless defined(&SB_UE);
    eval("sub SB_LE () { 1; }") unless defined(&SB_LE);
    eval("sub SB_BE () { 2; }") unless defined(&SB_BE);
    eval("sub TPL_SR_UNLOCKED_GET () { 0; }") unless defined(&TPL_SR_UNLOCKED_GET);
    eval("sub TPL_SR_RLOCKED_GET () { 1; }") unless defined(&TPL_SR_RLOCKED_GET);
    eval("sub TPL_SR_RUNLOCK () { 2; }") unless defined(&TPL_SR_RUNLOCK);
    eval("sub TPL_SR_PUT () { 3; }") unless defined(&TPL_SR_PUT);
    eval 'sub SB_IT_FIRST_CB () {0x1;}' unless defined(&SB_IT_FIRST_CB);
    eval 'sub SB_IT_LAST_CB () {0x2;}' unless defined(&SB_IT_LAST_CB);
    eval 'sub SB_IT_FIRST_VOI () {0x4;}' unless defined(&SB_IT_FIRST_VOI);
    eval 'sub SB_IT_LAST_VOI () {0x8;}' unless defined(&SB_IT_LAST_VOI);
    eval 'sub SB_IT_FIRST_VOISTAT () {0x10;}' unless defined(&SB_IT_FIRST_VOISTAT);
    eval 'sub SB_IT_LAST_VOISTAT () {0x20;}' unless defined(&SB_IT_LAST_VOISTAT);
    eval 'sub SB_IT_NULLVOI () {0x40;}' unless defined(&SB_IT_NULLVOI);
    eval 'sub SB_IT_NULLVOISTAT () {0x80;}' unless defined(&SB_IT_NULLVOISTAT);
    eval 'sub SB_CLONE_RSTSRC () {0x1;}' unless defined(&SB_CLONE_RSTSRC);
    eval 'sub SB_CLONE_ALLOCDST () {0x2;}' unless defined(&SB_CLONE_ALLOCDST);
    eval 'sub SB_CLONE_USRDSTNOFAULT () {0x4;}' unless defined(&SB_CLONE_USRDSTNOFAULT);
    eval 'sub SB_CLONE_USRDST () {0x8;}' unless defined(&SB_CLONE_USRDST);
    eval 'sub SB_TOSTR_OBJDUMP () {0x1;}' unless defined(&SB_TOSTR_OBJDUMP);
    eval 'sub SB_TOSTR_META () {0x2;}' unless defined(&SB_TOSTR_META);
    eval 'sub SB_VOI_RELUPDATE () {0x1;}' unless defined(&SB_VOI_RELUPDATE);
    eval 'sub stats_ctor_vsd_numeric {
        my($val) = @_;
	    eval q({ \'struct voistatdata_numeric\'  &tmp;  ($tmp->{int64}->{u64}) = $val; ( &tmp); });
    }' unless defined(&stats_ctor_vsd_numeric);
    eval 'sub stats_tpl_alloc {
        my($name,$flags) = @_;
	    eval q({ ( &stats_v1_tpl_alloc($name, $flags)); });
    }' unless defined(&stats_tpl_alloc);
    eval 'sub stats_tpl_add_voistats {
        my($tpl_id,$voi_id,$voi_name,$voi_dtype,$nvss,$vss,$flags) = @_;
	    eval q({ \'int\'  &ret;  &if (( &ret =  &stats_vss_hlpr_init($voi_dtype, $nvss, $vss)) == 0) {  &ret =  &stats_v1_tpl_add_voistats($tpl_id, $voi_id, $voi_name, $voi_dtype, $nvss, $vss, $flags); }  &stats_vss_hlpr_cleanup($nvss, $vss); ( &ret); });
    }' unless defined(&stats_tpl_add_voistats);
    eval 'sub stats_blob_init {
        my($sb,$tpl_id,$flags) = @_;
	    eval q({ ( &stats_v1_blob_init($sb, $tpl_id, $flags)); });
    }' unless defined(&stats_blob_init);
    eval 'sub stats_blob_alloc {
        my($tpl_id,$flags) = @_;
	    eval q({ ( &stats_v1_blob_alloc($tpl_id, $flags)); });
    }' unless defined(&stats_blob_alloc);
    eval 'sub stats_blob_clone {
        my($dst,$dstmaxsz,$src,$flags) = @_;
	    eval q({ ( &stats_v1_blob_clone($dst, $dstmaxsz, $src, $flags)); });
    }' unless defined(&stats_blob_clone);
    eval 'sub stats_blob_destroy {
        my($sb) = @_;
	    eval q({  &stats_v1_blob_destroy($sb); });
    }' unless defined(&stats_blob_destroy);
    eval 'sub stats_blob_visit {
        my($sb,$func,$usrctx) = @_;
	    eval q({ ( &stats_v1_blob_visit($sb, $func, $usrctx)); });
    }' unless defined(&stats_blob_visit);
    eval 'sub stats_blob_tostr {
        my($sb,$buf,$fmt,$flags) = @_;
	    eval q({ ( &stats_v1_blob_tostr($sb, $buf, $fmt, $flags)); });
    }' unless defined(&stats_blob_tostr);
    eval 'sub stats_voistat_fetch_dptr {
        my($sb,$voi_id,$stype,$retdtype,$retvsd,$retvsdsz) = @_;
	    eval q({ ( &stats_v1_voistat_fetch_dptr($sb, $voi_id, $stype, $retdtype, $retvsd, $retvsdsz)); });
    }' unless defined(&stats_voistat_fetch_dptr);
    eval 'sub stats_voistat_fetch_s64 {
        my($sb,$voi_id,$stype,$ret) = @_;
	    eval q({ \'struct voistatdata\' * &vsd;  &enum  &vsd_dtype  &vs_dtype; \'int\'  &error;  &if (( &error =  &stats_voistat_fetch_dptr($sb, $voi_id, $stype,  &vs_dtype,  &vsd,  &NULL))) ( &error);  &else  &if ( &VSD_DTYPE_INT_S64 !=  &vs_dtype) ( &EFTYPE); *$ret =  ($vsd->{int64}->{s64}); (0); });
    }' unless defined(&stats_voistat_fetch_s64);
    eval 'sub stats_voistat_fetch_u64 {
        my($sb,$voi_id,$stype,$ret) = @_;
	    eval q({ \'struct voistatdata\' * &vsd;  &enum  &vsd_dtype  &vs_dtype; \'int\'  &error;  &if (( &error =  &stats_voistat_fetch_dptr($sb, $voi_id, $stype,  &vs_dtype,  &vsd,  &NULL))) ( &error);  &else  &if ( &VSD_DTYPE_INT_U64 !=  &vs_dtype) ( &EFTYPE); *$ret =  ($vsd->{int64}->{u64}); (0); });
    }' unless defined(&stats_voistat_fetch_u64);
    eval 'sub stats_voistat_fetch_s32 {
        my($sb,$voi_id,$stype,$ret) = @_;
	    eval q({ \'struct voistatdata\' * &vsd;  &enum  &vsd_dtype  &vs_dtype; \'int\'  &error;  &if (( &error =  &stats_voistat_fetch_dptr($sb, $voi_id, $stype,  &vs_dtype,  &vsd,  &NULL))) ( &error);  &else  &if ( &VSD_DTYPE_INT_S32 !=  &vs_dtype) ( &EFTYPE); *$ret =  ($vsd->{int32}->{s32}); (0); });
    }' unless defined(&stats_voistat_fetch_s32);
    eval 'sub stats_voistat_fetch_u32 {
        my($sb,$voi_id,$stype,$ret) = @_;
	    eval q({ \'struct voistatdata\' * &vsd;  &enum  &vsd_dtype  &vs_dtype; \'int\'  &error;  &if (( &error =  &stats_voistat_fetch_dptr($sb, $voi_id, $stype,  &vs_dtype,  &vsd,  &NULL))) ( &error);  &else  &if ( &VSD_DTYPE_INT_U32 !=  &vs_dtype) ( &EFTYPE); *$ret =  ($vsd->{int32}->{u32}); (0); });
    }' unless defined(&stats_voistat_fetch_u32);
    eval 'sub stats_voistat_fetch_slong {
        my($sb,$voi_id,$stype,$ret) = @_;
	    eval q({ \'struct voistatdata\' * &vsd;  &enum  &vsd_dtype  &vs_dtype; \'int\'  &error;  &if (( &error =  &stats_voistat_fetch_dptr($sb, $voi_id, $stype,  &vs_dtype,  &vsd,  &NULL))) ( &error);  &else  &if ( &VSD_DTYPE_INT_SLONG !=  &vs_dtype) ( &EFTYPE); *$ret =  ($vsd->{intlong}->{slong}); (0); });
    }' unless defined(&stats_voistat_fetch_slong);
    eval 'sub stats_voistat_fetch_ulong {
        my($sb,$voi_id,$stype,$ret) = @_;
	    eval q({ \'struct voistatdata\' * &vsd;  &enum  &vsd_dtype  &vs_dtype; \'int\'  &error;  &if (( &error =  &stats_voistat_fetch_dptr($sb, $voi_id, $stype,  &vs_dtype,  &vsd,  &NULL))) ( &error);  &else  &if ( &VSD_DTYPE_INT_ULONG !=  &vs_dtype) ( &EFTYPE); *$ret =  ($vsd->{intlong}->{ulong}); (0); });
    }' unless defined(&stats_voistat_fetch_ulong);
    eval 'sub stats_blob_snapshot {
        my($dst,$dstmaxsz,$src,$flags) = @_;
	    eval q({ ( &stats_v1_blob_snapshot($dst, $dstmaxsz, $src, $flags)); });
    }' unless defined(&stats_blob_snapshot);
    eval 'sub stats_voi_update_abs_s32 {
        my($sb,$voi_id,$voival) = @_;
	    eval q({  &if ($sb ==  &NULL) (0); \'struct voistatdata\'  &tmp;  ($tmp->{int32}->{s32}) = $voival; ( &stats_v1_voi_update($sb, $voi_id,  &VSD_DTYPE_INT_S32,  &tmp, 0)); });
    }' unless defined(&stats_voi_update_abs_s32);
    eval 'sub stats_voi_update_rel_s32 {
        my($sb,$voi_id,$voival) = @_;
	    eval q({  &if ($sb ==  &NULL) (0); \'struct voistatdata\'  &tmp;  ($tmp->{int32}->{s32}) = $voival; ( &stats_v1_voi_update($sb, $voi_id,  &VSD_DTYPE_INT_S32,  &tmp,  &SB_VOI_RELUPDATE)); });
    }' unless defined(&stats_voi_update_rel_s32);
    eval 'sub stats_voi_update_abs_u32 {
        my($sb,$voi_id,$voival) = @_;
	    eval q({  &if ($sb ==  &NULL) (0); \'struct voistatdata\'  &tmp;  ($tmp->{int32}->{u32}) = $voival; ( &stats_v1_voi_update($sb, $voi_id,  &VSD_DTYPE_INT_U32,  &tmp, 0)); });
    }' unless defined(&stats_voi_update_abs_u32);
    eval 'sub stats_voi_update_rel_u32 {
        my($sb,$voi_id,$voival) = @_;
	    eval q({  &if ($sb ==  &NULL) (0); \'struct voistatdata\'  &tmp;  ($tmp->{int32}->{u32}) = $voival; ( &stats_v1_voi_update($sb, $voi_id,  &VSD_DTYPE_INT_U32,  &tmp,  &SB_VOI_RELUPDATE)); });
    }' unless defined(&stats_voi_update_rel_u32);
    eval 'sub stats_voi_update_abs_s64 {
        my($sb,$voi_id,$voival) = @_;
	    eval q({  &if ($sb ==  &NULL) (0); \'struct voistatdata\'  &tmp;  ($tmp->{int64}->{s64}) = $voival; ( &stats_v1_voi_update($sb, $voi_id,  &VSD_DTYPE_INT_S64,  &tmp, 0)); });
    }' unless defined(&stats_voi_update_abs_s64);
    eval 'sub stats_voi_update_rel_s64 {
        my($sb,$voi_id,$voival) = @_;
	    eval q({  &if ($sb ==  &NULL) (0); \'struct voistatdata\'  &tmp;  ($tmp->{int64}->{s64}) = $voival; ( &stats_v1_voi_update($sb, $voi_id,  &VSD_DTYPE_INT_S64,  &tmp,  &SB_VOI_RELUPDATE)); });
    }' unless defined(&stats_voi_update_rel_s64);
    eval 'sub stats_voi_update_abs_u64 {
        my($sb,$voi_id,$voival) = @_;
	    eval q({  &if ($sb ==  &NULL) (0); \'struct voistatdata\'  &tmp;  ($tmp->{int64}->{u64}) = $voival; ( &stats_v1_voi_update($sb, $voi_id,  &VSD_DTYPE_INT_U64,  &tmp, 0)); });
    }' unless defined(&stats_voi_update_abs_u64);
    eval 'sub stats_voi_update_rel_u64 {
        my($sb,$voi_id,$voival) = @_;
	    eval q({  &if ($sb ==  &NULL) (0); \'struct voistatdata\'  &tmp;  ($tmp->{int64}->{u64}) = $voival; ( &stats_v1_voi_update($sb, $voi_id,  &VSD_DTYPE_INT_U64,  &tmp,  &SB_VOI_RELUPDATE)); });
    }' unless defined(&stats_voi_update_rel_u64);
    eval 'sub stats_voi_update_abs_slong {
        my($sb,$voi_id,$voival) = @_;
	    eval q({  &if ($sb ==  &NULL) (0); \'struct voistatdata\'  &tmp;  ($tmp->{intlong}->{slong}) = $voival; ( &stats_v1_voi_update($sb, $voi_id,  &VSD_DTYPE_INT_SLONG,  &tmp, 0)); });
    }' unless defined(&stats_voi_update_abs_slong);
    eval 'sub stats_voi_update_rel_slong {
        my($sb,$voi_id,$voival) = @_;
	    eval q({  &if ($sb ==  &NULL) (0); \'struct voistatdata\'  &tmp;  ($tmp->{intlong}->{slong}) = $voival; ( &stats_v1_voi_update($sb, $voi_id,  &VSD_DTYPE_INT_SLONG,  &tmp,  &SB_VOI_RELUPDATE)); });
    }' unless defined(&stats_voi_update_rel_slong);
    eval 'sub stats_voi_update_abs_ulong {
        my($sb,$voi_id,$voival) = @_;
	    eval q({  &if ($sb ==  &NULL) (0); \'struct voistatdata\'  &tmp;  ($tmp->{intlong}->{ulong}) = $voival; ( &stats_v1_voi_update($sb, $voi_id,  &VSD_DTYPE_INT_ULONG,  &tmp, 0)); });
    }' unless defined(&stats_voi_update_abs_ulong);
    eval 'sub stats_voi_update_rel_ulong {
        my($sb,$voi_id,$voival) = @_;
	    eval q({  &if ($sb ==  &NULL) (0); \'struct voistatdata\'  &tmp;  ($tmp->{intlong}->{ulong}) = $voival; ( &stats_v1_voi_update($sb, $voi_id,  &VSD_DTYPE_INT_ULONG,  &tmp,  &SB_VOI_RELUPDATE)); });
    }' unless defined(&stats_voi_update_rel_ulong);
    eval 'sub stats_voi_update_abs_sq32 {
        my($sb,$voi_id,$voival) = @_;
	    eval q({  &if ($sb ==  &NULL) (0); \'struct voistatdata\'  &tmp;  ($tmp->{q32}->{sq32}) = $voival; ( &stats_v1_voi_update($sb, $voi_id,  &VSD_DTYPE_Q_S32,  &tmp, 0)); });
    }' unless defined(&stats_voi_update_abs_sq32);
    eval 'sub stats_voi_update_rel_sq32 {
        my($sb,$voi_id,$voival) = @_;
	    eval q({  &if ($sb ==  &NULL) (0); \'struct voistatdata\'  &tmp;  ($tmp->{q32}->{sq32}) = $voival; ( &stats_v1_voi_update($sb, $voi_id,  &VSD_DTYPE_Q_S32,  &tmp,  &SB_VOI_RELUPDATE)); });
    }' unless defined(&stats_voi_update_rel_sq32);
    eval 'sub stats_voi_update_abs_uq32 {
        my($sb,$voi_id,$voival) = @_;
	    eval q({  &if ($sb ==  &NULL) (0); \'struct voistatdata\'  &tmp;  ($tmp->{q32}->{uq32}) = $voival; ( &stats_v1_voi_update($sb, $voi_id,  &VSD_DTYPE_Q_U32,  &tmp, 0)); });
    }' unless defined(&stats_voi_update_abs_uq32);
    eval 'sub stats_voi_update_rel_uq32 {
        my($sb,$voi_id,$voival) = @_;
	    eval q({  &if ($sb ==  &NULL) (0); \'struct voistatdata\'  &tmp;  ($tmp->{q32}->{uq32}) = $voival; ( &stats_v1_voi_update($sb, $voi_id,  &VSD_DTYPE_Q_U32,  &tmp,  &SB_VOI_RELUPDATE)); });
    }' unless defined(&stats_voi_update_rel_uq32);
    eval 'sub stats_voi_update_abs_sq64 {
        my($sb,$voi_id,$voival) = @_;
	    eval q({  &if ($sb ==  &NULL) (0); \'struct voistatdata\'  &tmp;  ($tmp->{q64}->{sq64}) = $voival; ( &stats_v1_voi_update($sb, $voi_id,  &VSD_DTYPE_Q_S64,  &tmp, 0)); });
    }' unless defined(&stats_voi_update_abs_sq64);
    eval 'sub stats_voi_update_rel_sq64 {
        my($sb,$voi_id,$voival) = @_;
	    eval q({  &if ($sb ==  &NULL) (0); \'struct voistatdata\'  &tmp;  ($tmp->{q64}->{sq64}) = $voival; ( &stats_v1_voi_update($sb, $voi_id,  &VSD_DTYPE_Q_S64,  &tmp,  &SB_VOI_RELUPDATE)); });
    }' unless defined(&stats_voi_update_rel_sq64);
    eval 'sub stats_voi_update_abs_uq64 {
        my($sb,$voi_id,$voival) = @_;
	    eval q({  &if ($sb ==  &NULL) (0); \'struct voistatdata\'  &tmp;  ($tmp->{q64}->{uq64}) = $voival; ( &stats_v1_voi_update($sb, $voi_id,  &VSD_DTYPE_Q_U64,  &tmp, 0)); });
    }' unless defined(&stats_voi_update_abs_uq64);
    eval 'sub stats_voi_update_rel_uq64 {
        my($sb,$voi_id,$voival) = @_;
	    eval q({  &if ($sb ==  &NULL) (0); \'struct voistatdata\'  &tmp;  ($tmp->{q64}->{uq64}) = $voival; ( &stats_v1_voi_update($sb, $voi_id,  &VSD_DTYPE_Q_U64,  &tmp,  &SB_VOI_RELUPDATE)); });
    }' unless defined(&stats_voi_update_rel_uq64);
}
1;

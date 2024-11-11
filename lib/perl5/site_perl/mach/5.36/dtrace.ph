require '_h2ph_pre.ph';

no warnings qw(redefine misc);

unless(defined(&_DTRACE_H)) {
    eval 'sub _DTRACE_H () {1;}' unless defined(&_DTRACE_H);
    require 'sys/dtrace.ph';
    require 'stdarg.ph';
    require 'stdio.ph';
    require 'gelf.ph';
    require 'libproc.ph';
    unless(defined(&illumos)) {
	require 'rtld_db.ph';
    }
    if(defined(&__cplusplus)) {
    }
    eval 'sub DTRACE_VERSION () {3;}' unless defined(&DTRACE_VERSION);
    eval 'sub DTRACE_O_NODEV () {0x1;}' unless defined(&DTRACE_O_NODEV);
    eval 'sub DTRACE_O_NOSYS () {0x2;}' unless defined(&DTRACE_O_NOSYS);
    eval 'sub DTRACE_O_LP64 () {0x4;}' unless defined(&DTRACE_O_LP64);
    eval 'sub DTRACE_O_ILP32 () {0x8;}' unless defined(&DTRACE_O_ILP32);
    eval 'sub DTRACE_O_MASK () {0xf;}' unless defined(&DTRACE_O_MASK);
    eval 'sub DTRACE_C_DIFV () {0x1;}' unless defined(&DTRACE_C_DIFV);
    eval 'sub DTRACE_C_EMPTY () {0x2;}' unless defined(&DTRACE_C_EMPTY);
    eval 'sub DTRACE_C_ZDEFS () {0x4;}' unless defined(&DTRACE_C_ZDEFS);
    eval 'sub DTRACE_C_EATTR () {0x8;}' unless defined(&DTRACE_C_EATTR);
    eval 'sub DTRACE_C_CPP () {0x10;}' unless defined(&DTRACE_C_CPP);
    eval 'sub DTRACE_C_KNODEF () {0x20;}' unless defined(&DTRACE_C_KNODEF);
    eval 'sub DTRACE_C_UNODEF () {0x40;}' unless defined(&DTRACE_C_UNODEF);
    eval 'sub DTRACE_C_PSPEC () {0x80;}' unless defined(&DTRACE_C_PSPEC);
    eval 'sub DTRACE_C_ETAGS () {0x100;}' unless defined(&DTRACE_C_ETAGS);
    eval 'sub DTRACE_C_ARGREF () {0x200;}' unless defined(&DTRACE_C_ARGREF);
    eval 'sub DTRACE_C_SUGAR () {0x400;}' unless defined(&DTRACE_C_SUGAR);
    eval 'sub DTRACE_C_DEFARG () {0x800;}' unless defined(&DTRACE_C_DEFARG);
    eval 'sub DTRACE_C_NOLIBS () {0x1000;}' unless defined(&DTRACE_C_NOLIBS);
    eval 'sub DTRACE_C_CTL () {0x2000;}' unless defined(&DTRACE_C_CTL);
    eval 'sub DTRACE_C_MASK () {0x3fff;}' unless defined(&DTRACE_C_MASK);
    eval 'sub DTRACE_D_STRIP () {0x1;}' unless defined(&DTRACE_D_STRIP);
    eval 'sub DTRACE_D_PROBES () {0x2;}' unless defined(&DTRACE_D_PROBES);
    eval 'sub DTRACE_D_MASK () {0x3;}' unless defined(&DTRACE_D_MASK);
    eval("sub DTRACEFLOW_ENTRY () { 0; }") unless defined(&DTRACEFLOW_ENTRY);
    eval("sub DTRACEFLOW_RETURN () { 1; }") unless defined(&DTRACEFLOW_RETURN);
    eval("sub DTRACEFLOW_NONE () { 2; }") unless defined(&DTRACEFLOW_NONE);
    eval 'sub DTRACE_CONSUME_ERROR () {-1;}' unless defined(&DTRACE_CONSUME_ERROR);
    eval 'sub DTRACE_CONSUME_THIS () {0;}' unless defined(&DTRACE_CONSUME_THIS);
    eval 'sub DTRACE_CONSUME_NEXT () {1;}' unless defined(&DTRACE_CONSUME_NEXT);
    eval 'sub DTRACE_CONSUME_ABORT () {2;}' unless defined(&DTRACE_CONSUME_ABORT);
    eval 'sub DTRACE_STATUS_NONE () {0;}' unless defined(&DTRACE_STATUS_NONE);
    eval 'sub DTRACE_STATUS_OKAY () {1;}' unless defined(&DTRACE_STATUS_OKAY);
    eval 'sub DTRACE_STATUS_EXITED () {2;}' unless defined(&DTRACE_STATUS_EXITED);
    eval 'sub DTRACE_STATUS_FILLED () {3;}' unless defined(&DTRACE_STATUS_FILLED);
    eval 'sub DTRACE_STATUS_STOPPED () {4;}' unless defined(&DTRACE_STATUS_STOPPED);
    eval("sub DTRACE_WORKSTATUS_ERROR () { -1; }") unless defined(&DTRACE_WORKSTATUS_ERROR);
    eval("sub DTRACE_WORKSTATUS_OKAY () { 0; }") unless defined(&DTRACE_WORKSTATUS_OKAY);
    eval("sub DTRACE_WORKSTATUS_DONE () { 1; }") unless defined(&DTRACE_WORKSTATUS_DONE);
    eval 'sub DTRACE_HANDLE_ABORT () {-1;}' unless defined(&DTRACE_HANDLE_ABORT);
    eval 'sub DTRACE_HANDLE_OK () {0;}' unless defined(&DTRACE_HANDLE_OK);
    eval("sub DTRACEDROP_PRINCIPAL () { 0; }") unless defined(&DTRACEDROP_PRINCIPAL);
    eval("sub DTRACEDROP_AGGREGATION () { 1; }") unless defined(&DTRACEDROP_AGGREGATION);
    eval("sub DTRACEDROP_DYNAMIC () { 2; }") unless defined(&DTRACEDROP_DYNAMIC);
    eval("sub DTRACEDROP_DYNRINSE () { 3; }") unless defined(&DTRACEDROP_DYNRINSE);
    eval("sub DTRACEDROP_DYNDIRTY () { 4; }") unless defined(&DTRACEDROP_DYNDIRTY);
    eval("sub DTRACEDROP_SPEC () { 5; }") unless defined(&DTRACEDROP_SPEC);
    eval("sub DTRACEDROP_SPECBUSY () { 6; }") unless defined(&DTRACEDROP_SPECBUSY);
    eval("sub DTRACEDROP_SPECUNAVAIL () { 7; }") unless defined(&DTRACEDROP_SPECUNAVAIL);
    eval("sub DTRACEDROP_STKSTROVERFLOW () { 8; }") unless defined(&DTRACEDROP_STKSTROVERFLOW);
    eval("sub DTRACEDROP_DBLERROR () { 9; }") unless defined(&DTRACEDROP_DBLERROR);
    eval 'sub DTRACE_BUFDATA_AGGKEY () {0x1;}' unless defined(&DTRACE_BUFDATA_AGGKEY);
    eval 'sub DTRACE_BUFDATA_AGGVAL () {0x2;}' unless defined(&DTRACE_BUFDATA_AGGVAL);
    eval 'sub DTRACE_BUFDATA_AGGFORMAT () {0x4;}' unless defined(&DTRACE_BUFDATA_AGGFORMAT);
    eval 'sub DTRACE_BUFDATA_AGGLAST () {0x8;}' unless defined(&DTRACE_BUFDATA_AGGLAST);
    eval 'sub DTRACE_A_PERCPU () {0x1;}' unless defined(&DTRACE_A_PERCPU);
    eval 'sub DTRACE_A_KEEPDELTA () {0x2;}' unless defined(&DTRACE_A_KEEPDELTA);
    eval 'sub DTRACE_A_ANONYMOUS () {0x4;}' unless defined(&DTRACE_A_ANONYMOUS);
    eval 'sub DTRACE_A_TOTAL () {0x8;}' unless defined(&DTRACE_A_TOTAL);
    eval 'sub DTRACE_A_MINMAXBIN () {0x10;}' unless defined(&DTRACE_A_MINMAXBIN);
    eval 'sub DTRACE_A_HASNEGATIVES () {0x20;}' unless defined(&DTRACE_A_HASNEGATIVES);
    eval 'sub DTRACE_A_HASPOSITIVES () {0x40;}' unless defined(&DTRACE_A_HASPOSITIVES);
    eval 'sub DTRACE_AGGZOOM_MAX () {0.95;}' unless defined(&DTRACE_AGGZOOM_MAX);
    eval 'sub DTRACE_AGGWALK_ERROR () {-1;}' unless defined(&DTRACE_AGGWALK_ERROR);
    eval 'sub DTRACE_AGGWALK_NEXT () {0;}' unless defined(&DTRACE_AGGWALK_NEXT);
    eval 'sub DTRACE_AGGWALK_ABORT () {1;}' unless defined(&DTRACE_AGGWALK_ABORT);
    eval 'sub DTRACE_AGGWALK_CLEAR () {2;}' unless defined(&DTRACE_AGGWALK_CLEAR);
    eval 'sub DTRACE_AGGWALK_NORMALIZE () {3;}' unless defined(&DTRACE_AGGWALK_NORMALIZE);
    eval 'sub DTRACE_AGGWALK_DENORMALIZE () {4;}' unless defined(&DTRACE_AGGWALK_DENORMALIZE);
    eval 'sub DTRACE_AGGWALK_REMOVE () {5;}' unless defined(&DTRACE_AGGWALK_REMOVE);
    eval 'sub DTRACE_AGD_PRINTED () {0x1;}' unless defined(&DTRACE_AGD_PRINTED);
    eval 'sub DTRACE_OBJ_EXEC () {(( &const \'char\' *)0);}' unless defined(&DTRACE_OBJ_EXEC);
    eval 'sub DTRACE_OBJ_RTLD () {(( &const \'char\' *)1);}' unless defined(&DTRACE_OBJ_RTLD);
    eval 'sub DTRACE_OBJ_CDEFS () {(( &const \'char\' *)2);}' unless defined(&DTRACE_OBJ_CDEFS);
    eval 'sub DTRACE_OBJ_DDEFS () {(( &const \'char\' *)3);}' unless defined(&DTRACE_OBJ_DDEFS);
    eval 'sub DTRACE_OBJ_EVERY () {(( &const \'char\' *)-1);}' unless defined(&DTRACE_OBJ_EVERY);
    eval 'sub DTRACE_OBJ_KMODS () {(( &const \'char\' *)-2);}' unless defined(&DTRACE_OBJ_KMODS);
    eval 'sub DTRACE_OBJ_UMODS () {(( &const \'char\' *)-3);}' unless defined(&DTRACE_OBJ_UMODS);
    eval 'sub DTRACE_OBJ_F_KERNEL () {0x1;}' unless defined(&DTRACE_OBJ_F_KERNEL);
    eval 'sub DTRACE_OBJ_F_PRIMARY () {0x2;}' unless defined(&DTRACE_OBJ_F_PRIMARY);
    eval 'sub DTT_FL_USER () {0x1;}' unless defined(&DTT_FL_USER);
    if(defined(&illumos)) {
    } else {
    }
    eval 'sub DTRACE_DESC2STR_MAX () {1024;}' unless defined(&DTRACE_DESC2STR_MAX);
    eval 'sub DTRACE_ATTR2STR_MAX () {64;}' unless defined(&DTRACE_ATTR2STR_MAX);
    if(defined(&__cplusplus)) {
    }
    unless(defined(&illumos)) {
	eval 'sub _SC_CPUID_MAX () { &_SC_NPROCESSORS_CONF;}' unless defined(&_SC_CPUID_MAX);
	eval 'sub _SC_NPROCESSORS_MAX () { &_SC_NPROCESSORS_CONF;}' unless defined(&_SC_NPROCESSORS_MAX);
    }
    eval 'sub DTRACE_OFORMAT_TEXT () {0;}' unless defined(&DTRACE_OFORMAT_TEXT);
    eval 'sub DTRACE_OFORMAT_STRUCTURED () {1;}' unless defined(&DTRACE_OFORMAT_STRUCTURED);
}
1;

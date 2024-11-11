require '_h2ph_pre.ph';

no warnings qw(redefine misc);

unless(defined(&_SYS_DTRACE_H)) {
    eval 'sub _SYS_DTRACE_H () {1;}' unless defined(&_SYS_DTRACE_H);
    if(defined(&__cplusplus)) {
    }
    unless(defined(&_ASM)) {
	require 'sys/param.ph';
	require 'sys/stdint.ph';
	if(defined(&_KERNEL)) {
	    require 'sys/endian.ph';
	}
	if(!defined(&IN_BASE)  && !defined(&_KERNEL)) {
	} else {
	    require 'sys/modctl.ph';
	    require 'sys/processor.ph';
	    require 'sys/cpuvar.ph';
	    require 'sys/param.ph';
	    require 'sys/linker.ph';
	    require 'sys/ioccom.ph';
	    require 'sys/cred.ph';
	    require 'sys/proc.ph';
	    require 'sys/types.ph';
	    require 'sys/ucred.ph';
	}
	require 'sys/ctf_api.ph';
	eval 'sub DTRACE_CPUALL () {-1;}' unless defined(&DTRACE_CPUALL);
	eval 'sub DTRACE_IDNONE () {0;}' unless defined(&DTRACE_IDNONE);
	eval 'sub DTRACE_EPIDNONE () {0;}' unless defined(&DTRACE_EPIDNONE);
	eval 'sub DTRACE_AGGIDNONE () {0;}' unless defined(&DTRACE_AGGIDNONE);
	eval 'sub DTRACE_AGGVARIDNONE () {0;}' unless defined(&DTRACE_AGGVARIDNONE);
	eval 'sub DTRACE_CACHEIDNONE () {0;}' unless defined(&DTRACE_CACHEIDNONE);
	eval 'sub DTRACE_PROVNONE () {0;}' unless defined(&DTRACE_PROVNONE);
	eval 'sub DTRACE_METAPROVNONE () {0;}' unless defined(&DTRACE_METAPROVNONE);
	eval 'sub DTRACE_ARGNONE () {-1;}' unless defined(&DTRACE_ARGNONE);
	eval 'sub DTRACE_PROVNAMELEN () {64;}' unless defined(&DTRACE_PROVNAMELEN);
	eval 'sub DTRACE_MODNAMELEN () {64;}' unless defined(&DTRACE_MODNAMELEN);
	eval 'sub DTRACE_FUNCNAMELEN () {192;}' unless defined(&DTRACE_FUNCNAMELEN);
	eval 'sub DTRACE_NAMELEN () {64;}' unless defined(&DTRACE_NAMELEN);
	eval 'sub DTRACE_FULLNAMELEN () {( &DTRACE_PROVNAMELEN +  &DTRACE_MODNAMELEN +  &DTRACE_FUNCNAMELEN +  &DTRACE_NAMELEN + 4);}' unless defined(&DTRACE_FULLNAMELEN);
	eval 'sub DTRACE_ARGTYPELEN () {128;}' unless defined(&DTRACE_ARGTYPELEN);
	eval("sub DTRACE_PROBESPEC_NONE () { -1; }") unless defined(&DTRACE_PROBESPEC_NONE);
	eval("sub DTRACE_PROBESPEC_PROVIDER () { 0; }") unless defined(&DTRACE_PROBESPEC_PROVIDER);
	eval("sub DTRACE_PROBESPEC_MOD () { 1; }") unless defined(&DTRACE_PROBESPEC_MOD);
	eval("sub DTRACE_PROBESPEC_FUNC () { 2; }") unless defined(&DTRACE_PROBESPEC_FUNC);
	eval("sub DTRACE_PROBESPEC_NAME () { 3; }") unless defined(&DTRACE_PROBESPEC_NAME);
	eval 'sub DIF_VERSION_1 () {1;}' unless defined(&DIF_VERSION_1);
	eval 'sub DIF_VERSION_2 () {2;}' unless defined(&DIF_VERSION_2);
	eval 'sub DIF_VERSION () { &DIF_VERSION_2;}' unless defined(&DIF_VERSION);
	eval 'sub DIF_DIR_NREGS () {8;}' unless defined(&DIF_DIR_NREGS);
	eval 'sub DIF_DTR_NREGS () {8;}' unless defined(&DIF_DTR_NREGS);
	eval 'sub DIF_OP_OR () {1;}' unless defined(&DIF_OP_OR);
	eval 'sub DIF_OP_XOR () {2;}' unless defined(&DIF_OP_XOR);
	eval 'sub DIF_OP_AND () {3;}' unless defined(&DIF_OP_AND);
	eval 'sub DIF_OP_SLL () {4;}' unless defined(&DIF_OP_SLL);
	eval 'sub DIF_OP_SRL () {5;}' unless defined(&DIF_OP_SRL);
	eval 'sub DIF_OP_SUB () {6;}' unless defined(&DIF_OP_SUB);
	eval 'sub DIF_OP_ADD () {7;}' unless defined(&DIF_OP_ADD);
	eval 'sub DIF_OP_MUL () {8;}' unless defined(&DIF_OP_MUL);
	eval 'sub DIF_OP_SDIV () {9;}' unless defined(&DIF_OP_SDIV);
	eval 'sub DIF_OP_UDIV () {10;}' unless defined(&DIF_OP_UDIV);
	eval 'sub DIF_OP_SREM () {11;}' unless defined(&DIF_OP_SREM);
	eval 'sub DIF_OP_UREM () {12;}' unless defined(&DIF_OP_UREM);
	eval 'sub DIF_OP_NOT () {13;}' unless defined(&DIF_OP_NOT);
	eval 'sub DIF_OP_MOV () {14;}' unless defined(&DIF_OP_MOV);
	eval 'sub DIF_OP_CMP () {15;}' unless defined(&DIF_OP_CMP);
	eval 'sub DIF_OP_TST () {16;}' unless defined(&DIF_OP_TST);
	eval 'sub DIF_OP_BA () {17;}' unless defined(&DIF_OP_BA);
	eval 'sub DIF_OP_BE () {18;}' unless defined(&DIF_OP_BE);
	eval 'sub DIF_OP_BNE () {19;}' unless defined(&DIF_OP_BNE);
	eval 'sub DIF_OP_BG () {20;}' unless defined(&DIF_OP_BG);
	eval 'sub DIF_OP_BGU () {21;}' unless defined(&DIF_OP_BGU);
	eval 'sub DIF_OP_BGE () {22;}' unless defined(&DIF_OP_BGE);
	eval 'sub DIF_OP_BGEU () {23;}' unless defined(&DIF_OP_BGEU);
	eval 'sub DIF_OP_BL () {24;}' unless defined(&DIF_OP_BL);
	eval 'sub DIF_OP_BLU () {25;}' unless defined(&DIF_OP_BLU);
	eval 'sub DIF_OP_BLE () {26;}' unless defined(&DIF_OP_BLE);
	eval 'sub DIF_OP_BLEU () {27;}' unless defined(&DIF_OP_BLEU);
	eval 'sub DIF_OP_LDSB () {28;}' unless defined(&DIF_OP_LDSB);
	eval 'sub DIF_OP_LDSH () {29;}' unless defined(&DIF_OP_LDSH);
	eval 'sub DIF_OP_LDSW () {30;}' unless defined(&DIF_OP_LDSW);
	eval 'sub DIF_OP_LDUB () {31;}' unless defined(&DIF_OP_LDUB);
	eval 'sub DIF_OP_LDUH () {32;}' unless defined(&DIF_OP_LDUH);
	eval 'sub DIF_OP_LDUW () {33;}' unless defined(&DIF_OP_LDUW);
	eval 'sub DIF_OP_LDX () {34;}' unless defined(&DIF_OP_LDX);
	eval 'sub DIF_OP_RET () {35;}' unless defined(&DIF_OP_RET);
	eval 'sub DIF_OP_NOP () {36;}' unless defined(&DIF_OP_NOP);
	eval 'sub DIF_OP_SETX () {37;}' unless defined(&DIF_OP_SETX);
	eval 'sub DIF_OP_SETS () {38;}' unless defined(&DIF_OP_SETS);
	eval 'sub DIF_OP_SCMP () {39;}' unless defined(&DIF_OP_SCMP);
	eval 'sub DIF_OP_LDGA () {40;}' unless defined(&DIF_OP_LDGA);
	eval 'sub DIF_OP_LDGS () {41;}' unless defined(&DIF_OP_LDGS);
	eval 'sub DIF_OP_STGS () {42;}' unless defined(&DIF_OP_STGS);
	eval 'sub DIF_OP_LDTA () {43;}' unless defined(&DIF_OP_LDTA);
	eval 'sub DIF_OP_LDTS () {44;}' unless defined(&DIF_OP_LDTS);
	eval 'sub DIF_OP_STTS () {45;}' unless defined(&DIF_OP_STTS);
	eval 'sub DIF_OP_SRA () {46;}' unless defined(&DIF_OP_SRA);
	eval 'sub DIF_OP_CALL () {47;}' unless defined(&DIF_OP_CALL);
	eval 'sub DIF_OP_PUSHTR () {48;}' unless defined(&DIF_OP_PUSHTR);
	eval 'sub DIF_OP_PUSHTV () {49;}' unless defined(&DIF_OP_PUSHTV);
	eval 'sub DIF_OP_POPTS () {50;}' unless defined(&DIF_OP_POPTS);
	eval 'sub DIF_OP_FLUSHTS () {51;}' unless defined(&DIF_OP_FLUSHTS);
	eval 'sub DIF_OP_LDGAA () {52;}' unless defined(&DIF_OP_LDGAA);
	eval 'sub DIF_OP_LDTAA () {53;}' unless defined(&DIF_OP_LDTAA);
	eval 'sub DIF_OP_STGAA () {54;}' unless defined(&DIF_OP_STGAA);
	eval 'sub DIF_OP_STTAA () {55;}' unless defined(&DIF_OP_STTAA);
	eval 'sub DIF_OP_LDLS () {56;}' unless defined(&DIF_OP_LDLS);
	eval 'sub DIF_OP_STLS () {57;}' unless defined(&DIF_OP_STLS);
	eval 'sub DIF_OP_ALLOCS () {58;}' unless defined(&DIF_OP_ALLOCS);
	eval 'sub DIF_OP_COPYS () {59;}' unless defined(&DIF_OP_COPYS);
	eval 'sub DIF_OP_STB () {60;}' unless defined(&DIF_OP_STB);
	eval 'sub DIF_OP_STH () {61;}' unless defined(&DIF_OP_STH);
	eval 'sub DIF_OP_STW () {62;}' unless defined(&DIF_OP_STW);
	eval 'sub DIF_OP_STX () {63;}' unless defined(&DIF_OP_STX);
	eval 'sub DIF_OP_ULDSB () {64;}' unless defined(&DIF_OP_ULDSB);
	eval 'sub DIF_OP_ULDSH () {65;}' unless defined(&DIF_OP_ULDSH);
	eval 'sub DIF_OP_ULDSW () {66;}' unless defined(&DIF_OP_ULDSW);
	eval 'sub DIF_OP_ULDUB () {67;}' unless defined(&DIF_OP_ULDUB);
	eval 'sub DIF_OP_ULDUH () {68;}' unless defined(&DIF_OP_ULDUH);
	eval 'sub DIF_OP_ULDUW () {69;}' unless defined(&DIF_OP_ULDUW);
	eval 'sub DIF_OP_ULDX () {70;}' unless defined(&DIF_OP_ULDX);
	eval 'sub DIF_OP_RLDSB () {71;}' unless defined(&DIF_OP_RLDSB);
	eval 'sub DIF_OP_RLDSH () {72;}' unless defined(&DIF_OP_RLDSH);
	eval 'sub DIF_OP_RLDSW () {73;}' unless defined(&DIF_OP_RLDSW);
	eval 'sub DIF_OP_RLDUB () {74;}' unless defined(&DIF_OP_RLDUB);
	eval 'sub DIF_OP_RLDUH () {75;}' unless defined(&DIF_OP_RLDUH);
	eval 'sub DIF_OP_RLDUW () {76;}' unless defined(&DIF_OP_RLDUW);
	eval 'sub DIF_OP_RLDX () {77;}' unless defined(&DIF_OP_RLDX);
	eval 'sub DIF_OP_XLATE () {78;}' unless defined(&DIF_OP_XLATE);
	eval 'sub DIF_OP_XLARG () {79;}' unless defined(&DIF_OP_XLARG);
	eval 'sub DIF_INTOFF_MAX () {0xffff;}' unless defined(&DIF_INTOFF_MAX);
	eval 'sub DIF_STROFF_MAX () {0xffff;}' unless defined(&DIF_STROFF_MAX);
	eval 'sub DIF_REGISTER_MAX () {0xff;}' unless defined(&DIF_REGISTER_MAX);
	eval 'sub DIF_VARIABLE_MAX () {0xffff;}' unless defined(&DIF_VARIABLE_MAX);
	eval 'sub DIF_SUBROUTINE_MAX () {0xffff;}' unless defined(&DIF_SUBROUTINE_MAX);
	eval 'sub DIF_VAR_ARRAY_MIN () {0x;}' unless defined(&DIF_VAR_ARRAY_MIN);
	eval 'sub DIF_VAR_ARRAY_UBASE () {0x80;}' unless defined(&DIF_VAR_ARRAY_UBASE);
	eval 'sub DIF_VAR_ARRAY_MAX () {0xff;}' unless defined(&DIF_VAR_ARRAY_MAX);
	eval 'sub DIF_VAR_OTHER_MIN () {0x100;}' unless defined(&DIF_VAR_OTHER_MIN);
	eval 'sub DIF_VAR_OTHER_UBASE () {0x500;}' unless defined(&DIF_VAR_OTHER_UBASE);
	eval 'sub DIF_VAR_OTHER_MAX () {0xffff;}' unless defined(&DIF_VAR_OTHER_MAX);
	eval 'sub DIF_VAR_ARGS () {0x;}' unless defined(&DIF_VAR_ARGS);
	eval 'sub DIF_VAR_REGS () {0x1;}' unless defined(&DIF_VAR_REGS);
	eval 'sub DIF_VAR_UREGS () {0x2;}' unless defined(&DIF_VAR_UREGS);
	eval 'sub DIF_VAR_CURTHREAD () {0x100;}' unless defined(&DIF_VAR_CURTHREAD);
	eval 'sub DIF_VAR_TIMESTAMP () {0x101;}' unless defined(&DIF_VAR_TIMESTAMP);
	eval 'sub DIF_VAR_VTIMESTAMP () {0x102;}' unless defined(&DIF_VAR_VTIMESTAMP);
	eval 'sub DIF_VAR_IPL () {0x103;}' unless defined(&DIF_VAR_IPL);
	eval 'sub DIF_VAR_EPID () {0x104;}' unless defined(&DIF_VAR_EPID);
	eval 'sub DIF_VAR_ID () {0x105;}' unless defined(&DIF_VAR_ID);
	eval 'sub DIF_VAR_ARG0 () {0x106;}' unless defined(&DIF_VAR_ARG0);
	eval 'sub DIF_VAR_ARG1 () {0x107;}' unless defined(&DIF_VAR_ARG1);
	eval 'sub DIF_VAR_ARG2 () {0x108;}' unless defined(&DIF_VAR_ARG2);
	eval 'sub DIF_VAR_ARG3 () {0x109;}' unless defined(&DIF_VAR_ARG3);
	eval 'sub DIF_VAR_ARG4 () {0x10a;}' unless defined(&DIF_VAR_ARG4);
	eval 'sub DIF_VAR_ARG5 () {0x10b;}' unless defined(&DIF_VAR_ARG5);
	eval 'sub DIF_VAR_ARG6 () {0x10c;}' unless defined(&DIF_VAR_ARG6);
	eval 'sub DIF_VAR_ARG7 () {0x10d;}' unless defined(&DIF_VAR_ARG7);
	eval 'sub DIF_VAR_ARG8 () {0x10e;}' unless defined(&DIF_VAR_ARG8);
	eval 'sub DIF_VAR_ARG9 () {0x10f;}' unless defined(&DIF_VAR_ARG9);
	eval 'sub DIF_VAR_STACKDEPTH () {0x110;}' unless defined(&DIF_VAR_STACKDEPTH);
	eval 'sub DIF_VAR_CALLER () {0x111;}' unless defined(&DIF_VAR_CALLER);
	eval 'sub DIF_VAR_PROBEPROV () {0x112;}' unless defined(&DIF_VAR_PROBEPROV);
	eval 'sub DIF_VAR_PROBEMOD () {0x113;}' unless defined(&DIF_VAR_PROBEMOD);
	eval 'sub DIF_VAR_PROBEFUNC () {0x114;}' unless defined(&DIF_VAR_PROBEFUNC);
	eval 'sub DIF_VAR_PROBENAME () {0x115;}' unless defined(&DIF_VAR_PROBENAME);
	eval 'sub DIF_VAR_PID () {0x116;}' unless defined(&DIF_VAR_PID);
	eval 'sub DIF_VAR_TID () {0x117;}' unless defined(&DIF_VAR_TID);
	eval 'sub DIF_VAR_EXECNAME () {0x118;}' unless defined(&DIF_VAR_EXECNAME);
	eval 'sub DIF_VAR_ZONENAME () {0x119;}' unless defined(&DIF_VAR_ZONENAME);
	eval 'sub DIF_VAR_WALLTIMESTAMP () {0x11a;}' unless defined(&DIF_VAR_WALLTIMESTAMP);
	eval 'sub DIF_VAR_USTACKDEPTH () {0x11b;}' unless defined(&DIF_VAR_USTACKDEPTH);
	eval 'sub DIF_VAR_UCALLER () {0x11c;}' unless defined(&DIF_VAR_UCALLER);
	eval 'sub DIF_VAR_PPID () {0x11d;}' unless defined(&DIF_VAR_PPID);
	eval 'sub DIF_VAR_UID () {0x11e;}' unless defined(&DIF_VAR_UID);
	eval 'sub DIF_VAR_GID () {0x11f;}' unless defined(&DIF_VAR_GID);
	eval 'sub DIF_VAR_ERRNO () {0x120;}' unless defined(&DIF_VAR_ERRNO);
	eval 'sub DIF_VAR_EXECARGS () {0x121;}' unless defined(&DIF_VAR_EXECARGS);
	eval 'sub DIF_VAR_JID () {0x122;}' unless defined(&DIF_VAR_JID);
	eval 'sub DIF_VAR_JAILNAME () {0x123;}' unless defined(&DIF_VAR_JAILNAME);
	unless(defined(&illumos)) {
	    eval 'sub DIF_VAR_CPU () {0x200;}' unless defined(&DIF_VAR_CPU);
	}
	eval 'sub DIF_SUBR_RAND () {0;}' unless defined(&DIF_SUBR_RAND);
	eval 'sub DIF_SUBR_MUTEX_OWNED () {1;}' unless defined(&DIF_SUBR_MUTEX_OWNED);
	eval 'sub DIF_SUBR_MUTEX_OWNER () {2;}' unless defined(&DIF_SUBR_MUTEX_OWNER);
	eval 'sub DIF_SUBR_MUTEX_TYPE_ADAPTIVE () {3;}' unless defined(&DIF_SUBR_MUTEX_TYPE_ADAPTIVE);
	eval 'sub DIF_SUBR_MUTEX_TYPE_SPIN () {4;}' unless defined(&DIF_SUBR_MUTEX_TYPE_SPIN);
	eval 'sub DIF_SUBR_RW_READ_HELD () {5;}' unless defined(&DIF_SUBR_RW_READ_HELD);
	eval 'sub DIF_SUBR_RW_WRITE_HELD () {6;}' unless defined(&DIF_SUBR_RW_WRITE_HELD);
	eval 'sub DIF_SUBR_RW_ISWRITER () {7;}' unless defined(&DIF_SUBR_RW_ISWRITER);
	eval 'sub DIF_SUBR_COPYIN () {8;}' unless defined(&DIF_SUBR_COPYIN);
	eval 'sub DIF_SUBR_COPYINSTR () {9;}' unless defined(&DIF_SUBR_COPYINSTR);
	eval 'sub DIF_SUBR_SPECULATION () {10;}' unless defined(&DIF_SUBR_SPECULATION);
	eval 'sub DIF_SUBR_PROGENYOF () {11;}' unless defined(&DIF_SUBR_PROGENYOF);
	eval 'sub DIF_SUBR_STRLEN () {12;}' unless defined(&DIF_SUBR_STRLEN);
	eval 'sub DIF_SUBR_COPYOUT () {13;}' unless defined(&DIF_SUBR_COPYOUT);
	eval 'sub DIF_SUBR_COPYOUTSTR () {14;}' unless defined(&DIF_SUBR_COPYOUTSTR);
	eval 'sub DIF_SUBR_ALLOCA () {15;}' unless defined(&DIF_SUBR_ALLOCA);
	eval 'sub DIF_SUBR_BCOPY () {16;}' unless defined(&DIF_SUBR_BCOPY);
	eval 'sub DIF_SUBR_COPYINTO () {17;}' unless defined(&DIF_SUBR_COPYINTO);
	eval 'sub DIF_SUBR_MSGDSIZE () {18;}' unless defined(&DIF_SUBR_MSGDSIZE);
	eval 'sub DIF_SUBR_MSGSIZE () {19;}' unless defined(&DIF_SUBR_MSGSIZE);
	eval 'sub DIF_SUBR_GETMAJOR () {20;}' unless defined(&DIF_SUBR_GETMAJOR);
	eval 'sub DIF_SUBR_GETMINOR () {21;}' unless defined(&DIF_SUBR_GETMINOR);
	eval 'sub DIF_SUBR_DDI_PATHNAME () {22;}' unless defined(&DIF_SUBR_DDI_PATHNAME);
	eval 'sub DIF_SUBR_STRJOIN () {23;}' unless defined(&DIF_SUBR_STRJOIN);
	eval 'sub DIF_SUBR_LLTOSTR () {24;}' unless defined(&DIF_SUBR_LLTOSTR);
	eval 'sub DIF_SUBR_BASENAME () {25;}' unless defined(&DIF_SUBR_BASENAME);
	eval 'sub DIF_SUBR_DIRNAME () {26;}' unless defined(&DIF_SUBR_DIRNAME);
	eval 'sub DIF_SUBR_CLEANPATH () {27;}' unless defined(&DIF_SUBR_CLEANPATH);
	eval 'sub DIF_SUBR_STRCHR () {28;}' unless defined(&DIF_SUBR_STRCHR);
	eval 'sub DIF_SUBR_STRRCHR () {29;}' unless defined(&DIF_SUBR_STRRCHR);
	eval 'sub DIF_SUBR_STRSTR () {30;}' unless defined(&DIF_SUBR_STRSTR);
	eval 'sub DIF_SUBR_STRTOK () {31;}' unless defined(&DIF_SUBR_STRTOK);
	eval 'sub DIF_SUBR_SUBSTR () {32;}' unless defined(&DIF_SUBR_SUBSTR);
	eval 'sub DIF_SUBR_INDEX () {33;}' unless defined(&DIF_SUBR_INDEX);
	eval 'sub DIF_SUBR_RINDEX () {34;}' unless defined(&DIF_SUBR_RINDEX);
	eval 'sub DIF_SUBR_HTONS () {35;}' unless defined(&DIF_SUBR_HTONS);
	eval 'sub DIF_SUBR_HTONL () {36;}' unless defined(&DIF_SUBR_HTONL);
	eval 'sub DIF_SUBR_HTONLL () {37;}' unless defined(&DIF_SUBR_HTONLL);
	eval 'sub DIF_SUBR_NTOHS () {38;}' unless defined(&DIF_SUBR_NTOHS);
	eval 'sub DIF_SUBR_NTOHL () {39;}' unless defined(&DIF_SUBR_NTOHL);
	eval 'sub DIF_SUBR_NTOHLL () {40;}' unless defined(&DIF_SUBR_NTOHLL);
	eval 'sub DIF_SUBR_INET_NTOP () {41;}' unless defined(&DIF_SUBR_INET_NTOP);
	eval 'sub DIF_SUBR_INET_NTOA () {42;}' unless defined(&DIF_SUBR_INET_NTOA);
	eval 'sub DIF_SUBR_INET_NTOA6 () {43;}' unless defined(&DIF_SUBR_INET_NTOA6);
	eval 'sub DIF_SUBR_TOUPPER () {44;}' unless defined(&DIF_SUBR_TOUPPER);
	eval 'sub DIF_SUBR_TOLOWER () {45;}' unless defined(&DIF_SUBR_TOLOWER);
	eval 'sub DIF_SUBR_MEMREF () {46;}' unless defined(&DIF_SUBR_MEMREF);
	eval 'sub DIF_SUBR_SX_SHARED_HELD () {47;}' unless defined(&DIF_SUBR_SX_SHARED_HELD);
	eval 'sub DIF_SUBR_SX_EXCLUSIVE_HELD () {48;}' unless defined(&DIF_SUBR_SX_EXCLUSIVE_HELD);
	eval 'sub DIF_SUBR_SX_ISEXCLUSIVE () {49;}' unless defined(&DIF_SUBR_SX_ISEXCLUSIVE);
	eval 'sub DIF_SUBR_MEMSTR () {50;}' unless defined(&DIF_SUBR_MEMSTR);
	eval 'sub DIF_SUBR_GETF () {51;}' unless defined(&DIF_SUBR_GETF);
	eval 'sub DIF_SUBR_JSON () {52;}' unless defined(&DIF_SUBR_JSON);
	eval 'sub DIF_SUBR_STRTOLL () {53;}' unless defined(&DIF_SUBR_STRTOLL);
	eval 'sub DIF_SUBR_MAX () {53;}' unless defined(&DIF_SUBR_MAX);
	eval 'sub DIF_INSTR_OP {
	    my($i) = @_;
    	    eval q(((($i) >> 24) & 0xff));
	}' unless defined(&DIF_INSTR_OP);
	eval 'sub DIF_INSTR_R1 {
	    my($i) = @_;
    	    eval q(((($i) >> 16) & 0xff));
	}' unless defined(&DIF_INSTR_R1);
	eval 'sub DIF_INSTR_R2 {
	    my($i) = @_;
    	    eval q(((($i) >> 8) & 0xff));
	}' unless defined(&DIF_INSTR_R2);
	eval 'sub DIF_INSTR_RD {
	    my($i) = @_;
    	    eval q((($i) & 0xff));
	}' unless defined(&DIF_INSTR_RD);
	eval 'sub DIF_INSTR_RS {
	    my($i) = @_;
    	    eval q((($i) & 0xff));
	}' unless defined(&DIF_INSTR_RS);
	eval 'sub DIF_INSTR_LABEL {
	    my($i) = @_;
    	    eval q((($i) & 0xffffff));
	}' unless defined(&DIF_INSTR_LABEL);
	eval 'sub DIF_INSTR_VAR {
	    my($i) = @_;
    	    eval q(((($i) >> 8) & 0xffff));
	}' unless defined(&DIF_INSTR_VAR);
	eval 'sub DIF_INSTR_INTEGER {
	    my($i) = @_;
    	    eval q(((($i) >> 8) & 0xffff));
	}' unless defined(&DIF_INSTR_INTEGER);
	eval 'sub DIF_INSTR_STRING {
	    my($i) = @_;
    	    eval q(((($i) >> 8) & 0xffff));
	}' unless defined(&DIF_INSTR_STRING);
	eval 'sub DIF_INSTR_SUBR {
	    my($i) = @_;
    	    eval q(((($i) >> 8) & 0xffff));
	}' unless defined(&DIF_INSTR_SUBR);
	eval 'sub DIF_INSTR_TYPE {
	    my($i) = @_;
    	    eval q(((($i) >> 16) & 0xff));
	}' unless defined(&DIF_INSTR_TYPE);
	eval 'sub DIF_INSTR_XLREF {
	    my($i) = @_;
    	    eval q(((($i) >> 8) & 0xffff));
	}' unless defined(&DIF_INSTR_XLREF);
	eval 'sub DIF_INSTR_FMT {
	    my($op, $r1, $r2, $d) = @_;
    	    eval q(((($op) << 24) | (($r1) << 16) | (($r2) << 8) | ($d)));
	}' unless defined(&DIF_INSTR_FMT);
	eval 'sub DIF_INSTR_NOT {
	    my($r1, $d) = @_;
    	    eval q(( &DIF_INSTR_FMT( &DIF_OP_NOT, $r1, 0, $d)));
	}' unless defined(&DIF_INSTR_NOT);
	eval 'sub DIF_INSTR_MOV {
	    my($r1, $d) = @_;
    	    eval q(( &DIF_INSTR_FMT( &DIF_OP_MOV, $r1, 0, $d)));
	}' unless defined(&DIF_INSTR_MOV);
	eval 'sub DIF_INSTR_CMP {
	    my($op, $r1, $r2) = @_;
    	    eval q(( &DIF_INSTR_FMT($op, $r1, $r2, 0)));
	}' unless defined(&DIF_INSTR_CMP);
	eval 'sub DIF_INSTR_TST {
	    my($r1) = @_;
    	    eval q(( &DIF_INSTR_FMT( &DIF_OP_TST, $r1, 0, 0)));
	}' unless defined(&DIF_INSTR_TST);
	eval 'sub DIF_INSTR_BRANCH {
	    my($op, $label) = @_;
    	    eval q(((($op) << 24) | ($label)));
	}' unless defined(&DIF_INSTR_BRANCH);
	eval 'sub DIF_INSTR_LOAD {
	    my($op, $r1, $d) = @_;
    	    eval q(( &DIF_INSTR_FMT($op, $r1, 0, $d)));
	}' unless defined(&DIF_INSTR_LOAD);
	eval 'sub DIF_INSTR_STORE {
	    my($op, $r1, $d) = @_;
    	    eval q(( &DIF_INSTR_FMT($op, $r1, 0, $d)));
	}' unless defined(&DIF_INSTR_STORE);
	eval 'sub DIF_INSTR_SETX {
	    my($i, $d) = @_;
    	    eval q((( &DIF_OP_SETX << 24) | (($i) << 8) | ($d)));
	}' unless defined(&DIF_INSTR_SETX);
	eval 'sub DIF_INSTR_SETS {
	    my($s, $d) = @_;
    	    eval q((( &DIF_OP_SETS << 24) | (($s) << 8) | ($d)));
	}' unless defined(&DIF_INSTR_SETS);
	eval 'sub DIF_INSTR_RET {
	    my($d) = @_;
    	    eval q(( &DIF_INSTR_FMT( &DIF_OP_RET, 0, 0, $d)));
	}' unless defined(&DIF_INSTR_RET);
	eval 'sub DIF_INSTR_NOP () {( &DIF_OP_NOP << 24);}' unless defined(&DIF_INSTR_NOP);
	eval 'sub DIF_INSTR_LDA {
	    my($op, $v, $r, $d) = @_;
    	    eval q(( &DIF_INSTR_FMT($op, $v, $r, $d)));
	}' unless defined(&DIF_INSTR_LDA);
	eval 'sub DIF_INSTR_LDV {
	    my($op, $v, $d) = @_;
    	    eval q(((($op) << 24) | (($v) << 8) | ($d)));
	}' unless defined(&DIF_INSTR_LDV);
	eval 'sub DIF_INSTR_STV {
	    my($op, $v, $rs) = @_;
    	    eval q(((($op) << 24) | (($v) << 8) | ($rs)));
	}' unless defined(&DIF_INSTR_STV);
	eval 'sub DIF_INSTR_CALL {
	    my($s, $d) = @_;
    	    eval q((( &DIF_OP_CALL << 24) | (($s) << 8) | ($d)));
	}' unless defined(&DIF_INSTR_CALL);
	eval 'sub DIF_INSTR_PUSHTS {
	    my($op, $t, $r2, $rs) = @_;
    	    eval q(( &DIF_INSTR_FMT($op, $t, $r2, $rs)));
	}' unless defined(&DIF_INSTR_PUSHTS);
	eval 'sub DIF_INSTR_POPTS () {( &DIF_OP_POPTS << 24);}' unless defined(&DIF_INSTR_POPTS);
	eval 'sub DIF_INSTR_FLUSHTS () {( &DIF_OP_FLUSHTS << 24);}' unless defined(&DIF_INSTR_FLUSHTS);
	eval 'sub DIF_INSTR_ALLOCS {
	    my($r1, $d) = @_;
    	    eval q(( &DIF_INSTR_FMT( &DIF_OP_ALLOCS, $r1, 0, $d)));
	}' unless defined(&DIF_INSTR_ALLOCS);
	eval 'sub DIF_INSTR_COPYS {
	    my($r1, $r2, $d) = @_;
    	    eval q(( &DIF_INSTR_FMT( &DIF_OP_COPYS, $r1, $r2, $d)));
	}' unless defined(&DIF_INSTR_COPYS);
	eval 'sub DIF_INSTR_XLATE {
	    my($op, $r, $d) = @_;
    	    eval q(((($op) << 24) | (($r) << 8) | ($d)));
	}' unless defined(&DIF_INSTR_XLATE);
	eval 'sub DIF_REG_R0 () {0;}' unless defined(&DIF_REG_R0);
	eval 'sub DIF_TYPE_CTF () {0;}' unless defined(&DIF_TYPE_CTF);
	eval 'sub DIF_TYPE_STRING () {1;}' unless defined(&DIF_TYPE_STRING);
	eval 'sub DIF_TF_BYREF () {0x1;}' unless defined(&DIF_TF_BYREF);
	eval 'sub DIF_TF_BYUREF () {0x2;}' unless defined(&DIF_TF_BYUREF);
	eval 'sub DIFV_KIND_ARRAY () {0;}' unless defined(&DIFV_KIND_ARRAY);
	eval 'sub DIFV_KIND_SCALAR () {1;}' unless defined(&DIFV_KIND_SCALAR);
	eval 'sub DIFV_SCOPE_GLOBAL () {0;}' unless defined(&DIFV_SCOPE_GLOBAL);
	eval 'sub DIFV_SCOPE_THREAD () {1;}' unless defined(&DIFV_SCOPE_THREAD);
	eval 'sub DIFV_SCOPE_LOCAL () {2;}' unless defined(&DIFV_SCOPE_LOCAL);
	eval 'sub DIFV_F_REF () {0x1;}' unless defined(&DIFV_F_REF);
	eval 'sub DIFV_F_MOD () {0x2;}' unless defined(&DIFV_F_MOD);
	eval 'sub DTRACEACT_NONE () {0;}' unless defined(&DTRACEACT_NONE);
	eval 'sub DTRACEACT_DIFEXPR () {1;}' unless defined(&DTRACEACT_DIFEXPR);
	eval 'sub DTRACEACT_EXIT () {2;}' unless defined(&DTRACEACT_EXIT);
	eval 'sub DTRACEACT_PRINTF () {3;}' unless defined(&DTRACEACT_PRINTF);
	eval 'sub DTRACEACT_PRINTA () {4;}' unless defined(&DTRACEACT_PRINTA);
	eval 'sub DTRACEACT_LIBACT () {5;}' unless defined(&DTRACEACT_LIBACT);
	eval 'sub DTRACEACT_TRACEMEM () {6;}' unless defined(&DTRACEACT_TRACEMEM);
	eval 'sub DTRACEACT_TRACEMEM_DYNSIZE () {7;}' unless defined(&DTRACEACT_TRACEMEM_DYNSIZE);
	eval 'sub DTRACEACT_PRINTM () {8;}' unless defined(&DTRACEACT_PRINTM);
	eval 'sub DTRACEACT_PROC () {0x100;}' unless defined(&DTRACEACT_PROC);
	eval 'sub DTRACEACT_USTACK () {( &DTRACEACT_PROC + 1);}' unless defined(&DTRACEACT_USTACK);
	eval 'sub DTRACEACT_JSTACK () {( &DTRACEACT_PROC + 2);}' unless defined(&DTRACEACT_JSTACK);
	eval 'sub DTRACEACT_USYM () {( &DTRACEACT_PROC + 3);}' unless defined(&DTRACEACT_USYM);
	eval 'sub DTRACEACT_UMOD () {( &DTRACEACT_PROC + 4);}' unless defined(&DTRACEACT_UMOD);
	eval 'sub DTRACEACT_UADDR () {( &DTRACEACT_PROC + 5);}' unless defined(&DTRACEACT_UADDR);
	eval 'sub DTRACEACT_PROC_DESTRUCTIVE () {0x200;}' unless defined(&DTRACEACT_PROC_DESTRUCTIVE);
	eval 'sub DTRACEACT_STOP () {( &DTRACEACT_PROC_DESTRUCTIVE + 1);}' unless defined(&DTRACEACT_STOP);
	eval 'sub DTRACEACT_RAISE () {( &DTRACEACT_PROC_DESTRUCTIVE + 2);}' unless defined(&DTRACEACT_RAISE);
	eval 'sub DTRACEACT_SYSTEM () {( &DTRACEACT_PROC_DESTRUCTIVE + 3);}' unless defined(&DTRACEACT_SYSTEM);
	eval 'sub DTRACEACT_FREOPEN () {( &DTRACEACT_PROC_DESTRUCTIVE + 4);}' unless defined(&DTRACEACT_FREOPEN);
	eval 'sub DTRACEACT_PROC_CONTROL () {0x300;}' unless defined(&DTRACEACT_PROC_CONTROL);
	eval 'sub DTRACEACT_KERNEL () {0x400;}' unless defined(&DTRACEACT_KERNEL);
	eval 'sub DTRACEACT_STACK () {( &DTRACEACT_KERNEL + 1);}' unless defined(&DTRACEACT_STACK);
	eval 'sub DTRACEACT_SYM () {( &DTRACEACT_KERNEL + 2);}' unless defined(&DTRACEACT_SYM);
	eval 'sub DTRACEACT_MOD () {( &DTRACEACT_KERNEL + 3);}' unless defined(&DTRACEACT_MOD);
	eval 'sub DTRACEACT_KERNEL_DESTRUCTIVE () {0x500;}' unless defined(&DTRACEACT_KERNEL_DESTRUCTIVE);
	eval 'sub DTRACEACT_BREAKPOINT () {( &DTRACEACT_KERNEL_DESTRUCTIVE + 1);}' unless defined(&DTRACEACT_BREAKPOINT);
	eval 'sub DTRACEACT_PANIC () {( &DTRACEACT_KERNEL_DESTRUCTIVE + 2);}' unless defined(&DTRACEACT_PANIC);
	eval 'sub DTRACEACT_CHILL () {( &DTRACEACT_KERNEL_DESTRUCTIVE + 3);}' unless defined(&DTRACEACT_CHILL);
	eval 'sub DTRACEACT_SPECULATIVE () {0x600;}' unless defined(&DTRACEACT_SPECULATIVE);
	eval 'sub DTRACEACT_SPECULATE () {( &DTRACEACT_SPECULATIVE + 1);}' unless defined(&DTRACEACT_SPECULATE);
	eval 'sub DTRACEACT_COMMIT () {( &DTRACEACT_SPECULATIVE + 2);}' unless defined(&DTRACEACT_COMMIT);
	eval 'sub DTRACEACT_DISCARD () {( &DTRACEACT_SPECULATIVE + 3);}' unless defined(&DTRACEACT_DISCARD);
	eval 'sub DTRACEACT_CLASS {
	    my($x) = @_;
    	    eval q((($x) & 0xff00));
	}' unless defined(&DTRACEACT_CLASS);
	eval 'sub DTRACEACT_ISDESTRUCTIVE {
	    my($x) = @_;
    	    eval q(( &DTRACEACT_CLASS($x) ==  &DTRACEACT_PROC_DESTRUCTIVE ||  &DTRACEACT_CLASS($x) ==  &DTRACEACT_KERNEL_DESTRUCTIVE));
	}' unless defined(&DTRACEACT_ISDESTRUCTIVE);
	eval 'sub DTRACEACT_ISSPECULATIVE {
	    my($x) = @_;
    	    eval q(( &DTRACEACT_CLASS($x) ==  &DTRACEACT_SPECULATIVE));
	}' unless defined(&DTRACEACT_ISSPECULATIVE);
	eval 'sub DTRACEACT_ISPRINTFLIKE {
	    my($x) = @_;
    	    eval q((($x) ==  &DTRACEACT_PRINTF || ($x) ==  &DTRACEACT_PRINTA || ($x) ==  &DTRACEACT_SYSTEM || ($x) ==  &DTRACEACT_FREOPEN));
	}' unless defined(&DTRACEACT_ISPRINTFLIKE);
	eval 'sub DTRACEACT_AGGREGATION () {0x700;}' unless defined(&DTRACEACT_AGGREGATION);
	eval 'sub DTRACEAGG_COUNT () {( &DTRACEACT_AGGREGATION + 1);}' unless defined(&DTRACEAGG_COUNT);
	eval 'sub DTRACEAGG_MIN () {( &DTRACEACT_AGGREGATION + 2);}' unless defined(&DTRACEAGG_MIN);
	eval 'sub DTRACEAGG_MAX () {( &DTRACEACT_AGGREGATION + 3);}' unless defined(&DTRACEAGG_MAX);
	eval 'sub DTRACEAGG_AVG () {( &DTRACEACT_AGGREGATION + 4);}' unless defined(&DTRACEAGG_AVG);
	eval 'sub DTRACEAGG_SUM () {( &DTRACEACT_AGGREGATION + 5);}' unless defined(&DTRACEAGG_SUM);
	eval 'sub DTRACEAGG_STDDEV () {( &DTRACEACT_AGGREGATION + 6);}' unless defined(&DTRACEAGG_STDDEV);
	eval 'sub DTRACEAGG_QUANTIZE () {( &DTRACEACT_AGGREGATION + 7);}' unless defined(&DTRACEAGG_QUANTIZE);
	eval 'sub DTRACEAGG_LQUANTIZE () {( &DTRACEACT_AGGREGATION + 8);}' unless defined(&DTRACEAGG_LQUANTIZE);
	eval 'sub DTRACEAGG_LLQUANTIZE () {( &DTRACEACT_AGGREGATION + 9);}' unless defined(&DTRACEAGG_LLQUANTIZE);
	eval 'sub DTRACEACT_ISAGG {
	    my($x) = @_;
    	    eval q(( &DTRACEACT_CLASS($x) ==  &DTRACEACT_AGGREGATION));
	}' unless defined(&DTRACEACT_ISAGG);
	eval 'sub DTRACE_QUANTIZE_NBUCKETS () {((($sizeof{ &uint64_t} *  &NBBY) - 1) * 2+ 1);}' unless defined(&DTRACE_QUANTIZE_NBUCKETS);
	eval 'sub DTRACE_QUANTIZE_ZEROBUCKET () {(($sizeof{ &uint64_t} *  &NBBY) - 1);}' unless defined(&DTRACE_QUANTIZE_ZEROBUCKET);
	eval 'sub DTRACE_QUANTIZE_BUCKETVAL {
	    my($buck) = @_;
    	    eval q(( &int64_t)(($buck) <  &DTRACE_QUANTIZE_ZEROBUCKET ? -(1 << ( &DTRACE_QUANTIZE_ZEROBUCKET - 1- ($buck))) : ($buck) ==  &DTRACE_QUANTIZE_ZEROBUCKET ? 0: 1 << (($buck) -  &DTRACE_QUANTIZE_ZEROBUCKET - 1)));
	}' unless defined(&DTRACE_QUANTIZE_BUCKETVAL);
	eval 'sub DTRACE_LQUANTIZE_STEPSHIFT () {48;}' unless defined(&DTRACE_LQUANTIZE_STEPSHIFT);
	eval 'sub DTRACE_LQUANTIZE_STEPMASK () {(( &uint64_t) &UINT16_MAX << 48);}' unless defined(&DTRACE_LQUANTIZE_STEPMASK);
	eval 'sub DTRACE_LQUANTIZE_LEVELSHIFT () {32;}' unless defined(&DTRACE_LQUANTIZE_LEVELSHIFT);
	eval 'sub DTRACE_LQUANTIZE_LEVELMASK () {(( &uint64_t) &UINT16_MAX << 32);}' unless defined(&DTRACE_LQUANTIZE_LEVELMASK);
	eval 'sub DTRACE_LQUANTIZE_BASESHIFT () {0;}' unless defined(&DTRACE_LQUANTIZE_BASESHIFT);
	eval 'sub DTRACE_LQUANTIZE_BASEMASK () { &UINT32_MAX;}' unless defined(&DTRACE_LQUANTIZE_BASEMASK);
	eval 'sub DTRACE_LQUANTIZE_STEP {
	    my($x) = @_;
    	    eval q(( &uint16_t)((($x) &  &DTRACE_LQUANTIZE_STEPMASK) >>  &DTRACE_LQUANTIZE_STEPSHIFT));
	}' unless defined(&DTRACE_LQUANTIZE_STEP);
	eval 'sub DTRACE_LQUANTIZE_LEVELS {
	    my($x) = @_;
    	    eval q(( &uint16_t)((($x) &  &DTRACE_LQUANTIZE_LEVELMASK) >>  &DTRACE_LQUANTIZE_LEVELSHIFT));
	}' unless defined(&DTRACE_LQUANTIZE_LEVELS);
	eval 'sub DTRACE_LQUANTIZE_BASE {
	    my($x) = @_;
    	    eval q(( &int32_t)((($x) &  &DTRACE_LQUANTIZE_BASEMASK) >>  &DTRACE_LQUANTIZE_BASESHIFT));
	}' unless defined(&DTRACE_LQUANTIZE_BASE);
	eval 'sub DTRACE_LLQUANTIZE_FACTORSHIFT () {48;}' unless defined(&DTRACE_LLQUANTIZE_FACTORSHIFT);
	eval 'sub DTRACE_LLQUANTIZE_FACTORMASK () {(( &uint64_t) &UINT16_MAX << 48);}' unless defined(&DTRACE_LLQUANTIZE_FACTORMASK);
	eval 'sub DTRACE_LLQUANTIZE_LOWSHIFT () {32;}' unless defined(&DTRACE_LLQUANTIZE_LOWSHIFT);
	eval 'sub DTRACE_LLQUANTIZE_LOWMASK () {(( &uint64_t) &UINT16_MAX << 32);}' unless defined(&DTRACE_LLQUANTIZE_LOWMASK);
	eval 'sub DTRACE_LLQUANTIZE_HIGHSHIFT () {16;}' unless defined(&DTRACE_LLQUANTIZE_HIGHSHIFT);
	eval 'sub DTRACE_LLQUANTIZE_HIGHMASK () {(( &uint64_t) &UINT16_MAX << 16);}' unless defined(&DTRACE_LLQUANTIZE_HIGHMASK);
	eval 'sub DTRACE_LLQUANTIZE_NSTEPSHIFT () {0;}' unless defined(&DTRACE_LLQUANTIZE_NSTEPSHIFT);
	eval 'sub DTRACE_LLQUANTIZE_NSTEPMASK () { &UINT16_MAX;}' unless defined(&DTRACE_LLQUANTIZE_NSTEPMASK);
	eval 'sub DTRACE_LLQUANTIZE_FACTOR {
	    my($x) = @_;
    	    eval q(( &uint16_t)((($x) &  &DTRACE_LLQUANTIZE_FACTORMASK) >>  &DTRACE_LLQUANTIZE_FACTORSHIFT));
	}' unless defined(&DTRACE_LLQUANTIZE_FACTOR);
	eval 'sub DTRACE_LLQUANTIZE_LOW {
	    my($x) = @_;
    	    eval q(( &uint16_t)((($x) &  &DTRACE_LLQUANTIZE_LOWMASK) >>  &DTRACE_LLQUANTIZE_LOWSHIFT));
	}' unless defined(&DTRACE_LLQUANTIZE_LOW);
	eval 'sub DTRACE_LLQUANTIZE_HIGH {
	    my($x) = @_;
    	    eval q(( &uint16_t)((($x) &  &DTRACE_LLQUANTIZE_HIGHMASK) >>  &DTRACE_LLQUANTIZE_HIGHSHIFT));
	}' unless defined(&DTRACE_LLQUANTIZE_HIGH);
	eval 'sub DTRACE_LLQUANTIZE_NSTEP {
	    my($x) = @_;
    	    eval q(( &uint16_t)((($x) &  &DTRACE_LLQUANTIZE_NSTEPMASK) >>  &DTRACE_LLQUANTIZE_NSTEPSHIFT));
	}' unless defined(&DTRACE_LLQUANTIZE_NSTEP);
	eval 'sub DTRACE_USTACK_NFRAMES {
	    my($x) = @_;
    	    eval q(( &uint32_t)(($x) &  &UINT32_MAX));
	}' unless defined(&DTRACE_USTACK_NFRAMES);
	eval 'sub DTRACE_USTACK_STRSIZE {
	    my($x) = @_;
    	    eval q(( &uint32_t)(($x) >> 32));
	}' unless defined(&DTRACE_USTACK_STRSIZE);
	eval 'sub DTRACE_USTACK_ARG {
	    my($x, $y) = @_;
    	    eval q((((( &uint64_t)($y)) << 32) | (($x) &  &UINT32_MAX)));
	}' unless defined(&DTRACE_USTACK_ARG);
	unless(defined(&_LP64)) {
	    if((defined(&BYTE_ORDER) ? &BYTE_ORDER : undef) == (defined(&_BIG_ENDIAN) ? &_BIG_ENDIAN : undef)) {
		eval 'sub DTRACE_PTR {
		    my($type, $name) = @_;
    		    eval q( &uint32_t $name &pad; $type *$name);
		}' unless defined(&DTRACE_PTR);
	    } else {
		eval 'sub DTRACE_PTR {
		    my($type, $name) = @_;
    		    eval q($type *$name;  &uint32_t $name &pad);
		}' unless defined(&DTRACE_PTR);
	    }
	} else {
	    eval 'sub DTRACE_PTR {
	        my($type, $name) = @_;
    		eval q($type *$name);
	    }' unless defined(&DTRACE_PTR);
	}
	eval 'sub DOF_ID_SIZE () {16;}' unless defined(&DOF_ID_SIZE);
	eval 'sub DOF_ID_MAG0 () {0;}' unless defined(&DOF_ID_MAG0);
	eval 'sub DOF_ID_MAG1 () {1;}' unless defined(&DOF_ID_MAG1);
	eval 'sub DOF_ID_MAG2 () {2;}' unless defined(&DOF_ID_MAG2);
	eval 'sub DOF_ID_MAG3 () {3;}' unless defined(&DOF_ID_MAG3);
	eval 'sub DOF_ID_MODEL () {4;}' unless defined(&DOF_ID_MODEL);
	eval 'sub DOF_ID_ENCODING () {5;}' unless defined(&DOF_ID_ENCODING);
	eval 'sub DOF_ID_VERSION () {6;}' unless defined(&DOF_ID_VERSION);
	eval 'sub DOF_ID_DIFVERS () {7;}' unless defined(&DOF_ID_DIFVERS);
	eval 'sub DOF_ID_DIFIREG () {8;}' unless defined(&DOF_ID_DIFIREG);
	eval 'sub DOF_ID_DIFTREG () {9;}' unless defined(&DOF_ID_DIFTREG);
	eval 'sub DOF_ID_PAD () {10;}' unless defined(&DOF_ID_PAD);
	eval 'sub DOF_MAG_MAG0 () {0x7f;}' unless defined(&DOF_MAG_MAG0);
	eval 'sub DOF_MAG_MAG1 () {ord(\'D\');}' unless defined(&DOF_MAG_MAG1);
	eval 'sub DOF_MAG_MAG2 () {ord(\'O\');}' unless defined(&DOF_MAG_MAG2);
	eval 'sub DOF_MAG_MAG3 () {ord(\'F\');}' unless defined(&DOF_MAG_MAG3);
	eval 'sub DOF_MAG_STRING () {"\\177DOF";}' unless defined(&DOF_MAG_STRING);
	eval 'sub DOF_MAG_STRLEN () {4;}' unless defined(&DOF_MAG_STRLEN);
	eval 'sub DOF_MODEL_NONE () {0;}' unless defined(&DOF_MODEL_NONE);
	eval 'sub DOF_MODEL_ILP32 () {1;}' unless defined(&DOF_MODEL_ILP32);
	eval 'sub DOF_MODEL_LP64 () {2;}' unless defined(&DOF_MODEL_LP64);
	if(defined(&_LP64)) {
	    eval 'sub DOF_MODEL_NATIVE () { &DOF_MODEL_LP64;}' unless defined(&DOF_MODEL_NATIVE);
	} else {
	    eval 'sub DOF_MODEL_NATIVE () { &DOF_MODEL_ILP32;}' unless defined(&DOF_MODEL_NATIVE);
	}
	eval 'sub DOF_ENCODE_NONE () {0;}' unless defined(&DOF_ENCODE_NONE);
	eval 'sub DOF_ENCODE_LSB () {1;}' unless defined(&DOF_ENCODE_LSB);
	eval 'sub DOF_ENCODE_MSB () {2;}' unless defined(&DOF_ENCODE_MSB);
	if((defined(&BYTE_ORDER) ? &BYTE_ORDER : undef) == (defined(&_BIG_ENDIAN) ? &_BIG_ENDIAN : undef)) {
	    eval 'sub DOF_ENCODE_NATIVE () { &DOF_ENCODE_MSB;}' unless defined(&DOF_ENCODE_NATIVE);
	} else {
	    eval 'sub DOF_ENCODE_NATIVE () { &DOF_ENCODE_LSB;}' unless defined(&DOF_ENCODE_NATIVE);
	}
	eval 'sub DOF_VERSION_1 () {1;}' unless defined(&DOF_VERSION_1);
	eval 'sub DOF_VERSION_2 () {2;}' unless defined(&DOF_VERSION_2);
	eval 'sub DOF_VERSION () { &DOF_VERSION_2;}' unless defined(&DOF_VERSION);
	eval 'sub DOF_FL_VALID () {0;}' unless defined(&DOF_FL_VALID);
	eval 'sub DOF_SECIDX_NONE () {(-1);}' unless defined(&DOF_SECIDX_NONE);
	eval 'sub DOF_STRIDX_NONE () {(-1);}' unless defined(&DOF_STRIDX_NONE);
	eval 'sub DOF_SECT_NONE () {0;}' unless defined(&DOF_SECT_NONE);
	eval 'sub DOF_SECT_COMMENTS () {1;}' unless defined(&DOF_SECT_COMMENTS);
	eval 'sub DOF_SECT_SOURCE () {2;}' unless defined(&DOF_SECT_SOURCE);
	eval 'sub DOF_SECT_ECBDESC () {3;}' unless defined(&DOF_SECT_ECBDESC);
	eval 'sub DOF_SECT_PROBEDESC () {4;}' unless defined(&DOF_SECT_PROBEDESC);
	eval 'sub DOF_SECT_ACTDESC () {5;}' unless defined(&DOF_SECT_ACTDESC);
	eval 'sub DOF_SECT_DIFOHDR () {6;}' unless defined(&DOF_SECT_DIFOHDR);
	eval 'sub DOF_SECT_DIF () {7;}' unless defined(&DOF_SECT_DIF);
	eval 'sub DOF_SECT_STRTAB () {8;}' unless defined(&DOF_SECT_STRTAB);
	eval 'sub DOF_SECT_VARTAB () {9;}' unless defined(&DOF_SECT_VARTAB);
	eval 'sub DOF_SECT_RELTAB () {10;}' unless defined(&DOF_SECT_RELTAB);
	eval 'sub DOF_SECT_TYPTAB () {11;}' unless defined(&DOF_SECT_TYPTAB);
	eval 'sub DOF_SECT_URELHDR () {12;}' unless defined(&DOF_SECT_URELHDR);
	eval 'sub DOF_SECT_KRELHDR () {13;}' unless defined(&DOF_SECT_KRELHDR);
	eval 'sub DOF_SECT_OPTDESC () {14;}' unless defined(&DOF_SECT_OPTDESC);
	eval 'sub DOF_SECT_PROVIDER () {15;}' unless defined(&DOF_SECT_PROVIDER);
	eval 'sub DOF_SECT_PROBES () {16;}' unless defined(&DOF_SECT_PROBES);
	eval 'sub DOF_SECT_PRARGS () {17;}' unless defined(&DOF_SECT_PRARGS);
	eval 'sub DOF_SECT_PROFFS () {18;}' unless defined(&DOF_SECT_PROFFS);
	eval 'sub DOF_SECT_INTTAB () {19;}' unless defined(&DOF_SECT_INTTAB);
	eval 'sub DOF_SECT_UTSNAME () {20;}' unless defined(&DOF_SECT_UTSNAME);
	eval 'sub DOF_SECT_XLTAB () {21;}' unless defined(&DOF_SECT_XLTAB);
	eval 'sub DOF_SECT_XLMEMBERS () {22;}' unless defined(&DOF_SECT_XLMEMBERS);
	eval 'sub DOF_SECT_XLIMPORT () {23;}' unless defined(&DOF_SECT_XLIMPORT);
	eval 'sub DOF_SECT_XLEXPORT () {24;}' unless defined(&DOF_SECT_XLEXPORT);
	eval 'sub DOF_SECT_PREXPORT () {25;}' unless defined(&DOF_SECT_PREXPORT);
	eval 'sub DOF_SECT_PRENOFFS () {26;}' unless defined(&DOF_SECT_PRENOFFS);
	eval 'sub DOF_SECF_LOAD () {1;}' unless defined(&DOF_SECF_LOAD);
	eval 'sub DOF_SEC_ISLOADABLE {
	    my($x) = @_;
    	    eval q(((($x) ==  &DOF_SECT_ECBDESC) || (($x) ==  &DOF_SECT_PROBEDESC) || (($x) ==  &DOF_SECT_ACTDESC) || (($x) ==  &DOF_SECT_DIFOHDR) || (($x) ==  &DOF_SECT_DIF) || (($x) ==  &DOF_SECT_STRTAB) || (($x) ==  &DOF_SECT_VARTAB) || (($x) ==  &DOF_SECT_RELTAB) || (($x) ==  &DOF_SECT_TYPTAB) || (($x) ==  &DOF_SECT_URELHDR) || (($x) ==  &DOF_SECT_KRELHDR) || (($x) ==  &DOF_SECT_OPTDESC) || (($x) ==  &DOF_SECT_PROVIDER) || (($x) ==  &DOF_SECT_PROBES) || (($x) ==  &DOF_SECT_PRARGS) || (($x) ==  &DOF_SECT_PROFFS) || (($x) ==  &DOF_SECT_INTTAB) || (($x) ==  &DOF_SECT_XLTAB) || (($x) ==  &DOF_SECT_XLMEMBERS) || (($x) ==  &DOF_SECT_XLIMPORT) || (($x) ==  &DOF_SECT_XLEXPORT) || (($x) ==  &DOF_SECT_PREXPORT) || (($x) ==  &DOF_SECT_PRENOFFS)));
	}' unless defined(&DOF_SEC_ISLOADABLE);
	eval 'sub DOF_RELO_NONE () {0;}' unless defined(&DOF_RELO_NONE);
	eval 'sub DOF_RELO_SETX () {1;}' unless defined(&DOF_RELO_SETX);
	eval 'sub DOF_RELO_DOFREL () {2;}' unless defined(&DOF_RELO_DOFREL);
	eval 'sub DOF_ATTR {
	    my($n, $d, $c) = @_;
    	    eval q(((($n) << 24) | (($d) << 16) | (($c) << 8)));
	}' unless defined(&DOF_ATTR);
	eval 'sub DOF_ATTR_NAME {
	    my($a) = @_;
    	    eval q(((($a) >> 24) & 0xff));
	}' unless defined(&DOF_ATTR_NAME);
	eval 'sub DOF_ATTR_DATA {
	    my($a) = @_;
    	    eval q(((($a) >> 16) & 0xff));
	}' unless defined(&DOF_ATTR_DATA);
	eval 'sub DOF_ATTR_CLASS {
	    my($a) = @_;
    	    eval q(((($a) >> 8) & 0xff));
	}' unless defined(&DOF_ATTR_CLASS);
	unless(defined(&_KERNEL)) {
	}
	eval 'sub DTRACE_SIZEOF_EPROBEDESC {
	    my($desc) = @_;
    	    eval q(($sizeof{ &dtrace_eprobedesc_t} + (($desc)-> &dtepd_nrecs ? ((($desc)-> &dtepd_nrecs - 1) * $sizeof{ &dtrace_recdesc_t}) : 0)));
	}' unless defined(&DTRACE_SIZEOF_EPROBEDESC);
	eval 'sub DTRACE_SIZEOF_AGGDESC {
	    my($desc) = @_;
    	    eval q(($sizeof{ &dtrace_aggdesc_t} + (($desc)-> &dtagd_nrecs ? ((($desc)-> &dtagd_nrecs - 1) * $sizeof{ &dtrace_recdesc_t}) : 0)));
	}' unless defined(&DTRACE_SIZEOF_AGGDESC);
	eval 'sub DTRACEOPT_BUFSIZE () {0;}' unless defined(&DTRACEOPT_BUFSIZE);
	eval 'sub DTRACEOPT_BUFPOLICY () {1;}' unless defined(&DTRACEOPT_BUFPOLICY);
	eval 'sub DTRACEOPT_DYNVARSIZE () {2;}' unless defined(&DTRACEOPT_DYNVARSIZE);
	eval 'sub DTRACEOPT_AGGSIZE () {3;}' unless defined(&DTRACEOPT_AGGSIZE);
	eval 'sub DTRACEOPT_SPECSIZE () {4;}' unless defined(&DTRACEOPT_SPECSIZE);
	eval 'sub DTRACEOPT_NSPEC () {5;}' unless defined(&DTRACEOPT_NSPEC);
	eval 'sub DTRACEOPT_STRSIZE () {6;}' unless defined(&DTRACEOPT_STRSIZE);
	eval 'sub DTRACEOPT_CLEANRATE () {7;}' unless defined(&DTRACEOPT_CLEANRATE);
	eval 'sub DTRACEOPT_CPU () {8;}' unless defined(&DTRACEOPT_CPU);
	eval 'sub DTRACEOPT_BUFRESIZE () {9;}' unless defined(&DTRACEOPT_BUFRESIZE);
	eval 'sub DTRACEOPT_GRABANON () {10;}' unless defined(&DTRACEOPT_GRABANON);
	eval 'sub DTRACEOPT_FLOWINDENT () {11;}' unless defined(&DTRACEOPT_FLOWINDENT);
	eval 'sub DTRACEOPT_QUIET () {12;}' unless defined(&DTRACEOPT_QUIET);
	eval 'sub DTRACEOPT_STACKFRAMES () {13;}' unless defined(&DTRACEOPT_STACKFRAMES);
	eval 'sub DTRACEOPT_USTACKFRAMES () {14;}' unless defined(&DTRACEOPT_USTACKFRAMES);
	eval 'sub DTRACEOPT_AGGRATE () {15;}' unless defined(&DTRACEOPT_AGGRATE);
	eval 'sub DTRACEOPT_SWITCHRATE () {16;}' unless defined(&DTRACEOPT_SWITCHRATE);
	eval 'sub DTRACEOPT_STATUSRATE () {17;}' unless defined(&DTRACEOPT_STATUSRATE);
	eval 'sub DTRACEOPT_DESTRUCTIVE () {18;}' unless defined(&DTRACEOPT_DESTRUCTIVE);
	eval 'sub DTRACEOPT_STACKINDENT () {19;}' unless defined(&DTRACEOPT_STACKINDENT);
	eval 'sub DTRACEOPT_RAWBYTES () {20;}' unless defined(&DTRACEOPT_RAWBYTES);
	eval 'sub DTRACEOPT_JSTACKFRAMES () {21;}' unless defined(&DTRACEOPT_JSTACKFRAMES);
	eval 'sub DTRACEOPT_JSTACKSTRSIZE () {22;}' unless defined(&DTRACEOPT_JSTACKSTRSIZE);
	eval 'sub DTRACEOPT_AGGSORTKEY () {23;}' unless defined(&DTRACEOPT_AGGSORTKEY);
	eval 'sub DTRACEOPT_AGGSORTREV () {24;}' unless defined(&DTRACEOPT_AGGSORTREV);
	eval 'sub DTRACEOPT_AGGSORTPOS () {25;}' unless defined(&DTRACEOPT_AGGSORTPOS);
	eval 'sub DTRACEOPT_AGGSORTKEYPOS () {26;}' unless defined(&DTRACEOPT_AGGSORTKEYPOS);
	eval 'sub DTRACEOPT_TEMPORAL () {27;}' unless defined(&DTRACEOPT_TEMPORAL);
	eval 'sub DTRACEOPT_AGGHIST () {28;}' unless defined(&DTRACEOPT_AGGHIST);
	eval 'sub DTRACEOPT_AGGPACK () {29;}' unless defined(&DTRACEOPT_AGGPACK);
	eval 'sub DTRACEOPT_AGGZOOM () {30;}' unless defined(&DTRACEOPT_AGGZOOM);
	eval 'sub DTRACEOPT_ZONE () {31;}' unless defined(&DTRACEOPT_ZONE);
	eval 'sub DTRACEOPT_MAX () {32;}' unless defined(&DTRACEOPT_MAX);
	eval 'sub DTRACEOPT_UNSET () {( &dtrace_optval_t)-2;}' unless defined(&DTRACEOPT_UNSET);
	eval 'sub DTRACEOPT_BUFPOLICY_RING () {0;}' unless defined(&DTRACEOPT_BUFPOLICY_RING);
	eval 'sub DTRACEOPT_BUFPOLICY_FILL () {1;}' unless defined(&DTRACEOPT_BUFPOLICY_FILL);
	eval 'sub DTRACEOPT_BUFPOLICY_SWITCH () {2;}' unless defined(&DTRACEOPT_BUFPOLICY_SWITCH);
	eval 'sub DTRACEOPT_BUFRESIZE_AUTO () {0;}' unless defined(&DTRACEOPT_BUFRESIZE_AUTO);
	eval 'sub DTRACEOPT_BUFRESIZE_MANUAL () {1;}' unless defined(&DTRACEOPT_BUFRESIZE_MANUAL);
	eval 'sub DTRACE_RECORD_LOAD_TIMESTAMP {
	    my($dtrh) = @_;
    	    eval q((($dtrh)-> &dtrh_timestamp_lo + (( &uint64_t)($dtrh)-> &dtrh_timestamp_hi << 32)));
	}' unless defined(&DTRACE_RECORD_LOAD_TIMESTAMP);
	eval 'sub DTRACE_RECORD_STORE_TIMESTAMP {
	    my($dtrh, $hrtime) = @_;
    	    eval q({ ($dtrh)-> &dtrh_timestamp_lo = ( &uint32_t)$hrtime; ($dtrh)-> &dtrh_timestamp_hi = $hrtime >> 32; });
	}' unless defined(&DTRACE_RECORD_STORE_TIMESTAMP);
	eval 'sub DTRACEFLT_UNKNOWN () {0;}' unless defined(&DTRACEFLT_UNKNOWN);
	eval 'sub DTRACEFLT_BADADDR () {1;}' unless defined(&DTRACEFLT_BADADDR);
	eval 'sub DTRACEFLT_BADALIGN () {2;}' unless defined(&DTRACEFLT_BADALIGN);
	eval 'sub DTRACEFLT_ILLOP () {3;}' unless defined(&DTRACEFLT_ILLOP);
	eval 'sub DTRACEFLT_DIVZERO () {4;}' unless defined(&DTRACEFLT_DIVZERO);
	eval 'sub DTRACEFLT_NOSCRATCH () {5;}' unless defined(&DTRACEFLT_NOSCRATCH);
	eval 'sub DTRACEFLT_KPRIV () {6;}' unless defined(&DTRACEFLT_KPRIV);
	eval 'sub DTRACEFLT_UPRIV () {7;}' unless defined(&DTRACEFLT_UPRIV);
	eval 'sub DTRACEFLT_TUPOFLOW () {8;}' unless defined(&DTRACEFLT_TUPOFLOW);
	eval 'sub DTRACEFLT_BADSTACK () {9;}' unless defined(&DTRACEFLT_BADSTACK);
	eval 'sub DTRACEFLT_LIBRARY () {1000;}' unless defined(&DTRACEFLT_LIBRARY);
	eval 'sub DTRACE_STABILITY_INTERNAL () {0;}' unless defined(&DTRACE_STABILITY_INTERNAL);
	eval 'sub DTRACE_STABILITY_PRIVATE () {1;}' unless defined(&DTRACE_STABILITY_PRIVATE);
	eval 'sub DTRACE_STABILITY_OBSOLETE () {2;}' unless defined(&DTRACE_STABILITY_OBSOLETE);
	eval 'sub DTRACE_STABILITY_EXTERNAL () {3;}' unless defined(&DTRACE_STABILITY_EXTERNAL);
	eval 'sub DTRACE_STABILITY_UNSTABLE () {4;}' unless defined(&DTRACE_STABILITY_UNSTABLE);
	eval 'sub DTRACE_STABILITY_EVOLVING () {5;}' unless defined(&DTRACE_STABILITY_EVOLVING);
	eval 'sub DTRACE_STABILITY_STABLE () {6;}' unless defined(&DTRACE_STABILITY_STABLE);
	eval 'sub DTRACE_STABILITY_STANDARD () {7;}' unless defined(&DTRACE_STABILITY_STANDARD);
	eval 'sub DTRACE_STABILITY_MAX () {7;}' unless defined(&DTRACE_STABILITY_MAX);
	eval 'sub DTRACE_CLASS_UNKNOWN () {0;}' unless defined(&DTRACE_CLASS_UNKNOWN);
	eval 'sub DTRACE_CLASS_CPU () {1;}' unless defined(&DTRACE_CLASS_CPU);
	eval 'sub DTRACE_CLASS_PLATFORM () {2;}' unless defined(&DTRACE_CLASS_PLATFORM);
	eval 'sub DTRACE_CLASS_GROUP () {3;}' unless defined(&DTRACE_CLASS_GROUP);
	eval 'sub DTRACE_CLASS_ISA () {4;}' unless defined(&DTRACE_CLASS_ISA);
	eval 'sub DTRACE_CLASS_COMMON () {5;}' unless defined(&DTRACE_CLASS_COMMON);
	eval 'sub DTRACE_CLASS_MAX () {5;}' unless defined(&DTRACE_CLASS_MAX);
	eval 'sub DTRACE_PRIV_NONE () {0x;}' unless defined(&DTRACE_PRIV_NONE);
	eval 'sub DTRACE_PRIV_KERNEL () {0x1;}' unless defined(&DTRACE_PRIV_KERNEL);
	eval 'sub DTRACE_PRIV_USER () {0x2;}' unless defined(&DTRACE_PRIV_USER);
	eval 'sub DTRACE_PRIV_PROC () {0x4;}' unless defined(&DTRACE_PRIV_PROC);
	eval 'sub DTRACE_PRIV_OWNER () {0x8;}' unless defined(&DTRACE_PRIV_OWNER);
	eval 'sub DTRACE_PRIV_ZONEOWNER () {0x10;}' unless defined(&DTRACE_PRIV_ZONEOWNER);
	eval 'sub DTRACE_PRIV_ALL () {( &DTRACE_PRIV_KERNEL |  &DTRACE_PRIV_USER |  &DTRACE_PRIV_PROC |  &DTRACE_PRIV_OWNER |  &DTRACE_PRIV_ZONEOWNER);}' unless defined(&DTRACE_PRIV_ALL);
	if(defined(&illumos)) {
	    eval 'sub DTRACEIOC () {((ord(\'d\' << 24) | (\'t\' << 16) | (\'r\') << 8));}' unless defined(&DTRACEIOC);
	    eval 'sub DTRACEIOC_PROVIDER () {( &DTRACEIOC | 1);}' unless defined(&DTRACEIOC_PROVIDER);
	    eval 'sub DTRACEIOC_PROBES () {( &DTRACEIOC | 2);}' unless defined(&DTRACEIOC_PROBES);
	    eval 'sub DTRACEIOC_BUFSNAP () {( &DTRACEIOC | 4);}' unless defined(&DTRACEIOC_BUFSNAP);
	    eval 'sub DTRACEIOC_PROBEMATCH () {( &DTRACEIOC | 5);}' unless defined(&DTRACEIOC_PROBEMATCH);
	    eval 'sub DTRACEIOC_ENABLE () {( &DTRACEIOC | 6);}' unless defined(&DTRACEIOC_ENABLE);
	    eval 'sub DTRACEIOC_AGGSNAP () {( &DTRACEIOC | 7);}' unless defined(&DTRACEIOC_AGGSNAP);
	    eval 'sub DTRACEIOC_EPROBE () {( &DTRACEIOC | 8);}' unless defined(&DTRACEIOC_EPROBE);
	    eval 'sub DTRACEIOC_PROBEARG () {( &DTRACEIOC | 9);}' unless defined(&DTRACEIOC_PROBEARG);
	    eval 'sub DTRACEIOC_CONF () {( &DTRACEIOC | 10);}' unless defined(&DTRACEIOC_CONF);
	    eval 'sub DTRACEIOC_STATUS () {( &DTRACEIOC | 11);}' unless defined(&DTRACEIOC_STATUS);
	    eval 'sub DTRACEIOC_GO () {( &DTRACEIOC | 12);}' unless defined(&DTRACEIOC_GO);
	    eval 'sub DTRACEIOC_STOP () {( &DTRACEIOC | 13);}' unless defined(&DTRACEIOC_STOP);
	    eval 'sub DTRACEIOC_AGGDESC () {( &DTRACEIOC | 15);}' unless defined(&DTRACEIOC_AGGDESC);
	    eval 'sub DTRACEIOC_FORMAT () {( &DTRACEIOC | 16);}' unless defined(&DTRACEIOC_FORMAT);
	    eval 'sub DTRACEIOC_DOFGET () {( &DTRACEIOC | 17);}' unless defined(&DTRACEIOC_DOFGET);
	    eval 'sub DTRACEIOC_REPLICATE () {( &DTRACEIOC | 18);}' unless defined(&DTRACEIOC_REPLICATE);
	} else {
	    eval 'sub DTRACEIOC_PROVIDER () { &_IOWR(ord(\'x\'),1, &dtrace_providerdesc_t);}' unless defined(&DTRACEIOC_PROVIDER);
	    eval 'sub DTRACEIOC_PROBES () { &_IOWR(ord(\'x\'),2, &dtrace_probedesc_t);}' unless defined(&DTRACEIOC_PROBES);
	    eval 'sub DTRACEIOC_BUFSNAP () { &_IOW(ord(\'x\'),4, &dtrace_bufdesc_t *);}' unless defined(&DTRACEIOC_BUFSNAP);
	    eval 'sub DTRACEIOC_PROBEMATCH () { &_IOWR(ord(\'x\'),5, &dtrace_probedesc_t);}' unless defined(&DTRACEIOC_PROBEMATCH);
	    eval 'sub DTRACEIOC_ENABLE () { &_IOWR(ord(\'x\'),6, &dtrace_enable_io_t);}' unless defined(&DTRACEIOC_ENABLE);
	    eval 'sub DTRACEIOC_AGGSNAP () { &_IOW(ord(\'x\'),7, &dtrace_bufdesc_t *);}' unless defined(&DTRACEIOC_AGGSNAP);
	    eval 'sub DTRACEIOC_EPROBE () { &_IOW(ord(\'x\'),8, &dtrace_eprobedesc_t);}' unless defined(&DTRACEIOC_EPROBE);
	    eval 'sub DTRACEIOC_PROBEARG () { &_IOWR(ord(\'x\'),9, &dtrace_argdesc_t);}' unless defined(&DTRACEIOC_PROBEARG);
	    eval 'sub DTRACEIOC_CONF () { &_IOR(ord(\'x\'),10, &dtrace_conf_t);}' unless defined(&DTRACEIOC_CONF);
	    eval 'sub DTRACEIOC_STATUS () { &_IOR(ord(\'x\'),11, &dtrace_status_t);}' unless defined(&DTRACEIOC_STATUS);
	    eval 'sub DTRACEIOC_GO () { &_IOR(ord(\'x\'),12, &processorid_t);}' unless defined(&DTRACEIOC_GO);
	    eval 'sub DTRACEIOC_STOP () { &_IOWR(ord(\'x\'),13, &processorid_t);}' unless defined(&DTRACEIOC_STOP);
	    eval 'sub DTRACEIOC_AGGDESC () { &_IOW(ord(\'x\'),15, &dtrace_aggdesc_t *);}' unless defined(&DTRACEIOC_AGGDESC);
	    eval 'sub DTRACEIOC_FORMAT () { &_IOWR(ord(\'x\'),16, &dtrace_fmtdesc_t);}' unless defined(&DTRACEIOC_FORMAT);
	    eval 'sub DTRACEIOC_DOFGET () { &_IOW(ord(\'x\'),17, &dof_hdr_t *);}' unless defined(&DTRACEIOC_DOFGET);
	    eval 'sub DTRACEIOC_REPLICATE () { &_IOW(ord(\'x\'),18, &dtrace_repldesc_t);}' unless defined(&DTRACEIOC_REPLICATE);
	}
	if(defined(&illumos)) {
	    eval 'sub DTRACEHIOC () {((ord(\'d\' << 24) | (\'t\' << 16) | (\'h\') << 8));}' unless defined(&DTRACEHIOC);
	    eval 'sub DTRACEHIOC_ADD () {( &DTRACEHIOC | 1);}' unless defined(&DTRACEHIOC_ADD);
	    eval 'sub DTRACEHIOC_REMOVE () {( &DTRACEHIOC | 2);}' unless defined(&DTRACEHIOC_REMOVE);
	    eval 'sub DTRACEHIOC_ADDDOF () {( &DTRACEHIOC | 3);}' unless defined(&DTRACEHIOC_ADDDOF);
	} else {
	    eval 'sub DTRACEHIOC_REMOVE () { &_IOW(ord(\'z\'), 2, \'int\');}' unless defined(&DTRACEHIOC_REMOVE);
	    eval 'sub DTRACEHIOC_ADDDOF () { &_IOWR(ord(\'z\'), 3,  &dof_helper_t);}' unless defined(&DTRACEHIOC_ADDDOF);
	}
	if(defined(&__FreeBSD__)) {
	}
	eval 'sub DTRACEMNR_DTRACE () {"dtrace";}' unless defined(&DTRACEMNR_DTRACE);
	eval 'sub DTRACEMNR_HELPER () {"helper";}' unless defined(&DTRACEMNR_HELPER);
	eval 'sub DTRACEMNRN_DTRACE () {0;}' unless defined(&DTRACEMNRN_DTRACE);
	eval 'sub DTRACEMNRN_HELPER () {1;}' unless defined(&DTRACEMNRN_HELPER);
	eval 'sub DTRACEMNRN_CLONE () {2;}' unless defined(&DTRACEMNRN_CLONE);
	if(defined(&_KERNEL)) {
	    eval 'sub DTRACE_MODE_KERNEL () {0x1;}' unless defined(&DTRACE_MODE_KERNEL);
	    eval 'sub DTRACE_MODE_USER () {0x2;}' unless defined(&DTRACE_MODE_USER);
	    eval 'sub DTRACE_MODE_NOPRIV_DROP () {0x10;}' unless defined(&DTRACE_MODE_NOPRIV_DROP);
	    eval 'sub DTRACE_MODE_NOPRIV_RESTRICT () {0x20;}' unless defined(&DTRACE_MODE_NOPRIV_RESTRICT);
	    eval 'sub DTRACE_MODE_LIMITEDPRIV_RESTRICT () {0x40;}' unless defined(&DTRACE_MODE_LIMITEDPRIV_RESTRICT);
	    eval("sub DTRACE_VTIME_INACTIVE () { 0; }") unless defined(&DTRACE_VTIME_INACTIVE);
	    eval("sub DTRACE_VTIME_ACTIVE () { 1; }") unless defined(&DTRACE_VTIME_ACTIVE);
	    eval("sub DTRACE_VTIME_INACTIVE_TNF () { 2; }") unless defined(&DTRACE_VTIME_INACTIVE_TNF);
	    eval("sub DTRACE_VTIME_ACTIVE_TNF () { 3; }") unless defined(&DTRACE_VTIME_ACTIVE_TNF);
	    if(defined(&illumos)) {
	    }
	    if(defined(&illumos)) {
	    }
	    if(defined(&illumos)) {
	    }
	    if(defined(&illumos)) {
	    } else {
	    }
	    if(defined(&__i386) || defined(&__amd64)) {
	    }
	    if(defined(&__sparc)) {
	    }
	    unless(defined(&illumos)) {
	    }
	    eval 'sub DTRACE_CPUFLAG_ISSET {
	        my($flag) = @_;
    		eval q(( ($cpu_core[&curcpu]->{cpuc_dtrace_flags}) & ($flag)));
	    }' unless defined(&DTRACE_CPUFLAG_ISSET);
	    eval 'sub DTRACE_CPUFLAG_SET {
	        my($flag) = @_;
    		eval q(( ($cpu_core[&curcpu]->{cpuc_dtrace_flags}) |= ($flag)));
	    }' unless defined(&DTRACE_CPUFLAG_SET);
	    eval 'sub DTRACE_CPUFLAG_CLEAR {
	        my($flag) = @_;
    		eval q(( ($cpu_core[&curcpu]->{cpuc_dtrace_flags}) &= ~($flag)));
	    }' unless defined(&DTRACE_CPUFLAG_CLEAR);
	}
	if(defined(&__i386) || defined(&__amd64)) {
	}
	if(defined(&__riscv)) {
	}
    }
    if(defined(&__i386) || defined(&__amd64)) {
	eval 'sub DTRACE_INVOP_PUSHL_EBP () {1;}' unless defined(&DTRACE_INVOP_PUSHL_EBP);
	eval 'sub DTRACE_INVOP_PUSHQ_RBP () { &DTRACE_INVOP_PUSHL_EBP;}' unless defined(&DTRACE_INVOP_PUSHQ_RBP);
	eval 'sub DTRACE_INVOP_POPL_EBP () {2;}' unless defined(&DTRACE_INVOP_POPL_EBP);
	eval 'sub DTRACE_INVOP_POPQ_RBP () { &DTRACE_INVOP_POPL_EBP;}' unless defined(&DTRACE_INVOP_POPQ_RBP);
	eval 'sub DTRACE_INVOP_LEAVE () {3;}' unless defined(&DTRACE_INVOP_LEAVE);
	eval 'sub DTRACE_INVOP_NOP () {4;}' unless defined(&DTRACE_INVOP_NOP);
	eval 'sub DTRACE_INVOP_RET () {5;}' unless defined(&DTRACE_INVOP_RET);
	if(defined(&__amd64)) {
	    eval 'sub DTRACE_INVOP_CALL () {6;}' unless defined(&DTRACE_INVOP_CALL);
	}
    }
 elsif(defined(&__powerpc__)) {
	eval 'sub DTRACE_INVOP_BCTR () {1;}' unless defined(&DTRACE_INVOP_BCTR);
	eval 'sub DTRACE_INVOP_BLR () {2;}' unless defined(&DTRACE_INVOP_BLR);
	eval 'sub DTRACE_INVOP_JUMP () {3;}' unless defined(&DTRACE_INVOP_JUMP);
	eval 'sub DTRACE_INVOP_MFLR_R0 () {4;}' unless defined(&DTRACE_INVOP_MFLR_R0);
	eval 'sub DTRACE_INVOP_NOP () {5;}' unless defined(&DTRACE_INVOP_NOP);
    }
 elsif(defined(&__arm__)) {
	eval 'sub DTRACE_INVOP_SHIFT () {4;}' unless defined(&DTRACE_INVOP_SHIFT);
	eval 'sub DTRACE_INVOP_MASK () {((1<<  &DTRACE_INVOP_SHIFT) - 1);}' unless defined(&DTRACE_INVOP_MASK);
	eval 'sub DTRACE_INVOP_DATA {
	    my($x) = @_;
    	    eval q((($x) >>  &DTRACE_INVOP_SHIFT));
	}' unless defined(&DTRACE_INVOP_DATA);
	eval 'sub DTRACE_INVOP_PUSHM () {1;}' unless defined(&DTRACE_INVOP_PUSHM);
	eval 'sub DTRACE_INVOP_POPM () {2;}' unless defined(&DTRACE_INVOP_POPM);
	eval 'sub DTRACE_INVOP_B () {3;}' unless defined(&DTRACE_INVOP_B);
    }
 elsif(defined(&__aarch64__)) {
	eval 'sub INSN_SIZE () {4;}' unless defined(&INSN_SIZE);
	eval 'sub BRK_INSTR () {0xd4200000;}' unless defined(&BRK_INSTR);
	eval 'sub BRK_IMM16_SHIFT () {5;}' unless defined(&BRK_IMM16_SHIFT);
	eval 'sub BRK_IMM16_VAL () {(0x40d <<  &BRK_IMM16_SHIFT);}' unless defined(&BRK_IMM16_VAL);
	eval 'sub B_MASK () {0xff000000;}' unless defined(&B_MASK);
	eval 'sub B_DATA_MASK () {0xffffff;}' unless defined(&B_DATA_MASK);
	eval 'sub B_INSTR () {0x14000000;}' unless defined(&B_INSTR);
	eval 'sub BTI_MASK () {0xffffff3f;}' unless defined(&BTI_MASK);
	eval 'sub BTI_INSTR () {0xd503241f;}' unless defined(&BTI_INSTR);
	eval 'sub NOP_INSTR () {0xd503201f;}' unless defined(&NOP_INSTR);
	eval 'sub RET_INSTR () {0xd65f03c0;}' unless defined(&RET_INSTR);
	eval 'sub SUB_MASK () {0xffc00000;}' unless defined(&SUB_MASK);
	eval 'sub SUB_INSTR () {0xd1000000;}' unless defined(&SUB_INSTR);
	eval 'sub SUB_RD_SHIFT () {0;}' unless defined(&SUB_RD_SHIFT);
	eval 'sub SUB_RN_SHIFT () {5;}' unless defined(&SUB_RN_SHIFT);
	eval 'sub SUB_R_MASK () {0x1f;}' unless defined(&SUB_R_MASK);
	eval 'sub SUB_IMM_SHIFT () {10;}' unless defined(&SUB_IMM_SHIFT);
	eval 'sub SUB_IMM_MASK () {0xfff;}' unless defined(&SUB_IMM_MASK);
	eval 'sub LDP_STP_MASK () {0xffc00000;}' unless defined(&LDP_STP_MASK);
	eval 'sub STP_32 () {0x29800000;}' unless defined(&STP_32);
	eval 'sub STP_64 () {0xa9800000;}' unless defined(&STP_64);
	eval 'sub LDP_32 () {0x28c00000;}' unless defined(&LDP_32);
	eval 'sub LDP_64 () {0xa8c00000;}' unless defined(&LDP_64);
	eval 'sub LDP_STP_PREIND () {(1<< 24);}' unless defined(&LDP_STP_PREIND);
	eval 'sub LDP_STP_DIR () {(1<< 22);}' unless defined(&LDP_STP_DIR);
	eval 'sub ARG1_SHIFT () {0;}' unless defined(&ARG1_SHIFT);
	eval 'sub ARG1_MASK () {0x1f;}' unless defined(&ARG1_MASK);
	eval 'sub ARG2_SHIFT () {10;}' unless defined(&ARG2_SHIFT);
	eval 'sub ARG2_MASK () {0x1f;}' unless defined(&ARG2_MASK);
	eval 'sub ADDR_SHIFT () {5;}' unless defined(&ADDR_SHIFT);
	eval 'sub ADDR_MASK () {0x1f;}' unless defined(&ADDR_MASK);
	eval 'sub OFFSET_SHIFT () {15;}' unless defined(&OFFSET_SHIFT);
	eval 'sub OFFSET_SIZE () {7;}' unless defined(&OFFSET_SIZE);
	eval 'sub OFFSET_MASK () {((1<<  &OFFSET_SIZE) - 1);}' unless defined(&OFFSET_MASK);
	eval 'sub DTRACE_PATCHVAL () {( &BRK_INSTR |  &BRK_IMM16_VAL);}' unless defined(&DTRACE_PATCHVAL);
	eval 'sub DTRACE_INVOP_STP () {1;}' unless defined(&DTRACE_INVOP_STP);
	eval 'sub DTRACE_INVOP_RET () {2;}' unless defined(&DTRACE_INVOP_RET);
	eval 'sub DTRACE_INVOP_B () {3;}' unless defined(&DTRACE_INVOP_B);
	eval 'sub DTRACE_INVOP_SUB () {4;}' unless defined(&DTRACE_INVOP_SUB);
    }
 elsif(defined(&__mips__)) {
	eval 'sub INSN_SIZE () {4;}' unless defined(&INSN_SIZE);
	eval 'sub LDSD_RA_SP_MASK () {0xffff0000;}' unless defined(&LDSD_RA_SP_MASK);
	eval 'sub LDSD_DATA_MASK () {0xffff;}' unless defined(&LDSD_DATA_MASK);
	eval 'sub SD_RA_SP () {0xffbf0000;}' unless defined(&SD_RA_SP);
	eval 'sub LD_RA_SP () {0xdfbf0000;}' unless defined(&LD_RA_SP);
	eval 'sub DTRACE_INVOP_SD () {1;}' unless defined(&DTRACE_INVOP_SD);
	eval 'sub DTRACE_INVOP_LD () {2;}' unless defined(&DTRACE_INVOP_LD);
    }
 elsif(defined(&__riscv)) {
	eval 'sub DTRACE_INVOP_SD () {1;}' unless defined(&DTRACE_INVOP_SD);
	eval 'sub DTRACE_INVOP_C_SDSP () {2;}' unless defined(&DTRACE_INVOP_C_SDSP);
	eval 'sub DTRACE_INVOP_RET () {3;}' unless defined(&DTRACE_INVOP_RET);
	eval 'sub DTRACE_INVOP_C_RET () {4;}' unless defined(&DTRACE_INVOP_C_RET);
	eval 'sub DTRACE_INVOP_NOP () {5;}' unless defined(&DTRACE_INVOP_NOP);
    }
    if(defined(&__cplusplus)) {
    }
}
1;

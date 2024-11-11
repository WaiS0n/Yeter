require '_h2ph_pre.ph';

no warnings qw(redefine misc);

unless(defined(&_SYS_KTRACE_H_)) {
    eval 'sub _SYS_KTRACE_H_ () {1;}' unless defined(&_SYS_KTRACE_H_);
    require 'sys/caprights.ph';
    require 'sys/signal.ph';
    require 'sys/_uio.ph';
    eval 'sub KTROP_SET () {0;}' unless defined(&KTROP_SET);
    eval 'sub KTROP_CLEAR () {1;}' unless defined(&KTROP_CLEAR);
    eval 'sub KTROP_CLEARFILE () {2;}' unless defined(&KTROP_CLEARFILE);
    eval 'sub KTROP {
        my($o) = @_;
	    eval q((($o)&3));
    }' unless defined(&KTROP);
    eval 'sub KTRFLAG_DESCEND () {4;}' unless defined(&KTRFLAG_DESCEND);
    eval 'sub KTR_VERSION0 () {0;}' unless defined(&KTR_VERSION0);
    eval 'sub KTR_VERSION1 () {1;}' unless defined(&KTR_VERSION1);
    eval 'sub KTR_OFFSET_V0 () {$sizeof{\'struct ktr_header_v0\'} - $sizeof{\'struct ktr_header\'};}' unless defined(&KTR_OFFSET_V0);
    eval 'sub KTRCHECK {
        my($td, $type) = @_;
	    eval q((($td)-> ($td_proc->{p_traceflag}) & (1<< $type)));
    }' unless defined(&KTRCHECK);
    eval 'sub KTRPOINT {
        my($td, $type) = @_;
	    eval q(( &__predict_false( &KTRCHECK(($td), ($type)))));
    }' unless defined(&KTRPOINT);
    eval 'sub KTRCHECKDRAIN {
        my($td) = @_;
	    eval q((!( &STAILQ_EMPTY(($td)-> ($td_proc->{p_ktr})))));
    }' unless defined(&KTRCHECKDRAIN);
    eval 'sub KTRUSERRET {
        my($td) = @_;
	    eval q( &do {  &if ( &__predict_false( &KTRCHECKDRAIN($td)))  &ktruserret($td); }  &while (0));
    }' unless defined(&KTRUSERRET);
    eval 'sub KTR_SYSCALL () {1;}' unless defined(&KTR_SYSCALL);
    eval 'sub KTR_SYSRET () {2;}' unless defined(&KTR_SYSRET);
    eval 'sub KTR_NAMEI () {3;}' unless defined(&KTR_NAMEI);
    eval 'sub KTR_GENIO () {4;}' unless defined(&KTR_GENIO);
    eval 'sub KTR_PSIG () {5;}' unless defined(&KTR_PSIG);
    eval 'sub KTR_CSW () {6;}' unless defined(&KTR_CSW);
    eval 'sub KTR_USER_MAXLEN () {2048;}' unless defined(&KTR_USER_MAXLEN);
    eval 'sub KTR_USER () {7;}' unless defined(&KTR_USER);
    eval 'sub KTR_STRUCT () {8;}' unless defined(&KTR_STRUCT);
    eval 'sub KTR_SYSCTL () {9;}' unless defined(&KTR_SYSCTL);
    eval 'sub KTR_PROCCTOR () {10;}' unless defined(&KTR_PROCCTOR);
    eval 'sub KTR_PROCDTOR () {11;}' unless defined(&KTR_PROCDTOR);
    eval 'sub KTR_CAPFAIL () {12;}' unless defined(&KTR_CAPFAIL);
    eval("sub CAPFAIL_NOTCAPABLE () { 0; }") unless defined(&CAPFAIL_NOTCAPABLE);
    eval("sub CAPFAIL_INCREASE () { 1; }") unless defined(&CAPFAIL_INCREASE);
    eval("sub CAPFAIL_SYSCALL () { 2; }") unless defined(&CAPFAIL_SYSCALL);
    eval("sub CAPFAIL_LOOKUP () { 3; }") unless defined(&CAPFAIL_LOOKUP);
    eval 'sub KTR_FAULT () {13;}' unless defined(&KTR_FAULT);
    eval 'sub KTR_FAULTEND () {14;}' unless defined(&KTR_FAULTEND);
    eval 'sub KTR_STRUCT_ARRAY () {15;}' unless defined(&KTR_STRUCT_ARRAY);
    eval 'sub KTR_DROP () {0x8000;}' unless defined(&KTR_DROP);
    eval 'sub KTR_VERSIONED () {0x4000;}' unless defined(&KTR_VERSIONED);
    eval 'sub KTR_TYPE () {( &KTR_DROP |  &KTR_VERSIONED);}' unless defined(&KTR_TYPE);
    eval 'sub KTRFAC_MASK () {0xffffff;}' unless defined(&KTRFAC_MASK);
    eval 'sub KTRFAC_SYSCALL () {(1<< &KTR_SYSCALL);}' unless defined(&KTRFAC_SYSCALL);
    eval 'sub KTRFAC_SYSRET () {(1<< &KTR_SYSRET);}' unless defined(&KTRFAC_SYSRET);
    eval 'sub KTRFAC_NAMEI () {(1<< &KTR_NAMEI);}' unless defined(&KTRFAC_NAMEI);
    eval 'sub KTRFAC_GENIO () {(1<< &KTR_GENIO);}' unless defined(&KTRFAC_GENIO);
    eval 'sub KTRFAC_PSIG () {(1<< &KTR_PSIG);}' unless defined(&KTRFAC_PSIG);
    eval 'sub KTRFAC_CSW () {(1<< &KTR_CSW);}' unless defined(&KTRFAC_CSW);
    eval 'sub KTRFAC_USER () {(1<< &KTR_USER);}' unless defined(&KTRFAC_USER);
    eval 'sub KTRFAC_STRUCT () {(1<< &KTR_STRUCT);}' unless defined(&KTRFAC_STRUCT);
    eval 'sub KTRFAC_SYSCTL () {(1<< &KTR_SYSCTL);}' unless defined(&KTRFAC_SYSCTL);
    eval 'sub KTRFAC_PROCCTOR () {(1<< &KTR_PROCCTOR);}' unless defined(&KTRFAC_PROCCTOR);
    eval 'sub KTRFAC_PROCDTOR () {(1<< &KTR_PROCDTOR);}' unless defined(&KTRFAC_PROCDTOR);
    eval 'sub KTRFAC_CAPFAIL () {(1<< &KTR_CAPFAIL);}' unless defined(&KTRFAC_CAPFAIL);
    eval 'sub KTRFAC_FAULT () {(1<< &KTR_FAULT);}' unless defined(&KTRFAC_FAULT);
    eval 'sub KTRFAC_FAULTEND () {(1<< &KTR_FAULTEND);}' unless defined(&KTRFAC_FAULTEND);
    eval 'sub KTRFAC_STRUCT_ARRAY () {(1<< &KTR_STRUCT_ARRAY);}' unless defined(&KTRFAC_STRUCT_ARRAY);
    eval 'sub KTRFAC_ROOT () {0x80000000;}' unless defined(&KTRFAC_ROOT);
    eval 'sub KTRFAC_INHERIT () {0x40000000;}' unless defined(&KTRFAC_INHERIT);
    eval 'sub KTRFAC_DROP () {0x20000000;}' unless defined(&KTRFAC_DROP);
    if(defined(&_KERNEL)) {
	if(defined(&KTRACE)) {
	} else {
	    eval 'sub ktr_get_tracevp {
	        my($p,$ref) = @_;
    		eval q({ ( &NULL); });
	    }' unless defined(&ktr_get_tracevp);
	}
	eval 'sub ktrcaprights {
	    my($s) = @_;
    	    eval q( &ktrstruct(\\"caprights\\", ($s), $sizeof{ &cap_rights_t}));
	}' unless defined(&ktrcaprights);
	eval 'sub ktritimerval {
	    my($s) = @_;
    	    eval q( &ktrstruct(\\"itimerval\\", ($s), $sizeof{\'struct itimerval\'}));
	}' unless defined(&ktritimerval);
	eval 'sub ktrsockaddr {
	    my($s) = @_;
    	    eval q( &ktrstruct(\\"sockaddr\\", ($s), (($s))-> &sa_len));
	}' unless defined(&ktrsockaddr);
	eval 'sub ktrstat {
	    my($s) = @_;
    	    eval q( &ktrstruct(\\"stat\\", ($s), $sizeof{\'struct stat\'}));
	}' unless defined(&ktrstat);
	eval 'sub ktrstat_error {
	    my($s, $error) = @_;
    	    eval q( &ktrstruct_error(\\"stat\\", ($s), $sizeof{\'struct stat\'}, $error));
	}' unless defined(&ktrstat_error);
	eval 'sub ktrcpuset {
	    my($s, $l) = @_;
    	    eval q( &ktrstruct(\\"cpuset_t\\", ($s), $l));
	}' unless defined(&ktrcpuset);
	if(defined(&KTRACE)) {
	    eval 'sub __ktrace_used () {1;}' unless defined(&__ktrace_used);
	} else {
	    eval 'sub ktr_filesize_limit_signal () {0;}' unless defined(&ktr_filesize_limit_signal);
	    eval 'sub __ktrace_used () { &__unused;}' unless defined(&__ktrace_used);
	}
    } else {
	require 'sys/cdefs.ph';
    }
}
1;

require '_h2ph_pre.ph';

no warnings qw(redefine misc);

unless(defined(&_SYS_PMC_H_)) {
    eval 'sub _SYS_PMC_H_ () {1;}' unless defined(&_SYS_PMC_H_);
    require 'dev/hwpmc/pmc_events.ph';
    require 'sys/proc.ph';
    require 'sys/counter.ph';
    require 'machine/pmc_mdep.ph';
    require 'machine/profile.ph';
    if(defined(&_KERNEL)) {
	require 'sys/epoch.ph';
	require 'ck_queue.ph';
    }
    eval 'sub PMC_MODULE_NAME () {"hwpmc";}' unless defined(&PMC_MODULE_NAME);
    eval 'sub PMC_NAME_MAX () {64;}' unless defined(&PMC_NAME_MAX);
    eval 'sub PMC_CLASS_MAX () {8;}' unless defined(&PMC_CLASS_MAX);
    eval 'sub PMC_VERSION_MAJOR () {0xa;}' unless defined(&PMC_VERSION_MAJOR);
    eval 'sub PMC_VERSION_MINOR () {0x;}' unless defined(&PMC_VERSION_MINOR);
    eval 'sub PMC_VERSION_PATCH () {0x;}' unless defined(&PMC_VERSION_PATCH);
    eval 'sub PMC_VERSION () {( &PMC_VERSION_MAJOR << 24|  &PMC_VERSION_MINOR << 16|  &PMC_VERSION_PATCH);}' unless defined(&PMC_VERSION);
    eval 'sub PMC_CPUID_LEN () {64;}' unless defined(&PMC_CPUID_LEN);
    eval 'sub __PMC_CPUS () {
        eval q( &__PMC_CPU( &AMD_K7, 0x, \\"AMD K7\\")  &__PMC_CPU( &AMD_K8, 0x1, \\"AMD K8\\")  &__PMC_CPU( &INTEL_CORE, 0x87, \\"Intel Core Solo/Duo\\")  &__PMC_CPU( &INTEL_CORE2, 0x88, \\"Intel Core2\\")  &__PMC_CPU( &INTEL_CORE2EXTREME, 0x89, \\"Intel Core2 Extreme\\")  &__PMC_CPU( &INTEL_ATOM, 0x8a, \\"Intel Atom\\")  &__PMC_CPU( &INTEL_COREI7, 0x8b, \\"Intel Core i7\\")  &__PMC_CPU( &INTEL_WESTMERE, 0x8c, \\"Intel Westmere\\")  &__PMC_CPU( &INTEL_SANDYBRIDGE, 0x8d, \\"Intel Sandy Bridge\\")  &__PMC_CPU( &INTEL_IVYBRIDGE, 0x8e, \\"Intel Ivy Bridge\\")  &__PMC_CPU( &INTEL_SANDYBRIDGE_XEON, 0x8f, \\"Intel Sandy Bridge Xeon\\")  &__PMC_CPU( &INTEL_IVYBRIDGE_XEON, 0x90, \\"Intel Ivy Bridge Xeon\\")  &__PMC_CPU( &INTEL_HASWELL, 0x91, \\"Intel Haswell\\")  &__PMC_CPU( &INTEL_ATOM_SILVERMONT, 0x92, \\"Intel Atom Silvermont\\")  &__PMC_CPU( &INTEL_NEHALEM_EX, 0x93, \\"Intel Nehalem Xeon 7500\\")  &__PMC_CPU( &INTEL_WESTMERE_EX, 0x94, \\"Intel Westmere Xeon E7\\")  &__PMC_CPU( &INTEL_HASWELL_XEON, 0x95, \\"Intel Haswell Xeon E5 v3\\")  &__PMC_CPU( &INTEL_BROADWELL, 0x96, \\"Intel Broadwell\\")  &__PMC_CPU( &INTEL_BROADWELL_XEON, 0x97, \\"Intel Broadwell Xeon\\")  &__PMC_CPU( &INTEL_SKYLAKE, 0x98, \\"Intel Skylake\\")  &__PMC_CPU( &INTEL_SKYLAKE_XEON, 0x99, \\"Intel Skylake Xeon\\")  &__PMC_CPU( &INTEL_ATOM_GOLDMONT, 0x9a, \\"Intel Atom Goldmont\\")  &__PMC_CPU( &INTEL_ICELAKE, 0x9b, \\"Intel Icelake\\")  &__PMC_CPU( &INTEL_ICELAKE_XEON, 0x9c, \\"Intel Icelake Xeon\\")  &__PMC_CPU( &INTEL_ALDERLAKE, 0x9d, \\"Intel Alderlake\\")  &__PMC_CPU( &INTEL_ATOM_GOLDMONT_P, 0x9e, \\"Intel Atom Goldmont Plus\\")  &__PMC_CPU( &INTEL_ATOM_TREMONT, 0x9f, \\"Intel Atom Tremont\\")  &__PMC_CPU( &INTEL_XSCALE, 0x100, \\"Intel XScale\\")  &__PMC_CPU( &PPC_7450, 0x300, \\"PowerPC MPC7450\\")  &__PMC_CPU( &PPC_E500, 0x340, \\"PowerPC e500 Core\\")  &__PMC_CPU( &PPC_970, 0x380, \\"IBM PowerPC 970\\")  &__PMC_CPU( &PPC_POWER8, 0x390, \\"IBM POWER8\\")  &__PMC_CPU( &GENERIC, 0x400, \\"Generic\\")  &__PMC_CPU( &ARMV7_CORTEX_A5, 0x500, \\"ARMv7 Cortex A5\\")  &__PMC_CPU( &ARMV7_CORTEX_A7, 0x501, \\"ARMv7 Cortex A7\\")  &__PMC_CPU( &ARMV7_CORTEX_A8, 0x502, \\"ARMv7 Cortex A8\\")  &__PMC_CPU( &ARMV7_CORTEX_A9, 0x503, \\"ARMv7 Cortex A9\\")  &__PMC_CPU( &ARMV7_CORTEX_A15, 0x504, \\"ARMv7 Cortex A15\\")  &__PMC_CPU( &ARMV7_CORTEX_A17, 0x505, \\"ARMv7 Cortex A17\\")  &__PMC_CPU( &ARMV8_CORTEX_A53, 0x600, \\"ARMv8 Cortex A53\\")  &__PMC_CPU( &ARMV8_CORTEX_A57, 0x601, \\"ARMv8 Cortex A57\\")  &__PMC_CPU( &ARMV8_CORTEX_A76, 0x602, \\"ARMv8 Cortex A76\\"));
    }' unless defined(&__PMC_CPUS);
    eval("sub V () { 0; }") unless defined(&V);
    eval 'sub PMC_CPU_FIRST () { &PMC_CPU_AMD_K7;}' unless defined(&PMC_CPU_FIRST);
    eval 'sub PMC_CPU_LAST () { &PMC_CPU_ARMV8_CORTEX_A76;}' unless defined(&PMC_CPU_LAST);
    eval 'sub __PMC_CLASSES () {
        eval q( &__PMC_CLASS( &TSC, 0x, \\"CPU Timestamp counter\\")  &__PMC_CLASS( &K7, 0x1, \\"AMD K7 performance counters\\")  &__PMC_CLASS( &K8, 0x2, \\"AMD K8 performance counters\\")  &__PMC_CLASS( &IAF, 0x6, \\"Intel Core2/Atom, fixed function\\")  &__PMC_CLASS( &IAP, 0x7, \\"Intel Core...Atom, programmable\\")  &__PMC_CLASS( &UCF, 0x8, \\"Intel Uncore fixed function\\")  &__PMC_CLASS( &UCP, 0x9, \\"Intel Uncore programmable\\")  &__PMC_CLASS( &XSCALE, 0xa, \\"Intel XScale counters\\")  &__PMC_CLASS( &PPC7450, 0xd, \\"Motorola MPC7450 class\\")  &__PMC_CLASS( &PPC970, 0xe, \\"IBM PowerPC 970 class\\")  &__PMC_CLASS( &SOFT, 0xf, \\"Software events\\")  &__PMC_CLASS( &ARMV7, 0x10, \\"ARMv7\\")  &__PMC_CLASS( &ARMV8, 0x11, \\"ARMv8\\")  &__PMC_CLASS( &E500, 0x13, \\"Freescale e500 class\\")  &__PMC_CLASS( &POWER8, 0x15, \\"IBM POWER8 class\\")  &__PMC_CLASS( &DMC620_PMU_CD2, 0x16, \\"ARM DMC620 Memory Controller PMU CLKDIV2\\")  &__PMC_CLASS( &DMC620_PMU_C, 0x17, \\"ARM DMC620 Memory Controller PMU CLK\\")  &__PMC_CLASS( &CMN600_PMU, 0x18, \\"Arm CoreLink CMN600 Coherent Mesh Network PMU\\"));
    }' unless defined(&__PMC_CLASSES);
    eval("sub V () { 0; }") unless defined(&V);
    eval 'sub PMC_CLASS_FIRST () { &PMC_CLASS_TSC;}' unless defined(&PMC_CLASS_FIRST);
    eval 'sub PMC_CLASS_LAST () { &PMC_CLASS_CMN600_PMU;}' unless defined(&PMC_CLASS_LAST);
    eval 'sub __PMC_HWSTATES () {
        eval q( &__PMC_STATE( &DISABLED)  &__PMC_STATE( &FREE));
    }' unless defined(&__PMC_HWSTATES);
    eval 'sub __PMC_SWSTATES () {
        eval q( &__PMC_STATE( &ALLOCATED)  &__PMC_STATE( &STOPPED)  &__PMC_STATE( &RUNNING)  &__PMC_STATE( &DELETED));
    }' unless defined(&__PMC_SWSTATES);
    eval 'sub __PMC_STATES () {
        eval q( &__PMC_HWSTATES()  &__PMC_SWSTATES());
    }' unless defined(&__PMC_STATES);
    eval 'sub PMC_STATE_FIRST () { &PMC_STATE_DISABLED;}' unless defined(&PMC_STATE_FIRST);
    eval 'sub PMC_STATE_LAST () { &PMC_STATE_DELETED;}' unless defined(&PMC_STATE_LAST);
    eval 'sub __PMC_MODES () {
        eval q( &__PMC_MODE( &SS, 0)  &__PMC_MODE( &SC, 1)  &__PMC_MODE( &TS, 2)  &__PMC_MODE( &TC, 3));
    }' unless defined(&__PMC_MODES);
    eval 'sub PMC_MODE_FIRST () { &PMC_MODE_SS;}' unless defined(&PMC_MODE_FIRST);
    eval 'sub PMC_MODE_LAST () { &PMC_MODE_TC;}' unless defined(&PMC_MODE_LAST);
    eval 'sub PMC_IS_COUNTING_MODE {
        my($mode) = @_;
	    eval q((($mode) ==  &PMC_MODE_SC || ($mode) ==  &PMC_MODE_TC));
    }' unless defined(&PMC_IS_COUNTING_MODE);
    eval 'sub PMC_IS_SYSTEM_MODE {
        my($mode) = @_;
	    eval q((($mode) ==  &PMC_MODE_SS || ($mode) ==  &PMC_MODE_SC));
    }' unless defined(&PMC_IS_SYSTEM_MODE);
    eval 'sub PMC_IS_SAMPLING_MODE {
        my($mode) = @_;
	    eval q((($mode) ==  &PMC_MODE_SS || ($mode) ==  &PMC_MODE_TS));
    }' unless defined(&PMC_IS_SAMPLING_MODE);
    eval 'sub PMC_IS_VIRTUAL_MODE {
        my($mode) = @_;
	    eval q((($mode) ==  &PMC_MODE_TS || ($mode) ==  &PMC_MODE_TC));
    }' unless defined(&PMC_IS_VIRTUAL_MODE);
    eval 'sub __PMC_DISPOSITIONS {
        my($N) = @_;
	    eval q( &__PMC_DISP( &STANDALONE)  &__PMC_DISP( &FREE)  &__PMC_DISP( &THREAD)  &__PMC_DISP( &UNKNOWN));
    }' unless defined(&__PMC_DISPOSITIONS);
    eval 'sub PMC_DISP_FIRST () { &PMC_DISP_STANDALONE;}' unless defined(&PMC_DISP_FIRST);
    eval 'sub PMC_DISP_LAST () { &PMC_DISP_THREAD;}' unless defined(&PMC_DISP_LAST);
    eval 'sub __PMC_CAPS () {
        eval q( &__PMC_CAP( &INTERRUPT, 0, \\"generate interrupts\\")  &__PMC_CAP( &USER, 1, \\"count user-mode events\\")  &__PMC_CAP( &SYSTEM, 2, \\"count system-mode events\\")  &__PMC_CAP( &EDGE, 3, \\"do edge detection of events\\")  &__PMC_CAP( &THRESHOLD, 4, \\"ignore events below a threshold\\")  &__PMC_CAP( &READ, 5, \\"read PMC counter\\")  &__PMC_CAP( &WRITE, 6, \\"reprogram PMC counter\\")  &__PMC_CAP( &INVERT, 7, \\"invert comparison sense\\")  &__PMC_CAP( &QUALIFIER, 8, \\"further qualify monitored events\\")  &__PMC_CAP( &PRECISE, 9, \\"perform precise sampling\\")  &__PMC_CAP( &TAGGING, 10, \\"tag upstream events\\")  &__PMC_CAP( &CASCADE, 11, \\"cascade counters\\")  &__PMC_CAP( &SYSWIDE, 12, \\"system wide counter\\")  &__PMC_CAP( &DOMWIDE, 13, \\"NUMA domain wide counter\\"));
    }' unless defined(&__PMC_CAPS);
    eval("sub VALUE () { 0; }") unless defined(&VALUE);
    eval 'sub PMC_CAP_FIRST () { &PMC_CAP_INTERRUPT;}' unless defined(&PMC_CAP_FIRST);
    eval 'sub PMC_CAP_LAST () { &PMC_CAP_DOMWIDE;}' unless defined(&PMC_CAP_LAST);
    eval 'sub __PMC_OPS () {
        eval q( &__PMC_OP( &CONFIGURELOG, \\"Set log file\\")  &__PMC_OP( &FLUSHLOG, \\"Flush log file\\")  &__PMC_OP( &GETCPUINFO, \\"Get system CPU information\\")  &__PMC_OP( &GETDRIVERSTATS, \\"Get driver statistics\\")  &__PMC_OP( &GETMODULEVERSION, \\"Get module version\\")  &__PMC_OP( &GETPMCINFO, \\"Get per-cpu PMC information\\")  &__PMC_OP( &PMCADMIN, \\"Set PMC state\\")  &__PMC_OP( &PMCALLOCATE, \\"Allocate and configure a PMC\\")  &__PMC_OP( &PMCATTACH, \\"Attach a PMC to a process\\")  &__PMC_OP( &PMCDETACH, \\"Detach a PMC from a process\\")  &__PMC_OP( &PMCGETMSR, \\"Get a PMC\'s hardware address\\")  &__PMC_OP( &PMCRELEASE, \\"Release a PMC\\")  &__PMC_OP( &PMCRW, \\"Read/Set a PMC\\")  &__PMC_OP( &PMCSETCOUNT, \\"Set initial count/sampling rate\\")  &__PMC_OP( &PMCSTART, \\"Start a PMC\\")  &__PMC_OP( &PMCSTOP, \\"Stop a PMC\\")  &__PMC_OP( &WRITELOG, \\"Write a cookie to the log file\\")  &__PMC_OP( &CLOSELOG, \\"Close log file\\")  &__PMC_OP( &GETDYNEVENTINFO, \\"Get dynamic events list\\"));
    }' unless defined(&__PMC_OPS);
    eval 'sub PMC_F_UNUSED1 () {0x1;}' unless defined(&PMC_F_UNUSED1);
    eval 'sub PMC_F_DESCENDANTS () {0x2;}' unless defined(&PMC_F_DESCENDANTS);
    eval 'sub PMC_F_LOG_PROCCSW () {0x4;}' unless defined(&PMC_F_LOG_PROCCSW);
    eval 'sub PMC_F_LOG_PROCEXIT () {0x8;}' unless defined(&PMC_F_LOG_PROCEXIT);
    eval 'sub PMC_F_NEWVALUE () {0x10;}' unless defined(&PMC_F_NEWVALUE);
    eval 'sub PMC_F_OLDVALUE () {0x20;}' unless defined(&PMC_F_OLDVALUE);
    eval 'sub PMC_F_CALLCHAIN () {0x80;}' unless defined(&PMC_F_CALLCHAIN);
    eval 'sub PMC_F_USERCALLCHAIN () {0x100;}' unless defined(&PMC_F_USERCALLCHAIN);
    eval 'sub PMC_F_EV_PMU () {0x200;}' unless defined(&PMC_F_EV_PMU);
    eval 'sub PMC_F_ATTACHED_TO_OWNER () {0x10000;}' unless defined(&PMC_F_ATTACHED_TO_OWNER);
    eval 'sub PMC_F_NEEDS_LOGFILE () {0x20000;}' unless defined(&PMC_F_NEEDS_LOGFILE);
    eval 'sub PMC_F_ATTACH_DONE () {0x40000;}' unless defined(&PMC_F_ATTACH_DONE);
    eval 'sub PMC_CALLCHAIN_DEPTH_MAX () {512;}' unless defined(&PMC_CALLCHAIN_DEPTH_MAX);
    eval 'sub PMC_CC_F_USERSPACE () {0x1;}' unless defined(&PMC_CC_F_USERSPACE);
    eval 'sub PMC_ID_INVALID () {(~ ( &pmc_id_t) 0);}' unless defined(&PMC_ID_INVALID);
    eval 'sub PMC_ID_TO_ROWINDEX {
        my($ID) = @_;
	    eval q((($ID) & 0xff));
    }' unless defined(&PMC_ID_TO_ROWINDEX);
    eval 'sub PMC_ID_TO_CLASS {
        my($ID) = @_;
	    eval q(((($ID) & 0xff00) >> 8));
    }' unless defined(&PMC_ID_TO_CLASS);
    eval 'sub PMC_ID_TO_MODE {
        my($ID) = @_;
	    eval q(((($ID) & 0xf0000) >> 16));
    }' unless defined(&PMC_ID_TO_MODE);
    eval 'sub PMC_ID_TO_CPU {
        my($ID) = @_;
	    eval q(((($ID) & 0xfff00000) >> 20));
    }' unless defined(&PMC_ID_TO_CPU);
    eval 'sub PMC_ID_MAKE_ID {
        my($CPU,$MODE,$CLASS,$ROWINDEX) = @_;
	    eval q((((($CPU) & 0xfff) << 20) | ((($MODE) & 0xf) << 16) | ((($CLASS) & 0xff) << 8) | (($ROWINDEX) & 0xff)));
    }' unless defined(&PMC_ID_MAKE_ID);
    eval 'sub PMC_CPU_ANY () {~0;}' unless defined(&PMC_CPU_ANY);
    if(defined(&_KERNEL)) {
    }
    if(defined(&_KERNEL)) {
	require 'sys/malloc.ph';
	require 'sys/sysctl.ph';
	require 'sys/_cpuset.ph';
	require 'machine/frame.ph';
	eval 'sub PMC_HASH_SIZE () {1024;}' unless defined(&PMC_HASH_SIZE);
	eval 'sub PMC_MTXPOOL_SIZE () {2048;}' unless defined(&PMC_MTXPOOL_SIZE);
	eval 'sub PMC_LOG_BUFFER_SIZE () {256;}' unless defined(&PMC_LOG_BUFFER_SIZE);
	eval 'sub PMC_NLOGBUFFERS_PCPU () {32;}' unless defined(&PMC_NLOGBUFFERS_PCPU);
	eval 'sub PMC_NSAMPLES () {256;}' unless defined(&PMC_NSAMPLES);
	eval 'sub PMC_CALLCHAIN_DEPTH () {128;}' unless defined(&PMC_CALLCHAIN_DEPTH);
	eval 'sub PMC_THREADLIST_MAX () {128;}' unless defined(&PMC_THREADLIST_MAX);
	eval 'sub PMC_SYSCTL_NAME_PREFIX () {"kern."  &PMC_MODULE_NAME ".";}' unless defined(&PMC_SYSCTL_NAME_PREFIX);
	eval 'sub PMC_TO_MODE {
	    my($P) = @_;
    	    eval q( &PMC_ID_TO_MODE(($P)-> &pm_id));
	}' unless defined(&PMC_TO_MODE);
	eval 'sub PMC_TO_CLASS {
	    my($P) = @_;
    	    eval q( &PMC_ID_TO_CLASS(($P)-> &pm_id));
	}' unless defined(&PMC_TO_CLASS);
	eval 'sub PMC_TO_ROWINDEX {
	    my($P) = @_;
    	    eval q( &PMC_ID_TO_ROWINDEX(($P)-> &pm_id));
	}' unless defined(&PMC_TO_ROWINDEX);
	eval 'sub PMC_TO_CPU {
	    my($P) = @_;
    	    eval q( &PMC_ID_TO_CPU(($P)-> &pm_id));
	}' unless defined(&PMC_TO_CPU);
	eval 'sub PMC_PP_ENABLE_MSR_ACCESS () {0x1;}' unless defined(&PMC_PP_ENABLE_MSR_ACCESS);
	eval 'sub PMC_PO_OWNS_LOGFILE () {0x1;}' unless defined(&PMC_PO_OWNS_LOGFILE);
	eval 'sub PMC_PO_SHUTDOWN () {0x10;}' unless defined(&PMC_PO_SHUTDOWN);
	eval 'sub PMC_PO_INITIAL_MAPPINGS_DONE () {0x20;}' unless defined(&PMC_PO_INITIAL_MAPPINGS_DONE);
	eval 'sub PMC_PHW_RI_MASK () {0xff;}' unless defined(&PMC_PHW_RI_MASK);
	eval 'sub PMC_PHW_CPU_SHIFT () {8;}' unless defined(&PMC_PHW_CPU_SHIFT);
	eval 'sub PMC_PHW_CPU_MASK () {0xff00;}' unless defined(&PMC_PHW_CPU_MASK);
	eval 'sub PMC_PHW_FLAGS_SHIFT () {16;}' unless defined(&PMC_PHW_FLAGS_SHIFT);
	eval 'sub PMC_PHW_FLAGS_MASK () {0xffff0000;}' unless defined(&PMC_PHW_FLAGS_MASK);
	eval 'sub PMC_PHW_INDEX_TO_STATE {
	    my($ri) = @_;
    	    eval q((($ri) &  &PMC_PHW_RI_MASK));
	}' unless defined(&PMC_PHW_INDEX_TO_STATE);
	eval 'sub PMC_PHW_STATE_TO_INDEX {
	    my($state) = @_;
    	    eval q((($state) &  &PMC_PHW_RI_MASK));
	}' unless defined(&PMC_PHW_STATE_TO_INDEX);
	eval 'sub PMC_PHW_CPU_TO_STATE {
	    my($cpu) = @_;
    	    eval q(((($cpu) <<  &PMC_PHW_CPU_SHIFT) &  &PMC_PHW_CPU_MASK));
	}' unless defined(&PMC_PHW_CPU_TO_STATE);
	eval 'sub PMC_PHW_STATE_TO_CPU {
	    my($state) = @_;
    	    eval q(((($state) &  &PMC_PHW_CPU_MASK) >>  &PMC_PHW_CPU_SHIFT));
	}' unless defined(&PMC_PHW_STATE_TO_CPU);
	eval 'sub PMC_PHW_FLAGS_TO_STATE {
	    my($flags) = @_;
    	    eval q(((($flags) <<  &PMC_PHW_FLAGS_SHIFT) &  &PMC_PHW_FLAGS_MASK));
	}' unless defined(&PMC_PHW_FLAGS_TO_STATE);
	eval 'sub PMC_PHW_STATE_TO_FLAGS {
	    my($state) = @_;
    	    eval q(((($state) &  &PMC_PHW_FLAGS_MASK) >>  &PMC_PHW_FLAGS_SHIFT));
	}' unless defined(&PMC_PHW_STATE_TO_FLAGS);
	eval 'sub PMC_PHW_FLAG_IS_ENABLED () {( &PMC_PHW_FLAGS_TO_STATE(0x1));}' unless defined(&PMC_PHW_FLAG_IS_ENABLED);
	eval 'sub PMC_PHW_FLAG_IS_SHAREABLE () {( &PMC_PHW_FLAGS_TO_STATE(0x2));}' unless defined(&PMC_PHW_FLAG_IS_SHAREABLE);
	eval 'sub PMC_SAMPLE_FREE () {(( &uint16_t) 0);}' unless defined(&PMC_SAMPLE_FREE);
	eval 'sub PMC_USER_CALLCHAIN_PENDING () {(( &uint16_t) 0xffff);}' unless defined(&PMC_USER_CALLCHAIN_PENDING);
	eval 'sub PMC_CONS_SAMPLE {
	    my($psb) = @_;
    	    eval q((($psb)-> $ps_samples[($psb)-> &ps_considx &  &pmc_sample_mask]));
	}' unless defined(&PMC_CONS_SAMPLE);
	eval 'sub PMC_CONS_SAMPLE_OFF {
	    my($psb, $off) = @_;
    	    eval q((($psb)-> $ps_samples[($off) &  &pmc_sample_mask]));
	}' unless defined(&PMC_CONS_SAMPLE_OFF);
	eval 'sub PMC_PROD_SAMPLE {
	    my($psb) = @_;
    	    eval q((($psb)-> $ps_samples[($psb)-> &ps_prodidx &  &pmc_sample_mask]));
	}' unless defined(&PMC_PROD_SAMPLE);
	eval 'sub PMC_PCPU_CPU_MASK () {0xff;}' unless defined(&PMC_PCPU_CPU_MASK);
	eval 'sub PMC_PCPU_FLAGS_MASK () {0xffffff00;}' unless defined(&PMC_PCPU_FLAGS_MASK);
	eval 'sub PMC_PCPU_FLAGS_SHIFT () {8;}' unless defined(&PMC_PCPU_FLAGS_SHIFT);
	eval 'sub PMC_PCPU_STATE_TO_CPU {
	    my($S) = @_;
    	    eval q((($S) &  &PMC_PCPU_CPU_MASK));
	}' unless defined(&PMC_PCPU_STATE_TO_CPU);
	eval 'sub PMC_PCPU_STATE_TO_FLAGS {
	    my($S) = @_;
    	    eval q(((($S) &  &PMC_PCPU_FLAGS_MASK) >>  &PMC_PCPU_FLAGS_SHIFT));
	}' unless defined(&PMC_PCPU_STATE_TO_FLAGS);
	eval 'sub PMC_PCPU_FLAGS_TO_STATE {
	    my($F) = @_;
    	    eval q(((($F) <<  &PMC_PCPU_FLAGS_SHIFT) &  &PMC_PCPU_FLAGS_MASK));
	}' unless defined(&PMC_PCPU_FLAGS_TO_STATE);
	eval 'sub PMC_PCPU_CPU_TO_STATE {
	    my($C) = @_;
    	    eval q((($C) &  &PMC_PCPU_CPU_MASK));
	}' unless defined(&PMC_PCPU_CPU_TO_STATE);
	eval 'sub PMC_PCPU_FLAG_HTT () {( &PMC_PCPU_FLAGS_TO_STATE(0x1));}' unless defined(&PMC_PCPU_FLAG_HTT);
	if(defined(&HWPMC_DEBUG)) {
	    if(!defined(&KTR) || !defined(&KTR_COMPILE) || (((defined(&KTR_COMPILE) ? &KTR_COMPILE : undef) & (defined(&KTR_SUBSYS) ? &KTR_SUBSYS : undef)) == 0)) {
		die("HWPMC_DEBUG requires KTR and KTR_COMPILE=KTR_SUBSYS -- see ktr(4)");
	    }
	    require 'sys/ktr.ph';
	    eval 'sub __pmcdbg_used () {1;}' unless defined(&__pmcdbg_used);
	    eval 'sub KTR_PMC () { &KTR_SUBSYS;}' unless defined(&KTR_PMC);
	    eval 'sub PMC_DEBUG_STRSIZE () {128;}' unless defined(&PMC_DEBUG_STRSIZE);
	    eval 'sub PMC_DEBUG_DEFAULT_FLAGS () {{ 0, 0, 0, 0, 0, 0, 0, 0, 0};}' unless defined(&PMC_DEBUG_DEFAULT_FLAGS);
	    eval 'sub PMCDBG0 {
	        my($M, $N, $L, $F) = @_;
    		eval q( &do {  &if ( ($pmc_debugflags->{pdb_})  $M & (1<<  &PMC_DEBUG_MIN_  $N))  &CTR0( &KTR_PMC, $M \\":\\" $N \\":\\" $L \\": \\" $F); }  &while (0));
	    }' unless defined(&PMCDBG0);
	    eval 'sub PMCDBG1 {
	        my($M, $N, $L, $F, $p1) = @_;
    		eval q( &do {  &if ( ($pmc_debugflags->{pdb_})  $M & (1<<  &PMC_DEBUG_MIN_  $N))  &CTR1( &KTR_PMC, $M \\":\\" $N \\":\\" $L \\": \\" $F, $p1); }  &while (0));
	    }' unless defined(&PMCDBG1);
	    eval 'sub PMCDBG2 {
	        my($M, $N, $L, $F, $p1, $p2) = @_;
    		eval q( &do {  &if ( ($pmc_debugflags->{pdb_})  $M & (1<<  &PMC_DEBUG_MIN_  $N))  &CTR2( &KTR_PMC, $M \\":\\" $N \\":\\" $L \\": \\" $F, $p1, $p2); }  &while (0));
	    }' unless defined(&PMCDBG2);
	    eval 'sub PMCDBG3 {
	        my($M, $N, $L, $F, $p1, $p2, $p3) = @_;
    		eval q( &do {  &if ( ($pmc_debugflags->{pdb_})  $M & (1<<  &PMC_DEBUG_MIN_  $N))  &CTR3( &KTR_PMC, $M \\":\\" $N \\":\\" $L \\": \\" $F, $p1, $p2, $p3); }  &while (0));
	    }' unless defined(&PMCDBG3);
	    eval 'sub PMCDBG4 {
	        my($M, $N, $L, $F, $p1, $p2, $p3, $p4) = @_;
    		eval q( &do {  &if ( ($pmc_debugflags->{pdb_})  $M & (1<<  &PMC_DEBUG_MIN_  $N))  &CTR4( &KTR_PMC, $M \\":\\" $N \\":\\" $L \\": \\" $F, $p1, $p2, $p3, $p4);}  &while (0));
	    }' unless defined(&PMCDBG4);
	    eval 'sub PMCDBG5 {
	        my($M, $N, $L, $F, $p1, $p2, $p3, $p4, $p5) = @_;
    		eval q( &do {  &if ( ($pmc_debugflags->{pdb_})  $M & (1<<  &PMC_DEBUG_MIN_  $N))  &CTR5( &KTR_PMC, $M \\":\\" $N \\":\\" $L \\": \\" $F, $p1, $p2, $p3, $p4, $p5); }  &while (0));
	    }' unless defined(&PMCDBG5);
	    eval 'sub PMCDBG6 {
	        my($M, $N, $L, $F, $p1, $p2, $p3, $p4, $p5, $p6) = @_;
    		eval q( &do {  &if ( ($pmc_debugflags->{pdb_})  $M & (1<<  &PMC_DEBUG_MIN_  $N))  &CTR6( &KTR_PMC, $M \\":\\" $N \\":\\" $L \\": \\" $F, $p1, $p2, $p3, $p4, $p5, $p6); }  &while (0));
	    }' unless defined(&PMCDBG6);
	    eval 'sub PMC_DEBUG_MAJ_CPU () {0;}' unless defined(&PMC_DEBUG_MAJ_CPU);
	    eval 'sub PMC_DEBUG_MAJ_CSW () {1;}' unless defined(&PMC_DEBUG_MAJ_CSW);
	    eval 'sub PMC_DEBUG_MAJ_LOG () {2;}' unless defined(&PMC_DEBUG_MAJ_LOG);
	    eval 'sub PMC_DEBUG_MAJ_MDP () {3;}' unless defined(&PMC_DEBUG_MAJ_MDP);
	    eval 'sub PMC_DEBUG_MAJ_MOD () {4;}' unless defined(&PMC_DEBUG_MAJ_MOD);
	    eval 'sub PMC_DEBUG_MAJ_OWN () {5;}' unless defined(&PMC_DEBUG_MAJ_OWN);
	    eval 'sub PMC_DEBUG_MAJ_PMC () {6;}' unless defined(&PMC_DEBUG_MAJ_PMC);
	    eval 'sub PMC_DEBUG_MAJ_PRC () {7;}' unless defined(&PMC_DEBUG_MAJ_PRC);
	    eval 'sub PMC_DEBUG_MAJ_SAM () {8;}' unless defined(&PMC_DEBUG_MAJ_SAM);
	    eval 'sub PMC_DEBUG_MIN_ALL () {0;}' unless defined(&PMC_DEBUG_MIN_ALL);
	    eval 'sub PMC_DEBUG_MIN_REL () {1;}' unless defined(&PMC_DEBUG_MIN_REL);
	    eval 'sub PMC_DEBUG_MIN_OPS () {2;}' unless defined(&PMC_DEBUG_MIN_OPS);
	    eval 'sub PMC_DEBUG_MIN_INI () {3;}' unless defined(&PMC_DEBUG_MIN_INI);
	    eval 'sub PMC_DEBUG_MIN_FND () {4;}' unless defined(&PMC_DEBUG_MIN_FND);
	    eval 'sub PMC_DEBUG_MIN_PMH () {14;}' unless defined(&PMC_DEBUG_MIN_PMH);
	    eval 'sub PMC_DEBUG_MIN_PMS () {15;}' unless defined(&PMC_DEBUG_MIN_PMS);
	    eval 'sub PMC_DEBUG_MIN_ORM () {8;}' unless defined(&PMC_DEBUG_MIN_ORM);
	    eval 'sub PMC_DEBUG_MIN_OMR () {9;}' unless defined(&PMC_DEBUG_MIN_OMR);
	    eval 'sub PMC_DEBUG_MIN_TLK () {8;}' unless defined(&PMC_DEBUG_MIN_TLK);
	    eval 'sub PMC_DEBUG_MIN_TUL () {9;}' unless defined(&PMC_DEBUG_MIN_TUL);
	    eval 'sub PMC_DEBUG_MIN_EXT () {10;}' unless defined(&PMC_DEBUG_MIN_EXT);
	    eval 'sub PMC_DEBUG_MIN_EXC () {11;}' unless defined(&PMC_DEBUG_MIN_EXC);
	    eval 'sub PMC_DEBUG_MIN_FRK () {12;}' unless defined(&PMC_DEBUG_MIN_FRK);
	    eval 'sub PMC_DEBUG_MIN_ATT () {13;}' unless defined(&PMC_DEBUG_MIN_ATT);
	    eval 'sub PMC_DEBUG_MIN_SIG () {14;}' unless defined(&PMC_DEBUG_MIN_SIG);
	    eval 'sub PMC_DEBUG_MIN_SWI () {8;}' unless defined(&PMC_DEBUG_MIN_SWI);
	    eval 'sub PMC_DEBUG_MIN_SWO () {9;}' unless defined(&PMC_DEBUG_MIN_SWO);
	    eval 'sub PMC_DEBUG_MIN_REG () {8;}' unless defined(&PMC_DEBUG_MIN_REG);
	    eval 'sub PMC_DEBUG_MIN_ALR () {9;}' unless defined(&PMC_DEBUG_MIN_ALR);
	    eval 'sub PMC_DEBUG_MIN_REA () {8;}' unless defined(&PMC_DEBUG_MIN_REA);
	    eval 'sub PMC_DEBUG_MIN_WRI () {9;}' unless defined(&PMC_DEBUG_MIN_WRI);
	    eval 'sub PMC_DEBUG_MIN_CFG () {10;}' unless defined(&PMC_DEBUG_MIN_CFG);
	    eval 'sub PMC_DEBUG_MIN_STA () {11;}' unless defined(&PMC_DEBUG_MIN_STA);
	    eval 'sub PMC_DEBUG_MIN_STO () {12;}' unless defined(&PMC_DEBUG_MIN_STO);
	    eval 'sub PMC_DEBUG_MIN_INT () {13;}' unless defined(&PMC_DEBUG_MIN_INT);
	    eval 'sub PMC_DEBUG_MIN_BND () {8;}' unless defined(&PMC_DEBUG_MIN_BND);
	    eval 'sub PMC_DEBUG_MIN_SEL () {9;}' unless defined(&PMC_DEBUG_MIN_SEL);
	    eval 'sub PMC_DEBUG_MIN_GTB () {8;}' unless defined(&PMC_DEBUG_MIN_GTB);
	    eval 'sub PMC_DEBUG_MIN_SIO () {9;}' unless defined(&PMC_DEBUG_MIN_SIO);
	    eval 'sub PMC_DEBUG_MIN_FLS () {10;}' unless defined(&PMC_DEBUG_MIN_FLS);
	    eval 'sub PMC_DEBUG_MIN_SAM () {11;}' unless defined(&PMC_DEBUG_MIN_SAM);
	    eval 'sub PMC_DEBUG_MIN_CLO () {12;}' unless defined(&PMC_DEBUG_MIN_CLO);
	} else {
	    eval 'sub __pmcdbg_used () { &__unused;}' unless defined(&__pmcdbg_used);
	    eval 'sub PMCDBG0 {
	        my($M, $N, $L, $F) = @_;
    		eval q();
	    }' unless defined(&PMCDBG0);
	    eval 'sub PMCDBG1 {
	        my($M, $N, $L, $F, $p1) = @_;
    		eval q();
	    }' unless defined(&PMCDBG1);
	    eval 'sub PMCDBG2 {
	        my($M, $N, $L, $F, $p1, $p2) = @_;
    		eval q();
	    }' unless defined(&PMCDBG2);
	    eval 'sub PMCDBG3 {
	        my($M, $N, $L, $F, $p1, $p2, $p3) = @_;
    		eval q();
	    }' unless defined(&PMCDBG3);
	    eval 'sub PMCDBG4 {
	        my($M, $N, $L, $F, $p1, $p2, $p3, $p4) = @_;
    		eval q();
	    }' unless defined(&PMCDBG4);
	    eval 'sub PMCDBG5 {
	        my($M, $N, $L, $F, $p1, $p2, $p3, $p4, $p5) = @_;
    		eval q();
	    }' unless defined(&PMCDBG5);
	    eval 'sub PMCDBG6 {
	        my($M, $N, $L, $F, $p1, $p2, $p3, $p4, $p5, $p6) = @_;
    		eval q();
	    }' unless defined(&PMCDBG6);
	}
    }
}
1;

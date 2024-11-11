require '_h2ph_pre.ph';

no warnings qw(redefine misc);

unless(defined(&_SYS_PMCKERN_H_)) {
    eval 'sub _SYS_PMCKERN_H_ () {1;}' unless defined(&_SYS_PMCKERN_H_);
    require 'sys/param.ph';
    require 'sys/systm.ph';
    require 'sys/kernel.ph';
    require 'sys/lock.ph';
    require 'sys/proc.ph';
    require 'sys/sx.ph';
    require 'sys/pmc.ph';
    require 'machine/cpufunc.ph';
    eval 'sub PMC_FN_PROCESS_EXEC () {1;}' unless defined(&PMC_FN_PROCESS_EXEC);
    eval 'sub PMC_FN_CSW_IN () {2;}' unless defined(&PMC_FN_CSW_IN);
    eval 'sub PMC_FN_CSW_OUT () {3;}' unless defined(&PMC_FN_CSW_OUT);
    eval 'sub PMC_FN_DO_SAMPLES () {4;}' unless defined(&PMC_FN_DO_SAMPLES);
    eval 'sub PMC_FN_UNUSED1 () {5;}' unless defined(&PMC_FN_UNUSED1);
    eval 'sub PMC_FN_UNUSED2 () {6;}' unless defined(&PMC_FN_UNUSED2);
    eval 'sub PMC_FN_MMAP () {7;}' unless defined(&PMC_FN_MMAP);
    eval 'sub PMC_FN_MUNMAP () {8;}' unless defined(&PMC_FN_MUNMAP);
    eval 'sub PMC_FN_USER_CALLCHAIN () {9;}' unless defined(&PMC_FN_USER_CALLCHAIN);
    eval 'sub PMC_FN_USER_CALLCHAIN_SOFT () {10;}' unless defined(&PMC_FN_USER_CALLCHAIN_SOFT);
    eval 'sub PMC_FN_SOFT_SAMPLING () {11;}' unless defined(&PMC_FN_SOFT_SAMPLING);
    eval 'sub PMC_FN_THR_CREATE () {12;}' unless defined(&PMC_FN_THR_CREATE);
    eval 'sub PMC_FN_THR_EXIT () {13;}' unless defined(&PMC_FN_THR_EXIT);
    eval 'sub PMC_FN_THR_USERRET () {14;}' unless defined(&PMC_FN_THR_USERRET);
    eval 'sub PMC_FN_THR_CREATE_LOG () {15;}' unless defined(&PMC_FN_THR_CREATE_LOG);
    eval 'sub PMC_FN_THR_EXIT_LOG () {16;}' unless defined(&PMC_FN_THR_EXIT_LOG);
    eval 'sub PMC_FN_PROC_CREATE_LOG () {17;}' unless defined(&PMC_FN_PROC_CREATE_LOG);
    eval("sub PMC_HR () { 0; }") unless defined(&PMC_HR);
    eval("sub PMC_SR () { 1; }") unless defined(&PMC_SR);
    eval("sub PMC_UR () { 2; }") unless defined(&PMC_UR);
    eval("sub PMC_NUM_SR () { PMC_UR+1; }") unless defined(&PMC_NUM_SR);
    eval 'sub PMC_SOFT_DEFINE_EX {
        my($prov, $mod, $func, $name, $alloc, $release) = @_;
	    eval q(\'struct pmc_soft\'  &pmc_$prov &_$mod &_$func &_$name = { 0, $alloc, $release, { $prov \\"_\\" $mod \\"_\\" $func \\".\\" $name, 0} };  &SYSINIT( &pmc_$prov &_$mod &_$func &_$name &_init,  &SI_SUB_KDTRACE,  &SI_ORDER_SECOND + 1,  &pmc_soft_ev_register,  &pmc_$prov &_$mod &_$func &_$name );  &SYSUNINIT( &pmc_$prov &_$mod &_$func &_$name &_uninit,  &SI_SUB_KDTRACE,  &SI_ORDER_SECOND + 1,  &pmc_soft_ev_deregister,  &pmc_$prov &_$mod &_$func &_$name ));
    }' unless defined(&PMC_SOFT_DEFINE_EX);
    eval 'sub PMC_SOFT_DEFINE {
        my($prov, $mod, $func, $name) = @_;
	    eval q( &PMC_SOFT_DEFINE_EX($prov, $mod, $func, $name,  &NULL,  &NULL));
    }' unless defined(&PMC_SOFT_DEFINE);
    eval 'sub PMC_SOFT_DECLARE {
        my($prov, $mod, $func, $name) = @_;
	    eval q( &extern \'struct pmc_soft\'  &pmc_$prov &_$mod &_$func &_$name);
    }' unless defined(&PMC_SOFT_DECLARE);
    if(defined(&PMC_FAKE_TRAPFRAME)) {
	eval 'sub PMC_SOFT_CALL {
	    my($pr, $mo, $fu, $na) = @_;
    	    eval q( &do {  &if ( &__predict_false( &pmc_$pr &_$mo &_$fu &_ ($na->{ps_running}))) { \'struct pmckern_soft\'  &ks;  &register_t  &intr;  &intr =  &intr_disable();  &PMC_FAKE_TRAPFRAME( $pmc_tf[ &curcpu]);  ($ks->{pm_ev}) =  &pmc_$pr &_$mo &_$fu &_ ($na->{ps_ev}->{pm_ev_code});  ($ks->{pm_cpu}) =  &PCPU_GET( &cpuid);  ($ks->{pm_tf}) =  $pmc_tf[ &curcpu];  &PMC_CALL_HOOK_UNLOCKED( &curthread,  &PMC_FN_SOFT_SAMPLING, ( &void *)  &ks);  &intr_restore( &intr); } }  &while (0));
	}' unless defined(&PMC_SOFT_CALL);
    } else {
	eval 'sub PMC_SOFT_CALL {
	    my($pr, $mo, $fu, $na) = @_;
    	    eval q( &do { }  &while (0));
	}' unless defined(&PMC_SOFT_CALL);
    }
    eval 'sub PMC_SOFT_CALL_TF {
        my($pr, $mo, $fu, $na, $tf) = @_;
	    eval q( &do {  &if ( &__predict_false( &pmc_$pr &_$mo &_$fu &_ ($na->{ps_running}))) { \'struct pmckern_soft\'  &ks;  &register_t  &intr;  &intr =  &intr_disable();  ($ks->{pm_ev}) =  &pmc_$pr &_$mo &_$fu &_ ($na->{ps_ev}->{pm_ev_code});  ($ks->{pm_cpu}) =  &PCPU_GET( &cpuid);  ($ks->{pm_tf}) = $tf;  &PMC_CALL_HOOK_UNLOCKED( &curthread,  &PMC_FN_SOFT_SAMPLING, ( &void *)  &ks);  &intr_restore( &intr); } }  &while (0));
    }' unless defined(&PMC_SOFT_CALL_TF);
    eval 'sub PMC_HOOK_INSTALLED {
        my($cmd) = @_;
	    eval q( &__predict_false( &pmc_hook !=  &NULL));
    }' unless defined(&PMC_HOOK_INSTALLED);
    eval 'sub PMC_CALL_HOOK {
        my($t, $cmd, $arg) = @_;
	    eval q( &do { \'struct epoch_tracker\'  &et;  &epoch_enter_preempt( &global_epoch_preempt,  &et);  &if ( &pmc_hook !=  &NULL) ( &pmc_hook)(($t), ($cmd), ($arg));  &epoch_exit_preempt( &global_epoch_preempt,  &et); }  &while (0));
    }' unless defined(&PMC_CALL_HOOK);
    eval 'sub PMC_CALL_HOOK_X {
        my($t, $cmd, $arg) = @_;
	    eval q( &do {  &sx_xlock( &pmc_sx);  &if ( &pmc_hook !=  &NULL) ( &pmc_hook)(($t), ($cmd), ($arg));  &sx_xunlock( &pmc_sx); }  &while (0));
    }' unless defined(&PMC_CALL_HOOK_X);
    eval 'sub PMC_CALL_HOOK_UNLOCKED {
        my($t, $cmd, $arg) = @_;
	    eval q( &do {  &if ( &pmc_hook !=  &NULL) ( &pmc_hook)(($t), ($cmd), ($arg)); }  &while (0));
    }' unless defined(&PMC_CALL_HOOK_UNLOCKED);
    eval 'sub PMC_SWITCH_CONTEXT {
        my($t,$cmd) = @_;
	    eval q( &PMC_CALL_HOOK_UNLOCKED($t,$cmd, &NULL));
    }' unless defined(&PMC_SWITCH_CONTEXT);
    eval 'sub PMC_PROC_IS_USING_PMCS {
        my($p) = @_;
	    eval q(( &__predict_false( ($p->{p_flag}) &  &P_HWPMC)));
    }' unless defined(&PMC_PROC_IS_USING_PMCS);
    eval 'sub PMC_THREAD_HAS_SAMPLES {
        my($td) = @_;
	    eval q(( &__predict_false(($td)-> &td_pmcpend)));
    }' unless defined(&PMC_THREAD_HAS_SAMPLES);
    eval 'sub PMC_IS_PENDING_CALLCHAIN {
        my($p) = @_;
	    eval q(( &__predict_false(($p)-> &td_pflags &  &TDP_CALLCHAIN)));
    }' unless defined(&PMC_IS_PENDING_CALLCHAIN);
    eval 'sub PMC_SYSTEM_SAMPLING_ACTIVE () {
        eval q(( &pmc_ss_count > 0));
    }' unless defined(&PMC_SYSTEM_SAMPLING_ACTIVE);
    eval 'sub PMC_CPU_HAS_SAMPLES {
        my($C) = @_;
	    eval q(( &__predict_false( &DPCPU_ID_GET(($C),  &pmc_sampled))));
    }' unless defined(&PMC_CPU_HAS_SAMPLES);
    if(defined(&INVARIANTS)) {
    }
}
1;

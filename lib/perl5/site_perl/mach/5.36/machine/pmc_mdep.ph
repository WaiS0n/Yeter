require '_h2ph_pre.ph';

no warnings qw(redefine misc);

unless(defined(&_MACHINE_PMC_MDEP_H)) {
    eval 'sub _MACHINE_PMC_MDEP_H () {1;}' unless defined(&_MACHINE_PMC_MDEP_H);
    if(defined(&_KERNEL)) {
    }
    require 'dev/hwpmc/hwpmc_amd.ph';
    require 'dev/hwpmc/hwpmc_core.ph';
    require 'dev/hwpmc/hwpmc_tsc.ph';
    require 'dev/hwpmc/hwpmc_uncore.ph';
    eval 'sub PMC_MDEP_CLASS_INDEX_TSC () {1;}' unless defined(&PMC_MDEP_CLASS_INDEX_TSC);
    eval 'sub PMC_MDEP_CLASS_INDEX_K8 () {2;}' unless defined(&PMC_MDEP_CLASS_INDEX_K8);
    eval 'sub PMC_MDEP_CLASS_INDEX_P4 () {2;}' unless defined(&PMC_MDEP_CLASS_INDEX_P4);
    eval 'sub PMC_MDEP_CLASS_INDEX_IAP () {2;}' unless defined(&PMC_MDEP_CLASS_INDEX_IAP);
    eval 'sub PMC_MDEP_CLASS_INDEX_IAF () {3;}' unless defined(&PMC_MDEP_CLASS_INDEX_IAF);
    eval 'sub PMC_MDEP_CLASS_INDEX_UCP () {4;}' unless defined(&PMC_MDEP_CLASS_INDEX_UCP);
    eval 'sub PMC_MDEP_CLASS_INDEX_UCF () {5;}' unless defined(&PMC_MDEP_CLASS_INDEX_UCF);
    eval 'sub PMCLOG_READADDR () { &PMCLOG_READ64;}' unless defined(&PMCLOG_READADDR);
    eval 'sub PMCLOG_EMITADDR () { &PMCLOG_EMIT64;}' unless defined(&PMCLOG_EMITADDR);
    if(defined(&_KERNEL)) {
	eval 'sub PMC_TRAPFRAME_TO_PC {
	    my($TF) = @_;
    	    eval q((($TF)-> &tf_rip));
	}' unless defined(&PMC_TRAPFRAME_TO_PC);
	eval 'sub PMC_TRAPFRAME_TO_FP {
	    my($TF) = @_;
    	    eval q((($TF)-> &tf_rbp));
	}' unless defined(&PMC_TRAPFRAME_TO_FP);
	eval 'sub PMC_TRAPFRAME_TO_USER_SP {
	    my($TF) = @_;
    	    eval q((($TF)-> &tf_rsp));
	}' unless defined(&PMC_TRAPFRAME_TO_USER_SP);
	eval 'sub PMC_TRAPFRAME_TO_KERNEL_SP {
	    my($TF) = @_;
    	    eval q((($TF)-> &tf_rsp));
	}' unless defined(&PMC_TRAPFRAME_TO_KERNEL_SP);
	eval 'sub PMC_AT_FUNCTION_PROLOGUE_PUSH_BP {
	    my($I) = @_;
    	    eval q(((($I) & 0xffffffff) == 0xe5894855));
	}' unless defined(&PMC_AT_FUNCTION_PROLOGUE_PUSH_BP);
	eval 'sub PMC_AT_FUNCTION_PROLOGUE_MOV_SP_BP {
	    my($I) = @_;
    	    eval q(((($I) & 0xffffff) == 0xe58948));
	}' unless defined(&PMC_AT_FUNCTION_PROLOGUE_MOV_SP_BP);
	eval 'sub PMC_AT_FUNCTION_EPILOGUE_RET {
	    my($I) = @_;
    	    eval q(((($I) & 0xff) == 0xc3));
	}' unless defined(&PMC_AT_FUNCTION_EPILOGUE_RET);
	eval 'sub PMC_IN_TRAP_HANDLER {
	    my($PC) = @_;
    	    eval q((($PC) >= ( &uintptr_t)  &start_exceptions  && ($PC) < ( &uintptr_t)  &end_exceptions));
	}' unless defined(&PMC_IN_TRAP_HANDLER);
	eval 'sub PMC_IN_KERNEL_STACK {
	    my($va) = @_;
    	    eval q( &kstack_contains( &curthread, ($va), $sizeof{$va}));
	}' unless defined(&PMC_IN_KERNEL_STACK);
	eval 'sub PMC_IN_KERNEL {
	    my($va) = @_;
    	    eval q( &INKERNEL($va));
	}' unless defined(&PMC_IN_KERNEL);
	eval 'sub PMC_IN_USERSPACE {
	    my($va) = @_;
    	    eval q((($va) <=  &VM_MAXUSER_ADDRESS));
	}' unless defined(&PMC_IN_USERSPACE);
	eval 'sub PMC_FAKE_TRAPFRAME {
	    my($TF) = @_;
    	    eval q( &do { ($TF)-> &tf_cs = 0; ($TF)-> &tf_rflags = 0;  &__asm  &__volatile(\\"movq %%rbp,%0\\" : \\"=r\\" (($TF)-> &tf_rbp));  &__asm  &__volatile(\\"movq %%rsp,%0\\" : \\"=r\\" (($TF)-> &tf_rsp));  &__asm  &__volatile(\\"call 1f \\\\n\\\\t1: pop %0\\" : \\"=r\\"(($TF)-> &tf_rip)); }  &while (0));
	}' unless defined(&PMC_FAKE_TRAPFRAME);
    }
}
1;

require '_h2ph_pre.ph';

no warnings qw(redefine misc);

unless(defined(&_VMM_H_)) {
    eval 'sub _VMM_H_ () {1;}' unless defined(&_VMM_H_);
    require 'sys/cpuset.ph';
    require 'sys/sdt.ph';
    require 'x86/segments.ph';
    if(defined(&_KERNEL)) {
    }
    eval("sub VM_SUSPEND_NONE () { 0; }") unless defined(&VM_SUSPEND_NONE);
    eval("sub VM_SUSPEND_RESET () { 1; }") unless defined(&VM_SUSPEND_RESET);
    eval("sub VM_SUSPEND_POWEROFF () { 2; }") unless defined(&VM_SUSPEND_POWEROFF);
    eval("sub VM_SUSPEND_HALT () { 3; }") unless defined(&VM_SUSPEND_HALT);
    eval("sub VM_SUSPEND_TRIPLEFAULT () { 4; }") unless defined(&VM_SUSPEND_TRIPLEFAULT);
    eval("sub VM_SUSPEND_LAST () { 5; }") unless defined(&VM_SUSPEND_LAST);
    eval("sub VM_REG_GUEST_RAX () { 0; }") unless defined(&VM_REG_GUEST_RAX);
    eval("sub VM_REG_GUEST_RBX () { 1; }") unless defined(&VM_REG_GUEST_RBX);
    eval("sub VM_REG_GUEST_RCX () { 2; }") unless defined(&VM_REG_GUEST_RCX);
    eval("sub VM_REG_GUEST_RDX () { 3; }") unless defined(&VM_REG_GUEST_RDX);
    eval("sub VM_REG_GUEST_RSI () { 4; }") unless defined(&VM_REG_GUEST_RSI);
    eval("sub VM_REG_GUEST_RDI () { 5; }") unless defined(&VM_REG_GUEST_RDI);
    eval("sub VM_REG_GUEST_RBP () { 6; }") unless defined(&VM_REG_GUEST_RBP);
    eval("sub VM_REG_GUEST_R8 () { 7; }") unless defined(&VM_REG_GUEST_R8);
    eval("sub VM_REG_GUEST_R9 () { 8; }") unless defined(&VM_REG_GUEST_R9);
    eval("sub VM_REG_GUEST_R10 () { 9; }") unless defined(&VM_REG_GUEST_R10);
    eval("sub VM_REG_GUEST_R11 () { 10; }") unless defined(&VM_REG_GUEST_R11);
    eval("sub VM_REG_GUEST_R12 () { 11; }") unless defined(&VM_REG_GUEST_R12);
    eval("sub VM_REG_GUEST_R13 () { 12; }") unless defined(&VM_REG_GUEST_R13);
    eval("sub VM_REG_GUEST_R14 () { 13; }") unless defined(&VM_REG_GUEST_R14);
    eval("sub VM_REG_GUEST_R15 () { 14; }") unless defined(&VM_REG_GUEST_R15);
    eval("sub VM_REG_GUEST_CR0 () { 15; }") unless defined(&VM_REG_GUEST_CR0);
    eval("sub VM_REG_GUEST_CR3 () { 16; }") unless defined(&VM_REG_GUEST_CR3);
    eval("sub VM_REG_GUEST_CR4 () { 17; }") unless defined(&VM_REG_GUEST_CR4);
    eval("sub VM_REG_GUEST_DR7 () { 18; }") unless defined(&VM_REG_GUEST_DR7);
    eval("sub VM_REG_GUEST_RSP () { 19; }") unless defined(&VM_REG_GUEST_RSP);
    eval("sub VM_REG_GUEST_RIP () { 20; }") unless defined(&VM_REG_GUEST_RIP);
    eval("sub VM_REG_GUEST_RFLAGS () { 21; }") unless defined(&VM_REG_GUEST_RFLAGS);
    eval("sub VM_REG_GUEST_ES () { 22; }") unless defined(&VM_REG_GUEST_ES);
    eval("sub VM_REG_GUEST_CS () { 23; }") unless defined(&VM_REG_GUEST_CS);
    eval("sub VM_REG_GUEST_SS () { 24; }") unless defined(&VM_REG_GUEST_SS);
    eval("sub VM_REG_GUEST_DS () { 25; }") unless defined(&VM_REG_GUEST_DS);
    eval("sub VM_REG_GUEST_FS () { 26; }") unless defined(&VM_REG_GUEST_FS);
    eval("sub VM_REG_GUEST_GS () { 27; }") unless defined(&VM_REG_GUEST_GS);
    eval("sub VM_REG_GUEST_LDTR () { 28; }") unless defined(&VM_REG_GUEST_LDTR);
    eval("sub VM_REG_GUEST_TR () { 29; }") unless defined(&VM_REG_GUEST_TR);
    eval("sub VM_REG_GUEST_IDTR () { 30; }") unless defined(&VM_REG_GUEST_IDTR);
    eval("sub VM_REG_GUEST_GDTR () { 31; }") unless defined(&VM_REG_GUEST_GDTR);
    eval("sub VM_REG_GUEST_EFER () { 32; }") unless defined(&VM_REG_GUEST_EFER);
    eval("sub VM_REG_GUEST_CR2 () { 33; }") unless defined(&VM_REG_GUEST_CR2);
    eval("sub VM_REG_GUEST_PDPTE0 () { 34; }") unless defined(&VM_REG_GUEST_PDPTE0);
    eval("sub VM_REG_GUEST_PDPTE1 () { 35; }") unless defined(&VM_REG_GUEST_PDPTE1);
    eval("sub VM_REG_GUEST_PDPTE2 () { 36; }") unless defined(&VM_REG_GUEST_PDPTE2);
    eval("sub VM_REG_GUEST_PDPTE3 () { 37; }") unless defined(&VM_REG_GUEST_PDPTE3);
    eval("sub VM_REG_GUEST_INTR_SHADOW () { 38; }") unless defined(&VM_REG_GUEST_INTR_SHADOW);
    eval("sub VM_REG_GUEST_DR0 () { 39; }") unless defined(&VM_REG_GUEST_DR0);
    eval("sub VM_REG_GUEST_DR1 () { 40; }") unless defined(&VM_REG_GUEST_DR1);
    eval("sub VM_REG_GUEST_DR2 () { 41; }") unless defined(&VM_REG_GUEST_DR2);
    eval("sub VM_REG_GUEST_DR3 () { 42; }") unless defined(&VM_REG_GUEST_DR3);
    eval("sub VM_REG_GUEST_DR6 () { 43; }") unless defined(&VM_REG_GUEST_DR6);
    eval("sub VM_REG_GUEST_ENTRY_INST_LENGTH () { 44; }") unless defined(&VM_REG_GUEST_ENTRY_INST_LENGTH);
    eval("sub VM_REG_GUEST_FS_BASE () { 45; }") unless defined(&VM_REG_GUEST_FS_BASE);
    eval("sub VM_REG_GUEST_GS_BASE () { 46; }") unless defined(&VM_REG_GUEST_GS_BASE);
    eval("sub VM_REG_GUEST_KGS_BASE () { 47; }") unless defined(&VM_REG_GUEST_KGS_BASE);
    eval("sub VM_REG_GUEST_TPR () { 48; }") unless defined(&VM_REG_GUEST_TPR);
    eval("sub VM_REG_LAST () { 49; }") unless defined(&VM_REG_LAST);
    eval("sub X2APIC_DISABLED () { 0; }") unless defined(&X2APIC_DISABLED);
    eval("sub X2APIC_ENABLED () { 1; }") unless defined(&X2APIC_ENABLED);
    eval("sub X2APIC_STATE_LAST () { 2; }") unless defined(&X2APIC_STATE_LAST);
    eval 'sub VM_INTINFO_VECTOR {
        my($info) = @_;
	    eval q((($info) & 0xff));
    }' unless defined(&VM_INTINFO_VECTOR);
    eval 'sub VM_INTINFO_DEL_ERRCODE () {0x800;}' unless defined(&VM_INTINFO_DEL_ERRCODE);
    eval 'sub VM_INTINFO_RSVD () {0x7ffff000;}' unless defined(&VM_INTINFO_RSVD);
    eval 'sub VM_INTINFO_VALID () {0x80000000;}' unless defined(&VM_INTINFO_VALID);
    eval 'sub VM_INTINFO_TYPE () {0x700;}' unless defined(&VM_INTINFO_TYPE);
    eval 'sub VM_INTINFO_HWINTR () {(0<< 8);}' unless defined(&VM_INTINFO_HWINTR);
    eval 'sub VM_INTINFO_NMI () {(2<< 8);}' unless defined(&VM_INTINFO_NMI);
    eval 'sub VM_INTINFO_HWEXCEPTION () {(3<< 8);}' unless defined(&VM_INTINFO_HWEXCEPTION);
    eval 'sub VM_INTINFO_SWINTR () {(4<< 8);}' unless defined(&VM_INTINFO_SWINTR);
    eval 'sub VM_MAX_PREFIXLEN () {10;}' unless defined(&VM_MAX_PREFIXLEN);
    eval 'sub VM_MAX_SUFFIXLEN () {15;}' unless defined(&VM_MAX_SUFFIXLEN);
    eval 'sub VM_MIN_NAMELEN () {6;}' unless defined(&VM_MIN_NAMELEN);
    eval 'sub VM_MAX_NAMELEN () {( &SPECNAMELEN -  &VM_MAX_PREFIXLEN -  &VM_MAX_SUFFIXLEN - 1);}' unless defined(&VM_MAX_NAMELEN);
    if(defined(&_KERNEL)) {
	if(defined(&_SYS__CPUSET_H_)) {
	}
	eval 'sub vcpu_rendezvous_pending {
	    my($vcpu,$info) = @_;
    	    eval q({ ( &CPU_ISSET( &vcpu_vcpuid($vcpu),  ($info->{rptr}))); });
	}' unless defined(&vcpu_rendezvous_pending);
	eval 'sub vcpu_suspended {
	    my($info) = @_;
    	    eval q({ (* ($info->{sptr})); });
	}' unless defined(&vcpu_suspended);
	eval 'sub vcpu_reqidle {
	    my($info) = @_;
    	    eval q({ (* ($info->{iptr})); });
	}' unless defined(&vcpu_reqidle);
	eval("sub VCPU_IDLE () { 0; }") unless defined(&VCPU_IDLE);
	eval("sub VCPU_FROZEN () { 1; }") unless defined(&VCPU_FROZEN);
	eval("sub VCPU_RUNNING () { 2; }") unless defined(&VCPU_RUNNING);
	eval("sub VCPU_SLEEPING () { 3; }") unless defined(&VCPU_SLEEPING);
	if(defined(&_SYS_PROC_H_)) {
	}
    }
    eval("sub VM_CAP_HALT_EXIT () { 0; }") unless defined(&VM_CAP_HALT_EXIT);
    eval("sub VM_CAP_MTRAP_EXIT () { 1; }") unless defined(&VM_CAP_MTRAP_EXIT);
    eval("sub VM_CAP_PAUSE_EXIT () { 2; }") unless defined(&VM_CAP_PAUSE_EXIT);
    eval("sub VM_CAP_UNRESTRICTED_GUEST () { 3; }") unless defined(&VM_CAP_UNRESTRICTED_GUEST);
    eval("sub VM_CAP_ENABLE_INVPCID () { 4; }") unless defined(&VM_CAP_ENABLE_INVPCID);
    eval("sub VM_CAP_BPT_EXIT () { 5; }") unless defined(&VM_CAP_BPT_EXIT);
    eval("sub VM_CAP_RDPID () { 6; }") unless defined(&VM_CAP_RDPID);
    eval("sub VM_CAP_RDTSCP () { 7; }") unless defined(&VM_CAP_RDTSCP);
    eval("sub VM_CAP_IPI_EXIT () { 8; }") unless defined(&VM_CAP_IPI_EXIT);
    eval("sub VM_CAP_MASK_HWINTR () { 9; }") unless defined(&VM_CAP_MASK_HWINTR);
    eval("sub VM_CAP_RFLAGS_TF () { 10; }") unless defined(&VM_CAP_RFLAGS_TF);
    eval("sub VM_CAP_MAX () { 11; }") unless defined(&VM_CAP_MAX);
    eval("sub EDGE_TRIGGER () { 0; }") unless defined(&EDGE_TRIGGER);
    eval("sub LEVEL_TRIGGER () { 1; }") unless defined(&LEVEL_TRIGGER);
    eval 'sub SEG_DESC_TYPE {
        my($access) = @_;
	    eval q((($access) & 0x1f));
    }' unless defined(&SEG_DESC_TYPE);
    eval 'sub SEG_DESC_DPL {
        my($access) = @_;
	    eval q(((($access) >> 5) & 0x3));
    }' unless defined(&SEG_DESC_DPL);
    eval 'sub SEG_DESC_PRESENT {
        my($access) = @_;
	    eval q(((($access) & 0x80) ? 1: 0));
    }' unless defined(&SEG_DESC_PRESENT);
    eval 'sub SEG_DESC_DEF32 {
        my($access) = @_;
	    eval q(((($access) & 0x4000) ? 1: 0));
    }' unless defined(&SEG_DESC_DEF32);
    eval 'sub SEG_DESC_GRANULARITY {
        my($access) = @_;
	    eval q(((($access) & 0x8000) ? 1: 0));
    }' unless defined(&SEG_DESC_GRANULARITY);
    eval 'sub SEG_DESC_UNUSABLE {
        my($access) = @_;
	    eval q(((($access) & 0x10000) ? 1: 0));
    }' unless defined(&SEG_DESC_UNUSABLE);
    eval("sub CPU_MODE_REAL () { 0; }") unless defined(&CPU_MODE_REAL);
    eval("sub CPU_MODE_PROTECTED () { 1; }") unless defined(&CPU_MODE_PROTECTED);
    eval("sub CPU_MODE_COMPATIBILITY () { 2; }") unless defined(&CPU_MODE_COMPATIBILITY);
    eval("sub CPU_MODE_64BIT () { 3; }") unless defined(&CPU_MODE_64BIT);
    eval("sub PAGING_MODE_FLAT () { 0; }") unless defined(&PAGING_MODE_FLAT);
    eval("sub PAGING_MODE_32 () { 1; }") unless defined(&PAGING_MODE_32);
    eval("sub PAGING_MODE_PAE () { 2; }") unless defined(&PAGING_MODE_PAE);
    eval("sub PAGING_MODE_64 () { 3; }") unless defined(&PAGING_MODE_64);
    eval("sub PAGING_MODE_64_LA57 () { 4; }") unless defined(&PAGING_MODE_64_LA57);
    eval 'sub VIE_INST_SIZE () {15;}' unless defined(&VIE_INST_SIZE);
    eval 'sub vie_startzero () { &num_processed;}' unless defined(&vie_startzero);
    eval("sub VM_EXITCODE_INOUT () { 0; }") unless defined(&VM_EXITCODE_INOUT);
    eval("sub VM_EXITCODE_VMX () { 1; }") unless defined(&VM_EXITCODE_VMX);
    eval("sub VM_EXITCODE_BOGUS () { 2; }") unless defined(&VM_EXITCODE_BOGUS);
    eval("sub VM_EXITCODE_RDMSR () { 3; }") unless defined(&VM_EXITCODE_RDMSR);
    eval("sub VM_EXITCODE_WRMSR () { 4; }") unless defined(&VM_EXITCODE_WRMSR);
    eval("sub VM_EXITCODE_HLT () { 5; }") unless defined(&VM_EXITCODE_HLT);
    eval("sub VM_EXITCODE_MTRAP () { 6; }") unless defined(&VM_EXITCODE_MTRAP);
    eval("sub VM_EXITCODE_PAUSE () { 7; }") unless defined(&VM_EXITCODE_PAUSE);
    eval("sub VM_EXITCODE_PAGING () { 8; }") unless defined(&VM_EXITCODE_PAGING);
    eval("sub VM_EXITCODE_INST_EMUL () { 9; }") unless defined(&VM_EXITCODE_INST_EMUL);
    eval("sub VM_EXITCODE_SPINUP_AP () { 10; }") unless defined(&VM_EXITCODE_SPINUP_AP);
    eval("sub VM_EXITCODE_DEPRECATED1 () { 11; }") unless defined(&VM_EXITCODE_DEPRECATED1);
    eval("sub VM_EXITCODE_RENDEZVOUS () { 12; }") unless defined(&VM_EXITCODE_RENDEZVOUS);
    eval("sub VM_EXITCODE_IOAPIC_EOI () { 13; }") unless defined(&VM_EXITCODE_IOAPIC_EOI);
    eval("sub VM_EXITCODE_SUSPENDED () { 14; }") unless defined(&VM_EXITCODE_SUSPENDED);
    eval("sub VM_EXITCODE_INOUT_STR () { 15; }") unless defined(&VM_EXITCODE_INOUT_STR);
    eval("sub VM_EXITCODE_TASK_SWITCH () { 16; }") unless defined(&VM_EXITCODE_TASK_SWITCH);
    eval("sub VM_EXITCODE_MONITOR () { 17; }") unless defined(&VM_EXITCODE_MONITOR);
    eval("sub VM_EXITCODE_MWAIT () { 18; }") unless defined(&VM_EXITCODE_MWAIT);
    eval("sub VM_EXITCODE_SVM () { 19; }") unless defined(&VM_EXITCODE_SVM);
    eval("sub VM_EXITCODE_REQIDLE () { 20; }") unless defined(&VM_EXITCODE_REQIDLE);
    eval("sub VM_EXITCODE_DEBUG () { 21; }") unless defined(&VM_EXITCODE_DEBUG);
    eval("sub VM_EXITCODE_VMINSN () { 22; }") unless defined(&VM_EXITCODE_VMINSN);
    eval("sub VM_EXITCODE_BPT () { 23; }") unless defined(&VM_EXITCODE_BPT);
    eval("sub VM_EXITCODE_IPI () { 24; }") unless defined(&VM_EXITCODE_IPI);
    eval("sub VM_EXITCODE_DB () { 25; }") unless defined(&VM_EXITCODE_DB);
    eval("sub VM_EXITCODE_MAX () { 26; }") unless defined(&VM_EXITCODE_MAX);
    eval("sub TSR_CALL () { 0; }") unless defined(&TSR_CALL);
    eval("sub TSR_IRET () { 1; }") unless defined(&TSR_IRET);
    eval("sub TSR_JMP () { 2; }") unless defined(&TSR_JMP);
    eval("sub TSR_IDT_GATE () { 3; }") unless defined(&TSR_IDT_GATE);
    eval 'sub vm_inject_ud {
        my($vcpu) = @_;
	    eval q({  &vm_inject_fault($vcpu,  &IDT_UD, 0, 0); });
    }' unless defined(&vm_inject_ud);
    eval 'sub vm_inject_gp {
        my($vcpu) = @_;
	    eval q({  &vm_inject_fault($vcpu,  &IDT_GP, 1, 0); });
    }' unless defined(&vm_inject_gp);
    eval 'sub vm_inject_ac {
        my($vcpu,$errcode) = @_;
	    eval q({  &vm_inject_fault($vcpu,  &IDT_AC, 1, $errcode); });
    }' unless defined(&vm_inject_ac);
    eval 'sub vm_inject_ss {
        my($vcpu,$errcode) = @_;
	    eval q({  &vm_inject_fault($vcpu,  &IDT_SS, 1, $errcode); });
    }' unless defined(&vm_inject_ss);
}
1;

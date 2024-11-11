require '_h2ph_pre.ph';

no warnings qw(redefine misc);

if(defined(&__i386__)) {
    require 'i386/pcpu.ph';
} else {
    unless(defined(&_MACHINE_PCPU_H_)) {
	eval 'sub _MACHINE_PCPU_H_ () {1;}' unless defined(&_MACHINE_PCPU_H_);
	require 'machine/_pmap.ph';
	require 'machine/segments.ph';
	require 'machine/tss.ph';
	eval 'sub PC_PTI_STACK_SZ () {16;}' unless defined(&PC_PTI_STACK_SZ);
	eval 'sub PCPU_MD_FIELDS () {\'struct monitorbuf\'  &pc_monitorbuf  &__aligned(128); \'struct pcpu\' * &pc_prvspace; \'struct pmap\' * &pc_curpmap; \'struct amd64tss\' * &pc_tssp;  &void * &pc_pad0;  &uint64_t  &pc_kcr3;  &uint64_t  &pc_ucr3;  &uint64_t  &pc_saved_ucr3;  &register_t  &pc_rsp0;  &register_t  &pc_scratch_rsp;  &register_t  &pc_scratch_rax; \'u_int\'  &pc_apic_id; \'u_int\'  &pc_acpi_id; \'struct user_segment_descriptor\' * &pc_fs32p; \'struct user_segment_descriptor\' * &pc_gs32p; \'struct system_segment_descriptor\' * &pc_ldt; \'struct system_segment_descriptor\' * &pc_tss; \'u_int\'  &pc_cmci_mask;  &uint64_t  $pc_dbreg[16];  &uint64_t  $pc_pti_stack[ &PC_PTI_STACK_SZ];  &register_t  &pc_pti_rsp0; \'int\'  &pc_dbreg_cmd; \'u_int\'  &pc_vcpu_id;  &uint32_t  &pc_pcid_next;  &uint32_t  &pc_pcid_gen;  &uint32_t  &pc_unused;  &uint32_t  &pc_ibpb_set;  &void * &pc_mds_buf;  &void * &pc_mds_buf64;  &uint32_t  $pc_pad[4];  &uint8_t  $pc_mds_tmp[64]; \'u_int\'  &pc_ipi_bitmap; \'struct amd64tss\'  &pc_common_tss; \'struct user_segment_descriptor\'  $pc_gdt[ &NGDT];  &void * &pc_smp_tlb_pmap;  &uint64_t  &pc_smp_tlb_addr1;  &uint64_t  &pc_smp_tlb_addr2;  &uint32_t  &pc_smp_tlb_gen; \'u_int\'  &pc_smp_tlb_op;  &uint64_t  &pc_ucr3_load_mask; \'u_int\'  &pc_small_core; \'u_int\'  &pc_pcid_invlpg_workaround; \'struct pmap_pcid\'  &pc_kpmap_store; \'char\'  $__pad[2900];}' unless defined(&PCPU_MD_FIELDS);
	eval 'sub PC_DBREG_CMD_NONE () {0;}' unless defined(&PC_DBREG_CMD_NONE);
	eval 'sub PC_DBREG_CMD_LOAD () {1;}' unless defined(&PC_DBREG_CMD_LOAD);
	if(defined(&_KERNEL)) {
	    eval 'sub MONITOR_STOPSTATE_RUNNING () {0;}' unless defined(&MONITOR_STOPSTATE_RUNNING);
	    eval 'sub MONITOR_STOPSTATE_STOPPED () {1;}' unless defined(&MONITOR_STOPSTATE_STOPPED);
	    eval 'sub __pcpu_type {
	        my($name) = @_;
    		eval q( &__typeof((0)->$name));
	    }' unless defined(&__pcpu_type);
	    if(defined(&__SEG_GS)) {
		eval 'sub get_pcpu () {
		    eval q( &__extension__ ({  &static \'struct pcpu\'  &__seg_gs * &__pc = 0;  ($__pc->{pc_prvspace}); }));
		}' unless defined(&get_pcpu);
		eval 'sub __PCPU_PTR {
		    my($name) = @_;
    		    eval q( &__extension__ ({ \'struct pcpu\' * &__pc =  &get_pcpu(); & ($__pc->{name}); }));
		}' unless defined(&__PCPU_PTR);
		eval 'sub __PCPU_GET {
		    my($name) = @_;
    		    eval q( &__extension__ ({  &static \'struct pcpu\'  &__seg_gs * &__pc = 0;  ($__pc->{name}); }));
		}' unless defined(&__PCPU_GET);
		eval 'sub __PCPU_ADD {
		    my($name, $val) = @_;
    		    eval q( &do {  &static \'struct pcpu\'  &__seg_gs * &__pc = 0;  &__pcpu_type($name)  &__val;  &__val = ($val);  &if ($sizeof{ &__val} == 1|| $sizeof{ &__val} == 2|| $sizeof{ &__val} == 4|| $sizeof{ &__val} == 8) {  ($__pc->{name}) +=  &__val; }  &else * &__PCPU_PTR($name) +=  &__val; }  &while (0));
		}' unless defined(&__PCPU_ADD);
		eval 'sub __PCPU_SET {
		    my($name, $val) = @_;
    		    eval q( &do {  &static \'struct pcpu\'  &__seg_gs * &__pc = 0;  &__pcpu_type($name)  &__val;  &__val = ($val);  &if ($sizeof{ &__val} == 1|| $sizeof{ &__val} == 2|| $sizeof{ &__val} == 4|| $sizeof{ &__val} == 8) {  ($__pc->{name}) =  &__val; }  &else * &__PCPU_PTR($name) =  &__val; }  &while (0));
		}' unless defined(&__PCPU_SET);
	    } else {
		eval 'sub __pcpu_offset {
		    my($name) = @_;
    		    eval q( &__offsetof(\'struct pcpu\', $name));
		}' unless defined(&__pcpu_offset);
		eval 'sub __PCPU_PTR {
		    my($name) = @_;
    		    eval q( &__extension__ ({  &__pcpu_type($name) * &__p;  &__asm  &__volatile(\\"movq %%gs:%1,%0; addq %2,%0\\" : \\"=r\\" ( &__p) : \\"m\\" (*( &__pcpu_offset( &pc_prvspace))), \\"i\\" ( &__pcpu_offset($name)));  &__p; }));
		}' unless defined(&__PCPU_PTR);
		eval 'sub __PCPU_GET {
		    my($name) = @_;
    		    eval q( &__extension__ ({  &__pcpu_type($name)  &__res; \'struct __s\' { \'u_char\'  $__b[ &MIN($sizeof{ &__pcpu_type($name)}, 8)]; }  &__s;  &if ($sizeof{ &__res} == 1|| $sizeof{ &__res} == 2|| $sizeof{ &__res} == 4|| $sizeof{ &__res} == 8) {  &__asm  &__volatile(\\"mov %%gs:%1,%0\\" : \\"=r\\" ( &__s) : \\"m\\" (*( &__pcpu_offset($name)))); *( &void *)& &__res =  &__s; }  &else {  &__res = * &__PCPU_PTR($name); }  &__res; }));
		}' unless defined(&__PCPU_GET);
		eval 'sub __PCPU_ADD {
		    my($name, $val) = @_;
    		    eval q( &do {  &__pcpu_type($name)  &__val; \'struct __s\' { \'u_char\'  $__b[ &MIN($sizeof{ &__pcpu_type($name)}, 8)]; }  &__s;  &__val = ($val);  &if ($sizeof{ &__val} == 1|| $sizeof{ &__val} == 2|| $sizeof{ &__val} == 4|| $sizeof{ &__val} == 8) {  &__s = *( &void *)& &__val;  &__asm  &__volatile(\\"add %1,%%gs:%0\\" : \\"=m\\" (*( &__pcpu_offset($name))) : \\"r\\" ( &__s)); }  &else * &__PCPU_PTR($name) +=  &__val; }  &while (0));
		}' unless defined(&__PCPU_ADD);
		eval 'sub __PCPU_SET {
		    my($name, $val) = @_;
    		    eval q({  &__pcpu_type($name)  &__val; \'struct __s\' { \'u_char\'  $__b[ &MIN($sizeof{ &__pcpu_type($name)}, 8)]; }  &__s;  &__val = ($val);  &if ($sizeof{ &__val} == 1|| $sizeof{ &__val} == 2|| $sizeof{ &__val} == 4|| $sizeof{ &__val} == 8) {  &__s = *( &void *)& &__val;  &__asm  &__volatile(\\"mov %1,%%gs:%0\\" : \\"=m\\" (*( &__pcpu_offset($name))) : \\"r\\" ( &__s)); }  &else { * &__PCPU_PTR($name) =  &__val; } });
		}' unless defined(&__PCPU_SET);
		eval 'sub get_pcpu () {
		    eval q( &__extension__ ({ \'struct pcpu\' * &__pc;  &__asm  &__volatile(\\"movq %%gs:%1,%0\\" : \\"=r\\" ( &__pc) : \\"m\\" (*( &__pcpu_offset( &pc_prvspace))));  &__pc; }));
		}' unless defined(&get_pcpu);
	    }
	    eval 'sub PCPU_GET {
	        my($member) = @_;
    		eval q( &__PCPU_GET( &pc_  $member));
	    }' unless defined(&PCPU_GET);
	    eval 'sub PCPU_ADD {
	        my($member, $val) = @_;
    		eval q( &__PCPU_ADD( &pc_  $member, $val));
	    }' unless defined(&PCPU_ADD);
	    eval 'sub PCPU_PTR {
	        my($member) = @_;
    		eval q( &__PCPU_PTR( &pc_  $member));
	    }' unless defined(&PCPU_PTR);
	    eval 'sub PCPU_SET {
	        my($member, $val) = @_;
    		eval q( &__PCPU_SET( &pc_  $member, $val));
	    }' unless defined(&PCPU_SET);
	    eval 'sub IS_BSP () {
	        eval q(( &PCPU_GET( &cpuid) == 0));
	    }' unless defined(&IS_BSP);
	    eval 'sub zpcpu_offset_cpu {
	        my($cpu) = @_;
    		eval q((( &uintptr_t)& $__pcpu[0] +  &UMA_PCPU_ALLOC_SIZE * $cpu));
	    }' unless defined(&zpcpu_offset_cpu);
	    eval 'sub zpcpu_base_to_offset {
	        my($base) = @_;
    		eval q(( &void *)(( &uintptr_t)($base) - ( &uintptr_t)& $__pcpu[0]));
	    }' unless defined(&zpcpu_base_to_offset);
	    eval 'sub zpcpu_offset_to_base {
	        my($base) = @_;
    		eval q(( &void *)(( &uintptr_t)($base) + ( &uintptr_t)& $__pcpu[0]));
	    }' unless defined(&zpcpu_offset_to_base);
	    eval 'sub zpcpu_sub_protected {
	        my($base, $n) = @_;
    		eval q( &do {  &ZPCPU_ASSERT_PROTECTED();  &zpcpu_sub($base, $n); }  &while (0));
	    }' unless defined(&zpcpu_sub_protected);
	    eval 'sub zpcpu_set_protected {
	        my($base, $n) = @_;
    		eval q( &do {  &__typeof(*$base)  &__n = ($n);  &ZPCPU_ASSERT_PROTECTED();  &switch ($sizeof{$base}) {  &case 4:  &__asm  &__volatile(\\"movl\\\\t%1,%%gs:(%0)\\" : : \\"r\\" ($base), \\"ri\\" ( &__n) : \\"memory\\", \\"cc\\");  &break;  &case 8:  &__asm  &__volatile(\\"movq\\\\t%1,%%gs:(%0)\\" : : \\"r\\" ($base), \\"ri\\" ( &__n) : \\"memory\\", \\"cc\\");  &break;  &default: * &zpcpu_get($base) =  &__n; } }  &while (0););
	    }' unless defined(&zpcpu_set_protected);
	    eval 'sub zpcpu_add {
	        my($base, $n) = @_;
    		eval q( &do {  &__typeof(*$base)  &__n = ($n);  &CTASSERT($sizeof{$base} == 4|| $sizeof{$base} == 8);  &switch ($sizeof{$base}) {  &case 4:  &__asm  &__volatile(\\"addl\\\\t%1,%%gs:(%0)\\" : : \\"r\\" ($base), \\"ri\\" ( &__n) : \\"memory\\", \\"cc\\");  &break;  &case 8:  &__asm  &__volatile(\\"addq\\\\t%1,%%gs:(%0)\\" : : \\"r\\" ($base), \\"ri\\" ( &__n) : \\"memory\\", \\"cc\\");  &break; } }  &while (0));
	    }' unless defined(&zpcpu_add);
	    eval 'sub zpcpu_add_protected {
	        my($base, $n) = @_;
    		eval q( &do {  &ZPCPU_ASSERT_PROTECTED();  &zpcpu_add($base, $n); }  &while (0));
	    }' unless defined(&zpcpu_add_protected);
	    eval 'sub zpcpu_sub {
	        my($base, $n) = @_;
    		eval q( &do {  &__typeof(*$base)  &__n = ($n);  &CTASSERT($sizeof{$base} == 4|| $sizeof{$base} == 8);  &switch ($sizeof{$base}) {  &case 4:  &__asm  &__volatile(\\"subl\\\\t%1,%%gs:(%0)\\" : : \\"r\\" ($base), \\"ri\\" ( &__n) : \\"memory\\", \\"cc\\");  &break;  &case 8:  &__asm  &__volatile(\\"subq\\\\t%1,%%gs:(%0)\\" : : \\"r\\" ($base), \\"ri\\" ( &__n) : \\"memory\\", \\"cc\\");  &break; } }  &while (0););
	    }' unless defined(&zpcpu_sub);
	}
    }
}
1;

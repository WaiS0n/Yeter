require '_h2ph_pre.ph';

no warnings qw(redefine misc);

if(defined(&__i386__)) {
    require 'i386/pmap.ph';
} else {
    unless(defined(&_MACHINE_PMAP_H_)) {
	eval 'sub _MACHINE_PMAP_H_ () {1;}' unless defined(&_MACHINE_PMAP_H_);
	eval 'sub X86_PG_V () {0x1;}' unless defined(&X86_PG_V);
	eval 'sub X86_PG_RW () {0x2;}' unless defined(&X86_PG_RW);
	eval 'sub X86_PG_U () {0x4;}' unless defined(&X86_PG_U);
	eval 'sub X86_PG_NC_PWT () {0x8;}' unless defined(&X86_PG_NC_PWT);
	eval 'sub X86_PG_NC_PCD () {0x10;}' unless defined(&X86_PG_NC_PCD);
	eval 'sub X86_PG_A () {0x20;}' unless defined(&X86_PG_A);
	eval 'sub X86_PG_M () {0x40;}' unless defined(&X86_PG_M);
	eval 'sub X86_PG_PS () {0x80;}' unless defined(&X86_PG_PS);
	eval 'sub X86_PG_PTE_PAT () {0x80;}' unless defined(&X86_PG_PTE_PAT);
	eval 'sub X86_PG_G () {0x100;}' unless defined(&X86_PG_G);
	eval 'sub X86_PG_AVAIL1 () {0x200;}' unless defined(&X86_PG_AVAIL1);
	eval 'sub X86_PG_AVAIL2 () {0x400;}' unless defined(&X86_PG_AVAIL2);
	eval 'sub X86_PG_AVAIL3 () {0x800;}' unless defined(&X86_PG_AVAIL3);
	eval 'sub X86_PG_PDE_PAT () {0x1000;}' unless defined(&X86_PG_PDE_PAT);
	eval 'sub X86_PG_PKU {
	    my($idx) = @_;
    	    eval q((( &pt_entry_t)$idx << 59));
	}' unless defined(&X86_PG_PKU);
	eval 'sub X86_PG_NX () {(1<<63);}' unless defined(&X86_PG_NX);
	eval 'sub X86_PG_AVAIL {
	    my($x) = @_;
    	    eval q((1 << ($x)));
	}' unless defined(&X86_PG_AVAIL);
	eval 'sub X86_PG_PDE_CACHE () {( &X86_PG_PDE_PAT |  &X86_PG_NC_PWT |  &X86_PG_NC_PCD);}' unless defined(&X86_PG_PDE_CACHE);
	eval 'sub X86_PG_PTE_CACHE () {( &X86_PG_PTE_PAT |  &X86_PG_NC_PWT |  &X86_PG_NC_PCD);}' unless defined(&X86_PG_PTE_CACHE);
	eval 'sub PMAP_MAX_PKRU_IDX () {0xf;}' unless defined(&PMAP_MAX_PKRU_IDX);
	eval 'sub X86_PG_PKU_MASK () { &X86_PG_PKU( &PMAP_MAX_PKRU_IDX);}' unless defined(&X86_PG_PKU_MASK);
	eval 'sub EPT_PG_READ () {0x1;}' unless defined(&EPT_PG_READ);
	eval 'sub EPT_PG_WRITE () {0x2;}' unless defined(&EPT_PG_WRITE);
	eval 'sub EPT_PG_EXECUTE () {0x4;}' unless defined(&EPT_PG_EXECUTE);
	eval 'sub EPT_PG_IGNORE_PAT () {0x40;}' unless defined(&EPT_PG_IGNORE_PAT);
	eval 'sub EPT_PG_PS () {0x80;}' unless defined(&EPT_PG_PS);
	eval 'sub EPT_PG_A () {0x100;}' unless defined(&EPT_PG_A);
	eval 'sub EPT_PG_M () {0x200;}' unless defined(&EPT_PG_M);
	eval 'sub EPT_PG_MEMORY_TYPE {
	    my($x) = @_;
    	    eval q((($x) << 3));
	}' unless defined(&EPT_PG_MEMORY_TYPE);
	eval 'sub PG_V () { &X86_PG_V;}' unless defined(&PG_V);
	eval 'sub PG_RW () { &X86_PG_RW;}' unless defined(&PG_RW);
	eval 'sub PG_U () { &X86_PG_U;}' unless defined(&PG_U);
	eval 'sub PG_NC_PWT () { &X86_PG_NC_PWT;}' unless defined(&PG_NC_PWT);
	eval 'sub PG_NC_PCD () { &X86_PG_NC_PCD;}' unless defined(&PG_NC_PCD);
	eval 'sub PG_A () { &X86_PG_A;}' unless defined(&PG_A);
	eval 'sub PG_M () { &X86_PG_M;}' unless defined(&PG_M);
	eval 'sub PG_PS () { &X86_PG_PS;}' unless defined(&PG_PS);
	eval 'sub PG_PTE_PAT () { &X86_PG_PTE_PAT;}' unless defined(&PG_PTE_PAT);
	eval 'sub PG_G () { &X86_PG_G;}' unless defined(&PG_G);
	eval 'sub PG_AVAIL1 () { &X86_PG_AVAIL1;}' unless defined(&PG_AVAIL1);
	eval 'sub PG_AVAIL2 () { &X86_PG_AVAIL2;}' unless defined(&PG_AVAIL2);
	eval 'sub PG_AVAIL3 () { &X86_PG_AVAIL3;}' unless defined(&PG_AVAIL3);
	eval 'sub PG_PDE_PAT () { &X86_PG_PDE_PAT;}' unless defined(&PG_PDE_PAT);
	eval 'sub PG_NX () { &X86_PG_NX;}' unless defined(&PG_NX);
	eval 'sub PG_PDE_CACHE () { &X86_PG_PDE_CACHE;}' unless defined(&PG_PDE_CACHE);
	eval 'sub PG_PTE_CACHE () { &X86_PG_PTE_CACHE;}' unless defined(&PG_PTE_CACHE);
	eval 'sub PG_W () { &X86_PG_AVAIL3;}' unless defined(&PG_W);
	eval 'sub PG_MANAGED () { &X86_PG_AVAIL2;}' unless defined(&PG_MANAGED);
	eval 'sub EPT_PG_EMUL_V () { &X86_PG_AVAIL(52);}' unless defined(&EPT_PG_EMUL_V);
	eval 'sub EPT_PG_EMUL_RW () { &X86_PG_AVAIL(53);}' unless defined(&EPT_PG_EMUL_RW);
	eval 'sub PG_PROMOTED () { &X86_PG_AVAIL(54);}' unless defined(&PG_PROMOTED);
	eval 'sub PG_FRAME () {(0xffffffffff000);}' unless defined(&PG_FRAME);
	eval 'sub PG_PS_FRAME () {(0xfffffffe00000);}' unless defined(&PG_PS_FRAME);
	eval 'sub PG_PS_PDP_FRAME () {(0xfffffc0000000);}' unless defined(&PG_PS_PDP_FRAME);
	eval 'sub PG_PTE_PROMOTE () {( &PG_NX |  &PG_MANAGED |  &PG_W |  &PG_G |  &PG_PTE_CACHE |  &PG_M |  &PG_U |  &PG_RW |  &PG_V |  &PG_PKU_MASK);}' unless defined(&PG_PTE_PROMOTE);
	eval 'sub PGEX_P () {0x1;}' unless defined(&PGEX_P);
	eval 'sub PGEX_W () {0x2;}' unless defined(&PGEX_W);
	eval 'sub PGEX_U () {0x4;}' unless defined(&PGEX_U);
	eval 'sub PGEX_RSV () {0x8;}' unless defined(&PGEX_RSV);
	eval 'sub PGEX_I () {0x10;}' unless defined(&PGEX_I);
	eval 'sub PGEX_PK () {0x20;}' unless defined(&PGEX_PK);
	eval 'sub PGEX_SGX () {0x8000;}' unless defined(&PGEX_SGX);
	if(defined(&AMD64_NPT_AWARE)) {
	    undef(&PG_AVAIL1) if defined(&PG_AVAIL1);
	    undef(&PG_G) if defined(&PG_G);
	    undef(&PG_A) if defined(&PG_A);
	    undef(&PG_M) if defined(&PG_M);
	    undef(&PG_PDE_PAT) if defined(&PG_PDE_PAT);
	    undef(&PG_PDE_CACHE) if defined(&PG_PDE_CACHE);
	    undef(&PG_PTE_PAT) if defined(&PG_PTE_PAT);
	    undef(&PG_PTE_CACHE) if defined(&PG_PTE_CACHE);
	    undef(&PG_RW) if defined(&PG_RW);
	    undef(&PG_V) if defined(&PG_V);
	}
	eval 'sub KV4ADDR {
	    my($l4, $l3, $l2, $l1) = @_;
    	    eval q(( (-1<< 47) | ( <<  &PML4SHIFT) | ( <<  &PDPSHIFT) | ( <<  &PDRSHIFT) | (($l1) <<  &PAGE_SHIFT)));
	}' unless defined(&KV4ADDR);
	eval 'sub KV5ADDR {
	    my($l5, $l4, $l3, $l2, $l1) = @_;
    	    eval q(( (-1<< 56) | ( <<  &PML5SHIFT) | ( <<  &PML4SHIFT) | ( <<  &PDPSHIFT) | ( <<  &PDRSHIFT) | (($l1) <<  &PAGE_SHIFT)));
	}' unless defined(&KV5ADDR);
	eval 'sub UVADDR {
	    my($l5, $l4, $l3, $l2, $l1) = @_;
    	    eval q(( ( <<  &PML5SHIFT) | ( <<  &PML4SHIFT) | ( <<  &PDPSHIFT) | ( <<  &PDRSHIFT) | (($l1) <<  &PAGE_SHIFT)));
	}' unless defined(&UVADDR);
	eval 'sub NKPML4E () {4;}' unless defined(&NKPML4E);
	eval 'sub NKASANPML4E () {(( &NKPML4E + 7) / 8);}' unless defined(&NKASANPML4E);
	eval 'sub NKMSANSHADPML4E () { &NKPML4E;}' unless defined(&NKMSANSHADPML4E);
	eval 'sub NKMSANORIGPML4E () { &NKPML4E;}' unless defined(&NKMSANORIGPML4E);
	eval 'sub NUPML5E () {( &NPML5EPG / 2);}' unless defined(&NUPML5E);
	eval 'sub NUPML4E () {( &NUPML5E *  &NPML4EPG);}' unless defined(&NUPML4E);
	eval 'sub NUPDPE () {( &NUPML4E *  &NPDPEPG);}' unless defined(&NUPDPE);
	eval 'sub NUPDE () {( &NUPDPE *  &NPDEPG);}' unless defined(&NUPDE);
	eval 'sub NUP4ML4E () {( &NPML4EPG / 2);}' unless defined(&NUP4ML4E);
	eval 'sub NDMPML4E () {8;}' unless defined(&NDMPML4E);
	eval 'sub PML4PML4I () {( &NPML4EPG / 2);}' unless defined(&PML4PML4I);
	eval 'sub PML5PML5I () {( &NPML5EPG / 2);}' unless defined(&PML5PML5I);
	eval 'sub KPML4BASE () {( &NPML4EPG- &NKPML4E);}' unless defined(&KPML4BASE);
	eval 'sub DMPML4I () { &rounddown( &KPML4BASE- &NDMPML4E,  &NDMPML4E);}' unless defined(&DMPML4I);
	eval 'sub KPML4I () {( &NPML4EPG-1);}' unless defined(&KPML4I);
	eval 'sub KPDPI () {( &NPDPEPG-2);}' unless defined(&KPDPI);
	eval 'sub KASANPML4I () {( &DMPML4I -  &NKASANPML4E);}' unless defined(&KASANPML4I);
	eval 'sub KMSANSHADPML4I () {( &KPML4BASE -  &NKMSANSHADPML4E);}' unless defined(&KMSANSHADPML4I);
	eval 'sub KMSANORIGPML4I () {( &DMPML4I -  &NKMSANORIGPML4E);}' unless defined(&KMSANORIGPML4I);
	eval 'sub LMSPML4I () {( &PML4PML4I + 1);}' unless defined(&LMSPML4I);
	eval 'sub LMEPML4I () {( &KASANPML4I - 1);}' unless defined(&LMEPML4I);
	eval 'sub ISA_HOLE_START () {0xa0000;}' unless defined(&ISA_HOLE_START);
	eval 'sub ISA_HOLE_LENGTH () {(0x100000- &ISA_HOLE_START);}' unless defined(&ISA_HOLE_LENGTH);
	eval 'sub PMAP_PCID_NONE () {0xffffffff;}' unless defined(&PMAP_PCID_NONE);
	eval 'sub PMAP_PCID_KERN () {0;}' unless defined(&PMAP_PCID_KERN);
	eval 'sub PMAP_PCID_OVERMAX () {0x1000;}' unless defined(&PMAP_PCID_OVERMAX);
	eval 'sub PMAP_PCID_OVERMAX_KERN () {0x800;}' unless defined(&PMAP_PCID_OVERMAX_KERN);
	eval 'sub PMAP_PCID_USER_PT () {0x800;}' unless defined(&PMAP_PCID_USER_PT);
	eval 'sub PMAP_NO_CR3 () {0xffffffffffffffff;}' unless defined(&PMAP_NO_CR3);
	eval 'sub PMAP_UCR3_NOMASK () {0xffffffffffffffff;}' unless defined(&PMAP_UCR3_NOMASK);
	unless(defined(&LOCORE)) {
	    require 'sys/kassert.ph';
	    require 'sys/queue.ph';
	    require 'sys/_cpuset.ph';
	    require 'sys/_lock.ph';
	    require 'sys/_mutex.ph';
	    require 'sys/_pctrie.ph';
	    require 'machine/_pmap.ph';
	    require 'sys/_pv_entry.ph';
	    require 'sys/_rangeset.ph';
	    require 'sys/_smr.ph';
	    require 'vm/_vm_radix.ph';
	    if(defined(&_KERNEL)) {
		eval 'sub addr_P4Tmap () {( &KV4ADDR( &PML4PML4I, 0, 0, 0));}' unless defined(&addr_P4Tmap);
		eval 'sub addr_P4Dmap () {( &KV4ADDR( &PML4PML4I,  &PML4PML4I, 0, 0));}' unless defined(&addr_P4Dmap);
		eval 'sub addr_P4DPmap () {( &KV4ADDR( &PML4PML4I,  &PML4PML4I,  &PML4PML4I, 0));}' unless defined(&addr_P4DPmap);
		eval 'sub addr_P4ML4map () {( &KV4ADDR( &PML4PML4I,  &PML4PML4I,  &PML4PML4I,  &PML4PML4I));}' unless defined(&addr_P4ML4map);
		eval 'sub addr_P4ML4pml4e () {( &addr_PML4map + ( &PML4PML4I * $sizeof{ &pml4_entry_t}));}' unless defined(&addr_P4ML4pml4e);
		eval 'sub P4Tmap () {(( &pt_entry_t *)( &addr_P4Tmap));}' unless defined(&P4Tmap);
		eval 'sub P4Dmap () {(( &pd_entry_t *)( &addr_P4Dmap));}' unless defined(&P4Dmap);
		eval 'sub addr_P5Tmap () {( &KV5ADDR( &PML5PML5I, 0, 0, 0, 0));}' unless defined(&addr_P5Tmap);
		eval 'sub addr_P5Dmap () {( &KV5ADDR( &PML5PML5I,  &PML5PML5I, 0, 0, 0));}' unless defined(&addr_P5Dmap);
		eval 'sub addr_P5DPmap () {( &KV5ADDR( &PML5PML5I,  &PML5PML5I,  &PML5PML5I, 0, 0));}' unless defined(&addr_P5DPmap);
		eval 'sub addr_P5ML4map () {( &KV5ADDR( &PML5PML5I,  &PML5PML5I,  &PML5PML5I,  &PML5PML5I, 0));}' unless defined(&addr_P5ML4map);
		eval 'sub addr_P5ML5map () {( &KVADDR( &PML5PML5I,  &PML5PML5I,  &PML5PML5I,  &PML5PML5I,  &PML5PML5I));}' unless defined(&addr_P5ML5map);
		eval 'sub addr_P5ML5pml5e () {( &addr_P5ML5map + ( &PML5PML5I * $sizeof{ &pml5_entry_t}));}' unless defined(&addr_P5ML5pml5e);
		eval 'sub P5Tmap () {(( &pt_entry_t *)( &addr_P5Tmap));}' unless defined(&P5Tmap);
		eval 'sub P5Dmap () {(( &pd_entry_t *)( &addr_P5Dmap));}' unless defined(&P5Dmap);
		eval 'sub vtophys {
		    my($va) = @_;
    		    eval q( &pmap_kextract((( &vm_offset_t) ($va))));
		}' unless defined(&vtophys);
		eval 'sub pte_load_store {
		    my($ptep, $pte) = @_;
    		    eval q( &atomic_swap_long($ptep, $pte));
		}' unless defined(&pte_load_store);
		eval 'sub pte_load_clear {
		    my($ptep) = @_;
    		    eval q( &atomic_swap_long($ptep, 0));
		}' unless defined(&pte_load_clear);
		eval 'sub pte_store {
		    my($ptep, $pte) = @_;
    		    eval q( &do { * = ($pte); }  &while (0));
		}' unless defined(&pte_store);
		eval 'sub pte_clear {
		    my($ptep) = @_;
    		    eval q( &pte_store($ptep, 0));
		}' unless defined(&pte_clear);
		eval 'sub pde_store {
		    my($pdep, $pde) = @_;
    		    eval q( &pte_store($pdep, $pde));
		}' unless defined(&pde_store);
	    }
	    eval("sub PT_X86 () { 0; }") unless defined(&PT_X86);
	    eval("sub PT_EPT () { 1; }") unless defined(&PT_EPT);
	    eval("sub PT_RVI () { 2; }") unless defined(&PT_RVI);
	    eval 'sub PMAP_NESTED_IPIMASK () {0xff;}' unless defined(&PMAP_NESTED_IPIMASK);
	    eval 'sub PMAP_PDE_SUPERPAGE () {(1<< 8);}' unless defined(&PMAP_PDE_SUPERPAGE);
	    eval 'sub PMAP_EMULATE_AD_BITS () {(1<< 9);}' unless defined(&PMAP_EMULATE_AD_BITS);
	    eval 'sub PMAP_SUPPORTS_EXEC_ONLY () {(1<< 10);}' unless defined(&PMAP_SUPPORTS_EXEC_ONLY);
	    if(defined(&_KERNEL)) {
		eval 'sub kernel_pmap () {( &kernel_pmap_store);}' unless defined(&kernel_pmap);
		eval 'sub PMAP_LOCK {
		    my($pmap) = @_;
    		    eval q( &mtx_lock(($pmap)-> &pm_mtx));
		}' unless defined(&PMAP_LOCK);
		eval 'sub PMAP_LOCK_ASSERT {
		    my($pmap, $type) = @_;
    		    eval q( &mtx_assert(($pmap)-> &pm_mtx, ($type)));
		}' unless defined(&PMAP_LOCK_ASSERT);
		eval 'sub PMAP_LOCK_DESTROY {
		    my($pmap) = @_;
    		    eval q( &mtx_destroy(($pmap)-> &pm_mtx));
		}' unless defined(&PMAP_LOCK_DESTROY);
		eval 'sub PMAP_LOCK_INIT {
		    my($pmap) = @_;
    		    eval q( &mtx_init(($pmap)-> &pm_mtx, \\"pmap\\",  &NULL,  &MTX_DEF |  &MTX_DUPOK));
		}' unless defined(&PMAP_LOCK_INIT);
		eval 'sub PMAP_LOCKED {
		    my($pmap) = @_;
    		    eval q( &mtx_owned(($pmap)-> &pm_mtx));
		}' unless defined(&PMAP_LOCKED);
		eval 'sub PMAP_MTX {
		    my($pmap) = @_;
    		    eval q((($pmap)-> &pm_mtx));
		}' unless defined(&PMAP_MTX);
		eval 'sub PMAP_TRYLOCK {
		    my($pmap) = @_;
    		    eval q( &mtx_trylock(($pmap)-> &pm_mtx));
		}' unless defined(&PMAP_TRYLOCK);
		eval 'sub PMAP_UNLOCK {
		    my($pmap) = @_;
    		    eval q( &mtx_unlock(($pmap)-> &pm_mtx));
		}' unless defined(&PMAP_UNLOCK);
		eval 'sub pmap_page_get_memattr {
		    my($m) = @_;
    		    eval q((( &vm_memattr_t)($m)-> ($md->{pat_mode})));
		}' unless defined(&pmap_page_get_memattr);
		eval 'sub pmap_page_is_write_mapped {
		    my($m) = @_;
    		    eval q(((($m)-> ($a->{flags}) &  &PGA_WRITEABLE) != 0));
		}' unless defined(&pmap_page_is_write_mapped);
		eval 'sub pmap_unmapbios {
		    my($va, $sz) = @_;
    		    eval q( &pmap_unmapdev(($va), ($sz)));
		}' unless defined(&pmap_unmapbios);
		eval 'sub pmap_vm_page_alloc_check {
		    my($m) = @_;
    		    eval q( &KASSERT( ($m->{phys_addr}) <  &kernphys ||  ($m->{phys_addr}) >=  &kernphys + ( &vm_offset_t)& &_end -  &KERNSTART, (\\"allocating kernel page %p pa %#lx kernphys %#lx end %p\\", $m,  ($m->{phys_addr}),  &kernphys, & &_end)););
		}' unless defined(&pmap_vm_page_alloc_check);
		if(defined(&KASAN) || defined(&KMSAN)) {
		}
		if(defined(&_SYS_PCPU_H_)  && defined(&_MACHINE_CPUFUNC_H_)) {
		}
		if(defined(&_SYS_PCPU_H_)) {
		}
	    }
	    eval 'sub pmap_pde_index {
	        my($va) = @_;
    		eval q({ (($va >>  &PDRSHIFT) & ((1 <<  &NPDEPGSHIFT) - 1)); });
	    }' unless defined(&pmap_pde_index);
	    eval 'sub pmap_pdpe_index {
	        my($va) = @_;
    		eval q({ (($va >>  &PDPSHIFT) & ((1 <<  &NPDPEPGSHIFT) - 1)); });
	    }' unless defined(&pmap_pdpe_index);
	    eval 'sub pmap_pml4e_index {
	        my($va) = @_;
    		eval q({ (($va >>  &PML4SHIFT) & ((1 <<  &NPML4EPGSHIFT) - 1)); });
	    }' unless defined(&pmap_pml4e_index);
	    eval 'sub pmap_pml5e_index {
	        my($va) = @_;
    		eval q({ (($va >>  &PML5SHIFT) & ((1 <<  &NPML5EPGSHIFT) - 1)); });
	    }' unless defined(&pmap_pml5e_index);
	}
    }
}
1;

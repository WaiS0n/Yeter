require '_h2ph_pre.ph';

no warnings qw(redefine misc);

if(defined(&__i386__)) {
    require 'i386/vmparam.ph';
} else {
    unless(defined(&_MACHINE_VMPARAM_H_)) {
	eval 'sub _MACHINE_VMPARAM_H_ () {1;}' unless defined(&_MACHINE_VMPARAM_H_);
	eval 'sub MAXTSIZ () {(32768*1024*1024);}' unless defined(&MAXTSIZ);
	unless(defined(&DFLDSIZ)) {
	    eval 'sub DFLDSIZ () {(32768*1024*1024);}' unless defined(&DFLDSIZ);
	}
	unless(defined(&MAXDSIZ)) {
	    eval 'sub MAXDSIZ () {(32768*1024*1024);}' unless defined(&MAXDSIZ);
	}
	unless(defined(&DFLSSIZ)) {
	    eval 'sub DFLSSIZ () {(8*1024*1024);}' unless defined(&DFLSSIZ);
	}
	unless(defined(&MAXSSIZ)) {
	    eval 'sub MAXSSIZ () {(512*1024*1024);}' unless defined(&MAXSSIZ);
	}
	unless(defined(&SGROWSIZ)) {
	    eval 'sub SGROWSIZ () {(128*1024);}' unless defined(&SGROWSIZ);
	}
	if(!defined(&KASAN)  && !defined(&KMSAN)) {
	    eval 'sub UMA_MD_SMALL_ALLOC () {1;}' unless defined(&UMA_MD_SMALL_ALLOC);
	}
	eval 'sub VM_PHYSSEG_DENSE () {1;}' unless defined(&VM_PHYSSEG_DENSE);
	eval 'sub VM_PHYSSEG_MAX () {63;}' unless defined(&VM_PHYSSEG_MAX);
	eval 'sub VM_NFREEPOOL () {2;}' unless defined(&VM_NFREEPOOL);
	eval 'sub VM_FREEPOOL_DEFAULT () {0;}' unless defined(&VM_FREEPOOL_DEFAULT);
	eval 'sub VM_FREEPOOL_DIRECT () {1;}' unless defined(&VM_FREEPOOL_DIRECT);
	eval 'sub VM_NFREELIST () {3;}' unless defined(&VM_NFREELIST);
	eval 'sub VM_FREELIST_DEFAULT () {0;}' unless defined(&VM_FREELIST_DEFAULT);
	eval 'sub VM_FREELIST_DMA32 () {1;}' unless defined(&VM_FREELIST_DMA32);
	eval 'sub VM_FREELIST_LOWMEM () {2;}' unless defined(&VM_FREELIST_LOWMEM);
	eval 'sub VM_LOWMEM_BOUNDARY () {(16<< 20);}' unless defined(&VM_LOWMEM_BOUNDARY);
	eval 'sub VM_DMA32_NPAGES_THRESHOLD () {16777216;}' unless defined(&VM_DMA32_NPAGES_THRESHOLD);
	eval 'sub VM_NFREEORDER () {13;}' unless defined(&VM_NFREEORDER);
	unless(defined(&VM_NRESERVLEVEL)) {
	    eval 'sub VM_NRESERVLEVEL () {1;}' unless defined(&VM_NRESERVLEVEL);
	}
	unless(defined(&VM_LEVEL_0_ORDER)) {
	    eval 'sub VM_LEVEL_0_ORDER () {9;}' unless defined(&VM_LEVEL_0_ORDER);
	}
	if(defined(&SMP)) {
	    eval 'sub PA_LOCK_COUNT () {256;}' unless defined(&PA_LOCK_COUNT);
	}
	unless(defined(&KERNLOAD)) {
	    eval 'sub KERNLOAD () {0x200000;}' unless defined(&KERNLOAD);
	}
	eval 'sub VM_MIN_KERNEL_ADDRESS () { &KV4ADDR( &KPML4BASE, 0, 0, 0);}' unless defined(&VM_MIN_KERNEL_ADDRESS);
	eval 'sub VM_MAX_KERNEL_ADDRESS () { &KV4ADDR( &KPML4BASE +  &NKPML4E - 1,  &NPDPEPG-1,  &NPDEPG-1,  &NPTEPG-1);}' unless defined(&VM_MAX_KERNEL_ADDRESS);
	eval 'sub DMAP_MIN_ADDRESS () { &KV4ADDR( &DMPML4I, 0, 0, 0);}' unless defined(&DMAP_MIN_ADDRESS);
	eval 'sub DMAP_MAX_ADDRESS () { &KV4ADDR( &DMPML4I +  &NDMPML4E, 0, 0, 0);}' unless defined(&DMAP_MAX_ADDRESS);
	eval 'sub KASAN_MIN_ADDRESS () { &KV4ADDR( &KASANPML4I, 0, 0, 0);}' unless defined(&KASAN_MIN_ADDRESS);
	eval 'sub KASAN_MAX_ADDRESS () { &KV4ADDR( &KASANPML4I +  &NKASANPML4E, 0, 0, 0);}' unless defined(&KASAN_MAX_ADDRESS);
	eval 'sub KMSAN_SHAD_MIN_ADDRESS () { &KV4ADDR( &KMSANSHADPML4I, 0, 0, 0);}' unless defined(&KMSAN_SHAD_MIN_ADDRESS);
	eval 'sub KMSAN_SHAD_MAX_ADDRESS () { &KV4ADDR( &KMSANSHADPML4I +  &NKMSANSHADPML4E, 0, 0, 0);}' unless defined(&KMSAN_SHAD_MAX_ADDRESS);
	eval 'sub KMSAN_ORIG_MIN_ADDRESS () { &KV4ADDR( &KMSANORIGPML4I, 0, 0, 0);}' unless defined(&KMSAN_ORIG_MIN_ADDRESS);
	eval 'sub KMSAN_ORIG_MAX_ADDRESS () { &KV4ADDR( &KMSANORIGPML4I +  &NKMSANORIGPML4E, 0, 0, 0);}' unless defined(&KMSAN_ORIG_MAX_ADDRESS);
	eval 'sub LARGEMAP_MIN_ADDRESS () { &KV4ADDR( &LMSPML4I, 0, 0, 0);}' unless defined(&LARGEMAP_MIN_ADDRESS);
	eval 'sub LARGEMAP_MAX_ADDRESS () { &KV4ADDR( &LMEPML4I + 1, 0, 0, 0);}' unless defined(&LARGEMAP_MAX_ADDRESS);
	eval 'sub KERNBASE () { &KV4ADDR( &KPML4I,  &KPDPI, 0, 0);}' unless defined(&KERNBASE);
	eval 'sub KERNSTART () {( &KERNBASE +  &NBPDR);}' unless defined(&KERNSTART);
	eval 'sub UPT_MAX_ADDRESS () { &KV4ADDR( &PML4PML4I,  &PML4PML4I,  &PML4PML4I,  &PML4PML4I);}' unless defined(&UPT_MAX_ADDRESS);
	eval 'sub UPT_MIN_ADDRESS () { &KV4ADDR( &PML4PML4I, 0, 0, 0);}' unless defined(&UPT_MIN_ADDRESS);
	eval 'sub VM_MAXUSER_ADDRESS_LA57 () { &UVADDR( &NUPML5E, 0, 0, 0, 0);}' unless defined(&VM_MAXUSER_ADDRESS_LA57);
	eval 'sub VM_MAXUSER_ADDRESS_LA48 () { &UVADDR(0,  &NUP4ML4E, 0, 0, 0);}' unless defined(&VM_MAXUSER_ADDRESS_LA48);
	eval 'sub VM_MAXUSER_ADDRESS () { &VM_MAXUSER_ADDRESS_LA57;}' unless defined(&VM_MAXUSER_ADDRESS);
	eval 'sub SHAREDPAGE_LA57 () {( &VM_MAXUSER_ADDRESS_LA57 -  &PAGE_SIZE);}' unless defined(&SHAREDPAGE_LA57);
	eval 'sub SHAREDPAGE_LA48 () {( &VM_MAXUSER_ADDRESS_LA48 -  &PAGE_SIZE);}' unless defined(&SHAREDPAGE_LA48);
	eval 'sub USRSTACK_LA57 () { &SHAREDPAGE_LA57;}' unless defined(&USRSTACK_LA57);
	eval 'sub USRSTACK_LA48 () { &SHAREDPAGE_LA48;}' unless defined(&USRSTACK_LA48);
	eval 'sub USRSTACK () { &USRSTACK_LA48;}' unless defined(&USRSTACK);
	eval 'sub PS_STRINGS_LA57 () {( &USRSTACK_LA57 - $sizeof{\'struct ps_strings\'});}' unless defined(&PS_STRINGS_LA57);
	eval 'sub PS_STRINGS_LA48 () {( &USRSTACK_LA48 - $sizeof{\'struct ps_strings\'});}' unless defined(&PS_STRINGS_LA48);
	eval 'sub VM_MAX_ADDRESS () { &UPT_MAX_ADDRESS;}' unless defined(&VM_MAX_ADDRESS);
	eval 'sub VM_MIN_ADDRESS () {(0);}' unless defined(&VM_MIN_ADDRESS);
	eval 'sub PHYS_IN_DMAP {
	    my($pa) = @_;
    	    eval q(( &dmaplimit == 0|| ($pa) <  &dmaplimit));
	}' unless defined(&PHYS_IN_DMAP);
	eval 'sub VIRT_IN_DMAP {
	    my($va) = @_;
    	    eval q((($va) >=  &DMAP_MIN_ADDRESS  && ($va) < ( &DMAP_MIN_ADDRESS +  &dmaplimit)));
	}' unless defined(&VIRT_IN_DMAP);
	eval 'sub PMAP_HAS_DMAP () {1;}' unless defined(&PMAP_HAS_DMAP);
	eval 'sub PHYS_TO_DMAP {
	    my($x) = @_;
    	    eval q(({  &KASSERT( &PHYS_IN_DMAP($x), (\\"physical address %#jx not covered by the DMAP\\", ( &uintmax_t)$x)); ($x) |  &DMAP_MIN_ADDRESS; }));
	}' unless defined(&PHYS_TO_DMAP);
	eval 'sub DMAP_TO_PHYS {
	    my($x) = @_;
    	    eval q(({  &KASSERT( &VIRT_IN_DMAP($x), (\\"virtual address %#jx not covered by the DMAP\\", ( &uintmax_t)$x)); ($x) & ~ &DMAP_MIN_ADDRESS; }));
	}' unless defined(&DMAP_TO_PHYS);
	eval 'sub PMAP_HAS_PAGE_ARRAY () {1;}' unless defined(&PMAP_HAS_PAGE_ARRAY);
	unless(defined(&VM_KMEM_SIZE_SCALE)) {
	    eval 'sub VM_KMEM_SIZE_SCALE () {(1);}' unless defined(&VM_KMEM_SIZE_SCALE);
	}
	unless(defined(&VM_KMEM_SIZE_MAX)) {
	    eval 'sub VM_KMEM_SIZE_MAX () {(( &VM_MAX_KERNEL_ADDRESS -  &VM_MIN_KERNEL_ADDRESS + 1) * 3/ 5);}' unless defined(&VM_KMEM_SIZE_MAX);
	}
	unless(defined(&VM_INITIAL_PAGEIN)) {
	    eval 'sub VM_INITIAL_PAGEIN () {16;}' unless defined(&VM_INITIAL_PAGEIN);
	}
	eval 'sub ZERO_REGION_SIZE () {(2* 1024* 1024);}' unless defined(&ZERO_REGION_SIZE);
	eval 'sub PMAP_HAS_LARGEPAGES () {1;}' unless defined(&PMAP_HAS_LARGEPAGES);
	eval 'sub MINIDUMP_PAGE_TRACKING () {1;}' unless defined(&MINIDUMP_PAGE_TRACKING);
    }
}
1;

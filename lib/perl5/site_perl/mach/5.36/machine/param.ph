require '_h2ph_pre.ph';

no warnings qw(redefine misc);

unless(defined(&_AMD64_INCLUDE_PARAM_H_)) {
    eval 'sub _AMD64_INCLUDE_PARAM_H_ () {1;}' unless defined(&_AMD64_INCLUDE_PARAM_H_);
    require 'machine/_align.ph';
    eval 'sub __HAVE_ACPI () {1;}' unless defined(&__HAVE_ACPI);
    eval 'sub __PCI_REROUTE_INTERRUPT () {1;}' unless defined(&__PCI_REROUTE_INTERRUPT);
    unless(defined(&MACHINE)) {
	eval 'sub MACHINE () {"amd64";}' unless defined(&MACHINE);
    }
    unless(defined(&MACHINE_ARCH)) {
	eval 'sub MACHINE_ARCH () {"amd64";}' unless defined(&MACHINE_ARCH);
    }
    unless(defined(&MACHINE_ARCH32)) {
	eval 'sub MACHINE_ARCH32 () {"i386";}' unless defined(&MACHINE_ARCH32);
    }
    if(defined(&SMP)) {
	unless(defined(&MAXCPU)) {
	    eval 'sub MAXCPU () {1024;}' unless defined(&MAXCPU);
	}
    } else {
	eval 'sub MAXCPU () {1;}' unless defined(&MAXCPU);
    }
    unless(defined(&MAXMEMDOM)) {
	eval 'sub MAXMEMDOM () {8;}' unless defined(&MAXMEMDOM);
    }
    eval 'sub ALIGNBYTES () { &_ALIGNBYTES;}' unless defined(&ALIGNBYTES);
    eval 'sub ALIGN {
        my($p) = @_;
	    eval q( &_ALIGN($p));
    }' unless defined(&ALIGN);
    eval 'sub ALIGNED_POINTER {
        my($p, $t) = @_;
	    eval q(1);
    }' unless defined(&ALIGNED_POINTER);
    eval 'sub CACHE_LINE_SHIFT () {6;}' unless defined(&CACHE_LINE_SHIFT);
    eval 'sub CACHE_LINE_SIZE () {(1<<  &CACHE_LINE_SHIFT);}' unless defined(&CACHE_LINE_SIZE);
    eval 'sub NPTEPG () {( &PAGE_SIZE/($sizeof{ &pt_entry_t}));}' unless defined(&NPTEPG);
    eval 'sub NPTEPGSHIFT () {9;}' unless defined(&NPTEPGSHIFT);
    eval 'sub PAGE_SHIFT () {12;}' unless defined(&PAGE_SHIFT);
    eval 'sub PAGE_SIZE () {(1<< &PAGE_SHIFT);}' unless defined(&PAGE_SIZE);
    eval 'sub PAGE_MASK () {( &PAGE_SIZE-1);}' unless defined(&PAGE_MASK);
    eval 'sub NPDEPG () {( &PAGE_SIZE/($sizeof{ &pd_entry_t}));}' unless defined(&NPDEPG);
    eval 'sub NPDEPGSHIFT () {9;}' unless defined(&NPDEPGSHIFT);
    eval 'sub PDRSHIFT () {21;}' unless defined(&PDRSHIFT);
    eval 'sub NBPDR () {(1<< &PDRSHIFT);}' unless defined(&NBPDR);
    eval 'sub PDRMASK () {( &NBPDR-1);}' unless defined(&PDRMASK);
    eval 'sub NPDPEPG () {( &PAGE_SIZE/($sizeof{ &pdp_entry_t}));}' unless defined(&NPDPEPG);
    eval 'sub NPDPEPGSHIFT () {9;}' unless defined(&NPDPEPGSHIFT);
    eval 'sub PDPSHIFT () {30;}' unless defined(&PDPSHIFT);
    eval 'sub NBPDP () {(1<< &PDPSHIFT);}' unless defined(&NBPDP);
    eval 'sub PDPMASK () {( &NBPDP-1);}' unless defined(&PDPMASK);
    eval 'sub NPML4EPG () {( &PAGE_SIZE/($sizeof{ &pml4_entry_t}));}' unless defined(&NPML4EPG);
    eval 'sub NPML4EPGSHIFT () {9;}' unless defined(&NPML4EPGSHIFT);
    eval 'sub PML4SHIFT () {39;}' unless defined(&PML4SHIFT);
    eval 'sub NBPML4 () {(1<< &PML4SHIFT);}' unless defined(&NBPML4);
    eval 'sub PML4MASK () {( &NBPML4-1);}' unless defined(&PML4MASK);
    eval 'sub NPML5EPG () {( &PAGE_SIZE/($sizeof{ &pml5_entry_t}));}' unless defined(&NPML5EPG);
    eval 'sub NPML5EPGSHIFT () {9;}' unless defined(&NPML5EPGSHIFT);
    eval 'sub PML5SHIFT () {48;}' unless defined(&PML5SHIFT);
    eval 'sub NBPML5 () {(1<< &PML5SHIFT);}' unless defined(&NBPML5);
    eval 'sub PML5MASK () {( &NBPML5-1);}' unless defined(&PML5MASK);
    eval 'sub MAXPAGESIZES () {3;}' unless defined(&MAXPAGESIZES);
    eval 'sub IOPAGES () {2;}' unless defined(&IOPAGES);
    eval 'sub IOPERM_BITMAP_SIZE () {( &IOPAGES *  &PAGE_SIZE + 1);}' unless defined(&IOPERM_BITMAP_SIZE);
    unless(defined(&KSTACK_PAGES)) {
	if(defined(&KASAN) || defined(&KMSAN)) {
	    eval 'sub KSTACK_PAGES () {6;}' unless defined(&KSTACK_PAGES);
	} else {
	    eval 'sub KSTACK_PAGES () {4;}' unless defined(&KSTACK_PAGES);
	}
    }
    eval 'sub KSTACK_GUARD_PAGES () {1;}' unless defined(&KSTACK_GUARD_PAGES);
    eval 'sub round_page {
        my($x) = @_;
	    eval q((((($x)) +  &PAGE_MASK) & ~( &PAGE_MASK)));
    }' unless defined(&round_page);
    eval 'sub trunc_page {
        my($x) = @_;
	    eval q((($x) & ~( &PAGE_MASK)));
    }' unless defined(&trunc_page);
    eval 'sub trunc_2mpage {
        my($x) = @_;
	    eval q((($x) & ~ &PDRMASK));
    }' unless defined(&trunc_2mpage);
    eval 'sub round_2mpage {
        my($x) = @_;
	    eval q((((($x)) +  &PDRMASK) & ~ &PDRMASK));
    }' unless defined(&round_2mpage);
    eval 'sub trunc_1gpage {
        my($x) = @_;
	    eval q((($x) & ~ &PDPMASK));
    }' unless defined(&trunc_1gpage);
    eval 'sub atop {
        my($x) = @_;
	    eval q((($x) >>  &PAGE_SHIFT));
    }' unless defined(&atop);
    eval 'sub ptoa {
        my($x) = @_;
	    eval q((($x) <<  &PAGE_SHIFT));
    }' unless defined(&ptoa);
    eval 'sub amd64_btop {
        my($x) = @_;
	    eval q((($x) >>  &PAGE_SHIFT));
    }' unless defined(&amd64_btop);
    eval 'sub amd64_ptob {
        my($x) = @_;
	    eval q((($x) <<  &PAGE_SHIFT));
    }' unless defined(&amd64_ptob);
    eval 'sub pgtok {
        my($x) = @_;
	    eval q((($x) * ( &PAGE_SIZE / 1024)));
    }' unless defined(&pgtok);
    eval 'sub INKERNEL {
        my($va) = @_;
	    eval q(((($va) >=  &DMAP_MIN_ADDRESS  && ($va) <  &DMAP_MAX_ADDRESS) || (($va) >=  &VM_MIN_KERNEL_ADDRESS  && ($va) <  &VM_MAX_KERNEL_ADDRESS)));
    }' unless defined(&INKERNEL);
    if(defined(&SMP)) {
	eval 'sub SC_TABLESIZE () {1024;}' unless defined(&SC_TABLESIZE);
    }
}
1;

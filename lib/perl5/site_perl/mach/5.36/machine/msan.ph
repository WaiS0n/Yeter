require '_h2ph_pre.ph';

no warnings qw(redefine misc);

unless(defined(&_MACHINE_MSAN_H_)) {
    eval 'sub _MACHINE_MSAN_H_ () {1;}' unless defined(&_MACHINE_MSAN_H_);
    if(defined(&KMSAN)) {
	require 'vm/vm.ph';
	require 'vm/pmap.ph';
	require 'vm/vm_page.ph';
	require 'machine/vmparam.ph';
	eval 'sub KMSAN_ORIG_TYPE_SHIFT () {30;}' unless defined(&KMSAN_ORIG_TYPE_SHIFT);
	eval 'sub KMSAN_ORIG_PTR_MASK () {((1 <<  &KMSAN_ORIG_TYPE_SHIFT) - 1);}' unless defined(&KMSAN_ORIG_PTR_MASK);
	eval 'sub kmsan_md_orig_encode {
	    my($type,$ptr) = @_;
    	    eval q({ (($type <<  &KMSAN_ORIG_TYPE_SHIFT) | (($ptr &  &KMSAN_ORIG_PTR_MASK))); });
	}' unless defined(&kmsan_md_orig_encode);
	eval 'sub kmsan_md_orig_decode {
	    my($orig,$type,$ptr) = @_;
    	    eval q({ *$type = $orig >>  &KMSAN_ORIG_TYPE_SHIFT; *$ptr = ($orig &  &KMSAN_ORIG_PTR_MASK) |  &KERNBASE; });
	}' unless defined(&kmsan_md_orig_decode);
	eval 'sub kmsan_md_addr_to_shad {
	    my($addr) = @_;
    	    eval q({ ($addr -  &VM_MIN_KERNEL_ADDRESS +  &KMSAN_SHAD_MIN_ADDRESS); });
	}' unless defined(&kmsan_md_addr_to_shad);
	eval 'sub kmsan_md_addr_to_orig {
	    my($addr) = @_;
    	    eval q({ ($addr -  &VM_MIN_KERNEL_ADDRESS +  &KMSAN_ORIG_MIN_ADDRESS); });
	}' unless defined(&kmsan_md_addr_to_orig);
	eval 'sub kmsan_md_unsupported {
	    my($addr) = @_;
    	    eval q({ ($addr <  &VM_MIN_KERNEL_ADDRESS || $addr >=  &KERNBASE); });
	}' unless defined(&kmsan_md_unsupported);
    }
}
1;

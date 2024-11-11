require '_h2ph_pre.ph';

no warnings qw(redefine misc);

unless(defined(&_MACHINE_ASAN_H_)) {
    eval 'sub _MACHINE_ASAN_H_ () {1;}' unless defined(&_MACHINE_ASAN_H_);
    if(defined(&KASAN)) {
	require 'vm/vm.ph';
	require 'vm/pmap.ph';
	require 'vm/vm_page.ph';
	require 'machine/vmparam.ph';
	eval 'sub kasan_md_addr_to_shad {
	    my($addr) = @_;
    	    eval q({ ((($addr -  &VM_MIN_KERNEL_ADDRESS) >>  &KASAN_SHADOW_SCALE_SHIFT) +  &KASAN_MIN_ADDRESS); });
	}' unless defined(&kasan_md_addr_to_shad);
	eval 'sub kasan_md_unsupported {
	    my($addr) = @_;
    	    eval q({  &vm_offset_t  &kernmin;  &kernmin =  &vm_page_array ==  &NULL ?  &VM_MIN_KERNEL_ADDRESS : ( &vm_offset_t)( &vm_page_array +  &vm_page_array_size); ($addr <  &kernmin || $addr >=  &VM_MAX_KERNEL_ADDRESS); });
	}' unless defined(&kasan_md_unsupported);
	eval 'sub kasan_md_init {
	    my($void) = @_;
    	    eval q({ });
	}' unless defined(&kasan_md_init);
	eval 'sub kasan_md_init_early {
	    my($bootstack,$size) = @_;
    	    eval q({  &kasan_shadow_map($bootstack, $size); });
	}' unless defined(&kasan_md_init_early);
    }
}
1;

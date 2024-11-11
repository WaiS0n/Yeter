require '_h2ph_pre.ph';

no warnings qw(redefine misc);

unless(defined(&_SYS_VMEM_H_)) {
    eval 'sub _SYS_VMEM_H_ () {1;}' unless defined(&_SYS_VMEM_H_);
    require 'sys/types.ph';
    if(defined(&_KERNEL)) {
	eval 'sub VMEM_ADDR_MIN () {0;}' unless defined(&VMEM_ADDR_MIN);
	eval 'sub VMEM_ADDR_QCACHE_MIN () {1;}' unless defined(&VMEM_ADDR_QCACHE_MIN);
	eval 'sub VMEM_ADDR_MAX () {(~( &vmem_addr_t)0);}' unless defined(&VMEM_ADDR_MAX);
	eval 'sub VMEM_ALLOC () {0x1;}' unless defined(&VMEM_ALLOC);
	eval 'sub VMEM_FREE () {0x2;}' unless defined(&VMEM_FREE);
	eval 'sub VMEM_MAXFREE () {0x10;}' unless defined(&VMEM_MAXFREE);
    }
}
1;

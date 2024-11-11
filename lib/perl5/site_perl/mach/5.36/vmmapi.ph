require '_h2ph_pre.ph';

no warnings qw(redefine misc);

unless(defined(&_VMMAPI_H_)) {
    eval 'sub _VMMAPI_H_ () {1;}' unless defined(&_VMMAPI_H_);
    require 'sys/cdefs.ph';
    require 'sys/param.ph';
    require 'sys/cpuset.ph';
    require 'machine/vmm.ph';
    require 'machine/vmm_dev.ph';
    require 'stdbool.ph';
    eval 'sub VMMAPI_VERSION () {0200;}' unless defined(&VMMAPI_VERSION);
    eval("sub VM_MMAP_NONE () { 0; }") unless defined(&VM_MMAP_NONE);
    eval("sub VM_MMAP_ALL () { 1; }") unless defined(&VM_MMAP_ALL);
    eval("sub VM_MMAP_SPARSE () { 2; }") unless defined(&VM_MMAP_SPARSE);
    eval 'sub VM_MEM_F_INCORE () {0x1;}' unless defined(&VM_MEM_F_INCORE);
    eval 'sub VM_MEM_F_WIRED () {0x2;}' unless defined(&VM_MEM_F_WIRED);
    eval("sub VM_SYSMEM () { 0; }") unless defined(&VM_SYSMEM);
    eval("sub VM_BOOTROM () { 1; }") unless defined(&VM_BOOTROM);
    eval("sub VM_FRAMEBUFFER () { 2; }") unless defined(&VM_FRAMEBUFFER);
    eval("sub VM_PCIROM () { 3; }") unless defined(&VM_PCIROM);
}
1;

require '_h2ph_pre.ph';

no warnings qw(redefine misc);

unless(defined(&_MACHINE_VM_H_)) {
    eval 'sub _MACHINE_VM_H_ () {1;}' unless defined(&_MACHINE_VM_H_);
    require 'machine/specialreg.ph';
    eval 'sub VM_MEMATTR_UNCACHEABLE () {(( &vm_memattr_t) &PAT_UNCACHEABLE);}' unless defined(&VM_MEMATTR_UNCACHEABLE);
    eval 'sub VM_MEMATTR_WRITE_COMBINING () {(( &vm_memattr_t) &PAT_WRITE_COMBINING);}' unless defined(&VM_MEMATTR_WRITE_COMBINING);
    eval 'sub VM_MEMATTR_WRITE_THROUGH () {(( &vm_memattr_t) &PAT_WRITE_THROUGH);}' unless defined(&VM_MEMATTR_WRITE_THROUGH);
    eval 'sub VM_MEMATTR_WRITE_PROTECTED () {(( &vm_memattr_t) &PAT_WRITE_PROTECTED);}' unless defined(&VM_MEMATTR_WRITE_PROTECTED);
    eval 'sub VM_MEMATTR_WRITE_BACK () {(( &vm_memattr_t) &PAT_WRITE_BACK);}' unless defined(&VM_MEMATTR_WRITE_BACK);
    eval 'sub VM_MEMATTR_WEAK_UNCACHEABLE () {(( &vm_memattr_t) &PAT_UNCACHED);}' unless defined(&VM_MEMATTR_WEAK_UNCACHEABLE);
    eval 'sub VM_MEMATTR_DEFAULT () { &VM_MEMATTR_WRITE_BACK;}' unless defined(&VM_MEMATTR_DEFAULT);
    eval 'sub VM_MEMATTR_DEVICE () { &VM_MEMATTR_UNCACHEABLE;}' unless defined(&VM_MEMATTR_DEVICE);
}
1;

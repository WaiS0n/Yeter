require '_h2ph_pre.ph';

no warnings qw(redefine misc);

unless(defined(&_MACHINE_FPU_H_)) {
    eval 'sub _MACHINE_FPU_H_ () {1;}' unless defined(&_MACHINE_FPU_H_);
    require 'x86/fpu.ph';
    if(defined(&_KERNEL)) {
	eval 'sub PCB_USER_FPU {
	    my($pcb) = @_;
    	    eval q(((($pcb)-> &pcb_flags &  &PCB_KERNFPU) == 0));
	}' unless defined(&PCB_USER_FPU);
	eval 'sub XSAVE_AREA_ALIGN () {64;}' unless defined(&XSAVE_AREA_ALIGN);
	eval 'sub FPU_KERN_NORMAL () {0x;}' unless defined(&FPU_KERN_NORMAL);
	eval 'sub FPU_KERN_NOWAIT () {0x1;}' unless defined(&FPU_KERN_NOWAIT);
	eval 'sub FPU_KERN_KTHR () {0x2;}' unless defined(&FPU_KERN_KTHR);
	eval 'sub FPU_KERN_NOCTX () {0x4;}' unless defined(&FPU_KERN_NOCTX);
    }
}
1;

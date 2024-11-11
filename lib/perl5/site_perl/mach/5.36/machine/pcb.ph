require '_h2ph_pre.ph';

no warnings qw(redefine misc);

unless(defined(&_AMD64_PCB_H_)) {
    eval 'sub _AMD64_PCB_H_ () {1;}' unless defined(&_AMD64_PCB_H_);
    require 'machine/fpu.ph';
    require 'machine/segments.ph';
    if(defined(&__amd64__)) {
	eval 'sub PCB_FULL_IRET () {0x1;}' unless defined(&PCB_FULL_IRET);
	eval 'sub PCB_DBREGS () {0x2;}' unless defined(&PCB_DBREGS);
	eval 'sub PCB_KERNFPU () {0x4;}' unless defined(&PCB_KERNFPU);
	eval 'sub PCB_FPUINITDONE () {0x8;}' unless defined(&PCB_FPUINITDONE);
	eval 'sub PCB_USERFPUINITDONE () {0x10;}' unless defined(&PCB_USERFPUINITDONE);
	eval 'sub PCB_KERNFPU_THR () {0x20;}' unless defined(&PCB_KERNFPU_THR);
	eval 'sub PCB_32BIT () {0x40;}' unless defined(&PCB_32BIT);
	eval 'sub PCB_FPUNOSAVE () {0x80;}' unless defined(&PCB_FPUNOSAVE);
    } else {
    }
    if(defined(&_KERNEL)) {
	eval 'sub update_pcb_bases {
	    my($pcb) = @_;
    	    eval q( &set_pcb_flags(($pcb),  &PCB_FULL_IRET));
	}' unless defined(&update_pcb_bases);
    }
}
1;

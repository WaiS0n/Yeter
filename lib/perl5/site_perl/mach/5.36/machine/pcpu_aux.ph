require '_h2ph_pre.ph';

no warnings qw(redefine misc);

if(defined(&__i386__)) {
    require 'i386/pcpu_aux.ph';
} else {
    unless(defined(&_MACHINE_PCPU_AUX_H_)) {
	eval 'sub _MACHINE_PCPU_AUX_H_ () {1;}' unless defined(&_MACHINE_PCPU_AUX_H_);
	unless(defined(&_KERNEL)) {
	    die("Not for userspace");
	}
	unless(defined(&_SYS_PCPU_H_)) {
	    die("Do not include machine/pcpu_aux.h directly");
	}
	eval 'sub __curthread {
	    my($void) = @_;
    	    eval q({ \'struct thread\' * &td;  &__asm(\\"movq %%gs:%P1,%0\\" : \\"=r\\" ( &td) : \\"n\\" ( &offsetof(\'struct pcpu\',  &pc_curthread))); ( &td); });
	}' unless defined(&__curthread);
	eval 'sub curthread () {( &__curthread());}' unless defined(&curthread);
	eval 'sub curpcb () {( ($curthread->{td_md}->{md_pcb}));}' unless defined(&curpcb);
    }
}
1;

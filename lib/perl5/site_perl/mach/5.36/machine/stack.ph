require '_h2ph_pre.ph';

no warnings qw(redefine misc);

unless(defined(&_MACHINE_STACK_H_)) {
    eval 'sub _MACHINE_STACK_H_ () {1;}' unless defined(&_MACHINE_STACK_H_);
    require 'x86/stack.ph';
    if(defined(&_SYS_PROC_H_)) {
	eval 'sub GET_STACK_USAGE {
	    my($total, $used) = @_;
    	    eval q( &do { \'struct thread\' * &td =  &curthread; =  ($td->{td_kstack_pages}) *  &PAGE_SIZE; =  ($td->{td_kstack}) +  ($td->{td_kstack_pages}) *  &PAGE_SIZE -  &td; }  &while (0));
	}' unless defined(&GET_STACK_USAGE);
	eval 'sub kstack_contains {
	    my($td,$va,$len) = @_;
    	    eval q({ ($va >=  ($td->{td_kstack})  && $va + $len >= $va  && $va + $len <=  ($td->{td_kstack}) +  ($td->{td_kstack_pages}) *  &PAGE_SIZE); });
	}' unless defined(&kstack_contains);
    }
}
1;

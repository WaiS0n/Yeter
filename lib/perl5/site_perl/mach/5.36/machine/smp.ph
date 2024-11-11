require '_h2ph_pre.ph';

no warnings qw(redefine misc);

unless(defined(&_MACHINE_SMP_H_)) {
    eval 'sub _MACHINE_SMP_H_ () {1;}' unless defined(&_MACHINE_SMP_H_);
    if(defined(&_KERNEL)) {
	if(defined(&SMP)) {
	    unless(defined(&LOCORE)) {
		require 'x86/x86_smp.ph';
	    }
	}
    }
}
1;

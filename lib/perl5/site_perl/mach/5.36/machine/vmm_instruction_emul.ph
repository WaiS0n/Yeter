require '_h2ph_pre.ph';

no warnings qw(redefine misc);

unless(defined(&_VMM_INSTRUCTION_EMUL_H_)) {
    eval 'sub _VMM_INSTRUCTION_EMUL_H_ () {1;}' unless defined(&_VMM_INSTRUCTION_EMUL_H_);
    require 'sys/mman.ph';
    if(defined(&_KERNEL)) {
    }
    if(defined(&_KERNEL)) {
	eval 'sub VIE_INVALID_GLA () {(1 << 63);}' unless defined(&VIE_INVALID_GLA);
    } else {
    }
}
1;

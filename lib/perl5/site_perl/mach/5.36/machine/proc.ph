require '_h2ph_pre.ph';

no warnings qw(redefine misc);

if(defined(&__i386__)) {
    require 'i386/proc.ph';
} else {
    unless(defined(&_MACHINE_PROC_H_)) {
	eval 'sub _MACHINE_PROC_H_ () {1;}' unless defined(&_MACHINE_PROC_H_);
	require 'sys/queue.ph';
	require 'machine/pcb.ph';
	require 'machine/segments.ph';
	eval 'sub PMAP_INVL_GEN_NEXT_INVALID () {0x1;}' unless defined(&PMAP_INVL_GEN_NEXT_INVALID);
	eval 'sub P_MD_KPTI () {0x1;}' unless defined(&P_MD_KPTI);
	eval 'sub P_MD_LA48 () {0x2;}' unless defined(&P_MD_LA48);
	eval 'sub P_MD_LA57 () {0x4;}' unless defined(&P_MD_LA57);
	eval 'sub KINFO_PROC_SIZE () {1088;}' unless defined(&KINFO_PROC_SIZE);
	eval 'sub KINFO_PROC32_SIZE () {768;}' unless defined(&KINFO_PROC32_SIZE);
	if(defined(&_KERNEL)) {
	    eval 'sub NARGREGS () {6;}' unless defined(&NARGREGS);
	}
    }
}
1;

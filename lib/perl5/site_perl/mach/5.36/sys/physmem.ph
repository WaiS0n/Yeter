require '_h2ph_pre.ph';

no warnings qw(redefine misc);

unless(defined(&_SYS_PHYSMEM_H_)) {
    eval 'sub _SYS_PHYSMEM_H_ () {1;}' unless defined(&_SYS_PHYSMEM_H_);
    unless(defined(&_KERNEL)) {
	require 'stdbool.ph';
    }
    eval 'sub EXFLAG_NODUMP () {0x1;}' unless defined(&EXFLAG_NODUMP);
    eval 'sub EXFLAG_NOALLOC () {0x2;}' unless defined(&EXFLAG_NOALLOC);
    if(defined(&FDT)) {
	require 'machine/ofw_machdep.ph';
	eval 'sub physmem_hardware_regions {
	    my($mrptr,$mrcount) = @_;
    	    eval q({  &while ($mrcount--) {  &physmem_hardware_region( ($mrptr->{mr_start}),  ($mrptr->{mr_size})); ++$mrptr; } });
	}' unless defined(&physmem_hardware_regions);
	eval 'sub physmem_exclude_regions {
	    my($mrptr,$mrcount,$exflags) = @_;
    	    eval q({  &while ($mrcount--) {  &physmem_exclude_region( ($mrptr->{mr_start}),  ($mrptr->{mr_size}), $exflags); ++$mrptr; } });
	}' unless defined(&physmem_exclude_regions);
    }
}
1;

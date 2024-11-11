require '_h2ph_pre.ph';

no warnings qw(redefine misc);

unless(defined(&_MACHINE_RESOURCE_H_)) {
    eval 'sub _MACHINE_RESOURCE_H_ () {1;}' unless defined(&_MACHINE_RESOURCE_H_);
    eval 'sub SYS_RES_IRQ () {1;}' unless defined(&SYS_RES_IRQ);
    eval 'sub SYS_RES_DRQ () {2;}' unless defined(&SYS_RES_DRQ);
    eval 'sub SYS_RES_MEMORY () {3;}' unless defined(&SYS_RES_MEMORY);
    eval 'sub SYS_RES_IOPORT () {4;}' unless defined(&SYS_RES_IOPORT);
    if(defined(&NEW_PCIB)) {
	eval 'sub PCI_RES_BUS () {5;}' unless defined(&PCI_RES_BUS);
    }
}
1;

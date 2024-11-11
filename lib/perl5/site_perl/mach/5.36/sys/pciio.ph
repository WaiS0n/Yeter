require '_h2ph_pre.ph';

no warnings qw(redefine misc);

unless(defined(&_SYS_PCIIO_H_)) {
    eval 'sub _SYS_PCIIO_H_ () {1;}' unless defined(&_SYS_PCIIO_H_);
    require 'sys/ioccom.ph';
    eval 'sub PCI_MAXNAMELEN () {16;}' unless defined(&PCI_MAXNAMELEN);
    eval("sub PCI_GETCONF_LAST_DEVICE () { 0; }") unless defined(&PCI_GETCONF_LAST_DEVICE);
    eval("sub PCI_GETCONF_LIST_CHANGED () { 1; }") unless defined(&PCI_GETCONF_LIST_CHANGED);
    eval("sub PCI_GETCONF_MORE_DEVS () { 2; }") unless defined(&PCI_GETCONF_MORE_DEVS);
    eval("sub PCI_GETCONF_ERROR () { 3; }") unless defined(&PCI_GETCONF_ERROR);
    eval("sub PCI_GETCONF_NO_MATCH () { 0x0000; }") unless defined(&PCI_GETCONF_NO_MATCH);
    eval("sub PCI_GETCONF_MATCH_DOMAIN () { 0x0001; }") unless defined(&PCI_GETCONF_MATCH_DOMAIN);
    eval("sub PCI_GETCONF_MATCH_BUS () { 0x0002; }") unless defined(&PCI_GETCONF_MATCH_BUS);
    eval("sub PCI_GETCONF_MATCH_DEV () { 0x0004; }") unless defined(&PCI_GETCONF_MATCH_DEV);
    eval("sub PCI_GETCONF_MATCH_FUNC () { 0x0008; }") unless defined(&PCI_GETCONF_MATCH_FUNC);
    eval("sub PCI_GETCONF_MATCH_NAME () { 0x0010; }") unless defined(&PCI_GETCONF_MATCH_NAME);
    eval("sub PCI_GETCONF_MATCH_UNIT () { 0x0020; }") unless defined(&PCI_GETCONF_MATCH_UNIT);
    eval("sub PCI_GETCONF_MATCH_VENDOR () { 0x0040; }") unless defined(&PCI_GETCONF_MATCH_VENDOR);
    eval("sub PCI_GETCONF_MATCH_DEVICE () { 0x0080; }") unless defined(&PCI_GETCONF_MATCH_DEVICE);
    eval("sub PCI_GETCONF_MATCH_CLASS () { 0x0100; }") unless defined(&PCI_GETCONF_MATCH_CLASS);
    eval 'sub PVE_FLAG_IDENT () {0x1;}' unless defined(&PVE_FLAG_IDENT);
    eval 'sub PVE_FLAG_RW () {0x2;}' unless defined(&PVE_FLAG_RW);
    eval 'sub PVE_NEXT {
        my($pve) = @_;
	    eval q(((($pve) + $sizeof{\'struct pci_vpd_element\'} + ($pve)-> &pve_datalen)));
    }' unless defined(&PVE_NEXT);
    eval 'sub PCIBARIO_READ () {0x1;}' unless defined(&PCIBARIO_READ);
    eval 'sub PCIBARIO_WRITE () {0x2;}' unless defined(&PCIBARIO_WRITE);
    eval 'sub PCIIO_BAR_MMAP_FIXED () {0x1;}' unless defined(&PCIIO_BAR_MMAP_FIXED);
    eval 'sub PCIIO_BAR_MMAP_EXCL () {0x2;}' unless defined(&PCIIO_BAR_MMAP_EXCL);
    eval 'sub PCIIO_BAR_MMAP_RW () {0x4;}' unless defined(&PCIIO_BAR_MMAP_RW);
    eval 'sub PCIIO_BAR_MMAP_ACTIVATE () {0x8;}' unless defined(&PCIIO_BAR_MMAP_ACTIVATE);
    eval 'sub PCIOCGETCONF () { &_IOWR(ord(\'p\'), 5, \'struct pci_conf_io\');}' unless defined(&PCIOCGETCONF);
    eval 'sub PCIOCREAD () { &_IOWR(ord(\'p\'), 2, \'struct pci_io\');}' unless defined(&PCIOCREAD);
    eval 'sub PCIOCWRITE () { &_IOWR(ord(\'p\'), 3, \'struct pci_io\');}' unless defined(&PCIOCWRITE);
    eval 'sub PCIOCATTACHED () { &_IOWR(ord(\'p\'), 4, \'struct pci_io\');}' unless defined(&PCIOCATTACHED);
    eval 'sub PCIOCGETBAR () { &_IOWR(ord(\'p\'), 6, \'struct pci_bar_io\');}' unless defined(&PCIOCGETBAR);
    eval 'sub PCIOCLISTVPD () { &_IOWR(ord(\'p\'), 7, \'struct pci_list_vpd_io\');}' unless defined(&PCIOCLISTVPD);
    eval 'sub PCIOCBARMMAP () { &_IOWR(ord(\'p\'), 8, \'struct pci_bar_mmap\');}' unless defined(&PCIOCBARMMAP);
    eval 'sub PCIOCBARIO () { &_IOWR(ord(\'p\'), 9, \'struct pci_bar_ioreq\');}' unless defined(&PCIOCBARIO);
}
1;

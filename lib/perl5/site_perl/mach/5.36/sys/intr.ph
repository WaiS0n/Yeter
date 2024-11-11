require '_h2ph_pre.ph';

no warnings qw(redefine misc);

unless(defined(&_SYS_INTR_H_)) {
    eval 'sub _SYS_INTR_H_ () {1;}' unless defined(&_SYS_INTR_H_);
    unless(defined(&INTRNG)) {
	die("Need\ INTRNG\ for\ this\ file");
    }
    require 'sys/systm.ph';
    eval 'sub INTR_IRQ_INVALID () {0xffffffff;}' unless defined(&INTR_IRQ_INVALID);
    eval("sub INTR_MAP_DATA_ACPI () { 0; }") unless defined(&INTR_MAP_DATA_ACPI);
    eval("sub INTR_MAP_DATA_FDT () { 1; }") unless defined(&INTR_MAP_DATA_FDT);
    eval("sub INTR_MAP_DATA_GPIO () { 2; }") unless defined(&INTR_MAP_DATA_GPIO);
    eval("sub INTR_MAP_DATA_MSI () { 3; }") unless defined(&INTR_MAP_DATA_MSI);
    eval("sub INTR_MAP_DATA_PLAT_1 () { 1000; }") unless defined(&INTR_MAP_DATA_PLAT_1);
    eval("sub INTR_MAP_DATA_PLAT_2 () { 1001; }") unless defined(&INTR_MAP_DATA_PLAT_2);
    eval("sub INTR_MAP_DATA_PLAT_3 () { 1002; }") unless defined(&INTR_MAP_DATA_PLAT_3);
    eval("sub INTR_MAP_DATA_PLAT_4 () { 1003; }") unless defined(&INTR_MAP_DATA_PLAT_4);
    eval("sub INTR_MAP_DATA_PLAT_5 () { 1004; }") unless defined(&INTR_MAP_DATA_PLAT_5);
    if(defined(&notyet)) {
	eval 'sub INTR_SOLO () { &INTR_MD1;}' unless defined(&INTR_SOLO);
    } else {
    }
    eval 'sub INTR_ISRC_NAMELEN () {( &MAXCOMLEN + 1);}' unless defined(&INTR_ISRC_NAMELEN);
    eval 'sub INTR_ISRCF_IPI () {0x1;}' unless defined(&INTR_ISRCF_IPI);
    eval 'sub INTR_ISRCF_PPI () {0x2;}' unless defined(&INTR_ISRCF_PPI);
    eval 'sub INTR_ISRCF_BOUND () {0x4;}' unless defined(&INTR_ISRCF_BOUND);
    if(defined(&INTR_SOLO)) {
    }
    if(defined(&SMP)) {
    }
    if(defined(&SMP)) {
    }
}
1;

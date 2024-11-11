require '_h2ph_pre.ph';

no warnings qw(redefine misc);

unless(defined(&_SYS__BUS_DMA_H_)) {
    eval 'sub _SYS__BUS_DMA_H_ () {1;}' unless defined(&_SYS__BUS_DMA_H_);
    eval("sub BUS_DMA_LOCK () { 0x01; }") unless defined(&BUS_DMA_LOCK);
    eval("sub BUS_DMA_UNLOCK () { 0x02; }") unless defined(&BUS_DMA_UNLOCK);
}
1;

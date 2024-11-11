require '_h2ph_pre.ph';

no warnings qw(redefine misc);

unless(defined(&_AMD64_BUS_DMA_H_)) {
    eval 'sub _AMD64_BUS_DMA_H_ () {1;}' unless defined(&_AMD64_BUS_DMA_H_);
    require 'x86/bus_dma.ph';
}
1;

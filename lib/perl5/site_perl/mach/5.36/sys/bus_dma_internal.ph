require '_h2ph_pre.ph';

no warnings qw(redefine misc);

unless(defined(&_BUS_DMA_INTERNAL_H_)) {
    eval 'sub _BUS_DMA_INTERNAL_H_ () {1;}' unless defined(&_BUS_DMA_INTERNAL_H_);
}
1;

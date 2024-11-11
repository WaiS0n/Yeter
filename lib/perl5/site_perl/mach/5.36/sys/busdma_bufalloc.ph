require '_h2ph_pre.ph';

no warnings qw(redefine misc);

unless(defined(&_MACHINE_BUSDMA_BUFALLOC_H_)) {
    eval 'sub _MACHINE_BUSDMA_BUFALLOC_H_ () {1;}' unless defined(&_MACHINE_BUSDMA_BUFALLOC_H_);
    require 'machine/bus.ph';
    require 'vm/uma.ph';
}
1;

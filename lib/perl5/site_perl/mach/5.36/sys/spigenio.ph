require '_h2ph_pre.ph';

no warnings qw(redefine misc);

unless(defined(&_SYS_SPIGENIO_H_)) {
    eval 'sub _SYS_SPIGENIO_H_ () {1;}' unless defined(&_SYS_SPIGENIO_H_);
    require 'sys/_iovec.ph';
    eval 'sub SPIGENIOC_BASE () {ord(\'S\');}' unless defined(&SPIGENIOC_BASE);
    eval 'sub SPIGENIOC_TRANSFER () { &_IOW( &SPIGENIOC_BASE, 0, \'struct spigen_transfer\');}' unless defined(&SPIGENIOC_TRANSFER);
    eval 'sub SPIGENIOC_TRANSFER_MMAPPED () { &_IOW( &SPIGENIOC_BASE, 1, \'struct spigen_transfer_mmapped\');}' unless defined(&SPIGENIOC_TRANSFER_MMAPPED);
    eval 'sub SPIGENIOC_GET_CLOCK_SPEED () { &_IOR( &SPIGENIOC_BASE, 2,  &uint32_t);}' unless defined(&SPIGENIOC_GET_CLOCK_SPEED);
    eval 'sub SPIGENIOC_SET_CLOCK_SPEED () { &_IOW( &SPIGENIOC_BASE, 3,  &uint32_t);}' unless defined(&SPIGENIOC_SET_CLOCK_SPEED);
    eval 'sub SPIGENIOC_GET_SPI_MODE () { &_IOR( &SPIGENIOC_BASE, 4,  &uint32_t);}' unless defined(&SPIGENIOC_GET_SPI_MODE);
    eval 'sub SPIGENIOC_SET_SPI_MODE () { &_IOW( &SPIGENIOC_BASE, 5,  &uint32_t);}' unless defined(&SPIGENIOC_SET_SPI_MODE);
}
1;

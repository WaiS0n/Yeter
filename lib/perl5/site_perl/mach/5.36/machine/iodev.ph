require '_h2ph_pre.ph';

no warnings qw(redefine misc);

unless(defined(&_MACHINE_IODEV_H_)) {
    eval 'sub _MACHINE_IODEV_H_ () {1;}' unless defined(&_MACHINE_IODEV_H_);
    if(defined(&_KERNEL)) {
	require 'machine/cpufunc.ph';
	eval 'sub iodev_read_1 () { &inb;}' unless defined(&iodev_read_1);
	eval 'sub iodev_read_2 () { &inw;}' unless defined(&iodev_read_2);
	eval 'sub iodev_read_4 () { &inl;}' unless defined(&iodev_read_4);
	eval 'sub iodev_write_1 () { &outb;}' unless defined(&iodev_write_1);
	eval 'sub iodev_write_2 () { &outw;}' unless defined(&iodev_write_2);
	eval 'sub iodev_write_4 () { &outl;}' unless defined(&iodev_write_4);
    }
}
1;

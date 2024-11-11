require '_h2ph_pre.ph';

no warnings qw(redefine misc);

unless(defined(&_MACHINE_MEMDEV_H_)) {
    eval 'sub _MACHINE_MEMDEV_H_ () {1;}' unless defined(&_MACHINE_MEMDEV_H_);
    eval 'sub CDEV_MINOR_MEM () {0;}' unless defined(&CDEV_MINOR_MEM);
    eval 'sub CDEV_MINOR_KMEM () {1;}' unless defined(&CDEV_MINOR_KMEM);
}
1;

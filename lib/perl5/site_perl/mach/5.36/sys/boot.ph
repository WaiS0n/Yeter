require '_h2ph_pre.ph';

no warnings qw(redefine misc);

unless(defined(&_SYS_BOOT_H_)) {
    eval 'sub _SYS_BOOT_H_ () {1;}' unless defined(&_SYS_BOOT_H_);
    eval 'sub PATH_KERNEL () {"/boot/kernel/kernel";}' unless defined(&PATH_KERNEL);
}
1;

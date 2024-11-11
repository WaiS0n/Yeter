require '_h2ph_pre.ph';

no warnings qw(redefine misc);

unless(defined(&_FSTAB_H_)) {
    eval 'sub _FSTAB_H_ () {1;}' unless defined(&_FSTAB_H_);
    eval 'sub _PATH_FSTAB () {"/etc/fstab";}' unless defined(&_PATH_FSTAB);
    eval 'sub FSTAB () {"/etc/fstab";}' unless defined(&FSTAB);
    eval 'sub FSTAB_RW () {"rw";}' unless defined(&FSTAB_RW);
    eval 'sub FSTAB_RQ () {"rq";}' unless defined(&FSTAB_RQ);
    eval 'sub FSTAB_RO () {"ro";}' unless defined(&FSTAB_RO);
    eval 'sub FSTAB_SW () {"sw";}' unless defined(&FSTAB_SW);
    eval 'sub FSTAB_XX () {"xx";}' unless defined(&FSTAB_XX);
    require 'sys/cdefs.ph';
}
1;

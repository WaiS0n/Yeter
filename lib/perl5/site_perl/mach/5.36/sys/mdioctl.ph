require '_h2ph_pre.ph';

no warnings qw(redefine misc);

unless(defined(&_SYS_MDIOCTL_H_)) {
    eval 'sub _SYS_MDIOCTL_H_ () {1;}' unless defined(&_SYS_MDIOCTL_H_);
    eval("sub MD_MALLOC () { 0; }") unless defined(&MD_MALLOC);
    eval("sub MD_PRELOAD () { 1; }") unless defined(&MD_PRELOAD);
    eval("sub MD_VNODE () { 2; }") unless defined(&MD_VNODE);
    eval("sub MD_SWAP () { 3; }") unless defined(&MD_SWAP);
    eval("sub MD_NULL () { 4; }") unless defined(&MD_NULL);
    eval 'sub MDNPAD () {96;}' unless defined(&MDNPAD);
    eval 'sub MD_NAME () {"md";}' unless defined(&MD_NAME);
    eval 'sub MDCTL_NAME () {"mdctl";}' unless defined(&MDCTL_NAME);
    eval 'sub MDIOVERSION () {0;}' unless defined(&MDIOVERSION);
    eval 'sub MDIOCATTACH () { &_IOWR(ord(\'m\'), 0, \'struct md_ioctl\');}' unless defined(&MDIOCATTACH);
    eval 'sub MDIOCDETACH () { &_IOWR(ord(\'m\'), 1, \'struct md_ioctl\');}' unless defined(&MDIOCDETACH);
    eval 'sub MDIOCQUERY () { &_IOWR(ord(\'m\'), 2, \'struct md_ioctl\');}' unless defined(&MDIOCQUERY);
    eval 'sub MDIOCRESIZE () { &_IOWR(ord(\'m\'), 4, \'struct md_ioctl\');}' unless defined(&MDIOCRESIZE);
    eval 'sub MD_CLUSTER () {0x1;}' unless defined(&MD_CLUSTER);
    eval 'sub MD_RESERVE () {0x2;}' unless defined(&MD_RESERVE);
    eval 'sub MD_AUTOUNIT () {0x4;}' unless defined(&MD_AUTOUNIT);
    eval 'sub MD_READONLY () {0x8;}' unless defined(&MD_READONLY);
    eval 'sub MD_COMPRESS () {0x10;}' unless defined(&MD_COMPRESS);
    eval 'sub MD_FORCE () {0x20;}' unless defined(&MD_FORCE);
    eval 'sub MD_ASYNC () {0x40;}' unless defined(&MD_ASYNC);
    eval 'sub MD_VERIFY () {0x80;}' unless defined(&MD_VERIFY);
    eval 'sub MD_CACHE () {0x100;}' unless defined(&MD_CACHE);
    eval 'sub MD_MUSTDEALLOC () {0x200;}' unless defined(&MD_MUSTDEALLOC);
}
1;

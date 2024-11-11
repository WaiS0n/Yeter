require '_h2ph_pre.ph';

no warnings qw(redefine misc);

unless(defined(&_SYS_REBOOT_H_)) {
    eval 'sub _SYS_REBOOT_H_ () {1;}' unless defined(&_SYS_REBOOT_H_);
    eval 'sub RB_AUTOBOOT () {0;}' unless defined(&RB_AUTOBOOT);
    eval 'sub RB_ASKNAME () {0x1;}' unless defined(&RB_ASKNAME);
    eval 'sub RB_SINGLE () {0x2;}' unless defined(&RB_SINGLE);
    eval 'sub RB_NOSYNC () {0x4;}' unless defined(&RB_NOSYNC);
    eval 'sub RB_HALT () {0x8;}' unless defined(&RB_HALT);
    eval 'sub RB_INITNAME () {0x10;}' unless defined(&RB_INITNAME);
    eval 'sub RB_DFLTROOT () {0x20;}' unless defined(&RB_DFLTROOT);
    eval 'sub RB_KDB () {0x40;}' unless defined(&RB_KDB);
    eval 'sub RB_RDONLY () {0x80;}' unless defined(&RB_RDONLY);
    eval 'sub RB_DUMP () {0x100;}' unless defined(&RB_DUMP);
    eval 'sub RB_MINIROOT () {0x200;}' unless defined(&RB_MINIROOT);
    eval 'sub RB_VERBOSE () {0x800;}' unless defined(&RB_VERBOSE);
    eval 'sub RB_SERIAL () {0x1000;}' unless defined(&RB_SERIAL);
    eval 'sub RB_CDROM () {0x2000;}' unless defined(&RB_CDROM);
    eval 'sub RB_POWEROFF () {0x4000;}' unless defined(&RB_POWEROFF);
    eval 'sub RB_GDB () {0x8000;}' unless defined(&RB_GDB);
    eval 'sub RB_MUTE () {0x10000;}' unless defined(&RB_MUTE);
    eval 'sub RB_SELFTEST () {0x20000;}' unless defined(&RB_SELFTEST);
    eval 'sub RB_RESERVED1 () {0x40000;}' unless defined(&RB_RESERVED1);
    eval 'sub RB_RESERVED2 () {0x80000;}' unless defined(&RB_RESERVED2);
    eval 'sub RB_PAUSE () {0x100000;}' unless defined(&RB_PAUSE);
    eval 'sub RB_REROOT () {0x200000;}' unless defined(&RB_REROOT);
    eval 'sub RB_POWERCYCLE () {0x400000;}' unless defined(&RB_POWERCYCLE);
    eval 'sub RB_PROBE () {0x10000000;}' unless defined(&RB_PROBE);
    eval 'sub RB_MULTIPLE () {0x20000000;}' unless defined(&RB_MULTIPLE);
    eval 'sub RB_BOOTINFO () {0x80000000;}' unless defined(&RB_BOOTINFO);
}
1;

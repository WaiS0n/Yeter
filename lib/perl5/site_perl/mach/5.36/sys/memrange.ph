require '_h2ph_pre.ph';

no warnings qw(redefine misc);

unless(defined(&_SYS_MEMRANGE_H_)) {
    eval 'sub _SYS_MEMRANGE_H_ () {1;}' unless defined(&_SYS_MEMRANGE_H_);
    require 'sys/ioccom.ph';
    eval 'sub MDF_UNCACHEABLE () {(1<<0);}' unless defined(&MDF_UNCACHEABLE);
    eval 'sub MDF_WRITECOMBINE () {(1<<1);}' unless defined(&MDF_WRITECOMBINE);
    eval 'sub MDF_WRITETHROUGH () {(1<<2);}' unless defined(&MDF_WRITETHROUGH);
    eval 'sub MDF_WRITEBACK () {(1<<3);}' unless defined(&MDF_WRITEBACK);
    eval 'sub MDF_WRITEPROTECT () {(1<<4);}' unless defined(&MDF_WRITEPROTECT);
    eval 'sub MDF_UNKNOWN () {(1<<5);}' unless defined(&MDF_UNKNOWN);
    eval 'sub MDF_ATTRMASK () {(0xffffff);}' unless defined(&MDF_ATTRMASK);
    eval 'sub MDF_FIXBASE () {(1<<24);}' unless defined(&MDF_FIXBASE);
    eval 'sub MDF_FIXLEN () {(1<<25);}' unless defined(&MDF_FIXLEN);
    eval 'sub MDF_FIRMWARE () {(1<<26);}' unless defined(&MDF_FIRMWARE);
    eval 'sub MDF_ACTIVE () {(1<<27);}' unless defined(&MDF_ACTIVE);
    eval 'sub MDF_BOGUS () {(1<<28);}' unless defined(&MDF_BOGUS);
    eval 'sub MDF_FIXACTIVE () {(1<<29);}' unless defined(&MDF_FIXACTIVE);
    eval 'sub MDF_BUSY () {(1<<30);}' unless defined(&MDF_BUSY);
    eval 'sub MDF_FORCE () {(1<<31);}' unless defined(&MDF_FORCE);
    eval 'sub MEMRANGE_SET_UPDATE () {0;}' unless defined(&MEMRANGE_SET_UPDATE);
    eval 'sub MEMRANGE_SET_REMOVE () {1;}' unless defined(&MEMRANGE_SET_REMOVE);
    eval 'sub MEMRANGE_GET () { &_IOWR(ord(\'m\'), 50, \'struct mem_range_op\');}' unless defined(&MEMRANGE_GET);
    eval 'sub MEMRANGE_SET () { &_IOW(ord(\'m\'), 51, \'struct mem_range_op\');}' unless defined(&MEMRANGE_SET);
    eval 'sub ME_STATE_INVALID () {0;}' unless defined(&ME_STATE_INVALID);
    eval 'sub ME_STATE_VALID () {1;}' unless defined(&ME_STATE_VALID);
    eval 'sub ME_STATE_MAPPED () {2;}' unless defined(&ME_STATE_MAPPED);
    eval 'sub MEM_EXTRACT_PADDR () { &_IOWR(ord(\'m\'), 52, \'struct mem_extract\');}' unless defined(&MEM_EXTRACT_PADDR);
    eval 'sub MEM_KERNELDUMP () { &_IOW(ord(\'m\'), 53, \'struct mem_livedump_arg\');}' unless defined(&MEM_KERNELDUMP);
    if(defined(&_KERNEL)) {
    }
}
1;

require '_h2ph_pre.ph';

no warnings qw(redefine misc);

unless(defined(&_SYS_CONF_H_)) {
    eval 'sub _SYS_CONF_H_ () {1;}' unless defined(&_SYS_CONF_H_);
    if(defined(&_KERNEL)) {
	require 'sys/_eventhandler.ph';
    } else {
	require 'sys/queue.ph';
    }
    eval 'sub SI_ETERNAL () {0x1;}' unless defined(&SI_ETERNAL);
    eval 'sub SI_ALIAS () {0x2;}' unless defined(&SI_ALIAS);
    eval 'sub SI_NAMED () {0x4;}' unless defined(&SI_NAMED);
    eval 'sub SI_UNUSED1 () {0x8;}' unless defined(&SI_UNUSED1);
    eval 'sub SI_CHILD () {0x10;}' unless defined(&SI_CHILD);
    eval 'sub SI_DUMPDEV () {0x80;}' unless defined(&SI_DUMPDEV);
    eval 'sub SI_CLONELIST () {0x200;}' unless defined(&SI_CLONELIST);
    eval 'sub SI_UNMAPPED () {0x400;}' unless defined(&SI_UNMAPPED);
    eval 'sub SI_NOSPLIT () {0x800;}' unless defined(&SI_NOSPLIT);
    eval 'sub si_snapdata () { ($__si_u->{__sid_snapdata});}' unless defined(&si_snapdata);
    if(defined(&_KERNEL)) {
    }
    eval 'sub D_TAPE () {0x1;}' unless defined(&D_TAPE);
    eval 'sub D_DISK () {0x2;}' unless defined(&D_DISK);
    eval 'sub D_TTY () {0x4;}' unless defined(&D_TTY);
    eval 'sub D_MEM () {0x8;}' unless defined(&D_MEM);
    eval 'sub UID_ROOT () {0;}' unless defined(&UID_ROOT);
    eval 'sub UID_BIN () {3;}' unless defined(&UID_BIN);
    eval 'sub UID_UUCP () {66;}' unless defined(&UID_UUCP);
    eval 'sub UID_NOBODY () {65534;}' unless defined(&UID_NOBODY);
    eval 'sub GID_WHEEL () {0;}' unless defined(&GID_WHEEL);
    eval 'sub GID_KMEM () {2;}' unless defined(&GID_KMEM);
    eval 'sub GID_TTY () {4;}' unless defined(&GID_TTY);
    eval 'sub GID_OPERATOR () {5;}' unless defined(&GID_OPERATOR);
    eval 'sub GID_BIN () {7;}' unless defined(&GID_BIN);
    eval 'sub GID_GAMES () {13;}' unless defined(&GID_GAMES);
    eval 'sub GID_VIDEO () {44;}' unless defined(&GID_VIDEO);
    eval 'sub GID_RT_PRIO () {47;}' unless defined(&GID_RT_PRIO);
    eval 'sub GID_ID_PRIO () {48;}' unless defined(&GID_ID_PRIO);
    eval 'sub GID_DIALER () {68;}' unless defined(&GID_DIALER);
    eval 'sub GID_NOGROUP () {65533;}' unless defined(&GID_NOGROUP);
    eval 'sub GID_NOBODY () {65534;}' unless defined(&GID_NOBODY);
    if(defined(&_KERNEL)) {
	eval 'sub D_TYPEMASK () {0xffff;}' unless defined(&D_TYPEMASK);
	eval 'sub D_TRACKCLOSE () {0x80000;}' unless defined(&D_TRACKCLOSE);
	eval 'sub D_MMAP_ANON () {0x100000;}' unless defined(&D_MMAP_ANON);
	eval 'sub D_GIANTOK () {0x200000;}' unless defined(&D_GIANTOK);
	eval 'sub D_NEEDGIANT () {0x400000;}' unless defined(&D_NEEDGIANT);
	eval 'sub D_NEEDMINOR () {0x800000;}' unless defined(&D_NEEDMINOR);
	eval 'sub D_VERSION_00 () {0x20011966;}' unless defined(&D_VERSION_00);
	eval 'sub D_VERSION_01 () {0x17032005;}' unless defined(&D_VERSION_01);
	eval 'sub D_VERSION_02 () {0x28042009;}' unless defined(&D_VERSION_02);
	eval 'sub D_VERSION_03 () {0x17122009;}' unless defined(&D_VERSION_03);
	eval 'sub D_VERSION_04 () {0x5c48c353;}' unless defined(&D_VERSION_04);
	eval 'sub D_VERSION () { &D_VERSION_04;}' unless defined(&D_VERSION);
	eval 'sub D_INIT () {0x80000000;}' unless defined(&D_INIT);
	eval 'sub d_gianttrick () { ($__d_giant->{gianttrick});}' unless defined(&d_gianttrick);
	eval 'sub d_postfree_list () { ($__d_giant->{postfree_list});}' unless defined(&d_postfree_list);
	eval 'sub DEV_MODULE_ORDERED {
	    my($name, $evh, $arg, $ord) = @_;
    	    eval q( &static  &moduledata_t $name &_mod = { $name, $evh, $arg };  &DECLARE_MODULE($name, $name &_mod,  &SI_SUB_DRIVERS, $ord));
	}' unless defined(&DEV_MODULE_ORDERED);
	eval 'sub DEV_MODULE {
	    my($name, $evh, $arg) = @_;
    	    eval q( &DEV_MODULE_ORDERED($name, $evh, $arg,  &SI_ORDER_MIDDLE));
	}' unless defined(&DEV_MODULE);
	eval 'sub CLONE_UNITMASK () {0xfffff;}' unless defined(&CLONE_UNITMASK);
	eval 'sub CLONE_FLAG0 () {( &CLONE_UNITMASK + 1);}' unless defined(&CLONE_FLAG0);
	eval 'sub MAKEDEV_REF () {0x1;}' unless defined(&MAKEDEV_REF);
	eval 'sub MAKEDEV_WHTOUT () {0x2;}' unless defined(&MAKEDEV_WHTOUT);
	eval 'sub MAKEDEV_NOWAIT () {0x4;}' unless defined(&MAKEDEV_NOWAIT);
	eval 'sub MAKEDEV_WAITOK () {0x8;}' unless defined(&MAKEDEV_WAITOK);
	eval 'sub MAKEDEV_ETERNAL () {0x10;}' unless defined(&MAKEDEV_ETERNAL);
	eval 'sub MAKEDEV_CHECKNAME () {0x20;}' unless defined(&MAKEDEV_CHECKNAME);
	eval 'sub make_dev_args_init {
	    my($a) = @_;
    	    eval q( &make_dev_args_init_impl(($a), $sizeof{\'struct make_dev_args\'}));
	}' unless defined(&make_dev_args_init);
	if(defined(&KLD_MODULE)) {
	    eval 'sub MAKEDEV_ETERNAL_KLD () {0;}' unless defined(&MAKEDEV_ETERNAL_KLD);
	} else {
	    eval 'sub MAKEDEV_ETERNAL_KLD () { &MAKEDEV_ETERNAL;}' unless defined(&MAKEDEV_ETERNAL_KLD);
	}
	eval 'sub dev2unit {
	    my($d) = @_;
    	    eval q((($d)-> &si_drv0));
	}' unless defined(&dev2unit);
	eval 'sub dump_savectx () {
	    eval q( &do {  &extern \'struct pcb\'  &dumppcb;  &extern  &lwpid_t  &dumptid;  &savectx( &dumppcb);  &dumptid =  ($curthread->{td_tid}); }  &while (0));
	}' unless defined(&dump_savectx);
    }
}
1;

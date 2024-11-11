require '_h2ph_pre.ph';

no warnings qw(redefine misc);

unless(defined(&_SYS_BUS_H_)) {
    eval 'sub _SYS_BUS_H_ () {1;}' unless defined(&_SYS_BUS_H_);
    require 'machine/_limits.ph';
    require 'machine/_bus.ph';
    require 'sys/_bus_dma.ph';
    require 'sys/ioccom.ph';
    eval 'sub BUS_USER_VERSION () {2;}' unless defined(&BUS_USER_VERSION);
    eval("sub DS_NOTPRESENT () { 10; }") unless defined(&DS_NOTPRESENT);
    eval("sub DS_ALIVE () { 20; }") unless defined(&DS_ALIVE);
    eval("sub DS_ATTACHING () { 25; }") unless defined(&DS_ATTACHING);
    eval("sub DS_ATTACHED () { 30; }") unless defined(&DS_ATTACHED);
    eval("sub DEVICE_PROP_ANY () { 0; }") unless defined(&DEVICE_PROP_ANY);
    eval("sub DEVICE_PROP_BUFFER () { 1; }") unless defined(&DEVICE_PROP_BUFFER);
    eval("sub DEVICE_PROP_UINT32 () { 2; }") unless defined(&DEVICE_PROP_UINT32);
    eval("sub DEVICE_PROP_UINT64 () { 3; }") unless defined(&DEVICE_PROP_UINT64);
    eval("sub DEVICE_PROP_HANDLE () { 4; }") unless defined(&DEVICE_PROP_HANDLE);
    eval 'sub BUS_USER_BUFFER () {(3*1024);}' unless defined(&BUS_USER_BUFFER);
    eval 'sub DF_ENABLED () {0x1;}' unless defined(&DF_ENABLED);
    eval 'sub DF_FIXEDCLASS () {0x2;}' unless defined(&DF_FIXEDCLASS);
    eval 'sub DF_WILDCARD () {0x4;}' unless defined(&DF_WILDCARD);
    eval 'sub DF_DESCMALLOCED () {0x8;}' unless defined(&DF_DESCMALLOCED);
    eval 'sub DF_QUIET () {0x10;}' unless defined(&DF_QUIET);
    eval 'sub DF_DONENOMATCH () {0x20;}' unless defined(&DF_DONENOMATCH);
    eval 'sub DF_EXTERNALSOFTC () {0x40;}' unless defined(&DF_EXTERNALSOFTC);
    eval 'sub DF_SUSPENDED () {0x100;}' unless defined(&DF_SUSPENDED);
    eval 'sub DF_QUIET_CHILDREN () {0x200;}' unless defined(&DF_QUIET_CHILDREN);
    eval 'sub DF_ATTACHED_ONCE () {0x400;}' unless defined(&DF_ATTACHED_ONCE);
    eval 'sub DF_NEEDNOMATCH () {0x800;}' unless defined(&DF_NEEDNOMATCH);
    eval 'sub dr_buffer () { ($dr_dru->{dru_buffer});}' unless defined(&dr_buffer);
    eval 'sub dr_data () { ($dr_dru->{dru_data});}' unless defined(&dr_data);
    eval 'sub DEV_ATTACH () { &_IOW(ord(\'D\'), 1, \'struct devreq\');}' unless defined(&DEV_ATTACH);
    eval 'sub DEV_DETACH () { &_IOW(ord(\'D\'), 2, \'struct devreq\');}' unless defined(&DEV_DETACH);
    eval 'sub DEV_ENABLE () { &_IOW(ord(\'D\'), 3, \'struct devreq\');}' unless defined(&DEV_ENABLE);
    eval 'sub DEV_DISABLE () { &_IOW(ord(\'D\'), 4, \'struct devreq\');}' unless defined(&DEV_DISABLE);
    eval 'sub DEV_SUSPEND () { &_IOW(ord(\'D\'), 5, \'struct devreq\');}' unless defined(&DEV_SUSPEND);
    eval 'sub DEV_RESUME () { &_IOW(ord(\'D\'), 6, \'struct devreq\');}' unless defined(&DEV_RESUME);
    eval 'sub DEV_SET_DRIVER () { &_IOW(ord(\'D\'), 7, \'struct devreq\');}' unless defined(&DEV_SET_DRIVER);
    eval 'sub DEV_CLEAR_DRIVER () { &_IOW(ord(\'D\'), 8, \'struct devreq\');}' unless defined(&DEV_CLEAR_DRIVER);
    eval 'sub DEV_RESCAN () { &_IOW(ord(\'D\'), 9, \'struct devreq\');}' unless defined(&DEV_RESCAN);
    eval 'sub DEV_DELETE () { &_IOW(ord(\'D\'), 10, \'struct devreq\');}' unless defined(&DEV_DELETE);
    eval 'sub DEV_FREEZE () { &_IOW(ord(\'D\'), 11, \'struct devreq\');}' unless defined(&DEV_FREEZE);
    eval 'sub DEV_THAW () { &_IOW(ord(\'D\'), 12, \'struct devreq\');}' unless defined(&DEV_THAW);
    eval 'sub DEV_RESET () { &_IOW(ord(\'D\'), 13, \'struct devreq\');}' unless defined(&DEV_RESET);
    eval 'sub DEV_GET_PATH () { &_IOWR(ord(\'D\'), 14, \'struct devreq\');}' unless defined(&DEV_GET_PATH);
    eval 'sub DEVF_FORCE_DETACH () {0x1;}' unless defined(&DEVF_FORCE_DETACH);
    eval 'sub DEVF_SET_DRIVER_DETACH () {0x1;}' unless defined(&DEVF_SET_DRIVER_DETACH);
    eval 'sub DEVF_CLEAR_DRIVER_DETACH () {0x1;}' unless defined(&DEVF_CLEAR_DRIVER_DETACH);
    eval 'sub DEVF_FORCE_DELETE () {0x1;}' unless defined(&DEVF_FORCE_DELETE);
    eval 'sub DEVF_RESET_DETACH () {0x1;}' unless defined(&DEVF_RESET_DETACH);
    if(defined(&_KERNEL)) {
	require 'sys/_eventhandler.ph';
	require 'sys/kobj.ph';
	require 'sys/systm.ph';
	require 'sys/devctl.ph';
	eval 'sub device_method_t () { &kobj_method_t;}' unless defined(&device_method_t);
	eval 'sub FILTER_STRAY () {0x1;}' unless defined(&FILTER_STRAY);
	eval 'sub FILTER_HANDLED () {0x2;}' unless defined(&FILTER_HANDLED);
	eval 'sub FILTER_SCHEDULE_THREAD () {0x4;}' unless defined(&FILTER_SCHEDULE_THREAD);
	eval("sub INTR_TYPE_TTY () { 1; }") unless defined(&INTR_TYPE_TTY);
	eval("sub INTR_TYPE_BIO () { 2; }") unless defined(&INTR_TYPE_BIO);
	eval("sub INTR_TYPE_NET () { 4; }") unless defined(&INTR_TYPE_NET);
	eval("sub INTR_TYPE_CAM () { 8; }") unless defined(&INTR_TYPE_CAM);
	eval("sub INTR_TYPE_MISC () { 16; }") unless defined(&INTR_TYPE_MISC);
	eval("sub INTR_TYPE_CLK () { 32; }") unless defined(&INTR_TYPE_CLK);
	eval("sub INTR_TYPE_AV () { 64; }") unless defined(&INTR_TYPE_AV);
	eval("sub INTR_EXCL () { 256; }") unless defined(&INTR_EXCL);
	eval("sub INTR_MPSAFE () { 512; }") unless defined(&INTR_MPSAFE);
	eval("sub INTR_ENTROPY () { 1024; }") unless defined(&INTR_ENTROPY);
	eval("sub INTR_MD1 () { 4096; }") unless defined(&INTR_MD1);
	eval("sub INTR_MD2 () { 8192; }") unless defined(&INTR_MD2);
	eval("sub INTR_MD3 () { 16384; }") unless defined(&INTR_MD3);
	eval("sub INTR_MD4 () { 32768; }") unless defined(&INTR_MD4);
	eval("sub INTR_TRIGGER_INVALID () { -1; }") unless defined(&INTR_TRIGGER_INVALID);
	eval("sub INTR_TRIGGER_CONFORM () { 0; }") unless defined(&INTR_TRIGGER_CONFORM);
	eval("sub INTR_TRIGGER_EDGE () { 1; }") unless defined(&INTR_TRIGGER_EDGE);
	eval("sub INTR_TRIGGER_LEVEL () { 2; }") unless defined(&INTR_TRIGGER_LEVEL);
	eval("sub INTR_POLARITY_CONFORM () { 0; }") unless defined(&INTR_POLARITY_CONFORM);
	eval("sub INTR_POLARITY_HIGH () { 1; }") unless defined(&INTR_POLARITY_HIGH);
	eval("sub INTR_POLARITY_LOW () { 2; }") unless defined(&INTR_POLARITY_LOW);
	eval("sub LOCAL_CPUS () { 0; }") unless defined(&LOCAL_CPUS);
	eval("sub INTR_CPUS () { 1; }") unless defined(&INTR_CPUS);
	eval 'sub resource_init_map_request {
	    my($rmr) = @_;
    	    eval q( &resource_init_map_request_impl(($rmr), $sizeof{($rmr)}));
	}' unless defined(&resource_init_map_request);
	eval 'sub RLE_RESERVED () {0x1;}' unless defined(&RLE_RESERVED);
	eval 'sub RLE_ALLOCATED () {0x2;}' unless defined(&RLE_ALLOCATED);
	eval 'sub RLE_PREFETCH () {0x4;}' unless defined(&RLE_PREFETCH);
	eval 'sub RESOURCE_SPEC_END () {{-1, 0, 0};}' unless defined(&RESOURCE_SPEC_END);
	eval 'sub bus_alloc_resource_any {
	    my($dev,$type,$rid,$flags) = @_;
    	    eval q({ ( &bus_alloc_resource($dev, $type, $rid, 0, ~0, 1, $flags)); });
	}' unless defined(&bus_alloc_resource_any);
	eval 'sub bus_alloc_resource_anywhere {
	    my($dev,$type,$rid,$count,$flags) = @_;
    	    eval q({ ( &bus_alloc_resource($dev, $type, $rid, 0, ~0, $count, $flags)); });
	}' unless defined(&bus_alloc_resource_anywhere);
	eval 'sub BUS_PROBE_SPECIFIC () {0;}' unless defined(&BUS_PROBE_SPECIFIC);
	eval 'sub BUS_PROBE_VENDOR () {(-10);}' unless defined(&BUS_PROBE_VENDOR);
	eval 'sub BUS_PROBE_DEFAULT () {(-20);}' unless defined(&BUS_PROBE_DEFAULT);
	eval 'sub BUS_PROBE_LOW_PRIORITY () {(-40);}' unless defined(&BUS_PROBE_LOW_PRIORITY);
	eval 'sub BUS_PROBE_GENERIC () {(-100);}' unless defined(&BUS_PROBE_GENERIC);
	eval 'sub BUS_PROBE_HOOVER () {(-1000000);}' unless defined(&BUS_PROBE_HOOVER);
	eval 'sub BUS_PROBE_NOWILDCARD () {(-2000000000);}' unless defined(&BUS_PROBE_NOWILDCARD);
	eval 'sub BUS_PASS_ROOT () {0;}' unless defined(&BUS_PASS_ROOT);
	eval 'sub BUS_PASS_BUS () {10;}' unless defined(&BUS_PASS_BUS);
	eval 'sub BUS_PASS_CPU () {20;}' unless defined(&BUS_PASS_CPU);
	eval 'sub BUS_PASS_RESOURCE () {30;}' unless defined(&BUS_PASS_RESOURCE);
	eval 'sub BUS_PASS_INTERRUPT () {40;}' unless defined(&BUS_PASS_INTERRUPT);
	eval 'sub BUS_PASS_TIMER () {50;}' unless defined(&BUS_PASS_TIMER);
	eval 'sub BUS_PASS_SCHEDULER () {60;}' unless defined(&BUS_PASS_SCHEDULER);
	eval 'sub BUS_PASS_SUPPORTDEV () {100000;}' unless defined(&BUS_PASS_SUPPORTDEV);
	eval 'sub BUS_PASS_DEFAULT () { &__INT_MAX;}' unless defined(&BUS_PASS_DEFAULT);
	eval 'sub BUS_PASS_ORDER_FIRST () {0;}' unless defined(&BUS_PASS_ORDER_FIRST);
	eval 'sub BUS_PASS_ORDER_EARLY () {2;}' unless defined(&BUS_PASS_ORDER_EARLY);
	eval 'sub BUS_PASS_ORDER_MIDDLE () {5;}' unless defined(&BUS_PASS_ORDER_MIDDLE);
	eval 'sub BUS_PASS_ORDER_LATE () {7;}' unless defined(&BUS_PASS_ORDER_LATE);
	eval 'sub BUS_PASS_ORDER_LAST () {9;}' unless defined(&BUS_PASS_ORDER_LAST);
	eval 'sub BUS_LOCATOR_ACPI () {"ACPI";}' unless defined(&BUS_LOCATOR_ACPI);
	eval 'sub BUS_LOCATOR_FREEBSD () {"FreeBSD";}' unless defined(&BUS_LOCATOR_FREEBSD);
	eval 'sub BUS_LOCATOR_UEFI () {"UEFI";}' unless defined(&BUS_LOCATOR_UEFI);
	eval 'sub BUS_LOCATOR_OFW () {"OFW";}' unless defined(&BUS_LOCATOR_OFW);
	eval 'sub DEVMETHOD () { &KOBJMETHOD;}' unless defined(&DEVMETHOD);
	eval 'sub DEVMETHOD_END () { &KOBJMETHOD_END;}' unless defined(&DEVMETHOD_END);
	require 'sys/device_if.ph';
	require 'sys/bus_if.ph';
	eval 'sub EARLY_DRIVER_MODULE_ORDERED {
	    my($name, $busname, $driver, $evh, $arg,	     $order, $pass) = @_;
    	    eval q( &static \'struct driver_module_data\' $name &_$busname &_driver_mod = { $evh, $arg, $busname, ( &kobj_class_t) $driver,  &NULL, $pass };  &static  &moduledata_t $name &_$busname &_mod = { $busname \\"/\\" $name,  &driver_module_handler, $name &_$busname &_driver_mod };  &DECLARE_MODULE($name &_$busname, $name &_$busname &_mod,  &SI_SUB_DRIVERS, $order));
	}' unless defined(&EARLY_DRIVER_MODULE_ORDERED);
	eval 'sub EARLY_DRIVER_MODULE {
	    my($name, $busname, $driver, $evh, $arg, $pass) = @_;
    	    eval q( &EARLY_DRIVER_MODULE_ORDERED($name, $busname, $driver, $evh, $arg,  &SI_ORDER_MIDDLE, $pass));
	}' unless defined(&EARLY_DRIVER_MODULE);
	eval 'sub DRIVER_MODULE_ORDERED {
	    my($name, $busname, $driver, $evh, $arg, $order) = @_;
    	    eval q( &EARLY_DRIVER_MODULE_ORDERED($name, $busname, $driver, $evh, $arg, $order,  &BUS_PASS_DEFAULT));
	}' unless defined(&DRIVER_MODULE_ORDERED);
	eval 'sub DRIVER_MODULE {
	    my($name, $busname, $driver, $evh, $arg) = @_;
    	    eval q( &EARLY_DRIVER_MODULE($name, $busname, $driver, $evh, $arg,  &BUS_PASS_DEFAULT));
	}' unless defined(&DRIVER_MODULE);
	eval 'sub __BUS_ACCESSOR {
	    my($varp, $var, $ivarp, $ivar, $type) = @_;
    	    eval q( &static  &__inline $type $varp   &_get_  $var( &device_t  &dev) {  &uintptr_t  &v; \'int\'  &e  &__diagused;  &e =  &BUS_READ_IVAR( &device_get_parent( &dev),  &dev, $ivarp   &_IVAR_  $ivar,  &v);  &KASSERT( &e == 0, (\\"%s failed for %s on bus %s, error = %d\\",  &__func__,  &device_get_nameunit( &dev),  &device_get_nameunit( &device_get_parent( &dev)),  &e));  &return (($type)  &v); }  &static  &__inline  &void $varp   &_set_  $var( &device_t  &dev, $type  &t) {  &uintptr_t  &v = ( &uintptr_t)  &t; \'int\'  &e  &__diagused;  &e =  &BUS_WRITE_IVAR( &device_get_parent( &dev),  &dev, $ivarp   &_IVAR_  $ivar,  &v);  &KASSERT( &e == 0, (\\"%s failed for %s on bus %s, error = %d\\",  &__func__,  &device_get_nameunit( &dev),  &device_get_nameunit( &device_get_parent( &dev)),  &e)); });
	}' unless defined(&__BUS_ACCESSOR);
	eval 'sub bus_barrier {
	    my($r, $o, $l, $f) = @_;
    	    eval q( &bus_space_barrier(($r)-> &r_bustag, ($r)-> &r_bushandle, ($o), ($l), ($f)));
	}' unless defined(&bus_barrier);
	eval 'sub bus_poke_1 {
	    my($r, $o, $v) = @_;
    	    eval q( &bus_space_poke_1(($r)-> &r_bustag, ($r)-> &r_bushandle, ($o), ($v)));
	}' unless defined(&bus_poke_1);
	eval 'sub bus_peek_1 {
	    my($r, $o, $vp) = @_;
    	    eval q( &bus_space_peek_1(($r)-> &r_bustag, ($r)-> &r_bushandle, ($o), ($vp)));
	}' unless defined(&bus_peek_1);
	eval 'sub bus_read_1 {
	    my($r, $o) = @_;
    	    eval q( &bus_space_read_1(($r)-> &r_bustag, ($r)-> &r_bushandle, ($o)));
	}' unless defined(&bus_read_1);
	eval 'sub bus_read_multi_1 {
	    my($r, $o, $d, $c) = @_;
    	    eval q( &bus_space_read_multi_1(($r)-> &r_bustag, ($r)-> &r_bushandle, ($o), ($d), ($c)));
	}' unless defined(&bus_read_multi_1);
	eval 'sub bus_read_region_1 {
	    my($r, $o, $d, $c) = @_;
    	    eval q( &bus_space_read_region_1(($r)-> &r_bustag, ($r)-> &r_bushandle, ($o), ($d), ($c)));
	}' unless defined(&bus_read_region_1);
	eval 'sub bus_set_multi_1 {
	    my($r, $o, $v, $c) = @_;
    	    eval q( &bus_space_set_multi_1(($r)-> &r_bustag, ($r)-> &r_bushandle, ($o), ($v), ($c)));
	}' unless defined(&bus_set_multi_1);
	eval 'sub bus_set_region_1 {
	    my($r, $o, $v, $c) = @_;
    	    eval q( &bus_space_set_region_1(($r)-> &r_bustag, ($r)-> &r_bushandle, ($o), ($v), ($c)));
	}' unless defined(&bus_set_region_1);
	eval 'sub bus_write_1 {
	    my($r, $o, $v) = @_;
    	    eval q( &bus_space_write_1(($r)-> &r_bustag, ($r)-> &r_bushandle, ($o), ($v)));
	}' unless defined(&bus_write_1);
	eval 'sub bus_write_multi_1 {
	    my($r, $o, $d, $c) = @_;
    	    eval q( &bus_space_write_multi_1(($r)-> &r_bustag, ($r)-> &r_bushandle, ($o), ($d), ($c)));
	}' unless defined(&bus_write_multi_1);
	eval 'sub bus_write_region_1 {
	    my($r, $o, $d, $c) = @_;
    	    eval q( &bus_space_write_region_1(($r)-> &r_bustag, ($r)-> &r_bushandle, ($o), ($d), ($c)));
	}' unless defined(&bus_write_region_1);
	eval 'sub bus_read_stream_1 {
	    my($r, $o) = @_;
    	    eval q( &bus_space_read_stream_1(($r)-> &r_bustag, ($r)-> &r_bushandle, ($o)));
	}' unless defined(&bus_read_stream_1);
	eval 'sub bus_read_multi_stream_1 {
	    my($r, $o, $d, $c) = @_;
    	    eval q( &bus_space_read_multi_stream_1(($r)-> &r_bustag, ($r)-> &r_bushandle, ($o), ($d), ($c)));
	}' unless defined(&bus_read_multi_stream_1);
	eval 'sub bus_read_region_stream_1 {
	    my($r, $o, $d, $c) = @_;
    	    eval q( &bus_space_read_region_stream_1(($r)-> &r_bustag, ($r)-> &r_bushandle, ($o), ($d), ($c)));
	}' unless defined(&bus_read_region_stream_1);
	eval 'sub bus_set_multi_stream_1 {
	    my($r, $o, $v, $c) = @_;
    	    eval q( &bus_space_set_multi_stream_1(($r)-> &r_bustag, ($r)-> &r_bushandle, ($o), ($v), ($c)));
	}' unless defined(&bus_set_multi_stream_1);
	eval 'sub bus_set_region_stream_1 {
	    my($r, $o, $v, $c) = @_;
    	    eval q( &bus_space_set_region_stream_1(($r)-> &r_bustag, ($r)-> &r_bushandle, ($o), ($v), ($c)));
	}' unless defined(&bus_set_region_stream_1);
	eval 'sub bus_write_stream_1 {
	    my($r, $o, $v) = @_;
    	    eval q( &bus_space_write_stream_1(($r)-> &r_bustag, ($r)-> &r_bushandle, ($o), ($v)));
	}' unless defined(&bus_write_stream_1);
	eval 'sub bus_write_multi_stream_1 {
	    my($r, $o, $d, $c) = @_;
    	    eval q( &bus_space_write_multi_stream_1(($r)-> &r_bustag, ($r)-> &r_bushandle, ($o), ($d), ($c)));
	}' unless defined(&bus_write_multi_stream_1);
	eval 'sub bus_write_region_stream_1 {
	    my($r, $o, $d, $c) = @_;
    	    eval q( &bus_space_write_region_stream_1(($r)-> &r_bustag, ($r)-> &r_bushandle, ($o), ($d), ($c)));
	}' unless defined(&bus_write_region_stream_1);
	eval 'sub bus_poke_2 {
	    my($r, $o, $v) = @_;
    	    eval q( &bus_space_poke_2(($r)-> &r_bustag, ($r)-> &r_bushandle, ($o), ($v)));
	}' unless defined(&bus_poke_2);
	eval 'sub bus_peek_2 {
	    my($r, $o, $vp) = @_;
    	    eval q( &bus_space_peek_2(($r)-> &r_bustag, ($r)-> &r_bushandle, ($o), ($vp)));
	}' unless defined(&bus_peek_2);
	eval 'sub bus_read_2 {
	    my($r, $o) = @_;
    	    eval q( &bus_space_read_2(($r)-> &r_bustag, ($r)-> &r_bushandle, ($o)));
	}' unless defined(&bus_read_2);
	eval 'sub bus_read_multi_2 {
	    my($r, $o, $d, $c) = @_;
    	    eval q( &bus_space_read_multi_2(($r)-> &r_bustag, ($r)-> &r_bushandle, ($o), ($d), ($c)));
	}' unless defined(&bus_read_multi_2);
	eval 'sub bus_read_region_2 {
	    my($r, $o, $d, $c) = @_;
    	    eval q( &bus_space_read_region_2(($r)-> &r_bustag, ($r)-> &r_bushandle, ($o), ($d), ($c)));
	}' unless defined(&bus_read_region_2);
	eval 'sub bus_set_multi_2 {
	    my($r, $o, $v, $c) = @_;
    	    eval q( &bus_space_set_multi_2(($r)-> &r_bustag, ($r)-> &r_bushandle, ($o), ($v), ($c)));
	}' unless defined(&bus_set_multi_2);
	eval 'sub bus_set_region_2 {
	    my($r, $o, $v, $c) = @_;
    	    eval q( &bus_space_set_region_2(($r)-> &r_bustag, ($r)-> &r_bushandle, ($o), ($v), ($c)));
	}' unless defined(&bus_set_region_2);
	eval 'sub bus_write_2 {
	    my($r, $o, $v) = @_;
    	    eval q( &bus_space_write_2(($r)-> &r_bustag, ($r)-> &r_bushandle, ($o), ($v)));
	}' unless defined(&bus_write_2);
	eval 'sub bus_write_multi_2 {
	    my($r, $o, $d, $c) = @_;
    	    eval q( &bus_space_write_multi_2(($r)-> &r_bustag, ($r)-> &r_bushandle, ($o), ($d), ($c)));
	}' unless defined(&bus_write_multi_2);
	eval 'sub bus_write_region_2 {
	    my($r, $o, $d, $c) = @_;
    	    eval q( &bus_space_write_region_2(($r)-> &r_bustag, ($r)-> &r_bushandle, ($o), ($d), ($c)));
	}' unless defined(&bus_write_region_2);
	eval 'sub bus_read_stream_2 {
	    my($r, $o) = @_;
    	    eval q( &bus_space_read_stream_2(($r)-> &r_bustag, ($r)-> &r_bushandle, ($o)));
	}' unless defined(&bus_read_stream_2);
	eval 'sub bus_read_multi_stream_2 {
	    my($r, $o, $d, $c) = @_;
    	    eval q( &bus_space_read_multi_stream_2(($r)-> &r_bustag, ($r)-> &r_bushandle, ($o), ($d), ($c)));
	}' unless defined(&bus_read_multi_stream_2);
	eval 'sub bus_read_region_stream_2 {
	    my($r, $o, $d, $c) = @_;
    	    eval q( &bus_space_read_region_stream_2(($r)-> &r_bustag, ($r)-> &r_bushandle, ($o), ($d), ($c)));
	}' unless defined(&bus_read_region_stream_2);
	eval 'sub bus_set_multi_stream_2 {
	    my($r, $o, $v, $c) = @_;
    	    eval q( &bus_space_set_multi_stream_2(($r)-> &r_bustag, ($r)-> &r_bushandle, ($o), ($v), ($c)));
	}' unless defined(&bus_set_multi_stream_2);
	eval 'sub bus_set_region_stream_2 {
	    my($r, $o, $v, $c) = @_;
    	    eval q( &bus_space_set_region_stream_2(($r)-> &r_bustag, ($r)-> &r_bushandle, ($o), ($v), ($c)));
	}' unless defined(&bus_set_region_stream_2);
	eval 'sub bus_write_stream_2 {
	    my($r, $o, $v) = @_;
    	    eval q( &bus_space_write_stream_2(($r)-> &r_bustag, ($r)-> &r_bushandle, ($o), ($v)));
	}' unless defined(&bus_write_stream_2);
	eval 'sub bus_write_multi_stream_2 {
	    my($r, $o, $d, $c) = @_;
    	    eval q( &bus_space_write_multi_stream_2(($r)-> &r_bustag, ($r)-> &r_bushandle, ($o), ($d), ($c)));
	}' unless defined(&bus_write_multi_stream_2);
	eval 'sub bus_write_region_stream_2 {
	    my($r, $o, $d, $c) = @_;
    	    eval q( &bus_space_write_region_stream_2(($r)-> &r_bustag, ($r)-> &r_bushandle, ($o), ($d), ($c)));
	}' unless defined(&bus_write_region_stream_2);
	eval 'sub bus_poke_4 {
	    my($r, $o, $v) = @_;
    	    eval q( &bus_space_poke_4(($r)-> &r_bustag, ($r)-> &r_bushandle, ($o), ($v)));
	}' unless defined(&bus_poke_4);
	eval 'sub bus_peek_4 {
	    my($r, $o, $vp) = @_;
    	    eval q( &bus_space_peek_4(($r)-> &r_bustag, ($r)-> &r_bushandle, ($o), ($vp)));
	}' unless defined(&bus_peek_4);
	eval 'sub bus_read_4 {
	    my($r, $o) = @_;
    	    eval q( &bus_space_read_4(($r)-> &r_bustag, ($r)-> &r_bushandle, ($o)));
	}' unless defined(&bus_read_4);
	eval 'sub bus_read_multi_4 {
	    my($r, $o, $d, $c) = @_;
    	    eval q( &bus_space_read_multi_4(($r)-> &r_bustag, ($r)-> &r_bushandle, ($o), ($d), ($c)));
	}' unless defined(&bus_read_multi_4);
	eval 'sub bus_read_region_4 {
	    my($r, $o, $d, $c) = @_;
    	    eval q( &bus_space_read_region_4(($r)-> &r_bustag, ($r)-> &r_bushandle, ($o), ($d), ($c)));
	}' unless defined(&bus_read_region_4);
	eval 'sub bus_set_multi_4 {
	    my($r, $o, $v, $c) = @_;
    	    eval q( &bus_space_set_multi_4(($r)-> &r_bustag, ($r)-> &r_bushandle, ($o), ($v), ($c)));
	}' unless defined(&bus_set_multi_4);
	eval 'sub bus_set_region_4 {
	    my($r, $o, $v, $c) = @_;
    	    eval q( &bus_space_set_region_4(($r)-> &r_bustag, ($r)-> &r_bushandle, ($o), ($v), ($c)));
	}' unless defined(&bus_set_region_4);
	eval 'sub bus_write_4 {
	    my($r, $o, $v) = @_;
    	    eval q( &bus_space_write_4(($r)-> &r_bustag, ($r)-> &r_bushandle, ($o), ($v)));
	}' unless defined(&bus_write_4);
	eval 'sub bus_write_multi_4 {
	    my($r, $o, $d, $c) = @_;
    	    eval q( &bus_space_write_multi_4(($r)-> &r_bustag, ($r)-> &r_bushandle, ($o), ($d), ($c)));
	}' unless defined(&bus_write_multi_4);
	eval 'sub bus_write_region_4 {
	    my($r, $o, $d, $c) = @_;
    	    eval q( &bus_space_write_region_4(($r)-> &r_bustag, ($r)-> &r_bushandle, ($o), ($d), ($c)));
	}' unless defined(&bus_write_region_4);
	eval 'sub bus_read_stream_4 {
	    my($r, $o) = @_;
    	    eval q( &bus_space_read_stream_4(($r)-> &r_bustag, ($r)-> &r_bushandle, ($o)));
	}' unless defined(&bus_read_stream_4);
	eval 'sub bus_read_multi_stream_4 {
	    my($r, $o, $d, $c) = @_;
    	    eval q( &bus_space_read_multi_stream_4(($r)-> &r_bustag, ($r)-> &r_bushandle, ($o), ($d), ($c)));
	}' unless defined(&bus_read_multi_stream_4);
	eval 'sub bus_read_region_stream_4 {
	    my($r, $o, $d, $c) = @_;
    	    eval q( &bus_space_read_region_stream_4(($r)-> &r_bustag, ($r)-> &r_bushandle, ($o), ($d), ($c)));
	}' unless defined(&bus_read_region_stream_4);
	eval 'sub bus_set_multi_stream_4 {
	    my($r, $o, $v, $c) = @_;
    	    eval q( &bus_space_set_multi_stream_4(($r)-> &r_bustag, ($r)-> &r_bushandle, ($o), ($v), ($c)));
	}' unless defined(&bus_set_multi_stream_4);
	eval 'sub bus_set_region_stream_4 {
	    my($r, $o, $v, $c) = @_;
    	    eval q( &bus_space_set_region_stream_4(($r)-> &r_bustag, ($r)-> &r_bushandle, ($o), ($v), ($c)));
	}' unless defined(&bus_set_region_stream_4);
	eval 'sub bus_write_stream_4 {
	    my($r, $o, $v) = @_;
    	    eval q( &bus_space_write_stream_4(($r)-> &r_bustag, ($r)-> &r_bushandle, ($o), ($v)));
	}' unless defined(&bus_write_stream_4);
	eval 'sub bus_write_multi_stream_4 {
	    my($r, $o, $d, $c) = @_;
    	    eval q( &bus_space_write_multi_stream_4(($r)-> &r_bustag, ($r)-> &r_bushandle, ($o), ($d), ($c)));
	}' unless defined(&bus_write_multi_stream_4);
	eval 'sub bus_write_region_stream_4 {
	    my($r, $o, $d, $c) = @_;
    	    eval q( &bus_space_write_region_stream_4(($r)-> &r_bustag, ($r)-> &r_bushandle, ($o), ($d), ($c)));
	}' unless defined(&bus_write_region_stream_4);
	eval 'sub bus_poke_8 {
	    my($r, $o, $v) = @_;
    	    eval q( &bus_space_poke_8(($r)-> &r_bustag, ($r)-> &r_bushandle, ($o), ($v)));
	}' unless defined(&bus_poke_8);
	eval 'sub bus_peek_8 {
	    my($r, $o, $vp) = @_;
    	    eval q( &bus_space_peek_8(($r)-> &r_bustag, ($r)-> &r_bushandle, ($o), ($vp)));
	}' unless defined(&bus_peek_8);
	eval 'sub bus_read_8 {
	    my($r, $o) = @_;
    	    eval q( &bus_space_read_8(($r)-> &r_bustag, ($r)-> &r_bushandle, ($o)));
	}' unless defined(&bus_read_8);
	eval 'sub bus_read_multi_8 {
	    my($r, $o, $d, $c) = @_;
    	    eval q( &bus_space_read_multi_8(($r)-> &r_bustag, ($r)-> &r_bushandle, ($o), ($d), ($c)));
	}' unless defined(&bus_read_multi_8);
	eval 'sub bus_read_region_8 {
	    my($r, $o, $d, $c) = @_;
    	    eval q( &bus_space_read_region_8(($r)-> &r_bustag, ($r)-> &r_bushandle, ($o), ($d), ($c)));
	}' unless defined(&bus_read_region_8);
	eval 'sub bus_set_multi_8 {
	    my($r, $o, $v, $c) = @_;
    	    eval q( &bus_space_set_multi_8(($r)-> &r_bustag, ($r)-> &r_bushandle, ($o), ($v), ($c)));
	}' unless defined(&bus_set_multi_8);
	eval 'sub bus_set_region_8 {
	    my($r, $o, $v, $c) = @_;
    	    eval q( &bus_space_set_region_8(($r)-> &r_bustag, ($r)-> &r_bushandle, ($o), ($v), ($c)));
	}' unless defined(&bus_set_region_8);
	eval 'sub bus_write_8 {
	    my($r, $o, $v) = @_;
    	    eval q( &bus_space_write_8(($r)-> &r_bustag, ($r)-> &r_bushandle, ($o), ($v)));
	}' unless defined(&bus_write_8);
	eval 'sub bus_write_multi_8 {
	    my($r, $o, $d, $c) = @_;
    	    eval q( &bus_space_write_multi_8(($r)-> &r_bustag, ($r)-> &r_bushandle, ($o), ($d), ($c)));
	}' unless defined(&bus_write_multi_8);
	eval 'sub bus_write_region_8 {
	    my($r, $o, $d, $c) = @_;
    	    eval q( &bus_space_write_region_8(($r)-> &r_bustag, ($r)-> &r_bushandle, ($o), ($d), ($c)));
	}' unless defined(&bus_write_region_8);
	eval 'sub bus_read_stream_8 {
	    my($r, $o) = @_;
    	    eval q( &bus_space_read_stream_8(($r)-> &r_bustag, ($r)-> &r_bushandle, ($o)));
	}' unless defined(&bus_read_stream_8);
	eval 'sub bus_read_multi_stream_8 {
	    my($r, $o, $d, $c) = @_;
    	    eval q( &bus_space_read_multi_stream_8(($r)-> &r_bustag, ($r)-> &r_bushandle, ($o), ($d), ($c)));
	}' unless defined(&bus_read_multi_stream_8);
	eval 'sub bus_read_region_stream_8 {
	    my($r, $o, $d, $c) = @_;
    	    eval q( &bus_space_read_region_stream_8(($r)-> &r_bustag, ($r)-> &r_bushandle, ($o), ($d), ($c)));
	}' unless defined(&bus_read_region_stream_8);
	eval 'sub bus_set_multi_stream_8 {
	    my($r, $o, $v, $c) = @_;
    	    eval q( &bus_space_set_multi_stream_8(($r)-> &r_bustag, ($r)-> &r_bushandle, ($o), ($v), ($c)));
	}' unless defined(&bus_set_multi_stream_8);
	eval 'sub bus_set_region_stream_8 {
	    my($r, $o, $v, $c) = @_;
    	    eval q( &bus_space_set_region_stream_8(($r)-> &r_bustag, ($r)-> &r_bushandle, ($o), ($v), ($c)));
	}' unless defined(&bus_set_region_stream_8);
	eval 'sub bus_write_stream_8 {
	    my($r, $o, $v) = @_;
    	    eval q( &bus_space_write_stream_8(($r)-> &r_bustag, ($r)-> &r_bushandle, ($o), ($v)));
	}' unless defined(&bus_write_stream_8);
	eval 'sub bus_write_multi_stream_8 {
	    my($r, $o, $d, $c) = @_;
    	    eval q( &bus_space_write_multi_stream_8(($r)-> &r_bustag, ($r)-> &r_bushandle, ($o), ($d), ($c)));
	}' unless defined(&bus_write_multi_stream_8);
	eval 'sub bus_write_region_stream_8 {
	    my($r, $o, $d, $c) = @_;
    	    eval q( &bus_space_write_region_stream_8(($r)-> &r_bustag, ($r)-> &r_bushandle, ($o), ($d), ($c)));
	}' unless defined(&bus_write_region_stream_8);
    }
}
1;

require '_h2ph_pre.ph';

no warnings qw(redefine misc);

unless(defined(&_SYS_KERNEL_H_)) {
    eval 'sub _SYS_KERNEL_H_ () {1;}' unless defined(&_SYS_KERNEL_H_);
    require 'sys/linker_set.ph';
    if(defined(&_KERNEL)) {
	require 'sys/queue.ph';
	require 'sys/tslog.ph';
    }
    eval("sub SI_SUB_DUMMY () { 0x0000000; }") unless defined(&SI_SUB_DUMMY);
    eval("sub SI_SUB_DONE () { 0x0000001; }") unless defined(&SI_SUB_DONE);
    eval("sub SI_SUB_TUNABLES () { 0x0700000; }") unless defined(&SI_SUB_TUNABLES);
    eval("sub SI_SUB_COPYRIGHT () { 0x0800001; }") unless defined(&SI_SUB_COPYRIGHT);
    eval("sub SI_SUB_VM () { 0x1000000; }") unless defined(&SI_SUB_VM);
    eval("sub SI_SUB_COUNTER () { 0x1100000; }") unless defined(&SI_SUB_COUNTER);
    eval("sub SI_SUB_KMEM () { 0x1800000; }") unless defined(&SI_SUB_KMEM);
    eval("sub SI_SUB_HYPERVISOR () { 0x1A40000; }") unless defined(&SI_SUB_HYPERVISOR);
    eval("sub SI_SUB_WITNESS () { 0x1A80000; }") unless defined(&SI_SUB_WITNESS);
    eval("sub SI_SUB_MTX_POOL_DYNAMIC () { 0x1AC0000; }") unless defined(&SI_SUB_MTX_POOL_DYNAMIC);
    eval("sub SI_SUB_LOCK () { 0x1B00000; }") unless defined(&SI_SUB_LOCK);
    eval("sub SI_SUB_EVENTHANDLER () { 0x1C00000; }") unless defined(&SI_SUB_EVENTHANDLER);
    eval("sub SI_SUB_VNET_PRELINK () { 0x1E00000; }") unless defined(&SI_SUB_VNET_PRELINK);
    eval("sub SI_SUB_KLD () { 0x2000000; }") unless defined(&SI_SUB_KLD);
    eval("sub SI_SUB_KHELP () { 0x2080000; }") unless defined(&SI_SUB_KHELP);
    eval("sub SI_SUB_CPU () { 0x2100000; }") unless defined(&SI_SUB_CPU);
    eval("sub SI_SUB_RACCT () { 0x2110000; }") unless defined(&SI_SUB_RACCT);
    eval("sub SI_SUB_KDTRACE () { 0x2140000; }") unless defined(&SI_SUB_KDTRACE);
    eval("sub SI_SUB_RANDOM () { 0x2160000; }") unless defined(&SI_SUB_RANDOM);
    eval("sub SI_SUB_MAC () { 0x2180000; }") unless defined(&SI_SUB_MAC);
    eval("sub SI_SUB_MAC_POLICY () { 0x21C0000; }") unless defined(&SI_SUB_MAC_POLICY);
    eval("sub SI_SUB_MAC_LATE () { 0x21D0000; }") unless defined(&SI_SUB_MAC_LATE);
    eval("sub SI_SUB_VNET () { 0x21E0000; }") unless defined(&SI_SUB_VNET);
    eval("sub SI_SUB_INTRINSIC () { 0x2200000; }") unless defined(&SI_SUB_INTRINSIC);
    eval("sub SI_SUB_VM_CONF () { 0x2300000; }") unless defined(&SI_SUB_VM_CONF);
    eval("sub SI_SUB_DDB_SERVICES () { 0x2380000; }") unless defined(&SI_SUB_DDB_SERVICES);
    eval("sub SI_SUB_RUN_QUEUE () { 0x2400000; }") unless defined(&SI_SUB_RUN_QUEUE);
    eval("sub SI_SUB_KTRACE () { 0x2480000; }") unless defined(&SI_SUB_KTRACE);
    eval("sub SI_SUB_OPENSOLARIS () { 0x2490000; }") unless defined(&SI_SUB_OPENSOLARIS);
    eval("sub SI_SUB_AUDIT () { 0x24C0000; }") unless defined(&SI_SUB_AUDIT);
    eval("sub SI_SUB_CREATE_INIT () { 0x2500000; }") unless defined(&SI_SUB_CREATE_INIT);
    eval("sub SI_SUB_SCHED_IDLE () { 0x2600000; }") unless defined(&SI_SUB_SCHED_IDLE);
    eval("sub SI_SUB_MBUF () { 0x2700000; }") unless defined(&SI_SUB_MBUF);
    eval("sub SI_SUB_INTR () { 0x2800000; }") unless defined(&SI_SUB_INTR);
    eval("sub SI_SUB_TASKQ () { 0x2880000; }") unless defined(&SI_SUB_TASKQ);
    eval("sub SI_SUB_EPOCH () { 0x2888000; }") unless defined(&SI_SUB_EPOCH);
    eval("sub SI_SUB_SOFTINTR () { 0x2A00000; }") unless defined(&SI_SUB_SOFTINTR);
    eval("sub SI_SUB_DEVFS () { 0x2F00000; }") unless defined(&SI_SUB_DEVFS);
    eval("sub SI_SUB_INIT_IF () { 0x3000000; }") unless defined(&SI_SUB_INIT_IF);
    eval("sub SI_SUB_NETGRAPH () { 0x3010000; }") unless defined(&SI_SUB_NETGRAPH);
    eval("sub SI_SUB_DTRACE () { 0x3020000; }") unless defined(&SI_SUB_DTRACE);
    eval("sub SI_SUB_DTRACE_PROVIDER () { 0x3048000; }") unless defined(&SI_SUB_DTRACE_PROVIDER);
    eval("sub SI_SUB_DTRACE_ANON () { 0x308C000; }") unless defined(&SI_SUB_DTRACE_ANON);
    eval("sub SI_SUB_DRIVERS () { 0x3100000; }") unless defined(&SI_SUB_DRIVERS);
    eval("sub SI_SUB_CONFIGURE () { 0x3800000; }") unless defined(&SI_SUB_CONFIGURE);
    eval("sub SI_SUB_VFS () { 0x4000000; }") unless defined(&SI_SUB_VFS);
    eval("sub SI_SUB_CLOCKS () { 0x4800000; }") unless defined(&SI_SUB_CLOCKS);
    eval("sub SI_SUB_SYSV_SHM () { 0x6400000; }") unless defined(&SI_SUB_SYSV_SHM);
    eval("sub SI_SUB_SYSV_SEM () { 0x6800000; }") unless defined(&SI_SUB_SYSV_SEM);
    eval("sub SI_SUB_SYSV_MSG () { 0x6C00000; }") unless defined(&SI_SUB_SYSV_MSG);
    eval("sub SI_SUB_P1003_1B () { 0x6E00000; }") unless defined(&SI_SUB_P1003_1B);
    eval("sub SI_SUB_PSEUDO () { 0x7000000; }") unless defined(&SI_SUB_PSEUDO);
    eval("sub SI_SUB_EXEC () { 0x7400000; }") unless defined(&SI_SUB_EXEC);
    eval("sub SI_SUB_PROTO_BEGIN () { 0x8000000; }") unless defined(&SI_SUB_PROTO_BEGIN);
    eval("sub SI_SUB_PROTO_PFIL () { 0x8100000; }") unless defined(&SI_SUB_PROTO_PFIL);
    eval("sub SI_SUB_PROTO_IF () { 0x8400000; }") unless defined(&SI_SUB_PROTO_IF);
    eval("sub SI_SUB_PROTO_DOMAININIT () { 0x8600000; }") unless defined(&SI_SUB_PROTO_DOMAININIT);
    eval("sub SI_SUB_PROTO_MC () { 0x8700000; }") unless defined(&SI_SUB_PROTO_MC);
    eval("sub SI_SUB_PROTO_DOMAIN () { 0x8800000; }") unless defined(&SI_SUB_PROTO_DOMAIN);
    eval("sub SI_SUB_PROTO_FIREWALL () { 0x8806000; }") unless defined(&SI_SUB_PROTO_FIREWALL);
    eval("sub SI_SUB_PROTO_IFATTACHDOMAIN () { 0x8808000; }") unless defined(&SI_SUB_PROTO_IFATTACHDOMAIN);
    eval("sub SI_SUB_PROTO_END () { 0x8ffffff; }") unless defined(&SI_SUB_PROTO_END);
    eval("sub SI_SUB_KPROF () { 0x9000000; }") unless defined(&SI_SUB_KPROF);
    eval("sub SI_SUB_KICK_SCHEDULER () { 0xa000000; }") unless defined(&SI_SUB_KICK_SCHEDULER);
    eval("sub SI_SUB_INT_CONFIG_HOOKS () { 0xa800000; }") unless defined(&SI_SUB_INT_CONFIG_HOOKS);
    eval("sub SI_SUB_ROOT_CONF () { 0xb000000; }") unless defined(&SI_SUB_ROOT_CONF);
    eval("sub SI_SUB_INTRINSIC_POST () { 0xd000000; }") unless defined(&SI_SUB_INTRINSIC_POST);
    eval("sub SI_SUB_SYSCALLS () { 0xd800000; }") unless defined(&SI_SUB_SYSCALLS);
    eval("sub SI_SUB_VNET_DONE () { 0xdc00000; }") unless defined(&SI_SUB_VNET_DONE);
    eval("sub SI_SUB_KTHREAD_INIT () { 0xe000000; }") unless defined(&SI_SUB_KTHREAD_INIT);
    eval("sub SI_SUB_KTHREAD_PAGE () { 0xe400000; }") unless defined(&SI_SUB_KTHREAD_PAGE);
    eval("sub SI_SUB_KTHREAD_VM () { 0xe800000; }") unless defined(&SI_SUB_KTHREAD_VM);
    eval("sub SI_SUB_KTHREAD_BUF () { 0xea00000; }") unless defined(&SI_SUB_KTHREAD_BUF);
    eval("sub SI_SUB_KTHREAD_UPDATE () { 0xec00000; }") unless defined(&SI_SUB_KTHREAD_UPDATE);
    eval("sub SI_SUB_KTHREAD_IDLE () { 0xee00000; }") unless defined(&SI_SUB_KTHREAD_IDLE);
    eval("sub SI_SUB_RACCTD () { 0xf100000; }") unless defined(&SI_SUB_RACCTD);
    eval("sub SI_SUB_LAST () { 0xfffffff; }") unless defined(&SI_SUB_LAST);
    eval("sub SI_ORDER_FIRST () { 0x0000000; }") unless defined(&SI_ORDER_FIRST);
    eval("sub SI_ORDER_SECOND () { 0x0000001; }") unless defined(&SI_ORDER_SECOND);
    eval("sub SI_ORDER_THIRD () { 0x0000002; }") unless defined(&SI_ORDER_THIRD);
    eval("sub SI_ORDER_FOURTH () { 0x0000003; }") unless defined(&SI_ORDER_FOURTH);
    eval("sub SI_ORDER_FIFTH () { 0x0000004; }") unless defined(&SI_ORDER_FIFTH);
    eval("sub SI_ORDER_SIXTH () { 0x0000005; }") unless defined(&SI_ORDER_SIXTH);
    eval("sub SI_ORDER_SEVENTH () { 0x0000006; }") unless defined(&SI_ORDER_SEVENTH);
    eval("sub SI_ORDER_EIGHTH () { 0x0000007; }") unless defined(&SI_ORDER_EIGHTH);
    eval("sub SI_ORDER_MIDDLE () { 0x1000000; }") unless defined(&SI_ORDER_MIDDLE);
    eval("sub SI_ORDER_ANY () { 0xfffffff; }") unless defined(&SI_ORDER_ANY);
    if(defined(&TSLOG)) {
	eval 'sub sysinit_tslog_shim {
	    my($data) = @_;
    	    eval q({  &const \'struct sysinit_tslog\' *  &x = $data;  &TSRAW( &curthread,  &TS_ENTER, \\"SYSINIT\\",  ($x->{name})); ( ($x->{func}))( ($x->{data}));  &TSRAW( &curthread,  &TS_EXIT, \\"SYSINIT\\",  ($x->{name})); });
	}' unless defined(&sysinit_tslog_shim);
	eval 'sub C_SYSINIT {
	    my($uniquifier, $subsystem, $order, $func, $ident) = @_;
    	    eval q( &static \'struct sysinit_tslog\' $uniquifier   &_sys_init_tslog = { $func, ($ident), $uniquifier };  &static \'struct sysinit\' $uniquifier   &_sys_init = { $subsystem, $order, {  &NULL },  &sysinit_tslog_shim, $uniquifier   &_sys_init_tslog };  &DATA_WSET( &sysinit_set,$uniquifier   &_sys_init));
	}' unless defined(&C_SYSINIT);
    } else {
	eval 'sub C_SYSINIT {
	    my($uniquifier, $subsystem, $order, $func, $ident) = @_;
    	    eval q( &static \'struct sysinit\' $uniquifier   &_sys_init = { $subsystem, $order, {  &NULL }, $func, ($ident) };  &DATA_WSET( &sysinit_set,$uniquifier   &_sys_init));
	}' unless defined(&C_SYSINIT);
    }
    eval 'sub SYSINIT {
        my($uniquifier, $subsystem, $order, $func, $ident) = @_;
	    eval q( &C_SYSINIT($uniquifier, $subsystem, $order, ( &sysinit_cfunc_t)( &sysinit_nfunc_t)$func, ( &void *)($ident)));
    }' unless defined(&SYSINIT);
    eval 'sub C_SYSUNINIT {
        my($uniquifier, $subsystem, $order, $func, $ident) = @_;
	    eval q( &static \'struct sysinit\' $uniquifier   &_sys_uninit = { $subsystem, $order, {  &NULL }, $func, ($ident) };  &DATA_WSET( &sysuninit_set,$uniquifier   &_sys_uninit));
    }' unless defined(&C_SYSUNINIT);
    eval 'sub SYSUNINIT {
        my($uniquifier, $subsystem, $order, $func, $ident) = @_;
	    eval q( &C_SYSUNINIT($uniquifier, $subsystem, $order, ( &sysinit_cfunc_t)( &sysinit_nfunc_t)$func, ( &void *)($ident)));
    }' unless defined(&SYSUNINIT);
    if(defined(&_KERNEL)) {
	eval 'sub TUNABLE_INT {
	    my($path, $var) = @_;
    	    eval q( &static \'struct tunable_int\'  &__CONCAT( &__tunable_int_,  &__LINE__) = { ($path), ($var), };  &SYSINIT( &__CONCAT( &__Tunable_init_,  &__LINE__),  &SI_SUB_TUNABLES,  &SI_ORDER_MIDDLE,  &tunable_int_init, & &__CONCAT( &__tunable_int_,  &__LINE__)));
	}' unless defined(&TUNABLE_INT);
	eval 'sub TUNABLE_INT_FETCH {
	    my($path, $var) = @_;
    	    eval q( &getenv_int(($path), ($var)));
	}' unless defined(&TUNABLE_INT_FETCH);
	eval 'sub TUNABLE_LONG {
	    my($path, $var) = @_;
    	    eval q( &static \'struct tunable_long\'  &__CONCAT(\'__tunable_long_\',  &__LINE__) = { ($path), ($var), };  &SYSINIT( &__CONCAT( &__Tunable_init_,  &__LINE__),  &SI_SUB_TUNABLES,  &SI_ORDER_MIDDLE, \'tunable_long_init\', & &__CONCAT(\'__tunable_long_\',  &__LINE__)));
	}' unless defined(&TUNABLE_LONG);
	eval 'sub TUNABLE_LONG_FETCH {
	    my($path, $var) = @_;
    	    eval q( &getenv_long(($path), ($var)));
	}' unless defined(&TUNABLE_LONG_FETCH);
	eval 'sub TUNABLE_ULONG {
	    my($path, $var) = @_;
    	    eval q( &static \'struct tunable_ulong\'  &__CONCAT(\'__tunable_ulong_\',  &__LINE__) = { ($path), ($var), };  &SYSINIT( &__CONCAT( &__Tunable_init_,  &__LINE__),  &SI_SUB_TUNABLES,  &SI_ORDER_MIDDLE, \'tunable_ulong_init\', & &__CONCAT(\'__tunable_ulong_\',  &__LINE__)));
	}' unless defined(&TUNABLE_ULONG);
	eval 'sub TUNABLE_ULONG_FETCH {
	    my($path, $var) = @_;
    	    eval q( &getenv_ulong(($path), ($var)));
	}' unless defined(&TUNABLE_ULONG_FETCH);
	eval 'sub TUNABLE_INT64 {
	    my($path, $var) = @_;
    	    eval q( &static \'struct tunable_int64\'  &__CONCAT( &__tunable_int64_,  &__LINE__) = { ($path), ($var), };  &SYSINIT( &__CONCAT( &__Tunable_init_,  &__LINE__),  &SI_SUB_TUNABLES,  &SI_ORDER_MIDDLE,  &tunable_int64_init, & &__CONCAT( &__tunable_int64_,  &__LINE__)));
	}' unless defined(&TUNABLE_INT64);
	eval 'sub TUNABLE_INT64_FETCH {
	    my($path, $var) = @_;
    	    eval q( &getenv_int64(($path), ($var)));
	}' unless defined(&TUNABLE_INT64_FETCH);
	eval 'sub TUNABLE_UINT64 {
	    my($path, $var) = @_;
    	    eval q( &static \'struct tunable_uint64\'  &__CONCAT( &__tunable_uint64_,  &__LINE__) = { ($path), ($var), };  &SYSINIT( &__CONCAT( &__Tunable_init_,  &__LINE__),  &SI_SUB_TUNABLES,  &SI_ORDER_MIDDLE,  &tunable_uint64_init, & &__CONCAT( &__tunable_uint64_,  &__LINE__)));
	}' unless defined(&TUNABLE_UINT64);
	eval 'sub TUNABLE_UINT64_FETCH {
	    my($path, $var) = @_;
    	    eval q( &getenv_uint64(($path), ($var)));
	}' unless defined(&TUNABLE_UINT64_FETCH);
	eval 'sub TUNABLE_QUAD {
	    my($path, $var) = @_;
    	    eval q( &static \'struct tunable_quad\'  &__CONCAT( &__tunable_quad_,  &__LINE__) = { ($path), ($var), };  &SYSINIT( &__CONCAT( &__Tunable_init_,  &__LINE__),  &SI_SUB_TUNABLES,  &SI_ORDER_MIDDLE,  &tunable_quad_init, & &__CONCAT( &__tunable_quad_,  &__LINE__)));
	}' unless defined(&TUNABLE_QUAD);
	eval 'sub TUNABLE_QUAD_FETCH {
	    my($path, $var) = @_;
    	    eval q( &getenv_quad(($path), ($var)));
	}' unless defined(&TUNABLE_QUAD_FETCH);
	eval 'sub TUNABLE_BOOL {
	    my($path, $var) = @_;
    	    eval q( &static \'struct tunable_bool\'  &__CONCAT( &__tunable_bool_,  &__LINE__) = { ($path), ($var), };  &SYSINIT( &__CONCAT( &__Tunable_init_,  &__LINE__),  &SI_SUB_TUNABLES,  &SI_ORDER_MIDDLE,  &tunable_bool_init, & &__CONCAT( &__tunable_bool_,  &__LINE__)));
	}' unless defined(&TUNABLE_BOOL);
	eval 'sub TUNABLE_BOOL_FETCH {
	    my($path, $var) = @_;
    	    eval q( &getenv_bool(($path), ($var)));
	}' unless defined(&TUNABLE_BOOL_FETCH);
	eval 'sub TUNABLE_STR {
	    my($path, $var, $size) = @_;
    	    eval q( &static \'struct tunable_str\'  &__CONCAT( &__tunable_str_,  &__LINE__) = { ($path), ($var), ($size), };  &SYSINIT( &__CONCAT( &__Tunable_init_,  &__LINE__),  &SI_SUB_TUNABLES,  &SI_ORDER_MIDDLE,  &tunable_str_init, & &__CONCAT( &__tunable_str_,  &__LINE__)));
	}' unless defined(&TUNABLE_STR);
	eval 'sub TUNABLE_STR_FETCH {
	    my($path, $var, $size) = @_;
    	    eval q( &getenv_string(($path), ($var), ($size)));
	}' unless defined(&TUNABLE_STR_FETCH);
    }
    eval 'sub ICHS_QUEUED () {0x1;}' unless defined(&ICHS_QUEUED);
    eval 'sub ICHS_RUNNING () {0x2;}' unless defined(&ICHS_RUNNING);
    eval 'sub ICHS_DONE () {0x3;}' unless defined(&ICHS_DONE);
}
1;

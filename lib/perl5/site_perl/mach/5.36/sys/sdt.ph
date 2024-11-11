require '_h2ph_pre.ph';

no warnings qw(redefine misc);

unless(defined(&_SYS_SDT_H)) {
    eval 'sub _SYS_SDT_H () {1;}' unless defined(&_SYS_SDT_H);
    unless(defined(&_KERNEL)) {
	eval 'sub _DTRACE_VERSION () {1;}' unless defined(&_DTRACE_VERSION);
	eval 'sub DTRACE_PROBE {
	    my($prov, $name) = @_;
    	    eval q({  &extern  &void  &__dtrace_$prov &___$name( &void);  &__dtrace_$prov &___$name(); });
	}' unless defined(&DTRACE_PROBE);
	eval 'sub DTRACE_PROBE1 {
	    my($prov, $name, $arg1) = @_;
    	    eval q({  &extern  &void  &__dtrace_$prov &___$name;  &__dtrace_$prov &___$name($arg1); });
	}' unless defined(&DTRACE_PROBE1);
	eval 'sub DTRACE_PROBE2 {
	    my($prov, $name, $arg1, $arg2) = @_;
    	    eval q({  &extern  &void  &__dtrace_$prov &___$name(\'unsigned long\', \'unsigned long\');  &__dtrace_$prov &___$name($arg1, $arg2); });
	}' unless defined(&DTRACE_PROBE2);
	eval 'sub DTRACE_PROBE3 {
	    my($prov, $name, $arg1, $arg2, $arg3) = @_;
    	    eval q({  &extern  &void  &__dtrace_$prov &___$name(\'unsigned long\', \'unsigned long\', \'unsigned long\');  &__dtrace_$prov &___$name($arg1, $arg2, $arg3); });
	}' unless defined(&DTRACE_PROBE3);
	eval 'sub DTRACE_PROBE4 {
	    my($prov, $name, $arg1, $arg2, $arg3, $arg4) = @_;
    	    eval q({  &extern  &void  &__dtrace_$prov &___$name(\'unsigned long\', \'unsigned long\', \'unsigned long\', \'unsigned long\');  &__dtrace_$prov &___$name($arg1, $arg2, $arg3, $arg4); });
	}' unless defined(&DTRACE_PROBE4);
	eval 'sub DTRACE_PROBE5 {
	    my($prov, $name, $arg1, $arg2, $arg3, $arg4, $arg5) = @_;
    	    eval q({  &extern  &void  &__dtrace_$prov &___$name(\'unsigned long\', \'unsigned long\', \'unsigned long\', \'unsigned long\', \'unsigned long\');  &__dtrace_$prov &___$name($arg1, $arg2, $arg3, $arg4, $arg5); });
	}' unless defined(&DTRACE_PROBE5);
    } else {
	require 'sys/cdefs.ph';
	require 'sys/linker_set.ph';
	unless(defined(&KDTRACE_HOOKS)) {
	    eval 'sub __sdt_used () { &__unused;}' unless defined(&__sdt_used);
	    eval 'sub SDT_PROVIDER_DEFINE {
	        my($prov) = @_;
    		eval q();
	    }' unless defined(&SDT_PROVIDER_DEFINE);
	    eval 'sub SDT_PROVIDER_DECLARE {
	        my($prov) = @_;
    		eval q();
	    }' unless defined(&SDT_PROVIDER_DECLARE);
	    eval 'sub SDT_PROBE_DEFINE {
	        my($prov, $mod, $func, $name) = @_;
    		eval q();
	    }' unless defined(&SDT_PROBE_DEFINE);
	    eval 'sub SDT_PROBE_DECLARE {
	        my($prov, $mod, $func, $name) = @_;
    		eval q();
	    }' unless defined(&SDT_PROBE_DECLARE);
	    eval 'sub SDT_PROBES_ENABLED () {
	        eval q(0);
	    }' unless defined(&SDT_PROBES_ENABLED);
	    eval 'sub SDT_PROBE {
	        my($prov, $mod, $func, $name, $arg0, $arg1, $arg2, $arg3, $arg4) = @_;
    		eval q();
	    }' unless defined(&SDT_PROBE);
	    eval 'sub SDT_PROBE_ARGTYPE {
	        my($prov, $mod, $func, $name, $num, $type, $xtype) = @_;
    		eval q();
	    }' unless defined(&SDT_PROBE_ARGTYPE);
	    eval 'sub SDT_PROBE_DEFINE0 {
	        my($prov, $mod, $func, $name) = @_;
    		eval q();
	    }' unless defined(&SDT_PROBE_DEFINE0);
	    eval 'sub SDT_PROBE_DEFINE1 {
	        my($prov, $mod, $func, $name, $arg0) = @_;
    		eval q();
	    }' unless defined(&SDT_PROBE_DEFINE1);
	    eval 'sub SDT_PROBE_DEFINE2 {
	        my($prov, $mod, $func, $name, $arg0, $arg1) = @_;
    		eval q();
	    }' unless defined(&SDT_PROBE_DEFINE2);
	    eval 'sub SDT_PROBE_DEFINE3 {
	        my($prov, $mod, $func, $name, $arg0, $arg1, $arg2) = @_;
    		eval q();
	    }' unless defined(&SDT_PROBE_DEFINE3);
	    eval 'sub SDT_PROBE_DEFINE4 {
	        my($prov, $mod, $func, $name, $arg0, $arg1, $arg2, $arg3) = @_;
    		eval q();
	    }' unless defined(&SDT_PROBE_DEFINE4);
	    eval 'sub SDT_PROBE_DEFINE5 {
	        my($prov, $mod, $func, $name, $arg0, $arg1, $arg2, $arg3, $arg4) = @_;
    		eval q();
	    }' unless defined(&SDT_PROBE_DEFINE5);
	    eval 'sub SDT_PROBE_DEFINE6 {
	        my($prov, $mod, $func, $name, $arg0, $arg1, $arg2,	  $arg3, $arg4, $arg5) = @_;
    		eval q();
	    }' unless defined(&SDT_PROBE_DEFINE6);
	    eval 'sub SDT_PROBE_DEFINE7 {
	        my($prov, $mod, $func, $name, $arg0, $arg1, $arg2,	  $arg3, $arg4, $arg5, $arg6) = @_;
    		eval q();
	    }' unless defined(&SDT_PROBE_DEFINE7);
	    eval 'sub SDT_PROBE0 {
	        my($prov, $mod, $func, $name) = @_;
    		eval q();
	    }' unless defined(&SDT_PROBE0);
	    eval 'sub SDT_PROBE1 {
	        my($prov, $mod, $func, $name, $arg0) = @_;
    		eval q();
	    }' unless defined(&SDT_PROBE1);
	    eval 'sub SDT_PROBE2 {
	        my($prov, $mod, $func, $name, $arg0, $arg1) = @_;
    		eval q();
	    }' unless defined(&SDT_PROBE2);
	    eval 'sub SDT_PROBE3 {
	        my($prov, $mod, $func, $name, $arg0, $arg1, $arg2) = @_;
    		eval q();
	    }' unless defined(&SDT_PROBE3);
	    eval 'sub SDT_PROBE4 {
	        my($prov, $mod, $func, $name, $arg0, $arg1, $arg2, $arg3) = @_;
    		eval q();
	    }' unless defined(&SDT_PROBE4);
	    eval 'sub SDT_PROBE5 {
	        my($prov, $mod, $func, $name, $arg0, $arg1, $arg2, $arg3, $arg4) = @_;
    		eval q();
	    }' unless defined(&SDT_PROBE5);
	    eval 'sub SDT_PROBE6 {
	        my($prov, $mod, $func, $name, $arg0, $arg1, $arg2, $arg3, $arg4, $arg5) = @_;
    		eval q();
	    }' unless defined(&SDT_PROBE6);
	    eval 'sub SDT_PROBE7 {
	        my($prov, $mod, $func, $name, $arg0, $arg1, $arg2, $arg3, $arg4, $arg5,      $arg6) = @_;
    		eval q();
	    }' unless defined(&SDT_PROBE7);
	    eval 'sub SDT_PROBE_DEFINE0_XLATE {
	        my($prov, $mod, $func, $name) = @_;
    		eval q();
	    }' unless defined(&SDT_PROBE_DEFINE0_XLATE);
	    eval 'sub SDT_PROBE_DEFINE1_XLATE {
	        my($prov, $mod, $func, $name, $arg0, $xarg0) = @_;
    		eval q();
	    }' unless defined(&SDT_PROBE_DEFINE1_XLATE);
	    eval 'sub SDT_PROBE_DEFINE2_XLATE {
	        my($prov, $mod, $func, $name, $arg0, $xarg0,	 $arg1, $xarg1) = @_;
    		eval q();
	    }' unless defined(&SDT_PROBE_DEFINE2_XLATE);
	    eval 'sub SDT_PROBE_DEFINE3_XLATE {
	        my($prov, $mod, $func, $name, $arg0, $xarg0,	 $arg1, $xarg1, $arg2, $xarg2) = @_;
    		eval q();
	    }' unless defined(&SDT_PROBE_DEFINE3_XLATE);
	    eval 'sub SDT_PROBE_DEFINE4_XLATE {
	        my($prov, $mod, $func, $name, $arg0, $xarg0,	 $arg1, $xarg1, $arg2, $xarg2, $arg3, $xarg3) = @_;
    		eval q();
	    }' unless defined(&SDT_PROBE_DEFINE4_XLATE);
	    eval 'sub SDT_PROBE_DEFINE5_XLATE {
	        my($prov, $mod, $func, $name, $arg0, $xarg0,	 $arg1, $xarg1, $arg2, $xarg2, $arg3, $xarg3, $arg4, $xarg4) = @_;
    		eval q();
	    }' unless defined(&SDT_PROBE_DEFINE5_XLATE);
	    eval 'sub SDT_PROBE_DEFINE6_XLATE {
	        my($prov, $mod, $func, $name, $arg0, $xarg0,	 $arg1,  $xarg1, $arg2, $xarg2, $arg3, $xarg3, $arg4, $xarg4, $arg5, $xarg5) = @_;
    		eval q();
	    }' unless defined(&SDT_PROBE_DEFINE6_XLATE);
	    eval 'sub SDT_PROBE_DEFINE7_XLATE {
	        my($prov, $mod, $func, $name, $arg0, $xarg0,	 $arg1, $xarg1, $arg2, $xarg2, $arg3, $xarg3, $arg4, $xarg4, $arg5, $xarg5, $arg6,	 $xarg6) = @_;
    		eval q();
	    }' unless defined(&SDT_PROBE_DEFINE7_XLATE);
	    eval 'sub DTRACE_PROBE {
	        my($name) = @_;
    		eval q();
	    }' unless defined(&DTRACE_PROBE);
	    eval 'sub DTRACE_PROBE1 {
	        my($name, $type0, $arg0) = @_;
    		eval q();
	    }' unless defined(&DTRACE_PROBE1);
	    eval 'sub DTRACE_PROBE2 {
	        my($name, $type0, $arg0, $type1, $arg1) = @_;
    		eval q();
	    }' unless defined(&DTRACE_PROBE2);
	    eval 'sub DTRACE_PROBE3 {
	        my($name, $type0, $arg0, $type1, $arg1, $type2, $arg2) = @_;
    		eval q();
	    }' unless defined(&DTRACE_PROBE3);
	    eval 'sub DTRACE_PROBE4 {
	        my($name, $type0, $arg0, $type1, $arg1, $type2, $arg2, $type3, $arg3) = @_;
    		eval q();
	    }' unless defined(&DTRACE_PROBE4);
	    eval 'sub DTRACE_PROBE5 {
	        my($name, $type0, $arg0, $type1, $arg1, $type2, $arg2, $type3, $arg3,    $type4, $arg4) = @_;
    		eval q();
	    }' unless defined(&DTRACE_PROBE5);
	} else {
	    eval 'sub __sdt_used () {1;}' unless defined(&__sdt_used);
	    eval 'sub SDT_PROVIDER_DEFINE {
	        my($_prov) = @_;
    		eval q(\'struct sdt_provider\'  &sdt_provider_$_prov->[1] = { [0] = { . &name = $_prov }, };  &DATA_SET( &sdt_providers_set,  &sdt_provider_$_prov););
	    }' unless defined(&SDT_PROVIDER_DEFINE);
	    eval 'sub SDT_PROVIDER_DECLARE {
	        my($prov) = @_;
    		eval q( &extern \'struct sdt_provider\'  &sdt_provider_$prov->[1]);
	    }' unless defined(&SDT_PROVIDER_DECLARE);
	    eval 'sub SDT_PROBE_DEFINE {
	        my($_prov, $_mod, $_func, $_name) = @_;
    		eval q(\'struct sdt_probe\'  &sdt_$_prov &_$_mod &_$_func &_$_name->[1] = { [0] = { . &version = $sizeof{\'struct sdt_probe\'}, . &prov =  &sdt_provider_$_prov, . &mod = $_mod, . &func = $_func, . &name = $_name, }, };  &DATA_SET( &sdt_probes_set,  &sdt_$_prov &_$_mod &_$_func &_$_name));
	    }' unless defined(&SDT_PROBE_DEFINE);
	    eval 'sub SDT_PROBE_DECLARE {
	        my($prov, $mod, $func, $name) = @_;
    		eval q( &extern \'struct sdt_probe\'  &sdt_$prov &_$mod &_$func &_$name->[1]);
	    }' unless defined(&SDT_PROBE_DECLARE);
	    eval 'sub SDT_PROBES_ENABLED () {
	        eval q( &__predict_false( &sdt_probes_enabled));
	    }' unless defined(&SDT_PROBES_ENABLED);
	    eval 'sub SDT_PROBE {
	        my($prov, $mod, $func, $name, $arg0, $arg1, $arg2, $arg3, $arg4) = @_;
    		eval q( &do {  &if ( &SDT_PROBES_ENABLED()) {  &if ( &__predict_false( &sdt_$prov &_$mod &_$func &_ ($name->{id}))) (* &sdt_probe_func)( &sdt_$prov &_$mod &_$func &_ ($name->{id}), ( &uintptr_t) $arg0, ( &uintptr_t) $arg1, ( &uintptr_t) $arg2, ( &uintptr_t) $arg3, ( &uintptr_t) $arg4); } }  &while (0));
	    }' unless defined(&SDT_PROBE);
	    eval 'sub SDT_PROBE_ARGTYPE {
	        my($_prov, $_mod, $_func, $_name, $_num, $_type, $_xtype) = @_;
    		eval q( &static \'struct sdt_argtype\'  &sdta_$_prov &_$_mod &_$_func &_$_name$_num->[1] = { [0] = { . &ndx = $_num, . &type = $_type, . &xtype = $_xtype, . &probe =  &sdt_$_prov &_$_mod &_$_func &_$_name, }, };  &DATA_SET( &sdt_argtypes_set,  &sdta_$_prov &_$_mod &_$_func &_$_name$_num););
	    }' unless defined(&SDT_PROBE_ARGTYPE);
	    eval 'sub SDT_PROBE_DEFINE0 {
	        my($prov, $mod, $func, $name) = @_;
    		eval q( &SDT_PROBE_DEFINE($prov, $mod, $func, $name));
	    }' unless defined(&SDT_PROBE_DEFINE0);
	    eval 'sub SDT_PROBE_DEFINE1 {
	        my($prov, $mod, $func, $name, $arg0) = @_;
    		eval q( &SDT_PROBE_DEFINE($prov, $mod, $func, $name);  &SDT_PROBE_ARGTYPE($prov, $mod, $func, $name, 0, $arg0,  &NULL));
	    }' unless defined(&SDT_PROBE_DEFINE1);
	    eval 'sub SDT_PROBE_DEFINE2 {
	        my($prov, $mod, $func, $name, $arg0, $arg1) = @_;
    		eval q( &SDT_PROBE_DEFINE($prov, $mod, $func, $name);  &SDT_PROBE_ARGTYPE($prov, $mod, $func, $name, 0, $arg0,  &NULL);  &SDT_PROBE_ARGTYPE($prov, $mod, $func, $name, 1, $arg1,  &NULL));
	    }' unless defined(&SDT_PROBE_DEFINE2);
	    eval 'sub SDT_PROBE_DEFINE3 {
	        my($prov, $mod, $func, $name, $arg0, $arg1, $arg2) = @_;
    		eval q( &SDT_PROBE_DEFINE($prov, $mod, $func, $name);  &SDT_PROBE_ARGTYPE($prov, $mod, $func, $name, 0, $arg0,  &NULL);  &SDT_PROBE_ARGTYPE($prov, $mod, $func, $name, 1, $arg1,  &NULL);  &SDT_PROBE_ARGTYPE($prov, $mod, $func, $name, 2, $arg2,  &NULL));
	    }' unless defined(&SDT_PROBE_DEFINE3);
	    eval 'sub SDT_PROBE_DEFINE4 {
	        my($prov, $mod, $func, $name, $arg0, $arg1, $arg2, $arg3) = @_;
    		eval q( &SDT_PROBE_DEFINE($prov, $mod, $func, $name);  &SDT_PROBE_ARGTYPE($prov, $mod, $func, $name, 0, $arg0,  &NULL);  &SDT_PROBE_ARGTYPE($prov, $mod, $func, $name, 1, $arg1,  &NULL);  &SDT_PROBE_ARGTYPE($prov, $mod, $func, $name, 2, $arg2,  &NULL);  &SDT_PROBE_ARGTYPE($prov, $mod, $func, $name, 3, $arg3,  &NULL));
	    }' unless defined(&SDT_PROBE_DEFINE4);
	    eval 'sub SDT_PROBE_DEFINE5 {
	        my($prov, $mod, $func, $name, $arg0, $arg1, $arg2, $arg3, $arg4) = @_;
    		eval q( &SDT_PROBE_DEFINE($prov, $mod, $func, $name);  &SDT_PROBE_ARGTYPE($prov, $mod, $func, $name, 0, $arg0,  &NULL);  &SDT_PROBE_ARGTYPE($prov, $mod, $func, $name, 1, $arg1,  &NULL);  &SDT_PROBE_ARGTYPE($prov, $mod, $func, $name, 2, $arg2,  &NULL);  &SDT_PROBE_ARGTYPE($prov, $mod, $func, $name, 3, $arg3,  &NULL);  &SDT_PROBE_ARGTYPE($prov, $mod, $func, $name, 4, $arg4,  &NULL));
	    }' unless defined(&SDT_PROBE_DEFINE5);
	    eval 'sub SDT_PROBE_DEFINE6 {
	        my($prov, $mod, $func, $name, $arg0, $arg1, $arg2, $arg3,    $arg4, $arg5) = @_;
    		eval q( &SDT_PROBE_DEFINE($prov, $mod, $func, $name);  &SDT_PROBE_ARGTYPE($prov, $mod, $func, $name, 0, $arg0,  &NULL);  &SDT_PROBE_ARGTYPE($prov, $mod, $func, $name, 1, $arg1,  &NULL);  &SDT_PROBE_ARGTYPE($prov, $mod, $func, $name, 2, $arg2,  &NULL);  &SDT_PROBE_ARGTYPE($prov, $mod, $func, $name, 3, $arg3,  &NULL);  &SDT_PROBE_ARGTYPE($prov, $mod, $func, $name, 4, $arg4,  &NULL);  &SDT_PROBE_ARGTYPE($prov, $mod, $func, $name, 5, $arg5,  &NULL));
	    }' unless defined(&SDT_PROBE_DEFINE6);
	    eval 'sub SDT_PROBE_DEFINE7 {
	        my($prov, $mod, $func, $name, $arg0, $arg1, $arg2, $arg3,    $arg4, $arg5, $arg6) = @_;
    		eval q( &SDT_PROBE_DEFINE($prov, $mod, $func, $name);  &SDT_PROBE_ARGTYPE($prov, $mod, $func, $name, 0, $arg0,  &NULL);  &SDT_PROBE_ARGTYPE($prov, $mod, $func, $name, 1, $arg1,  &NULL);  &SDT_PROBE_ARGTYPE($prov, $mod, $func, $name, 2, $arg2,  &NULL);  &SDT_PROBE_ARGTYPE($prov, $mod, $func, $name, 3, $arg3,  &NULL);  &SDT_PROBE_ARGTYPE($prov, $mod, $func, $name, 4, $arg4,  &NULL);  &SDT_PROBE_ARGTYPE($prov, $mod, $func, $name, 5, $arg5,  &NULL);  &SDT_PROBE_ARGTYPE($prov, $mod, $func, $name, 6, $arg6,  &NULL));
	    }' unless defined(&SDT_PROBE_DEFINE7);
	    eval 'sub SDT_PROBE_DEFINE0_XLATE {
	        my($prov, $mod, $func, $name) = @_;
    		eval q( &SDT_PROBE_DEFINE($prov, $mod, $func, $name));
	    }' unless defined(&SDT_PROBE_DEFINE0_XLATE);
	    eval 'sub SDT_PROBE_DEFINE1_XLATE {
	        my($prov, $mod, $func, $name, $arg0, $xarg0) = @_;
    		eval q( &SDT_PROBE_DEFINE($prov, $mod, $func, $name);  &SDT_PROBE_ARGTYPE($prov, $mod, $func, $name, 0, $arg0, $xarg0));
	    }' unless defined(&SDT_PROBE_DEFINE1_XLATE);
	    eval 'sub SDT_PROBE_DEFINE2_XLATE {
	        my($prov, $mod, $func, $name, $arg0, $xarg0,     $arg1,  $xarg1) = @_;
    		eval q( &SDT_PROBE_DEFINE($prov, $mod, $func, $name);  &SDT_PROBE_ARGTYPE($prov, $mod, $func, $name, 0, $arg0, $xarg0);  &SDT_PROBE_ARGTYPE($prov, $mod, $func, $name, 1, $arg1, $xarg1));
	    }' unless defined(&SDT_PROBE_DEFINE2_XLATE);
	    eval 'sub SDT_PROBE_DEFINE3_XLATE {
	        my($prov, $mod, $func, $name, $arg0, $xarg0,     $arg1, $xarg1, $arg2, $xarg2) = @_;
    		eval q( &SDT_PROBE_DEFINE($prov, $mod, $func, $name);  &SDT_PROBE_ARGTYPE($prov, $mod, $func, $name, 0, $arg0, $xarg0);  &SDT_PROBE_ARGTYPE($prov, $mod, $func, $name, 1, $arg1, $xarg1);  &SDT_PROBE_ARGTYPE($prov, $mod, $func, $name, 2, $arg2, $xarg2));
	    }' unless defined(&SDT_PROBE_DEFINE3_XLATE);
	    eval 'sub SDT_PROBE_DEFINE4_XLATE {
	        my($prov, $mod, $func, $name, $arg0, $xarg0,     $arg1, $xarg1, $arg2, $xarg2, $arg3, $xarg3) = @_;
    		eval q( &SDT_PROBE_DEFINE($prov, $mod, $func, $name);  &SDT_PROBE_ARGTYPE($prov, $mod, $func, $name, 0, $arg0, $xarg0);  &SDT_PROBE_ARGTYPE($prov, $mod, $func, $name, 1, $arg1, $xarg1);  &SDT_PROBE_ARGTYPE($prov, $mod, $func, $name, 2, $arg2, $xarg2);  &SDT_PROBE_ARGTYPE($prov, $mod, $func, $name, 3, $arg3, $xarg3));
	    }' unless defined(&SDT_PROBE_DEFINE4_XLATE);
	    eval 'sub SDT_PROBE_DEFINE5_XLATE {
	        my($prov, $mod, $func, $name, $arg0, $xarg0,     $arg1, $xarg1, $arg2, $xarg2, $arg3, $xarg3, $arg4, $xarg4) = @_;
    		eval q( &SDT_PROBE_DEFINE($prov, $mod, $func, $name);  &SDT_PROBE_ARGTYPE($prov, $mod, $func, $name, 0, $arg0, $xarg0);  &SDT_PROBE_ARGTYPE($prov, $mod, $func, $name, 1, $arg1, $xarg1);  &SDT_PROBE_ARGTYPE($prov, $mod, $func, $name, 2, $arg2, $xarg2);  &SDT_PROBE_ARGTYPE($prov, $mod, $func, $name, 3, $arg3, $xarg3);  &SDT_PROBE_ARGTYPE($prov, $mod, $func, $name, 4, $arg4, $xarg4));
	    }' unless defined(&SDT_PROBE_DEFINE5_XLATE);
	    eval 'sub SDT_PROBE_DEFINE6_XLATE {
	        my($prov, $mod, $func, $name, $arg0, $xarg0,     $arg1, $xarg1, $arg2, $xarg2, $arg3, $xarg3, $arg4, $xarg4, $arg5, $xarg5) = @_;
    		eval q( &SDT_PROBE_DEFINE($prov, $mod, $func, $name);  &SDT_PROBE_ARGTYPE($prov, $mod, $func, $name, 0, $arg0, $xarg0);  &SDT_PROBE_ARGTYPE($prov, $mod, $func, $name, 1, $arg1, $xarg1);  &SDT_PROBE_ARGTYPE($prov, $mod, $func, $name, 2, $arg2, $xarg2);  &SDT_PROBE_ARGTYPE($prov, $mod, $func, $name, 3, $arg3, $xarg3);  &SDT_PROBE_ARGTYPE($prov, $mod, $func, $name, 4, $arg4, $xarg4);  &SDT_PROBE_ARGTYPE($prov, $mod, $func, $name, 5, $arg5, $xarg5));
	    }' unless defined(&SDT_PROBE_DEFINE6_XLATE);
	    eval 'sub SDT_PROBE_DEFINE7_XLATE {
	        my($prov, $mod, $func, $name, $arg0, $xarg0,     $arg1, $xarg1, $arg2, $xarg2, $arg3, $xarg3, $arg4, $xarg4, $arg5, $xarg5, $arg6,     $xarg6) = @_;
    		eval q( &SDT_PROBE_DEFINE($prov, $mod, $func, $name);  &SDT_PROBE_ARGTYPE($prov, $mod, $func, $name, 0, $arg0, $xarg0);  &SDT_PROBE_ARGTYPE($prov, $mod, $func, $name, 1, $arg1, $xarg1);  &SDT_PROBE_ARGTYPE($prov, $mod, $func, $name, 2, $arg2, $xarg2);  &SDT_PROBE_ARGTYPE($prov, $mod, $func, $name, 3, $arg3, $xarg3);  &SDT_PROBE_ARGTYPE($prov, $mod, $func, $name, 4, $arg4, $xarg4);  &SDT_PROBE_ARGTYPE($prov, $mod, $func, $name, 5, $arg5, $xarg5);  &SDT_PROBE_ARGTYPE($prov, $mod, $func, $name, 6, $arg6, $xarg6));
	    }' unless defined(&SDT_PROBE_DEFINE7_XLATE);
	    eval 'sub SDT_PROBE0 {
	        my($prov, $mod, $func, $name) = @_;
    		eval q( &SDT_PROBE($prov, $mod, $func, $name, 0, 0, 0, 0, 0));
	    }' unless defined(&SDT_PROBE0);
	    eval 'sub SDT_PROBE1 {
	        my($prov, $mod, $func, $name, $arg0) = @_;
    		eval q( &SDT_PROBE($prov, $mod, $func, $name, $arg0, 0, 0, 0, 0));
	    }' unless defined(&SDT_PROBE1);
	    eval 'sub SDT_PROBE2 {
	        my($prov, $mod, $func, $name, $arg0, $arg1) = @_;
    		eval q( &SDT_PROBE($prov, $mod, $func, $name, $arg0, $arg1, 0, 0, 0));
	    }' unless defined(&SDT_PROBE2);
	    eval 'sub SDT_PROBE3 {
	        my($prov, $mod, $func, $name, $arg0, $arg1, $arg2) = @_;
    		eval q( &SDT_PROBE($prov, $mod, $func, $name, $arg0, $arg1, $arg2, 0, 0));
	    }' unless defined(&SDT_PROBE3);
	    eval 'sub SDT_PROBE4 {
	        my($prov, $mod, $func, $name, $arg0, $arg1, $arg2, $arg3) = @_;
    		eval q( &SDT_PROBE($prov, $mod, $func, $name, $arg0, $arg1, $arg2, $arg3, 0));
	    }' unless defined(&SDT_PROBE4);
	    eval 'sub SDT_PROBE5 {
	        my($prov, $mod, $func, $name, $arg0, $arg1, $arg2, $arg3, $arg4) = @_;
    		eval q( &SDT_PROBE($prov, $mod, $func, $name, $arg0, $arg1, $arg2, $arg3, $arg4));
	    }' unless defined(&SDT_PROBE5);
	    eval 'sub SDT_PROBE6 {
	        my($prov, $mod, $func, $name, $arg0, $arg1, $arg2, $arg3, $arg4, $arg5) = @_;
    		eval q( &do {  &if ( &sdt_$prov &_$mod &_$func &_ ($name->{id})) (*( &void (*)( &uint32_t,  &uintptr_t,  &uintptr_t,  &uintptr_t,  &uintptr_t,  &uintptr_t,  &uintptr_t)) &sdt_probe_func)(  &sdt_$prov &_$mod &_$func &_ ($name->{id}), ( &uintptr_t)$arg0, ( &uintptr_t)$arg1, ( &uintptr_t)$arg2, ( &uintptr_t)$arg3, ( &uintptr_t)$arg4, ( &uintptr_t)$arg5); }  &while (0));
	    }' unless defined(&SDT_PROBE6);
	    eval 'sub SDT_PROBE7 {
	        my($prov, $mod, $func, $name, $arg0, $arg1, $arg2, $arg3, $arg4, $arg5,      $arg6) = @_;
    		eval q( &do {  &if ( &sdt_$prov &_$mod &_$func &_ ($name->{id})) (*( &void (*)( &uint32_t,  &uintptr_t,  &uintptr_t,  &uintptr_t,  &uintptr_t,  &uintptr_t,  &uintptr_t,  &uintptr_t))  &sdt_probe_func)(  &sdt_$prov &_$mod &_$func &_ ($name->{id}), ( &uintptr_t)$arg0, ( &uintptr_t)$arg1, ( &uintptr_t)$arg2, ( &uintptr_t)$arg3, ( &uintptr_t)$arg4, ( &uintptr_t)$arg5, ( &uintptr_t)$arg6); }  &while (0));
	    }' unless defined(&SDT_PROBE7);
	    eval 'sub DTRACE_PROBE_IMPL_START {
	        my($name, $arg0, $arg1, $arg2, $arg3, $arg4) = @_;
    		eval q( &do {  &static  &SDT_PROBE_DEFINE( &sdt, , , $name);  &SDT_PROBE( &sdt, , , $name, $arg0, $arg1, $arg2, $arg3, $arg4););
	    }' unless defined(&DTRACE_PROBE_IMPL_START);
	    eval 'sub DTRACE_PROBE_IMPL_END () {}  &while (0);}' unless defined(&DTRACE_PROBE_IMPL_END);
	    eval 'sub DTRACE_PROBE {
	        my($name) = @_;
    		eval q( &DTRACE_PROBE_IMPL_START($name, 0, 0, 0, 0, 0)  &DTRACE_PROBE_IMPL_END);
	    }' unless defined(&DTRACE_PROBE);
	    eval 'sub DTRACE_PROBE1 {
	        my($name, $type0, $arg0) = @_;
    		eval q( &DTRACE_PROBE_IMPL_START($name, $arg0, 0, 0, 0, 0)  &SDT_PROBE_ARGTYPE( &sdt, , , $name, 0, $type0,  &NULL);  &DTRACE_PROBE_IMPL_END);
	    }' unless defined(&DTRACE_PROBE1);
	    eval 'sub DTRACE_PROBE2 {
	        my($name, $type0, $arg0, $type1, $arg1) = @_;
    		eval q( &DTRACE_PROBE_IMPL_START($name, $arg0, $arg1, 0, 0, 0)  &SDT_PROBE_ARGTYPE( &sdt, , , $name, 0, $type0,  &NULL);  &SDT_PROBE_ARGTYPE( &sdt, , , $name, 1, $type1,  &NULL);  &DTRACE_PROBE_IMPL_END);
	    }' unless defined(&DTRACE_PROBE2);
	    eval 'sub DTRACE_PROBE3 {
	        my($name, $type0, $arg0, $type1, $arg1, $type2, $arg2) = @_;
    		eval q( &DTRACE_PROBE_IMPL_START($name, $arg0, $arg1, $arg2, 0, 0)  &SDT_PROBE_ARGTYPE( &sdt, , , $name, 0, $type0,  &NULL);  &SDT_PROBE_ARGTYPE( &sdt, , , $name, 1, $type1,  &NULL);  &SDT_PROBE_ARGTYPE( &sdt, , , $name, 2, $type2,  &NULL);  &DTRACE_PROBE_IMPL_END);
	    }' unless defined(&DTRACE_PROBE3);
	    eval 'sub DTRACE_PROBE4 {
	        my($name, $type0, $arg0, $type1, $arg1, $type2, $arg2, $type3, $arg3) = @_;
    		eval q( &DTRACE_PROBE_IMPL_START($name, $arg0, $arg1, $arg2, $arg3, 0)  &SDT_PROBE_ARGTYPE( &sdt, , , $name, 0, $type0,  &NULL);  &SDT_PROBE_ARGTYPE( &sdt, , , $name, 1, $type1,  &NULL);  &SDT_PROBE_ARGTYPE( &sdt, , , $name, 2, $type2,  &NULL);  &SDT_PROBE_ARGTYPE( &sdt, , , $name, 3, $type3,  &NULL);  &DTRACE_PROBE_IMPL_END);
	    }' unless defined(&DTRACE_PROBE4);
	    eval 'sub DTRACE_PROBE5 {
	        my($name, $type0, $arg0, $type1, $arg1, $type2, $arg2, $type3, $arg3,	    $type4, $arg4) = @_;
    		eval q( &DTRACE_PROBE_IMPL_START($name, $arg0, $arg1, $arg2, $arg3, $arg4)  &SDT_PROBE_ARGTYPE( &sdt, , , $name, 0, $type0,  &NULL);  &SDT_PROBE_ARGTYPE( &sdt, , , $name, 1, $type1,  &NULL);  &SDT_PROBE_ARGTYPE( &sdt, , , $name, 2, $type2,  &NULL);  &SDT_PROBE_ARGTYPE( &sdt, , , $name, 3, $type3,  &NULL);  &SDT_PROBE_ARGTYPE( &sdt, , , $name, 4, $type4,  &NULL);  &DTRACE_PROBE_IMPL_END);
	    }' unless defined(&DTRACE_PROBE5);
	}
    }
}
1;

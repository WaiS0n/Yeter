require '_h2ph_pre.ph';

no warnings qw(redefine misc);

unless(defined(&_SYS_EXEC_H_)) {
    eval 'sub _SYS_EXEC_H_ () {1;}' unless defined(&_SYS_EXEC_H_);
    require 'machine/exec.ph';
    if(defined(&_KERNEL)) {
	require 'sys/cdefs.ph';
	eval 'sub PS_STRINGS () {( &USRSTACK - $sizeof{\'struct ps_strings\'});}' unless defined(&PS_STRINGS);
	eval 'sub PROC_PS_STRINGS {
	    my($p) = @_;
    	    eval q((($p)-> ($p_vmspace->{vm_stacktop}) - ($p)-> ($p_sysent->{sv_psstringssz})));
	}' unless defined(&PROC_PS_STRINGS);
	eval 'sub PROC_SIGCODE {
	    my($p) = @_;
    	    eval q((($p)-> ($p_vmspace->{vm_shp_base}) + ($p)-> ($p_sysent->{sv_sigcode_offset})));
	}' unless defined(&PROC_SIGCODE);
	eval 'sub PROC_HAS_SHP {
	    my($p) = @_;
    	    eval q((($p)-> ($p_sysent->{sv_shared_page_obj}) !=  &NULL));
	}' unless defined(&PROC_HAS_SHP);
	eval 'sub CORE_BUF_SIZE () {(16* 1024);}' unless defined(&CORE_BUF_SIZE);
	require 'sys/module.ph';
	eval 'sub EXEC_SET {
	    my($name, $execsw_arg) = @_;
    	    eval q( &static \'int\'  &__CONCAT($name, &_modevent)( &module_t  &mod, \'int\'  &type,  &void * &data) { \'struct execsw\' * &exec =  &data; \'int\'  &error = 0;  &switch ( &type) {  &case  &MOD_LOAD:  &error =  &exec_register( &exec);  &if ( &error)  &printf( &__XSTRING($name) \\"register failed\\\\n\\");  &break;  &case  &MOD_UNLOAD:  &error =  &exec_unregister( &exec);  &if ( &error)  &printf( &__XSTRING($name) \\" unregister failed\\\\n\\");  &break;  &default:  &error =  &EOPNOTSUPP;  &break; }  &return  &error; }  &static  &moduledata_t  &__CONCAT($name, &_mod) = {  &__XSTRING($name),  &__CONCAT($name, &_modevent), ( &void *)& $execsw_arg };  &DECLARE_MODULE_TIED($name,  &__CONCAT($name, &_mod),  &SI_SUB_EXEC,  &SI_ORDER_ANY));
	}' unless defined(&EXEC_SET);
    }
}
1;

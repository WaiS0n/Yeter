require '_h2ph_pre.ph';

no warnings qw(redefine misc);

unless(defined(&_SYS_MODULE_KHELP_H_)) {
    eval 'sub _SYS_MODULE_KHELP_H_ () {1;}' unless defined(&_SYS_MODULE_KHELP_H_);
    require 'vm/uma.ph';
    eval 'sub HELPER_NEEDS_OSD () {0x1;}' unless defined(&HELPER_NEEDS_OSD);
    eval 'sub HELPER_NAME_MAXLEN () {16;}' unless defined(&HELPER_NAME_MAXLEN);
    eval 'sub KHELP_DECLARE_MOD_UMA {
        my($hname, $hdata, $hhooks, $version, $size, $ctor, $dtor) = @_;
	    eval q( &static \'struct khelp_modevent_data\'  &kmd_$hname = { . &name = $hname, . &helper = $hdata, . &hooks = $hhooks, . &nhooks = $sizeof{$hhooks} / $sizeof{$hhooks->[0]}, . &uma_zsize = $size, . &umactor = $ctor, . &umadtor = $dtor };  &static  &moduledata_t  &h_$hname = { . &name = $hname, . &evhand =  &khelp_modevent, . &priv =  &kmd_$hname };  &DECLARE_MODULE($hname,  &h_$hname,  &SI_SUB_KHELP,  &SI_ORDER_ANY);  &MODULE_VERSION($hname, $version));
    }' unless defined(&KHELP_DECLARE_MOD_UMA);
    eval 'sub KHELP_DECLARE_MOD {
        my($hname, $hdata, $hhooks, $version) = @_;
	    eval q( &KHELP_DECLARE_MOD_UMA($hname, $hdata, $hhooks, $version, 0,  &NULL,  &NULL));
    }' unless defined(&KHELP_DECLARE_MOD);
}
1;

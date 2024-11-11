require '_h2ph_pre.ph';

no warnings qw(redefine misc);

unless(defined(&_SYS_KOBJ_H_)) {
    eval 'sub _SYS_KOBJ_H_ () {1;}' unless defined(&_SYS_KOBJ_H_);
    eval 'sub KOBJ_CLASS_FIELDS () { &const \'char\' * &name;  &kobj_method_t * &methods; \'size_t\'  &size;  &kobj_class_t * &baseclasses; \'u_int\'  &refs;  &kobj_ops_t  &ops;}' unless defined(&KOBJ_CLASS_FIELDS);
    eval 'sub KOBJ_FIELDS () { &kobj_ops_t  &ops;}' unless defined(&KOBJ_FIELDS);
    eval 'sub KOBJ_CACHE_SIZE () {256;}' unless defined(&KOBJ_CACHE_SIZE);
    eval 'sub KOBJMETHOD {
        my($NAME, $FUNC) = @_;
	    eval q({ $NAME &_desc, ( &kobjop_t) (1? $FUNC : ($NAME &_t *) &NULL) });
    }' unless defined(&KOBJMETHOD);
    eval 'sub KOBJMETHOD_END () {{  &NULL,  &NULL };}' unless defined(&KOBJMETHOD_END);
    eval 'sub DECLARE_CLASS {
        my($name) = @_;
	    eval q( &extern \'struct kobj_class\' $name);
    }' unless defined(&DECLARE_CLASS);
    eval 'sub DEFINE_CLASS {
        my($name, $methods, $size) = @_;
	    eval q( &DEFINE_CLASS_0($name, $name   &_class, $methods, $size));
    }' unless defined(&DEFINE_CLASS);
    eval 'sub DEFINE_CLASS_0 {
        my($name, $classvar, $methods, $size) = @_;
	    eval q(\'struct kobj_class\' $classvar = { $name, $methods, $size,  &NULL });
    }' unless defined(&DEFINE_CLASS_0);
    eval 'sub DEFINE_CLASS_1 {
        my($name, $classvar, $methods, $size,			       $base1) = @_;
	    eval q( &static  &kobj_class_t $name   $_baseclasses[] = { $base1,  &NULL }; \'struct kobj_class\' $classvar = { $name, $methods, $size, $name   &_baseclasses });
    }' unless defined(&DEFINE_CLASS_1);
    eval 'sub DEFINE_CLASS_2 {
        my($name, $classvar, $methods, $size,			       $base1, $base2) = @_;
	    eval q( &static  &kobj_class_t $name   $_baseclasses[] = { $base1, $base2,  &NULL }; \'struct kobj_class\' $classvar = { $name, $methods, $size, $name   &_baseclasses });
    }' unless defined(&DEFINE_CLASS_2);
    eval 'sub DEFINE_CLASS_3 {
        my($name, $classvar, $methods, $size,			       $base1, $base2, $base3) = @_;
	    eval q( &static  &kobj_class_t $name   $_baseclasses[] = { $base1, $base2, $base3,  &NULL }; \'struct kobj_class\' $classvar = { $name, $methods, $size, $name   &_baseclasses });
    }' unless defined(&DEFINE_CLASS_3);
    if(defined(&KOBJ_STATS)) {
    }
    if(defined(&KOBJ_STATS)) {
	eval 'sub KOBJOPLOOKUP {
	    my($OPS,$OP) = @_;
    	    eval q( &do {  &kobjop_desc_t  &_desc = $OP &_ &desc;  &kobj_method_t ** &_cep =  ($OPS->{cache[_desc}->{id & (KOBJ_CACHE_SIZE}-1)]);  &kobj_method_t * &_ce = * &_cep;  &if ( ($_ce->{desc}) !=  &_desc) {  &_ce =  &kobj_lookup_method( ($OPS->{cls}),  &_cep,  &_desc);  &kobj_lookup_misses++; }  &else  &kobj_lookup_hits++;  &_m =  ($_ce->{func}); }  &while (0));
	}' unless defined(&KOBJOPLOOKUP);
    } else {
	eval 'sub KOBJOPLOOKUP {
	    my($OPS,$OP) = @_;
    	    eval q( &do {  &kobjop_desc_t  &_desc = $OP &_ &desc;  &kobj_method_t ** &_cep =  ($OPS->{cache[_desc}->{id & (KOBJ_CACHE_SIZE}-1)]);  &kobj_method_t * &_ce = * &_cep;  &if ( ($_ce->{desc}) !=  &_desc)  &_ce =  &kobj_lookup_method( ($OPS->{cls}),  &_cep,  &_desc);  &_m =  ($_ce->{func}); }  &while (0));
	}' unless defined(&KOBJOPLOOKUP);
    }
}
1;

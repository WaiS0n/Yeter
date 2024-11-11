require '_h2ph_pre.ph';

no warnings qw(redefine misc);

unless(defined(&_SYS_DOMAIN_H_)) {
    eval 'sub _SYS_DOMAIN_H_ () {1;}' unless defined(&_SYS_DOMAIN_H_);
    require 'sys/queue.ph';
    eval 'sub DOMF_UNLOADABLE () {0x4;}' unless defined(&DOMF_UNLOADABLE);
    if(defined(&_KERNEL)) {
	if(defined(&VIMAGE)) {
	}
	eval 'sub DOMAIN_SET {
	    my($name) = @_;
    	    eval q( &SYSINIT( &domain_add_  $name,  &SI_SUB_PROTO_DOMAIN,  &SI_ORDER_FIRST,  &domain_add, & $name   &domain);  &SYSUNINIT( &domain_remove_  $name,  &SI_SUB_PROTO_DOMAIN,  &SI_ORDER_FIRST,  &domain_remove, & $name   &domain););
	}' unless defined(&DOMAIN_SET);
    }
}
1;

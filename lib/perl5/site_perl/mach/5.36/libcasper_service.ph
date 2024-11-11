require '_h2ph_pre.ph';

no warnings qw(redefine misc);

unless(defined(&_LIBCASPER_SERVICE_H_)) {
    eval 'sub _LIBCASPER_SERVICE_H_ () {1;}' unless defined(&_LIBCASPER_SERVICE_H_);
    unless(defined(&_NVLIST_T_DECLARED)) {
	eval 'sub _NVLIST_T_DECLARED () {1;}' unless defined(&_NVLIST_T_DECLARED);
    }
    eval 'sub CASPER_SERVICE_STDIO () {0x1;}' unless defined(&CASPER_SERVICE_STDIO);
    eval 'sub CASPER_SERVICE_FD () {0x2;}' unless defined(&CASPER_SERVICE_FD);
    eval 'sub CASPER_SERVICE_NO_UNIQ_LIMITS () {0x4;}' unless defined(&CASPER_SERVICE_NO_UNIQ_LIMITS);
    eval 'sub __constructor () { &__attribute__(( &constructor));}' unless defined(&__constructor);
    eval 'sub CREATE_SERVICE {
        my($name, $limit_func, $command_func, $flags) = @_;
	    eval q( &static  &__constructor  &void  &init_casper_service( &void) { ( &void) &service_register($name, $limit_func, $command_func, $flags); });
    }' unless defined(&CREATE_SERVICE);
}
1;

require '_h2ph_pre.ph';

no warnings qw(redefine misc);

unless(defined(&_SYS_CSAN_H_)) {
    eval 'sub _SYS_CSAN_H_ () {1;}' unless defined(&_SYS_CSAN_H_);
    require 'sys/types.ph';
    if(defined(&KCSAN)) {
    } else {
	eval 'sub kcsan_cpu_init {
	    my($ci) = @_;
    	    eval q((( &void)0));
	}' unless defined(&kcsan_cpu_init);
    }
}
1;

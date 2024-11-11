require '_h2ph_pre.ph';

no warnings qw(redefine misc);

unless(defined(&_SYS_UN_H_)) {
    eval 'sub _SYS_UN_H_ () {1;}' unless defined(&_SYS_UN_H_);
    require 'sys/cdefs.ph';
    require 'sys/_types.ph';
    unless(defined(&_SA_FAMILY_T_DECLARED)) {
	eval 'sub _SA_FAMILY_T_DECLARED () {1;}' unless defined(&_SA_FAMILY_T_DECLARED);
    }
    eval 'sub SUNPATHLEN () {104;}' unless defined(&SUNPATHLEN);
    if((defined(&__BSD_VISIBLE) ? &__BSD_VISIBLE : undef)) {
	eval 'sub SOL_LOCAL () {0;}' unless defined(&SOL_LOCAL);
	eval 'sub LOCAL_PEERCRED () {1;}' unless defined(&LOCAL_PEERCRED);
	eval 'sub LOCAL_CREDS () {2;}' unless defined(&LOCAL_CREDS);
	eval 'sub LOCAL_CREDS_PERSISTENT () {3;}' unless defined(&LOCAL_CREDS_PERSISTENT);
	eval 'sub LOCAL_CONNWAIT () {4;}' unless defined(&LOCAL_CONNWAIT);
	eval 'sub LOCAL_VENDOR () { &SO_VENDOR;}' unless defined(&LOCAL_VENDOR);
	unless(defined(&_KERNEL)) {
	    eval 'sub SUN_LEN {
	        my($su) = @_;
    		eval q(($sizeof{($su)} - $sizeof{($su)-> &sun_path} +  &strlen(($su)-> &sun_path)));
	    }' unless defined(&SUN_LEN);
	}
    }
}
1;

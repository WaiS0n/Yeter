require '_h2ph_pre.ph';

no warnings qw(redefine misc);

unless(defined(&_SYS_CAPRIGHTS_H_)) {
    eval 'sub _SYS_CAPRIGHTS_H_ () {1;}' unless defined(&_SYS_CAPRIGHTS_H_);
    eval 'sub CAP_RIGHTS_VERSION_00 () {0;}' unless defined(&CAP_RIGHTS_VERSION_00);
    eval 'sub CAP_RIGHTS_VERSION () { &CAP_RIGHTS_VERSION_00;}' unless defined(&CAP_RIGHTS_VERSION);
    unless(defined(&_CAP_RIGHTS_T_DECLARED)) {
	eval 'sub _CAP_RIGHTS_T_DECLARED () {1;}' unless defined(&_CAP_RIGHTS_T_DECLARED);
    }
    if(defined(&_KERNEL)) {
    }
}
1;

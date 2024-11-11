require '_h2ph_pre.ph';

no warnings qw(redefine misc);

unless(defined(&_SYS_TIMETC_H_)) {
    eval 'sub _SYS_TIMETC_H_ () {1;}' unless defined(&_SYS_TIMETC_H_);
    unless(defined(&_KERNEL)) {
	die("no user-serviceable parts inside");
    }
    eval 'sub TC_FLAGS_C2STOP () {1;}' unless defined(&TC_FLAGS_C2STOP);
    eval 'sub TC_FLAGS_SUSPEND_SAFE () {2;}' unless defined(&TC_FLAGS_SUSPEND_SAFE);
    if(defined(&SYSCTL_DECL)) {
    }
}
1;

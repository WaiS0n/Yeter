require '_h2ph_pre.ph';

no warnings qw(redefine misc);

unless(defined(&_SYS_SOCKOPT_H_)) {
    eval 'sub _SYS_SOCKOPT_H_ () {1;}' unless defined(&_SYS_SOCKOPT_H_);
    unless(defined(&_KERNEL)) {
	die("no user-serviceable parts inside");
    }
    eval("sub SOPT_GET () { 0; }") unless defined(&SOPT_GET);
    eval("sub SOPT_SET () { 1; }") unless defined(&SOPT_SET);
}
1;

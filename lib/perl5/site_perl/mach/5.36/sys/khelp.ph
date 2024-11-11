require '_h2ph_pre.ph';

no warnings qw(redefine misc);

unless(defined(&_SYS_KHELP_H_)) {
    eval 'sub _SYS_KHELP_H_ () {1;}' unless defined(&_SYS_KHELP_H_);
    eval 'sub HELPER_CLASS_TCP () {0x1;}' unless defined(&HELPER_CLASS_TCP);
    eval 'sub HELPER_CLASS_SOCKET () {0x2;}' unless defined(&HELPER_CLASS_SOCKET);
}
1;

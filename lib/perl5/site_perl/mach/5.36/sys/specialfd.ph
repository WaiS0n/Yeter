require '_h2ph_pre.ph';

no warnings qw(redefine misc);

unless(defined(&_SYS_SPECIALFD_H_)) {
    eval 'sub _SYS_SPECIALFD_H_ () {1;}' unless defined(&_SYS_SPECIALFD_H_);
    eval("sub SPECIALFD_EVENTFD () { 1; }") unless defined(&SPECIALFD_EVENTFD);
}
1;

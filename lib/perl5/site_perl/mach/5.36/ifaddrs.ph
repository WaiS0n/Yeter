require '_h2ph_pre.ph';

no warnings qw(redefine misc);

unless(defined(&_IFADDRS_H_)) {
    eval 'sub _IFADDRS_H_ () {1;}' unless defined(&_IFADDRS_H_);
    unless(defined(&ifa_broadaddr)) {
	eval 'sub ifa_broadaddr () { &ifa_dstaddr;}' unless defined(&ifa_broadaddr);
    }
    require 'sys/cdefs.ph';
}
1;

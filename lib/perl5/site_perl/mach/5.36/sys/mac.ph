require '_h2ph_pre.ph';

no warnings qw(redefine misc);

unless(defined(&_SYS_MAC_H_)) {
    eval 'sub _SYS_MAC_H_ () {1;}' unless defined(&_SYS_MAC_H_);
    unless(defined(&_POSIX_MAC)) {
	eval 'sub _POSIX_MAC () {1;}' unless defined(&_POSIX_MAC);
    }
    eval 'sub MAC_MAX_POLICY_NAME () {32;}' unless defined(&MAC_MAX_POLICY_NAME);
    eval 'sub MAC_MAX_LABEL_ELEMENT_NAME () {32;}' unless defined(&MAC_MAX_LABEL_ELEMENT_NAME);
    eval 'sub MAC_MAX_LABEL_ELEMENT_DATA () {4096;}' unless defined(&MAC_MAX_LABEL_ELEMENT_DATA);
    eval 'sub MAC_MAX_LABEL_BUF_LEN () {8192;}' unless defined(&MAC_MAX_LABEL_BUF_LEN);
    unless(defined(&_KERNEL)) {
	eval 'sub MAC_CONFFILE () {"/etc/mac.conf";}' unless defined(&MAC_CONFFILE);
    }
}
1;

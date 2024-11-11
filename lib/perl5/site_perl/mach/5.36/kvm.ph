require '_h2ph_pre.ph';

no warnings qw(redefine misc);

unless(defined(&_KVM_H_)) {
    eval 'sub _KVM_H_ () {1;}' unless defined(&_KVM_H_);
    require 'sys/cdefs.ph';
    require 'sys/types.ph';
    require 'nlist.ph';
    unless(defined(&VM_H)) {
    }
    eval 'sub VRS_SYM () {"_version";}' unless defined(&VRS_SYM);
    eval 'sub VRS_KEY () {"VERSION";}' unless defined(&VRS_KEY);
    unless(defined(&_SIZE_T_DECLARED)) {
	eval 'sub _SIZE_T_DECLARED () {1;}' unless defined(&_SIZE_T_DECLARED);
    }
    unless(defined(&_SSIZE_T_DECLARED)) {
	eval 'sub _SSIZE_T_DECLARED () {1;}' unless defined(&_SSIZE_T_DECLARED);
    }
    eval 'sub SWIF_DEV_PREFIX () {0x2;}' unless defined(&SWIF_DEV_PREFIX);
    eval 'sub LIBKVM_WALK_PAGES_VERSION () {2;}' unless defined(&LIBKVM_WALK_PAGES_VERSION);
}
1;

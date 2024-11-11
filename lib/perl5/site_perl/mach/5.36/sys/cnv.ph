require '_h2ph_pre.ph';

no warnings qw(redefine misc);

unless(defined(&_CNV_H_)) {
    eval 'sub _CNV_H_ () {1;}' unless defined(&_CNV_H_);
    require 'sys/cdefs.ph';
    unless(defined(&_KERNEL)) {
	require 'stdarg.ph';
	require 'stdbool.ph';
	require 'stdint.ph';
	require 'stdio.ph';
	require 'sys/nv_namespace.ph';
    }
    unless(defined(&_NVLIST_T_DECLARED)) {
	eval 'sub _NVLIST_T_DECLARED () {1;}' unless defined(&_NVLIST_T_DECLARED);
    }
    unless(defined(&_KERNEL)) {
    }
    unless(defined(&_KERNEL)) {
    }
    unless(defined(&_KERNEL)) {
    }
}
1;

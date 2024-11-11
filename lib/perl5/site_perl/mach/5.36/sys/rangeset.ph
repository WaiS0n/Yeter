require '_h2ph_pre.ph';

no warnings qw(redefine misc);

unless(defined(&_SYS_RANGESET_H)) {
    eval 'sub _SYS_RANGESET_H () {1;}' unless defined(&_SYS_RANGESET_H);
    if(defined(&_KERNEL)) {
	require 'sys/_rangeset.ph';
    }
}
1;

require '_h2ph_pre.ph';

no warnings qw(redefine misc);

unless(defined(&_SYS__LOCKMGR_H_)) {
    eval 'sub _SYS__LOCKMGR_H_ () {1;}' unless defined(&_SYS__LOCKMGR_H_);
    if(defined(&DEBUG_LOCKS)) {
	require 'sys/_stack.ph';
    }
    if(defined(&DEBUG_LOCKS)) {
    }
}
1;

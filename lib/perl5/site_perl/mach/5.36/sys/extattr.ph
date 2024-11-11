require '_h2ph_pre.ph';

no warnings qw(redefine misc);

unless(defined(&_SYS_EXTATTR_H_)) {
    eval 'sub _SYS_EXTATTR_H_ () {1;}' unless defined(&_SYS_EXTATTR_H_);
    eval 'sub EXTATTR_NAMESPACE_EMPTY () {0x;}' unless defined(&EXTATTR_NAMESPACE_EMPTY);
    eval 'sub EXTATTR_NAMESPACE_EMPTY_STRING () {"empty";}' unless defined(&EXTATTR_NAMESPACE_EMPTY_STRING);
    eval 'sub EXTATTR_NAMESPACE_USER () {0x1;}' unless defined(&EXTATTR_NAMESPACE_USER);
    eval 'sub EXTATTR_NAMESPACE_USER_STRING () {"user";}' unless defined(&EXTATTR_NAMESPACE_USER_STRING);
    eval 'sub EXTATTR_NAMESPACE_SYSTEM () {0x2;}' unless defined(&EXTATTR_NAMESPACE_SYSTEM);
    eval 'sub EXTATTR_NAMESPACE_SYSTEM_STRING () {"system";}' unless defined(&EXTATTR_NAMESPACE_SYSTEM_STRING);
    eval 'sub EXTATTR_NAMESPACE_NAMES () {{  &EXTATTR_NAMESPACE_EMPTY_STRING,  &EXTATTR_NAMESPACE_USER_STRING,  &EXTATTR_NAMESPACE_SYSTEM_STRING };}' unless defined(&EXTATTR_NAMESPACE_NAMES);
    eval 'sub EXTATTR_MAXNAMELEN () { &NAME_MAX;}' unless defined(&EXTATTR_MAXNAMELEN);
    if(defined(&_KERNEL)) {
	require 'sys/types.ph';
    } else {
	require 'sys/cdefs.ph';
    }
}
1;

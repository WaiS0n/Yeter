require '_h2ph_pre.ph';

no warnings qw(redefine misc);

unless(defined(&__SYSDECODE_H__)) {
    eval 'sub __SYSDECODE_H__ () {1;}' unless defined(&__SYSDECODE_H__);
    require 'sys/types.ph';
    require 'stdbool.ph';
    require 'stdio.ph';
    eval("sub SYSDECODE_ABI_UNKNOWN () { 0; }") unless defined(&SYSDECODE_ABI_UNKNOWN);
    eval("sub SYSDECODE_ABI_FREEBSD () { 1; }") unless defined(&SYSDECODE_ABI_FREEBSD);
    eval("sub SYSDECODE_ABI_FREEBSD32 () { 2; }") unless defined(&SYSDECODE_ABI_FREEBSD32);
    eval("sub SYSDECODE_ABI_LINUX () { 3; }") unless defined(&SYSDECODE_ABI_LINUX);
    eval("sub SYSDECODE_ABI_LINUX32 () { 4; }") unless defined(&SYSDECODE_ABI_LINUX32);
    if(defined(&__i386__) || defined(&__amd64__) || defined(&__aarch64__)) {
	eval 'sub SYSDECODE_HAVE_LINUX () {1;}' unless defined(&SYSDECODE_HAVE_LINUX);
    }
}
1;

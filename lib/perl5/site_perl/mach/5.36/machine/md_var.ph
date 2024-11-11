require '_h2ph_pre.ph';

no warnings qw(redefine misc);

if(defined(&__i386__)) {
    require 'i386/md_var.ph';
} else {
    unless(defined(&_MACHINE_MD_VAR_H_)) {
	eval 'sub _MACHINE_MD_VAR_H_ () {1;}' unless defined(&_MACHINE_MD_VAR_H_);
	require 'x86/x86_var.ph';
    }
}
1;

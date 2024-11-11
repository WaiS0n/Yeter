require '_h2ph_pre.ph';

no warnings qw(redefine misc);

unless(defined(&_SYS_UTSNAME_H)) {
    eval 'sub _SYS_UTSNAME_H () {1;}' unless defined(&_SYS_UTSNAME_H);
    if(defined(&_KERNEL)) {
	eval 'sub SYS_NMLN () {32;}' unless defined(&SYS_NMLN);
    }
    unless(defined(&SYS_NMLN)) {
	eval 'sub SYS_NMLN () {256;}' unless defined(&SYS_NMLN);
    }
    require 'sys/cdefs.ph';
    unless(defined(&_KERNEL)) {
	eval 'sub uname {
	    my($name) = @_;
    	    eval q({  &__xuname( &SYS_NMLN, ( &void *)$name); });
	}' unless defined(&uname);
    }
}
1;

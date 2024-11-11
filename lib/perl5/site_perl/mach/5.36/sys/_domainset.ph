require '_h2ph_pre.ph';

no warnings qw(redefine misc);

unless(defined(&_SYS__DOMAINSET_H_)) {
    eval 'sub _SYS__DOMAINSET_H_ () {1;}' unless defined(&_SYS__DOMAINSET_H_);
    require 'sys/_bitset.ph';
    if(defined(&_KERNEL)) {
	eval 'sub DOMAINSET_SETSIZE () { &MAXMEMDOM;}' unless defined(&DOMAINSET_SETSIZE);
    }
    eval 'sub DOMAINSET_MAXSIZE () {256;}' unless defined(&DOMAINSET_MAXSIZE);
    unless(defined(&DOMAINSET_SETSIZE)) {
	eval 'sub DOMAINSET_SETSIZE () { &DOMAINSET_MAXSIZE;}' unless defined(&DOMAINSET_SETSIZE);
    }
}
1;

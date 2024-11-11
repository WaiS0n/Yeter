require '_h2ph_pre.ph';

no warnings qw(redefine misc);

unless(defined(&_SYS_DEVMAP_H_)) {
    eval 'sub _SYS_DEVMAP_H_ () {1;}' unless defined(&_SYS_DEVMAP_H_);
    unless(defined(&_KERNEL)) {
	die("no user-serviceable parts inside");
    }
    eval 'sub DEVMAP_PADDR_NOTFOUND () {(( &vm_paddr_t)(-1));}' unless defined(&DEVMAP_PADDR_NOTFOUND);
}
1;

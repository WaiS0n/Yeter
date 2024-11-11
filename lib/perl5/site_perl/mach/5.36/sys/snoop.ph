require '_h2ph_pre.ph';

no warnings qw(redefine misc);

unless(defined(&_SYS_SNOOP_H_)) {
    eval 'sub _SYS_SNOOP_H_ () {1;}' unless defined(&_SYS_SNOOP_H_);
    unless(defined(&_KERNEL)) {
	require 'sys/types.ph';
    }
    require 'sys/ioccom.ph';
    eval 'sub SNPSTTY () { &_IOW(ord(\'T\'), 90, \'int\');}' unless defined(&SNPSTTY);
    eval 'sub SNPGTTY () { &_IOR(ord(\'T\'), 89,  &dev_t);}' unless defined(&SNPGTTY);
    eval 'sub SNP_OFLOW () {-1;}' unless defined(&SNP_OFLOW);
    eval 'sub SNP_TTYCLOSE () {-2;}' unless defined(&SNP_TTYCLOSE);
    eval 'sub SNP_DETACH () {-3;}' unless defined(&SNP_DETACH);
}
1;

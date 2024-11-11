require '_h2ph_pre.ph';

no warnings qw(redefine misc);

unless(defined(&_POSIX4_KSEM_H_)) {
    eval 'sub _POSIX4_KSEM_H_ () {1;}' unless defined(&_POSIX4_KSEM_H_);
    if(!defined(&_KERNEL)  && !defined(&_WANT_FILE)) {
	die("no user-serviceable parts inside");
    }
    require 'sys/condvar.ph';
    eval 'sub KS_ANONYMOUS () {0x1;}' unless defined(&KS_ANONYMOUS);
    eval 'sub KS_DEAD () {0x2;}' unless defined(&KS_DEAD);
}
1;

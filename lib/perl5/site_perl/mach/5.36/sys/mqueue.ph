require '_h2ph_pre.ph';

no warnings qw(redefine misc);

unless(defined(&_SYS_MQUEUE_H_)) {
    eval 'sub _SYS_MQUEUE_H_ () {1;}' unless defined(&_SYS_MQUEUE_H_);
    if(defined(&_KERNEL)) {
    }
}
1;

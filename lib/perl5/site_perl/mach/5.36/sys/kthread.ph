require '_h2ph_pre.ph';

no warnings qw(redefine misc);

unless(defined(&_SYS_KTHREAD_H_)) {
    eval 'sub _SYS_KTHREAD_H_ () {1;}' unless defined(&_SYS_KTHREAD_H_);
    require 'sys/cdefs.ph';
}
1;

require '_h2ph_pre.ph';

no warnings qw(redefine misc);

unless(defined(&_SYS_LOCKF_H_)) {
    eval 'sub _SYS_LOCKF_H_ () {1;}' unless defined(&_SYS_LOCKF_H_);
    require 'sys/queue.ph';
    require 'sys/_lock.ph';
    require 'sys/_sx.ph';
    eval 'sub F_INTR () {0x8000;}' unless defined(&F_INTR);
}
1;

require '_h2ph_pre.ph';

no warnings qw(redefine misc);

unless(defined(&_SYS_EVENTFD_H_)) {
    eval 'sub _SYS_EVENTFD_H_ () {1;}' unless defined(&_SYS_EVENTFD_H_);
    require 'sys/types.ph';
    eval 'sub EFD_SEMAPHORE () {0x1;}' unless defined(&EFD_SEMAPHORE);
    eval 'sub EFD_NONBLOCK () {0x4;}' unless defined(&EFD_NONBLOCK);
    eval 'sub EFD_CLOEXEC () {0x100000;}' unless defined(&EFD_CLOEXEC);
    if(defined(&_KERNEL)) {
    } else {
    }
}
1;

require '_h2ph_pre.ph';

no warnings qw(redefine misc);

unless(defined(&_SYS_TIMERFD_H_)) {
    eval 'sub _SYS_TIMERFD_H_ () {1;}' unless defined(&_SYS_TIMERFD_H_);
    require 'sys/types.ph';
    require 'sys/fcntl.ph';
    require 'sys/time.ph';
    eval 'sub TFD_NONBLOCK () { &O_NONBLOCK;}' unless defined(&TFD_NONBLOCK);
    eval 'sub TFD_CLOEXEC () { &O_CLOEXEC;}' unless defined(&TFD_CLOEXEC);
    eval 'sub TFD_TIMER_ABSTIME () {0x1;}' unless defined(&TFD_TIMER_ABSTIME);
    eval 'sub TFD_TIMER_CANCEL_ON_SET () {0x2;}' unless defined(&TFD_TIMER_CANCEL_ON_SET);
    unless(defined(&_KERNEL)) {
    } else {
    }
}
1;

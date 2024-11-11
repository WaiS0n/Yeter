require '_h2ph_pre.ph';

no warnings qw(redefine misc);

unless(defined(&_MQUEUE_H_)) {
    eval 'sub _MQUEUE_H_ () {1;}' unless defined(&_MQUEUE_H_);
    require 'sys/cdefs.ph';
    require 'sys/types.ph';
    require 'sys/mqueue.ph';
    require 'sys/signal.ph';
    if((defined(&__BSD_VISIBLE) ? &__BSD_VISIBLE : undef)) {
    }
}
1;

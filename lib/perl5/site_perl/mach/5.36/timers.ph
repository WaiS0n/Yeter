require '_h2ph_pre.ph';

no warnings qw(redefine misc);

unless(defined(&_TIMERS_H_)) {
    eval 'sub _TIMERS_H_ () {1;}' unless defined(&_TIMERS_H_);
    require 'sys/timers.ph';
}
1;

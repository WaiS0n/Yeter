require '_h2ph_pre.ph';

no warnings qw(redefine misc);

unless(defined(&_SYS__CALLOUT_H)) {
    eval 'sub _SYS__CALLOUT_H () {1;}' unless defined(&_SYS__CALLOUT_H);
    require 'sys/_types.ph';
    require 'sys/queue.ph';
}
1;

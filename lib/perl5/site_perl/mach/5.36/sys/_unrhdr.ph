require '_h2ph_pre.ph';

no warnings qw(redefine misc);

unless(defined(&_SYS_UNRHDR_H)) {
    eval 'sub _SYS_UNRHDR_H () {1;}' unless defined(&_SYS_UNRHDR_H);
    require 'sys/queue.ph';
}
1;

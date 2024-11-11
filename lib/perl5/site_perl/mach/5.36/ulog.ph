require '_h2ph_pre.ph';

no warnings qw(redefine misc);

unless(defined(&_ULOG_H_)) {
    eval 'sub _ULOG_H_ () {1;}' unless defined(&_ULOG_H_);
    require 'sys/cdefs.ph';
}
1;

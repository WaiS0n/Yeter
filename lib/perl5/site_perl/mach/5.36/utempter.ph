require '_h2ph_pre.ph';

no warnings qw(redefine misc);

unless(defined(&_UTEMPTER_H_)) {
    eval 'sub _UTEMPTER_H_ () {1;}' unless defined(&_UTEMPTER_H_);
    require 'sys/cdefs.ph';
}
1;

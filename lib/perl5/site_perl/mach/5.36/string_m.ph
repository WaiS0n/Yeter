require '_h2ph_pre.ph';

no warnings qw(redefine misc);

unless(defined(&_STRING_M_H_)) {
    eval 'sub _STRING_M_H_ () {1;}' unless defined(&_STRING_M_H_);
    require 'sys/cdefs.ph';
}
1;

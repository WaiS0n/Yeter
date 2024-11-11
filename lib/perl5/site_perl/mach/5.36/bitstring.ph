require '_h2ph_pre.ph';

no warnings qw(redefine misc);

unless(defined(&_BITSTRING_H_)) {
    eval 'sub _BITSTRING_H_ () {1;}' unless defined(&_BITSTRING_H_);
    require 'stdlib.ph';
    require 'strings.ph';
    require 'sys/bitstring.ph';
}
1;

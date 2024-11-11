require '_h2ph_pre.ph';

no warnings qw(redefine misc);

unless(defined(&_IEEEFP_H_)) {
    eval 'sub _IEEEFP_H_ () {1;}' unless defined(&_IEEEFP_H_);
    require 'sys/cdefs.ph';
    require 'machine/ieeefp.ph';
}
1;

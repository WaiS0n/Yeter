require '_h2ph_pre.ph';

no warnings qw(redefine misc);

unless(defined(&_FLOATINGPOINT_H_)) {
    eval 'sub _FLOATINGPOINT_H_ () {1;}' unless defined(&_FLOATINGPOINT_H_);
    require 'sys/cdefs.ph';
    require 'machine/ieeefp.ph';
}
1;

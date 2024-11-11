require '_h2ph_pre.ph';

no warnings qw(redefine misc);

unless(defined(&_CUSE_H_)) {
    eval 'sub _CUSE_H_ () {1;}' unless defined(&_CUSE_H_);
    if(defined(&__cplusplus)) {
    }
    require 'fs/cuse/cuse_defs.ph';
    if(defined(&__cplusplus)) {
    }
}
1;

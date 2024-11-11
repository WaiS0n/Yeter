require '_h2ph_pre.ph';

no warnings qw(redefine misc);

unless(defined(&_NLIST_H_)) {
    eval 'sub _NLIST_H_ () {1;}' unless defined(&_NLIST_H_);
    require 'sys/nlist_aout.ph';
    require 'sys/cdefs.ph';
}
1;

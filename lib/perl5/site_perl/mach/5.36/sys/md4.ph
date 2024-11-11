require '_h2ph_pre.ph';

no warnings qw(redefine misc);

unless(defined(&_MD4_H_)) {
    eval 'sub _MD4_H_ () {1;}' unless defined(&_MD4_H_);
    require 'sys/cdefs.ph';
    unless(defined(&_KERNEL)) {
    }
}
1;

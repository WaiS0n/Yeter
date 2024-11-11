require '_h2ph_pre.ph';

no warnings qw(redefine misc);

unless(defined(&_ERR_H_)) {
    eval 'sub _ERR_H_ () {1;}' unless defined(&_ERR_H_);
    require 'sys/cdefs.ph';
    require 'sys/_types.ph';
}
1;

require '_h2ph_pre.ph';

no warnings qw(redefine misc);

unless(defined(&__DEVCTL_H__)) {
    eval 'sub __DEVCTL_H__ () {1;}' unless defined(&__DEVCTL_H__);
    require 'stdbool.ph';
}
1;

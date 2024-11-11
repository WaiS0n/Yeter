require '_h2ph_pre.ph';

no warnings qw(redefine misc);

unless(defined(&_SYS_DKSTAT_H_)) {
    eval 'sub _SYS_DKSTAT_H_ () {1;}' unless defined(&_SYS_DKSTAT_H_);
    require 'sys/resource.ph';
}
1;

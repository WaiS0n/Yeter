require '_h2ph_pre.ph';

no warnings qw(redefine misc);

unless(defined(&_PMC_H_)) {
    eval 'sub _PMC_H_ () {1;}' unless defined(&_PMC_H_);
    require 'sys/cdefs.ph';
    require 'sys/types.ph';
    require 'sys/pmc.ph';
}
1;

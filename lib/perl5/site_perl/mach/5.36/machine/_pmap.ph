require '_h2ph_pre.ph';

no warnings qw(redefine misc);

unless(defined(&_MACHINE__PMAP_H_)) {
    eval 'sub _MACHINE__PMAP_H_ () {1;}' unless defined(&_MACHINE__PMAP_H_);
}
1;
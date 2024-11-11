require '_h2ph_pre.ph';

no warnings qw(redefine misc);

unless(defined(&_MACHINE_TSS_H_)) {
    eval 'sub _MACHINE_TSS_H_ () {1;}' unless defined(&_MACHINE_TSS_H_);
}
1;

require '_h2ph_pre.ph';

no warnings qw(redefine misc);

unless(defined(&_I386_MACHINE_RELOC_H_)) {
    eval 'sub _I386_MACHINE_RELOC_H_ () {1;}' unless defined(&_I386_MACHINE_RELOC_H_);
}
1;

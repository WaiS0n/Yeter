require '_h2ph_pre.ph';

no warnings qw(redefine misc);

unless(defined(&_SYS_AUXV_H_)) {
    eval 'sub _SYS_AUXV_H_ () {1;}' unless defined(&_SYS_AUXV_H_);
    require 'sys/types.ph';
    require 'machine/elf.ph';
}
1;

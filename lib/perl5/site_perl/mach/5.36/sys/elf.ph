require '_h2ph_pre.ph';

no warnings qw(redefine misc);

unless(defined(&_SYS_ELF_H_)) {
    eval 'sub _SYS_ELF_H_ () {1;}' unless defined(&_SYS_ELF_H_);
    require 'sys/types.ph';
    require 'machine/elf.ph';
    require 'sys/elf32.ph';
    require 'sys/elf64.ph';
}
1;

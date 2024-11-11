require '_h2ph_pre.ph';

no warnings qw(redefine misc);

unless(defined(&_AOUT_H_)) {
    eval 'sub _AOUT_H_ () {1;}' unless defined(&_AOUT_H_);
    require 'sys/types.ph';
    require 'machine/exec.ph';
    require 'sys/endian.ph';
    require 'sys/imgact_aout.ph';
    require 'machine/reloc.ph';
    eval 'sub _AOUT_INCLUDE_ () {1;}' unless defined(&_AOUT_INCLUDE_);
    require 'nlist.ph';
}
1;

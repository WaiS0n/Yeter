require '_h2ph_pre.ph';

no warnings qw(redefine misc);

unless(defined(&_ENDIAN_H_)) {
    eval 'sub _ENDIAN_H_ () {1;}' unless defined(&_ENDIAN_H_);
    require 'sys/_endian.ph';
    eval 'sub __BIG_ENDIAN () { &_BIG_ENDIAN;}' unless defined(&__BIG_ENDIAN);
    eval 'sub __BYTE_ORDER () { &_BYTE_ORDER;}' unless defined(&__BYTE_ORDER);
    eval 'sub __LITTLE_ENDIAN () { &_LITTLE_ENDIAN;}' unless defined(&__LITTLE_ENDIAN);
    eval 'sub __PDP_ENDIAN () { &_PDP_ENDIAN;}' unless defined(&__PDP_ENDIAN);
    eval 'sub __FLOAT_WORD_ORDER () { &_BYTE_ORDER;}' unless defined(&__FLOAT_WORD_ORDER);
}
1;

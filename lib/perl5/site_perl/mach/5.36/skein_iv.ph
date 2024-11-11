require '_h2ph_pre.ph';

no warnings qw(redefine misc);

unless(defined(&_SKEIN_IV_H_)) {
    eval 'sub _SKEIN_IV_H_ () {1;}' unless defined(&_SKEIN_IV_H_);
    require 'skein.ph';
    eval 'sub MK_64 () { &SKEIN_MK_64;}' unless defined(&MK_64);
}
1;

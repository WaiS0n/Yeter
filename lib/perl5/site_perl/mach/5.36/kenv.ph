require '_h2ph_pre.ph';

no warnings qw(redefine misc);

unless(defined(&_KENV_H_)) {
    eval 'sub _KENV_H_ () {1;}' unless defined(&_KENV_H_);
    require 'sys/cdefs.ph';
    require 'sys/kenv.ph';
}
1;

require '_h2ph_pre.ph';

no warnings qw(redefine misc);

unless(defined(&_EXECINFO_H_)) {
    eval 'sub _EXECINFO_H_ () {1;}' unless defined(&_EXECINFO_H_);
    require 'stddef.ph';
}
1;

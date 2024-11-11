require '_h2ph_pre.ph';

no warnings qw(redefine misc);

unless(defined(&_SYS__UMTX_H_)) {
    eval 'sub _SYS__UMTX_H_ () {1;}' unless defined(&_SYS__UMTX_H_);
    require 'sys/_types.ph';
    require 'sys/_timespec.ph';
    unless(defined(&__LP64__)) {
    }
}
1;

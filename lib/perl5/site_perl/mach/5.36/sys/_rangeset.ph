require '_h2ph_pre.ph';

no warnings qw(redefine misc);

unless(defined(&_SYS__RANGESET_H)) {
    eval 'sub _SYS__RANGESET_H () {1;}' unless defined(&_SYS__RANGESET_H);
    require 'sys/_pctrie.ph';
}
1;

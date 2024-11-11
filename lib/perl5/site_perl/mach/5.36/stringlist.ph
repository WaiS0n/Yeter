require '_h2ph_pre.ph';

no warnings qw(redefine misc);

unless(defined(&_STRINGLIST_H)) {
    eval 'sub _STRINGLIST_H () {1;}' unless defined(&_STRINGLIST_H);
    require 'sys/cdefs.ph';
    require 'sys/types.ph';
}
1;

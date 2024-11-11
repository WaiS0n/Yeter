require '_h2ph_pre.ph';

no warnings qw(redefine misc);

unless(defined(&_ZDB_H)) {
    eval 'sub _ZDB_H () {1;}' unless defined(&_ZDB_H);
}
1;

require '_h2ph_pre.ph';

no warnings qw(redefine misc);

unless(defined(&_UGIDFW_H)) {
    eval 'sub _UGIDFW_H () {1;}' unless defined(&_UGIDFW_H);
}
1;

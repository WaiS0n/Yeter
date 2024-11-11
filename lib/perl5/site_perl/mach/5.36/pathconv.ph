require '_h2ph_pre.ph';

no warnings qw(redefine misc);

unless(defined(&_PATHCONV_H)) {
    eval 'sub _PATHCONV_H () {1;}' unless defined(&_PATHCONV_H);
}
1;

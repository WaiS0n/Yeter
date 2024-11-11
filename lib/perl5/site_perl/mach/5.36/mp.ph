require '_h2ph_pre.ph';

no warnings qw(redefine misc);

unless(defined(&_MP_H_)) {
    eval 'sub _MP_H_ () {1;}' unless defined(&_MP_H_);
    unless(defined(&HEADER_BN_H_)) {
	require 'openssl/bn.ph';
    }
}
1;

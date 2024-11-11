require '_h2ph_pre.ph';

no warnings qw(redefine misc);

unless(defined(&_EFIVAR_DP_H_)) {
    eval 'sub _EFIVAR_DP_H_ () {1;}' unless defined(&_EFIVAR_DP_H_);
}
1;

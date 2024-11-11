require '_h2ph_pre.ph';

no warnings qw(redefine misc);

unless(defined(&_AR_H_)) {
    eval 'sub _AR_H_ () {1;}' unless defined(&_AR_H_);
    require 'sys/cdefs.ph';
    eval 'sub OARMAG1 () {0177555;}' unless defined(&OARMAG1);
    eval 'sub OARMAG2 () {0177545;}' unless defined(&OARMAG2);
    eval 'sub ARMAG () {"!<arch>\\n";}' unless defined(&ARMAG);
    eval 'sub SARMAG () {8;}' unless defined(&SARMAG);
    eval 'sub AR_EFMT1 () {"#1/";}' unless defined(&AR_EFMT1);
    eval 'sub ARFMAG () {"`\\n";}' unless defined(&ARFMAG);
}
1;

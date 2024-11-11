require '_h2ph_pre.ph';

no warnings qw(redefine misc);

unless(defined(&_RANLIB_H_)) {
    eval 'sub _RANLIB_H_ () {1;}' unless defined(&_RANLIB_H_);
    eval 'sub RANLIBMAG () {"__.SYMDEF";}' unless defined(&RANLIBMAG);
    eval 'sub RANLIBSKEW () {3;}' unless defined(&RANLIBSKEW);
}
1;

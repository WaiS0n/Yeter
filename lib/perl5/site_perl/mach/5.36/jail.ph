require '_h2ph_pre.ph';

no warnings qw(redefine misc);

unless(defined(&_JAIL_H)) {
    eval 'sub _JAIL_H () {1;}' unless defined(&_JAIL_H);
    eval 'sub JP_RAWVALUE () {0x1;}' unless defined(&JP_RAWVALUE);
    eval 'sub JP_BOOL () {0x2;}' unless defined(&JP_BOOL);
    eval 'sub JP_NOBOOL () {0x4;}' unless defined(&JP_NOBOOL);
    eval 'sub JP_JAILSYS () {0x8;}' unless defined(&JP_JAILSYS);
    eval 'sub JAIL_ERRMSGLEN () {1024;}' unless defined(&JAIL_ERRMSGLEN);
}
1;

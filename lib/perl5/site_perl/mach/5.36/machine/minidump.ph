require '_h2ph_pre.ph';

no warnings qw(redefine misc);

unless(defined(&_MACHINE_MINIDUMP_H_)) {
    eval 'sub _MACHINE_MINIDUMP_H_ () {1;}' unless defined(&_MACHINE_MINIDUMP_H_);
    eval 'sub MINIDUMP_MAGIC () {"minidump FreeBSD/amd64";}' unless defined(&MINIDUMP_MAGIC);
    eval 'sub MINIDUMP_VERSION () {3;}' unless defined(&MINIDUMP_VERSION);
}
1;

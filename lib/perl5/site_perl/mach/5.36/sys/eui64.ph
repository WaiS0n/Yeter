require '_h2ph_pre.ph';

no warnings qw(redefine misc);

unless(defined(&_SYS_EUI64_H)) {
    eval 'sub _SYS_EUI64_H () {1;}' unless defined(&_SYS_EUI64_H);
    eval 'sub EUI64_SIZ () {24;}' unless defined(&EUI64_SIZ);
    eval 'sub EUI64_LEN () {8;}' unless defined(&EUI64_LEN);
    unless(defined(&_KERNEL)) {
    }
}
1;

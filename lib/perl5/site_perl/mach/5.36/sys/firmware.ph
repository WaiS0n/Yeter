require '_h2ph_pre.ph';

no warnings qw(redefine misc);

unless(defined(&_SYS_FIRMWARE_H_)) {
    eval 'sub _SYS_FIRMWARE_H_ () {1;}' unless defined(&_SYS_FIRMWARE_H_);
    eval 'sub FIRMWARE_GET_NOWARN () {0x1;}' unless defined(&FIRMWARE_GET_NOWARN);
    eval 'sub FIRMWARE_UNLOAD () {0x1;}' unless defined(&FIRMWARE_UNLOAD);
}
1;

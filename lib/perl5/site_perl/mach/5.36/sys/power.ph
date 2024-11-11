require '_h2ph_pre.ph';

no warnings qw(redefine misc);

unless(defined(&_SYS_POWER_H_)) {
    eval 'sub _SYS_POWER_H_ () {1;}' unless defined(&_SYS_POWER_H_);
    require 'sys/_eventhandler.ph';
    eval 'sub POWER_PM_TYPE_ACPI () {0x1;}' unless defined(&POWER_PM_TYPE_ACPI);
    eval 'sub POWER_PM_TYPE_NONE () {0xff;}' unless defined(&POWER_PM_TYPE_NONE);
    eval 'sub POWER_CMD_SUSPEND () {0x;}' unless defined(&POWER_CMD_SUSPEND);
    eval 'sub POWER_SLEEP_STATE_STANDBY () {0x;}' unless defined(&POWER_SLEEP_STATE_STANDBY);
    eval 'sub POWER_SLEEP_STATE_SUSPEND () {0x1;}' unless defined(&POWER_SLEEP_STATE_SUSPEND);
    eval 'sub POWER_SLEEP_STATE_HIBERNATE () {0x2;}' unless defined(&POWER_SLEEP_STATE_HIBERNATE);
    eval 'sub POWER_PROFILE_PERFORMANCE () {0;}' unless defined(&POWER_PROFILE_PERFORMANCE);
    eval 'sub POWER_PROFILE_ECONOMY () {1;}' unless defined(&POWER_PROFILE_ECONOMY);
}
1;

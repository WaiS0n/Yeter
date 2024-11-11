require '_h2ph_pre.ph';

no warnings qw(redefine misc);

unless(defined(&_SYS_JOYSTICK_H_)) {
    eval 'sub _SYS_JOYSTICK_H_ () {1;}' unless defined(&_SYS_JOYSTICK_H_);
    require 'sys/ioccom.ph';
    eval 'sub JOY_SETTIMEOUT () { &_IOW(ord(\'J\'), 1, \'int\');}' unless defined(&JOY_SETTIMEOUT);
    eval 'sub JOY_GETTIMEOUT () { &_IOR(ord(\'J\'), 2, \'int\');}' unless defined(&JOY_GETTIMEOUT);
    eval 'sub JOY_SET_X_OFFSET () { &_IOW(ord(\'J\'), 3, \'int\');}' unless defined(&JOY_SET_X_OFFSET);
    eval 'sub JOY_SET_Y_OFFSET () { &_IOW(ord(\'J\'), 4, \'int\');}' unless defined(&JOY_SET_Y_OFFSET);
    eval 'sub JOY_GET_X_OFFSET () { &_IOR(ord(\'J\'), 5, \'int\');}' unless defined(&JOY_GET_X_OFFSET);
    eval 'sub JOY_GET_Y_OFFSET () { &_IOR(ord(\'J\'), 6, \'int\');}' unless defined(&JOY_GET_Y_OFFSET);
}
1;

require '_h2ph_pre.ph';

no warnings qw(redefine misc);

unless(defined(&__BACKLIGHT_H__)) {
    eval 'sub __BACKLIGHT_H__ () {1;}' unless defined(&__BACKLIGHT_H__);
    require 'sys/types.ph';
    eval 'sub BACKLIGHTMAXLEVELS () {100;}' unless defined(&BACKLIGHTMAXLEVELS);
    eval("sub BACKLIGHT_TYPE_PANEL () { 0; }") unless defined(&BACKLIGHT_TYPE_PANEL);
    eval("sub BACKLIGHT_TYPE_KEYBOARD () { 1; }") unless defined(&BACKLIGHT_TYPE_KEYBOARD);
    eval 'sub BACKLIGHTMAXNAMELENGTH () {64;}' unless defined(&BACKLIGHTMAXNAMELENGTH);
    eval 'sub BACKLIGHTGETSTATUS () { &_IOWR(ord(\'G\'), 0, \'struct backlight_props\');}' unless defined(&BACKLIGHTGETSTATUS);
    eval 'sub BACKLIGHTUPDATESTATUS () { &_IOWR(ord(\'G\'), 1, \'struct backlight_props\');}' unless defined(&BACKLIGHTUPDATESTATUS);
    eval 'sub BACKLIGHTGETINFO () { &_IOWR(ord(\'G\'), 2, \'struct backlight_info\');}' unless defined(&BACKLIGHTGETINFO);
}
1;

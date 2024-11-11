require '_h2ph_pre.ph';

no warnings qw(redefine misc);

unless(defined(&_SYS_FONT_H_)) {
    eval 'sub _SYS_FONT_H_ () {1;}' unless defined(&_SYS_FONT_H_);
    require 'sys/queue.ph';
    eval("sub VFNT_MAP_NORMAL () { 0; }") unless defined(&VFNT_MAP_NORMAL);
    eval("sub VFNT_MAP_NORMAL_RIGHT () { 1; }") unless defined(&VFNT_MAP_NORMAL_RIGHT);
    eval("sub VFNT_MAP_BOLD () { 2; }") unless defined(&VFNT_MAP_BOLD);
    eval("sub VFNT_MAP_BOLD_RIGHT () { 3; }") unless defined(&VFNT_MAP_BOLD_RIGHT);
    eval("sub VFNT_MAPS () { 4; }") unless defined(&VFNT_MAPS);
    eval("sub FONT_AUTO () { 0; }") unless defined(&FONT_AUTO);
    eval("sub FONT_MANUAL () { 1; }") unless defined(&FONT_MANUAL);
    eval("sub FONT_BUILTIN () { 2; }") unless defined(&FONT_BUILTIN);
    eval("sub FONT_RELOAD () { 3; }") unless defined(&FONT_RELOAD);
    eval 'sub FONT_HEADER_MAGIC () {"VFNT0002";}' unless defined(&FONT_HEADER_MAGIC);
}
1;

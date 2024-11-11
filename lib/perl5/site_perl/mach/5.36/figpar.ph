require '_h2ph_pre.ph';

no warnings qw(redefine misc);

unless(defined(&_FIGPAR_H_)) {
    eval 'sub _FIGPAR_H_ () {1;}' unless defined(&_FIGPAR_H_);
    require 'sys/types.ph';
    eval("sub FIGPAR_TYPE_NONE () { 0x0000; }") unless defined(&FIGPAR_TYPE_NONE);
    eval("sub FIGPAR_TYPE_BOOL () { 0x0001; }") unless defined(&FIGPAR_TYPE_BOOL);
    eval("sub FIGPAR_TYPE_INT () { 0x0002; }") unless defined(&FIGPAR_TYPE_INT);
    eval("sub FIGPAR_TYPE_UINT () { 0x0004; }") unless defined(&FIGPAR_TYPE_UINT);
    eval("sub FIGPAR_TYPE_STR () { 0x0008; }") unless defined(&FIGPAR_TYPE_STR);
    eval("sub FIGPAR_TYPE_STRARRAY () { 0x0010; }") unless defined(&FIGPAR_TYPE_STRARRAY);
    eval("sub FIGPAR_TYPE_DATA1 () { 0x0020; }") unless defined(&FIGPAR_TYPE_DATA1);
    eval("sub FIGPAR_TYPE_DATA2 () { 0x0040; }") unless defined(&FIGPAR_TYPE_DATA2);
    eval("sub FIGPAR_TYPE_DATA3 () { 0x0080; }") unless defined(&FIGPAR_TYPE_DATA3);
    eval("sub FIGPAR_TYPE_RESERVED1 () { 0x0100; }") unless defined(&FIGPAR_TYPE_RESERVED1);
    eval("sub FIGPAR_TYPE_RESERVED2 () { 0x0200; }") unless defined(&FIGPAR_TYPE_RESERVED2);
    eval("sub FIGPAR_TYPE_RESERVED3 () { 0x0400; }") unless defined(&FIGPAR_TYPE_RESERVED3);
    eval 'sub FIGPAR_BREAK_ON_EQUALS () {0x1;}' unless defined(&FIGPAR_BREAK_ON_EQUALS);
    eval 'sub FIGPAR_BREAK_ON_SEMICOLON () {0x2;}' unless defined(&FIGPAR_BREAK_ON_SEMICOLON);
    eval 'sub FIGPAR_CASE_SENSITIVE () {0x4;}' unless defined(&FIGPAR_CASE_SENSITIVE);
    eval 'sub FIGPAR_REQUIRE_EQUALS () {0x8;}' unless defined(&FIGPAR_REQUIRE_EQUALS);
    eval 'sub FIGPAR_STRICT_EQUALS () {0x10;}' unless defined(&FIGPAR_STRICT_EQUALS);
}
1;

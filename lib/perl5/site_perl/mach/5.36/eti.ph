require '_h2ph_pre.ph';

no warnings qw(redefine misc);

unless(defined(&NCURSES_ETI_H_incl)) {
    eval 'sub NCURSES_ETI_H_incl () {1;}' unless defined(&NCURSES_ETI_H_incl);
    eval 'sub E_OK () {(0);}' unless defined(&E_OK);
    eval 'sub E_SYSTEM_ERROR () {(-1);}' unless defined(&E_SYSTEM_ERROR);
    eval 'sub E_BAD_ARGUMENT () {(-2);}' unless defined(&E_BAD_ARGUMENT);
    eval 'sub E_POSTED () {(-3);}' unless defined(&E_POSTED);
    eval 'sub E_CONNECTED () {(-4);}' unless defined(&E_CONNECTED);
    eval 'sub E_BAD_STATE () {(-5);}' unless defined(&E_BAD_STATE);
    eval 'sub E_NO_ROOM () {(-6);}' unless defined(&E_NO_ROOM);
    eval 'sub E_NOT_POSTED () {(-7);}' unless defined(&E_NOT_POSTED);
    eval 'sub E_UNKNOWN_COMMAND () {(-8);}' unless defined(&E_UNKNOWN_COMMAND);
    eval 'sub E_NO_MATCH () {(-9);}' unless defined(&E_NO_MATCH);
    eval 'sub E_NOT_SELECTABLE () {(-10);}' unless defined(&E_NOT_SELECTABLE);
    eval 'sub E_NOT_CONNECTED () {(-11);}' unless defined(&E_NOT_CONNECTED);
    eval 'sub E_REQUEST_DENIED () {(-12);}' unless defined(&E_REQUEST_DENIED);
    eval 'sub E_INVALID_FIELD () {(-13);}' unless defined(&E_INVALID_FIELD);
    eval 'sub E_CURRENT () {(-14);}' unless defined(&E_CURRENT);
}
1;

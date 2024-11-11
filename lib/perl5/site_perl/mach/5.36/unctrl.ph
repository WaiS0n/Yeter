require '_h2ph_pre.ph';

no warnings qw(redefine misc);

unless(defined(&NCURSES_UNCTRL_H_incl)) {
    eval 'sub NCURSES_UNCTRL_H_incl () {1;}' unless defined(&NCURSES_UNCTRL_H_incl);
    undef(&NCURSES_VERSION) if defined(&NCURSES_VERSION);
    eval 'sub NCURSES_VERSION () {"6.2";}' unless defined(&NCURSES_VERSION);
    if(defined(&__cplusplus)) {
    }
    require 'curses.ph';
    undef(&unctrl) if defined(&unctrl);
    if(1) {
    }
    if(defined(&__cplusplus)) {
    }
}
1;

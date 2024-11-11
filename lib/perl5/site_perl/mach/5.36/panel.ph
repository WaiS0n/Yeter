require '_h2ph_pre.ph';

no warnings qw(redefine misc);

unless(defined(&NCURSES_PANEL_H_incl)) {
    eval 'sub NCURSES_PANEL_H_incl () {1;}' unless defined(&NCURSES_PANEL_H_incl);
    require 'curses.ph';
    if(!(defined(&NCURSES_OPAQUE_PANEL) ? &NCURSES_OPAQUE_PANEL : undef)) {
    }
    if(defined(&__cplusplus)) {
    }
    if(defined(&BUILDING_PANEL)) {
	eval 'sub PANEL_IMPEXP () { &NCURSES_EXPORT_GENERAL_EXPORT;}' unless defined(&PANEL_IMPEXP);
    } else {
	eval 'sub PANEL_IMPEXP () { &NCURSES_EXPORT_GENERAL_IMPORT;}' unless defined(&PANEL_IMPEXP);
    }
    eval 'sub PANEL_WRAPPED_VAR {
        my($type,$name) = @_;
	    eval q( &extern  &PANEL_IMPEXP $type  &NCURSES_PUBLIC_VAR($name)( &void));
    }' unless defined(&PANEL_WRAPPED_VAR);
    eval 'sub PANEL_EXPORT {
        my($type) = @_;
	    eval q( &PANEL_IMPEXP $type  &NCURSES_API);
    }' unless defined(&PANEL_EXPORT);
    eval 'sub PANEL_EXPORT_VAR {
        my($type) = @_;
	    eval q( &PANEL_IMPEXP $type);
    }' unless defined(&PANEL_EXPORT_VAR);
    if((defined(&NCURSES_SP_FUNCS) ? &NCURSES_SP_FUNCS : undef)) {
    }
    if(defined(&__cplusplus)) {
    }
}
1;

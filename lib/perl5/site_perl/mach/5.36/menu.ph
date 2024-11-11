require '_h2ph_pre.ph';

no warnings qw(redefine misc);

unless(defined(&ETI_MENU)) {
    eval 'sub ETI_MENU () {1;}' unless defined(&ETI_MENU);
    if(defined(&AMIGA)) {
	eval 'sub TEXT () { &TEXT_ncurses;}' unless defined(&TEXT);
    }
    require 'curses.ph';
    require 'eti.ph';
    if(defined(&__cplusplus)) {
    }
    if(defined(&BUILDING_MENU)) {
	eval 'sub MENU_IMPEXP () { &NCURSES_EXPORT_GENERAL_EXPORT;}' unless defined(&MENU_IMPEXP);
    } else {
	eval 'sub MENU_IMPEXP () { &NCURSES_EXPORT_GENERAL_IMPORT;}' unless defined(&MENU_IMPEXP);
    }
    eval 'sub MENU_WRAPPED_VAR {
        my($type,$name) = @_;
	    eval q( &extern  &MENU_IMPEXP $type  &NCURSES_PUBLIC_VAR($name)( &void));
    }' unless defined(&MENU_WRAPPED_VAR);
    eval 'sub MENU_EXPORT {
        my($type) = @_;
	    eval q( &MENU_IMPEXP $type  &NCURSES_API);
    }' unless defined(&MENU_EXPORT);
    eval 'sub MENU_EXPORT_VAR {
        my($type) = @_;
	    eval q( &MENU_IMPEXP $type);
    }' unless defined(&MENU_EXPORT_VAR);
    eval 'sub O_ONEVALUE () {(0x1);}' unless defined(&O_ONEVALUE);
    eval 'sub O_SHOWDESC () {(0x2);}' unless defined(&O_SHOWDESC);
    eval 'sub O_ROWMAJOR () {(0x4);}' unless defined(&O_ROWMAJOR);
    eval 'sub O_IGNORECASE () {(0x8);}' unless defined(&O_IGNORECASE);
    eval 'sub O_SHOWMATCH () {(0x10);}' unless defined(&O_SHOWMATCH);
    eval 'sub O_NONCYCLIC () {(0x20);}' unless defined(&O_NONCYCLIC);
    eval 'sub O_MOUSE_MENU () {(0x40);}' unless defined(&O_MOUSE_MENU);
    eval 'sub O_SELECTABLE () {(0x1);}' unless defined(&O_SELECTABLE);
    if(!(defined(&NCURSES_OPAQUE_MENU) ? &NCURSES_OPAQUE_MENU : undef)) {
    }
    if(!(defined(&NCURSES_OPAQUE_MENU) ? &NCURSES_OPAQUE_MENU : undef)) {
    }
    if(1) {
    }
    eval 'sub REQ_LEFT_ITEM () {( &KEY_MAX + 1);}' unless defined(&REQ_LEFT_ITEM);
    eval 'sub REQ_RIGHT_ITEM () {( &KEY_MAX + 2);}' unless defined(&REQ_RIGHT_ITEM);
    eval 'sub REQ_UP_ITEM () {( &KEY_MAX + 3);}' unless defined(&REQ_UP_ITEM);
    eval 'sub REQ_DOWN_ITEM () {( &KEY_MAX + 4);}' unless defined(&REQ_DOWN_ITEM);
    eval 'sub REQ_SCR_ULINE () {( &KEY_MAX + 5);}' unless defined(&REQ_SCR_ULINE);
    eval 'sub REQ_SCR_DLINE () {( &KEY_MAX + 6);}' unless defined(&REQ_SCR_DLINE);
    eval 'sub REQ_SCR_DPAGE () {( &KEY_MAX + 7);}' unless defined(&REQ_SCR_DPAGE);
    eval 'sub REQ_SCR_UPAGE () {( &KEY_MAX + 8);}' unless defined(&REQ_SCR_UPAGE);
    eval 'sub REQ_FIRST_ITEM () {( &KEY_MAX + 9);}' unless defined(&REQ_FIRST_ITEM);
    eval 'sub REQ_LAST_ITEM () {( &KEY_MAX + 10);}' unless defined(&REQ_LAST_ITEM);
    eval 'sub REQ_NEXT_ITEM () {( &KEY_MAX + 11);}' unless defined(&REQ_NEXT_ITEM);
    eval 'sub REQ_PREV_ITEM () {( &KEY_MAX + 12);}' unless defined(&REQ_PREV_ITEM);
    eval 'sub REQ_TOGGLE_ITEM () {( &KEY_MAX + 13);}' unless defined(&REQ_TOGGLE_ITEM);
    eval 'sub REQ_CLEAR_PATTERN () {( &KEY_MAX + 14);}' unless defined(&REQ_CLEAR_PATTERN);
    eval 'sub REQ_BACK_PATTERN () {( &KEY_MAX + 15);}' unless defined(&REQ_BACK_PATTERN);
    eval 'sub REQ_NEXT_MATCH () {( &KEY_MAX + 16);}' unless defined(&REQ_NEXT_MATCH);
    eval 'sub REQ_PREV_MATCH () {( &KEY_MAX + 17);}' unless defined(&REQ_PREV_MATCH);
    eval 'sub MIN_MENU_COMMAND () {( &KEY_MAX + 1);}' unless defined(&MIN_MENU_COMMAND);
    eval 'sub MAX_MENU_COMMAND () {( &KEY_MAX + 17);}' unless defined(&MAX_MENU_COMMAND);
    if(defined(&MAX_COMMAND)) {
	if(((defined(&MAX_MENU_COMMAND) ? &MAX_MENU_COMMAND : undef) > (defined(&MAX_COMMAND) ? &MAX_COMMAND : undef))) {
	    die("Something\ is\ wrong\ \-\-\ MAX_MENU_COMMAND\ is\ greater\ than\ MAX_COMMAND");
	}
 elsif(((defined(&MAX_COMMAND) ? &MAX_COMMAND : undef) != ((defined(&KEY_MAX) ? &KEY_MAX : undef) + 128))) {
	    die("Something\ is\ wrong\ \-\-\ MAX_COMMAND\ is\ already\ inconsistently\ defined\.");
	}
    } else {
	eval 'sub MAX_COMMAND () {( &KEY_MAX + 128);}' unless defined(&MAX_COMMAND);
    }
    if((defined(&NCURSES_SP_FUNCS) ? &NCURSES_SP_FUNCS : undef)) {
    }
    if(defined(&__cplusplus)) {
    }
}
1;

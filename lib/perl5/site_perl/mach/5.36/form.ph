require '_h2ph_pre.ph';

no warnings qw(redefine misc);

unless(defined(&FORM_H)) {
    eval 'sub FORM_H () {1;}' unless defined(&FORM_H);
    require 'curses.ph';
    require 'eti.ph';
    if(defined(&__cplusplus)) {
    }
    if(defined(&BUILDING_FORM)) {
	eval 'sub FORM_IMPEXP () { &NCURSES_EXPORT_GENERAL_EXPORT;}' unless defined(&FORM_IMPEXP);
    } else {
	eval 'sub FORM_IMPEXP () { &NCURSES_EXPORT_GENERAL_IMPORT;}' unless defined(&FORM_IMPEXP);
    }
    eval 'sub FORM_WRAPPED_VAR {
        my($type,$name) = @_;
	    eval q( &extern  &FORM_IMPEXP $type  &NCURSES_PUBLIC_VAR($name)( &void));
    }' unless defined(&FORM_WRAPPED_VAR);
    eval 'sub FORM_EXPORT {
        my($type) = @_;
	    eval q( &FORM_IMPEXP $type  &NCURSES_API);
    }' unless defined(&FORM_EXPORT);
    eval 'sub FORM_EXPORT_VAR {
        my($type) = @_;
	    eval q( &FORM_IMPEXP $type);
    }' unless defined(&FORM_EXPORT_VAR);
    unless(defined(&FORM_PRIV_H)) {
    }
    unless(defined(&NCURSES_FIELD_INTERNALS)) {
	eval 'sub NCURSES_FIELD_INTERNALS () {1;}' unless defined(&NCURSES_FIELD_INTERNALS);
    }
    if(!(defined(&NCURSES_OPAQUE_FORM) ? &NCURSES_OPAQUE_FORM : undef)) {
    }
    if(1) {
    }
    if(1) {
    }
    if(!(defined(&NCURSES_OPAQUE_FORM) ? &NCURSES_OPAQUE_FORM : undef)) {
	if((defined(&NCURSES_INTEROP_FUNCS) ? &NCURSES_INTEROP_FUNCS : undef)) {
	} else {
	}
    }
    eval 'sub NO_JUSTIFICATION () {(0);}' unless defined(&NO_JUSTIFICATION);
    eval 'sub JUSTIFY_LEFT () {(1);}' unless defined(&JUSTIFY_LEFT);
    eval 'sub JUSTIFY_CENTER () {(2);}' unless defined(&JUSTIFY_CENTER);
    eval 'sub JUSTIFY_RIGHT () {(3);}' unless defined(&JUSTIFY_RIGHT);
    eval 'sub O_VISIBLE () {(0x1);}' unless defined(&O_VISIBLE);
    eval 'sub O_ACTIVE () {(0x2);}' unless defined(&O_ACTIVE);
    eval 'sub O_PUBLIC () {(0x4);}' unless defined(&O_PUBLIC);
    eval 'sub O_EDIT () {(0x8);}' unless defined(&O_EDIT);
    eval 'sub O_WRAP () {(0x10);}' unless defined(&O_WRAP);
    eval 'sub O_BLANK () {(0x20);}' unless defined(&O_BLANK);
    eval 'sub O_AUTOSKIP () {(0x40);}' unless defined(&O_AUTOSKIP);
    eval 'sub O_NULLOK () {(0x80);}' unless defined(&O_NULLOK);
    eval 'sub O_PASSOK () {(0x100);}' unless defined(&O_PASSOK);
    eval 'sub O_STATIC () {(0x200);}' unless defined(&O_STATIC);
    eval 'sub O_DYNAMIC_JUSTIFY () {(0x400);}' unless defined(&O_DYNAMIC_JUSTIFY);
    eval 'sub O_NO_LEFT_STRIP () {(0x800);}' unless defined(&O_NO_LEFT_STRIP);
    eval 'sub O_EDGE_INSERT_STAY () {(0x1000);}' unless defined(&O_EDGE_INSERT_STAY);
    eval 'sub O_INPUT_LIMIT () {(0x2000);}' unless defined(&O_INPUT_LIMIT);
    eval 'sub O_NL_OVERLOAD () {(0x1);}' unless defined(&O_NL_OVERLOAD);
    eval 'sub O_BS_OVERLOAD () {(0x2);}' unless defined(&O_BS_OVERLOAD);
    eval 'sub REQ_NEXT_PAGE () {( &KEY_MAX + 1);}' unless defined(&REQ_NEXT_PAGE);
    eval 'sub REQ_PREV_PAGE () {( &KEY_MAX + 2);}' unless defined(&REQ_PREV_PAGE);
    eval 'sub REQ_FIRST_PAGE () {( &KEY_MAX + 3);}' unless defined(&REQ_FIRST_PAGE);
    eval 'sub REQ_LAST_PAGE () {( &KEY_MAX + 4);}' unless defined(&REQ_LAST_PAGE);
    eval 'sub REQ_NEXT_FIELD () {( &KEY_MAX + 5);}' unless defined(&REQ_NEXT_FIELD);
    eval 'sub REQ_PREV_FIELD () {( &KEY_MAX + 6);}' unless defined(&REQ_PREV_FIELD);
    eval 'sub REQ_FIRST_FIELD () {( &KEY_MAX + 7);}' unless defined(&REQ_FIRST_FIELD);
    eval 'sub REQ_LAST_FIELD () {( &KEY_MAX + 8);}' unless defined(&REQ_LAST_FIELD);
    eval 'sub REQ_SNEXT_FIELD () {( &KEY_MAX + 9);}' unless defined(&REQ_SNEXT_FIELD);
    eval 'sub REQ_SPREV_FIELD () {( &KEY_MAX + 10);}' unless defined(&REQ_SPREV_FIELD);
    eval 'sub REQ_SFIRST_FIELD () {( &KEY_MAX + 11);}' unless defined(&REQ_SFIRST_FIELD);
    eval 'sub REQ_SLAST_FIELD () {( &KEY_MAX + 12);}' unless defined(&REQ_SLAST_FIELD);
    eval 'sub REQ_LEFT_FIELD () {( &KEY_MAX + 13);}' unless defined(&REQ_LEFT_FIELD);
    eval 'sub REQ_RIGHT_FIELD () {( &KEY_MAX + 14);}' unless defined(&REQ_RIGHT_FIELD);
    eval 'sub REQ_UP_FIELD () {( &KEY_MAX + 15);}' unless defined(&REQ_UP_FIELD);
    eval 'sub REQ_DOWN_FIELD () {( &KEY_MAX + 16);}' unless defined(&REQ_DOWN_FIELD);
    eval 'sub REQ_NEXT_CHAR () {( &KEY_MAX + 17);}' unless defined(&REQ_NEXT_CHAR);
    eval 'sub REQ_PREV_CHAR () {( &KEY_MAX + 18);}' unless defined(&REQ_PREV_CHAR);
    eval 'sub REQ_NEXT_LINE () {( &KEY_MAX + 19);}' unless defined(&REQ_NEXT_LINE);
    eval 'sub REQ_PREV_LINE () {( &KEY_MAX + 20);}' unless defined(&REQ_PREV_LINE);
    eval 'sub REQ_NEXT_WORD () {( &KEY_MAX + 21);}' unless defined(&REQ_NEXT_WORD);
    eval 'sub REQ_PREV_WORD () {( &KEY_MAX + 22);}' unless defined(&REQ_PREV_WORD);
    eval 'sub REQ_BEG_FIELD () {( &KEY_MAX + 23);}' unless defined(&REQ_BEG_FIELD);
    eval 'sub REQ_END_FIELD () {( &KEY_MAX + 24);}' unless defined(&REQ_END_FIELD);
    eval 'sub REQ_BEG_LINE () {( &KEY_MAX + 25);}' unless defined(&REQ_BEG_LINE);
    eval 'sub REQ_END_LINE () {( &KEY_MAX + 26);}' unless defined(&REQ_END_LINE);
    eval 'sub REQ_LEFT_CHAR () {( &KEY_MAX + 27);}' unless defined(&REQ_LEFT_CHAR);
    eval 'sub REQ_RIGHT_CHAR () {( &KEY_MAX + 28);}' unless defined(&REQ_RIGHT_CHAR);
    eval 'sub REQ_UP_CHAR () {( &KEY_MAX + 29);}' unless defined(&REQ_UP_CHAR);
    eval 'sub REQ_DOWN_CHAR () {( &KEY_MAX + 30);}' unless defined(&REQ_DOWN_CHAR);
    eval 'sub REQ_NEW_LINE () {( &KEY_MAX + 31);}' unless defined(&REQ_NEW_LINE);
    eval 'sub REQ_INS_CHAR () {( &KEY_MAX + 32);}' unless defined(&REQ_INS_CHAR);
    eval 'sub REQ_INS_LINE () {( &KEY_MAX + 33);}' unless defined(&REQ_INS_LINE);
    eval 'sub REQ_DEL_CHAR () {( &KEY_MAX + 34);}' unless defined(&REQ_DEL_CHAR);
    eval 'sub REQ_DEL_PREV () {( &KEY_MAX + 35);}' unless defined(&REQ_DEL_PREV);
    eval 'sub REQ_DEL_LINE () {( &KEY_MAX + 36);}' unless defined(&REQ_DEL_LINE);
    eval 'sub REQ_DEL_WORD () {( &KEY_MAX + 37);}' unless defined(&REQ_DEL_WORD);
    eval 'sub REQ_CLR_EOL () {( &KEY_MAX + 38);}' unless defined(&REQ_CLR_EOL);
    eval 'sub REQ_CLR_EOF () {( &KEY_MAX + 39);}' unless defined(&REQ_CLR_EOF);
    eval 'sub REQ_CLR_FIELD () {( &KEY_MAX + 40);}' unless defined(&REQ_CLR_FIELD);
    eval 'sub REQ_OVL_MODE () {( &KEY_MAX + 41);}' unless defined(&REQ_OVL_MODE);
    eval 'sub REQ_INS_MODE () {( &KEY_MAX + 42);}' unless defined(&REQ_INS_MODE);
    eval 'sub REQ_SCR_FLINE () {( &KEY_MAX + 43);}' unless defined(&REQ_SCR_FLINE);
    eval 'sub REQ_SCR_BLINE () {( &KEY_MAX + 44);}' unless defined(&REQ_SCR_BLINE);
    eval 'sub REQ_SCR_FPAGE () {( &KEY_MAX + 45);}' unless defined(&REQ_SCR_FPAGE);
    eval 'sub REQ_SCR_BPAGE () {( &KEY_MAX + 46);}' unless defined(&REQ_SCR_BPAGE);
    eval 'sub REQ_SCR_FHPAGE () {( &KEY_MAX + 47);}' unless defined(&REQ_SCR_FHPAGE);
    eval 'sub REQ_SCR_BHPAGE () {( &KEY_MAX + 48);}' unless defined(&REQ_SCR_BHPAGE);
    eval 'sub REQ_SCR_FCHAR () {( &KEY_MAX + 49);}' unless defined(&REQ_SCR_FCHAR);
    eval 'sub REQ_SCR_BCHAR () {( &KEY_MAX + 50);}' unless defined(&REQ_SCR_BCHAR);
    eval 'sub REQ_SCR_HFLINE () {( &KEY_MAX + 51);}' unless defined(&REQ_SCR_HFLINE);
    eval 'sub REQ_SCR_HBLINE () {( &KEY_MAX + 52);}' unless defined(&REQ_SCR_HBLINE);
    eval 'sub REQ_SCR_HFHALF () {( &KEY_MAX + 53);}' unless defined(&REQ_SCR_HFHALF);
    eval 'sub REQ_SCR_HBHALF () {( &KEY_MAX + 54);}' unless defined(&REQ_SCR_HBHALF);
    eval 'sub REQ_VALIDATION () {( &KEY_MAX + 55);}' unless defined(&REQ_VALIDATION);
    eval 'sub REQ_NEXT_CHOICE () {( &KEY_MAX + 56);}' unless defined(&REQ_NEXT_CHOICE);
    eval 'sub REQ_PREV_CHOICE () {( &KEY_MAX + 57);}' unless defined(&REQ_PREV_CHOICE);
    eval 'sub MIN_FORM_COMMAND () {( &KEY_MAX + 1);}' unless defined(&MIN_FORM_COMMAND);
    eval 'sub MAX_FORM_COMMAND () {( &KEY_MAX + 57);}' unless defined(&MAX_FORM_COMMAND);
    if(defined(&MAX_COMMAND)) {
	if(((defined(&MAX_FORM_COMMAND) ? &MAX_FORM_COMMAND : undef) > (defined(&MAX_COMMAND) ? &MAX_COMMAND : undef))) {
	    die("Something\ is\ wrong\ \-\-\ MAX_FORM_COMMAND\ is\ greater\ than\ MAX_COMMAND");
	}
 elsif(((defined(&MAX_COMMAND) ? &MAX_COMMAND : undef) != ((defined(&KEY_MAX) ? &KEY_MAX : undef) + 128))) {
	    die("Something\ is\ wrong\ \-\-\ MAX_COMMAND\ is\ already\ inconsistently\ defined\.");
	}
    } else {
	eval 'sub MAX_COMMAND () {( &KEY_MAX + 128);}' unless defined(&MAX_COMMAND);
    }
    if((defined(&NCURSES_WIDECHAR) ? &NCURSES_WIDECHAR : undef)) {
    }
    if((defined(&NCURSES_SP_FUNCS) ? &NCURSES_SP_FUNCS : undef)) {
    }
    if(defined(&__cplusplus)) {
    }
}
1;

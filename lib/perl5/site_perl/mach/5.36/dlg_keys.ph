require '_h2ph_pre.ph';

no warnings qw(redefine misc);

unless(defined(&DLG_KEYS_H_included)) {
    eval 'sub DLG_KEYS_H_included () {1;}' unless defined(&DLG_KEYS_H_included);
    require 'dialog.ph';
    if(defined(&USE_WIDE_CURSES)) {
	require 'wctype.ph';
	eval 'sub dlg_toupper {
	    my($ch) = @_;
    	    eval q( &towupper(( &wint_t)$ch));
	}' unless defined(&dlg_toupper);
	eval 'sub dlg_isupper {
	    my($ch) = @_;
    	    eval q( &iswupper(( &wint_t)$ch));
	}' unless defined(&dlg_isupper);
    } else {
	eval 'sub dlg_toupper {
	    my($ch) = @_;
    	    eval q(((($ch) > 0 && ($ch) <= 255) ?  &toupper($ch) : ($ch)));
	}' unless defined(&dlg_toupper);
	eval 'sub dlg_isupper {
	    my($ch) = @_;
    	    eval q(( &isalpha($ch)  &&  &isupper($ch)));
	}' unless defined(&dlg_isupper);
    }
    if(defined(&__cplusplus)) {
    }
    eval 'sub DLG_KEYS_DATA {
        my($dialog, $curses) = @_;
	    eval q({ ($curses) >=  &KEY_MIN, $curses, $dialog });
    }' unless defined(&DLG_KEYS_DATA);
    eval 'sub END_KEYS_BINDING () {{ -1, 0, 0};}' unless defined(&END_KEYS_BINDING);
    eval("sub DLGK_MIN () { KEY_MAX+1; }") unless defined(&DLGK_MIN);
    eval("sub DLGK_OK () { 1; }") unless defined(&DLGK_OK);
    eval("sub DLGK_CANCEL () { 2; }") unless defined(&DLGK_CANCEL);
    eval("sub DLGK_EXTRA () { 3; }") unless defined(&DLGK_EXTRA);
    eval("sub DLGK_HELP () { 4; }") unless defined(&DLGK_HELP);
    eval("sub DLGK_ESC () { 5; }") unless defined(&DLGK_ESC);
    eval("sub DLGK_PAGE_FIRST () { 6; }") unless defined(&DLGK_PAGE_FIRST);
    eval("sub DLGK_PAGE_LAST () { 7; }") unless defined(&DLGK_PAGE_LAST);
    eval("sub DLGK_PAGE_NEXT () { 8; }") unless defined(&DLGK_PAGE_NEXT);
    eval("sub DLGK_PAGE_PREV () { 9; }") unless defined(&DLGK_PAGE_PREV);
    eval("sub DLGK_ITEM_FIRST () { 10; }") unless defined(&DLGK_ITEM_FIRST);
    eval("sub DLGK_ITEM_LAST () { 11; }") unless defined(&DLGK_ITEM_LAST);
    eval("sub DLGK_ITEM_NEXT () { 12; }") unless defined(&DLGK_ITEM_NEXT);
    eval("sub DLGK_ITEM_PREV () { 13; }") unless defined(&DLGK_ITEM_PREV);
    eval("sub DLGK_FIELD_FIRST () { 14; }") unless defined(&DLGK_FIELD_FIRST);
    eval("sub DLGK_FIELD_LAST () { 15; }") unless defined(&DLGK_FIELD_LAST);
    eval("sub DLGK_FIELD_NEXT () { 16; }") unless defined(&DLGK_FIELD_NEXT);
    eval("sub DLGK_FIELD_PREV () { 17; }") unless defined(&DLGK_FIELD_PREV);
    eval("sub DLGK_FORM_FIRST () { 18; }") unless defined(&DLGK_FORM_FIRST);
    eval("sub DLGK_FORM_LAST () { 19; }") unless defined(&DLGK_FORM_LAST);
    eval("sub DLGK_FORM_NEXT () { 20; }") unless defined(&DLGK_FORM_NEXT);
    eval("sub DLGK_FORM_PREV () { 21; }") unless defined(&DLGK_FORM_PREV);
    eval("sub DLGK_GRID_UP () { 22; }") unless defined(&DLGK_GRID_UP);
    eval("sub DLGK_GRID_DOWN () { 23; }") unless defined(&DLGK_GRID_DOWN);
    eval("sub DLGK_GRID_LEFT () { 24; }") unless defined(&DLGK_GRID_LEFT);
    eval("sub DLGK_GRID_RIGHT () { 25; }") unless defined(&DLGK_GRID_RIGHT);
    eval("sub DLGK_DELETE_LEFT () { 26; }") unless defined(&DLGK_DELETE_LEFT);
    eval("sub DLGK_DELETE_RIGHT () { 27; }") unless defined(&DLGK_DELETE_RIGHT);
    eval("sub DLGK_DELETE_ALL () { 28; }") unless defined(&DLGK_DELETE_ALL);
    eval("sub DLGK_ENTER () { 29; }") unless defined(&DLGK_ENTER);
    eval("sub DLGK_BEGIN () { 30; }") unless defined(&DLGK_BEGIN);
    eval("sub DLGK_FINAL () { 31; }") unless defined(&DLGK_FINAL);
    eval("sub DLGK_SELECT () { 32; }") unless defined(&DLGK_SELECT);
    eval("sub DLGK_HELPFILE () { 33; }") unless defined(&DLGK_HELPFILE);
    eval("sub DLGK_TRACE () { 34; }") unless defined(&DLGK_TRACE);
    eval("sub DLGK_TOGGLE () { 35; }") unless defined(&DLGK_TOGGLE);
    eval("sub DLGK_LEAVE () { 36; }") unless defined(&DLGK_LEAVE);
    eval 'sub is_DLGK_MOUSE {
        my($code) = @_;
	    eval q((($code) >=  &M_EVENT));
    }' unless defined(&is_DLGK_MOUSE);
    eval 'sub DLGK_MOUSE {
        my($code) = @_;
	    eval q((($code) +  &M_EVENT));
    }' unless defined(&DLGK_MOUSE);
    eval 'sub HELPKEY_BINDINGS () { &DLG_KEYS_DATA(  &DLGK_HELPFILE,  &CHR_HELP ),  &DLG_KEYS_DATA(  &DLGK_HELPFILE,  &KEY_F(1) ),  &DLG_KEYS_DATA(  &DLGK_HELPFILE,  &KEY_HELP );}' unless defined(&HELPKEY_BINDINGS);
    eval 'sub ENTERKEY_BINDINGS () { &DLG_KEYS_DATA(  &DLGK_ENTER, ord(\'\\n\' ), 	DLG_KEYS_DATA( DLGK_ENTER,	   \'\\r\') ),  &DLG_KEYS_DATA(  &DLGK_ENTER,  &KEY_ENTER ),  &DLG_KEYS_DATA(  &DLGK_LEAVE,  &CHR_LEAVE );}' unless defined(&ENTERKEY_BINDINGS);
    eval 'sub INPUTSTR_BINDINGS () { &DLG_KEYS_DATA(  &DLGK_BEGIN,  &KEY_HOME ),  &DLG_KEYS_DATA(  &DLGK_DELETE_ALL,  &CHR_KILL ),  &DLG_KEYS_DATA(  &DLGK_DELETE_LEFT,  &CHR_BACKSPACE ),  &DLG_KEYS_DATA(  &DLGK_DELETE_LEFT,  &KEY_BACKSPACE ),  &DLG_KEYS_DATA(  &DLGK_DELETE_RIGHT,  &CHR_DELETE ),  &DLG_KEYS_DATA(  &DLGK_DELETE_RIGHT,  &KEY_DC ),  &DLG_KEYS_DATA(  &DLGK_FINAL,  &KEY_END ),  &DLG_KEYS_DATA(  &DLGK_GRID_LEFT,  &KEY_LEFT ),  &DLG_KEYS_DATA(  &DLGK_GRID_RIGHT,  &KEY_RIGHT );}' unless defined(&INPUTSTR_BINDINGS);
    eval 'sub SCROLL_FKEY_BINDINGS () { &DLG_KEYS_DATA(  &DLGK_GRID_DOWN,  &KEY_DOWN ),  &DLG_KEYS_DATA(  &DLGK_GRID_UP,  &KEY_UP ),  &DLG_KEYS_DATA(  &DLGK_PAGE_FIRST,  &KEY_HOME ),  &DLG_KEYS_DATA(  &DLGK_PAGE_LAST,  &KEY_END ),  &DLG_KEYS_DATA(  &DLGK_PAGE_NEXT,  &KEY_NPAGE ),  &DLG_KEYS_DATA(  &DLGK_PAGE_PREV,  &KEY_PPAGE );}' unless defined(&SCROLL_FKEY_BINDINGS);
    eval 'sub SCROLLKEY_BINDINGS () { &SCROLL_FKEY_BINDINGS,  &DLG_KEYS_DATA(  &DLGK_GRID_DOWN, ord(\'J\' ), 	DLG_KEYS_DATA( DLGK_GRID_DOWN,	\'j\' ), 	DLG_KEYS_DATA( DLGK_GRID_UP,	\'K\' ), 	DLG_KEYS_DATA( DLGK_GRID_UP,	\'k\' ), 	DLG_KEYS_DATA( DLGK_PAGE_FIRST,	\'g\' ), 	DLG_KEYS_DATA( DLGK_PAGE_LAST,	\'G\' ), 	DLG_KEYS_DATA( DLGK_PAGE_NEXT,	\'F\' ), 	DLG_KEYS_DATA( DLGK_PAGE_NEXT,	\'f\' ), 	DLG_KEYS_DATA( DLGK_PAGE_PREV,	\'B\' ), 	DLG_KEYS_DATA( DLGK_PAGE_PREV,	\'b\') );}' unless defined(&SCROLLKEY_BINDINGS);
    eval 'sub TRAVERSE_BINDINGS () { &DLG_KEYS_DATA(  &DLGK_ENTER,  &CHR_SPACE ),  &DLG_KEYS_DATA(  &DLGK_FIELD_NEXT,  &KEY_DOWN ),  &DLG_KEYS_DATA(  &DLGK_FIELD_NEXT,  &KEY_RIGHT ),  &DLG_KEYS_DATA(  &DLGK_FIELD_NEXT,  &TAB ),  &DLG_KEYS_DATA(  &DLGK_FIELD_PREV,  &KEY_UP ),  &DLG_KEYS_DATA(  &DLGK_FIELD_PREV,  &KEY_BTAB ),  &DLG_KEYS_DATA(  &DLGK_FIELD_PREV,  &KEY_LEFT );}' unless defined(&TRAVERSE_BINDINGS);
    eval 'sub TOGGLEKEY_BINDINGS () { &DLG_KEYS_DATA(  &DLGK_TOGGLE,  &CHR_SPACE );}' unless defined(&TOGGLEKEY_BINDINGS);
    if(defined(&HAVE_RC_FILE)) {
    }
    if(defined(&__cplusplus)) {
    }
}
1;

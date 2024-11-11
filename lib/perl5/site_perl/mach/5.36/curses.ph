require '_h2ph_pre.ph';

no warnings qw(redefine misc);

unless(defined(&__NCURSES_H)) {
    eval 'sub __NCURSES_H () {1;}' unless defined(&__NCURSES_H);
    eval 'sub CURSES () {1;}' unless defined(&CURSES);
    eval 'sub CURSES_H () {1;}' unless defined(&CURSES_H);
    eval 'sub NCURSES_VERSION_MAJOR () {6;}' unless defined(&NCURSES_VERSION_MAJOR);
    eval 'sub NCURSES_VERSION_MINOR () {2;}' unless defined(&NCURSES_VERSION_MINOR);
    eval 'sub NCURSES_VERSION_PATCH () {20210220;}' unless defined(&NCURSES_VERSION_PATCH);
    undef(&NCURSES_VERSION) if defined(&NCURSES_VERSION);
    eval 'sub NCURSES_VERSION () {"6.2";}' unless defined(&NCURSES_VERSION);
    eval 'sub NCURSES_MOUSE_VERSION () {2;}' unless defined(&NCURSES_MOUSE_VERSION);
    require 'ncurses_dll.ph';
    if(1) {
	require 'stdint.ph';
    }
    unless(defined(&NCURSES_ENABLE_STDBOOL_H)) {
	eval 'sub NCURSES_ENABLE_STDBOOL_H () {1;}' unless defined(&NCURSES_ENABLE_STDBOOL_H);
    }
    unless(defined(&NCURSES_ATTR_T)) {
	eval 'sub NCURSES_ATTR_T () {\'int\';}' unless defined(&NCURSES_ATTR_T);
    }
    undef(&NCURSES_CONST) if defined(&NCURSES_CONST);
    eval 'sub NCURSES_CONST () { &const;}' unless defined(&NCURSES_CONST);
    undef(&NCURSES_INLINE) if defined(&NCURSES_INLINE);
    eval 'sub NCURSES_INLINE () { &inline;}' unless defined(&NCURSES_INLINE);
    undef(&NCURSES_COLOR_T) if defined(&NCURSES_COLOR_T);
    eval 'sub NCURSES_COLOR_T () {\'short\';}' unless defined(&NCURSES_COLOR_T);
    undef(&NCURSES_PAIRS_T) if defined(&NCURSES_PAIRS_T);
    eval 'sub NCURSES_PAIRS_T () {\'short\';}' unless defined(&NCURSES_PAIRS_T);
    unless(defined(&NCURSES_INTERNALS)) {
	eval 'sub NCURSES_OPAQUE () {0;}' unless defined(&NCURSES_OPAQUE);
	eval 'sub NCURSES_OPAQUE_FORM () {0;}' unless defined(&NCURSES_OPAQUE_FORM);
	eval 'sub NCURSES_OPAQUE_MENU () {0;}' unless defined(&NCURSES_OPAQUE_MENU);
	eval 'sub NCURSES_OPAQUE_PANEL () {0;}' unless defined(&NCURSES_OPAQUE_PANEL);
    }
    unless(defined(&NCURSES_WATTR_MACROS)) {
	eval 'sub NCURSES_WATTR_MACROS () {1;}' unless defined(&NCURSES_WATTR_MACROS);
    }
    unless(defined(&NCURSES_REENTRANT)) {
	eval 'sub NCURSES_REENTRANT () {0;}' unless defined(&NCURSES_REENTRANT);
    }
    undef(&NCURSES_BROKEN_LINKER) if defined(&NCURSES_BROKEN_LINKER);
    if(0) {
	eval 'sub NCURSES_BROKEN_LINKER () {1;}' unless defined(&NCURSES_BROKEN_LINKER);
    }
    undef(&NCURSES_INTEROP_FUNCS) if defined(&NCURSES_INTEROP_FUNCS);
    eval 'sub NCURSES_INTEROP_FUNCS () {1;}' unless defined(&NCURSES_INTEROP_FUNCS);
    undef(&NCURSES_SIZE_T) if defined(&NCURSES_SIZE_T);
    eval 'sub NCURSES_SIZE_T () {\'short\';}' unless defined(&NCURSES_SIZE_T);
    undef(&NCURSES_TPARM_VARARGS) if defined(&NCURSES_TPARM_VARARGS);
    eval 'sub NCURSES_TPARM_VARARGS () {1;}' unless defined(&NCURSES_TPARM_VARARGS);
    undef(&NCURSES_TPARM_ARG) if defined(&NCURSES_TPARM_ARG);
    eval 'sub NCURSES_TPARM_ARG () { &intptr_t;}' unless defined(&NCURSES_TPARM_ARG);
    undef(&NCURSES_WCWIDTH_GRAPHICS) if defined(&NCURSES_WCWIDTH_GRAPHICS);
    eval 'sub NCURSES_WCWIDTH_GRAPHICS () {1;}' unless defined(&NCURSES_WCWIDTH_GRAPHICS);
    undef(&NCURSES_CH_T) if defined(&NCURSES_CH_T);
    eval 'sub NCURSES_CH_T () { &cchar_t;}' unless defined(&NCURSES_CH_T);
    if(1 && defined(&_LP64)) {
    } else {
    }
    require 'stdio.ph';
    unless(defined(&NCURSES_WIDECHAR)) {
	if(defined(&_XOPEN_SOURCE_EXTENDED) || (defined(&_XOPEN_SOURCE)  && ((defined(&_XOPEN_SOURCE) ? &_XOPEN_SOURCE : undef) - 0>= 500))) {
	    eval 'sub NCURSES_WIDECHAR () {1;}' unless defined(&NCURSES_WIDECHAR);
	} else {
	    eval 'sub NCURSES_WIDECHAR () {0;}' unless defined(&NCURSES_WIDECHAR);
	}
    }
    require 'stdarg.ph';
    if((defined(&NCURSES_WIDECHAR) ? &NCURSES_WIDECHAR : undef)) {
	require 'stddef.ph';
    }
    undef(&TRUE) if defined(&TRUE);
    eval 'sub TRUE () {1;}' unless defined(&TRUE);
    undef(&FALSE) if defined(&FALSE);
    eval 'sub FALSE () {0;}' unless defined(&FALSE);
    if(defined(&__cplusplus) ) {
	eval 'sub NCURSES_BOOL () { &bool;}' unless defined(&NCURSES_BOOL);
    } else {
	if((defined(&NCURSES_ENABLE_STDBOOL_H) ? &NCURSES_ENABLE_STDBOOL_H : undef)) {
	    require 'stdbool.ph';
	    eval 'sub NCURSES_BOOL () { &bool;}' unless defined(&NCURSES_BOOL);
	} else {
	    undef(&bool) if defined(&bool);
	    eval 'sub bool () { &NCURSES_BOOL;}' unless defined(&bool);
	}
    }
    if(defined(&__cplusplus)) {
	eval 'sub NCURSES_CAST {
	    my($type,$value) = @_;
    	    eval q( &static_cast<$type>($value));
	}' unless defined(&NCURSES_CAST);
    } else {
	eval 'sub NCURSES_CAST {
	    my($type,$value) = @_;
    	    eval q(($type)($value));
	}' unless defined(&NCURSES_CAST);
    }
    eval 'sub NCURSES_OK_ADDR {
        my($p) = @_;
	    eval q((0!=  &NCURSES_CAST( &const  &void *, ($p))));
    }' unless defined(&NCURSES_OK_ADDR);
    eval 'sub WA_ATTRIBUTES () { &A_ATTRIBUTES;}' unless defined(&WA_ATTRIBUTES);
    eval 'sub WA_NORMAL () { &A_NORMAL;}' unless defined(&WA_NORMAL);
    eval 'sub WA_STANDOUT () { &A_STANDOUT;}' unless defined(&WA_STANDOUT);
    eval 'sub WA_UNDERLINE () { &A_UNDERLINE;}' unless defined(&WA_UNDERLINE);
    eval 'sub WA_REVERSE () { &A_REVERSE;}' unless defined(&WA_REVERSE);
    eval 'sub WA_BLINK () { &A_BLINK;}' unless defined(&WA_BLINK);
    eval 'sub WA_DIM () { &A_DIM;}' unless defined(&WA_DIM);
    eval 'sub WA_BOLD () { &A_BOLD;}' unless defined(&WA_BOLD);
    eval 'sub WA_ALTCHARSET () { &A_ALTCHARSET;}' unless defined(&WA_ALTCHARSET);
    eval 'sub WA_INVIS () { &A_INVIS;}' unless defined(&WA_INVIS);
    eval 'sub WA_PROTECT () { &A_PROTECT;}' unless defined(&WA_PROTECT);
    eval 'sub WA_HORIZONTAL () { &A_HORIZONTAL;}' unless defined(&WA_HORIZONTAL);
    eval 'sub WA_LEFT () { &A_LEFT;}' unless defined(&WA_LEFT);
    eval 'sub WA_LOW () { &A_LOW;}' unless defined(&WA_LOW);
    eval 'sub WA_RIGHT () { &A_RIGHT;}' unless defined(&WA_RIGHT);
    eval 'sub WA_TOP () { &A_TOP;}' unless defined(&WA_TOP);
    eval 'sub WA_VERTICAL () { &A_VERTICAL;}' unless defined(&WA_VERTICAL);
    if(1) {
	eval 'sub WA_ITALIC () { &A_ITALIC;}' unless defined(&WA_ITALIC);
    }
    eval 'sub COLOR_BLACK () {0;}' unless defined(&COLOR_BLACK);
    eval 'sub COLOR_RED () {1;}' unless defined(&COLOR_RED);
    eval 'sub COLOR_GREEN () {2;}' unless defined(&COLOR_GREEN);
    eval 'sub COLOR_YELLOW () {3;}' unless defined(&COLOR_YELLOW);
    eval 'sub COLOR_BLUE () {4;}' unless defined(&COLOR_BLUE);
    eval 'sub COLOR_MAGENTA () {5;}' unless defined(&COLOR_MAGENTA);
    eval 'sub COLOR_CYAN () {6;}' unless defined(&COLOR_CYAN);
    eval 'sub COLOR_WHITE () {7;}' unless defined(&COLOR_WHITE);
    if(0|| (defined(&NCURSES_REENTRANT) ? &NCURSES_REENTRANT : undef)) {
	eval 'sub acs_map () { &NCURSES_PUBLIC_VAR( &acs_map());}' unless defined(&acs_map);
    } else {
    }
    eval 'sub NCURSES_ACS {
        my($c) = @_;
	    eval q(( $acs_map[ &NCURSES_CAST(\'unsigned char\',($c))]));
    }' unless defined(&NCURSES_ACS);
    eval 'sub ACS_ULCORNER () { &NCURSES_ACS(ord(\'l\'));}' unless defined(&ACS_ULCORNER);
    eval 'sub ACS_LLCORNER () { &NCURSES_ACS(ord(\'m\'));}' unless defined(&ACS_LLCORNER);
    eval 'sub ACS_URCORNER () { &NCURSES_ACS(ord(\'k\'));}' unless defined(&ACS_URCORNER);
    eval 'sub ACS_LRCORNER () { &NCURSES_ACS(ord(\'j\'));}' unless defined(&ACS_LRCORNER);
    eval 'sub ACS_LTEE () { &NCURSES_ACS(ord(\'t\'));}' unless defined(&ACS_LTEE);
    eval 'sub ACS_RTEE () { &NCURSES_ACS(ord(\'u\'));}' unless defined(&ACS_RTEE);
    eval 'sub ACS_BTEE () { &NCURSES_ACS(ord(\'v\'));}' unless defined(&ACS_BTEE);
    eval 'sub ACS_TTEE () { &NCURSES_ACS(ord(\'w\'));}' unless defined(&ACS_TTEE);
    eval 'sub ACS_HLINE () { &NCURSES_ACS(ord(\'q\'));}' unless defined(&ACS_HLINE);
    eval 'sub ACS_VLINE () { &NCURSES_ACS(ord(\'x\'));}' unless defined(&ACS_VLINE);
    eval 'sub ACS_PLUS () { &NCURSES_ACS(ord(\'n\'));}' unless defined(&ACS_PLUS);
    eval 'sub ACS_S1 () { &NCURSES_ACS(ord(\'o\'));}' unless defined(&ACS_S1);
    eval 'sub ACS_S9 () { &NCURSES_ACS(ord(\'s\'));}' unless defined(&ACS_S9);
    eval 'sub ACS_DIAMOND () { &NCURSES_ACS(ord(\'`\'));}' unless defined(&ACS_DIAMOND);
    eval 'sub ACS_CKBOARD () { &NCURSES_ACS(ord(\'a\'));}' unless defined(&ACS_CKBOARD);
    eval 'sub ACS_DEGREE () { &NCURSES_ACS(ord(\'f\'));}' unless defined(&ACS_DEGREE);
    eval 'sub ACS_PLMINUS () { &NCURSES_ACS(ord(\'g\'));}' unless defined(&ACS_PLMINUS);
    eval 'sub ACS_BULLET () { &NCURSES_ACS(ord(\'~\'));}' unless defined(&ACS_BULLET);
    eval 'sub ACS_LARROW () { &NCURSES_ACS(ord(\',\'));}' unless defined(&ACS_LARROW);
    eval 'sub ACS_RARROW () { &NCURSES_ACS(ord(\'+\'));}' unless defined(&ACS_RARROW);
    eval 'sub ACS_DARROW () { &NCURSES_ACS(ord(\'.\'));}' unless defined(&ACS_DARROW);
    eval 'sub ACS_UARROW () { &NCURSES_ACS(ord(\'-\'));}' unless defined(&ACS_UARROW);
    eval 'sub ACS_BOARD () { &NCURSES_ACS(ord(\'h\'));}' unless defined(&ACS_BOARD);
    eval 'sub ACS_LANTERN () { &NCURSES_ACS(ord(\'i\'));}' unless defined(&ACS_LANTERN);
    eval 'sub ACS_BLOCK () { &NCURSES_ACS(ord(\'0\'));}' unless defined(&ACS_BLOCK);
    eval 'sub ACS_S3 () { &NCURSES_ACS(ord(\'p\'));}' unless defined(&ACS_S3);
    eval 'sub ACS_S7 () { &NCURSES_ACS(ord(\'r\'));}' unless defined(&ACS_S7);
    eval 'sub ACS_LEQUAL () { &NCURSES_ACS(ord(\'y\'));}' unless defined(&ACS_LEQUAL);
    eval 'sub ACS_GEQUAL () { &NCURSES_ACS(ord(\'z\'));}' unless defined(&ACS_GEQUAL);
    eval 'sub ACS_PI () { &NCURSES_ACS(ord(\'{\'));}' unless defined(&ACS_PI);
    eval 'sub ACS_NEQUAL () { &NCURSES_ACS(ord(\'|\'));}' unless defined(&ACS_NEQUAL);
    eval 'sub ACS_STERLING () { &NCURSES_ACS(ord(\'}\'));}' unless defined(&ACS_STERLING);
    eval 'sub ACS_BSSB () { &ACS_ULCORNER;}' unless defined(&ACS_BSSB);
    eval 'sub ACS_SSBB () { &ACS_LLCORNER;}' unless defined(&ACS_SSBB);
    eval 'sub ACS_BBSS () { &ACS_URCORNER;}' unless defined(&ACS_BBSS);
    eval 'sub ACS_SBBS () { &ACS_LRCORNER;}' unless defined(&ACS_SBBS);
    eval 'sub ACS_SBSS () { &ACS_RTEE;}' unless defined(&ACS_SBSS);
    eval 'sub ACS_SSSB () { &ACS_LTEE;}' unless defined(&ACS_SSSB);
    eval 'sub ACS_SSBS () { &ACS_BTEE;}' unless defined(&ACS_SSBS);
    eval 'sub ACS_BSSS () { &ACS_TTEE;}' unless defined(&ACS_BSSS);
    eval 'sub ACS_BSBS () { &ACS_HLINE;}' unless defined(&ACS_BSBS);
    eval 'sub ACS_SBSB () { &ACS_VLINE;}' unless defined(&ACS_SBSB);
    eval 'sub ACS_SSSS () { &ACS_PLUS;}' unless defined(&ACS_SSSS);
    undef(&ERR) if defined(&ERR);
    eval 'sub ERR () {(-1);}' unless defined(&ERR);
    undef(&OK) if defined(&OK);
    eval 'sub OK () {(0);}' unless defined(&OK);
    eval 'sub _SUBWIN () {0x1;}' unless defined(&_SUBWIN);
    eval 'sub _ENDLINE () {0x2;}' unless defined(&_ENDLINE);
    eval 'sub _FULLWIN () {0x4;}' unless defined(&_FULLWIN);
    eval 'sub _SCROLLWIN () {0x8;}' unless defined(&_SCROLLWIN);
    eval 'sub _ISPAD () {0x10;}' unless defined(&_ISPAD);
    eval 'sub _HASMOVED () {0x20;}' unless defined(&_HASMOVED);
    eval 'sub _WRAPPED () {0x40;}' unless defined(&_WRAPPED);
    eval 'sub _NOCHANGE () {-1;}' unless defined(&_NOCHANGE);
    eval 'sub _NEWINDEX () {-1;}' unless defined(&_NEWINDEX);
    if((defined(&NCURSES_WIDECHAR) ? &NCURSES_WIDECHAR : undef)) {
	if(0) {
	    if(defined(&mblen)) {
		undef(&mblen) if defined(&mblen);
	    }
	    require 'libutf8.ph';
	}
	if(1) {
	    require 'wchar.ph';
	}
	if(0) {
	}
	if(0) {
	}
	eval 'sub CCHARW_MAX () {5;}' unless defined(&CCHARW_MAX);
	if(1) {
	    undef(&NCURSES_EXT_COLORS) if defined(&NCURSES_EXT_COLORS);
	    eval 'sub NCURSES_EXT_COLORS () {20210220;}' unless defined(&NCURSES_EXT_COLORS);
	}
    }
    if(!(defined(&NCURSES_OPAQUE) ? &NCURSES_OPAQUE : undef)) {
	if((defined(&NCURSES_WIDECHAR) ? &NCURSES_WIDECHAR : undef)) {
	    if(1) {
	    }
	}
    }
    if(!(defined(&__GNUC__) || defined(&__GNUG__) || defined(&__attribute__))) {
	eval 'sub __attribute__ {
	    my($p) = @_;
    	    eval q();
	}' unless defined(&__attribute__);
    }
    unless(defined(&GCC_PRINTFLIKE)) {
	if(defined(&GCC_PRINTF)  && !defined(&printf)) {
	    eval 'sub GCC_PRINTFLIKE {
	        my($fmt,$var) = @_;
    		eval q( &__attribute__(( &format( &printf,$fmt,$var))));
	    }' unless defined(&GCC_PRINTFLIKE);
	} else {
	    eval 'sub GCC_PRINTFLIKE {
	        my($fmt,$var) = @_;
    		eval q();
	    }' unless defined(&GCC_PRINTFLIKE);
	}
    }
    unless(defined(&GCC_SCANFLIKE)) {
	if(defined(&GCC_SCANF)  && !defined(&scanf)) {
	    eval 'sub GCC_SCANFLIKE {
	        my($fmt,$var) = @_;
    		eval q( &__attribute__(( &format( &scanf,$fmt,$var))));
	    }' unless defined(&GCC_SCANFLIKE);
	} else {
	    eval 'sub GCC_SCANFLIKE {
	        my($fmt,$var) = @_;
    		eval q();
	    }' unless defined(&GCC_SCANFLIKE);
	}
    }
    unless(defined(&GCC_NORETURN)) {
	eval 'sub GCC_NORETURN () {1;}' unless defined(&GCC_NORETURN);
    }
    unless(defined(&GCC_UNUSED)) {
	eval 'sub GCC_UNUSED () {1;}' unless defined(&GCC_UNUSED);
    }
    undef(&GCC_DEPRECATED) if defined(&GCC_DEPRECATED);
    if(((defined(&__GNUC__) ? &__GNUC__ : undef) - 0> 3|| ((defined(&__GNUC__) ? &__GNUC__ : undef) - 0== 3 && (defined(&__GNUC_MINOR__) ? &__GNUC_MINOR__ : undef) - 0>= 2))  && !defined(&NCURSES_INTERNALS)) {
	eval 'sub GCC_DEPRECATED {
	    my($msg) = @_;
    	    eval q( &__attribute__(( &deprecated)));
	}' unless defined(&GCC_DEPRECATED);
    } else {
	eval 'sub GCC_DEPRECATED {
	    my($msg) = @_;
    	    eval q();
	}' unless defined(&GCC_DEPRECATED);
    }
    if((defined(&NCURSES_TPARM_VARARGS) ? &NCURSES_TPARM_VARARGS : undef)) {
    } else {
    }
    if(!(defined(&NCURSES_WIDECHAR) ? &NCURSES_WIDECHAR : undef)) {
	eval 'sub vid_attr {
	    my($a,$pair,$opts) = @_;
    	    eval q( &vidattr($a));
	}' unless defined(&vid_attr);
    }
    if(1) {
	undef(&NCURSES_EXT_FUNCS) if defined(&NCURSES_EXT_FUNCS);
	eval 'sub NCURSES_EXT_FUNCS () {20210220;}' unless defined(&NCURSES_EXT_FUNCS);
    } else {
	eval 'sub curses_version () {
	    eval q( &NCURSES_VERSION);
	}' unless defined(&curses_version);
    }
    if(1) {
	undef(&NCURSES_SP_FUNCS) if defined(&NCURSES_SP_FUNCS);
	eval 'sub NCURSES_SP_FUNCS () {20210220;}' unless defined(&NCURSES_SP_FUNCS);
	eval 'sub NCURSES_SP_NAME {
	    my($name) = @_;
    	    eval q($name &_sp);
	}' unless defined(&NCURSES_SP_NAME);
	eval 'sub NCURSES_SP_OUTC () { &NCURSES_SP_NAME( &NCURSES_OUTC);}' unless defined(&NCURSES_SP_OUTC);
	if(1) {
	}
    } else {
	undef(&NCURSES_SP_FUNCS) if defined(&NCURSES_SP_FUNCS);
	eval 'sub NCURSES_SP_FUNCS () {0;}' unless defined(&NCURSES_SP_FUNCS);
	eval 'sub NCURSES_SP_NAME {
	    my($name) = @_;
    	    eval q($name);
	}' unless defined(&NCURSES_SP_NAME);
	eval 'sub NCURSES_SP_OUTC () { &NCURSES_OUTC;}' unless defined(&NCURSES_SP_OUTC);
    }
    eval 'sub NCURSES_ATTR_SHIFT () {8;}' unless defined(&NCURSES_ATTR_SHIFT);
    eval 'sub NCURSES_BITS {
        my($mask,$shift) = @_;
	    eval q(( &NCURSES_CAST( &chtype,($mask)) << (($shift) +  &NCURSES_ATTR_SHIFT)));
    }' unless defined(&NCURSES_BITS);
    eval 'sub A_NORMAL () {(1 - 1);}' unless defined(&A_NORMAL);
    eval 'sub A_ATTRIBUTES () { &NCURSES_BITS(~(1 - 1),0);}' unless defined(&A_ATTRIBUTES);
    eval 'sub A_CHARTEXT () {( &NCURSES_BITS(1,0) - 1);}' unless defined(&A_CHARTEXT);
    eval 'sub A_COLOR () { &NCURSES_BITS(((1) << 8) - 1,0);}' unless defined(&A_COLOR);
    eval 'sub A_STANDOUT () { &NCURSES_BITS(1,8);}' unless defined(&A_STANDOUT);
    eval 'sub A_UNDERLINE () { &NCURSES_BITS(1,9);}' unless defined(&A_UNDERLINE);
    eval 'sub A_REVERSE () { &NCURSES_BITS(1,10);}' unless defined(&A_REVERSE);
    eval 'sub A_BLINK () { &NCURSES_BITS(1,11);}' unless defined(&A_BLINK);
    eval 'sub A_DIM () { &NCURSES_BITS(1,12);}' unless defined(&A_DIM);
    eval 'sub A_BOLD () { &NCURSES_BITS(1,13);}' unless defined(&A_BOLD);
    eval 'sub A_ALTCHARSET () { &NCURSES_BITS(1,14);}' unless defined(&A_ALTCHARSET);
    eval 'sub A_INVIS () { &NCURSES_BITS(1,15);}' unless defined(&A_INVIS);
    eval 'sub A_PROTECT () { &NCURSES_BITS(1,16);}' unless defined(&A_PROTECT);
    eval 'sub A_HORIZONTAL () { &NCURSES_BITS(1,17);}' unless defined(&A_HORIZONTAL);
    eval 'sub A_LEFT () { &NCURSES_BITS(1,18);}' unless defined(&A_LEFT);
    eval 'sub A_LOW () { &NCURSES_BITS(1,19);}' unless defined(&A_LOW);
    eval 'sub A_RIGHT () { &NCURSES_BITS(1,20);}' unless defined(&A_RIGHT);
    eval 'sub A_TOP () { &NCURSES_BITS(1,21);}' unless defined(&A_TOP);
    eval 'sub A_VERTICAL () { &NCURSES_BITS(1,22);}' unless defined(&A_VERTICAL);
    if(1) {
	eval 'sub A_ITALIC () { &NCURSES_BITS(1,23);}' unless defined(&A_ITALIC);
    }
    eval 'sub getyx {
        my($win,$y,$x) = @_;
	    eval q(($y =  &getcury($win), $x =  &getcurx($win)));
    }' unless defined(&getyx);
    eval 'sub getbegyx {
        my($win,$y,$x) = @_;
	    eval q(($y =  &getbegy($win), $x =  &getbegx($win)));
    }' unless defined(&getbegyx);
    eval 'sub getmaxyx {
        my($win,$y,$x) = @_;
	    eval q(($y =  &getmaxy($win), $x =  &getmaxx($win)));
    }' unless defined(&getmaxyx);
    eval 'sub getparyx {
        my($win,$y,$x) = @_;
	    eval q(($y =  &getpary($win), $x =  &getparx($win)));
    }' unless defined(&getparyx);
    eval 'sub getsyx {
        my($y,$x) = @_;
	    eval q( &do {  &if ( &newscr) {  &if ( &is_leaveok( &newscr)) ($y) = ($x) = -1;  &else  &getyx( &newscr,($y), ($x)); } }  &while(0));
    }' unless defined(&getsyx);
    eval 'sub setsyx {
        my($y,$x) = @_;
	    eval q( &do {  &if ( &newscr) {  &if (($y) == -1 && ($x) == -1)  &leaveok( &newscr,  &TRUE);  &else {  &leaveok( &newscr,  &FALSE);  &wmove( &newscr, ($y), ($x)); } } }  &while(0));
    }' unless defined(&setsyx);
    unless(defined(&NCURSES_NOMACROS)) {
	eval 'sub wgetstr {
	    my($w, $s) = @_;
    	    eval q( &wgetnstr($w, $s, -1));
	}' unless defined(&wgetstr);
	eval 'sub getnstr {
	    my($s, $n) = @_;
    	    eval q( &wgetnstr( &stdscr, $s, ($n)));
	}' unless defined(&getnstr);
	eval 'sub setterm {
	    my($term) = @_;
    	    eval q( &setupterm($term, 1, 0));
	}' unless defined(&setterm);
	eval 'sub fixterm () {
	    eval q( &reset_prog_mode());
	}' unless defined(&fixterm);
	eval 'sub resetterm () {
	    eval q( &reset_shell_mode());
	}' unless defined(&resetterm);
	eval 'sub saveterm () {
	    eval q( &def_prog_mode());
	}' unless defined(&saveterm);
	eval 'sub crmode () {
	    eval q( &cbreak());
	}' unless defined(&crmode);
	eval 'sub nocrmode () {
	    eval q( &nocbreak());
	}' unless defined(&nocrmode);
	eval 'sub gettmode () {
	    eval q();
	}' unless defined(&gettmode);
	if(!(defined(&NCURSES_OPAQUE) ? &NCURSES_OPAQUE : undef)) {
	    eval 'sub getattrs {
	        my($win) = @_;
    		eval q( &NCURSES_CAST(\'int\',  &NCURSES_OK_ADDR($win) ? ($win)-> &_attrs :  &A_NORMAL));
	    }' unless defined(&getattrs);
	    eval 'sub getcurx {
	        my($win) = @_;
    		eval q(( &NCURSES_OK_ADDR($win) ? ($win)-> &_curx :  &ERR));
	    }' unless defined(&getcurx);
	    eval 'sub getcury {
	        my($win) = @_;
    		eval q(( &NCURSES_OK_ADDR($win) ? ($win)-> &_cury :  &ERR));
	    }' unless defined(&getcury);
	    eval 'sub getbegx {
	        my($win) = @_;
    		eval q(( &NCURSES_OK_ADDR($win) ? ($win)-> &_begx :  &ERR));
	    }' unless defined(&getbegx);
	    eval 'sub getbegy {
	        my($win) = @_;
    		eval q(( &NCURSES_OK_ADDR($win) ? ($win)-> &_begy :  &ERR));
	    }' unless defined(&getbegy);
	    eval 'sub getmaxx {
	        my($win) = @_;
    		eval q(( &NCURSES_OK_ADDR($win) ? (($win)-> &_maxx + 1) :  &ERR));
	    }' unless defined(&getmaxx);
	    eval 'sub getmaxy {
	        my($win) = @_;
    		eval q(( &NCURSES_OK_ADDR($win) ? (($win)-> &_maxy + 1) :  &ERR));
	    }' unless defined(&getmaxy);
	    eval 'sub getparx {
	        my($win) = @_;
    		eval q(( &NCURSES_OK_ADDR($win) ? ($win)-> &_parx :  &ERR));
	    }' unless defined(&getparx);
	    eval 'sub getpary {
	        my($win) = @_;
    		eval q(( &NCURSES_OK_ADDR($win) ? ($win)-> &_pary :  &ERR));
	    }' unless defined(&getpary);
	}
	eval 'sub wstandout {
	    my($win) = @_;
    	    eval q(( &wattrset($win, &A_STANDOUT)));
	}' unless defined(&wstandout);
	eval 'sub wstandend {
	    my($win) = @_;
    	    eval q(( &wattrset($win, &A_NORMAL)));
	}' unless defined(&wstandend);
	eval 'sub wattron {
	    my($win,$at) = @_;
    	    eval q( &wattr_on($win,  &NCURSES_CAST( &attr_t, $at),  &NULL));
	}' unless defined(&wattron);
	eval 'sub wattroff {
	    my($win,$at) = @_;
    	    eval q( &wattr_off($win,  &NCURSES_CAST( &attr_t, $at),  &NULL));
	}' unless defined(&wattroff);
	if(!(defined(&NCURSES_OPAQUE) ? &NCURSES_OPAQUE : undef)) {
	    if((defined(&NCURSES_WATTR_MACROS) ? &NCURSES_WATTR_MACROS : undef)) {
		if((defined(&NCURSES_WIDECHAR) ? &NCURSES_WIDECHAR : undef)  && 1) {
		    eval 'sub wattrset {
		        my($win,$at) = @_;
    			eval q(( &NCURSES_OK_ADDR($win) ? (($win)-> &_color =  &NCURSES_CAST(\'int\',  &PAIR_NUMBER($at)), ($win)-> &_attrs =  &NCURSES_CAST( &attr_t, $at),  &OK) :  &ERR));
		    }' unless defined(&wattrset);
		} else {
		    eval 'sub wattrset {
		        my($win,$at) = @_;
    			eval q(( &NCURSES_OK_ADDR($win) ? (($win)-> &_attrs =  &NCURSES_CAST( &attr_t, $at),  &OK) :  &ERR));
		    }' unless defined(&wattrset);
		}
	    }
	}
	eval 'sub scroll {
	    my($win) = @_;
    	    eval q( &wscrl($win,1));
	}' unless defined(&scroll);
	eval 'sub touchwin {
	    my($win) = @_;
    	    eval q( &wtouchln(($win), 0,  &getmaxy($win), 1));
	}' unless defined(&touchwin);
	eval 'sub touchline {
	    my($win, $s, $c) = @_;
    	    eval q( &wtouchln(($win), $s, $c, 1));
	}' unless defined(&touchline);
	eval 'sub untouchwin {
	    my($win) = @_;
    	    eval q( &wtouchln(($win), 0,  &getmaxy($win), 0));
	}' unless defined(&untouchwin);
	eval 'sub box {
	    my($win, $v, $h) = @_;
    	    eval q( &wborder($win, $v, $v, $h, $h, 0, 0, 0, 0));
	}' unless defined(&box);
	eval 'sub border {
	    my($ls, $rs, $ts, $bs, $tl, $tr, $bl, $br) = @_;
    	    eval q( &wborder( &stdscr, $ls, $rs, $ts, $bs, $tl, $tr, $bl, $br));
	}' unless defined(&border);
	eval 'sub hline {
	    my($ch, $n) = @_;
    	    eval q( &whline( &stdscr, $ch, ($n)));
	}' unless defined(&hline);
	eval 'sub vline {
	    my($ch, $n) = @_;
    	    eval q( &wvline( &stdscr, $ch, ($n)));
	}' unless defined(&vline);
	eval 'sub winstr {
	    my($w, $s) = @_;
    	    eval q( &winnstr($w, $s, -1));
	}' unless defined(&winstr);
	eval 'sub winchstr {
	    my($w, $s) = @_;
    	    eval q( &winchnstr($w, $s, -1));
	}' unless defined(&winchstr);
	eval 'sub winsstr {
	    my($w, $s) = @_;
    	    eval q( &winsnstr($w, $s, -1));
	}' unless defined(&winsstr);
	if(!(defined(&NCURSES_OPAQUE) ? &NCURSES_OPAQUE : undef)) {
	    eval 'sub redrawwin {
	        my($win) = @_;
    		eval q( &wredrawln($win, 0, ( &NCURSES_OK_ADDR($win) ? ($win)-> &_maxy+1: -1)));
	    }' unless defined(&redrawwin);
	}
	eval 'sub waddstr {
	    my($win,$str) = @_;
    	    eval q( &waddnstr($win,$str,-1));
	}' unless defined(&waddstr);
	eval 'sub waddchstr {
	    my($win,$str) = @_;
    	    eval q( &waddchnstr($win,$str,-1));
	}' unless defined(&waddchstr);
	eval 'sub COLOR_PAIR {
	    my($n) = @_;
    	    eval q(( &NCURSES_BITS(($n), 0) &  &A_COLOR));
	}' unless defined(&COLOR_PAIR);
	eval 'sub PAIR_NUMBER {
	    my($a) = @_;
    	    eval q(( &NCURSES_CAST(\'int\',(( &NCURSES_CAST(\'unsigned long\',($a)) &  &A_COLOR) >>  &NCURSES_ATTR_SHIFT))));
	}' unless defined(&PAIR_NUMBER);
	eval 'sub addch {
	    my($ch) = @_;
    	    eval q( &waddch( &stdscr,($ch)));
	}' unless defined(&addch);
	eval 'sub addchnstr {
	    my($str,$n) = @_;
    	    eval q( &waddchnstr( &stdscr,($str),($n)));
	}' unless defined(&addchnstr);
	eval 'sub addchstr {
	    my($str) = @_;
    	    eval q( &waddchstr( &stdscr,($str)));
	}' unless defined(&addchstr);
	eval 'sub addnstr {
	    my($str,$n) = @_;
    	    eval q( &waddnstr( &stdscr,($str),($n)));
	}' unless defined(&addnstr);
	eval 'sub addstr {
	    my($str) = @_;
    	    eval q( &waddnstr( &stdscr,($str),-1));
	}' unless defined(&addstr);
	eval 'sub attr_get {
	    my($ap,$cp,$o) = @_;
    	    eval q( &wattr_get( &stdscr,($ap),($cp),($o)));
	}' unless defined(&attr_get);
	eval 'sub attr_off {
	    my($a,$o) = @_;
    	    eval q( &wattr_off( &stdscr,($a),($o)));
	}' unless defined(&attr_off);
	eval 'sub attr_on {
	    my($a,$o) = @_;
    	    eval q( &wattr_on( &stdscr,($a),($o)));
	}' unless defined(&attr_on);
	eval 'sub attr_set {
	    my($a,$c,$o) = @_;
    	    eval q( &wattr_set( &stdscr,($a),($c),($o)));
	}' unless defined(&attr_set);
	eval 'sub attroff {
	    my($at) = @_;
    	    eval q( &wattroff( &stdscr,($at)));
	}' unless defined(&attroff);
	eval 'sub attron {
	    my($at) = @_;
    	    eval q( &wattron( &stdscr,($at)));
	}' unless defined(&attron);
	eval 'sub attrset {
	    my($at) = @_;
    	    eval q( &wattrset( &stdscr,($at)));
	}' unless defined(&attrset);
	eval 'sub bkgd {
	    my($ch) = @_;
    	    eval q( &wbkgd( &stdscr,($ch)));
	}' unless defined(&bkgd);
	eval 'sub bkgdset {
	    my($ch) = @_;
    	    eval q( &wbkgdset( &stdscr,($ch)));
	}' unless defined(&bkgdset);
	eval 'sub chgat {
	    my($n,$a,$c,$o) = @_;
    	    eval q( &wchgat( &stdscr,($n),($a),($c),($o)));
	}' unless defined(&chgat);
	eval 'sub clear () {
	    eval q( &wclear( &stdscr));
	}' unless defined(&clear);
	eval 'sub clrtobot () {
	    eval q( &wclrtobot( &stdscr));
	}' unless defined(&clrtobot);
	eval 'sub clrtoeol () {
	    eval q( &wclrtoeol( &stdscr));
	}' unless defined(&clrtoeol);
	eval 'sub color_set {
	    my($c,$o) = @_;
    	    eval q( &wcolor_set( &stdscr,($c),($o)));
	}' unless defined(&color_set);
	eval 'sub delch () {
	    eval q( &wdelch( &stdscr));
	}' unless defined(&delch);
	eval 'sub deleteln () {
	    eval q( &winsdelln( &stdscr,-1));
	}' unless defined(&deleteln);
	eval 'sub echochar {
	    my($c) = @_;
    	    eval q( &wechochar( &stdscr,($c)));
	}' unless defined(&echochar);
	eval 'sub erase () {
	    eval q( &werase( &stdscr));
	}' unless defined(&erase);
	eval 'sub getch () {
	    eval q( &wgetch( &stdscr));
	}' unless defined(&getch);
	eval 'sub getstr {
	    my($str) = @_;
    	    eval q( &wgetstr( &stdscr,($str)));
	}' unless defined(&getstr);
	eval 'sub inch () {
	    eval q( &winch( &stdscr));
	}' unless defined(&inch);
	eval 'sub inchnstr {
	    my($s,$n) = @_;
    	    eval q( &winchnstr( &stdscr,($s),($n)));
	}' unless defined(&inchnstr);
	eval 'sub inchstr {
	    my($s) = @_;
    	    eval q( &winchstr( &stdscr,($s)));
	}' unless defined(&inchstr);
	eval 'sub innstr {
	    my($s,$n) = @_;
    	    eval q( &winnstr( &stdscr,($s),($n)));
	}' unless defined(&innstr);
	eval 'sub insch {
	    my($c) = @_;
    	    eval q( &winsch( &stdscr,($c)));
	}' unless defined(&insch);
	eval 'sub insdelln {
	    my($n) = @_;
    	    eval q( &winsdelln( &stdscr,($n)));
	}' unless defined(&insdelln);
	eval 'sub insertln () {
	    eval q( &winsdelln( &stdscr,1));
	}' unless defined(&insertln);
	eval 'sub insnstr {
	    my($s,$n) = @_;
    	    eval q( &winsnstr( &stdscr,($s),($n)));
	}' unless defined(&insnstr);
	eval 'sub insstr {
	    my($s) = @_;
    	    eval q( &winsstr( &stdscr,($s)));
	}' unless defined(&insstr);
	eval 'sub instr {
	    my($s) = @_;
    	    eval q( &winstr( &stdscr,($s)));
	}' unless defined(&instr);
	eval 'sub move {
	    my($y,$x) = @_;
    	    eval q( &wmove( &stdscr,($y),($x)));
	}' unless defined(&move);
	eval 'sub refresh () {
	    eval q( &wrefresh( &stdscr));
	}' unless defined(&refresh);
	eval 'sub scrl {
	    my($n) = @_;
    	    eval q( &wscrl( &stdscr,($n)));
	}' unless defined(&scrl);
	eval 'sub setscrreg {
	    my($t,$b) = @_;
    	    eval q( &wsetscrreg( &stdscr,($t),($b)));
	}' unless defined(&setscrreg);
	eval 'sub standend () {
	    eval q( &wstandend( &stdscr));
	}' unless defined(&standend);
	eval 'sub standout () {
	    eval q( &wstandout( &stdscr));
	}' unless defined(&standout);
	eval 'sub timeout {
	    my($delay) = @_;
    	    eval q( &wtimeout( &stdscr,($delay)));
	}' unless defined(&timeout);
	eval 'sub wdeleteln {
	    my($win) = @_;
    	    eval q( &winsdelln($win,-1));
	}' unless defined(&wdeleteln);
	eval 'sub winsertln {
	    my($win) = @_;
    	    eval q( &winsdelln($win,1));
	}' unless defined(&winsertln);
	eval 'sub mvwaddch {
	    my($win,$y,$x,$ch) = @_;
    	    eval q(( &wmove(($win),($y),($x)) ==  &ERR ?  &ERR :  &waddch(($win),($ch))));
	}' unless defined(&mvwaddch);
	eval 'sub mvwaddchnstr {
	    my($win,$y,$x,$str,$n) = @_;
    	    eval q(( &wmove(($win),($y),($x)) ==  &ERR ?  &ERR :  &waddchnstr(($win),($str),($n))));
	}' unless defined(&mvwaddchnstr);
	eval 'sub mvwaddchstr {
	    my($win,$y,$x,$str) = @_;
    	    eval q(( &wmove(($win),($y),($x)) ==  &ERR ?  &ERR :  &waddchnstr(($win),($str),-1)));
	}' unless defined(&mvwaddchstr);
	eval 'sub mvwaddnstr {
	    my($win,$y,$x,$str,$n) = @_;
    	    eval q(( &wmove(($win),($y),($x)) ==  &ERR ?  &ERR :  &waddnstr(($win),($str),($n))));
	}' unless defined(&mvwaddnstr);
	eval 'sub mvwaddstr {
	    my($win,$y,$x,$str) = @_;
    	    eval q(( &wmove(($win),($y),($x)) ==  &ERR ?  &ERR :  &waddnstr(($win),($str),-1)));
	}' unless defined(&mvwaddstr);
	eval 'sub mvwchgat {
	    my($win,$y,$x,$n,$a,$c,$o) = @_;
    	    eval q(( &wmove(($win),($y),($x)) ==  &ERR ?  &ERR :  &wchgat(($win),($n),($a),($c),($o))));
	}' unless defined(&mvwchgat);
	eval 'sub mvwdelch {
	    my($win,$y,$x) = @_;
    	    eval q(( &wmove(($win),($y),($x)) ==  &ERR ?  &ERR :  &wdelch($win)));
	}' unless defined(&mvwdelch);
	eval 'sub mvwgetch {
	    my($win,$y,$x) = @_;
    	    eval q(( &wmove(($win),($y),($x)) ==  &ERR ?  &ERR :  &wgetch($win)));
	}' unless defined(&mvwgetch);
	eval 'sub mvwgetnstr {
	    my($win,$y,$x,$str,$n) = @_;
    	    eval q(( &wmove(($win),($y),($x)) ==  &ERR ?  &ERR :  &wgetnstr(($win),($str),($n))));
	}' unless defined(&mvwgetnstr);
	eval 'sub mvwgetstr {
	    my($win,$y,$x,$str) = @_;
    	    eval q(( &wmove(($win),($y),($x)) ==  &ERR ?  &ERR :  &wgetstr(($win),($str))));
	}' unless defined(&mvwgetstr);
	eval 'sub mvwhline {
	    my($win,$y,$x,$c,$n) = @_;
    	    eval q(( &wmove(($win),($y),($x)) ==  &ERR ?  &ERR :  &whline(($win),($c),($n))));
	}' unless defined(&mvwhline);
	eval 'sub mvwinch {
	    my($win,$y,$x) = @_;
    	    eval q(( &wmove(($win),($y),($x)) ==  &ERR ?  &NCURSES_CAST( &chtype,  &ERR) :  &winch($win)));
	}' unless defined(&mvwinch);
	eval 'sub mvwinchnstr {
	    my($win,$y,$x,$s,$n) = @_;
    	    eval q(( &wmove(($win),($y),($x)) ==  &ERR ?  &ERR :  &winchnstr(($win),($s),($n))));
	}' unless defined(&mvwinchnstr);
	eval 'sub mvwinchstr {
	    my($win,$y,$x,$s) = @_;
    	    eval q(( &wmove(($win),($y),($x)) ==  &ERR ?  &ERR :  &winchstr(($win),($s))));
	}' unless defined(&mvwinchstr);
	eval 'sub mvwinnstr {
	    my($win,$y,$x,$s,$n) = @_;
    	    eval q(( &wmove(($win),($y),($x)) ==  &ERR ?  &ERR :  &winnstr(($win),($s),($n))));
	}' unless defined(&mvwinnstr);
	eval 'sub mvwinsch {
	    my($win,$y,$x,$c) = @_;
    	    eval q(( &wmove(($win),($y),($x)) ==  &ERR ?  &ERR :  &winsch(($win),($c))));
	}' unless defined(&mvwinsch);
	eval 'sub mvwinsnstr {
	    my($win,$y,$x,$s,$n) = @_;
    	    eval q(( &wmove(($win),($y),($x)) ==  &ERR ?  &ERR :  &winsnstr(($win),($s),($n))));
	}' unless defined(&mvwinsnstr);
	eval 'sub mvwinsstr {
	    my($win,$y,$x,$s) = @_;
    	    eval q(( &wmove(($win),($y),($x)) ==  &ERR ?  &ERR :  &winsstr(($win),($s))));
	}' unless defined(&mvwinsstr);
	eval 'sub mvwinstr {
	    my($win,$y,$x,$s) = @_;
    	    eval q(( &wmove(($win),($y),($x)) ==  &ERR ?  &ERR :  &winstr(($win),($s))));
	}' unless defined(&mvwinstr);
	eval 'sub mvwvline {
	    my($win,$y,$x,$c,$n) = @_;
    	    eval q(( &wmove(($win),($y),($x)) ==  &ERR ?  &ERR :  &wvline(($win),($c),($n))));
	}' unless defined(&mvwvline);
	eval 'sub mvaddch {
	    my($y,$x,$ch) = @_;
    	    eval q( &mvwaddch( &stdscr,($y),($x),($ch)));
	}' unless defined(&mvaddch);
	eval 'sub mvaddchnstr {
	    my($y,$x,$str,$n) = @_;
    	    eval q( &mvwaddchnstr( &stdscr,($y),($x),($str),($n)));
	}' unless defined(&mvaddchnstr);
	eval 'sub mvaddchstr {
	    my($y,$x,$str) = @_;
    	    eval q( &mvwaddchstr( &stdscr,($y),($x),($str)));
	}' unless defined(&mvaddchstr);
	eval 'sub mvaddnstr {
	    my($y,$x,$str,$n) = @_;
    	    eval q( &mvwaddnstr( &stdscr,($y),($x),($str),($n)));
	}' unless defined(&mvaddnstr);
	eval 'sub mvaddstr {
	    my($y,$x,$str) = @_;
    	    eval q( &mvwaddstr( &stdscr,($y),($x),($str)));
	}' unless defined(&mvaddstr);
	eval 'sub mvchgat {
	    my($y,$x,$n,$a,$c,$o) = @_;
    	    eval q( &mvwchgat( &stdscr,($y),($x),($n),($a),($c),($o)));
	}' unless defined(&mvchgat);
	eval 'sub mvdelch {
	    my($y,$x) = @_;
    	    eval q( &mvwdelch( &stdscr,($y),($x)));
	}' unless defined(&mvdelch);
	eval 'sub mvgetch {
	    my($y,$x) = @_;
    	    eval q( &mvwgetch( &stdscr,($y),($x)));
	}' unless defined(&mvgetch);
	eval 'sub mvgetnstr {
	    my($y,$x,$str,$n) = @_;
    	    eval q( &mvwgetnstr( &stdscr,($y),($x),($str),($n)));
	}' unless defined(&mvgetnstr);
	eval 'sub mvgetstr {
	    my($y,$x,$str) = @_;
    	    eval q( &mvwgetstr( &stdscr,($y),($x),($str)));
	}' unless defined(&mvgetstr);
	eval 'sub mvhline {
	    my($y,$x,$c,$n) = @_;
    	    eval q( &mvwhline( &stdscr,($y),($x),($c),($n)));
	}' unless defined(&mvhline);
	eval 'sub mvinch {
	    my($y,$x) = @_;
    	    eval q( &mvwinch( &stdscr,($y),($x)));
	}' unless defined(&mvinch);
	eval 'sub mvinchnstr {
	    my($y,$x,$s,$n) = @_;
    	    eval q( &mvwinchnstr( &stdscr,($y),($x),($s),($n)));
	}' unless defined(&mvinchnstr);
	eval 'sub mvinchstr {
	    my($y,$x,$s) = @_;
    	    eval q( &mvwinchstr( &stdscr,($y),($x),($s)));
	}' unless defined(&mvinchstr);
	eval 'sub mvinnstr {
	    my($y,$x,$s,$n) = @_;
    	    eval q( &mvwinnstr( &stdscr,($y),($x),($s),($n)));
	}' unless defined(&mvinnstr);
	eval 'sub mvinsch {
	    my($y,$x,$c) = @_;
    	    eval q( &mvwinsch( &stdscr,($y),($x),($c)));
	}' unless defined(&mvinsch);
	eval 'sub mvinsnstr {
	    my($y,$x,$s,$n) = @_;
    	    eval q( &mvwinsnstr( &stdscr,($y),($x),($s),($n)));
	}' unless defined(&mvinsnstr);
	eval 'sub mvinsstr {
	    my($y,$x,$s) = @_;
    	    eval q( &mvwinsstr( &stdscr,($y),($x),($s)));
	}' unless defined(&mvinsstr);
	eval 'sub mvinstr {
	    my($y,$x,$s) = @_;
    	    eval q( &mvwinstr( &stdscr,($y),($x),($s)));
	}' unless defined(&mvinstr);
	eval 'sub mvvline {
	    my($y,$x,$c,$n) = @_;
    	    eval q( &mvwvline( &stdscr,($y),($x),($c),($n)));
	}' unless defined(&mvvline);
	if(!(defined(&NCURSES_OPAQUE) ? &NCURSES_OPAQUE : undef)) {
	    eval 'sub getbkgd {
	        my($win) = @_;
    		eval q(( &NCURSES_OK_ADDR($win) ? (($win)-> &_bkgd) : 0));
	    }' unless defined(&getbkgd);
	}
	eval 'sub slk_attr_off {
	    my($a,$v) = @_;
    	    eval q((($v) ?  &ERR :  &slk_attroff($a)));
	}' unless defined(&slk_attr_off);
	eval 'sub slk_attr_on {
	    my($a,$v) = @_;
    	    eval q((($v) ?  &ERR :  &slk_attron($a)));
	}' unless defined(&slk_attr_on);
	if(!(defined(&NCURSES_OPAQUE) ? &NCURSES_OPAQUE : undef)) {
	    if((defined(&NCURSES_WATTR_MACROS) ? &NCURSES_WATTR_MACROS : undef)) {
		if((defined(&NCURSES_WIDECHAR) ? &NCURSES_WIDECHAR : undef)  && 1) {
		    eval 'sub wattr_set {
		        my($win,$a,$p,$opts) = @_;
    			eval q(( &NCURSES_OK_ADDR($win) ? (( &void)(-> &_attrs = ( & ~ &A_COLOR), -> &_color = ? *($opts) : ($p)),  &OK) :  &ERR));
		    }' unless defined(&wattr_set);
		    eval 'sub wattr_get {
		        my($win,$a,$p,$opts) = @_;
    			eval q(( &NCURSES_OK_ADDR($win) ? (( &void)( &NCURSES_OK_ADDR($a) ? (*($a) = ($win)-> &_attrs) :  &OK), ( &void)( &NCURSES_OK_ADDR($p) ? (*($p) = ( &NCURSES_PAIRS_T) ($win)-> &_color) :  &OK), ( &void)( &NCURSES_OK_ADDR ? (*($opts) = ($win)-> &_color) :  &OK),  &OK) :  &ERR));
		    }' unless defined(&wattr_get);
		} else {
		    eval 'sub wattr_set {
		        my($win,$a,$p,$opts) = @_;
    			eval q(( &NCURSES_OK_ADDR($win) ? (( &void)(($win)-> &_attrs = ((($a) & ~ &A_COLOR) | ( &attr_t) &COLOR_PAIR($p))),  &OK) :  &ERR));
		    }' unless defined(&wattr_set);
		    eval 'sub wattr_get {
		        my($win,$a,$p,$opts) = @_;
    			eval q(( &NCURSES_OK_ADDR($win) ? (( &void)( &NCURSES_OK_ADDR($a) ? (*($a) = ($win)-> &_attrs) :  &OK), ( &void)( &NCURSES_OK_ADDR($p) ? (*($p) = ( &NCURSES_PAIRS_T)  &PAIR_NUMBER(($win)-> &_attrs)) :  &OK),  &OK) :  &ERR));
		    }' unless defined(&wattr_get);
		}
	    }
	}
	if(!1) {
	    eval 'sub vsscanf {
	        my($a,$b,$c) = @_;
    		eval q( &_nc_vsscanf($a,$b,$c));
	    }' unless defined(&vsscanf);
	}
	if(1) {
	    if(!(defined(&NCURSES_OPAQUE) ? &NCURSES_OPAQUE : undef)) {
		eval 'sub is_cleared {
		    my($win) = @_;
    		    eval q(( &NCURSES_OK_ADDR($win) ? ($win)-> &_clear :  &FALSE));
		}' unless defined(&is_cleared);
		eval 'sub is_idcok {
		    my($win) = @_;
    		    eval q(( &NCURSES_OK_ADDR($win) ? ($win)-> &_idcok :  &FALSE));
		}' unless defined(&is_idcok);
		eval 'sub is_idlok {
		    my($win) = @_;
    		    eval q(( &NCURSES_OK_ADDR($win) ? ($win)-> &_idlok :  &FALSE));
		}' unless defined(&is_idlok);
		eval 'sub is_immedok {
		    my($win) = @_;
    		    eval q(( &NCURSES_OK_ADDR($win) ? ($win)-> &_immed :  &FALSE));
		}' unless defined(&is_immedok);
		eval 'sub is_keypad {
		    my($win) = @_;
    		    eval q(( &NCURSES_OK_ADDR($win) ? ($win)-> &_use_keypad :  &FALSE));
		}' unless defined(&is_keypad);
		eval 'sub is_leaveok {
		    my($win) = @_;
    		    eval q(( &NCURSES_OK_ADDR($win) ? ($win)-> &_leaveok :  &FALSE));
		}' unless defined(&is_leaveok);
		eval 'sub is_nodelay {
		    my($win) = @_;
    		    eval q(( &NCURSES_OK_ADDR($win) ? (($win)-> &_delay == 0) :  &FALSE));
		}' unless defined(&is_nodelay);
		eval 'sub is_notimeout {
		    my($win) = @_;
    		    eval q(( &NCURSES_OK_ADDR($win) ? ($win)-> &_notimeout :  &FALSE));
		}' unless defined(&is_notimeout);
		eval 'sub is_pad {
		    my($win) = @_;
    		    eval q(( &NCURSES_OK_ADDR($win) ? (($win)-> &_flags &  &_ISPAD) != 0:  &FALSE));
		}' unless defined(&is_pad);
		eval 'sub is_scrollok {
		    my($win) = @_;
    		    eval q(( &NCURSES_OK_ADDR($win) ? ($win)-> &_scroll :  &FALSE));
		}' unless defined(&is_scrollok);
		eval 'sub is_subwin {
		    my($win) = @_;
    		    eval q(( &NCURSES_OK_ADDR($win) ? (($win)-> &_flags &  &_SUBWIN) != 0:  &FALSE));
		}' unless defined(&is_subwin);
		eval 'sub is_syncok {
		    my($win) = @_;
    		    eval q(( &NCURSES_OK_ADDR($win) ? ($win)-> &_sync :  &FALSE));
		}' unless defined(&is_syncok);
		eval 'sub wgetdelay {
		    my($win) = @_;
    		    eval q(( &NCURSES_OK_ADDR($win) ? ($win)-> &_delay : 0));
		}' unless defined(&wgetdelay);
		eval 'sub wgetparent {
		    my($win) = @_;
    		    eval q(( &NCURSES_OK_ADDR($win) ? ($win)-> &_parent : 0));
		}' unless defined(&wgetparent);
		eval 'sub wgetscrreg {
		    my($win,$t,$b) = @_;
    		    eval q(( &NCURSES_OK_ADDR($win) ? (*($t) = ($win)-> &_regtop, *($b) = ($win)-> &_regbottom,  &OK) :  &ERR));
		}' unless defined(&wgetscrreg);
	    }
	}
	eval 'sub is_linetouched {
	    my($w,$l) = @_;
    	    eval q(((!($w) || (($l) >  &getmaxy($w)) || (($l) < 0)) ?  &ERR : ( &is_linetouched)(($w),($l))));
	}' unless defined(&is_linetouched);
    }
    if((defined(&NCURSES_REENTRANT) ? &NCURSES_REENTRANT : undef)) {
	eval 'sub curscr () { &NCURSES_PUBLIC_VAR( &curscr());}' unless defined(&curscr);
	eval 'sub newscr () { &NCURSES_PUBLIC_VAR( &newscr());}' unless defined(&newscr);
	eval 'sub stdscr () { &NCURSES_PUBLIC_VAR( &stdscr());}' unless defined(&stdscr);
	eval 'sub ttytype () { &NCURSES_PUBLIC_VAR( &ttytype());}' unless defined(&ttytype);
	eval 'sub COLORS () { &NCURSES_PUBLIC_VAR( &COLORS());}' unless defined(&COLORS);
	eval 'sub COLOR_PAIRS () { &NCURSES_PUBLIC_VAR( &COLOR_PAIRS());}' unless defined(&COLOR_PAIRS);
	eval 'sub COLS () { &NCURSES_PUBLIC_VAR( &COLS());}' unless defined(&COLS);
	eval 'sub ESCDELAY () { &NCURSES_PUBLIC_VAR( &ESCDELAY());}' unless defined(&ESCDELAY);
	eval 'sub LINES () { &NCURSES_PUBLIC_VAR( &LINES());}' unless defined(&LINES);
	eval 'sub TABSIZE () { &NCURSES_PUBLIC_VAR( &TABSIZE());}' unless defined(&TABSIZE);
    } else {
    }
    eval 'sub KEY_CODE_YES () {0400;}' unless defined(&KEY_CODE_YES);
    eval 'sub KEY_MIN () {0401;}' unless defined(&KEY_MIN);
    eval 'sub KEY_BREAK () {0401;}' unless defined(&KEY_BREAK);
    eval 'sub KEY_SRESET () {0530;}' unless defined(&KEY_SRESET);
    eval 'sub KEY_RESET () {0531;}' unless defined(&KEY_RESET);
    eval 'sub KEY_DOWN () {0402;}' unless defined(&KEY_DOWN);
    eval 'sub KEY_UP () {0403;}' unless defined(&KEY_UP);
    eval 'sub KEY_LEFT () {0404;}' unless defined(&KEY_LEFT);
    eval 'sub KEY_RIGHT () {0405;}' unless defined(&KEY_RIGHT);
    eval 'sub KEY_HOME () {0406;}' unless defined(&KEY_HOME);
    eval 'sub KEY_BACKSPACE () {0407;}' unless defined(&KEY_BACKSPACE);
    eval 'sub KEY_F0 () {0410;}' unless defined(&KEY_F0);
    eval 'sub KEY_F {
        my($n) = @_;
	    eval q(( &KEY_F0+($n)));
    }' unless defined(&KEY_F);
    eval 'sub KEY_DL () {0510;}' unless defined(&KEY_DL);
    eval 'sub KEY_IL () {0511;}' unless defined(&KEY_IL);
    eval 'sub KEY_DC () {0512;}' unless defined(&KEY_DC);
    eval 'sub KEY_IC () {0513;}' unless defined(&KEY_IC);
    eval 'sub KEY_EIC () {0514;}' unless defined(&KEY_EIC);
    eval 'sub KEY_CLEAR () {0515;}' unless defined(&KEY_CLEAR);
    eval 'sub KEY_EOS () {0516;}' unless defined(&KEY_EOS);
    eval 'sub KEY_EOL () {0517;}' unless defined(&KEY_EOL);
    eval 'sub KEY_SF () {0520;}' unless defined(&KEY_SF);
    eval 'sub KEY_SR () {0521;}' unless defined(&KEY_SR);
    eval 'sub KEY_NPAGE () {0522;}' unless defined(&KEY_NPAGE);
    eval 'sub KEY_PPAGE () {0523;}' unless defined(&KEY_PPAGE);
    eval 'sub KEY_STAB () {0524;}' unless defined(&KEY_STAB);
    eval 'sub KEY_CTAB () {0525;}' unless defined(&KEY_CTAB);
    eval 'sub KEY_CATAB () {0526;}' unless defined(&KEY_CATAB);
    eval 'sub KEY_ENTER () {0527;}' unless defined(&KEY_ENTER);
    eval 'sub KEY_PRINT () {0532;}' unless defined(&KEY_PRINT);
    eval 'sub KEY_LL () {0533;}' unless defined(&KEY_LL);
    eval 'sub KEY_A1 () {0534;}' unless defined(&KEY_A1);
    eval 'sub KEY_A3 () {0535;}' unless defined(&KEY_A3);
    eval 'sub KEY_B2 () {0536;}' unless defined(&KEY_B2);
    eval 'sub KEY_C1 () {0537;}' unless defined(&KEY_C1);
    eval 'sub KEY_C3 () {0540;}' unless defined(&KEY_C3);
    eval 'sub KEY_BTAB () {0541;}' unless defined(&KEY_BTAB);
    eval 'sub KEY_BEG () {0542;}' unless defined(&KEY_BEG);
    eval 'sub KEY_CANCEL () {0543;}' unless defined(&KEY_CANCEL);
    eval 'sub KEY_CLOSE () {0544;}' unless defined(&KEY_CLOSE);
    eval 'sub KEY_COMMAND () {0545;}' unless defined(&KEY_COMMAND);
    eval 'sub KEY_COPY () {0546;}' unless defined(&KEY_COPY);
    eval 'sub KEY_CREATE () {0547;}' unless defined(&KEY_CREATE);
    eval 'sub KEY_END () {0550;}' unless defined(&KEY_END);
    eval 'sub KEY_EXIT () {0551;}' unless defined(&KEY_EXIT);
    eval 'sub KEY_FIND () {0552;}' unless defined(&KEY_FIND);
    eval 'sub KEY_HELP () {0553;}' unless defined(&KEY_HELP);
    eval 'sub KEY_MARK () {0554;}' unless defined(&KEY_MARK);
    eval 'sub KEY_MESSAGE () {0555;}' unless defined(&KEY_MESSAGE);
    eval 'sub KEY_MOVE () {0556;}' unless defined(&KEY_MOVE);
    eval 'sub KEY_NEXT () {0557;}' unless defined(&KEY_NEXT);
    eval 'sub KEY_OPEN () {0560;}' unless defined(&KEY_OPEN);
    eval 'sub KEY_OPTIONS () {0561;}' unless defined(&KEY_OPTIONS);
    eval 'sub KEY_PREVIOUS () {0562;}' unless defined(&KEY_PREVIOUS);
    eval 'sub KEY_REDO () {0563;}' unless defined(&KEY_REDO);
    eval 'sub KEY_REFERENCE () {0564;}' unless defined(&KEY_REFERENCE);
    eval 'sub KEY_REFRESH () {0565;}' unless defined(&KEY_REFRESH);
    eval 'sub KEY_REPLACE () {0566;}' unless defined(&KEY_REPLACE);
    eval 'sub KEY_RESTART () {0567;}' unless defined(&KEY_RESTART);
    eval 'sub KEY_RESUME () {0570;}' unless defined(&KEY_RESUME);
    eval 'sub KEY_SAVE () {0571;}' unless defined(&KEY_SAVE);
    eval 'sub KEY_SBEG () {0572;}' unless defined(&KEY_SBEG);
    eval 'sub KEY_SCANCEL () {0573;}' unless defined(&KEY_SCANCEL);
    eval 'sub KEY_SCOMMAND () {0574;}' unless defined(&KEY_SCOMMAND);
    eval 'sub KEY_SCOPY () {0575;}' unless defined(&KEY_SCOPY);
    eval 'sub KEY_SCREATE () {0576;}' unless defined(&KEY_SCREATE);
    eval 'sub KEY_SDC () {0577;}' unless defined(&KEY_SDC);
    eval 'sub KEY_SDL () {0600;}' unless defined(&KEY_SDL);
    eval 'sub KEY_SELECT () {0601;}' unless defined(&KEY_SELECT);
    eval 'sub KEY_SEND () {0602;}' unless defined(&KEY_SEND);
    eval 'sub KEY_SEOL () {0603;}' unless defined(&KEY_SEOL);
    eval 'sub KEY_SEXIT () {0604;}' unless defined(&KEY_SEXIT);
    eval 'sub KEY_SFIND () {0605;}' unless defined(&KEY_SFIND);
    eval 'sub KEY_SHELP () {0606;}' unless defined(&KEY_SHELP);
    eval 'sub KEY_SHOME () {0607;}' unless defined(&KEY_SHOME);
    eval 'sub KEY_SIC () {0610;}' unless defined(&KEY_SIC);
    eval 'sub KEY_SLEFT () {0611;}' unless defined(&KEY_SLEFT);
    eval 'sub KEY_SMESSAGE () {0612;}' unless defined(&KEY_SMESSAGE);
    eval 'sub KEY_SMOVE () {0613;}' unless defined(&KEY_SMOVE);
    eval 'sub KEY_SNEXT () {0614;}' unless defined(&KEY_SNEXT);
    eval 'sub KEY_SOPTIONS () {0615;}' unless defined(&KEY_SOPTIONS);
    eval 'sub KEY_SPREVIOUS () {0616;}' unless defined(&KEY_SPREVIOUS);
    eval 'sub KEY_SPRINT () {0617;}' unless defined(&KEY_SPRINT);
    eval 'sub KEY_SREDO () {0620;}' unless defined(&KEY_SREDO);
    eval 'sub KEY_SREPLACE () {0621;}' unless defined(&KEY_SREPLACE);
    eval 'sub KEY_SRIGHT () {0622;}' unless defined(&KEY_SRIGHT);
    eval 'sub KEY_SRSUME () {0623;}' unless defined(&KEY_SRSUME);
    eval 'sub KEY_SSAVE () {0624;}' unless defined(&KEY_SSAVE);
    eval 'sub KEY_SSUSPEND () {0625;}' unless defined(&KEY_SSUSPEND);
    eval 'sub KEY_SUNDO () {0626;}' unless defined(&KEY_SUNDO);
    eval 'sub KEY_SUSPEND () {0627;}' unless defined(&KEY_SUSPEND);
    eval 'sub KEY_UNDO () {0630;}' unless defined(&KEY_UNDO);
    eval 'sub KEY_MOUSE () {0631;}' unless defined(&KEY_MOUSE);
    if(defined(&NCURSES_EXT_FUNCS)) {
	eval 'sub KEY_RESIZE () {0632;}' unless defined(&KEY_RESIZE);
    }
    eval 'sub KEY_MAX () {0777;}' unless defined(&KEY_MAX);
    eval 'sub _XOPEN_CURSES () {1;}' unless defined(&_XOPEN_CURSES);
    if((defined(&NCURSES_WIDECHAR) ? &NCURSES_WIDECHAR : undef)) {
	eval 'sub NCURSES_WACS {
	    my($c) = @_;
    	    eval q((& $_nc_wacs[ &NCURSES_CAST(\'unsigned char\',($c))]));
	}' unless defined(&NCURSES_WACS);
	eval 'sub WACS_BSSB () { &NCURSES_WACS(ord(\'l\'));}' unless defined(&WACS_BSSB);
	eval 'sub WACS_SSBB () { &NCURSES_WACS(ord(\'m\'));}' unless defined(&WACS_SSBB);
	eval 'sub WACS_BBSS () { &NCURSES_WACS(ord(\'k\'));}' unless defined(&WACS_BBSS);
	eval 'sub WACS_SBBS () { &NCURSES_WACS(ord(\'j\'));}' unless defined(&WACS_SBBS);
	eval 'sub WACS_SBSS () { &NCURSES_WACS(ord(\'u\'));}' unless defined(&WACS_SBSS);
	eval 'sub WACS_SSSB () { &NCURSES_WACS(ord(\'t\'));}' unless defined(&WACS_SSSB);
	eval 'sub WACS_SSBS () { &NCURSES_WACS(ord(\'v\'));}' unless defined(&WACS_SSBS);
	eval 'sub WACS_BSSS () { &NCURSES_WACS(ord(\'w\'));}' unless defined(&WACS_BSSS);
	eval 'sub WACS_BSBS () { &NCURSES_WACS(ord(\'q\'));}' unless defined(&WACS_BSBS);
	eval 'sub WACS_SBSB () { &NCURSES_WACS(ord(\'x\'));}' unless defined(&WACS_SBSB);
	eval 'sub WACS_SSSS () { &NCURSES_WACS(ord(\'n\'));}' unless defined(&WACS_SSSS);
	eval 'sub WACS_ULCORNER () { &WACS_BSSB;}' unless defined(&WACS_ULCORNER);
	eval 'sub WACS_LLCORNER () { &WACS_SSBB;}' unless defined(&WACS_LLCORNER);
	eval 'sub WACS_URCORNER () { &WACS_BBSS;}' unless defined(&WACS_URCORNER);
	eval 'sub WACS_LRCORNER () { &WACS_SBBS;}' unless defined(&WACS_LRCORNER);
	eval 'sub WACS_RTEE () { &WACS_SBSS;}' unless defined(&WACS_RTEE);
	eval 'sub WACS_LTEE () { &WACS_SSSB;}' unless defined(&WACS_LTEE);
	eval 'sub WACS_BTEE () { &WACS_SSBS;}' unless defined(&WACS_BTEE);
	eval 'sub WACS_TTEE () { &WACS_BSSS;}' unless defined(&WACS_TTEE);
	eval 'sub WACS_HLINE () { &WACS_BSBS;}' unless defined(&WACS_HLINE);
	eval 'sub WACS_VLINE () { &WACS_SBSB;}' unless defined(&WACS_VLINE);
	eval 'sub WACS_PLUS () { &WACS_SSSS;}' unless defined(&WACS_PLUS);
	eval 'sub WACS_S1 () { &NCURSES_WACS(ord(\'o\'));}' unless defined(&WACS_S1);
	eval 'sub WACS_S9 () { &NCURSES_WACS(ord(\'s\'));}' unless defined(&WACS_S9);
	eval 'sub WACS_DIAMOND () { &NCURSES_WACS(ord(\'`\'));}' unless defined(&WACS_DIAMOND);
	eval 'sub WACS_CKBOARD () { &NCURSES_WACS(ord(\'a\'));}' unless defined(&WACS_CKBOARD);
	eval 'sub WACS_DEGREE () { &NCURSES_WACS(ord(\'f\'));}' unless defined(&WACS_DEGREE);
	eval 'sub WACS_PLMINUS () { &NCURSES_WACS(ord(\'g\'));}' unless defined(&WACS_PLMINUS);
	eval 'sub WACS_BULLET () { &NCURSES_WACS(ord(\'~\'));}' unless defined(&WACS_BULLET);
	eval 'sub WACS_LARROW () { &NCURSES_WACS(ord(\',\'));}' unless defined(&WACS_LARROW);
	eval 'sub WACS_RARROW () { &NCURSES_WACS(ord(\'+\'));}' unless defined(&WACS_RARROW);
	eval 'sub WACS_DARROW () { &NCURSES_WACS(ord(\'.\'));}' unless defined(&WACS_DARROW);
	eval 'sub WACS_UARROW () { &NCURSES_WACS(ord(\'-\'));}' unless defined(&WACS_UARROW);
	eval 'sub WACS_BOARD () { &NCURSES_WACS(ord(\'h\'));}' unless defined(&WACS_BOARD);
	eval 'sub WACS_LANTERN () { &NCURSES_WACS(ord(\'i\'));}' unless defined(&WACS_LANTERN);
	eval 'sub WACS_BLOCK () { &NCURSES_WACS(ord(\'0\'));}' unless defined(&WACS_BLOCK);
	eval 'sub WACS_S3 () { &NCURSES_WACS(ord(\'p\'));}' unless defined(&WACS_S3);
	eval 'sub WACS_S7 () { &NCURSES_WACS(ord(\'r\'));}' unless defined(&WACS_S7);
	eval 'sub WACS_LEQUAL () { &NCURSES_WACS(ord(\'y\'));}' unless defined(&WACS_LEQUAL);
	eval 'sub WACS_GEQUAL () { &NCURSES_WACS(ord(\'z\'));}' unless defined(&WACS_GEQUAL);
	eval 'sub WACS_PI () { &NCURSES_WACS(ord(\'{\'));}' unless defined(&WACS_PI);
	eval 'sub WACS_NEQUAL () { &NCURSES_WACS(ord(\'|\'));}' unless defined(&WACS_NEQUAL);
	eval 'sub WACS_STERLING () { &NCURSES_WACS(ord(\'}\'));}' unless defined(&WACS_STERLING);
	eval 'sub WACS_BDDB () { &NCURSES_WACS(ord(\'C\'));}' unless defined(&WACS_BDDB);
	eval 'sub WACS_DDBB () { &NCURSES_WACS(ord(\'D\'));}' unless defined(&WACS_DDBB);
	eval 'sub WACS_BBDD () { &NCURSES_WACS(ord(\'B\'));}' unless defined(&WACS_BBDD);
	eval 'sub WACS_DBBD () { &NCURSES_WACS(ord(\'A\'));}' unless defined(&WACS_DBBD);
	eval 'sub WACS_DBDD () { &NCURSES_WACS(ord(\'G\'));}' unless defined(&WACS_DBDD);
	eval 'sub WACS_DDDB () { &NCURSES_WACS(ord(\'F\'));}' unless defined(&WACS_DDDB);
	eval 'sub WACS_DDBD () { &NCURSES_WACS(ord(\'H\'));}' unless defined(&WACS_DDBD);
	eval 'sub WACS_BDDD () { &NCURSES_WACS(ord(\'I\'));}' unless defined(&WACS_BDDD);
	eval 'sub WACS_BDBD () { &NCURSES_WACS(ord(\'R\'));}' unless defined(&WACS_BDBD);
	eval 'sub WACS_DBDB () { &NCURSES_WACS(ord(\'Y\'));}' unless defined(&WACS_DBDB);
	eval 'sub WACS_DDDD () { &NCURSES_WACS(ord(\'E\'));}' unless defined(&WACS_DDDD);
	eval 'sub WACS_D_ULCORNER () { &WACS_BDDB;}' unless defined(&WACS_D_ULCORNER);
	eval 'sub WACS_D_LLCORNER () { &WACS_DDBB;}' unless defined(&WACS_D_LLCORNER);
	eval 'sub WACS_D_URCORNER () { &WACS_BBDD;}' unless defined(&WACS_D_URCORNER);
	eval 'sub WACS_D_LRCORNER () { &WACS_DBBD;}' unless defined(&WACS_D_LRCORNER);
	eval 'sub WACS_D_RTEE () { &WACS_DBDD;}' unless defined(&WACS_D_RTEE);
	eval 'sub WACS_D_LTEE () { &WACS_DDDB;}' unless defined(&WACS_D_LTEE);
	eval 'sub WACS_D_BTEE () { &WACS_DDBD;}' unless defined(&WACS_D_BTEE);
	eval 'sub WACS_D_TTEE () { &WACS_BDDD;}' unless defined(&WACS_D_TTEE);
	eval 'sub WACS_D_HLINE () { &WACS_BDBD;}' unless defined(&WACS_D_HLINE);
	eval 'sub WACS_D_VLINE () { &WACS_DBDB;}' unless defined(&WACS_D_VLINE);
	eval 'sub WACS_D_PLUS () { &WACS_DDDD;}' unless defined(&WACS_D_PLUS);
	eval 'sub WACS_BTTB () { &NCURSES_WACS(ord(\'L\'));}' unless defined(&WACS_BTTB);
	eval 'sub WACS_TTBB () { &NCURSES_WACS(ord(\'M\'));}' unless defined(&WACS_TTBB);
	eval 'sub WACS_BBTT () { &NCURSES_WACS(ord(\'K\'));}' unless defined(&WACS_BBTT);
	eval 'sub WACS_TBBT () { &NCURSES_WACS(ord(\'J\'));}' unless defined(&WACS_TBBT);
	eval 'sub WACS_TBTT () { &NCURSES_WACS(ord(\'U\'));}' unless defined(&WACS_TBTT);
	eval 'sub WACS_TTTB () { &NCURSES_WACS(ord(\'T\'));}' unless defined(&WACS_TTTB);
	eval 'sub WACS_TTBT () { &NCURSES_WACS(ord(\'V\'));}' unless defined(&WACS_TTBT);
	eval 'sub WACS_BTTT () { &NCURSES_WACS(ord(\'W\'));}' unless defined(&WACS_BTTT);
	eval 'sub WACS_BTBT () { &NCURSES_WACS(ord(\'Q\'));}' unless defined(&WACS_BTBT);
	eval 'sub WACS_TBTB () { &NCURSES_WACS(ord(\'X\'));}' unless defined(&WACS_TBTB);
	eval 'sub WACS_TTTT () { &NCURSES_WACS(ord(\'N\'));}' unless defined(&WACS_TTTT);
	eval 'sub WACS_T_ULCORNER () { &WACS_BTTB;}' unless defined(&WACS_T_ULCORNER);
	eval 'sub WACS_T_LLCORNER () { &WACS_TTBB;}' unless defined(&WACS_T_LLCORNER);
	eval 'sub WACS_T_URCORNER () { &WACS_BBTT;}' unless defined(&WACS_T_URCORNER);
	eval 'sub WACS_T_LRCORNER () { &WACS_TBBT;}' unless defined(&WACS_T_LRCORNER);
	eval 'sub WACS_T_RTEE () { &WACS_TBTT;}' unless defined(&WACS_T_RTEE);
	eval 'sub WACS_T_LTEE () { &WACS_TTTB;}' unless defined(&WACS_T_LTEE);
	eval 'sub WACS_T_BTEE () { &WACS_TTBT;}' unless defined(&WACS_T_BTEE);
	eval 'sub WACS_T_TTEE () { &WACS_BTTT;}' unless defined(&WACS_T_TTEE);
	eval 'sub WACS_T_HLINE () { &WACS_BTBT;}' unless defined(&WACS_T_HLINE);
	eval 'sub WACS_T_VLINE () { &WACS_TBTB;}' unless defined(&WACS_T_VLINE);
	eval 'sub WACS_T_PLUS () { &WACS_TTTT;}' unless defined(&WACS_T_PLUS);
	if((defined(&NCURSES_SP_FUNCS) ? &NCURSES_SP_FUNCS : undef)) {
	}
	unless(defined(&NCURSES_NOMACROS)) {
	    eval 'sub add_wch {
	        my($c) = @_;
    		eval q( &wadd_wch( &stdscr,($c)));
	    }' unless defined(&add_wch);
	    eval 'sub add_wchnstr {
	        my($str,$n) = @_;
    		eval q( &wadd_wchnstr( &stdscr,($str),($n)));
	    }' unless defined(&add_wchnstr);
	    eval 'sub add_wchstr {
	        my($str) = @_;
    		eval q( &wadd_wchstr( &stdscr,($str)));
	    }' unless defined(&add_wchstr);
	    eval 'sub addnwstr {
	        my($wstr,$n) = @_;
    		eval q( &waddnwstr( &stdscr,($wstr),($n)));
	    }' unless defined(&addnwstr);
	    eval 'sub addwstr {
	        my($wstr) = @_;
    		eval q( &waddwstr( &stdscr,($wstr)));
	    }' unless defined(&addwstr);
	    eval 'sub bkgrnd {
	        my($c) = @_;
    		eval q( &wbkgrnd( &stdscr,($c)));
	    }' unless defined(&bkgrnd);
	    eval 'sub bkgrndset {
	        my($c) = @_;
    		eval q( &wbkgrndset( &stdscr,($c)));
	    }' unless defined(&bkgrndset);
	    eval 'sub border_set {
	        my($l,$r,$t,$b,$tl,$tr,$bl,$br) = @_;
    		eval q( &wborder_set( &stdscr,($l),($r),($t),($b),$tl,$tr,$bl,$br));
	    }' unless defined(&border_set);
	    eval 'sub box_set {
	        my($w,$v,$h) = @_;
    		eval q( &wborder_set(($w),($v),($v),($h),($h),0,0,0,0));
	    }' unless defined(&box_set);
	    eval 'sub echo_wchar {
	        my($c) = @_;
    		eval q( &wecho_wchar( &stdscr,($c)));
	    }' unless defined(&echo_wchar);
	    eval 'sub get_wch {
	        my($c) = @_;
    		eval q( &wget_wch( &stdscr,($c)));
	    }' unless defined(&get_wch);
	    eval 'sub get_wstr {
	        my($t) = @_;
    		eval q( &wget_wstr( &stdscr,($t)));
	    }' unless defined(&get_wstr);
	    eval 'sub getbkgrnd {
	        my($wch) = @_;
    		eval q( &wgetbkgrnd( &stdscr,($wch)));
	    }' unless defined(&getbkgrnd);
	    eval 'sub getn_wstr {
	        my($t,$n) = @_;
    		eval q( &wgetn_wstr( &stdscr,($t),($n)));
	    }' unless defined(&getn_wstr);
	    eval 'sub hline_set {
	        my($c,$n) = @_;
    		eval q( &whline_set( &stdscr,($c),($n)));
	    }' unless defined(&hline_set);
	    eval 'sub in_wch {
	        my($c) = @_;
    		eval q( &win_wch( &stdscr,($c)));
	    }' unless defined(&in_wch);
	    eval 'sub in_wchnstr {
	        my($c,$n) = @_;
    		eval q( &win_wchnstr( &stdscr,($c),($n)));
	    }' unless defined(&in_wchnstr);
	    eval 'sub in_wchstr {
	        my($c) = @_;
    		eval q( &win_wchstr( &stdscr,($c)));
	    }' unless defined(&in_wchstr);
	    eval 'sub innwstr {
	        my($c,$n) = @_;
    		eval q( &winnwstr( &stdscr,($c),($n)));
	    }' unless defined(&innwstr);
	    eval 'sub ins_nwstr {
	        my($t,$n) = @_;
    		eval q( &wins_nwstr( &stdscr,($t),($n)));
	    }' unless defined(&ins_nwstr);
	    eval 'sub ins_wch {
	        my($c) = @_;
    		eval q( &wins_wch( &stdscr,($c)));
	    }' unless defined(&ins_wch);
	    eval 'sub ins_wstr {
	        my($t) = @_;
    		eval q( &wins_wstr( &stdscr,($t)));
	    }' unless defined(&ins_wstr);
	    eval 'sub inwstr {
	        my($c) = @_;
    		eval q( &winwstr( &stdscr,($c)));
	    }' unless defined(&inwstr);
	    eval 'sub vline_set {
	        my($c,$n) = @_;
    		eval q( &wvline_set( &stdscr,($c),($n)));
	    }' unless defined(&vline_set);
	    eval 'sub wadd_wchstr {
	        my($win,$str) = @_;
    		eval q( &wadd_wchnstr(($win),($str),-1));
	    }' unless defined(&wadd_wchstr);
	    eval 'sub waddwstr {
	        my($win,$wstr) = @_;
    		eval q( &waddnwstr(($win),($wstr),-1));
	    }' unless defined(&waddwstr);
	    eval 'sub wget_wstr {
	        my($w,$t) = @_;
    		eval q( &wgetn_wstr(($w),($t),-1));
	    }' unless defined(&wget_wstr);
	    eval 'sub win_wchstr {
	        my($w,$c) = @_;
    		eval q( &win_wchnstr(($w),($c),-1));
	    }' unless defined(&win_wchstr);
	    eval 'sub wins_wstr {
	        my($w,$t) = @_;
    		eval q( &wins_nwstr(($w),($t),-1));
	    }' unless defined(&wins_wstr);
	    if(!(defined(&NCURSES_OPAQUE) ? &NCURSES_OPAQUE : undef)) {
		eval 'sub wgetbkgrnd {
		    my($win,$wch) = @_;
    		    eval q(( &NCURSES_OK_ADDR($wch) ? (($win) ? (*($wch) = ($win)-> &_bkgrnd) : *($wch),  &OK) :  &ERR));
		}' unless defined(&wgetbkgrnd);
	    }
	    eval 'sub mvadd_wch {
	        my($y,$x,$c) = @_;
    		eval q( &mvwadd_wch( &stdscr,($y),($x),($c)));
	    }' unless defined(&mvadd_wch);
	    eval 'sub mvadd_wchnstr {
	        my($y,$x,$s,$n) = @_;
    		eval q( &mvwadd_wchnstr( &stdscr,($y),($x),($s),($n)));
	    }' unless defined(&mvadd_wchnstr);
	    eval 'sub mvadd_wchstr {
	        my($y,$x,$s) = @_;
    		eval q( &mvwadd_wchstr( &stdscr,($y),($x),($s)));
	    }' unless defined(&mvadd_wchstr);
	    eval 'sub mvaddnwstr {
	        my($y,$x,$wstr,$n) = @_;
    		eval q( &mvwaddnwstr( &stdscr,($y),($x),($wstr),($n)));
	    }' unless defined(&mvaddnwstr);
	    eval 'sub mvaddwstr {
	        my($y,$x,$wstr) = @_;
    		eval q( &mvwaddwstr( &stdscr,($y),($x),($wstr)));
	    }' unless defined(&mvaddwstr);
	    eval 'sub mvget_wch {
	        my($y,$x,$c) = @_;
    		eval q( &mvwget_wch( &stdscr,($y),($x),($c)));
	    }' unless defined(&mvget_wch);
	    eval 'sub mvget_wstr {
	        my($y,$x,$t) = @_;
    		eval q( &mvwget_wstr( &stdscr,($y),($x),($t)));
	    }' unless defined(&mvget_wstr);
	    eval 'sub mvgetn_wstr {
	        my($y,$x,$t,$n) = @_;
    		eval q( &mvwgetn_wstr( &stdscr,($y),($x),($t),($n)));
	    }' unless defined(&mvgetn_wstr);
	    eval 'sub mvhline_set {
	        my($y,$x,$c,$n) = @_;
    		eval q( &mvwhline_set( &stdscr,($y),($x),($c),($n)));
	    }' unless defined(&mvhline_set);
	    eval 'sub mvin_wch {
	        my($y,$x,$c) = @_;
    		eval q( &mvwin_wch( &stdscr,($y),($x),($c)));
	    }' unless defined(&mvin_wch);
	    eval 'sub mvin_wchnstr {
	        my($y,$x,$c,$n) = @_;
    		eval q( &mvwin_wchnstr( &stdscr,($y),($x),($c),($n)));
	    }' unless defined(&mvin_wchnstr);
	    eval 'sub mvin_wchstr {
	        my($y,$x,$c) = @_;
    		eval q( &mvwin_wchstr( &stdscr,($y),($x),($c)));
	    }' unless defined(&mvin_wchstr);
	    eval 'sub mvinnwstr {
	        my($y,$x,$c,$n) = @_;
    		eval q( &mvwinnwstr( &stdscr,($y),($x),($c),($n)));
	    }' unless defined(&mvinnwstr);
	    eval 'sub mvins_nwstr {
	        my($y,$x,$t,$n) = @_;
    		eval q( &mvwins_nwstr( &stdscr,($y),($x),($t),($n)));
	    }' unless defined(&mvins_nwstr);
	    eval 'sub mvins_wch {
	        my($y,$x,$c) = @_;
    		eval q( &mvwins_wch( &stdscr,($y),($x),($c)));
	    }' unless defined(&mvins_wch);
	    eval 'sub mvins_wstr {
	        my($y,$x,$t) = @_;
    		eval q( &mvwins_wstr( &stdscr,($y),($x),($t)));
	    }' unless defined(&mvins_wstr);
	    eval 'sub mvinwstr {
	        my($y,$x,$c) = @_;
    		eval q( &mvwinwstr( &stdscr,($y),($x),($c)));
	    }' unless defined(&mvinwstr);
	    eval 'sub mvvline_set {
	        my($y,$x,$c,$n) = @_;
    		eval q( &mvwvline_set( &stdscr,($y),($x),($c),($n)));
	    }' unless defined(&mvvline_set);
	    eval 'sub mvwadd_wch {
	        my($win,$y,$x,$c) = @_;
    		eval q(( &wmove($win,($y),($x)) ==  &ERR ?  &ERR :  &wadd_wch(($win),($c))));
	    }' unless defined(&mvwadd_wch);
	    eval 'sub mvwadd_wchnstr {
	        my($win,$y,$x,$s,$n) = @_;
    		eval q(( &wmove($win,($y),($x)) ==  &ERR ?  &ERR :  &wadd_wchnstr(($win),($s),($n))));
	    }' unless defined(&mvwadd_wchnstr);
	    eval 'sub mvwadd_wchstr {
	        my($win,$y,$x,$s) = @_;
    		eval q(( &wmove($win,($y),($x)) ==  &ERR ?  &ERR :  &wadd_wchstr(($win),($s))));
	    }' unless defined(&mvwadd_wchstr);
	    eval 'sub mvwaddnwstr {
	        my($win,$y,$x,$wstr,$n) = @_;
    		eval q(( &wmove($win,($y),($x)) ==  &ERR ?  &ERR :  &waddnwstr(($win),($wstr),($n))));
	    }' unless defined(&mvwaddnwstr);
	    eval 'sub mvwaddwstr {
	        my($win,$y,$x,$wstr) = @_;
    		eval q(( &wmove($win,($y),($x)) ==  &ERR ?  &ERR :  &waddwstr(($win),($wstr))));
	    }' unless defined(&mvwaddwstr);
	    eval 'sub mvwget_wch {
	        my($win,$y,$x,$c) = @_;
    		eval q(( &wmove($win,($y),($x)) ==  &ERR ?  &ERR :  &wget_wch(($win),($c))));
	    }' unless defined(&mvwget_wch);
	    eval 'sub mvwget_wstr {
	        my($win,$y,$x,$t) = @_;
    		eval q(( &wmove($win,($y),($x)) ==  &ERR ?  &ERR :  &wget_wstr(($win),($t))));
	    }' unless defined(&mvwget_wstr);
	    eval 'sub mvwgetn_wstr {
	        my($win,$y,$x,$t,$n) = @_;
    		eval q(( &wmove($win,($y),($x)) ==  &ERR ?  &ERR :  &wgetn_wstr(($win),($t),($n))));
	    }' unless defined(&mvwgetn_wstr);
	    eval 'sub mvwhline_set {
	        my($win,$y,$x,$c,$n) = @_;
    		eval q(( &wmove($win,($y),($x)) ==  &ERR ?  &ERR :  &whline_set(($win),($c),($n))));
	    }' unless defined(&mvwhline_set);
	    eval 'sub mvwin_wch {
	        my($win,$y,$x,$c) = @_;
    		eval q(( &wmove($win,($y),($x)) ==  &ERR ?  &ERR :  &win_wch(($win),($c))));
	    }' unless defined(&mvwin_wch);
	    eval 'sub mvwin_wchnstr {
	        my($win,$y,$x,$c,$n) = @_;
    		eval q(( &wmove($win,($y),($x)) ==  &ERR ?  &ERR :  &win_wchnstr(($win),($c),($n))));
	    }' unless defined(&mvwin_wchnstr);
	    eval 'sub mvwin_wchstr {
	        my($win,$y,$x,$c) = @_;
    		eval q(( &wmove($win,($y),($x)) ==  &ERR ?  &ERR :  &win_wchstr(($win),($c))));
	    }' unless defined(&mvwin_wchstr);
	    eval 'sub mvwinnwstr {
	        my($win,$y,$x,$c,$n) = @_;
    		eval q(( &wmove($win,($y),($x)) ==  &ERR ?  &ERR :  &winnwstr(($win),($c),($n))));
	    }' unless defined(&mvwinnwstr);
	    eval 'sub mvwins_nwstr {
	        my($win,$y,$x,$t,$n) = @_;
    		eval q(( &wmove($win,($y),($x)) ==  &ERR ?  &ERR :  &wins_nwstr(($win),($t),($n))));
	    }' unless defined(&mvwins_nwstr);
	    eval 'sub mvwins_wch {
	        my($win,$y,$x,$c) = @_;
    		eval q(( &wmove($win,($y),($x)) ==  &ERR ?  &ERR :  &wins_wch(($win),($c))));
	    }' unless defined(&mvwins_wch);
	    eval 'sub mvwins_wstr {
	        my($win,$y,$x,$t) = @_;
    		eval q(( &wmove($win,($y),($x)) ==  &ERR ?  &ERR :  &wins_wstr(($win),($t))));
	    }' unless defined(&mvwins_wstr);
	    eval 'sub mvwinwstr {
	        my($win,$y,$x,$c) = @_;
    		eval q(( &wmove($win,($y),($x)) ==  &ERR ?  &ERR :  &winwstr(($win),($c))));
	    }' unless defined(&mvwinwstr);
	    eval 'sub mvwvline_set {
	        my($win,$y,$x,$c,$n) = @_;
    		eval q(( &wmove($win,($y),($x)) ==  &ERR ?  &ERR :  &wvline_set(($win),($c),($n))));
	    }' unless defined(&mvwvline_set);
	}
	if(defined(&TRACE) || defined(&NCURSES_TEST)) {
	}
    }
    if((defined(&NCURSES_MOUSE_VERSION) ? &NCURSES_MOUSE_VERSION : undef) > 1) {
	eval 'sub NCURSES_MOUSE_MASK {
	    my($b,$m) = @_;
    	    eval q((($m) << ((($b) - 1) * 5)));
	}' unless defined(&NCURSES_MOUSE_MASK);
    } else {
	eval 'sub NCURSES_MOUSE_MASK {
	    my($b,$m) = @_;
    	    eval q((($m) << ((($b) - 1) * 6)));
	}' unless defined(&NCURSES_MOUSE_MASK);
    }
    eval 'sub NCURSES_BUTTON_RELEASED () {001;}' unless defined(&NCURSES_BUTTON_RELEASED);
    eval 'sub NCURSES_BUTTON_PRESSED () {002;}' unless defined(&NCURSES_BUTTON_PRESSED);
    eval 'sub NCURSES_BUTTON_CLICKED () {004;}' unless defined(&NCURSES_BUTTON_CLICKED);
    eval 'sub NCURSES_DOUBLE_CLICKED () {010;}' unless defined(&NCURSES_DOUBLE_CLICKED);
    eval 'sub NCURSES_TRIPLE_CLICKED () {020;}' unless defined(&NCURSES_TRIPLE_CLICKED);
    eval 'sub NCURSES_RESERVED_EVENT () {040;}' unless defined(&NCURSES_RESERVED_EVENT);
    eval 'sub BUTTON1_RELEASED () { &NCURSES_MOUSE_MASK(1,  &NCURSES_BUTTON_RELEASED);}' unless defined(&BUTTON1_RELEASED);
    eval 'sub BUTTON1_PRESSED () { &NCURSES_MOUSE_MASK(1,  &NCURSES_BUTTON_PRESSED);}' unless defined(&BUTTON1_PRESSED);
    eval 'sub BUTTON1_CLICKED () { &NCURSES_MOUSE_MASK(1,  &NCURSES_BUTTON_CLICKED);}' unless defined(&BUTTON1_CLICKED);
    eval 'sub BUTTON1_DOUBLE_CLICKED () { &NCURSES_MOUSE_MASK(1,  &NCURSES_DOUBLE_CLICKED);}' unless defined(&BUTTON1_DOUBLE_CLICKED);
    eval 'sub BUTTON1_TRIPLE_CLICKED () { &NCURSES_MOUSE_MASK(1,  &NCURSES_TRIPLE_CLICKED);}' unless defined(&BUTTON1_TRIPLE_CLICKED);
    eval 'sub BUTTON2_RELEASED () { &NCURSES_MOUSE_MASK(2,  &NCURSES_BUTTON_RELEASED);}' unless defined(&BUTTON2_RELEASED);
    eval 'sub BUTTON2_PRESSED () { &NCURSES_MOUSE_MASK(2,  &NCURSES_BUTTON_PRESSED);}' unless defined(&BUTTON2_PRESSED);
    eval 'sub BUTTON2_CLICKED () { &NCURSES_MOUSE_MASK(2,  &NCURSES_BUTTON_CLICKED);}' unless defined(&BUTTON2_CLICKED);
    eval 'sub BUTTON2_DOUBLE_CLICKED () { &NCURSES_MOUSE_MASK(2,  &NCURSES_DOUBLE_CLICKED);}' unless defined(&BUTTON2_DOUBLE_CLICKED);
    eval 'sub BUTTON2_TRIPLE_CLICKED () { &NCURSES_MOUSE_MASK(2,  &NCURSES_TRIPLE_CLICKED);}' unless defined(&BUTTON2_TRIPLE_CLICKED);
    eval 'sub BUTTON3_RELEASED () { &NCURSES_MOUSE_MASK(3,  &NCURSES_BUTTON_RELEASED);}' unless defined(&BUTTON3_RELEASED);
    eval 'sub BUTTON3_PRESSED () { &NCURSES_MOUSE_MASK(3,  &NCURSES_BUTTON_PRESSED);}' unless defined(&BUTTON3_PRESSED);
    eval 'sub BUTTON3_CLICKED () { &NCURSES_MOUSE_MASK(3,  &NCURSES_BUTTON_CLICKED);}' unless defined(&BUTTON3_CLICKED);
    eval 'sub BUTTON3_DOUBLE_CLICKED () { &NCURSES_MOUSE_MASK(3,  &NCURSES_DOUBLE_CLICKED);}' unless defined(&BUTTON3_DOUBLE_CLICKED);
    eval 'sub BUTTON3_TRIPLE_CLICKED () { &NCURSES_MOUSE_MASK(3,  &NCURSES_TRIPLE_CLICKED);}' unless defined(&BUTTON3_TRIPLE_CLICKED);
    eval 'sub BUTTON4_RELEASED () { &NCURSES_MOUSE_MASK(4,  &NCURSES_BUTTON_RELEASED);}' unless defined(&BUTTON4_RELEASED);
    eval 'sub BUTTON4_PRESSED () { &NCURSES_MOUSE_MASK(4,  &NCURSES_BUTTON_PRESSED);}' unless defined(&BUTTON4_PRESSED);
    eval 'sub BUTTON4_CLICKED () { &NCURSES_MOUSE_MASK(4,  &NCURSES_BUTTON_CLICKED);}' unless defined(&BUTTON4_CLICKED);
    eval 'sub BUTTON4_DOUBLE_CLICKED () { &NCURSES_MOUSE_MASK(4,  &NCURSES_DOUBLE_CLICKED);}' unless defined(&BUTTON4_DOUBLE_CLICKED);
    eval 'sub BUTTON4_TRIPLE_CLICKED () { &NCURSES_MOUSE_MASK(4,  &NCURSES_TRIPLE_CLICKED);}' unless defined(&BUTTON4_TRIPLE_CLICKED);
    if((defined(&NCURSES_MOUSE_VERSION) ? &NCURSES_MOUSE_VERSION : undef) > 1) {
	eval 'sub BUTTON5_RELEASED () { &NCURSES_MOUSE_MASK(5,  &NCURSES_BUTTON_RELEASED);}' unless defined(&BUTTON5_RELEASED);
	eval 'sub BUTTON5_PRESSED () { &NCURSES_MOUSE_MASK(5,  &NCURSES_BUTTON_PRESSED);}' unless defined(&BUTTON5_PRESSED);
	eval 'sub BUTTON5_CLICKED () { &NCURSES_MOUSE_MASK(5,  &NCURSES_BUTTON_CLICKED);}' unless defined(&BUTTON5_CLICKED);
	eval 'sub BUTTON5_DOUBLE_CLICKED () { &NCURSES_MOUSE_MASK(5,  &NCURSES_DOUBLE_CLICKED);}' unless defined(&BUTTON5_DOUBLE_CLICKED);
	eval 'sub BUTTON5_TRIPLE_CLICKED () { &NCURSES_MOUSE_MASK(5,  &NCURSES_TRIPLE_CLICKED);}' unless defined(&BUTTON5_TRIPLE_CLICKED);
	eval 'sub BUTTON_CTRL () { &NCURSES_MOUSE_MASK(6, 0001);}' unless defined(&BUTTON_CTRL);
	eval 'sub BUTTON_SHIFT () { &NCURSES_MOUSE_MASK(6, 0002);}' unless defined(&BUTTON_SHIFT);
	eval 'sub BUTTON_ALT () { &NCURSES_MOUSE_MASK(6, 0004);}' unless defined(&BUTTON_ALT);
	eval 'sub REPORT_MOUSE_POSITION () { &NCURSES_MOUSE_MASK(6, 0010);}' unless defined(&REPORT_MOUSE_POSITION);
    } else {
	eval 'sub BUTTON1_RESERVED_EVENT () { &NCURSES_MOUSE_MASK(1,  &NCURSES_RESERVED_EVENT);}' unless defined(&BUTTON1_RESERVED_EVENT);
	eval 'sub BUTTON2_RESERVED_EVENT () { &NCURSES_MOUSE_MASK(2,  &NCURSES_RESERVED_EVENT);}' unless defined(&BUTTON2_RESERVED_EVENT);
	eval 'sub BUTTON3_RESERVED_EVENT () { &NCURSES_MOUSE_MASK(3,  &NCURSES_RESERVED_EVENT);}' unless defined(&BUTTON3_RESERVED_EVENT);
	eval 'sub BUTTON4_RESERVED_EVENT () { &NCURSES_MOUSE_MASK(4,  &NCURSES_RESERVED_EVENT);}' unless defined(&BUTTON4_RESERVED_EVENT);
	eval 'sub BUTTON_CTRL () { &NCURSES_MOUSE_MASK(5, 0001);}' unless defined(&BUTTON_CTRL);
	eval 'sub BUTTON_SHIFT () { &NCURSES_MOUSE_MASK(5, 0002);}' unless defined(&BUTTON_SHIFT);
	eval 'sub BUTTON_ALT () { &NCURSES_MOUSE_MASK(5, 0004);}' unless defined(&BUTTON_ALT);
	eval 'sub REPORT_MOUSE_POSITION () { &NCURSES_MOUSE_MASK(5, 0010);}' unless defined(&REPORT_MOUSE_POSITION);
    }
    eval 'sub ALL_MOUSE_EVENTS () {( &REPORT_MOUSE_POSITION - 1);}' unless defined(&ALL_MOUSE_EVENTS);
    eval 'sub BUTTON_RELEASE {
        my($e, $x) = @_;
	    eval q((($e) &  &NCURSES_MOUSE_MASK($x, 001)));
    }' unless defined(&BUTTON_RELEASE);
    eval 'sub BUTTON_PRESS {
        my($e, $x) = @_;
	    eval q((($e) &  &NCURSES_MOUSE_MASK($x, 002)));
    }' unless defined(&BUTTON_PRESS);
    eval 'sub BUTTON_CLICK {
        my($e, $x) = @_;
	    eval q((($e) &  &NCURSES_MOUSE_MASK($x, 004)));
    }' unless defined(&BUTTON_CLICK);
    eval 'sub BUTTON_DOUBLE_CLICK {
        my($e, $x) = @_;
	    eval q((($e) &  &NCURSES_MOUSE_MASK($x, 010)));
    }' unless defined(&BUTTON_DOUBLE_CLICK);
    eval 'sub BUTTON_TRIPLE_CLICK {
        my($e, $x) = @_;
	    eval q((($e) &  &NCURSES_MOUSE_MASK($x, 020)));
    }' unless defined(&BUTTON_TRIPLE_CLICK);
    eval 'sub BUTTON_RESERVED_EVENT {
        my($e, $x) = @_;
	    eval q((($e) &  &NCURSES_MOUSE_MASK($x, 040)));
    }' unless defined(&BUTTON_RESERVED_EVENT);
    if((defined(&NCURSES_SP_FUNCS) ? &NCURSES_SP_FUNCS : undef)) {
    }
    unless(defined(&NCURSES_NOMACROS)) {
	eval 'sub mouse_trafo {
	    my($y,$x,$to_screen) = @_;
    	    eval q( &wmouse_trafo( &stdscr,$y,$x,$to_screen));
	}' unless defined(&mouse_trafo);
    }
    if((defined(&NCURSES_SP_FUNCS) ? &NCURSES_SP_FUNCS : undef)) {
    }
    if((defined(&NCURSES_WIDECHAR) ? &NCURSES_WIDECHAR : undef)) {
	eval 'sub _tracech_t () { &_tracecchar_t;}' unless defined(&_tracech_t);
	eval 'sub _tracech_t2 () { &_tracecchar_t2;}' unless defined(&_tracech_t2);
    } else {
	eval 'sub _tracech_t () { &_tracechtype;}' unless defined(&_tracech_t);
	eval 'sub _tracech_t2 () { &_tracechtype2;}' unless defined(&_tracech_t2);
    }
    eval 'sub TRACE_DISABLE () {0x;}' unless defined(&TRACE_DISABLE);
    eval 'sub TRACE_TIMES () {0x1;}' unless defined(&TRACE_TIMES);
    eval 'sub TRACE_TPUTS () {0x2;}' unless defined(&TRACE_TPUTS);
    eval 'sub TRACE_UPDATE () {0x4;}' unless defined(&TRACE_UPDATE);
    eval 'sub TRACE_MOVE () {0x8;}' unless defined(&TRACE_MOVE);
    eval 'sub TRACE_CHARPUT () {0x10;}' unless defined(&TRACE_CHARPUT);
    eval 'sub TRACE_ORDINARY () {0x1f;}' unless defined(&TRACE_ORDINARY);
    eval 'sub TRACE_CALLS () {0x20;}' unless defined(&TRACE_CALLS);
    eval 'sub TRACE_VIRTPUT () {0x40;}' unless defined(&TRACE_VIRTPUT);
    eval 'sub TRACE_IEVENT () {0x80;}' unless defined(&TRACE_IEVENT);
    eval 'sub TRACE_BITS () {0x100;}' unless defined(&TRACE_BITS);
    eval 'sub TRACE_ICALLS () {0x200;}' unless defined(&TRACE_ICALLS);
    eval 'sub TRACE_CCALLS () {0x400;}' unless defined(&TRACE_CCALLS);
    eval 'sub TRACE_DATABASE () {0x800;}' unless defined(&TRACE_DATABASE);
    eval 'sub TRACE_ATTRS () {0x1000;}' unless defined(&TRACE_ATTRS);
    eval 'sub TRACE_SHIFT () {13;}' unless defined(&TRACE_SHIFT);
    eval 'sub TRACE_MAXIMUM () {((1<<  &TRACE_SHIFT) - 1);}' unless defined(&TRACE_MAXIMUM);
    if(defined(&TRACE) || defined(&NCURSES_TEST)) {
	eval 'sub OPTIMIZE_MVCUR () {0x1;}' unless defined(&OPTIMIZE_MVCUR);
	eval 'sub OPTIMIZE_HASHMAP () {0x2;}' unless defined(&OPTIMIZE_HASHMAP);
	eval 'sub OPTIMIZE_SCROLL () {0x4;}' unless defined(&OPTIMIZE_SCROLL);
	eval 'sub OPTIMIZE_ALL () {0xff;}' unless defined(&OPTIMIZE_ALL);
    }
    require 'unctrl.ph';
    if(defined(&__cplusplus)) {
	unless(defined(&NCURSES_NOMACROS)) {
	    undef(&box) if defined(&box);
	    undef(&clear) if defined(&clear);
	    undef(&erase) if defined(&erase);
	    undef(&move) if defined(&move);
	    undef(&refresh) if defined(&refresh);
	}
    }
}
1;

require '_h2ph_pre.ph';

no warnings qw(redefine misc);

unless(defined(&DIALOG_H_included)) {
    eval 'sub DIALOG_H_included () {1;}' unless defined(&DIALOG_H_included);
    require 'dlg_config.ph';
    if(defined(&__hpux)) {
	eval 'sub __HP_CURSES_COMPAT () {1;}' unless defined(&__HP_CURSES_COMPAT);
    }
    require 'sys/types.ph';
    require 'fcntl.ph';
    require 'unistd.ph';
    require 'ctype.ph';
    require 'stdlib.ph';
    require 'stdarg.ph';
    require 'string.ph';
    require 'signal.ph';
    require 'math.ph';
    if(defined(&ERR)  && ((defined(&ERR) ? &ERR : undef) == 13)) {
	undef(&ERR) if defined(&ERR);
    }
    if(defined(&HAVE_NCURSESW_NCURSES_H)) {
	require 'ncursesw/ncurses.ph';
    }
 elsif(defined(&HAVE_NCURSES_NCURSES_H)) {
	require 'ncurses/ncurses.ph';
    }
 elsif(defined(&HAVE_NCURSES_CURSES_H)) {
	require 'ncurses/curses.ph';
    }
 elsif(defined(&HAVE_NCURSES_H)) {
	require 'ncurses.ph';
    } else {
	require 'curses.ph';
	if(defined(&HAVE_UNCTRL_H)) {
	    require 'unctrl.ph';
	}
    }
    unless(defined(&KEY_MAX)) {
	if(defined(&__KEY_MAX)) {
	    eval 'sub KEY_MAX () { &__KEY_MAX;}' unless defined(&KEY_MAX);
	}
    }
    unless(defined(&KEY_MIN)) {
	if(defined(&__KEY_MIN)) {
	    eval 'sub KEY_MIN () { &__KEY_MIN;}' unless defined(&KEY_MIN);
	}
    }
    if(defined(&color_names)) {
	undef(&color_names) if defined(&color_names);
    }
    if(defined(&buttons)) {
	undef(&buttons) if defined(&buttons);
    }
    if(defined(&ENABLE_NLS)) {
	require 'libintl.ph';
	require 'langinfo.ph';
	eval 'sub _ {
	    my($s) = @_;
    	    eval q( &dgettext( &PACKAGE, $s));
	}' unless defined(&_);
    } else {
	undef(&_) if defined(&_);
	eval 'sub _ {
	    my($s) = @_;
    	    eval q($s);
	}' unless defined(&_);
    }
    unless(defined(&GCC_PRINTFLIKE)) {
	eval 'sub GCC_PRINTFLIKE {
	    my($fmt,$var) = @_;
    	    eval q();
	}' unless defined(&GCC_PRINTFLIKE);
    }
    unless(defined(&GCC_NORETURN)) {
	eval 'sub GCC_NORETURN () {1;}' unless defined(&GCC_NORETURN);
    }
    unless(defined(&GCC_UNUSED)) {
	eval 'sub GCC_UNUSED () {1;}' unless defined(&GCC_UNUSED);
    }
    unless(defined(&HAVE_WGET_WCH)) {
	undef(&USE_WIDE_CURSES) if defined(&USE_WIDE_CURSES);
    }
    if(defined(&__hpux)) {
	undef(&ACS_UARROW) if defined(&ACS_UARROW);
	undef(&ACS_DARROW) if defined(&ACS_DARROW);
	undef(&ACS_BLOCK) if defined(&ACS_BLOCK);
    }
    eval 'sub USE_SHADOW () { &TRUE;}' unless defined(&USE_SHADOW);
    eval 'sub USE_COLORS () { &TRUE;}' unless defined(&USE_COLORS);
    eval 'sub DLG_COLS () {( &COLS ?  &COLS :  ($dialog_state->{screen_width}));}' unless defined(&DLG_COLS);
    eval 'sub DLG_LINES () {( &LINES ?  &LINES :  ($dialog_state->{screen_height}));}' unless defined(&DLG_LINES);
    if(defined(&HAVE_COLOR)) {
	eval 'sub SCOLS () {( &DLG_COLS - ( ($dialog_state->{use_shadow}) ?  &SHADOW_COLS : 0));}' unless defined(&SCOLS);
	eval 'sub SLINES () {( &DLG_LINES - ( ($dialog_state->{use_shadow}) ?  &SHADOW_ROWS : 0));}' unless defined(&SLINES);
    } else {
	eval 'sub SCOLS () { &COLS;}' unless defined(&SCOLS);
	eval 'sub SLINES () { &LINES;}' unless defined(&SLINES);
    }
    eval 'sub DLG_EXIT_ESC () {255;}' unless defined(&DLG_EXIT_ESC);
    eval 'sub DLG_EXIT_UNKNOWN () {-2;}' unless defined(&DLG_EXIT_UNKNOWN);
    eval 'sub DLG_EXIT_ERROR () {-1;}' unless defined(&DLG_EXIT_ERROR);
    eval 'sub DLG_EXIT_OK () {0;}' unless defined(&DLG_EXIT_OK);
    eval 'sub DLG_EXIT_CANCEL () {1;}' unless defined(&DLG_EXIT_CANCEL);
    eval 'sub DLG_EXIT_HELP () {2;}' unless defined(&DLG_EXIT_HELP);
    eval 'sub DLG_EXIT_EXTRA () {3;}' unless defined(&DLG_EXIT_EXTRA);
    eval 'sub DLG_EXIT_ITEM_HELP () {4;}' unless defined(&DLG_EXIT_ITEM_HELP);
    eval 'sub DLG_EXIT_TIMEOUT () {5;}' unless defined(&DLG_EXIT_TIMEOUT);
    eval 'sub DLG_CTRL {
        my($n) = @_;
	    eval q((($n) & 0x1f));
    }' unless defined(&DLG_CTRL);
    eval 'sub CHR_LEAVE () { &DLG_CTRL(ord(\'D\'));}' unless defined(&CHR_LEAVE);
    eval 'sub CHR_HELP () { &DLG_CTRL(ord(\'E\'));}' unless defined(&CHR_HELP);
    eval 'sub CHR_BACKSPACE () { &DLG_CTRL(ord(\'H\'));}' unless defined(&CHR_BACKSPACE);
    eval 'sub CHR_REPAINT () { &DLG_CTRL(ord(\'L\'));}' unless defined(&CHR_REPAINT);
    eval 'sub CHR_NEXT () { &DLG_CTRL(ord(\'N\'));}' unless defined(&CHR_NEXT);
    eval 'sub CHR_PREVIOUS () { &DLG_CTRL(ord(\'P\'));}' unless defined(&CHR_PREVIOUS);
    eval 'sub CHR_KILL () { &DLG_CTRL(ord(\'U\'));}' unless defined(&CHR_KILL);
    eval 'sub CHR_TRACE () { &DLG_CTRL(ord(\'T\'));}' unless defined(&CHR_TRACE);
    eval 'sub CHR_LITERAL () { &DLG_CTRL(ord(\'V\'));}' unless defined(&CHR_LITERAL);
    eval 'sub CHR_SPACE () {ord(\' \');}' unless defined(&CHR_SPACE);
    eval 'sub CHR_DELETE () {127;}' unless defined(&CHR_DELETE);
    eval 'sub ESC () {27;}' unless defined(&ESC);
    eval 'sub TAB () { &DLG_CTRL(ord(\'I\'));}' unless defined(&TAB);
    eval 'sub MARGIN () {1;}' unless defined(&MARGIN);
    eval 'sub GUTTER () {2;}' unless defined(&GUTTER);
    eval 'sub SHADOW_ROWS () {1;}' unless defined(&SHADOW_ROWS);
    eval 'sub SHADOW_COLS () {2;}' unless defined(&SHADOW_COLS);
    eval 'sub ARROWS_COL () {5;}' unless defined(&ARROWS_COL);
    eval 'sub MAX_LEN () {2048;}' unless defined(&MAX_LEN);
    eval 'sub BUF_SIZE () {(10*1024);}' unless defined(&BUF_SIZE);
    undef(&MIN) if defined(&MIN);
    eval 'sub MIN {
        my($x,$y) = @_;
	    eval q((($x) < ($y) ? ($x) : ($y)));
    }' unless defined(&MIN);
    undef(&MAX) if defined(&MAX);
    eval 'sub MAX {
        my($x,$y) = @_;
	    eval q((($x) > ($y) ? ($x) : ($y)));
    }' unless defined(&MAX);
    eval 'sub DEFAULT_SEPARATE_STR () {"\\t";}' unless defined(&DEFAULT_SEPARATE_STR);
    eval 'sub DEFAULT_ASPECT_RATIO () {9;}' unless defined(&DEFAULT_ASPECT_RATIO);
    eval 'sub TAB_LEN () {8;}' unless defined(&TAB_LEN);
    eval 'sub WTIMEOUT_VAL () {10;}' unless defined(&WTIMEOUT_VAL);
    eval 'sub WTIMEOUT_OFF () {-1;}' unless defined(&WTIMEOUT_OFF);
    unless(defined(&A_CHARTEXT)) {
	eval 'sub A_CHARTEXT () {0xff;}' unless defined(&A_CHARTEXT);
    }
    eval 'sub CharOf {
        my($ch) = @_;
	    eval q((($ch) & 0xff));
    }' unless defined(&CharOf);
    unless(defined(&ACS_ULCORNER)) {
	eval 'sub ACS_ULCORNER () {ord(\'+\');}' unless defined(&ACS_ULCORNER);
    }
    unless(defined(&ACS_LLCORNER)) {
	eval 'sub ACS_LLCORNER () {ord(\'+\');}' unless defined(&ACS_LLCORNER);
    }
    unless(defined(&ACS_URCORNER)) {
	eval 'sub ACS_URCORNER () {ord(\'+\');}' unless defined(&ACS_URCORNER);
    }
    unless(defined(&ACS_LRCORNER)) {
	eval 'sub ACS_LRCORNER () {ord(\'+\');}' unless defined(&ACS_LRCORNER);
    }
    unless(defined(&ACS_HLINE)) {
	eval 'sub ACS_HLINE () {ord(\'-\');}' unless defined(&ACS_HLINE);
    }
    unless(defined(&ACS_VLINE)) {
	eval 'sub ACS_VLINE () {ord(\'|\');}' unless defined(&ACS_VLINE);
    }
    unless(defined(&ACS_LTEE)) {
	eval 'sub ACS_LTEE () {ord(\'+\');}' unless defined(&ACS_LTEE);
    }
    unless(defined(&ACS_RTEE)) {
	eval 'sub ACS_RTEE () {ord(\'+\');}' unless defined(&ACS_RTEE);
    }
    unless(defined(&ACS_UARROW)) {
	eval 'sub ACS_UARROW () {ord(\'^\');}' unless defined(&ACS_UARROW);
    }
    unless(defined(&ACS_DARROW)) {
	eval 'sub ACS_DARROW () {ord(\'v\');}' unless defined(&ACS_DARROW);
    }
    unless(defined(&ACS_BLOCK)) {
	eval 'sub ACS_BLOCK () {ord(\'#\');}' unless defined(&ACS_BLOCK);
    }
    unless(defined(&HAVE_GETBEGYX)) {
	undef(&getbegyx) if defined(&getbegyx);
	eval 'sub getbegyx {
	    my($win,$y,$x) = @_;
    	    eval q(($y = ($win)?($win)-> &_begy: &ERR, $x = ($win)?($win)-> &_begx: &ERR));
	}' unless defined(&getbegyx);
    }
    unless(defined(&HAVE_GETMAXYX)) {
	undef(&getmaxyx) if defined(&getmaxyx);
	eval 'sub getmaxyx {
	    my($win,$y,$x) = @_;
    	    eval q(($y = ($win)?($win)-> &_maxy: &ERR, $x = ($win)?($win)-> &_maxx: &ERR));
	}' unless defined(&getmaxyx);
    }
    unless(defined(&HAVE_GETPARYX)) {
	undef(&getparyx) if defined(&getparyx);
	eval 'sub getparyx {
	    my($win,$y,$x) = @_;
    	    eval q(($y = ($win)?($win)-> &_pary: &ERR, $x = ($win)?($win)-> &_parx: &ERR));
	}' unless defined(&getparyx);
    }
    if(!defined(&HAVE_WGETPARENT)  && defined(&HAVE_WINDOW__PARENT)) {
	undef(&wgetparent) if defined(&wgetparent);
	eval 'sub wgetparent {
	    my($win) = @_;
    	    eval q((($win) ? ($win)-> &_parent : 0));
	}' unless defined(&wgetparent);
    }
    if(!defined(&HAVE_WSYNCUP)) {
	undef(&wsyncup) if defined(&wsyncup);
	eval 'sub wsyncup {
	    my($win) = @_;
    	    eval q();
	}' unless defined(&wsyncup);
    }
    if(!defined(&HAVE_WCURSYNCUP)) {
	undef(&wcursyncup) if defined(&wcursyncup);
	eval 'sub wcursyncup {
	    my($win) = @_;
    	    eval q();
	}' unless defined(&wcursyncup);
    }
    if(defined(&__cplusplus)) {
    }
    if(!(defined(&HAVE_GETBEGX)  && defined(&HAVE_GETBEGY))) {
	undef(&getbegx) if defined(&getbegx);
	undef(&getbegy) if defined(&getbegy);
	eval 'sub getbegx {
	    my($win) = @_;
    	    eval q( &dlg_getbegx($win));
	}' unless defined(&getbegx);
	eval 'sub getbegy {
	    my($win) = @_;
    	    eval q( &dlg_getbegy($win));
	}' unless defined(&getbegy);
    }
    if(!(defined(&HAVE_GETCURX)  && defined(&HAVE_GETCURY))) {
	undef(&getcurx) if defined(&getcurx);
	undef(&getcury) if defined(&getcury);
	eval 'sub getcurx {
	    my($win) = @_;
    	    eval q( &dlg_getcurx($win));
	}' unless defined(&getcurx);
	eval 'sub getcury {
	    my($win) = @_;
    	    eval q( &dlg_getcury($win));
	}' unless defined(&getcury);
    }
    if(!(defined(&HAVE_GETMAXX)  && defined(&HAVE_GETMAXY))) {
	undef(&getmaxx) if defined(&getmaxx);
	undef(&getmaxy) if defined(&getmaxy);
	eval 'sub getmaxx {
	    my($win) = @_;
    	    eval q( &dlg_getmaxx($win));
	}' unless defined(&getmaxx);
	eval 'sub getmaxy {
	    my($win) = @_;
    	    eval q( &dlg_getmaxy($win));
	}' unless defined(&getmaxy);
    }
    if(!(defined(&HAVE_GETPARX)  && defined(&HAVE_GETPARY))) {
	undef(&getparx) if defined(&getparx);
	undef(&getpary) if defined(&getpary);
	eval 'sub getparx {
	    my($win) = @_;
    	    eval q( &dlg_getparx($win));
	}' unless defined(&getparx);
	eval 'sub getpary {
	    my($win) = @_;
    	    eval q( &dlg_getpary($win));
	}' unless defined(&getpary);
    }
    if(!(defined(&HAVE_WGETPARENT)  && defined(&HAVE_WINDOW__PARENT))) {
	undef(&wgetparent) if defined(&wgetparent);
	eval 'sub wgetparent {
	    my($win) = @_;
    	    eval q( &dlg_wgetparent($win));
	}' unless defined(&wgetparent);
    }
    if(defined(&__DIALOG_OLD_NAMES__)) {
	eval 'sub color_table () { &dlg_color_table;}' unless defined(&color_table);
	eval 'sub attr_clear {
	    my($win,$h,$w,$a) = @_;
    	    eval q( &dlg_attr_clear($win,$h,$w,$a));
	}' unless defined(&attr_clear);
	eval 'sub auto_size {
	    my($t,$s,$h,$w,$xl,$mc) = @_;
    	    eval q( &dlg_auto_size($t,$s,$h,$w,$xl,$mc));
	}' unless defined(&auto_size);
	eval 'sub auto_sizefile {
	    my($t,$f,$h,$w,$xl,$mc) = @_;
    	    eval q( &dlg_auto_sizefile($t,$f,$h,$w,$xl,$mc));
	}' unless defined(&auto_sizefile);
	eval 'sub beeping () {
	    eval q( &dlg_beeping());
	}' unless defined(&beeping);
	eval 'sub box_x_ordinate {
	    my($w) = @_;
    	    eval q( &dlg_box_x_ordinate($w));
	}' unless defined(&box_x_ordinate);
	eval 'sub box_y_ordinate {
	    my($h) = @_;
    	    eval q( &dlg_box_y_ordinate($h));
	}' unless defined(&box_y_ordinate);
	eval 'sub calc_listh {
	    my($h,$lh,$in) = @_;
    	    eval q( &dlg_calc_listh($h,$lh,$in));
	}' unless defined(&calc_listh);
	eval 'sub calc_listw {
	    my($in,$items,$group) = @_;
    	    eval q( &dlg_calc_listw($in,$items,$group));
	}' unless defined(&calc_listw);
	eval 'sub color_setup () {
	    eval q( &dlg_color_setup());
	}' unless defined(&color_setup);
	eval 'sub create_rc {
	    my($f) = @_;
    	    eval q( &dlg_create_rc($f));
	}' unless defined(&create_rc);
	eval 'sub ctl_size {
	    my($h,$w) = @_;
    	    eval q( &dlg_ctl_size($h,$w));
	}' unless defined(&ctl_size);
	eval 'sub del_window {
	    my($win) = @_;
    	    eval q( &dlg_del_window($win));
	}' unless defined(&del_window);
	eval 'sub dialog_clear () {
	    eval q( &dlg_clear());
	}' unless defined(&dialog_clear);
	eval 'sub draw_bottom_box {
	    my($win) = @_;
    	    eval q( &dlg_draw_bottom_box($win));
	}' unless defined(&draw_bottom_box);
	eval 'sub draw_box {
	    my($win,$y,$x,$h,$w,$xc,$bc) = @_;
    	    eval q( &dlg_draw_box($win,$y,$x,$h,$w,$xc,$bc));
	}' unless defined(&draw_box);
	eval 'sub draw_shadow {
	    my($win,$h,$w,$y,$x) = @_;
    	    eval q( &dlg_draw_shadow($win,$h,$w,$y,$x));
	}' unless defined(&draw_shadow);
	eval 'sub draw_title {
	    my($win,$t) = @_;
    	    eval q( &dlg_draw_title($win,$t));
	}' unless defined(&draw_title);
	eval 'sub exiterr () { &dlg_exiterr;}' unless defined(&exiterr);
	eval 'sub killall_bg {
	    my($n) = @_;
    	    eval q( &dlg_killall_bg($n));
	}' unless defined(&killall_bg);
	eval 'sub mouse_bigregion {
	    my($y,$x) = @_;
    	    eval q( &dlg_mouse_bigregion($y,$x));
	}' unless defined(&mouse_bigregion);
	eval 'sub mouse_free_regions () {
	    eval q( &dlg_mouse_free_regions());
	}' unless defined(&mouse_free_regions);
	eval 'sub mouse_mkbigregion {
	    my($y,$x,$h,$w,$n,$ix,$iy,$m) = @_;
    	    eval q( &dlg_mouse_mkbigregion($y,$x,$h,$w,$n,$ix,$iy,$m));
	}' unless defined(&mouse_mkbigregion);
	eval 'sub mouse_mkregion {
	    my($y,$x,$h,$w,$n) = @_;
    	    eval q( &dlg_mouse_mkregion($y,$x,$h,$w,$n));
	}' unless defined(&mouse_mkregion);
	eval 'sub mouse_region {
	    my($y,$x) = @_;
    	    eval q( &dlg_mouse_region($y,$x));
	}' unless defined(&mouse_region);
	eval 'sub mouse_setbase {
	    my($x,$y) = @_;
    	    eval q( &dlg_mouse_setbase($x,$y));
	}' unless defined(&mouse_setbase);
	eval 'sub mouse_setcode {
	    my($c) = @_;
    	    eval q( &dlg_mouse_setcode($c));
	}' unless defined(&mouse_setcode);
	eval 'sub mouse_wgetch {
	    my($w,$c) = @_;
    	    eval q( &dlg_mouse_wgetch($w,$c));
	}' unless defined(&mouse_wgetch);
	eval 'sub new_window {
	    my($h,$w,$y,$x) = @_;
    	    eval q( &dlg_new_window($h,$w,$y,$x));
	}' unless defined(&new_window);
	eval 'sub parse_rc () {
	    eval q( &dlg_parse_rc());
	}' unless defined(&parse_rc);
	eval 'sub print_autowrap {
	    my($win,$s,$h,$w) = @_;
    	    eval q( &dlg_print_autowrap($win,$s,$h,$w));
	}' unless defined(&print_autowrap);
	eval 'sub print_size {
	    my($h,$w) = @_;
    	    eval q( &dlg_print_size($h,$w));
	}' unless defined(&print_size);
	eval 'sub put_backtitle () {
	    eval q( &dlg_put_backtitle());
	}' unless defined(&put_backtitle);
	eval 'sub strclone {
	    my($cprompt) = @_;
    	    eval q( &dlg_strclone($cprompt));
	}' unless defined(&strclone);
	eval 'sub sub_window {
	    my($win,$h,$w,$y,$x) = @_;
    	    eval q( &dlg_sub_window($win,$h,$w,$y,$x));
	}' unless defined(&sub_window);
	eval 'sub tab_correct_str {
	    my($s) = @_;
    	    eval q( &dlg_tab_correct_str($s));
	}' unless defined(&tab_correct_str);
    }
    eval 'sub DIALOG_ATR {
        my($n) = @_;
	    eval q( ($dlg_color_table[$n]->{atr}));
    }' unless defined(&DIALOG_ATR);
    eval 'sub screen_attr () { &DIALOG_ATR(0);}' unless defined(&screen_attr);
    eval 'sub shadow_attr () { &DIALOG_ATR(1);}' unless defined(&shadow_attr);
    eval 'sub dialog_attr () { &DIALOG_ATR(2);}' unless defined(&dialog_attr);
    eval 'sub title_attr () { &DIALOG_ATR(3);}' unless defined(&title_attr);
    eval 'sub border_attr () { &DIALOG_ATR(4);}' unless defined(&border_attr);
    eval 'sub button_active_attr () { &DIALOG_ATR(5);}' unless defined(&button_active_attr);
    eval 'sub button_inactive_attr () { &DIALOG_ATR(6);}' unless defined(&button_inactive_attr);
    eval 'sub button_key_active_attr () { &DIALOG_ATR(7);}' unless defined(&button_key_active_attr);
    eval 'sub button_key_inactive_attr () { &DIALOG_ATR(8);}' unless defined(&button_key_inactive_attr);
    eval 'sub button_label_active_attr () { &DIALOG_ATR(9);}' unless defined(&button_label_active_attr);
    eval 'sub button_label_inactive_attr () { &DIALOG_ATR(10);}' unless defined(&button_label_inactive_attr);
    eval 'sub inputbox_attr () { &DIALOG_ATR(11);}' unless defined(&inputbox_attr);
    eval 'sub inputbox_border_attr () { &DIALOG_ATR(12);}' unless defined(&inputbox_border_attr);
    eval 'sub searchbox_attr () { &DIALOG_ATR(13);}' unless defined(&searchbox_attr);
    eval 'sub searchbox_title_attr () { &DIALOG_ATR(14);}' unless defined(&searchbox_title_attr);
    eval 'sub searchbox_border_attr () { &DIALOG_ATR(15);}' unless defined(&searchbox_border_attr);
    eval 'sub position_indicator_attr () { &DIALOG_ATR(16);}' unless defined(&position_indicator_attr);
    eval 'sub menubox_attr () { &DIALOG_ATR(17);}' unless defined(&menubox_attr);
    eval 'sub menubox_border_attr () { &DIALOG_ATR(18);}' unless defined(&menubox_border_attr);
    eval 'sub item_attr () { &DIALOG_ATR(19);}' unless defined(&item_attr);
    eval 'sub item_selected_attr () { &DIALOG_ATR(20);}' unless defined(&item_selected_attr);
    eval 'sub tag_attr () { &DIALOG_ATR(21);}' unless defined(&tag_attr);
    eval 'sub tag_selected_attr () { &DIALOG_ATR(22);}' unless defined(&tag_selected_attr);
    eval 'sub tag_key_attr () { &DIALOG_ATR(23);}' unless defined(&tag_key_attr);
    eval 'sub tag_key_selected_attr () { &DIALOG_ATR(24);}' unless defined(&tag_key_selected_attr);
    eval 'sub check_attr () { &DIALOG_ATR(25);}' unless defined(&check_attr);
    eval 'sub check_selected_attr () { &DIALOG_ATR(26);}' unless defined(&check_selected_attr);
    eval 'sub uarrow_attr () { &DIALOG_ATR(27);}' unless defined(&uarrow_attr);
    eval 'sub darrow_attr () { &DIALOG_ATR(28);}' unless defined(&darrow_attr);
    eval 'sub itemhelp_attr () { &DIALOG_ATR(29);}' unless defined(&itemhelp_attr);
    eval 'sub form_active_text_attr () { &DIALOG_ATR(30);}' unless defined(&form_active_text_attr);
    eval 'sub form_text_attr () { &DIALOG_ATR(31);}' unless defined(&form_text_attr);
    eval 'sub form_item_readonly_attr () { &DIALOG_ATR(32);}' unless defined(&form_item_readonly_attr);
    eval 'sub gauge_attr () { &DIALOG_ATR(33);}' unless defined(&gauge_attr);
    eval 'sub border2_attr () { &DIALOG_ATR(34);}' unless defined(&border2_attr);
    eval 'sub inputbox_border2_attr () { &DIALOG_ATR(35);}' unless defined(&inputbox_border2_attr);
    eval 'sub searchbox_border2_attr () { &DIALOG_ATR(36);}' unless defined(&searchbox_border2_attr);
    eval 'sub menubox_border2_attr () { &DIALOG_ATR(37);}' unless defined(&menubox_border2_attr);
    eval 'sub DLGK_max () {( &KEY_MAX + 256);}' unless defined(&DLGK_max);
    if(defined(&PDCURSES)) {
	eval 'sub dlg_attrset {
	    my($w,$a) = @_;
    	    eval q(( &void)  &wattrset(($w), ($a)));
	}' unless defined(&dlg_attrset);
	eval 'sub dlg_attron {
	    my($w,$a) = @_;
    	    eval q(( &void)  &wattron(($w), ($a)));
	}' unless defined(&dlg_attron);
	eval 'sub dlg_attroff {
	    my($w,$a) = @_;
    	    eval q(( &void)  &wattroff(($w), ($a)));
	}' unless defined(&dlg_attroff);
    } else {
	eval 'sub dlg_attrset {
	    my($w,$a) = @_;
    	    eval q(( &void)  &wattrset(, ($a)));
	}' unless defined(&dlg_attrset);
	eval 'sub dlg_attron {
	    my($w,$a) = @_;
    	    eval q(( &void)  &wattron(, ($a)));
	}' unless defined(&dlg_attron);
	eval 'sub dlg_attroff {
	    my($w,$a) = @_;
    	    eval q(( &void)  &wattroff(, ($a)));
	}' unless defined(&dlg_attroff);
    }
    if(defined(&HAVE_DLG_TRACE)) {
    }
    if(defined(&KEY_RESIZE)) {
    }
    eval 'sub USE_ITEM_HELP {
        my($s) = @_;
	    eval q(( ($dialog_vars->{item_help})  && ($s) != 0));
    }' unless defined(&USE_ITEM_HELP);
    eval 'sub DLG__NO_ITEMS () {( ($dialog_vars->{no_items}) ? 0: 1);}' unless defined(&DLG__NO_ITEMS);
    eval 'sub DLG__ITEM_HELP () {( ($dialog_vars->{item_help}) ? 1: 0);}' unless defined(&DLG__ITEM_HELP);
    eval 'sub CHECKBOX_TAGS () {(2+  &DLG__ITEM_HELP +  &DLG__NO_ITEMS);}' unless defined(&CHECKBOX_TAGS);
    eval 'sub MENUBOX_TAGS () {(1+  &DLG__ITEM_HELP +  &DLG__NO_ITEMS);}' unless defined(&MENUBOX_TAGS);
    eval 'sub FORMBOX_TAGS () {(8+  &DLG__ITEM_HELP);}' unless defined(&FORMBOX_TAGS);
    eval 'sub MIXEDFORM_TAGS () {(1+  &FORMBOX_TAGS);}' unless defined(&MIXEDFORM_TAGS);
    eval 'sub MIXEDGAUGE_TAGS () {2;}' unless defined(&MIXEDGAUGE_TAGS);
    eval 'sub TREEVIEW_TAGS () {(3+  &DLG__ITEM_HELP +  &DLG__NO_ITEMS);}' unless defined(&TREEVIEW_TAGS);
    unless(defined(&HAVE_TYPE_CHTYPE)) {
	eval 'sub chtype () {\'long\';}' unless defined(&chtype);
    }
    unless(defined(&isblank)) {
	eval 'sub isblank {
	    my($c) = @_;
    	    eval q((($c) == ord(\' \') || ($c) ==  &TAB));
	}' unless defined(&isblank);
    }
    eval 'sub UCH {
        my($ch) = @_;
	    eval q((($ch)));
    }' unless defined(&UCH);
    eval 'sub assert_ptr {
        my($ptr,$msg) = @_;
	    eval q( &if (($ptr) == 0)  &dlg_exiterr(\\"cannot allocate memory in \\" $msg));
    }' unless defined(&assert_ptr);
    eval 'sub dlg_malloc {
        my($t,$n) = @_;
	    eval q(($t *)  &malloc(($n) * $sizeof{$t}));
    }' unless defined(&dlg_malloc);
    eval 'sub dlg_calloc {
        my($t,$n) = @_;
	    eval q(($t *)  &calloc(($n), $sizeof{$t}));
    }' unless defined(&dlg_calloc);
    eval 'sub dlg_realloc {
        my($t,$n,$p) = @_;
	    eval q(($t *)  &realloc(($p), ($n) * $sizeof{$t}));
    }' unless defined(&dlg_realloc);
    if(defined(&HAVE_COLOR)) {
	if(defined(&HAVE_RC_FILE2)) {
	}
    }
    if(defined(&HAVE_RC_FILE)) {
    }
    if(defined(&HAVE_RC_FILE)) {
    }
    if(defined(&HAVE_COLOR)) {
    }
    if(defined(&HAVE_STRCASECMP)) {
	eval 'sub dlg_strcmp {
	    my($a,$b) = @_;
    	    eval q( &strcasecmp($a,$b));
	}' unless defined(&dlg_strcmp);
    } else {
    }
    if(defined(&HAVE_DLG_TRACE)) {
	eval 'sub DLG_TRACE {
	    my($params) = @_;
    	    eval q( &dlg_trace_msg $params);
	}' unless defined(&DLG_TRACE);
	eval 'sub DLG_TRACE2S {
	    my($name,$value) = @_;
    	    eval q( &dlg_trace_2s ($name,$value));
	}' unless defined(&DLG_TRACE2S);
	eval 'sub DLG_TRACE2N {
	    my($name,$value) = @_;
    	    eval q( &dlg_trace_2n ($name,$value));
	}' unless defined(&DLG_TRACE2N);
    } else {
	eval 'sub DLG_TRACE {
	    my($params) = @_;
    	    eval q();
	}' unless defined(&DLG_TRACE);
	eval 'sub DLG_TRACE2S {
	    my($name,$value) = @_;
    	    eval q();
	}' unless defined(&DLG_TRACE2S);
	eval 'sub DLG_TRACE2N {
	    my($name,$value) = @_;
    	    eval q();
	}' unless defined(&DLG_TRACE2N);
	eval 'sub dlg_trace_va_msg {
	    my($fmt, $ap) = @_;
    	    eval q();
	}' unless defined(&dlg_trace_va_msg);
	eval 'sub dlg_trace_win {
	    my($win) = @_;
    	    eval q();
	}' unless defined(&dlg_trace_win);
	eval 'sub dlg_trace_chr {
	    my($ch,$fkey) = @_;
    	    eval q();
	}' unless defined(&dlg_trace_chr);
	eval 'sub dlg_trace {
	    my($fname) = @_;
    	    eval q();
	}' unless defined(&dlg_trace);
    }
    if(defined(&KEY_RESIZE)) {
    }
    eval 'sub dlg_enter_buttoncode {
        my($code) = @_;
	    eval q(( ($dialog_vars->{nook}) ?  &DLG_EXIT_OK :  &dlg_ok_buttoncode($code)));
    }' unless defined(&dlg_enter_buttoncode);
    if(defined(&NCURSES_MOUSE_VERSION)) {
	eval 'sub mouse_open () {
	    eval q( &mousemask( &BUTTON1_PRESSED, ( &mmask_t *) 0));
	}' unless defined(&mouse_open);
	eval 'sub mouse_close () {
	    eval q( &mousemask(0, ( &mmask_t *) 0));
	}' unless defined(&mouse_close);
	eval 'sub USE_MOUSE () {1;}' unless defined(&USE_MOUSE);
    } else {
	eval 'sub mouse_open () {
	    eval q();
	}' unless defined(&mouse_open);
	eval 'sub mouse_close () {
	    eval q();
	}' unless defined(&mouse_close);
	eval 'sub dlg_mouse_free_regions () {
	    eval q();
	}' unless defined(&dlg_mouse_free_regions);
	eval 'sub dlg_mouse_mkregion {
	    my($y, $x, $height, $width, $code) = @_;
    	    eval q();
	}' unless defined(&dlg_mouse_mkregion);
	eval 'sub dlg_mouse_mkbigregion {
	    my($y, $x, $height, $width, $code, $step_x, $step_y, $mode) = @_;
    	    eval q();
	}' unless defined(&dlg_mouse_mkbigregion);
	eval 'sub dlg_mouse_setbase {
	    my($x, $y) = @_;
    	    eval q();
	}' unless defined(&dlg_mouse_setbase);
	eval 'sub dlg_mouse_setcode {
	    my($c) = @_;
    	    eval q();
	}' unless defined(&dlg_mouse_setcode);
	eval 'sub USE_MOUSE () {0;}' unless defined(&USE_MOUSE);
    }
    eval 'sub mouse_mkbutton {
        my($y,$x,$len,$code) = @_;
	    eval q( &dlg_mouse_mkregion($y,$x,1,$len,$code););
    }' unless defined(&mouse_mkbutton);
    eval 'sub M_EVENT () {( &DLGK_max + 1);}' unless defined(&M_EVENT);
    eval 'sub FLAG_CHECK () {1;}' unless defined(&FLAG_CHECK);
    eval 'sub FLAG_RADIO () {0;}' unless defined(&FLAG_RADIO);
    if(defined(&NO_LEAKS)) {
	if(defined(&NCURSES_VERSION)) {
	    if(defined(&HAVE_CURSES_EXIT)) {
	    }
 elsif(defined(&HAVE__NC_FREE_AND_EXIT)) {
		eval 'sub curses_exit {
		    my($code) = @_;
    		    eval q( &_nc_free_and_exit($code));
		}' unless defined(&curses_exit);
	    }
	}
    }
    if(defined(&__cplusplus)) {
    }
}
1;

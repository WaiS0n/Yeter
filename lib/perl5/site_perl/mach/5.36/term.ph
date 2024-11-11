require '_h2ph_pre.ph';

no warnings qw(redefine misc);

unless(defined(&NCURSES_TERM_H_incl)) {
    eval 'sub NCURSES_TERM_H_incl () {1;}' unless defined(&NCURSES_TERM_H_incl);
    undef(&NCURSES_VERSION) if defined(&NCURSES_VERSION);
    eval 'sub NCURSES_VERSION () {"6.2";}' unless defined(&NCURSES_VERSION);
    require 'ncurses_dll.ph';
    if(defined(&__cplusplus)) {
    }
    unless(defined(&__NCURSES_H)) {
	if(1) {
	    undef(&NCURSES_SP_FUNCS) if defined(&NCURSES_SP_FUNCS);
	    eval 'sub NCURSES_SP_FUNCS () {20210220;}' unless defined(&NCURSES_SP_FUNCS);
	    undef(&NCURSES_SP_NAME) if defined(&NCURSES_SP_NAME);
	    eval 'sub NCURSES_SP_NAME {
	        my($name) = @_;
    		eval q($name &_sp);
	    }' unless defined(&NCURSES_SP_NAME);
	    undef(&NCURSES_SP_OUTC) if defined(&NCURSES_SP_OUTC);
	    eval 'sub NCURSES_SP_OUTC () { &NCURSES_SP_NAME( &NCURSES_OUTC);}' unless defined(&NCURSES_SP_OUTC);
	}
    }
    undef(&NCURSES_CONST) if defined(&NCURSES_CONST);
    eval 'sub NCURSES_CONST () { &const;}' unless defined(&NCURSES_CONST);
    undef(&NCURSES_SBOOL) if defined(&NCURSES_SBOOL);
    eval 'sub NCURSES_SBOOL () {\'char\';}' unless defined(&NCURSES_SBOOL);
    undef(&NCURSES_USE_DATABASE) if defined(&NCURSES_USE_DATABASE);
    eval 'sub NCURSES_USE_DATABASE () {1;}' unless defined(&NCURSES_USE_DATABASE);
    undef(&NCURSES_USE_TERMCAP) if defined(&NCURSES_USE_TERMCAP);
    eval 'sub NCURSES_USE_TERMCAP () {1;}' unless defined(&NCURSES_USE_TERMCAP);
    undef(&NCURSES_XNAMES) if defined(&NCURSES_XNAMES);
    eval 'sub NCURSES_XNAMES () {1;}' unless defined(&NCURSES_XNAMES);
    undef(&TTY) if defined(&TTY);
    undef(&SET_TTY) if defined(&SET_TTY);
    undef(&GET_TTY) if defined(&GET_TTY);
    if(1 && 1) {
	undef(&TERMIOS) if defined(&TERMIOS);
	eval 'sub TERMIOS () {1;}' unless defined(&TERMIOS);
	require 'termios.ph';
	eval 'sub TTY () {\'struct termios\';}' unless defined(&TTY);
    } else {
	if(0) {
	    undef(&TERMIOS) if defined(&TERMIOS);
	    eval 'sub TERMIOS () {1;}' unless defined(&TERMIOS);
	    require 'termio.ph';
	    eval 'sub TTY () {\'struct termio\';}' unless defined(&TTY);
	} else {
	    if((defined(&_WIN32) || defined(&_WIN64))) {
		if(@(defined(&EXP_WIN32_DRIVER) ? &EXP_WIN32_DRIVER : undef)@) {
		    require 'win32_curses.ph';
		    eval 'sub TTY () {\'struct winconmode\';}' unless defined(&TTY);
		} else {
		    require 'ncurses_mingw.ph';
		    eval 'sub TTY () {\'struct termios\';}' unless defined(&TTY);
		}
	    } else {
		undef(&TERMIOS) if defined(&TERMIOS);
		require 'sgtty.ph';
		require 'sys/ioctl.ph';
		eval 'sub TTY () {\'struct sgttyb\';}' unless defined(&TTY);
	    }
	}
    }
    if(defined(&TERMIOS)) {
	eval 'sub GET_TTY {
	    my($fd, $buf) = @_;
    	    eval q( &tcgetattr($fd, $buf));
	}' unless defined(&GET_TTY);
	eval 'sub SET_TTY {
	    my($fd, $buf) = @_;
    	    eval q( &tcsetattr($fd,  &TCSADRAIN, $buf));
	}' unless defined(&SET_TTY);
    }
 elsif(@(defined(&EXP_WIN32_DRIVER) ? &EXP_WIN32_DRIVER : undef)@  && (defined(&_WIN32) || defined(&_WIN64))) {
	eval 'sub GET_TTY {
	    my($fd, $buf) = @_;
    	    eval q( &_nc_console_getmode( &_nc_console_fd2handle($fd),$buf));
	}' unless defined(&GET_TTY);
	eval 'sub SET_TTY {
	    my($fd, $buf) = @_;
    	    eval q( &_nc_console_setmode( &_nc_console_fd2handle($fd),$buf));
	}' unless defined(&SET_TTY);
    } else {
	eval 'sub GET_TTY {
	    my($fd, $buf) = @_;
    	    eval q( &gtty($fd, $buf));
	}' unless defined(&GET_TTY);
	eval 'sub SET_TTY {
	    my($fd, $buf) = @_;
    	    eval q( &stty($fd, $buf));
	}' unless defined(&SET_TTY);
    }
    unless(defined(&GCC_NORETURN)) {
	eval 'sub GCC_NORETURN () {1;}' unless defined(&GCC_NORETURN);
    }
    eval 'sub NAMESIZE () {256;}' unless defined(&NAMESIZE);
    eval 'sub CUR () {(( &TERMTYPE *)( &cur_term))->;}' unless defined(&CUR);
    eval 'sub auto_left_margin () { &CUR  $Booleans[0];}' unless defined(&auto_left_margin);
    eval 'sub auto_right_margin () { &CUR  $Booleans[1];}' unless defined(&auto_right_margin);
    eval 'sub no_esc_ctlc () { &CUR  $Booleans[2];}' unless defined(&no_esc_ctlc);
    eval 'sub ceol_standout_glitch () { &CUR  $Booleans[3];}' unless defined(&ceol_standout_glitch);
    eval 'sub eat_newline_glitch () { &CUR  $Booleans[4];}' unless defined(&eat_newline_glitch);
    eval 'sub erase_overstrike () { &CUR  $Booleans[5];}' unless defined(&erase_overstrike);
    eval 'sub generic_type () { &CUR  $Booleans[6];}' unless defined(&generic_type);
    eval 'sub hard_copy () { &CUR  $Booleans[7];}' unless defined(&hard_copy);
    eval 'sub has_meta_key () { &CUR  $Booleans[8];}' unless defined(&has_meta_key);
    eval 'sub has_status_line () { &CUR  $Booleans[9];}' unless defined(&has_status_line);
    eval 'sub insert_null_glitch () { &CUR  $Booleans[10];}' unless defined(&insert_null_glitch);
    eval 'sub memory_above () { &CUR  $Booleans[11];}' unless defined(&memory_above);
    eval 'sub memory_below () { &CUR  $Booleans[12];}' unless defined(&memory_below);
    eval 'sub move_insert_mode () { &CUR  $Booleans[13];}' unless defined(&move_insert_mode);
    eval 'sub move_standout_mode () { &CUR  $Booleans[14];}' unless defined(&move_standout_mode);
    eval 'sub over_strike () { &CUR  $Booleans[15];}' unless defined(&over_strike);
    eval 'sub status_line_esc_ok () { &CUR  $Booleans[16];}' unless defined(&status_line_esc_ok);
    eval 'sub dest_tabs_magic_smso () { &CUR  $Booleans[17];}' unless defined(&dest_tabs_magic_smso);
    eval 'sub tilde_glitch () { &CUR  $Booleans[18];}' unless defined(&tilde_glitch);
    eval 'sub transparent_underline () { &CUR  $Booleans[19];}' unless defined(&transparent_underline);
    eval 'sub xon_xoff () { &CUR  $Booleans[20];}' unless defined(&xon_xoff);
    eval 'sub needs_xon_xoff () { &CUR  $Booleans[21];}' unless defined(&needs_xon_xoff);
    eval 'sub prtr_silent () { &CUR  $Booleans[22];}' unless defined(&prtr_silent);
    eval 'sub hard_cursor () { &CUR  $Booleans[23];}' unless defined(&hard_cursor);
    eval 'sub non_rev_rmcup () { &CUR  $Booleans[24];}' unless defined(&non_rev_rmcup);
    eval 'sub no_pad_char () { &CUR  $Booleans[25];}' unless defined(&no_pad_char);
    eval 'sub non_dest_scroll_region () { &CUR  $Booleans[26];}' unless defined(&non_dest_scroll_region);
    eval 'sub can_change () { &CUR  $Booleans[27];}' unless defined(&can_change);
    eval 'sub back_color_erase () { &CUR  $Booleans[28];}' unless defined(&back_color_erase);
    eval 'sub hue_lightness_saturation () { &CUR  $Booleans[29];}' unless defined(&hue_lightness_saturation);
    eval 'sub col_addr_glitch () { &CUR  $Booleans[30];}' unless defined(&col_addr_glitch);
    eval 'sub cr_cancels_micro_mode () { &CUR  $Booleans[31];}' unless defined(&cr_cancels_micro_mode);
    eval 'sub has_print_wheel () { &CUR  $Booleans[32];}' unless defined(&has_print_wheel);
    eval 'sub row_addr_glitch () { &CUR  $Booleans[33];}' unless defined(&row_addr_glitch);
    eval 'sub semi_auto_right_margin () { &CUR  $Booleans[34];}' unless defined(&semi_auto_right_margin);
    eval 'sub cpi_changes_res () { &CUR  $Booleans[35];}' unless defined(&cpi_changes_res);
    eval 'sub lpi_changes_res () { &CUR  $Booleans[36];}' unless defined(&lpi_changes_res);
    eval 'sub columns () { &CUR  $Numbers[0];}' unless defined(&columns);
    eval 'sub init_tabs () { &CUR  $Numbers[1];}' unless defined(&init_tabs);
    eval 'sub lines () { &CUR  $Numbers[2];}' unless defined(&lines);
    eval 'sub lines_of_memory () { &CUR  $Numbers[3];}' unless defined(&lines_of_memory);
    eval 'sub magic_cookie_glitch () { &CUR  $Numbers[4];}' unless defined(&magic_cookie_glitch);
    eval 'sub padding_baud_rate () { &CUR  $Numbers[5];}' unless defined(&padding_baud_rate);
    eval 'sub virtual_terminal () { &CUR  $Numbers[6];}' unless defined(&virtual_terminal);
    eval 'sub width_status_line () { &CUR  $Numbers[7];}' unless defined(&width_status_line);
    eval 'sub num_labels () { &CUR  $Numbers[8];}' unless defined(&num_labels);
    eval 'sub label_height () { &CUR  $Numbers[9];}' unless defined(&label_height);
    eval 'sub label_width () { &CUR  $Numbers[10];}' unless defined(&label_width);
    eval 'sub max_attributes () { &CUR  $Numbers[11];}' unless defined(&max_attributes);
    eval 'sub maximum_windows () { &CUR  $Numbers[12];}' unless defined(&maximum_windows);
    eval 'sub max_colors () { &CUR  $Numbers[13];}' unless defined(&max_colors);
    eval 'sub max_pairs () { &CUR  $Numbers[14];}' unless defined(&max_pairs);
    eval 'sub no_color_video () { &CUR  $Numbers[15];}' unless defined(&no_color_video);
    eval 'sub buffer_capacity () { &CUR  $Numbers[16];}' unless defined(&buffer_capacity);
    eval 'sub dot_vert_spacing () { &CUR  $Numbers[17];}' unless defined(&dot_vert_spacing);
    eval 'sub dot_horz_spacing () { &CUR  $Numbers[18];}' unless defined(&dot_horz_spacing);
    eval 'sub max_micro_address () { &CUR  $Numbers[19];}' unless defined(&max_micro_address);
    eval 'sub max_micro_jump () { &CUR  $Numbers[20];}' unless defined(&max_micro_jump);
    eval 'sub micro_col_size () { &CUR  $Numbers[21];}' unless defined(&micro_col_size);
    eval 'sub micro_line_size () { &CUR  $Numbers[22];}' unless defined(&micro_line_size);
    eval 'sub number_of_pins () { &CUR  $Numbers[23];}' unless defined(&number_of_pins);
    eval 'sub output_res_char () { &CUR  $Numbers[24];}' unless defined(&output_res_char);
    eval 'sub output_res_line () { &CUR  $Numbers[25];}' unless defined(&output_res_line);
    eval 'sub output_res_horz_inch () { &CUR  $Numbers[26];}' unless defined(&output_res_horz_inch);
    eval 'sub output_res_vert_inch () { &CUR  $Numbers[27];}' unless defined(&output_res_vert_inch);
    eval 'sub print_rate () { &CUR  $Numbers[28];}' unless defined(&print_rate);
    eval 'sub wide_char_size () { &CUR  $Numbers[29];}' unless defined(&wide_char_size);
    eval 'sub buttons () { &CUR  $Numbers[30];}' unless defined(&buttons);
    eval 'sub bit_image_entwining () { &CUR  $Numbers[31];}' unless defined(&bit_image_entwining);
    eval 'sub bit_image_type () { &CUR  $Numbers[32];}' unless defined(&bit_image_type);
    eval 'sub back_tab () { &CUR  $Strings[0];}' unless defined(&back_tab);
    eval 'sub bell () { &CUR  $Strings[1];}' unless defined(&bell);
    eval 'sub carriage_return () { &CUR  $Strings[2];}' unless defined(&carriage_return);
    eval 'sub change_scroll_region () { &CUR  $Strings[3];}' unless defined(&change_scroll_region);
    eval 'sub clear_all_tabs () { &CUR  $Strings[4];}' unless defined(&clear_all_tabs);
    eval 'sub clear_screen () { &CUR  $Strings[5];}' unless defined(&clear_screen);
    eval 'sub clr_eol () { &CUR  $Strings[6];}' unless defined(&clr_eol);
    eval 'sub clr_eos () { &CUR  $Strings[7];}' unless defined(&clr_eos);
    eval 'sub column_address () { &CUR  $Strings[8];}' unless defined(&column_address);
    eval 'sub command_character () { &CUR  $Strings[9];}' unless defined(&command_character);
    eval 'sub cursor_address () { &CUR  $Strings[10];}' unless defined(&cursor_address);
    eval 'sub cursor_down () { &CUR  $Strings[11];}' unless defined(&cursor_down);
    eval 'sub cursor_home () { &CUR  $Strings[12];}' unless defined(&cursor_home);
    eval 'sub cursor_invisible () { &CUR  $Strings[13];}' unless defined(&cursor_invisible);
    eval 'sub cursor_left () { &CUR  $Strings[14];}' unless defined(&cursor_left);
    eval 'sub cursor_mem_address () { &CUR  $Strings[15];}' unless defined(&cursor_mem_address);
    eval 'sub cursor_normal () { &CUR  $Strings[16];}' unless defined(&cursor_normal);
    eval 'sub cursor_right () { &CUR  $Strings[17];}' unless defined(&cursor_right);
    eval 'sub cursor_to_ll () { &CUR  $Strings[18];}' unless defined(&cursor_to_ll);
    eval 'sub cursor_up () { &CUR  $Strings[19];}' unless defined(&cursor_up);
    eval 'sub cursor_visible () { &CUR  $Strings[20];}' unless defined(&cursor_visible);
    eval 'sub delete_character () { &CUR  $Strings[21];}' unless defined(&delete_character);
    eval 'sub delete_line () { &CUR  $Strings[22];}' unless defined(&delete_line);
    eval 'sub dis_status_line () { &CUR  $Strings[23];}' unless defined(&dis_status_line);
    eval 'sub down_half_line () { &CUR  $Strings[24];}' unless defined(&down_half_line);
    eval 'sub enter_alt_charset_mode () { &CUR  $Strings[25];}' unless defined(&enter_alt_charset_mode);
    eval 'sub enter_blink_mode () { &CUR  $Strings[26];}' unless defined(&enter_blink_mode);
    eval 'sub enter_bold_mode () { &CUR  $Strings[27];}' unless defined(&enter_bold_mode);
    eval 'sub enter_ca_mode () { &CUR  $Strings[28];}' unless defined(&enter_ca_mode);
    eval 'sub enter_delete_mode () { &CUR  $Strings[29];}' unless defined(&enter_delete_mode);
    eval 'sub enter_dim_mode () { &CUR  $Strings[30];}' unless defined(&enter_dim_mode);
    eval 'sub enter_insert_mode () { &CUR  $Strings[31];}' unless defined(&enter_insert_mode);
    eval 'sub enter_secure_mode () { &CUR  $Strings[32];}' unless defined(&enter_secure_mode);
    eval 'sub enter_protected_mode () { &CUR  $Strings[33];}' unless defined(&enter_protected_mode);
    eval 'sub enter_reverse_mode () { &CUR  $Strings[34];}' unless defined(&enter_reverse_mode);
    eval 'sub enter_standout_mode () { &CUR  $Strings[35];}' unless defined(&enter_standout_mode);
    eval 'sub enter_underline_mode () { &CUR  $Strings[36];}' unless defined(&enter_underline_mode);
    eval 'sub erase_chars () { &CUR  $Strings[37];}' unless defined(&erase_chars);
    eval 'sub exit_alt_charset_mode () { &CUR  $Strings[38];}' unless defined(&exit_alt_charset_mode);
    eval 'sub exit_attribute_mode () { &CUR  $Strings[39];}' unless defined(&exit_attribute_mode);
    eval 'sub exit_ca_mode () { &CUR  $Strings[40];}' unless defined(&exit_ca_mode);
    eval 'sub exit_delete_mode () { &CUR  $Strings[41];}' unless defined(&exit_delete_mode);
    eval 'sub exit_insert_mode () { &CUR  $Strings[42];}' unless defined(&exit_insert_mode);
    eval 'sub exit_standout_mode () { &CUR  $Strings[43];}' unless defined(&exit_standout_mode);
    eval 'sub exit_underline_mode () { &CUR  $Strings[44];}' unless defined(&exit_underline_mode);
    eval 'sub flash_screen () { &CUR  $Strings[45];}' unless defined(&flash_screen);
    eval 'sub form_feed () { &CUR  $Strings[46];}' unless defined(&form_feed);
    eval 'sub from_status_line () { &CUR  $Strings[47];}' unless defined(&from_status_line);
    eval 'sub init_1string () { &CUR  $Strings[48];}' unless defined(&init_1string);
    eval 'sub init_2string () { &CUR  $Strings[49];}' unless defined(&init_2string);
    eval 'sub init_3string () { &CUR  $Strings[50];}' unless defined(&init_3string);
    eval 'sub init_file () { &CUR  $Strings[51];}' unless defined(&init_file);
    eval 'sub insert_character () { &CUR  $Strings[52];}' unless defined(&insert_character);
    eval 'sub insert_line () { &CUR  $Strings[53];}' unless defined(&insert_line);
    eval 'sub insert_padding () { &CUR  $Strings[54];}' unless defined(&insert_padding);
    eval 'sub key_backspace () { &CUR  $Strings[55];}' unless defined(&key_backspace);
    eval 'sub key_catab () { &CUR  $Strings[56];}' unless defined(&key_catab);
    eval 'sub key_clear () { &CUR  $Strings[57];}' unless defined(&key_clear);
    eval 'sub key_ctab () { &CUR  $Strings[58];}' unless defined(&key_ctab);
    eval 'sub key_dc () { &CUR  $Strings[59];}' unless defined(&key_dc);
    eval 'sub key_dl () { &CUR  $Strings[60];}' unless defined(&key_dl);
    eval 'sub key_down () { &CUR  $Strings[61];}' unless defined(&key_down);
    eval 'sub key_eic () { &CUR  $Strings[62];}' unless defined(&key_eic);
    eval 'sub key_eol () { &CUR  $Strings[63];}' unless defined(&key_eol);
    eval 'sub key_eos () { &CUR  $Strings[64];}' unless defined(&key_eos);
    eval 'sub key_f0 () { &CUR  $Strings[65];}' unless defined(&key_f0);
    eval 'sub key_f1 () { &CUR  $Strings[66];}' unless defined(&key_f1);
    eval 'sub key_f10 () { &CUR  $Strings[67];}' unless defined(&key_f10);
    eval 'sub key_f2 () { &CUR  $Strings[68];}' unless defined(&key_f2);
    eval 'sub key_f3 () { &CUR  $Strings[69];}' unless defined(&key_f3);
    eval 'sub key_f4 () { &CUR  $Strings[70];}' unless defined(&key_f4);
    eval 'sub key_f5 () { &CUR  $Strings[71];}' unless defined(&key_f5);
    eval 'sub key_f6 () { &CUR  $Strings[72];}' unless defined(&key_f6);
    eval 'sub key_f7 () { &CUR  $Strings[73];}' unless defined(&key_f7);
    eval 'sub key_f8 () { &CUR  $Strings[74];}' unless defined(&key_f8);
    eval 'sub key_f9 () { &CUR  $Strings[75];}' unless defined(&key_f9);
    eval 'sub key_home () { &CUR  $Strings[76];}' unless defined(&key_home);
    eval 'sub key_ic () { &CUR  $Strings[77];}' unless defined(&key_ic);
    eval 'sub key_il () { &CUR  $Strings[78];}' unless defined(&key_il);
    eval 'sub key_left () { &CUR  $Strings[79];}' unless defined(&key_left);
    eval 'sub key_ll () { &CUR  $Strings[80];}' unless defined(&key_ll);
    eval 'sub key_npage () { &CUR  $Strings[81];}' unless defined(&key_npage);
    eval 'sub key_ppage () { &CUR  $Strings[82];}' unless defined(&key_ppage);
    eval 'sub key_right () { &CUR  $Strings[83];}' unless defined(&key_right);
    eval 'sub key_sf () { &CUR  $Strings[84];}' unless defined(&key_sf);
    eval 'sub key_sr () { &CUR  $Strings[85];}' unless defined(&key_sr);
    eval 'sub key_stab () { &CUR  $Strings[86];}' unless defined(&key_stab);
    eval 'sub key_up () { &CUR  $Strings[87];}' unless defined(&key_up);
    eval 'sub keypad_local () { &CUR  $Strings[88];}' unless defined(&keypad_local);
    eval 'sub keypad_xmit () { &CUR  $Strings[89];}' unless defined(&keypad_xmit);
    eval 'sub lab_f0 () { &CUR  $Strings[90];}' unless defined(&lab_f0);
    eval 'sub lab_f1 () { &CUR  $Strings[91];}' unless defined(&lab_f1);
    eval 'sub lab_f10 () { &CUR  $Strings[92];}' unless defined(&lab_f10);
    eval 'sub lab_f2 () { &CUR  $Strings[93];}' unless defined(&lab_f2);
    eval 'sub lab_f3 () { &CUR  $Strings[94];}' unless defined(&lab_f3);
    eval 'sub lab_f4 () { &CUR  $Strings[95];}' unless defined(&lab_f4);
    eval 'sub lab_f5 () { &CUR  $Strings[96];}' unless defined(&lab_f5);
    eval 'sub lab_f6 () { &CUR  $Strings[97];}' unless defined(&lab_f6);
    eval 'sub lab_f7 () { &CUR  $Strings[98];}' unless defined(&lab_f7);
    eval 'sub lab_f8 () { &CUR  $Strings[99];}' unless defined(&lab_f8);
    eval 'sub lab_f9 () { &CUR  $Strings[100];}' unless defined(&lab_f9);
    eval 'sub meta_off () { &CUR  $Strings[101];}' unless defined(&meta_off);
    eval 'sub meta_on () { &CUR  $Strings[102];}' unless defined(&meta_on);
    eval 'sub newline () { &CUR  $Strings[103];}' unless defined(&newline);
    eval 'sub pad_char () { &CUR  $Strings[104];}' unless defined(&pad_char);
    eval 'sub parm_dch () { &CUR  $Strings[105];}' unless defined(&parm_dch);
    eval 'sub parm_delete_line () { &CUR  $Strings[106];}' unless defined(&parm_delete_line);
    eval 'sub parm_down_cursor () { &CUR  $Strings[107];}' unless defined(&parm_down_cursor);
    eval 'sub parm_ich () { &CUR  $Strings[108];}' unless defined(&parm_ich);
    eval 'sub parm_index () { &CUR  $Strings[109];}' unless defined(&parm_index);
    eval 'sub parm_insert_line () { &CUR  $Strings[110];}' unless defined(&parm_insert_line);
    eval 'sub parm_left_cursor () { &CUR  $Strings[111];}' unless defined(&parm_left_cursor);
    eval 'sub parm_right_cursor () { &CUR  $Strings[112];}' unless defined(&parm_right_cursor);
    eval 'sub parm_rindex () { &CUR  $Strings[113];}' unless defined(&parm_rindex);
    eval 'sub parm_up_cursor () { &CUR  $Strings[114];}' unless defined(&parm_up_cursor);
    eval 'sub pkey_key () { &CUR  $Strings[115];}' unless defined(&pkey_key);
    eval 'sub pkey_local () { &CUR  $Strings[116];}' unless defined(&pkey_local);
    eval 'sub pkey_xmit () { &CUR  $Strings[117];}' unless defined(&pkey_xmit);
    eval 'sub print_screen () { &CUR  $Strings[118];}' unless defined(&print_screen);
    eval 'sub prtr_off () { &CUR  $Strings[119];}' unless defined(&prtr_off);
    eval 'sub prtr_on () { &CUR  $Strings[120];}' unless defined(&prtr_on);
    eval 'sub repeat_char () { &CUR  $Strings[121];}' unless defined(&repeat_char);
    eval 'sub reset_1string () { &CUR  $Strings[122];}' unless defined(&reset_1string);
    eval 'sub reset_2string () { &CUR  $Strings[123];}' unless defined(&reset_2string);
    eval 'sub reset_3string () { &CUR  $Strings[124];}' unless defined(&reset_3string);
    eval 'sub reset_file () { &CUR  $Strings[125];}' unless defined(&reset_file);
    eval 'sub restore_cursor () { &CUR  $Strings[126];}' unless defined(&restore_cursor);
    eval 'sub row_address () { &CUR  $Strings[127];}' unless defined(&row_address);
    eval 'sub save_cursor () { &CUR  $Strings[128];}' unless defined(&save_cursor);
    eval 'sub scroll_forward () { &CUR  $Strings[129];}' unless defined(&scroll_forward);
    eval 'sub scroll_reverse () { &CUR  $Strings[130];}' unless defined(&scroll_reverse);
    eval 'sub set_attributes () { &CUR  $Strings[131];}' unless defined(&set_attributes);
    eval 'sub set_tab () { &CUR  $Strings[132];}' unless defined(&set_tab);
    eval 'sub set_window () { &CUR  $Strings[133];}' unless defined(&set_window);
    eval 'sub tab () { &CUR  $Strings[134];}' unless defined(&tab);
    eval 'sub to_status_line () { &CUR  $Strings[135];}' unless defined(&to_status_line);
    eval 'sub underline_char () { &CUR  $Strings[136];}' unless defined(&underline_char);
    eval 'sub up_half_line () { &CUR  $Strings[137];}' unless defined(&up_half_line);
    eval 'sub init_prog () { &CUR  $Strings[138];}' unless defined(&init_prog);
    eval 'sub key_a1 () { &CUR  $Strings[139];}' unless defined(&key_a1);
    eval 'sub key_a3 () { &CUR  $Strings[140];}' unless defined(&key_a3);
    eval 'sub key_b2 () { &CUR  $Strings[141];}' unless defined(&key_b2);
    eval 'sub key_c1 () { &CUR  $Strings[142];}' unless defined(&key_c1);
    eval 'sub key_c3 () { &CUR  $Strings[143];}' unless defined(&key_c3);
    eval 'sub prtr_non () { &CUR  $Strings[144];}' unless defined(&prtr_non);
    eval 'sub char_padding () { &CUR  $Strings[145];}' unless defined(&char_padding);
    eval 'sub acs_chars () { &CUR  $Strings[146];}' unless defined(&acs_chars);
    eval 'sub plab_norm () { &CUR  $Strings[147];}' unless defined(&plab_norm);
    eval 'sub key_btab () { &CUR  $Strings[148];}' unless defined(&key_btab);
    eval 'sub enter_xon_mode () { &CUR  $Strings[149];}' unless defined(&enter_xon_mode);
    eval 'sub exit_xon_mode () { &CUR  $Strings[150];}' unless defined(&exit_xon_mode);
    eval 'sub enter_am_mode () { &CUR  $Strings[151];}' unless defined(&enter_am_mode);
    eval 'sub exit_am_mode () { &CUR  $Strings[152];}' unless defined(&exit_am_mode);
    eval 'sub xon_character () { &CUR  $Strings[153];}' unless defined(&xon_character);
    eval 'sub xoff_character () { &CUR  $Strings[154];}' unless defined(&xoff_character);
    eval 'sub ena_acs () { &CUR  $Strings[155];}' unless defined(&ena_acs);
    eval 'sub label_on () { &CUR  $Strings[156];}' unless defined(&label_on);
    eval 'sub label_off () { &CUR  $Strings[157];}' unless defined(&label_off);
    eval 'sub key_beg () { &CUR  $Strings[158];}' unless defined(&key_beg);
    eval 'sub key_cancel () { &CUR  $Strings[159];}' unless defined(&key_cancel);
    eval 'sub key_close () { &CUR  $Strings[160];}' unless defined(&key_close);
    eval 'sub key_command () { &CUR  $Strings[161];}' unless defined(&key_command);
    eval 'sub key_copy () { &CUR  $Strings[162];}' unless defined(&key_copy);
    eval 'sub key_create () { &CUR  $Strings[163];}' unless defined(&key_create);
    eval 'sub key_end () { &CUR  $Strings[164];}' unless defined(&key_end);
    eval 'sub key_enter () { &CUR  $Strings[165];}' unless defined(&key_enter);
    eval 'sub key_exit () { &CUR  $Strings[166];}' unless defined(&key_exit);
    eval 'sub key_find () { &CUR  $Strings[167];}' unless defined(&key_find);
    eval 'sub key_help () { &CUR  $Strings[168];}' unless defined(&key_help);
    eval 'sub key_mark () { &CUR  $Strings[169];}' unless defined(&key_mark);
    eval 'sub key_message () { &CUR  $Strings[170];}' unless defined(&key_message);
    eval 'sub key_move () { &CUR  $Strings[171];}' unless defined(&key_move);
    eval 'sub key_next () { &CUR  $Strings[172];}' unless defined(&key_next);
    eval 'sub key_open () { &CUR  $Strings[173];}' unless defined(&key_open);
    eval 'sub key_options () { &CUR  $Strings[174];}' unless defined(&key_options);
    eval 'sub key_previous () { &CUR  $Strings[175];}' unless defined(&key_previous);
    eval 'sub key_print () { &CUR  $Strings[176];}' unless defined(&key_print);
    eval 'sub key_redo () { &CUR  $Strings[177];}' unless defined(&key_redo);
    eval 'sub key_reference () { &CUR  $Strings[178];}' unless defined(&key_reference);
    eval 'sub key_refresh () { &CUR  $Strings[179];}' unless defined(&key_refresh);
    eval 'sub key_replace () { &CUR  $Strings[180];}' unless defined(&key_replace);
    eval 'sub key_restart () { &CUR  $Strings[181];}' unless defined(&key_restart);
    eval 'sub key_resume () { &CUR  $Strings[182];}' unless defined(&key_resume);
    eval 'sub key_save () { &CUR  $Strings[183];}' unless defined(&key_save);
    eval 'sub key_suspend () { &CUR  $Strings[184];}' unless defined(&key_suspend);
    eval 'sub key_undo () { &CUR  $Strings[185];}' unless defined(&key_undo);
    eval 'sub key_sbeg () { &CUR  $Strings[186];}' unless defined(&key_sbeg);
    eval 'sub key_scancel () { &CUR  $Strings[187];}' unless defined(&key_scancel);
    eval 'sub key_scommand () { &CUR  $Strings[188];}' unless defined(&key_scommand);
    eval 'sub key_scopy () { &CUR  $Strings[189];}' unless defined(&key_scopy);
    eval 'sub key_screate () { &CUR  $Strings[190];}' unless defined(&key_screate);
    eval 'sub key_sdc () { &CUR  $Strings[191];}' unless defined(&key_sdc);
    eval 'sub key_sdl () { &CUR  $Strings[192];}' unless defined(&key_sdl);
    eval 'sub key_select () { &CUR  $Strings[193];}' unless defined(&key_select);
    eval 'sub key_send () { &CUR  $Strings[194];}' unless defined(&key_send);
    eval 'sub key_seol () { &CUR  $Strings[195];}' unless defined(&key_seol);
    eval 'sub key_sexit () { &CUR  $Strings[196];}' unless defined(&key_sexit);
    eval 'sub key_sfind () { &CUR  $Strings[197];}' unless defined(&key_sfind);
    eval 'sub key_shelp () { &CUR  $Strings[198];}' unless defined(&key_shelp);
    eval 'sub key_shome () { &CUR  $Strings[199];}' unless defined(&key_shome);
    eval 'sub key_sic () { &CUR  $Strings[200];}' unless defined(&key_sic);
    eval 'sub key_sleft () { &CUR  $Strings[201];}' unless defined(&key_sleft);
    eval 'sub key_smessage () { &CUR  $Strings[202];}' unless defined(&key_smessage);
    eval 'sub key_smove () { &CUR  $Strings[203];}' unless defined(&key_smove);
    eval 'sub key_snext () { &CUR  $Strings[204];}' unless defined(&key_snext);
    eval 'sub key_soptions () { &CUR  $Strings[205];}' unless defined(&key_soptions);
    eval 'sub key_sprevious () { &CUR  $Strings[206];}' unless defined(&key_sprevious);
    eval 'sub key_sprint () { &CUR  $Strings[207];}' unless defined(&key_sprint);
    eval 'sub key_sredo () { &CUR  $Strings[208];}' unless defined(&key_sredo);
    eval 'sub key_sreplace () { &CUR  $Strings[209];}' unless defined(&key_sreplace);
    eval 'sub key_sright () { &CUR  $Strings[210];}' unless defined(&key_sright);
    eval 'sub key_srsume () { &CUR  $Strings[211];}' unless defined(&key_srsume);
    eval 'sub key_ssave () { &CUR  $Strings[212];}' unless defined(&key_ssave);
    eval 'sub key_ssuspend () { &CUR  $Strings[213];}' unless defined(&key_ssuspend);
    eval 'sub key_sundo () { &CUR  $Strings[214];}' unless defined(&key_sundo);
    eval 'sub req_for_input () { &CUR  $Strings[215];}' unless defined(&req_for_input);
    eval 'sub key_f11 () { &CUR  $Strings[216];}' unless defined(&key_f11);
    eval 'sub key_f12 () { &CUR  $Strings[217];}' unless defined(&key_f12);
    eval 'sub key_f13 () { &CUR  $Strings[218];}' unless defined(&key_f13);
    eval 'sub key_f14 () { &CUR  $Strings[219];}' unless defined(&key_f14);
    eval 'sub key_f15 () { &CUR  $Strings[220];}' unless defined(&key_f15);
    eval 'sub key_f16 () { &CUR  $Strings[221];}' unless defined(&key_f16);
    eval 'sub key_f17 () { &CUR  $Strings[222];}' unless defined(&key_f17);
    eval 'sub key_f18 () { &CUR  $Strings[223];}' unless defined(&key_f18);
    eval 'sub key_f19 () { &CUR  $Strings[224];}' unless defined(&key_f19);
    eval 'sub key_f20 () { &CUR  $Strings[225];}' unless defined(&key_f20);
    eval 'sub key_f21 () { &CUR  $Strings[226];}' unless defined(&key_f21);
    eval 'sub key_f22 () { &CUR  $Strings[227];}' unless defined(&key_f22);
    eval 'sub key_f23 () { &CUR  $Strings[228];}' unless defined(&key_f23);
    eval 'sub key_f24 () { &CUR  $Strings[229];}' unless defined(&key_f24);
    eval 'sub key_f25 () { &CUR  $Strings[230];}' unless defined(&key_f25);
    eval 'sub key_f26 () { &CUR  $Strings[231];}' unless defined(&key_f26);
    eval 'sub key_f27 () { &CUR  $Strings[232];}' unless defined(&key_f27);
    eval 'sub key_f28 () { &CUR  $Strings[233];}' unless defined(&key_f28);
    eval 'sub key_f29 () { &CUR  $Strings[234];}' unless defined(&key_f29);
    eval 'sub key_f30 () { &CUR  $Strings[235];}' unless defined(&key_f30);
    eval 'sub key_f31 () { &CUR  $Strings[236];}' unless defined(&key_f31);
    eval 'sub key_f32 () { &CUR  $Strings[237];}' unless defined(&key_f32);
    eval 'sub key_f33 () { &CUR  $Strings[238];}' unless defined(&key_f33);
    eval 'sub key_f34 () { &CUR  $Strings[239];}' unless defined(&key_f34);
    eval 'sub key_f35 () { &CUR  $Strings[240];}' unless defined(&key_f35);
    eval 'sub key_f36 () { &CUR  $Strings[241];}' unless defined(&key_f36);
    eval 'sub key_f37 () { &CUR  $Strings[242];}' unless defined(&key_f37);
    eval 'sub key_f38 () { &CUR  $Strings[243];}' unless defined(&key_f38);
    eval 'sub key_f39 () { &CUR  $Strings[244];}' unless defined(&key_f39);
    eval 'sub key_f40 () { &CUR  $Strings[245];}' unless defined(&key_f40);
    eval 'sub key_f41 () { &CUR  $Strings[246];}' unless defined(&key_f41);
    eval 'sub key_f42 () { &CUR  $Strings[247];}' unless defined(&key_f42);
    eval 'sub key_f43 () { &CUR  $Strings[248];}' unless defined(&key_f43);
    eval 'sub key_f44 () { &CUR  $Strings[249];}' unless defined(&key_f44);
    eval 'sub key_f45 () { &CUR  $Strings[250];}' unless defined(&key_f45);
    eval 'sub key_f46 () { &CUR  $Strings[251];}' unless defined(&key_f46);
    eval 'sub key_f47 () { &CUR  $Strings[252];}' unless defined(&key_f47);
    eval 'sub key_f48 () { &CUR  $Strings[253];}' unless defined(&key_f48);
    eval 'sub key_f49 () { &CUR  $Strings[254];}' unless defined(&key_f49);
    eval 'sub key_f50 () { &CUR  $Strings[255];}' unless defined(&key_f50);
    eval 'sub key_f51 () { &CUR  $Strings[256];}' unless defined(&key_f51);
    eval 'sub key_f52 () { &CUR  $Strings[257];}' unless defined(&key_f52);
    eval 'sub key_f53 () { &CUR  $Strings[258];}' unless defined(&key_f53);
    eval 'sub key_f54 () { &CUR  $Strings[259];}' unless defined(&key_f54);
    eval 'sub key_f55 () { &CUR  $Strings[260];}' unless defined(&key_f55);
    eval 'sub key_f56 () { &CUR  $Strings[261];}' unless defined(&key_f56);
    eval 'sub key_f57 () { &CUR  $Strings[262];}' unless defined(&key_f57);
    eval 'sub key_f58 () { &CUR  $Strings[263];}' unless defined(&key_f58);
    eval 'sub key_f59 () { &CUR  $Strings[264];}' unless defined(&key_f59);
    eval 'sub key_f60 () { &CUR  $Strings[265];}' unless defined(&key_f60);
    eval 'sub key_f61 () { &CUR  $Strings[266];}' unless defined(&key_f61);
    eval 'sub key_f62 () { &CUR  $Strings[267];}' unless defined(&key_f62);
    eval 'sub key_f63 () { &CUR  $Strings[268];}' unless defined(&key_f63);
    eval 'sub clr_bol () { &CUR  $Strings[269];}' unless defined(&clr_bol);
    eval 'sub clear_margins () { &CUR  $Strings[270];}' unless defined(&clear_margins);
    eval 'sub set_left_margin () { &CUR  $Strings[271];}' unless defined(&set_left_margin);
    eval 'sub set_right_margin () { &CUR  $Strings[272];}' unless defined(&set_right_margin);
    eval 'sub label_format () { &CUR  $Strings[273];}' unless defined(&label_format);
    eval 'sub set_clock () { &CUR  $Strings[274];}' unless defined(&set_clock);
    eval 'sub display_clock () { &CUR  $Strings[275];}' unless defined(&display_clock);
    eval 'sub remove_clock () { &CUR  $Strings[276];}' unless defined(&remove_clock);
    eval 'sub create_window () { &CUR  $Strings[277];}' unless defined(&create_window);
    eval 'sub goto_window () { &CUR  $Strings[278];}' unless defined(&goto_window);
    eval 'sub hangup () { &CUR  $Strings[279];}' unless defined(&hangup);
    eval 'sub dial_phone () { &CUR  $Strings[280];}' unless defined(&dial_phone);
    eval 'sub quick_dial () { &CUR  $Strings[281];}' unless defined(&quick_dial);
    eval 'sub tone () { &CUR  $Strings[282];}' unless defined(&tone);
    eval 'sub pulse () { &CUR  $Strings[283];}' unless defined(&pulse);
    eval 'sub flash_hook () { &CUR  $Strings[284];}' unless defined(&flash_hook);
    eval 'sub fixed_pause () { &CUR  $Strings[285];}' unless defined(&fixed_pause);
    eval 'sub wait_tone () { &CUR  $Strings[286];}' unless defined(&wait_tone);
    eval 'sub user0 () { &CUR  $Strings[287];}' unless defined(&user0);
    eval 'sub user1 () { &CUR  $Strings[288];}' unless defined(&user1);
    eval 'sub user2 () { &CUR  $Strings[289];}' unless defined(&user2);
    eval 'sub user3 () { &CUR  $Strings[290];}' unless defined(&user3);
    eval 'sub user4 () { &CUR  $Strings[291];}' unless defined(&user4);
    eval 'sub user5 () { &CUR  $Strings[292];}' unless defined(&user5);
    eval 'sub user6 () { &CUR  $Strings[293];}' unless defined(&user6);
    eval 'sub user7 () { &CUR  $Strings[294];}' unless defined(&user7);
    eval 'sub user8 () { &CUR  $Strings[295];}' unless defined(&user8);
    eval 'sub user9 () { &CUR  $Strings[296];}' unless defined(&user9);
    eval 'sub orig_pair () { &CUR  $Strings[297];}' unless defined(&orig_pair);
    eval 'sub orig_colors () { &CUR  $Strings[298];}' unless defined(&orig_colors);
    eval 'sub initialize_color () { &CUR  $Strings[299];}' unless defined(&initialize_color);
    eval 'sub initialize_pair () { &CUR  $Strings[300];}' unless defined(&initialize_pair);
    eval 'sub set_color_pair () { &CUR  $Strings[301];}' unless defined(&set_color_pair);
    eval 'sub set_foreground () { &CUR  $Strings[302];}' unless defined(&set_foreground);
    eval 'sub set_background () { &CUR  $Strings[303];}' unless defined(&set_background);
    eval 'sub change_char_pitch () { &CUR  $Strings[304];}' unless defined(&change_char_pitch);
    eval 'sub change_line_pitch () { &CUR  $Strings[305];}' unless defined(&change_line_pitch);
    eval 'sub change_res_horz () { &CUR  $Strings[306];}' unless defined(&change_res_horz);
    eval 'sub change_res_vert () { &CUR  $Strings[307];}' unless defined(&change_res_vert);
    eval 'sub define_char () { &CUR  $Strings[308];}' unless defined(&define_char);
    eval 'sub enter_doublewide_mode () { &CUR  $Strings[309];}' unless defined(&enter_doublewide_mode);
    eval 'sub enter_draft_quality () { &CUR  $Strings[310];}' unless defined(&enter_draft_quality);
    eval 'sub enter_italics_mode () { &CUR  $Strings[311];}' unless defined(&enter_italics_mode);
    eval 'sub enter_leftward_mode () { &CUR  $Strings[312];}' unless defined(&enter_leftward_mode);
    eval 'sub enter_micro_mode () { &CUR  $Strings[313];}' unless defined(&enter_micro_mode);
    eval 'sub enter_near_letter_quality () { &CUR  $Strings[314];}' unless defined(&enter_near_letter_quality);
    eval 'sub enter_normal_quality () { &CUR  $Strings[315];}' unless defined(&enter_normal_quality);
    eval 'sub enter_shadow_mode () { &CUR  $Strings[316];}' unless defined(&enter_shadow_mode);
    eval 'sub enter_subscript_mode () { &CUR  $Strings[317];}' unless defined(&enter_subscript_mode);
    eval 'sub enter_superscript_mode () { &CUR  $Strings[318];}' unless defined(&enter_superscript_mode);
    eval 'sub enter_upward_mode () { &CUR  $Strings[319];}' unless defined(&enter_upward_mode);
    eval 'sub exit_doublewide_mode () { &CUR  $Strings[320];}' unless defined(&exit_doublewide_mode);
    eval 'sub exit_italics_mode () { &CUR  $Strings[321];}' unless defined(&exit_italics_mode);
    eval 'sub exit_leftward_mode () { &CUR  $Strings[322];}' unless defined(&exit_leftward_mode);
    eval 'sub exit_micro_mode () { &CUR  $Strings[323];}' unless defined(&exit_micro_mode);
    eval 'sub exit_shadow_mode () { &CUR  $Strings[324];}' unless defined(&exit_shadow_mode);
    eval 'sub exit_subscript_mode () { &CUR  $Strings[325];}' unless defined(&exit_subscript_mode);
    eval 'sub exit_superscript_mode () { &CUR  $Strings[326];}' unless defined(&exit_superscript_mode);
    eval 'sub exit_upward_mode () { &CUR  $Strings[327];}' unless defined(&exit_upward_mode);
    eval 'sub micro_column_address () { &CUR  $Strings[328];}' unless defined(&micro_column_address);
    eval 'sub micro_down () { &CUR  $Strings[329];}' unless defined(&micro_down);
    eval 'sub micro_left () { &CUR  $Strings[330];}' unless defined(&micro_left);
    eval 'sub micro_right () { &CUR  $Strings[331];}' unless defined(&micro_right);
    eval 'sub micro_row_address () { &CUR  $Strings[332];}' unless defined(&micro_row_address);
    eval 'sub micro_up () { &CUR  $Strings[333];}' unless defined(&micro_up);
    eval 'sub order_of_pins () { &CUR  $Strings[334];}' unless defined(&order_of_pins);
    eval 'sub parm_down_micro () { &CUR  $Strings[335];}' unless defined(&parm_down_micro);
    eval 'sub parm_left_micro () { &CUR  $Strings[336];}' unless defined(&parm_left_micro);
    eval 'sub parm_right_micro () { &CUR  $Strings[337];}' unless defined(&parm_right_micro);
    eval 'sub parm_up_micro () { &CUR  $Strings[338];}' unless defined(&parm_up_micro);
    eval 'sub select_char_set () { &CUR  $Strings[339];}' unless defined(&select_char_set);
    eval 'sub set_bottom_margin () { &CUR  $Strings[340];}' unless defined(&set_bottom_margin);
    eval 'sub set_bottom_margin_parm () { &CUR  $Strings[341];}' unless defined(&set_bottom_margin_parm);
    eval 'sub set_left_margin_parm () { &CUR  $Strings[342];}' unless defined(&set_left_margin_parm);
    eval 'sub set_right_margin_parm () { &CUR  $Strings[343];}' unless defined(&set_right_margin_parm);
    eval 'sub set_top_margin () { &CUR  $Strings[344];}' unless defined(&set_top_margin);
    eval 'sub set_top_margin_parm () { &CUR  $Strings[345];}' unless defined(&set_top_margin_parm);
    eval 'sub start_bit_image () { &CUR  $Strings[346];}' unless defined(&start_bit_image);
    eval 'sub start_char_set_def () { &CUR  $Strings[347];}' unless defined(&start_char_set_def);
    eval 'sub stop_bit_image () { &CUR  $Strings[348];}' unless defined(&stop_bit_image);
    eval 'sub stop_char_set_def () { &CUR  $Strings[349];}' unless defined(&stop_char_set_def);
    eval 'sub subscript_characters () { &CUR  $Strings[350];}' unless defined(&subscript_characters);
    eval 'sub superscript_characters () { &CUR  $Strings[351];}' unless defined(&superscript_characters);
    eval 'sub these_cause_cr () { &CUR  $Strings[352];}' unless defined(&these_cause_cr);
    eval 'sub zero_motion () { &CUR  $Strings[353];}' unless defined(&zero_motion);
    eval 'sub char_set_names () { &CUR  $Strings[354];}' unless defined(&char_set_names);
    eval 'sub key_mouse () { &CUR  $Strings[355];}' unless defined(&key_mouse);
    eval 'sub mouse_info () { &CUR  $Strings[356];}' unless defined(&mouse_info);
    eval 'sub req_mouse_pos () { &CUR  $Strings[357];}' unless defined(&req_mouse_pos);
    eval 'sub get_mouse () { &CUR  $Strings[358];}' unless defined(&get_mouse);
    eval 'sub set_a_foreground () { &CUR  $Strings[359];}' unless defined(&set_a_foreground);
    eval 'sub set_a_background () { &CUR  $Strings[360];}' unless defined(&set_a_background);
    eval 'sub pkey_plab () { &CUR  $Strings[361];}' unless defined(&pkey_plab);
    eval 'sub device_type () { &CUR  $Strings[362];}' unless defined(&device_type);
    eval 'sub code_set_init () { &CUR  $Strings[363];}' unless defined(&code_set_init);
    eval 'sub set0_des_seq () { &CUR  $Strings[364];}' unless defined(&set0_des_seq);
    eval 'sub set1_des_seq () { &CUR  $Strings[365];}' unless defined(&set1_des_seq);
    eval 'sub set2_des_seq () { &CUR  $Strings[366];}' unless defined(&set2_des_seq);
    eval 'sub set3_des_seq () { &CUR  $Strings[367];}' unless defined(&set3_des_seq);
    eval 'sub set_lr_margin () { &CUR  $Strings[368];}' unless defined(&set_lr_margin);
    eval 'sub set_tb_margin () { &CUR  $Strings[369];}' unless defined(&set_tb_margin);
    eval 'sub bit_image_repeat () { &CUR  $Strings[370];}' unless defined(&bit_image_repeat);
    eval 'sub bit_image_newline () { &CUR  $Strings[371];}' unless defined(&bit_image_newline);
    eval 'sub bit_image_carriage_return () { &CUR  $Strings[372];}' unless defined(&bit_image_carriage_return);
    eval 'sub color_names () { &CUR  $Strings[373];}' unless defined(&color_names);
    eval 'sub define_bit_image_region () { &CUR  $Strings[374];}' unless defined(&define_bit_image_region);
    eval 'sub end_bit_image_region () { &CUR  $Strings[375];}' unless defined(&end_bit_image_region);
    eval 'sub set_color_band () { &CUR  $Strings[376];}' unless defined(&set_color_band);
    eval 'sub set_page_length () { &CUR  $Strings[377];}' unless defined(&set_page_length);
    eval 'sub display_pc_char () { &CUR  $Strings[378];}' unless defined(&display_pc_char);
    eval 'sub enter_pc_charset_mode () { &CUR  $Strings[379];}' unless defined(&enter_pc_charset_mode);
    eval 'sub exit_pc_charset_mode () { &CUR  $Strings[380];}' unless defined(&exit_pc_charset_mode);
    eval 'sub enter_scancode_mode () { &CUR  $Strings[381];}' unless defined(&enter_scancode_mode);
    eval 'sub exit_scancode_mode () { &CUR  $Strings[382];}' unless defined(&exit_scancode_mode);
    eval 'sub pc_term_options () { &CUR  $Strings[383];}' unless defined(&pc_term_options);
    eval 'sub scancode_escape () { &CUR  $Strings[384];}' unless defined(&scancode_escape);
    eval 'sub alt_scancode_esc () { &CUR  $Strings[385];}' unless defined(&alt_scancode_esc);
    eval 'sub enter_horizontal_hl_mode () { &CUR  $Strings[386];}' unless defined(&enter_horizontal_hl_mode);
    eval 'sub enter_left_hl_mode () { &CUR  $Strings[387];}' unless defined(&enter_left_hl_mode);
    eval 'sub enter_low_hl_mode () { &CUR  $Strings[388];}' unless defined(&enter_low_hl_mode);
    eval 'sub enter_right_hl_mode () { &CUR  $Strings[389];}' unless defined(&enter_right_hl_mode);
    eval 'sub enter_top_hl_mode () { &CUR  $Strings[390];}' unless defined(&enter_top_hl_mode);
    eval 'sub enter_vertical_hl_mode () { &CUR  $Strings[391];}' unless defined(&enter_vertical_hl_mode);
    eval 'sub set_a_attributes () { &CUR  $Strings[392];}' unless defined(&set_a_attributes);
    eval 'sub set_pglen_inch () { &CUR  $Strings[393];}' unless defined(&set_pglen_inch);
    eval 'sub BOOLWRITE () {37;}' unless defined(&BOOLWRITE);
    eval 'sub NUMWRITE () {33;}' unless defined(&NUMWRITE);
    eval 'sub STRWRITE () {394;}' unless defined(&STRWRITE);
    eval 'sub beehive_glitch () { &no_esc_ctlc;}' unless defined(&beehive_glitch);
    eval 'sub teleray_glitch () { &dest_tabs_magic_smso;}' unless defined(&teleray_glitch);
    unless(defined(&micro_char_size)) {
	eval 'sub micro_char_size () { &micro_col_size;}' unless defined(&micro_char_size);
    }
    if(defined(&__INTERNAL_CAPS_VISIBLE)) {
	eval 'sub termcap_init2 () { &CUR  $Strings[394];}' unless defined(&termcap_init2);
	eval 'sub termcap_reset () { &CUR  $Strings[395];}' unless defined(&termcap_reset);
	eval 'sub magic_cookie_glitch_ul () { &CUR  $Numbers[33];}' unless defined(&magic_cookie_glitch_ul);
	eval 'sub backspaces_with_bs () { &CUR  $Booleans[37];}' unless defined(&backspaces_with_bs);
	eval 'sub crt_no_scrolling () { &CUR  $Booleans[38];}' unless defined(&crt_no_scrolling);
	eval 'sub no_correctly_working_cr () { &CUR  $Booleans[39];}' unless defined(&no_correctly_working_cr);
	eval 'sub carriage_return_delay () { &CUR  $Numbers[34];}' unless defined(&carriage_return_delay);
	eval 'sub new_line_delay () { &CUR  $Numbers[35];}' unless defined(&new_line_delay);
	eval 'sub linefeed_if_not_lf () { &CUR  $Strings[396];}' unless defined(&linefeed_if_not_lf);
	eval 'sub backspace_if_not_bs () { &CUR  $Strings[397];}' unless defined(&backspace_if_not_bs);
	eval 'sub gnu_has_meta_key () { &CUR  $Booleans[40];}' unless defined(&gnu_has_meta_key);
	eval 'sub linefeed_is_newline () { &CUR  $Booleans[41];}' unless defined(&linefeed_is_newline);
	eval 'sub backspace_delay () { &CUR  $Numbers[36];}' unless defined(&backspace_delay);
	eval 'sub horizontal_tab_delay () { &CUR  $Numbers[37];}' unless defined(&horizontal_tab_delay);
	eval 'sub number_of_function_keys () { &CUR  $Numbers[38];}' unless defined(&number_of_function_keys);
	eval 'sub other_non_function_keys () { &CUR  $Strings[398];}' unless defined(&other_non_function_keys);
	eval 'sub arrow_key_map () { &CUR  $Strings[399];}' unless defined(&arrow_key_map);
	eval 'sub has_hardware_tabs () { &CUR  $Booleans[42];}' unless defined(&has_hardware_tabs);
	eval 'sub return_does_clr_eol () { &CUR  $Booleans[43];}' unless defined(&return_does_clr_eol);
	eval 'sub acs_ulcorner () { &CUR  $Strings[400];}' unless defined(&acs_ulcorner);
	eval 'sub acs_llcorner () { &CUR  $Strings[401];}' unless defined(&acs_llcorner);
	eval 'sub acs_urcorner () { &CUR  $Strings[402];}' unless defined(&acs_urcorner);
	eval 'sub acs_lrcorner () { &CUR  $Strings[403];}' unless defined(&acs_lrcorner);
	eval 'sub acs_ltee () { &CUR  $Strings[404];}' unless defined(&acs_ltee);
	eval 'sub acs_rtee () { &CUR  $Strings[405];}' unless defined(&acs_rtee);
	eval 'sub acs_btee () { &CUR  $Strings[406];}' unless defined(&acs_btee);
	eval 'sub acs_ttee () { &CUR  $Strings[407];}' unless defined(&acs_ttee);
	eval 'sub acs_hline () { &CUR  $Strings[408];}' unless defined(&acs_hline);
	eval 'sub acs_vline () { &CUR  $Strings[409];}' unless defined(&acs_vline);
	eval 'sub acs_plus () { &CUR  $Strings[410];}' unless defined(&acs_plus);
	eval 'sub memory_lock () { &CUR  $Strings[411];}' unless defined(&memory_lock);
	eval 'sub memory_unlock () { &CUR  $Strings[412];}' unless defined(&memory_unlock);
	eval 'sub box_chars_1 () { &CUR  $Strings[413];}' unless defined(&box_chars_1);
    }
    eval 'sub BOOLCOUNT () {44;}' unless defined(&BOOLCOUNT);
    eval 'sub NUMCOUNT () {39;}' unless defined(&NUMCOUNT);
    eval 'sub STRCOUNT () {414;}' unless defined(&STRCOUNT);
    eval 'sub acs_chars_index () {146;}' unless defined(&acs_chars_index);
    if((defined(&NCURSES_XNAMES) ? &NCURSES_XNAMES : undef)) {
    }
    if(defined(&NCURSES_INTERNALS)) {
	if((defined(&NCURSES_XNAMES) ? &NCURSES_XNAMES : undef)) {
	}
    } else {
    }
    if(0 && !0) {
    }
 elsif(0) {
	eval 'sub cur_term () { &NCURSES_PUBLIC_VAR( &cur_term());}' unless defined(&cur_term);
    } else {
    }
    if(0|| 0) {
	eval 'sub boolnames () { &NCURSES_PUBLIC_VAR( &boolnames());}' unless defined(&boolnames);
	eval 'sub boolcodes () { &NCURSES_PUBLIC_VAR( &boolcodes());}' unless defined(&boolcodes);
	eval 'sub boolfnames () { &NCURSES_PUBLIC_VAR( &boolfnames());}' unless defined(&boolfnames);
	eval 'sub numnames () { &NCURSES_PUBLIC_VAR( &numnames());}' unless defined(&numnames);
	eval 'sub numcodes () { &NCURSES_PUBLIC_VAR( &numcodes());}' unless defined(&numcodes);
	eval 'sub numfnames () { &NCURSES_PUBLIC_VAR( &numfnames());}' unless defined(&numfnames);
	eval 'sub strnames () { &NCURSES_PUBLIC_VAR( &strnames());}' unless defined(&strnames);
	eval 'sub strcodes () { &NCURSES_PUBLIC_VAR( &strcodes());}' unless defined(&strcodes);
	eval 'sub strfnames () { &NCURSES_PUBLIC_VAR( &strfnames());}' unless defined(&strfnames);
    } else {
    }
    if(defined(&NCURSES_INTERNALS)) {
    }
    if(!defined(&__NCURSES_H)) {
	if(1) {
	} else {
	}
    }
    if(!defined(&NCURSES_TERMCAP_H_incl)) {
    }
    if(defined(&NCURSES_SP_FUNCS)  && ((defined(&NCURSES_SP_FUNCS) ? &NCURSES_SP_FUNCS : undef) != 0)) {
	if(1) {
	} else {
	}
    }
    if(defined(&__cplusplus)) {
    }
}
1;

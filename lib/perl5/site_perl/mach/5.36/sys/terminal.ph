require '_h2ph_pre.ph';

no warnings qw(redefine misc);

unless(defined(&_SYS_TERMINAL_H_)) {
    eval 'sub _SYS_TERMINAL_H_ () {1;}' unless defined(&_SYS_TERMINAL_H_);
    require 'sys/param.ph';
    require 'sys/_lock.ph';
    require 'sys/_mutex.ph';
    require 'sys/cons.ph';
    require 'sys/linker_set.ph';
    require 'sys/ttycom.ph';
    require 'teken/teken.ph';
    require 'sys/opt_syscons.ph';
    require 'sys/opt_teken.ph';
    eval 'sub TCHAR_CHARACTER {
        my($c) = @_;
	    eval q((($c) & 0x1fffff));
    }' unless defined(&TCHAR_CHARACTER);
    eval 'sub TCHAR_FORMAT {
        my($c) = @_;
	    eval q(((($c) >> 21) & 0x1f));
    }' unless defined(&TCHAR_FORMAT);
    eval 'sub TCHAR_FGCOLOR {
        my($c) = @_;
	    eval q(((($c) >> 26) & 0x7));
    }' unless defined(&TCHAR_FGCOLOR);
    eval 'sub TCHAR_BGCOLOR {
        my($c) = @_;
	    eval q(((($c) >> 29) & 0x7));
    }' unless defined(&TCHAR_BGCOLOR);
    eval 'sub TCOLOR_FG {
        my($c) = @_;
	    eval q(((($c) & 0x7) << 26));
    }' unless defined(&TCOLOR_FG);
    eval 'sub TCOLOR_BG {
        my($c) = @_;
	    eval q(((($c) & 0x7) << 29));
    }' unless defined(&TCOLOR_BG);
    eval 'sub TCOLOR_LIGHT {
        my($c) = @_;
	    eval q((($c) | 0x8));
    }' unless defined(&TCOLOR_LIGHT);
    eval 'sub TCOLOR_DARK {
        my($c) = @_;
	    eval q((($c) & ~0x8));
    }' unless defined(&TCOLOR_DARK);
    eval 'sub TFORMAT {
        my($c) = @_;
	    eval q(((($c) & 0x1f) << 21));
    }' unless defined(&TFORMAT);
    eval 'sub FG_BLACK () { &TCOLOR_FG( &TC_BLACK);}' unless defined(&FG_BLACK);
    eval 'sub FG_BLUE () { &TCOLOR_FG( &TC_BLUE);}' unless defined(&FG_BLUE);
    eval 'sub FG_GREEN () { &TCOLOR_FG( &TC_GREEN);}' unless defined(&FG_GREEN);
    eval 'sub FG_CYAN () { &TCOLOR_FG( &TC_CYAN);}' unless defined(&FG_CYAN);
    eval 'sub FG_RED () { &TCOLOR_FG( &TC_RED);}' unless defined(&FG_RED);
    eval 'sub FG_MAGENTA () { &TCOLOR_FG( &TC_MAGENTA);}' unless defined(&FG_MAGENTA);
    eval 'sub FG_BROWN () { &TCOLOR_FG( &TC_YELLOW);}' unless defined(&FG_BROWN);
    eval 'sub FG_LIGHTGREY () { &TCOLOR_FG( &TC_WHITE);}' unless defined(&FG_LIGHTGREY);
    eval 'sub FG_DARKGREY () {( &TFORMAT( &TF_BOLD) |  &TCOLOR_FG( &TC_BLACK));}' unless defined(&FG_DARKGREY);
    eval 'sub FG_LIGHTBLUE () {( &TFORMAT( &TF_BOLD) |  &TCOLOR_FG( &TC_BLUE));}' unless defined(&FG_LIGHTBLUE);
    eval 'sub FG_LIGHTGREEN () {( &TFORMAT( &TF_BOLD) |  &TCOLOR_FG( &TC_GREEN));}' unless defined(&FG_LIGHTGREEN);
    eval 'sub FG_LIGHTCYAN () {( &TFORMAT( &TF_BOLD) |  &TCOLOR_FG( &TC_CYAN));}' unless defined(&FG_LIGHTCYAN);
    eval 'sub FG_LIGHTRED () {( &TFORMAT( &TF_BOLD) |  &TCOLOR_FG( &TC_RED));}' unless defined(&FG_LIGHTRED);
    eval 'sub FG_LIGHTMAGENTA () {( &TFORMAT( &TF_BOLD) |  &TCOLOR_FG( &TC_MAGENTA));}' unless defined(&FG_LIGHTMAGENTA);
    eval 'sub FG_YELLOW () {( &TFORMAT( &TF_BOLD) |  &TCOLOR_FG( &TC_YELLOW));}' unless defined(&FG_YELLOW);
    eval 'sub FG_WHITE () {( &TFORMAT( &TF_BOLD) |  &TCOLOR_FG( &TC_WHITE));}' unless defined(&FG_WHITE);
    eval 'sub FG_BLINK () { &TFORMAT( &TF_BLINK);}' unless defined(&FG_BLINK);
    eval 'sub BG_BLACK () { &TCOLOR_BG( &TC_BLACK);}' unless defined(&BG_BLACK);
    eval 'sub BG_BLUE () { &TCOLOR_BG( &TC_BLUE);}' unless defined(&BG_BLUE);
    eval 'sub BG_GREEN () { &TCOLOR_BG( &TC_GREEN);}' unless defined(&BG_GREEN);
    eval 'sub BG_CYAN () { &TCOLOR_BG( &TC_CYAN);}' unless defined(&BG_CYAN);
    eval 'sub BG_RED () { &TCOLOR_BG( &TC_RED);}' unless defined(&BG_RED);
    eval 'sub BG_MAGENTA () { &TCOLOR_BG( &TC_MAGENTA);}' unless defined(&BG_MAGENTA);
    eval 'sub BG_BROWN () { &TCOLOR_BG( &TC_YELLOW);}' unless defined(&BG_BROWN);
    eval 'sub BG_LIGHTGREY () { &TCOLOR_BG( &TC_WHITE);}' unless defined(&BG_LIGHTGREY);
    eval 'sub BG_DARKGREY () {( &TFORMAT( &TF_BOLD) |  &TCOLOR_BG( &TC_BLACK));}' unless defined(&BG_DARKGREY);
    eval 'sub BG_LIGHTBLUE () {( &TFORMAT( &TF_BOLD) |  &TCOLOR_BG( &TC_BLUE));}' unless defined(&BG_LIGHTBLUE);
    eval 'sub BG_LIGHTGREEN () {( &TFORMAT( &TF_BOLD) |  &TCOLOR_BG( &TC_GREEN));}' unless defined(&BG_LIGHTGREEN);
    eval 'sub BG_LIGHTCYAN () {( &TFORMAT( &TF_BOLD) |  &TCOLOR_BG( &TC_CYAN));}' unless defined(&BG_LIGHTCYAN);
    eval 'sub BG_LIGHTRED () {( &TFORMAT( &TF_BOLD) |  &TCOLOR_BG( &TC_RED));}' unless defined(&BG_LIGHTRED);
    eval 'sub BG_LIGHTMAGENTA () {( &TFORMAT( &TF_BOLD) |  &TCOLOR_BG( &TC_MAGENTA));}' unless defined(&BG_LIGHTMAGENTA);
    eval 'sub BG_YELLOW () {( &TFORMAT( &TF_BOLD) |  &TCOLOR_BG( &TC_YELLOW));}' unless defined(&BG_YELLOW);
    eval 'sub BG_WHITE () {( &TFORMAT( &TF_BOLD) |  &TCOLOR_BG( &TC_WHITE));}' unless defined(&BG_WHITE);
    unless(defined(&TERMINAL_NORM_ATTR)) {
	if(defined(&SC_NORM_ATTR)) {
	    eval 'sub TERMINAL_NORM_ATTR () { &SC_NORM_ATTR;}' unless defined(&TERMINAL_NORM_ATTR);
	} else {
	    eval 'sub TERMINAL_NORM_ATTR () {( &FG_LIGHTGREY |  &BG_BLACK);}' unless defined(&TERMINAL_NORM_ATTR);
	}
    }
    unless(defined(&TERMINAL_KERN_ATTR)) {
	if(defined(&SC_KERNEL_CONS_ATTR)) {
	    eval 'sub TERMINAL_KERN_ATTR () { &SC_KERNEL_CONS_ATTR;}' unless defined(&TERMINAL_KERN_ATTR);
	} else {
	    eval 'sub TERMINAL_KERN_ATTR () {( &FG_WHITE |  &BG_BLACK);}' unless defined(&TERMINAL_KERN_ATTR);
	}
    }
    eval 'sub TF_MUTE () {0x1;}' unless defined(&TF_MUTE);
    eval 'sub TF_BELL () {0x2;}' unless defined(&TF_BELL);
    eval 'sub TF_CONS () {0x4;}' unless defined(&TF_CONS);
    if(defined(&_KERNEL)) {
	eval 'sub TERMINAL_DECLARE_EARLY {
	    my($name, $class, $softc) = @_;
    	    eval q( &static \'struct terminal\' $name = { . &tm_class = $class, . &tm_softc = $softc, . &tm_flags =  &TF_CONS, };  &CONSOLE_DEVICE($name   &_consdev,  &termcn_cnops, $name));
	}' unless defined(&TERMINAL_DECLARE_EARLY);
    }
}
1;

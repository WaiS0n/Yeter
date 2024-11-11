require '_h2ph_pre.ph';

no warnings qw(redefine misc);

unless(defined(&_SYS_TTYDEVSW_H_)) {
    eval 'sub _SYS_TTYDEVSW_H_ () {1;}' unless defined(&_SYS_TTYDEVSW_H_);
    unless(defined(&_SYS_TTY_H_)) {
	die("can only be included through <sys/tty.h>");
    }
    eval 'sub ttydevsw_open {
        my($tp) = @_;
	    eval q({  &tty_assert_locked($tp);  &MPASS(! &tty_gone($tp)); ( ($tp->{t_devsw}->{tsw_open})($tp)); });
    }' unless defined(&ttydevsw_open);
    eval 'sub ttydevsw_close {
        my($tp) = @_;
	    eval q({  &tty_assert_locked($tp);  &MPASS(! &tty_gone($tp));  ($tp->{t_devsw}->{tsw_close})($tp); });
    }' unless defined(&ttydevsw_close);
    eval 'sub ttydevsw_outwakeup {
        my($tp) = @_;
	    eval q({  &tty_assert_locked($tp);  &MPASS(! &tty_gone($tp));  &if ( &ttydisc_getc_poll($tp) == 0) ;  ($tp->{t_devsw}->{tsw_outwakeup})($tp); });
    }' unless defined(&ttydevsw_outwakeup);
    eval 'sub ttydevsw_inwakeup {
        my($tp) = @_;
	    eval q({  &tty_assert_locked($tp);  &MPASS(! &tty_gone($tp));  &if ( ($tp->{t_flags}) &  &TF_HIWAT_IN) ;  ($tp->{t_devsw}->{tsw_inwakeup})($tp); });
    }' unless defined(&ttydevsw_inwakeup);
    eval 'sub ttydevsw_ioctl {
        my($tp,$cmd,$data,$td) = @_;
	    eval q({  &tty_assert_locked($tp);  &MPASS(! &tty_gone($tp)); ( ($tp->{t_devsw}->{tsw_ioctl})($tp, $cmd, $data, $td)); });
    }' unless defined(&ttydevsw_ioctl);
    eval 'sub ttydevsw_cioctl {
        my($tp,$unit,$cmd,$data,$td) = @_;
	    eval q({  &tty_assert_locked($tp);  &MPASS(! &tty_gone($tp)); ( ($tp->{t_devsw}->{tsw_cioctl})($tp, $unit, $cmd, $data, $td)); });
    }' unless defined(&ttydevsw_cioctl);
    eval 'sub ttydevsw_param {
        my($tp,$t) = @_;
	    eval q({  &MPASS(! &tty_gone($tp)); ( ($tp->{t_devsw}->{tsw_param})($tp, $t)); });
    }' unless defined(&ttydevsw_param);
    eval 'sub ttydevsw_modem {
        my($tp,$sigon,$sigoff) = @_;
	    eval q({  &MPASS(! &tty_gone($tp)); ( ($tp->{t_devsw}->{tsw_modem})($tp, $sigon, $sigoff)); });
    }' unless defined(&ttydevsw_modem);
    eval 'sub ttydevsw_mmap {
        my($tp,$offset,$paddr,$nprot,$memattr) = @_;
	    eval q({  &MPASS(! &tty_gone($tp)); ( ($tp->{t_devsw}->{tsw_mmap})($tp, $offset, $paddr, $nprot, $memattr)); });
    }' unless defined(&ttydevsw_mmap);
    eval 'sub ttydevsw_pktnotify {
        my($tp,$event) = @_;
	    eval q({  &tty_assert_locked($tp);  &MPASS(! &tty_gone($tp));  ($tp->{t_devsw}->{tsw_pktnotify})($tp, $event); });
    }' unless defined(&ttydevsw_pktnotify);
    eval 'sub ttydevsw_free {
        my($tp) = @_;
	    eval q({  &MPASS( &tty_gone($tp));  ($tp->{t_devsw}->{tsw_free})( &tty_softc($tp)); });
    }' unless defined(&ttydevsw_free);
    eval 'sub ttydevsw_busy {
        my($tp) = @_;
	    eval q({  &tty_assert_locked($tp);  &MPASS(! &tty_gone($tp)); ( ($tp->{t_devsw}->{tsw_busy})($tp)); });
    }' unless defined(&ttydevsw_busy);
}
1;

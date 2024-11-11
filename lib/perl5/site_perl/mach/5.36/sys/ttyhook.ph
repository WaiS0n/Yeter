require '_h2ph_pre.ph';

no warnings qw(redefine misc);

unless(defined(&_SYS_TTYHOOK_H_)) {
    eval 'sub _SYS_TTYHOOK_H_ () {1;}' unless defined(&_SYS_TTYHOOK_H_);
    unless(defined(&_SYS_TTY_H_)) {
	die("can only be included through <sys/tty.h>");
    }
    eval 'sub ttyhook_softc {
        my($tp) = @_;
	    eval q((($tp)-> &t_hooksoftc));
    }' unless defined(&ttyhook_softc);
    eval 'sub ttyhook_hashook {
        my($tp,$hook) = @_;
	    eval q((($tp)-> &t_hook !=  &NULL  && ($tp)-> ($t_hook->{th_})  $hook !=  &NULL));
    }' unless defined(&ttyhook_hashook);
    eval 'sub ttyhook_rint {
        my($tp,$c,$flags) = @_;
	    eval q({  &tty_assert_locked($tp);  &MPASS(! &tty_gone($tp));  ($tp->{t_hook}->{th_rint})($tp, $c, $flags); });
    }' unless defined(&ttyhook_rint);
    eval 'sub ttyhook_rint_bypass {
        my($tp,$buf,$len) = @_;
	    eval q({  &tty_assert_locked($tp);  &MPASS(! &tty_gone($tp));  ($tp->{t_hook}->{th_rint_bypass})($tp, $buf, $len); });
    }' unless defined(&ttyhook_rint_bypass);
    eval 'sub ttyhook_rint_done {
        my($tp) = @_;
	    eval q({  &tty_assert_locked($tp);  &MPASS(! &tty_gone($tp));  ($tp->{t_hook}->{th_rint_done})($tp); });
    }' unless defined(&ttyhook_rint_done);
    eval 'sub ttyhook_rint_poll {
        my($tp) = @_;
	    eval q({  &tty_assert_locked($tp);  &MPASS(! &tty_gone($tp));  ($tp->{t_hook}->{th_rint_poll})($tp); });
    }' unless defined(&ttyhook_rint_poll);
    eval 'sub ttyhook_getc_inject {
        my($tp,$buf,$len) = @_;
	    eval q({  &tty_assert_locked($tp);  &MPASS(! &tty_gone($tp));  ($tp->{t_hook}->{th_getc_inject})($tp, $buf, $len); });
    }' unless defined(&ttyhook_getc_inject);
    eval 'sub ttyhook_getc_capture {
        my($tp,$buf,$len) = @_;
	    eval q({  &tty_assert_locked($tp);  &MPASS(! &tty_gone($tp));  ($tp->{t_hook}->{th_getc_capture})($tp, $buf, $len); });
    }' unless defined(&ttyhook_getc_capture);
    eval 'sub ttyhook_getc_poll {
        my($tp) = @_;
	    eval q({  &tty_assert_locked($tp);  &MPASS(! &tty_gone($tp));  ($tp->{t_hook}->{th_getc_poll})($tp); });
    }' unless defined(&ttyhook_getc_poll);
    eval 'sub ttyhook_close {
        my($tp) = @_;
	    eval q({  &tty_assert_locked($tp);  ($tp->{t_hook}->{th_close})($tp); });
    }' unless defined(&ttyhook_close);
}
1;

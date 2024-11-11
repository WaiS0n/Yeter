require '_h2ph_pre.ph';

no warnings qw(redefine misc);

unless(defined(&_SYS_TTYDISC_H_)) {
    eval 'sub _SYS_TTYDISC_H_ () {1;}' unless defined(&_SYS_TTYDISC_H_);
    unless(defined(&_SYS_TTY_H_)) {
	die("can only be included through <sys/tty.h>");
    }
    eval 'sub ttydisc_can_bypass {
        my($tp) = @_;
	    eval q((($tp)-> &t_flags &  &TF_BYPASS));
    }' unless defined(&ttydisc_can_bypass);
    eval 'sub TRE_FRAMING () {0x1;}' unless defined(&TRE_FRAMING);
    eval 'sub TRE_PARITY () {0x2;}' unless defined(&TRE_PARITY);
    eval 'sub TRE_OVERRUN () {0x4;}' unless defined(&TRE_OVERRUN);
    eval 'sub TRE_BREAK () {0x8;}' unless defined(&TRE_BREAK);
    eval 'sub ttydisc_read_poll {
        my($tp) = @_;
	    eval q({  &tty_assert_locked($tp);  &ttyinq_bytescanonicalized( ($tp->{t_inq})); });
    }' unless defined(&ttydisc_read_poll);
    eval 'sub ttydisc_write_poll {
        my($tp) = @_;
	    eval q({  &tty_assert_locked($tp);  &ttyoutq_bytesleft( ($tp->{t_outq})); });
    }' unless defined(&ttydisc_write_poll);
}
1;

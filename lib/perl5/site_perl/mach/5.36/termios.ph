require '_h2ph_pre.ph';

no warnings qw(redefine misc);

unless(defined(&_TERMIOS_H_)) {
    eval 'sub _TERMIOS_H_ () {1;}' unless defined(&_TERMIOS_H_);
    require 'sys/cdefs.ph';
    require 'sys/_termios.ph';
    require 'sys/_types.ph';
    if((defined(&__BSD_VISIBLE) ? &__BSD_VISIBLE : undef)) {
	require 'sys/_winsize.ph';
    }
    unless(defined(&_PID_T_DECLARED)) {
	eval 'sub _PID_T_DECLARED () {1;}' unless defined(&_PID_T_DECLARED);
    }
    if((defined(&__BSD_VISIBLE) ? &__BSD_VISIBLE : undef)) {
	eval 'sub OXTABS () { &TAB3;}' unless defined(&OXTABS);
	eval 'sub MDMBUF () { &CCAR_OFLOW;}' unless defined(&MDMBUF);
    }
    if((defined(&__BSD_VISIBLE) ? &__BSD_VISIBLE : undef)) {
	eval 'sub CCEQ {
	    my($val, $c) = @_;
    	    eval q((($c) == ($val)  && ($val) !=  &_POSIX_VDISABLE));
	}' unless defined(&CCEQ);
    }
    eval 'sub TCSANOW () {0;}' unless defined(&TCSANOW);
    eval 'sub TCSADRAIN () {1;}' unless defined(&TCSADRAIN);
    eval 'sub TCSAFLUSH () {2;}' unless defined(&TCSAFLUSH);
    if((defined(&__BSD_VISIBLE) ? &__BSD_VISIBLE : undef)) {
	eval 'sub TCSASOFT () {0x10;}' unless defined(&TCSASOFT);
    }
    eval 'sub TCIFLUSH () {1;}' unless defined(&TCIFLUSH);
    eval 'sub TCOFLUSH () {2;}' unless defined(&TCOFLUSH);
    eval 'sub TCIOFLUSH () {3;}' unless defined(&TCIOFLUSH);
    eval 'sub TCOOFF () {1;}' unless defined(&TCOOFF);
    eval 'sub TCOON () {2;}' unless defined(&TCOON);
    eval 'sub TCIOFF () {3;}' unless defined(&TCIOFF);
    eval 'sub TCION () {4;}' unless defined(&TCION);
    if((defined(&__POSIX_VISIBLE) ? &__POSIX_VISIBLE : undef) >= 200112) {
    }
    if((defined(&__BSD_VISIBLE) ? &__BSD_VISIBLE : undef)) {
    }
}
if((defined(&__BSD_VISIBLE) ? &__BSD_VISIBLE : undef)) {
    require 'sys/ttycom.ph';
    require 'sys/ttydefaults.ph';
}
1;

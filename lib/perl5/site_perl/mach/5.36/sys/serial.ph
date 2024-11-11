require '_h2ph_pre.ph';

no warnings qw(redefine misc);

unless(defined(&_SYS_SERIAL_H_)) {
    eval 'sub _SYS_SERIAL_H_ () {1;}' unless defined(&_SYS_SERIAL_H_);
    eval 'sub SER_DTR () {0x1;}' unless defined(&SER_DTR);
    eval 'sub SER_RTS () {0x2;}' unless defined(&SER_RTS);
    eval 'sub SER_STX () {0x4;}' unless defined(&SER_STX);
    eval 'sub SER_SRX () {0x8;}' unless defined(&SER_SRX);
    eval 'sub SER_CTS () {0x10;}' unless defined(&SER_CTS);
    eval 'sub SER_DCD () {0x20;}' unless defined(&SER_DCD);
    eval 'sub SER_RI () {0x40;}' unless defined(&SER_RI);
    eval 'sub SER_DSR () {0x80;}' unless defined(&SER_DSR);
    eval 'sub SER_MASK_STATE () {0xff;}' unless defined(&SER_MASK_STATE);
    eval 'sub SER_DELTA {
        my($x) = @_;
	    eval q((($x) << 8));
    }' unless defined(&SER_DELTA);
    eval 'sub SER_DDTR () { &SER_DELTA( &SER_DTR);}' unless defined(&SER_DDTR);
    eval 'sub SER_DRTS () { &SER_DELTA( &SER_RTS);}' unless defined(&SER_DRTS);
    eval 'sub SER_DSTX () { &SER_DELTA( &SER_STX);}' unless defined(&SER_DSTX);
    eval 'sub SER_DSRX () { &SER_DELTA( &SER_SRX);}' unless defined(&SER_DSRX);
    eval 'sub SER_DCTS () { &SER_DELTA( &SER_CTS);}' unless defined(&SER_DCTS);
    eval 'sub SER_DDCD () { &SER_DELTA( &SER_DCD);}' unless defined(&SER_DDCD);
    eval 'sub SER_DRI () { &SER_DELTA( &SER_RI);}' unless defined(&SER_DRI);
    eval 'sub SER_DDSR () { &SER_DELTA( &SER_DSR);}' unless defined(&SER_DDSR);
    eval 'sub SER_MASK_DELTA () { &SER_DELTA( &SER_MASK_STATE);}' unless defined(&SER_MASK_DELTA);
    if(defined(&_KERNEL)) {
	eval 'sub SER_INT_OVERRUN () {0x10000;}' unless defined(&SER_INT_OVERRUN);
	eval 'sub SER_INT_BREAK () {0x20000;}' unless defined(&SER_INT_BREAK);
	eval 'sub SER_INT_RXREADY () {0x40000;}' unless defined(&SER_INT_RXREADY);
	eval 'sub SER_INT_SIGCHG () {0x80000;}' unless defined(&SER_INT_SIGCHG);
	eval 'sub SER_INT_TXIDLE () {0x100000;}' unless defined(&SER_INT_TXIDLE);
	eval 'sub SER_INT_MASK () {0xff0000;}' unless defined(&SER_INT_MASK);
	eval 'sub SER_INT_SIGMASK () {( &SER_MASK_DELTA |  &SER_MASK_STATE);}' unless defined(&SER_INT_SIGMASK);
	unless(defined(&LOCORE)) {
	}
    }
}
1;

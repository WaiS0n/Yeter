require '_h2ph_pre.ph';

no warnings qw(redefine misc);

unless(defined(&_SYS_TIMEX_H_)) {
    eval 'sub _SYS_TIMEX_H_ () {1;}' unless defined(&_SYS_TIMEX_H_);
    eval 'sub NTP_API () {4;}' unless defined(&NTP_API);
    if(defined(&__FreeBSD__)) {
	require 'sys/_timespec.ph';
    }
    eval 'sub MAXPHASE () {500000000;}' unless defined(&MAXPHASE);
    eval 'sub MAXFREQ () {500000;}' unless defined(&MAXFREQ);
    eval 'sub MINSEC () {256;}' unless defined(&MINSEC);
    eval 'sub MAXSEC () {2048;}' unless defined(&MAXSEC);
    eval 'sub NANOSECOND () {1000000000;}' unless defined(&NANOSECOND);
    eval 'sub SCALE_PPM () {(65536/ 1000);}' unless defined(&SCALE_PPM);
    eval 'sub MAXTC () {10;}' unless defined(&MAXTC);
    eval 'sub MOD_OFFSET () {0x1;}' unless defined(&MOD_OFFSET);
    eval 'sub MOD_FREQUENCY () {0x2;}' unless defined(&MOD_FREQUENCY);
    eval 'sub MOD_MAXERROR () {0x4;}' unless defined(&MOD_MAXERROR);
    eval 'sub MOD_ESTERROR () {0x8;}' unless defined(&MOD_ESTERROR);
    eval 'sub MOD_STATUS () {0x10;}' unless defined(&MOD_STATUS);
    eval 'sub MOD_TIMECONST () {0x20;}' unless defined(&MOD_TIMECONST);
    eval 'sub MOD_PPSMAX () {0x40;}' unless defined(&MOD_PPSMAX);
    eval 'sub MOD_TAI () {0x80;}' unless defined(&MOD_TAI);
    eval 'sub MOD_MICRO () {0x1000;}' unless defined(&MOD_MICRO);
    eval 'sub MOD_NANO () {0x2000;}' unless defined(&MOD_NANO);
    eval 'sub MOD_CLKB () {0x4000;}' unless defined(&MOD_CLKB);
    eval 'sub MOD_CLKA () {0x8000;}' unless defined(&MOD_CLKA);
    eval 'sub STA_PLL () {0x1;}' unless defined(&STA_PLL);
    eval 'sub STA_PPSFREQ () {0x2;}' unless defined(&STA_PPSFREQ);
    eval 'sub STA_PPSTIME () {0x4;}' unless defined(&STA_PPSTIME);
    eval 'sub STA_FLL () {0x8;}' unless defined(&STA_FLL);
    eval 'sub STA_INS () {0x10;}' unless defined(&STA_INS);
    eval 'sub STA_DEL () {0x20;}' unless defined(&STA_DEL);
    eval 'sub STA_UNSYNC () {0x40;}' unless defined(&STA_UNSYNC);
    eval 'sub STA_FREQHOLD () {0x80;}' unless defined(&STA_FREQHOLD);
    eval 'sub STA_PPSSIGNAL () {0x100;}' unless defined(&STA_PPSSIGNAL);
    eval 'sub STA_PPSJITTER () {0x200;}' unless defined(&STA_PPSJITTER);
    eval 'sub STA_PPSWANDER () {0x400;}' unless defined(&STA_PPSWANDER);
    eval 'sub STA_PPSERROR () {0x800;}' unless defined(&STA_PPSERROR);
    eval 'sub STA_CLOCKERR () {0x1000;}' unless defined(&STA_CLOCKERR);
    eval 'sub STA_NANO () {0x2000;}' unless defined(&STA_NANO);
    eval 'sub STA_MODE () {0x4000;}' unless defined(&STA_MODE);
    eval 'sub STA_CLK () {0x8000;}' unless defined(&STA_CLK);
    eval 'sub STA_RONLY () {( &STA_PPSSIGNAL |  &STA_PPSJITTER |  &STA_PPSWANDER |  &STA_PPSERROR |  &STA_CLOCKERR |  &STA_NANO |  &STA_MODE |  &STA_CLK);}' unless defined(&STA_RONLY);
    eval 'sub TIME_OK () {0;}' unless defined(&TIME_OK);
    eval 'sub TIME_INS () {1;}' unless defined(&TIME_INS);
    eval 'sub TIME_DEL () {2;}' unless defined(&TIME_DEL);
    eval 'sub TIME_OOP () {3;}' unless defined(&TIME_OOP);
    eval 'sub TIME_WAIT () {4;}' unless defined(&TIME_WAIT);
    eval 'sub TIME_ERROR () {5;}' unless defined(&TIME_ERROR);
    if(defined(&__FreeBSD__)) {
	if(defined(&_KERNEL)) {
	} else {
	    require 'sys/cdefs.ph';
	}
    }
}
1;

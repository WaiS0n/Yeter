require '_h2ph_pre.ph';

no warnings qw(redefine misc);

unless(defined(&_SYS_TIMEFF_H_)) {
    eval 'sub _SYS_TIMEFF_H_ () {1;}' unless defined(&_SYS_TIMEFF_H_);
    require 'sys/_ffcounter.ph';
    if((defined(&__BSD_VISIBLE) ? &__BSD_VISIBLE : undef)) {
	if(defined(&_KERNEL)) {
	    eval 'sub SYSCLOCK_FBCK () {0;}' unless defined(&SYSCLOCK_FBCK);
	    eval 'sub SYSCLOCK_FFWD () {1;}' unless defined(&SYSCLOCK_FFWD);
	    eval 'sub FFCLOCK_SKM_SCALE () {1024;}' unless defined(&FFCLOCK_SKM_SCALE);
	    eval 'sub FFCLOCK_STA_UNSYNC () {1;}' unless defined(&FFCLOCK_STA_UNSYNC);
	    eval 'sub FFCLOCK_STA_WARMUP () {2;}' unless defined(&FFCLOCK_STA_WARMUP);
	    eval 'sub FFCLOCK_FAST () {0x1;}' unless defined(&FFCLOCK_FAST);
	    eval 'sub FFCLOCK_LERP () {0x2;}' unless defined(&FFCLOCK_LERP);
	    eval 'sub FFCLOCK_LEAPSEC () {0x4;}' unless defined(&FFCLOCK_LEAPSEC);
	    eval 'sub FFCLOCK_UPTIME () {0x8;}' unless defined(&FFCLOCK_UPTIME);
	    eval 'sub FFCLOCK_MASK () {0xffff;}' unless defined(&FFCLOCK_MASK);
	    eval 'sub FBCLOCK_FAST () {0x10000;}' unless defined(&FBCLOCK_FAST);
	    eval 'sub FBCLOCK_UPTIME () {0x20000;}' unless defined(&FBCLOCK_UPTIME);
	    eval 'sub FBCLOCK_MASK () {0xffff0000;}' unless defined(&FBCLOCK_MASK);
	    eval 'sub nanotime_fromclock {
	        my($tsp,$whichclock) = @_;
    		eval q({  &if ($whichclock ==  &SYSCLOCK_FFWD)  &ffclock_nanotime($tsp);  &else  &fbclock_nanotime($tsp); });
	    }' unless defined(&nanotime_fromclock);
	    eval 'sub microtime_fromclock {
	        my($tvp,$whichclock) = @_;
    		eval q({  &if ($whichclock ==  &SYSCLOCK_FFWD)  &ffclock_microtime($tvp);  &else  &fbclock_microtime($tvp); });
	    }' unless defined(&microtime_fromclock);
	    eval 'sub getbintime_fromclock {
	        my($bt,$whichclock) = @_;
    		eval q({  &if ($whichclock ==  &SYSCLOCK_FFWD)  &ffclock_getbintime($bt);  &else  &fbclock_getbintime($bt); });
	    }' unless defined(&getbintime_fromclock);
	    eval 'sub getnanotime_fromclock {
	        my($tsp,$whichclock) = @_;
    		eval q({  &if ($whichclock ==  &SYSCLOCK_FFWD)  &ffclock_getnanotime($tsp);  &else  &fbclock_getnanotime($tsp); });
	    }' unless defined(&getnanotime_fromclock);
	    eval 'sub getmicrotime_fromclock {
	        my($tvp,$whichclock) = @_;
    		eval q({  &if ($whichclock ==  &SYSCLOCK_FFWD)  &ffclock_getmicrotime($tvp);  &else  &fbclock_getmicrotime($tvp); });
	    }' unless defined(&getmicrotime_fromclock);
	    eval 'sub binuptime_fromclock {
	        my($bt,$whichclock) = @_;
    		eval q({  &if ($whichclock ==  &SYSCLOCK_FFWD)  &ffclock_binuptime($bt);  &else  &fbclock_binuptime($bt); });
	    }' unless defined(&binuptime_fromclock);
	    eval 'sub nanouptime_fromclock {
	        my($tsp,$whichclock) = @_;
    		eval q({  &if ($whichclock ==  &SYSCLOCK_FFWD)  &ffclock_nanouptime($tsp);  &else  &fbclock_nanouptime($tsp); });
	    }' unless defined(&nanouptime_fromclock);
	    eval 'sub microuptime_fromclock {
	        my($tvp,$whichclock) = @_;
    		eval q({  &if ($whichclock ==  &SYSCLOCK_FFWD)  &ffclock_microuptime($tvp);  &else  &fbclock_microuptime($tvp); });
	    }' unless defined(&microuptime_fromclock);
	    eval 'sub getbinuptime_fromclock {
	        my($bt,$whichclock) = @_;
    		eval q({  &if ($whichclock ==  &SYSCLOCK_FFWD)  &ffclock_getbinuptime($bt);  &else  &fbclock_getbinuptime($bt); });
	    }' unless defined(&getbinuptime_fromclock);
	    eval 'sub getnanouptime_fromclock {
	        my($tsp,$whichclock) = @_;
    		eval q({  &if ($whichclock ==  &SYSCLOCK_FFWD)  &ffclock_getnanouptime($tsp);  &else  &fbclock_getnanouptime($tsp); });
	    }' unless defined(&getnanouptime_fromclock);
	    eval 'sub getmicrouptime_fromclock {
	        my($tvp,$whichclock) = @_;
    		eval q({  &if ($whichclock ==  &SYSCLOCK_FFWD)  &ffclock_getmicrouptime($tvp);  &else  &fbclock_getmicrouptime($tvp); });
	    }' unless defined(&getmicrouptime_fromclock);
	} else {
	}
    }
}
1;

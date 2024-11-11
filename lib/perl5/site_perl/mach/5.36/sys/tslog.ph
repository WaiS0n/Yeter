require '_h2ph_pre.ph';

no warnings qw(redefine misc);

unless(defined(&_TSLOG_H_)) {
    eval 'sub _TSLOG_H_ () {1;}' unless defined(&_TSLOG_H_);
    if(defined(&_KERNEL)) {
	if(defined(&TSLOG)) {
	    require 'sys/_types.ph';
	    require 'sys/pcpu.ph';
	}
	eval 'sub TS_ENTER () {0;}' unless defined(&TS_ENTER);
	eval 'sub TS_EXIT () {1;}' unless defined(&TS_EXIT);
	eval 'sub TS_THREAD () {2;}' unless defined(&TS_THREAD);
	eval 'sub TS_EVENT () {3;}' unless defined(&TS_EVENT);
	eval 'sub TSENTER () {
	    eval q( &TSRAW( &curthread,  &TS_ENTER,  &__func__,  &NULL));
	}' unless defined(&TSENTER);
	eval 'sub TSENTER2 {
	    my($x) = @_;
    	    eval q( &TSRAW( &curthread,  &TS_ENTER,  &__func__, $x));
	}' unless defined(&TSENTER2);
	eval 'sub TSEXIT () {
	    eval q( &TSRAW( &curthread,  &TS_EXIT,  &__func__,  &NULL));
	}' unless defined(&TSEXIT);
	eval 'sub TSEXIT2 {
	    my($x) = @_;
    	    eval q( &TSRAW( &curthread,  &TS_EXIT,  &__func__, $x));
	}' unless defined(&TSEXIT2);
	eval 'sub TSTHREAD {
	    my($td, $x) = @_;
    	    eval q( &TSRAW($td,  &TS_THREAD, $x,  &NULL));
	}' unless defined(&TSTHREAD);
	eval 'sub TSEVENT {
	    my($x) = @_;
    	    eval q( &TSRAW( &curthread,  &TS_EVENT, $x,  &NULL));
	}' unless defined(&TSEVENT);
	eval 'sub TSEVENT2 {
	    my($x, $y) = @_;
    	    eval q( &TSRAW( &curthread,  &TS_EVENT, $x, $y));
	}' unless defined(&TSEVENT2);
	eval 'sub TSLINE () {
	    eval q( &TSEVENT2( &__FILE__,  &__XSTRING( &__LINE__)));
	}' unless defined(&TSLINE);
	eval 'sub TSWAIT {
	    my($x) = @_;
    	    eval q( &TSEVENT2(\\"WAIT\\", $x););
	}' unless defined(&TSWAIT);
	eval 'sub TSUNWAIT {
	    my($x) = @_;
    	    eval q( &TSEVENT2(\\"UNWAIT\\", $x););
	}' unless defined(&TSUNWAIT);
	eval 'sub TSHOLD {
	    my($x) = @_;
    	    eval q( &TSEVENT2(\\"HOLD\\", $x););
	}' unless defined(&TSHOLD);
	eval 'sub TSRELEASE {
	    my($x) = @_;
    	    eval q( &TSEVENT2(\\"RELEASE\\", $x););
	}' unless defined(&TSRELEASE);
	eval 'sub TSFORK {
	    my($p, $pp) = @_;
    	    eval q( &TSRAW_USER($p, $pp,  &NULL,  &NULL));
	}' unless defined(&TSFORK);
	eval 'sub TSEXEC {
	    my($p, $name) = @_;
    	    eval q( &TSRAW_USER($p, ( &pid_t)(-1), $name,  &NULL));
	}' unless defined(&TSEXEC);
	eval 'sub TSNAMEI {
	    my($p, $name) = @_;
    	    eval q( &TSRAW_USER($p, ( &pid_t)(-1),  &NULL, $name));
	}' unless defined(&TSNAMEI);
	eval 'sub TSPROCEXIT {
	    my($p) = @_;
    	    eval q( &TSRAW_USER($p, ( &pid_t)(-1),  &NULL,  &NULL));
	}' unless defined(&TSPROCEXIT);
	if(defined(&TSLOG)) {
	    eval 'sub TSRAW {
	        my($a, $b, $c, $d) = @_;
    		eval q( &tslog($a, $b, $c, $d));
	    }' unless defined(&TSRAW);
	    eval 'sub TSRAW_USER {
	        my($a, $b, $c, $d) = @_;
    		eval q( &tslog_user($a, $b, $c, $d));
	    }' unless defined(&TSRAW_USER);
	} else {
	    eval 'sub TSRAW {
	        my($a, $b, $c, $d) = @_;
    		eval q();
	    }' unless defined(&TSRAW);
	    eval 'sub TSRAW_USER {
	        my($a, $b, $c, $d) = @_;
    		eval q();
	    }' unless defined(&TSRAW_USER);
	}
    }
}
1;

require '_h2ph_pre.ph';

no warnings qw(redefine misc);

unless(defined(&_SYS_RMLOCK_H_)) {
    eval 'sub _SYS_RMLOCK_H_ () {1;}' unless defined(&_SYS_RMLOCK_H_);
    require 'sys/mutex.ph';
    require 'sys/sx.ph';
    require 'sys/_lock.ph';
    require 'sys/_rmlock.ph';
    if(defined(&_KERNEL)) {
	eval 'sub RM_NOWITNESS () {0x1;}' unless defined(&RM_NOWITNESS);
	eval 'sub RM_RECURSE () {0x2;}' unless defined(&RM_RECURSE);
	eval 'sub RM_SLEEPABLE () {0x4;}' unless defined(&RM_SLEEPABLE);
	eval 'sub RM_NEW () {0x8;}' unless defined(&RM_NEW);
	eval 'sub RM_DUPOK () {0x10;}' unless defined(&RM_DUPOK);
	if(defined(&INVARIANTS) || defined(&INVARIANT_SUPPORT)) {
	}
	unless(defined(&LOCK_DEBUG)) {
	    die("LOCK_DEBUG\ not\ defined\,\ include\ \<sys\/lock\.h\>\ before\ \<sys\/rmlock\.h\>");
	}
	if((defined(&LOCK_DEBUG) ? &LOCK_DEBUG : undef) > 0) {
	    eval 'sub rm_wlock {
	        my($rm) = @_;
    		eval q( &_rm_wlock_debug(($rm),  &LOCK_FILE,  &LOCK_LINE));
	    }' unless defined(&rm_wlock);
	    eval 'sub rm_wunlock {
	        my($rm) = @_;
    		eval q( &_rm_wunlock_debug(($rm),  &LOCK_FILE,  &LOCK_LINE));
	    }' unless defined(&rm_wunlock);
	    eval 'sub rm_rlock {
	        my($rm,$tracker) = @_;
    		eval q((( &void) &_rm_rlock_debug(($rm),($tracker), 0,  &LOCK_FILE,  &LOCK_LINE )));
	    }' unless defined(&rm_rlock);
	    eval 'sub rm_try_rlock {
	        my($rm,$tracker) = @_;
    		eval q( &_rm_rlock_debug(($rm),($tracker), 1,  &LOCK_FILE,  &LOCK_LINE ));
	    }' unless defined(&rm_try_rlock);
	    eval 'sub rm_runlock {
	        my($rm,$tracker) = @_;
    		eval q( &_rm_runlock_debug(($rm), ($tracker),  &LOCK_FILE,  &LOCK_LINE ));
	    }' unless defined(&rm_runlock);
	} else {
	    eval 'sub rm_wlock {
	        my($rm) = @_;
    		eval q( &_rm_wlock(($rm)));
	    }' unless defined(&rm_wlock);
	    eval 'sub rm_wunlock {
	        my($rm) = @_;
    		eval q( &_rm_wunlock(($rm)));
	    }' unless defined(&rm_wunlock);
	    eval 'sub rm_rlock {
	        my($rm,$tracker) = @_;
    		eval q((( &void) &_rm_rlock(($rm),($tracker), 0)));
	    }' unless defined(&rm_rlock);
	    eval 'sub rm_try_rlock {
	        my($rm,$tracker) = @_;
    		eval q( &_rm_rlock(($rm),($tracker), 1));
	    }' unless defined(&rm_try_rlock);
	    eval 'sub rm_runlock {
	        my($rm,$tracker) = @_;
    		eval q( &_rm_runlock(($rm), ($tracker)));
	    }' unless defined(&rm_runlock);
	}
	eval 'sub rm_sleep {
	    my($chan, $rm, $pri, $wmesg, $timo) = @_;
    	    eval q( &_sleep(($chan), ($rm)-> &lock_object, ($pri), ($wmesg),  &tick_sbt * ($timo), 0,  &C_HARDCLOCK));
	}' unless defined(&rm_sleep);
	eval 'sub RM_SYSINIT_FLAGS {
	    my($name, $rm, $desc, $flags) = @_;
    	    eval q( &static \'struct rm_args\' $name &_args = { ($rm), ($desc), ($flags), };  &SYSINIT($name &_rm_sysinit,  &SI_SUB_LOCK,  &SI_ORDER_MIDDLE,  &rm_sysinit, $name &_args);  &SYSUNINIT($name &_rm_sysuninit,  &SI_SUB_LOCK,  &SI_ORDER_MIDDLE,  &rm_destroy, ($rm)));
	}' unless defined(&RM_SYSINIT_FLAGS);
	eval 'sub RM_SYSINIT {
	    my($name, $rm, $desc) = @_;
    	    eval q( &RM_SYSINIT_FLAGS($name, $rm, $desc, 0));
	}' unless defined(&RM_SYSINIT);
	if(defined(&INVARIANTS) || defined(&INVARIANT_SUPPORT)) {
	    eval 'sub RA_LOCKED () { &LA_LOCKED;}' unless defined(&RA_LOCKED);
	    eval 'sub RA_RLOCKED () { &LA_SLOCKED;}' unless defined(&RA_RLOCKED);
	    eval 'sub RA_WLOCKED () { &LA_XLOCKED;}' unless defined(&RA_WLOCKED);
	    eval 'sub RA_UNLOCKED () { &LA_UNLOCKED;}' unless defined(&RA_UNLOCKED);
	    eval 'sub RA_RECURSED () { &LA_RECURSED;}' unless defined(&RA_RECURSED);
	    eval 'sub RA_NOTRECURSED () { &LA_NOTRECURSED;}' unless defined(&RA_NOTRECURSED);
	}
	if(defined(&INVARIANTS)) {
	    eval 'sub rm_assert {
	        my($rm, $what) = @_;
    		eval q( &_rm_assert(($rm), ($what),  &LOCK_FILE,  &LOCK_LINE));
	    }' unless defined(&rm_assert);
	} else {
	    eval 'sub rm_assert {
	        my($rm, $what) = @_;
    		eval q();
	    }' unless defined(&rm_assert);
	}
	eval 'sub rms_wowned {
	    my($rms) = @_;
    	    eval q({ ( ($rms->{owner}) ==  &curthread); });
	}' unless defined(&rms_wowned);
	if(defined(&INVARIANTS)) {
	    eval 'sub rms_assert_rlock_ok {
	        my($x) = @_;
    		eval q( &WITNESS_WARN( &WARN_GIANTOK |  &WARN_SLEEPOK,  &NULL,  &__func__););
	    }' unless defined(&rms_assert_rlock_ok);
	} else {
	    eval 'sub rms_assert_rlock_ok {
	        my($x) = @_;
    		eval q();
	    }' unless defined(&rms_assert_rlock_ok);
	}
	if(defined(&INVARIANTS)) {
	    eval 'sub rms_owned_any {
	        my($rms) = @_;
    		eval q({  &if ( &rms_wowned($rms)) (1); ( &rms_rowned($rms)); });
	    }' unless defined(&rms_owned_any);
	}
    }
}
1;

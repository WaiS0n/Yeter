require '_h2ph_pre.ph';

no warnings qw(redefine misc);

unless(defined(&_SYS_SX_H_)) {
    eval 'sub _SYS_SX_H_ () {1;}' unless defined(&_SYS_SX_H_);
    require 'sys/_lock.ph';
    require 'sys/_sx.ph';
    if(defined(&_KERNEL)) {
	require 'sys/pcpu.ph';
	require 'sys/lock_profile.ph';
	require 'sys/lockstat.ph';
	require 'machine/atomic.ph';
    }
    eval 'sub SX_LOCK_SHARED () {0x1;}' unless defined(&SX_LOCK_SHARED);
    eval 'sub SX_LOCK_SHARED_WAITERS () {0x2;}' unless defined(&SX_LOCK_SHARED_WAITERS);
    eval 'sub SX_LOCK_EXCLUSIVE_WAITERS () {0x4;}' unless defined(&SX_LOCK_EXCLUSIVE_WAITERS);
    eval 'sub SX_LOCK_WRITE_SPINNER () {0x8;}' unless defined(&SX_LOCK_WRITE_SPINNER);
    eval 'sub SX_LOCK_RECURSED () {0x10;}' unless defined(&SX_LOCK_RECURSED);
    eval 'sub SX_LOCK_FLAGMASK () {( &SX_LOCK_SHARED |  &SX_LOCK_SHARED_WAITERS |  &SX_LOCK_EXCLUSIVE_WAITERS |  &SX_LOCK_RECURSED |  &SX_LOCK_WRITE_SPINNER);}' unless defined(&SX_LOCK_FLAGMASK);
    eval 'sub SX_LOCK_WAITERS () {( &SX_LOCK_SHARED_WAITERS |  &SX_LOCK_EXCLUSIVE_WAITERS);}' unless defined(&SX_LOCK_WAITERS);
    eval 'sub SX_OWNER {
        my($x) = @_;
	    eval q((($x) & ~ &SX_LOCK_FLAGMASK));
    }' unless defined(&SX_OWNER);
    eval 'sub SX_SHARERS_SHIFT () {5;}' unless defined(&SX_SHARERS_SHIFT);
    eval 'sub SX_SHARERS {
        my($x) = @_;
	    eval q(( &SX_OWNER($x) >>  &SX_SHARERS_SHIFT));
    }' unless defined(&SX_SHARERS);
    eval 'sub SX_SHARERS_LOCK {
        my($x) = @_;
	    eval q((($x) <<  &SX_SHARERS_SHIFT |  &SX_LOCK_SHARED));
    }' unless defined(&SX_SHARERS_LOCK);
    eval 'sub SX_ONE_SHARER () {(1<<  &SX_SHARERS_SHIFT);}' unless defined(&SX_ONE_SHARER);
    eval 'sub SX_LOCK_UNLOCKED () { &SX_SHARERS_LOCK(0);}' unless defined(&SX_LOCK_UNLOCKED);
    eval 'sub SX_LOCK_DESTROYED () {( &SX_LOCK_SHARED_WAITERS |  &SX_LOCK_EXCLUSIVE_WAITERS);}' unless defined(&SX_LOCK_DESTROYED);
    if(defined(&_KERNEL)) {
	eval 'sub sx_recurse () { ($lock_object->{lo_data});}' unless defined(&sx_recurse);
	eval 'sub SX_READ_VALUE {
	    my($sx) = @_;
    	    eval q((($sx)-> &sx_lock));
	}' unless defined(&SX_READ_VALUE);
	eval 'sub lv_sx_owner {
	    my($v) = @_;
    	    eval q((($v &  &SX_LOCK_SHARED) ?  &NULL :  &SX_OWNER($v)));
	}' unless defined(&lv_sx_owner);
	eval 'sub sx_init {
	    my($sx, $desc) = @_;
    	    eval q( &sx_init_flags(($sx), ($desc), 0));
	}' unless defined(&sx_init);
	if(defined(&INVARIANTS) || defined(&INVARIANT_SUPPORT)) {
	}
	if(defined(&DDB)) {
	}
	eval 'sub SX_SYSINIT_FLAGS {
	    my($name, $sxa, $desc, $flags) = @_;
    	    eval q( &static \'struct sx_args\' $name &_args = { ($sxa), ($desc), ($flags) };  &SYSINIT($name &_sx_sysinit,  &SI_SUB_LOCK,  &SI_ORDER_MIDDLE,  &sx_sysinit, $name &_args);  &SYSUNINIT($name &_sx_sysuninit,  &SI_SUB_LOCK,  &SI_ORDER_MIDDLE,  &sx_destroy, ($sxa)));
	}' unless defined(&SX_SYSINIT_FLAGS);
	eval 'sub SX_SYSINIT {
	    my($name, $sxa, $desc) = @_;
    	    eval q( &SX_SYSINIT_FLAGS($name, $sxa, $desc, 0));
	}' unless defined(&SX_SYSINIT);
	if(((defined(&LOCK_DEBUG) ? &LOCK_DEBUG : undef) == 0)) {
	}
	unless(defined(&LOCK_DEBUG)) {
	    die("LOCK_DEBUG not defined, include <sys/lock.h> before <sys/sx.h>");
	}
	if(((defined(&LOCK_DEBUG) ? &LOCK_DEBUG : undef) > 0) || defined(&SX_NOINLINE)) {
	    eval 'sub sx_xlock_ {
	        my($sx, $file, $line) = @_;
    		eval q(( &void) &_sx_xlock(($sx), 0, ($file), ($line)));
	    }' unless defined(&sx_xlock_);
	    eval 'sub sx_xlock_sig_ {
	        my($sx, $file, $line) = @_;
    		eval q( &_sx_xlock(($sx),  &SX_INTERRUPTIBLE, ($file), ($line)));
	    }' unless defined(&sx_xlock_sig_);
	    eval 'sub sx_xunlock_ {
	        my($sx, $file, $line) = @_;
    		eval q( &_sx_xunlock(($sx), ($file), ($line)));
	    }' unless defined(&sx_xunlock_);
	} else {
	    eval 'sub sx_xlock_ {
	        my($sx, $file, $line) = @_;
    		eval q(( &void) &__sx_xlock(($sx),  &curthread, 0, ($file), ($line)));
	    }' unless defined(&sx_xlock_);
	    eval 'sub sx_xlock_sig_ {
	        my($sx, $file, $line) = @_;
    		eval q( &__sx_xlock(($sx),  &curthread,  &SX_INTERRUPTIBLE, ($file), ($line)));
	    }' unless defined(&sx_xlock_sig_);
	    eval 'sub sx_xunlock_ {
	        my($sx, $file, $line) = @_;
    		eval q( &__sx_xunlock(($sx),  &curthread, ($file), ($line)));
	    }' unless defined(&sx_xunlock_);
	}
	if(((defined(&LOCK_DEBUG) ? &LOCK_DEBUG : undef) > 0)) {
	    eval 'sub sx_slock_ {
	        my($sx, $file, $line) = @_;
    		eval q(( &void) &_sx_slock(($sx), 0, ($file), ($line)));
	    }' unless defined(&sx_slock_);
	    eval 'sub sx_slock_sig_ {
	        my($sx, $file, $line) = @_;
    		eval q( &_sx_slock(($sx),  &SX_INTERRUPTIBLE, ($file) , ($line)));
	    }' unless defined(&sx_slock_sig_);
	    eval 'sub sx_sunlock_ {
	        my($sx, $file, $line) = @_;
    		eval q( &_sx_sunlock(($sx), ($file), ($line)));
	    }' unless defined(&sx_sunlock_);
	    eval 'sub sx_try_slock {
	        my($sx) = @_;
    		eval q( &sx_try_slock_(($sx),  &LOCK_FILE,  &LOCK_LINE));
	    }' unless defined(&sx_try_slock);
	    eval 'sub sx_try_xlock {
	        my($sx) = @_;
    		eval q( &sx_try_xlock_(($sx),  &LOCK_FILE,  &LOCK_LINE));
	    }' unless defined(&sx_try_xlock);
	    eval 'sub sx_try_upgrade {
	        my($sx) = @_;
    		eval q( &sx_try_upgrade_(($sx),  &LOCK_FILE,  &LOCK_LINE));
	    }' unless defined(&sx_try_upgrade);
	    eval 'sub sx_downgrade {
	        my($sx) = @_;
    		eval q( &sx_downgrade_(($sx),  &LOCK_FILE,  &LOCK_LINE));
	    }' unless defined(&sx_downgrade);
	} else {
	    eval 'sub sx_slock_ {
	        my($sx, $file, $line) = @_;
    		eval q(( &void) &_sx_slock_int(($sx), 0));
	    }' unless defined(&sx_slock_);
	    eval 'sub sx_slock_sig_ {
	        my($sx, $file, $line) = @_;
    		eval q( &_sx_slock_int(($sx),  &SX_INTERRUPTIBLE));
	    }' unless defined(&sx_slock_sig_);
	    eval 'sub sx_sunlock_ {
	        my($sx, $file, $line) = @_;
    		eval q( &_sx_sunlock_int(($sx)));
	    }' unless defined(&sx_sunlock_);
	    eval 'sub sx_try_slock {
	        my($sx) = @_;
    		eval q( &sx_try_slock_int(($sx)));
	    }' unless defined(&sx_try_slock);
	    eval 'sub sx_try_xlock {
	        my($sx) = @_;
    		eval q( &sx_try_xlock_int(($sx)));
	    }' unless defined(&sx_try_xlock);
	    eval 'sub sx_try_upgrade {
	        my($sx) = @_;
    		eval q( &sx_try_upgrade_int(($sx)));
	    }' unless defined(&sx_try_upgrade);
	    eval 'sub sx_downgrade {
	        my($sx) = @_;
    		eval q( &sx_downgrade_int(($sx)));
	    }' unless defined(&sx_downgrade);
	}
	if(defined(&INVARIANTS)) {
	    eval 'sub sx_assert_ {
	        my($sx, $what, $file, $line) = @_;
    		eval q( &_sx_assert(($sx), ($what), ($file), ($line)));
	    }' unless defined(&sx_assert_);
	} else {
	    eval 'sub sx_assert_ {
	        my($sx, $what, $file, $line) = @_;
    		eval q(( &void)0);
	    }' unless defined(&sx_assert_);
	}
	eval 'sub sx_xlock {
	    my($sx) = @_;
    	    eval q( &sx_xlock_(($sx),  &LOCK_FILE,  &LOCK_LINE));
	}' unless defined(&sx_xlock);
	eval 'sub sx_xlock_sig {
	    my($sx) = @_;
    	    eval q( &sx_xlock_sig_(($sx),  &LOCK_FILE,  &LOCK_LINE));
	}' unless defined(&sx_xlock_sig);
	eval 'sub sx_xunlock {
	    my($sx) = @_;
    	    eval q( &sx_xunlock_(($sx),  &LOCK_FILE,  &LOCK_LINE));
	}' unless defined(&sx_xunlock);
	eval 'sub sx_slock {
	    my($sx) = @_;
    	    eval q( &sx_slock_(($sx),  &LOCK_FILE,  &LOCK_LINE));
	}' unless defined(&sx_slock);
	eval 'sub sx_slock_sig {
	    my($sx) = @_;
    	    eval q( &sx_slock_sig_(($sx),  &LOCK_FILE,  &LOCK_LINE));
	}' unless defined(&sx_slock_sig);
	eval 'sub sx_sunlock {
	    my($sx) = @_;
    	    eval q( &sx_sunlock_(($sx),  &LOCK_FILE,  &LOCK_LINE));
	}' unless defined(&sx_sunlock);
	eval 'sub sx_assert {
	    my($sx, $what) = @_;
    	    eval q( &sx_assert_(($sx), ($what),  &__FILE__,  &__LINE__));
	}' unless defined(&sx_assert);
	eval 'sub sx_xholder {
	    my($sx) = @_;
    	    eval q((($sx)-> &sx_lock &  &SX_LOCK_SHARED ?  &NULL :  &SX_OWNER(($sx)-> &sx_lock)));
	}' unless defined(&sx_xholder);
	eval 'sub sx_xlocked {
	    my($sx) = @_;
    	    eval q(((($sx)-> &sx_lock & ~( &SX_LOCK_FLAGMASK & ~ &SX_LOCK_SHARED)) == ( &uintptr_t) &curthread));
	}' unless defined(&sx_xlocked);
	eval 'sub sx_unlock_ {
	    my($sx, $file, $line) = @_;
    	    eval q( &__extension__ ({  &if ( &sx_xlocked($sx))  &sx_xunlock_($sx, $file, $line);  &else  &sx_sunlock_($sx, $file, $line); ( &void)0; }));
	}' unless defined(&sx_unlock_);
	eval 'sub sx_unlock {
	    my($sx) = @_;
    	    eval q( &sx_unlock_(($sx),  &LOCK_FILE,  &LOCK_LINE));
	}' unless defined(&sx_unlock);
	eval 'sub sx_sleep {
	    my($chan, $sx, $pri, $wmesg, $timo) = @_;
    	    eval q( &_sleep(($chan), ($sx)-> &lock_object, ($pri), ($wmesg),  &tick_sbt * ($timo), 0,  &C_HARDCLOCK));
	}' unless defined(&sx_sleep);
	eval 'sub SX_DUPOK () {0x1;}' unless defined(&SX_DUPOK);
	eval 'sub SX_NOPROFILE () {0x2;}' unless defined(&SX_NOPROFILE);
	eval 'sub SX_NOWITNESS () {0x4;}' unless defined(&SX_NOWITNESS);
	eval 'sub SX_QUIET () {0x8;}' unless defined(&SX_QUIET);
	eval 'sub SX_RECURSE () {0x20;}' unless defined(&SX_RECURSE);
	eval 'sub SX_NEW () {0x40;}' unless defined(&SX_NEW);
	eval 'sub SX_INTERRUPTIBLE () {0x40;}' unless defined(&SX_INTERRUPTIBLE);
	if(defined(&INVARIANTS) || defined(&INVARIANT_SUPPORT)) {
	    eval 'sub SA_LOCKED () { &LA_LOCKED;}' unless defined(&SA_LOCKED);
	    eval 'sub SA_SLOCKED () { &LA_SLOCKED;}' unless defined(&SA_SLOCKED);
	    eval 'sub SA_XLOCKED () { &LA_XLOCKED;}' unless defined(&SA_XLOCKED);
	    eval 'sub SA_UNLOCKED () { &LA_UNLOCKED;}' unless defined(&SA_UNLOCKED);
	    eval 'sub SA_RECURSED () { &LA_RECURSED;}' unless defined(&SA_RECURSED);
	    eval 'sub SA_NOTRECURSED () { &LA_NOTRECURSED;}' unless defined(&SA_NOTRECURSED);
	    eval 'sub SX_LOCKED () { &LA_LOCKED;}' unless defined(&SX_LOCKED);
	    eval 'sub SX_SLOCKED () { &LA_SLOCKED;}' unless defined(&SX_SLOCKED);
	    eval 'sub SX_XLOCKED () { &LA_XLOCKED;}' unless defined(&SX_XLOCKED);
	    eval 'sub SX_UNLOCKED () { &LA_UNLOCKED;}' unless defined(&SX_UNLOCKED);
	    eval 'sub SX_RECURSED () { &LA_RECURSED;}' unless defined(&SX_RECURSED);
	    eval 'sub SX_NOTRECURSED () { &LA_NOTRECURSED;}' unless defined(&SX_NOTRECURSED);
	}
    }
    if(defined(&_STANDALONE)) {
	eval 'sub sx_xlock {
	    my($s) = @_;
    	    eval q((1));
	}' unless defined(&sx_xlock);
	eval 'sub sx_try_xlock {
	    my($s) = @_;
    	    eval q((1));
	}' unless defined(&sx_try_xlock);
	eval 'sub sx_xunlock {
	    my($s) = @_;
    	    eval q((1));
	}' unless defined(&sx_xunlock);
	eval 'sub SX_DUPOK () {0;}' unless defined(&SX_DUPOK);
	eval 'sub SX_NEW () {0;}' unless defined(&SX_NEW);
	eval 'sub SX_NOWITNESS () {0;}' unless defined(&SX_NOWITNESS);
	eval 'sub sx_init_flags {
	    my($sx,$description,$opts) = @_;
    	    eval q({ });
	}' unless defined(&sx_init_flags);
	eval 'sub sx_destroy {
	    my($sx) = @_;
    	    eval q({ });
	}' unless defined(&sx_destroy);
    }
}
1;

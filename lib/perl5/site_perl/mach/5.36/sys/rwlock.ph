require '_h2ph_pre.ph';

no warnings qw(redefine misc);

unless(defined(&_SYS_RWLOCK_H_)) {
    eval 'sub _SYS_RWLOCK_H_ () {1;}' unless defined(&_SYS_RWLOCK_H_);
    require 'sys/_lock.ph';
    require 'sys/_rwlock.ph';
    require 'sys/lock_profile.ph';
    require 'sys/lockstat.ph';
    if(defined(&_KERNEL)) {
	require 'sys/pcpu.ph';
	require 'machine/atomic.ph';
    }
    eval 'sub RW_LOCK_READ () {0x1;}' unless defined(&RW_LOCK_READ);
    eval 'sub RW_LOCK_READ_WAITERS () {0x2;}' unless defined(&RW_LOCK_READ_WAITERS);
    eval 'sub RW_LOCK_WRITE_WAITERS () {0x4;}' unless defined(&RW_LOCK_WRITE_WAITERS);
    eval 'sub RW_LOCK_WRITE_SPINNER () {0x8;}' unless defined(&RW_LOCK_WRITE_SPINNER);
    eval 'sub RW_LOCK_WRITER_RECURSED () {0x10;}' unless defined(&RW_LOCK_WRITER_RECURSED);
    eval 'sub RW_LOCK_FLAGMASK () {( &RW_LOCK_READ |  &RW_LOCK_READ_WAITERS |  &RW_LOCK_WRITE_WAITERS |  &RW_LOCK_WRITE_SPINNER |  &RW_LOCK_WRITER_RECURSED);}' unless defined(&RW_LOCK_FLAGMASK);
    eval 'sub RW_LOCK_WAITERS () {( &RW_LOCK_READ_WAITERS |  &RW_LOCK_WRITE_WAITERS);}' unless defined(&RW_LOCK_WAITERS);
    eval 'sub RW_OWNER {
        my($x) = @_;
	    eval q((($x) & ~ &RW_LOCK_FLAGMASK));
    }' unless defined(&RW_OWNER);
    eval 'sub RW_READERS_SHIFT () {5;}' unless defined(&RW_READERS_SHIFT);
    eval 'sub RW_READERS {
        my($x) = @_;
	    eval q(( &RW_OWNER(($x)) >>  &RW_READERS_SHIFT));
    }' unless defined(&RW_READERS);
    eval 'sub RW_READERS_LOCK {
        my($x) = @_;
	    eval q((($x) <<  &RW_READERS_SHIFT |  &RW_LOCK_READ));
    }' unless defined(&RW_READERS_LOCK);
    eval 'sub RW_ONE_READER () {(1<<  &RW_READERS_SHIFT);}' unless defined(&RW_ONE_READER);
    eval 'sub RW_UNLOCKED () { &RW_READERS_LOCK(0);}' unless defined(&RW_UNLOCKED);
    eval 'sub RW_DESTROYED () {( &RW_LOCK_READ_WAITERS |  &RW_LOCK_WRITE_WAITERS);}' unless defined(&RW_DESTROYED);
    if(defined(&_KERNEL)) {
	eval 'sub rw_recurse () { ($lock_object->{lo_data});}' unless defined(&rw_recurse);
	eval 'sub RW_READ_VALUE {
	    my($x) = @_;
    	    eval q((($x)-> &rw_lock));
	}' unless defined(&RW_READ_VALUE);
	eval 'sub _rw_write_lock {
	    my($rw, $tid) = @_;
    	    eval q( &atomic_cmpset_acq_ptr(($rw)-> &rw_lock,  &RW_UNLOCKED, ($tid)));
	}' unless defined(&_rw_write_lock);
	eval 'sub _rw_write_lock_fetch {
	    my($rw, $vp, $tid) = @_;
    	    eval q( &atomic_fcmpset_acq_ptr(($rw)-> &rw_lock, $vp, ($tid)));
	}' unless defined(&_rw_write_lock_fetch);
	eval 'sub _rw_write_unlock {
	    my($rw, $tid) = @_;
    	    eval q( &atomic_cmpset_rel_ptr(($rw)-> &rw_lock, ($tid),  &RW_UNLOCKED));
	}' unless defined(&_rw_write_unlock);
	eval 'sub _rw_write_unlock_fetch {
	    my($rw, $tid) = @_;
    	    eval q( &atomic_fcmpset_rel_ptr(($rw)-> &rw_lock, ($tid),  &RW_UNLOCKED));
	}' unless defined(&_rw_write_unlock_fetch);
	eval 'sub __rw_wlock {
	    my($rw, $tid, $file, $line) = @_;
    	    eval q( &__extension__ ({  &uintptr_t  &_tid = ( &uintptr_t)($tid);  &uintptr_t  &_v =  &RW_UNLOCKED;  &if ( &__predict_false( &LOCKSTAT_PROFILE_ENABLED( &rw__acquire) || ! &_rw_write_lock_fetch(($rw), & &_v,  &_tid)))  &_rw_wlock_hard(($rw),  &_v, ($file), ($line)); ( &void)0; }));
	}' unless defined(&__rw_wlock);
	eval 'sub __rw_wunlock {
	    my($rw, $tid, $file, $line) = @_;
    	    eval q( &__extension__ ({  &uintptr_t  &_v = ( &uintptr_t)($tid);  &if ( &__predict_false( &LOCKSTAT_PROFILE_ENABLED( &rw__release) || ! &_rw_write_unlock_fetch(($rw), & &_v)))  &_rw_wunlock_hard(($rw),  &_v, ($file), ($line)); ( &void)0; }));
	}' unless defined(&__rw_wunlock);
	if(defined(&INVARIANTS) || defined(&INVARIANT_SUPPORT)) {
	}
	eval 'sub rw_init {
	    my($rw, $n) = @_;
    	    eval q( &_rw_init_flags(($rw)-> &rw_lock, $n, 0));
	}' unless defined(&rw_init);
	eval 'sub rw_init_flags {
	    my($rw, $n, $o) = @_;
    	    eval q( &_rw_init_flags(($rw)-> &rw_lock, $n, $o));
	}' unless defined(&rw_init_flags);
	eval 'sub rw_destroy {
	    my($rw) = @_;
    	    eval q( &_rw_destroy(($rw)-> &rw_lock));
	}' unless defined(&rw_destroy);
	eval 'sub rw_wowned {
	    my($rw) = @_;
    	    eval q( &_rw_wowned(($rw)-> &rw_lock));
	}' unless defined(&rw_wowned);
	eval 'sub _rw_wlock {
	    my($rw, $f, $l) = @_;
    	    eval q( &_rw_wlock_cookie(($rw)-> &rw_lock, $f, $l));
	}' unless defined(&_rw_wlock);
	eval 'sub _rw_try_wlock {
	    my($rw, $f, $l) = @_;
    	    eval q( &__rw_try_wlock(($rw)-> &rw_lock, $f, $l));
	}' unless defined(&_rw_try_wlock);
	eval 'sub _rw_wunlock {
	    my($rw, $f, $l) = @_;
    	    eval q( &_rw_wunlock_cookie(($rw)-> &rw_lock, $f, $l));
	}' unless defined(&_rw_wunlock);
	eval 'sub _rw_try_rlock {
	    my($rw, $f, $l) = @_;
    	    eval q( &__rw_try_rlock(($rw)-> &rw_lock, $f, $l));
	}' unless defined(&_rw_try_rlock);
	if((defined(&LOCK_DEBUG) ? &LOCK_DEBUG : undef) > 0) {
	    eval 'sub _rw_rlock {
	        my($rw, $f, $l) = @_;
    		eval q( &__rw_rlock(($rw)-> &rw_lock, $f, $l));
	    }' unless defined(&_rw_rlock);
	    eval 'sub _rw_runlock {
	        my($rw, $f, $l) = @_;
    		eval q( &_rw_runlock_cookie(($rw)-> &rw_lock, $f, $l));
	    }' unless defined(&_rw_runlock);
	} else {
	    eval 'sub _rw_rlock {
	        my($rw, $f, $l) = @_;
    		eval q( &__rw_rlock_int($rw));
	    }' unless defined(&_rw_rlock);
	    eval 'sub _rw_runlock {
	        my($rw, $f, $l) = @_;
    		eval q( &_rw_runlock_cookie_int($rw));
	    }' unless defined(&_rw_runlock);
	}
	if((defined(&LOCK_DEBUG) ? &LOCK_DEBUG : undef) > 0) {
	    eval 'sub _rw_wlock_hard {
	        my($rw, $v, $f, $l) = @_;
    		eval q( &__rw_wlock_hard(($rw)-> &rw_lock, $v, $f, $l));
	    }' unless defined(&_rw_wlock_hard);
	    eval 'sub _rw_wunlock_hard {
	        my($rw, $v, $f, $l) = @_;
    		eval q( &__rw_wunlock_hard(($rw)-> &rw_lock, $v, $f, $l));
	    }' unless defined(&_rw_wunlock_hard);
	    eval 'sub _rw_try_upgrade {
	        my($rw, $f, $l) = @_;
    		eval q( &__rw_try_upgrade(($rw)-> &rw_lock, $f, $l));
	    }' unless defined(&_rw_try_upgrade);
	    eval 'sub _rw_downgrade {
	        my($rw, $f, $l) = @_;
    		eval q( &__rw_downgrade(($rw)-> &rw_lock, $f, $l));
	    }' unless defined(&_rw_downgrade);
	} else {
	    eval 'sub _rw_wlock_hard {
	        my($rw, $v, $f, $l) = @_;
    		eval q( &__rw_wlock_hard(($rw)-> &rw_lock, $v));
	    }' unless defined(&_rw_wlock_hard);
	    eval 'sub _rw_wunlock_hard {
	        my($rw, $v, $f, $l) = @_;
    		eval q( &__rw_wunlock_hard(($rw)-> &rw_lock, $v));
	    }' unless defined(&_rw_wunlock_hard);
	    eval 'sub _rw_try_upgrade {
	        my($rw, $f, $l) = @_;
    		eval q( &__rw_try_upgrade_int($rw));
	    }' unless defined(&_rw_try_upgrade);
	    eval 'sub _rw_downgrade {
	        my($rw, $f, $l) = @_;
    		eval q( &__rw_downgrade_int($rw));
	    }' unless defined(&_rw_downgrade);
	}
	if(defined(&INVARIANTS) || defined(&INVARIANT_SUPPORT)) {
	    eval 'sub _rw_assert {
	        my($rw, $w, $f, $l) = @_;
    		eval q( &__rw_assert(($rw)-> &rw_lock, $w, $f, $l));
	    }' unless defined(&_rw_assert);
	}
	unless(defined(&LOCK_DEBUG)) {
	    die("LOCK_DEBUG\ not\ defined\,\ include\ \<sys\/lock\.h\>\ before\ \<sys\/rwlock\.h\>");
	}
	if((defined(&LOCK_DEBUG) ? &LOCK_DEBUG : undef) > 0|| defined(&RWLOCK_NOINLINE)) {
	    eval 'sub rw_wlock {
	        my($rw) = @_;
    		eval q( &_rw_wlock(($rw),  &LOCK_FILE,  &LOCK_LINE));
	    }' unless defined(&rw_wlock);
	    eval 'sub rw_wunlock {
	        my($rw) = @_;
    		eval q( &_rw_wunlock(($rw),  &LOCK_FILE,  &LOCK_LINE));
	    }' unless defined(&rw_wunlock);
	} else {
	    eval 'sub rw_wlock {
	        my($rw) = @_;
    		eval q( &__rw_wlock(($rw),  &curthread,  &LOCK_FILE,  &LOCK_LINE));
	    }' unless defined(&rw_wlock);
	    eval 'sub rw_wunlock {
	        my($rw) = @_;
    		eval q( &__rw_wunlock(($rw),  &curthread,  &LOCK_FILE,  &LOCK_LINE));
	    }' unless defined(&rw_wunlock);
	}
	eval 'sub rw_rlock {
	    my($rw) = @_;
    	    eval q( &_rw_rlock(($rw),  &LOCK_FILE,  &LOCK_LINE));
	}' unless defined(&rw_rlock);
	eval 'sub rw_runlock {
	    my($rw) = @_;
    	    eval q( &_rw_runlock(($rw),  &LOCK_FILE,  &LOCK_LINE));
	}' unless defined(&rw_runlock);
	eval 'sub rw_try_rlock {
	    my($rw) = @_;
    	    eval q( &_rw_try_rlock(($rw),  &LOCK_FILE,  &LOCK_LINE));
	}' unless defined(&rw_try_rlock);
	eval 'sub rw_try_upgrade {
	    my($rw) = @_;
    	    eval q( &_rw_try_upgrade(($rw),  &LOCK_FILE,  &LOCK_LINE));
	}' unless defined(&rw_try_upgrade);
	eval 'sub rw_try_wlock {
	    my($rw) = @_;
    	    eval q( &_rw_try_wlock(($rw),  &LOCK_FILE,  &LOCK_LINE));
	}' unless defined(&rw_try_wlock);
	eval 'sub rw_downgrade {
	    my($rw) = @_;
    	    eval q( &_rw_downgrade(($rw),  &LOCK_FILE,  &LOCK_LINE));
	}' unless defined(&rw_downgrade);
	eval 'sub rw_unlock {
	    my($rw) = @_;
    	    eval q( &__extension__ ({  &if ( &rw_wowned($rw))  &rw_wunlock($rw);  &else  &rw_runlock($rw); ( &void)0; }));
	}' unless defined(&rw_unlock);
	eval 'sub rw_sleep {
	    my($chan, $rw, $pri, $wmesg, $timo) = @_;
    	    eval q( &_sleep(($chan), ($rw)-> &lock_object, ($pri), ($wmesg),  &tick_sbt * ($timo), 0,  &C_HARDCLOCK));
	}' unless defined(&rw_sleep);
	eval 'sub rw_initialized {
	    my($rw) = @_;
    	    eval q( &lock_initialized(($rw)-> &lock_object));
	}' unless defined(&rw_initialized);
	eval 'sub RW_SYSINIT_FLAGS {
	    my($name, $rw, $desc, $flags) = @_;
    	    eval q( &static \'struct rw_args\' $name &_args = { ($rw), ($desc), ($flags), };  &SYSINIT($name &_rw_sysinit,  &SI_SUB_LOCK,  &SI_ORDER_MIDDLE,  &rw_sysinit, $name &_args);  &SYSUNINIT($name &_rw_sysuninit,  &SI_SUB_LOCK,  &SI_ORDER_MIDDLE,  &_rw_destroy,  &__DEVOLATILE( &void *, ($rw)-> &rw_lock)));
	}' unless defined(&RW_SYSINIT_FLAGS);
	eval 'sub RW_SYSINIT {
	    my($name, $rw, $desc) = @_;
    	    eval q( &RW_SYSINIT_FLAGS($name, $rw, $desc, 0));
	}' unless defined(&RW_SYSINIT);
	eval 'sub RW_DUPOK () {0x1;}' unless defined(&RW_DUPOK);
	eval 'sub RW_NOPROFILE () {0x2;}' unless defined(&RW_NOPROFILE);
	eval 'sub RW_NOWITNESS () {0x4;}' unless defined(&RW_NOWITNESS);
	eval 'sub RW_QUIET () {0x8;}' unless defined(&RW_QUIET);
	eval 'sub RW_RECURSE () {0x10;}' unless defined(&RW_RECURSE);
	eval 'sub RW_NEW () {0x20;}' unless defined(&RW_NEW);
	if(defined(&INVARIANTS) || defined(&INVARIANT_SUPPORT)) {
	    eval 'sub RA_LOCKED () { &LA_LOCKED;}' unless defined(&RA_LOCKED);
	    eval 'sub RA_RLOCKED () { &LA_SLOCKED;}' unless defined(&RA_RLOCKED);
	    eval 'sub RA_WLOCKED () { &LA_XLOCKED;}' unless defined(&RA_WLOCKED);
	    eval 'sub RA_UNLOCKED () { &LA_UNLOCKED;}' unless defined(&RA_UNLOCKED);
	    eval 'sub RA_RECURSED () { &LA_RECURSED;}' unless defined(&RA_RECURSED);
	    eval 'sub RA_NOTRECURSED () { &LA_NOTRECURSED;}' unless defined(&RA_NOTRECURSED);
	}
	if(defined(&INVARIANTS)) {
	    eval 'sub rw_assert {
	        my($rw, $what) = @_;
    		eval q( &_rw_assert(($rw), ($what),  &LOCK_FILE,  &LOCK_LINE));
	    }' unless defined(&rw_assert);
	} else {
	    eval 'sub rw_assert {
	        my($rw, $what) = @_;
    		eval q();
	    }' unless defined(&rw_assert);
	}
    }
}
1;

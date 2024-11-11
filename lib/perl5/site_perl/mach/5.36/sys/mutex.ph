require '_h2ph_pre.ph';

no warnings qw(redefine misc);

unless(defined(&_SYS_MUTEX_H_)) {
    eval 'sub _SYS_MUTEX_H_ () {1;}' unless defined(&_SYS_MUTEX_H_);
    require 'sys/queue.ph';
    require 'sys/_lock.ph';
    require 'sys/_mutex.ph';
    if(defined(&_KERNEL)) {
	require 'sys/pcpu.ph';
	require 'sys/lock_profile.ph';
	require 'sys/lockstat.ph';
	require 'machine/atomic.ph';
	require 'machine/cpufunc.ph';
	eval 'sub MTX_DEF () {0x;}' unless defined(&MTX_DEF);
	eval 'sub MTX_SPIN () {0x1;}' unless defined(&MTX_SPIN);
	eval 'sub MTX_RECURSE () {0x4;}' unless defined(&MTX_RECURSE);
	eval 'sub MTX_NOWITNESS () {0x8;}' unless defined(&MTX_NOWITNESS);
	eval 'sub MTX_NOPROFILE () {0x20;}' unless defined(&MTX_NOPROFILE);
	eval 'sub MTX_NEW () {0x40;}' unless defined(&MTX_NEW);
	eval 'sub MTX_QUIET () { &LOP_QUIET;}' unless defined(&MTX_QUIET);
	eval 'sub MTX_DUPOK () { &LOP_DUPOK;}' unless defined(&MTX_DUPOK);
	eval 'sub MTX_UNOWNED () {0x;}' unless defined(&MTX_UNOWNED);
	eval 'sub MTX_RECURSED () {0x1;}' unless defined(&MTX_RECURSED);
	eval 'sub MTX_CONTESTED () {0x2;}' unless defined(&MTX_CONTESTED);
	eval 'sub MTX_DESTROYED () {0x4;}' unless defined(&MTX_DESTROYED);
	eval 'sub MTX_FLAGMASK () {( &MTX_RECURSED |  &MTX_CONTESTED |  &MTX_DESTROYED);}' unless defined(&MTX_FLAGMASK);
	if((defined(&LOCK_DEBUG) ? &LOCK_DEBUG : undef) > 0) {
	} else {
	}
	if(defined(&SMP)) {
	    if((defined(&LOCK_DEBUG) ? &LOCK_DEBUG : undef) > 0) {
	    } else {
	    }
	}
	if(defined(&INVARIANTS) || defined(&INVARIANT_SUPPORT)) {
	}
	if((defined(&LOCK_DEBUG) ? &LOCK_DEBUG : undef) > 0) {
	} else {
	}
	if(defined(&LOCK_PROFILING) || (defined(&KLD_MODULE)  && !defined(&KLD_TIED))) {
	    eval 'sub thread_lock {
	        my($tdp) = @_;
    		eval q( &thread_lock_flags_(($tdp), 0,  &__FILE__,  &__LINE__));
	    }' unless defined(&thread_lock);
	}
 elsif((defined(&LOCK_DEBUG) ? &LOCK_DEBUG : undef) > 0) {
	    eval 'sub thread_lock {
	        my($tdp) = @_;
    		eval q( &_thread_lock(($tdp), 0,  &__FILE__,  &__LINE__));
	    }' unless defined(&thread_lock);
	} else {
	    eval 'sub thread_lock {
	        my($tdp) = @_;
    		eval q( &_thread_lock(($tdp)));
	    }' unless defined(&thread_lock);
	}
	if((defined(&LOCK_DEBUG) ? &LOCK_DEBUG : undef) > 0) {
	    eval 'sub thread_lock_flags {
	        my($tdp, $opt) = @_;
    		eval q( &thread_lock_flags_(($tdp), ($opt),  &__FILE__,  &__LINE__));
	    }' unless defined(&thread_lock_flags);
	} else {
	    eval 'sub thread_lock_flags {
	        my($tdp, $opt) = @_;
    		eval q( &_thread_lock($tdp));
	    }' unless defined(&thread_lock_flags);
	}
	eval 'sub thread_unlock {
	    my($tdp) = @_;
    	    eval q( &mtx_unlock_spin(($tdp)-> &td_lock));
	}' unless defined(&thread_unlock);
	eval 'sub mtx_init {
	    my($m, $n, $t, $o) = @_;
    	    eval q( &_mtx_init(($m)-> &mtx_lock, $n, $t, $o));
	}' unless defined(&mtx_init);
	eval 'sub mtx_destroy {
	    my($m) = @_;
    	    eval q( &_mtx_destroy(($m)-> &mtx_lock));
	}' unless defined(&mtx_destroy);
	eval 'sub mtx_trylock_flags_ {
	    my($m, $o, $f, $l) = @_;
    	    eval q( &_mtx_trylock_flags_(($m)-> &mtx_lock, $o, $f, $l));
	}' unless defined(&mtx_trylock_flags_);
	if((defined(&LOCK_DEBUG) ? &LOCK_DEBUG : undef) > 0) {
	    eval 'sub _mtx_lock_sleep {
	        my($m, $v, $o, $f, $l) = @_;
    		eval q( &__mtx_lock_sleep(($m)-> &mtx_lock, $v, $o, $f, $l));
	    }' unless defined(&_mtx_lock_sleep);
	    eval 'sub _mtx_unlock_sleep {
	        my($m, $v, $o, $f, $l) = @_;
    		eval q( &__mtx_unlock_sleep(($m)-> &mtx_lock, $v, $o, $f, $l));
	    }' unless defined(&_mtx_unlock_sleep);
	} else {
	    eval 'sub _mtx_lock_sleep {
	        my($m, $v, $o, $f, $l) = @_;
    		eval q( &__mtx_lock_sleep(($m)-> &mtx_lock, $v));
	    }' unless defined(&_mtx_lock_sleep);
	    eval 'sub _mtx_unlock_sleep {
	        my($m, $v, $o, $f, $l) = @_;
    		eval q( &__mtx_unlock_sleep(($m)-> &mtx_lock, $v));
	    }' unless defined(&_mtx_unlock_sleep);
	}
	if(defined(&SMP)) {
	    if((defined(&LOCK_DEBUG) ? &LOCK_DEBUG : undef) > 0) {
		eval 'sub _mtx_lock_spin {
		    my($m, $v, $o, $f, $l) = @_;
    		    eval q( &_mtx_lock_spin_cookie(($m)-> &mtx_lock, $v, $o, $f, $l));
		}' unless defined(&_mtx_lock_spin);
	    } else {
		eval 'sub _mtx_lock_spin {
		    my($m, $v, $o, $f, $l) = @_;
    		    eval q( &_mtx_lock_spin_cookie(($m)-> &mtx_lock, $v));
		}' unless defined(&_mtx_lock_spin);
	    }
	}
	eval 'sub _mtx_lock_flags {
	    my($m, $o, $f, $l) = @_;
    	    eval q( &__mtx_lock_flags(($m)-> &mtx_lock, $o, $f, $l));
	}' unless defined(&_mtx_lock_flags);
	eval 'sub _mtx_unlock_flags {
	    my($m, $o, $f, $l) = @_;
    	    eval q( &__mtx_unlock_flags(($m)-> &mtx_lock, $o, $f, $l));
	}' unless defined(&_mtx_unlock_flags);
	eval 'sub _mtx_lock_spin_flags {
	    my($m, $o, $f, $l) = @_;
    	    eval q( &__mtx_lock_spin_flags(($m)-> &mtx_lock, $o, $f, $l));
	}' unless defined(&_mtx_lock_spin_flags);
	eval 'sub _mtx_trylock_spin_flags {
	    my($m, $o, $f, $l) = @_;
    	    eval q( &__mtx_trylock_spin_flags(($m)-> &mtx_lock, $o, $f, $l));
	}' unless defined(&_mtx_trylock_spin_flags);
	eval 'sub _mtx_unlock_spin_flags {
	    my($m, $o, $f, $l) = @_;
    	    eval q( &__mtx_unlock_spin_flags(($m)-> &mtx_lock, $o, $f, $l));
	}' unless defined(&_mtx_unlock_spin_flags);
	if(defined(&INVARIANTS) || defined(&INVARIANT_SUPPORT)) {
	    eval 'sub _mtx_assert {
	        my($m, $w, $f, $l) = @_;
    		eval q( &__mtx_assert(($m)-> &mtx_lock, $w, $f, $l));
	    }' unless defined(&_mtx_assert);
	}
	eval 'sub mtx_recurse () { ($lock_object->{lo_data});}' unless defined(&mtx_recurse);
	eval 'sub _mtx_obtain_lock {
	    my($mp, $tid) = @_;
    	    eval q( &atomic_cmpset_acq_ptr(($mp)-> &mtx_lock,  &MTX_UNOWNED, ($tid)));
	}' unless defined(&_mtx_obtain_lock);
	eval 'sub _mtx_obtain_lock_fetch {
	    my($mp, $vp, $tid) = @_;
    	    eval q( &atomic_fcmpset_acq_ptr(($mp)-> &mtx_lock, $vp, ($tid)));
	}' unless defined(&_mtx_obtain_lock_fetch);
	eval 'sub _mtx_release_lock {
	    my($mp, $tid) = @_;
    	    eval q( &atomic_cmpset_rel_ptr(($mp)-> &mtx_lock, ($tid),  &MTX_UNOWNED));
	}' unless defined(&_mtx_release_lock);
	eval 'sub _mtx_release_lock_quick {
	    my($mp) = @_;
    	    eval q( &atomic_store_rel_ptr(($mp)-> &mtx_lock,  &MTX_UNOWNED));
	}' unless defined(&_mtx_release_lock_quick);
	eval 'sub _mtx_release_lock_fetch {
	    my($mp, $vp) = @_;
    	    eval q( &atomic_fcmpset_rel_ptr(($mp)-> &mtx_lock, ($vp),  &MTX_UNOWNED));
	}' unless defined(&_mtx_release_lock_fetch);
	eval 'sub __mtx_lock {
	    my($mp, $tid, $opts, $file, $line) = @_;
    	    eval q( &__extension__ ({  &uintptr_t  &_tid = ( &uintptr_t)($tid);  &uintptr_t  &_v =  &MTX_UNOWNED;  &if ( &__predict_false( &LOCKSTAT_PROFILE_ENABLED( &adaptive__acquire) || ! &_mtx_obtain_lock_fetch(($mp), & &_v,  &_tid)))  &_mtx_lock_sleep(($mp),  &_v, ($opts), ($file), ($line)); ( &void)0; }));
	}' unless defined(&__mtx_lock);
	if(defined(&SMP)) {
	    eval 'sub __mtx_lock_spin {
	        my($mp, $tid, $opts, $file, $line) = @_;
    		eval q( &__extension__ ({  &uintptr_t  &_tid = ( &uintptr_t)($tid);  &uintptr_t  &_v =  &MTX_UNOWNED;  &spinlock_enter();  &if ( &__predict_false( &LOCKSTAT_PROFILE_ENABLED( &spin__acquire) || ! &_mtx_obtain_lock_fetch(($mp), & &_v,  &_tid)))  &_mtx_lock_spin(($mp),  &_v, ($opts), ($file), ($line)); ( &void)0; }));
	    }' unless defined(&__mtx_lock_spin);
	    eval 'sub __mtx_trylock_spin {
	        my($mp, $tid, $opts, $file, $line) = @_;
    		eval q( &__extension__ ({  &uintptr_t  &_tid = ( &uintptr_t)($tid); \'int\'  &_ret;  &spinlock_enter();  &if ((($mp)-> &mtx_lock !=  &MTX_UNOWNED || ! &_mtx_obtain_lock(($mp),  &_tid))) {  &spinlock_exit();  &_ret = 0; }  &else {  &LOCKSTAT_PROFILE_OBTAIN_SPIN_LOCK_SUCCESS( &spin__acquire, $mp, 0, 0, $file, $line);  &_ret = 1; }  &_ret; }));
	    }' unless defined(&__mtx_trylock_spin);
	} else {
	    eval 'sub __mtx_lock_spin {
	        my($mp, $tid, $opts, $file, $line) = @_;
    		eval q( &__extension__ ({  &uintptr_t  &_tid = ( &uintptr_t)($tid);  &spinlock_enter();  &if (($mp)-> &mtx_lock ==  &_tid) ($mp)-> &mtx_recurse++;  &else {  &KASSERT(($mp)-> &mtx_lock ==  &MTX_UNOWNED, (\\"corrupt spinlock\\")); ($mp)-> &mtx_lock =  &_tid; } ( &void)0; }));
	    }' unless defined(&__mtx_lock_spin);
	    eval 'sub __mtx_trylock_spin {
	        my($mp, $tid, $opts, $file, $line) = @_;
    		eval q( &__extension__ ({  &uintptr_t  &_tid = ( &uintptr_t)($tid); \'int\'  &_ret;  &spinlock_enter();  &if (($mp)-> &mtx_lock !=  &MTX_UNOWNED) {  &spinlock_exit();  &_ret = 0; }  &else { ($mp)-> &mtx_lock =  &_tid;  &_ret = 1; }  &_ret; }));
	    }' unless defined(&__mtx_trylock_spin);
	}
	eval 'sub __mtx_unlock {
	    my($mp, $tid, $opts, $file, $line) = @_;
    	    eval q( &__extension__ ({  &uintptr_t  &_v = ( &uintptr_t)($tid);  &if ( &__predict_false( &LOCKSTAT_PROFILE_ENABLED( &adaptive__release) || ! &_mtx_release_lock_fetch(($mp), & &_v)))  &_mtx_unlock_sleep(($mp),  &_v, ($opts), ($file), ($line)); ( &void)0; }));
	}' unless defined(&__mtx_unlock);
	if(defined(&SMP)) {
	    eval 'sub __mtx_unlock_spin {
	        my($mp) = @_;
    		eval q( &__extension__ ({  &if ( &mtx_recursed(($mp))) ($mp)-> &mtx_recurse--;  &else {  &LOCKSTAT_PROFILE_RELEASE_SPIN_LOCK( &spin__release, $mp);  &_mtx_release_lock_quick(($mp)); }  &spinlock_exit(); }));
	    }' unless defined(&__mtx_unlock_spin);
	} else {
	    eval 'sub __mtx_unlock_spin {
	        my($mp) = @_;
    		eval q( &__extension__ ({  &if ( &mtx_recursed(($mp))) ($mp)-> &mtx_recurse--;  &else {  &LOCKSTAT_PROFILE_RELEASE_SPIN_LOCK( &spin__release, $mp); ($mp)-> &mtx_lock =  &MTX_UNOWNED; }  &spinlock_exit(); }));
	    }' unless defined(&__mtx_unlock_spin);
	}
	eval 'sub mtx_lock {
	    my($m) = @_;
    	    eval q( &mtx_lock_flags(($m), 0));
	}' unless defined(&mtx_lock);
	eval 'sub mtx_lock_spin {
	    my($m) = @_;
    	    eval q( &mtx_lock_spin_flags(($m), 0));
	}' unless defined(&mtx_lock_spin);
	eval 'sub mtx_trylock {
	    my($m) = @_;
    	    eval q( &mtx_trylock_flags(($m), 0));
	}' unless defined(&mtx_trylock);
	eval 'sub mtx_trylock_spin {
	    my($m) = @_;
    	    eval q( &mtx_trylock_spin_flags(($m), 0));
	}' unless defined(&mtx_trylock_spin);
	eval 'sub mtx_unlock {
	    my($m) = @_;
    	    eval q( &mtx_unlock_flags(($m), 0));
	}' unless defined(&mtx_unlock);
	eval 'sub mtx_unlock_spin {
	    my($m) = @_;
    	    eval q( &mtx_unlock_spin_flags(($m), 0));
	}' unless defined(&mtx_unlock_spin);
	eval 'sub mtx_pool_lock {
	    my($pool, $ptr) = @_;
    	    eval q( &mtx_lock( &mtx_pool_find(($pool), ($ptr))));
	}' unless defined(&mtx_pool_lock);
	eval 'sub mtx_pool_lock_spin {
	    my($pool, $ptr) = @_;
    	    eval q( &mtx_lock_spin( &mtx_pool_find(($pool), ($ptr))));
	}' unless defined(&mtx_pool_lock_spin);
	eval 'sub mtx_pool_unlock {
	    my($pool, $ptr) = @_;
    	    eval q( &mtx_unlock( &mtx_pool_find(($pool), ($ptr))));
	}' unless defined(&mtx_pool_unlock);
	eval 'sub mtx_pool_unlock_spin {
	    my($pool, $ptr) = @_;
    	    eval q( &mtx_unlock_spin( &mtx_pool_find(($pool), ($ptr))));
	}' unless defined(&mtx_pool_unlock_spin);
	unless(defined(&LOCK_DEBUG)) {
	    die("LOCK_DEBUG\ not\ defined\,\ include\ \<sys\/lock\.h\>\ before\ \<sys\/mutex\.h\>");
	}
	if((defined(&LOCK_DEBUG) ? &LOCK_DEBUG : undef) > 0|| defined(&MUTEX_NOINLINE)) {
	    eval 'sub mtx_lock_flags_ {
	        my($m, $opts, $file, $line) = @_;
    		eval q( &_mtx_lock_flags(($m), ($opts), ($file), ($line)));
	    }' unless defined(&mtx_lock_flags_);
	    eval 'sub mtx_unlock_flags_ {
	        my($m, $opts, $file, $line) = @_;
    		eval q( &_mtx_unlock_flags(($m), ($opts), ($file), ($line)));
	    }' unless defined(&mtx_unlock_flags_);
	    eval 'sub mtx_lock_spin_flags_ {
	        my($m, $opts, $file, $line) = @_;
    		eval q( &_mtx_lock_spin_flags(($m), ($opts), ($file), ($line)));
	    }' unless defined(&mtx_lock_spin_flags_);
	    eval 'sub mtx_trylock_spin_flags_ {
	        my($m, $opts, $file, $line) = @_;
    		eval q( &_mtx_trylock_spin_flags(($m), ($opts), ($file), ($line)));
	    }' unless defined(&mtx_trylock_spin_flags_);
	    eval 'sub mtx_unlock_spin_flags_ {
	        my($m, $opts, $file, $line) = @_;
    		eval q( &_mtx_unlock_spin_flags(($m), ($opts), ($file), ($line)));
	    }' unless defined(&mtx_unlock_spin_flags_);
	} else {
	    eval 'sub mtx_lock_flags_ {
	        my($m, $opts, $file, $line) = @_;
    		eval q( &__mtx_lock(($m),  &curthread, ($opts), ($file), ($line)));
	    }' unless defined(&mtx_lock_flags_);
	    eval 'sub mtx_unlock_flags_ {
	        my($m, $opts, $file, $line) = @_;
    		eval q( &__mtx_unlock(($m),  &curthread, ($opts), ($file), ($line)));
	    }' unless defined(&mtx_unlock_flags_);
	    eval 'sub mtx_lock_spin_flags_ {
	        my($m, $opts, $file, $line) = @_;
    		eval q( &__mtx_lock_spin(($m),  &curthread, ($opts), ($file), ($line)));
	    }' unless defined(&mtx_lock_spin_flags_);
	    eval 'sub mtx_trylock_spin_flags_ {
	        my($m, $opts, $file, $line) = @_;
    		eval q( &__mtx_trylock_spin(($m),  &curthread, ($opts), ($file), ($line)));
	    }' unless defined(&mtx_trylock_spin_flags_);
	    eval 'sub mtx_unlock_spin_flags_ {
	        my($m, $opts, $file, $line) = @_;
    		eval q( &__mtx_unlock_spin(($m)));
	    }' unless defined(&mtx_unlock_spin_flags_);
	}
	if(defined(&INVARIANTS)) {
	    eval 'sub mtx_assert_ {
	        my($m, $what, $file, $line) = @_;
    		eval q( &_mtx_assert(($m), ($what), ($file), ($line)));
	    }' unless defined(&mtx_assert_);
	    eval 'sub GIANT_REQUIRED () { &mtx_assert_( &Giant,  &MA_OWNED,  &__FILE__,  &__LINE__);}' unless defined(&GIANT_REQUIRED);
	} else {
	    eval 'sub mtx_assert_ {
	        my($m, $what, $file, $line) = @_;
    		eval q(( &void)0);
	    }' unless defined(&mtx_assert_);
	    eval 'sub GIANT_REQUIRED () {1;}' unless defined(&GIANT_REQUIRED);
	}
	eval 'sub mtx_lock_flags {
	    my($m, $opts) = @_;
    	    eval q( &mtx_lock_flags_(($m), ($opts),  &LOCK_FILE,  &LOCK_LINE));
	}' unless defined(&mtx_lock_flags);
	eval 'sub mtx_unlock_flags {
	    my($m, $opts) = @_;
    	    eval q( &mtx_unlock_flags_(($m), ($opts),  &LOCK_FILE,  &LOCK_LINE));
	}' unless defined(&mtx_unlock_flags);
	eval 'sub mtx_lock_spin_flags {
	    my($m, $opts) = @_;
    	    eval q( &mtx_lock_spin_flags_(($m), ($opts),  &LOCK_FILE,  &LOCK_LINE));
	}' unless defined(&mtx_lock_spin_flags);
	eval 'sub mtx_unlock_spin_flags {
	    my($m, $opts) = @_;
    	    eval q( &mtx_unlock_spin_flags_(($m), ($opts),  &LOCK_FILE,  &LOCK_LINE));
	}' unless defined(&mtx_unlock_spin_flags);
	eval 'sub mtx_trylock_flags {
	    my($m, $opts) = @_;
    	    eval q( &mtx_trylock_flags_(($m), ($opts),  &LOCK_FILE,  &LOCK_LINE));
	}' unless defined(&mtx_trylock_flags);
	eval 'sub mtx_trylock_spin_flags {
	    my($m, $opts) = @_;
    	    eval q( &mtx_trylock_spin_flags_(($m), ($opts),  &LOCK_FILE,  &LOCK_LINE));
	}' unless defined(&mtx_trylock_spin_flags);
	eval 'sub mtx_assert {
	    my($m, $what) = @_;
    	    eval q( &mtx_assert_(($m), ($what),  &__FILE__,  &__LINE__));
	}' unless defined(&mtx_assert);
	eval 'sub mtx_sleep {
	    my($chan, $mtx, $pri, $wmesg, $timo) = @_;
    	    eval q( &_sleep(($chan), ($mtx)-> &lock_object, ($pri), ($wmesg),  &tick_sbt * ($timo), 0,  &C_HARDCLOCK));
	}' unless defined(&mtx_sleep);
	eval 'sub MTX_READ_VALUE {
	    my($m) = @_;
    	    eval q((($m)-> &mtx_lock));
	}' unless defined(&MTX_READ_VALUE);
	eval 'sub mtx_initialized {
	    my($m) = @_;
    	    eval q( &lock_initialized(($m)-> &lock_object));
	}' unless defined(&mtx_initialized);
	eval 'sub lv_mtx_owner {
	    my($v) = @_;
    	    eval q(((($v) & ~ &MTX_FLAGMASK)));
	}' unless defined(&lv_mtx_owner);
	eval 'sub mtx_owner {
	    my($m) = @_;
    	    eval q( &lv_mtx_owner( &MTX_READ_VALUE($m)));
	}' unless defined(&mtx_owner);
	eval 'sub mtx_owned {
	    my($m) = @_;
    	    eval q(( &mtx_owner($m) ==  &curthread));
	}' unless defined(&mtx_owned);
	eval 'sub mtx_recursed {
	    my($m) = @_;
    	    eval q((($m)-> &mtx_recurse != 0));
	}' unless defined(&mtx_recursed);
	eval 'sub mtx_name {
	    my($m) = @_;
    	    eval q((($m)-> ($lock_object->{lo_name})));
	}' unless defined(&mtx_name);
	unless(defined(&DROP_GIANT)) {
	    eval 'sub DROP_GIANT () {
	        eval q( &do { \'int\'  &_giantcnt = 0;  &WITNESS_SAVE_DECL( &Giant);  &if ( &__predict_false( &mtx_owned( &Giant))) {  &WITNESS_SAVE( ($Giant->{lock_object}),  &Giant);  &for ( &_giantcnt = 0;  &mtx_owned( &Giant)  && ! &SCHEDULER_STOPPED();  &_giantcnt++)  &mtx_unlock( &Giant); });
	    }' unless defined(&DROP_GIANT);
	    eval 'sub PICKUP_GIANT () {
	        eval q( &mtx_assert( &Giant,  &MA_NOTOWNED);  &if ( &__predict_false( &_giantcnt > 0)) {  &while ( &_giantcnt--)  &mtx_lock( &Giant);  &WITNESS_RESTORE( ($Giant->{lock_object}),  &Giant); } }  &while (0));
	    }' unless defined(&PICKUP_GIANT);
	}
	eval 'sub MTX_SYSINIT {
	    my($name, $mtx, $desc, $opts) = @_;
    	    eval q( &static \'struct mtx_args\' $name &_args = { ($mtx), ($desc), ($opts) };  &SYSINIT($name &_mtx_sysinit,  &SI_SUB_LOCK,  &SI_ORDER_MIDDLE,  &mtx_sysinit, $name &_args);  &SYSUNINIT($name &_mtx_sysuninit,  &SI_SUB_LOCK,  &SI_ORDER_MIDDLE,  &_mtx_destroy,  &__DEVOLATILE( &void *, ($mtx)-> &mtx_lock)));
	}' unless defined(&MTX_SYSINIT);
	if(defined(&INVARIANTS) || defined(&INVARIANT_SUPPORT)) {
	    eval 'sub MA_OWNED () { &LA_XLOCKED;}' unless defined(&MA_OWNED);
	    eval 'sub MA_NOTOWNED () { &LA_UNLOCKED;}' unless defined(&MA_NOTOWNED);
	    eval 'sub MA_RECURSED () { &LA_RECURSED;}' unless defined(&MA_RECURSED);
	    eval 'sub MA_NOTRECURSED () { &LA_NOTRECURSED;}' unless defined(&MA_NOTRECURSED);
	}
	eval 'sub MTX_NETWORK_LOCK () {"network driver";}' unless defined(&MTX_NETWORK_LOCK);
    }
}
1;

require '_h2ph_pre.ph';

no warnings qw(redefine misc);

unless(defined(&_SYS_LOCKMGR_H_)) {
    eval 'sub _SYS_LOCKMGR_H_ () {1;}' unless defined(&_SYS_LOCKMGR_H_);
    require 'sys/_lock.ph';
    require 'sys/_lockmgr.ph';
    require 'sys/_mutex.ph';
    require 'sys/_rwlock.ph';
    eval 'sub LK_SHARE () {0x1;}' unless defined(&LK_SHARE);
    eval 'sub LK_SHARED_WAITERS () {0x2;}' unless defined(&LK_SHARED_WAITERS);
    eval 'sub LK_EXCLUSIVE_WAITERS () {0x4;}' unless defined(&LK_EXCLUSIVE_WAITERS);
    eval 'sub LK_EXCLUSIVE_SPINNERS () {0x8;}' unless defined(&LK_EXCLUSIVE_SPINNERS);
    eval 'sub LK_WRITER_RECURSED () {0x10;}' unless defined(&LK_WRITER_RECURSED);
    eval 'sub LK_ALL_WAITERS () {( &LK_SHARED_WAITERS |  &LK_EXCLUSIVE_WAITERS);}' unless defined(&LK_ALL_WAITERS);
    eval 'sub LK_FLAGMASK () {( &LK_SHARE |  &LK_ALL_WAITERS |  &LK_EXCLUSIVE_SPINNERS |  &LK_WRITER_RECURSED);}' unless defined(&LK_FLAGMASK);
    eval 'sub LK_HOLDER {
        my($x) = @_;
	    eval q((($x) & ~ &LK_FLAGMASK));
    }' unless defined(&LK_HOLDER);
    eval 'sub LK_SHARERS_SHIFT () {5;}' unless defined(&LK_SHARERS_SHIFT);
    eval 'sub LK_SHARERS {
        my($x) = @_;
	    eval q(( &LK_HOLDER($x) >>  &LK_SHARERS_SHIFT));
    }' unless defined(&LK_SHARERS);
    eval 'sub LK_SHARERS_LOCK {
        my($x) = @_;
	    eval q((($x) <<  &LK_SHARERS_SHIFT |  &LK_SHARE));
    }' unless defined(&LK_SHARERS_LOCK);
    eval 'sub LK_ONE_SHARER () {(1<<  &LK_SHARERS_SHIFT);}' unless defined(&LK_ONE_SHARER);
    eval 'sub LK_UNLOCKED () { &LK_SHARERS_LOCK(0);}' unless defined(&LK_UNLOCKED);
    eval 'sub LK_KERNPROC () {(( &uintptr_t)(-1) & ~ &LK_FLAGMASK);}' unless defined(&LK_KERNPROC);
    if(defined(&_KERNEL)) {
	if(!defined(&LOCK_FILE) || !defined(&LOCK_LINE)) {
	    die("LOCK_FILE and LOCK_LINE not defined, include <sys/lock.h> before");
	}
	eval 'sub lk_recurse () { ($lock_object->{lo_data});}' unless defined(&lk_recurse);
	if(defined(&INVARIANTS) || defined(&INVARIANT_SUPPORT)) {
	}
	if(defined(&DDB)) {
	}
	eval 'sub _lockmgr_args_rw {
	    my($lk,$flags,$ilk,$wmesg,$prio,$timo,$file,$line) = @_;
    	    eval q({ ( &__lockmgr_args($lk, $flags, ($ilk !=  &NULL) ?  ($i$lk->{lock_object}) :  &NULL, $wmesg, $prio, $timo, $file, $line)); });
	}' unless defined(&_lockmgr_args_rw);
	eval 'sub lockmgr_read_value {
	    my($lk) = @_;
    	    eval q((($lk)-> &lk_lock));
	}' unless defined(&lockmgr_read_value);
	eval 'sub lockmgr {
	    my($lk, $flags, $ilk) = @_;
    	    eval q( &_lockmgr_args(($lk), ($flags), ($ilk),  &LK_WMESG_DEFAULT,  &LK_PRIO_DEFAULT,  &LK_TIMO_DEFAULT,  &LOCK_FILE,  &LOCK_LINE));
	}' unless defined(&lockmgr);
	eval 'sub lockmgr_args {
	    my($lk, $flags, $ilk, $wmesg, $prio, $timo) = @_;
    	    eval q( &_lockmgr_args(($lk), ($flags), ($ilk), ($wmesg), ($prio), ($timo),  &LOCK_FILE,  &LOCK_LINE));
	}' unless defined(&lockmgr_args);
	eval 'sub lockmgr_args_rw {
	    my($lk, $flags, $ilk, $wmesg, $prio, $timo) = @_;
    	    eval q( &_lockmgr_args_rw(($lk), ($flags), ($ilk), ($wmesg), ($prio), ($timo),  &LOCK_FILE,  &LOCK_LINE));
	}' unless defined(&lockmgr_args_rw);
	eval 'sub lockmgr_disown {
	    my($lk) = @_;
    	    eval q( &_lockmgr_disown(($lk),  &LOCK_FILE,  &LOCK_LINE));
	}' unless defined(&lockmgr_disown);
	eval 'sub lockmgr_recursed_v {
	    my($v) = @_;
    	    eval q(($v &  &LK_WRITER_RECURSED));
	}' unless defined(&lockmgr_recursed_v);
	eval 'sub lockmgr_recursed {
	    my($lk) = @_;
    	    eval q( &lockmgr_recursed_v(($lk)-> &lk_lock));
	}' unless defined(&lockmgr_recursed);
	eval 'sub lockmgr_rw {
	    my($lk, $flags, $ilk) = @_;
    	    eval q( &_lockmgr_args_rw(($lk), ($flags), ($ilk),  &LK_WMESG_DEFAULT,  &LK_PRIO_DEFAULT,  &LK_TIMO_DEFAULT,  &LOCK_FILE,  &LOCK_LINE));
	}' unless defined(&lockmgr_rw);
	if(defined(&INVARIANTS)) {
	    eval 'sub lockmgr_assert {
	        my($lk, $what) = @_;
    		eval q( &_lockmgr_assert(($lk), ($what),  &LOCK_FILE,  &LOCK_LINE));
	    }' unless defined(&lockmgr_assert);
	} else {
	    eval 'sub lockmgr_assert {
	        my($lk, $what) = @_;
    		eval q();
	    }' unless defined(&lockmgr_assert);
	}
	eval 'sub LK_INIT_MASK () {0x1ff;}' unless defined(&LK_INIT_MASK);
	eval 'sub LK_CANRECURSE () {0x1;}' unless defined(&LK_CANRECURSE);
	eval 'sub LK_NODUP () {0x2;}' unless defined(&LK_NODUP);
	eval 'sub LK_NOPROFILE () {0x4;}' unless defined(&LK_NOPROFILE);
	eval 'sub LK_NOSHARE () {0x8;}' unless defined(&LK_NOSHARE);
	eval 'sub LK_NOWITNESS () {0x10;}' unless defined(&LK_NOWITNESS);
	eval 'sub LK_QUIET () {0x20;}' unless defined(&LK_QUIET);
	eval 'sub LK_UNUSED0 () {0x40;}' unless defined(&LK_UNUSED0);
	eval 'sub LK_IS_VNODE () {0x80;}' unless defined(&LK_IS_VNODE);
	eval 'sub LK_NEW () {0x100;}' unless defined(&LK_NEW);
	eval 'sub LK_EATTR_MASK () {0xff00;}' unless defined(&LK_EATTR_MASK);
	eval 'sub LK_INTERLOCK () {0x100;}' unless defined(&LK_INTERLOCK);
	eval 'sub LK_NOWAIT () {0x200;}' unless defined(&LK_NOWAIT);
	eval 'sub LK_RETRY () {0x400;}' unless defined(&LK_RETRY);
	eval 'sub LK_SLEEPFAIL () {0x800;}' unless defined(&LK_SLEEPFAIL);
	eval 'sub LK_TIMELOCK () {0x1000;}' unless defined(&LK_TIMELOCK);
	eval 'sub LK_NODDLKTREAT () {0x2000;}' unless defined(&LK_NODDLKTREAT);
	eval 'sub LK_ADAPTIVE () {0x4000;}' unless defined(&LK_ADAPTIVE);
	eval 'sub LK_TYPE_MASK () {0xff0000;}' unless defined(&LK_TYPE_MASK);
	eval 'sub LK_DOWNGRADE () {0x10000;}' unless defined(&LK_DOWNGRADE);
	eval 'sub LK_DRAIN () {0x20000;}' unless defined(&LK_DRAIN);
	eval 'sub LK_EXCLOTHER () {0x40000;}' unless defined(&LK_EXCLOTHER);
	eval 'sub LK_EXCLUSIVE () {0x80000;}' unless defined(&LK_EXCLUSIVE);
	eval 'sub LK_RELEASE () {0x100000;}' unless defined(&LK_RELEASE);
	eval 'sub LK_SHARED () {0x200000;}' unless defined(&LK_SHARED);
	eval 'sub LK_UPGRADE () {0x400000;}' unless defined(&LK_UPGRADE);
	eval 'sub LK_TRYUPGRADE () {0x800000;}' unless defined(&LK_TRYUPGRADE);
	eval 'sub LK_TOTAL_MASK () {( &LK_INIT_MASK |  &LK_EATTR_MASK |  &LK_TYPE_MASK);}' unless defined(&LK_TOTAL_MASK);
	eval 'sub LK_WMESG_DEFAULT () {( &NULL);}' unless defined(&LK_WMESG_DEFAULT);
	eval 'sub LK_PRIO_DEFAULT () {(0);}' unless defined(&LK_PRIO_DEFAULT);
	eval 'sub LK_TIMO_DEFAULT () {(0);}' unless defined(&LK_TIMO_DEFAULT);
	if(defined(&INVARIANTS) || defined(&INVARIANT_SUPPORT)) {
	    eval 'sub KA_LOCKED () { &LA_LOCKED;}' unless defined(&KA_LOCKED);
	    eval 'sub KA_SLOCKED () { &LA_SLOCKED;}' unless defined(&KA_SLOCKED);
	    eval 'sub KA_XLOCKED () { &LA_XLOCKED;}' unless defined(&KA_XLOCKED);
	    eval 'sub KA_UNLOCKED () { &LA_UNLOCKED;}' unless defined(&KA_UNLOCKED);
	    eval 'sub KA_RECURSED () { &LA_RECURSED;}' unless defined(&KA_RECURSED);
	    eval 'sub KA_NOTRECURSED () { &LA_NOTRECURSED;}' unless defined(&KA_NOTRECURSED);
	}
    }
}
1;

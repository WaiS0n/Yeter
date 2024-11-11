require '_h2ph_pre.ph';

no warnings qw(redefine misc);

unless(defined(&_SYS_BUFOBJ_H_)) {
    eval 'sub _SYS_BUFOBJ_H_ () {1;}' unless defined(&_SYS_BUFOBJ_H_);
    if(defined(&_KERNEL) || defined(&_KVM_VNODE)) {
	require 'sys/queue.ph';
	require 'sys/_lock.ph';
	require 'sys/_rwlock.ph';
	require 'sys/_pctrie.ph';
	eval 'sub BO_STRATEGY {
	    my($bo, $bp) = @_;
    	    eval q((($bo)-> ($bo_ops->{bop_strategy})(($bo), ($bp))));
	}' unless defined(&BO_STRATEGY);
	eval 'sub BO_SYNC {
	    my($bo, $w) = @_;
    	    eval q((($bo)-> ($bo_ops->{bop_sync})(($bo), ($w))));
	}' unless defined(&BO_SYNC);
	eval 'sub BO_WRITE {
	    my($bo, $bp) = @_;
    	    eval q((($bo)-> ($bo_ops->{bop_write})(($bp))));
	}' unless defined(&BO_WRITE);
	eval 'sub BO_BDFLUSH {
	    my($bo, $bp) = @_;
    	    eval q((($bo)-> ($bo_ops->{bop_bdflush})(($bo), ($bp))));
	}' unless defined(&BO_BDFLUSH);
	eval 'sub BO_ONWORKLST () {(1<< 0);}' unless defined(&BO_ONWORKLST);
	eval 'sub BO_WWAIT () {(1<< 1);}' unless defined(&BO_WWAIT);
	eval 'sub BO_DEAD () {(1<< 2);}' unless defined(&BO_DEAD);
	eval 'sub BO_NOBUFS () {(1<< 3);}' unless defined(&BO_NOBUFS);
	eval 'sub BO_LOCKPTR {
	    my($bo) = @_;
    	    eval q((($bo)-> &bo_lock));
	}' unless defined(&BO_LOCKPTR);
	eval 'sub BO_LOCK {
	    my($bo) = @_;
    	    eval q( &rw_wlock( &BO_LOCKPTR(($bo))));
	}' unless defined(&BO_LOCK);
	eval 'sub BO_UNLOCK {
	    my($bo) = @_;
    	    eval q( &rw_wunlock( &BO_LOCKPTR(($bo))));
	}' unless defined(&BO_UNLOCK);
	eval 'sub BO_RLOCK {
	    my($bo) = @_;
    	    eval q( &rw_rlock( &BO_LOCKPTR(($bo))));
	}' unless defined(&BO_RLOCK);
	eval 'sub BO_RUNLOCK {
	    my($bo) = @_;
    	    eval q( &rw_runlock( &BO_LOCKPTR(($bo))));
	}' unless defined(&BO_RUNLOCK);
	eval 'sub ASSERT_BO_WLOCKED {
	    my($bo) = @_;
    	    eval q( &rw_assert( &BO_LOCKPTR(($bo)),  &RA_WLOCKED));
	}' unless defined(&ASSERT_BO_WLOCKED);
	eval 'sub ASSERT_BO_LOCKED {
	    my($bo) = @_;
    	    eval q( &rw_assert( &BO_LOCKPTR(($bo)),  &RA_LOCKED));
	}' unless defined(&ASSERT_BO_LOCKED);
	eval 'sub ASSERT_BO_UNLOCKED {
	    my($bo) = @_;
    	    eval q( &rw_assert( &BO_LOCKPTR(($bo)),  &RA_UNLOCKED));
	}' unless defined(&ASSERT_BO_UNLOCKED);
    }
}
1;

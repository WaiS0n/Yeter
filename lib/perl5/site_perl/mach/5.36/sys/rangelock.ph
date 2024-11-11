require '_h2ph_pre.ph';

no warnings qw(redefine misc);

unless(defined(&_SYS_RANGELOCK_H)) {
    eval 'sub _SYS_RANGELOCK_H () {1;}' unless defined(&_SYS_RANGELOCK_H);
    require 'sys/queue.ph';
    eval 'sub RL_LOCK_READ () {0x1;}' unless defined(&RL_LOCK_READ);
    eval 'sub RL_LOCK_WRITE () {0x2;}' unless defined(&RL_LOCK_WRITE);
    eval 'sub RL_LOCK_TYPE_MASK () {0x3;}' unless defined(&RL_LOCK_TYPE_MASK);
    eval 'sub RL_LOCK_GRANTED () {0x4;}' unless defined(&RL_LOCK_GRANTED);
    if(defined(&_KERNEL)) {
	if(defined(&INVARIANTS) || defined(&INVARIANT_SUPPORT)) {
	}
	if(defined(&INVARIANTS)) {
	    eval 'sub rangelock_cookie_assert_ {
	        my($cookie, $what, $file, $line) = @_;
    		eval q( &_rangelock_cookie_assert(($cookie), ($what), ($file), ($line)));
	    }' unless defined(&rangelock_cookie_assert_);
	} else {
	    eval 'sub rangelock_cookie_assert_ {
	        my($cookie, $what, $file, $line) = @_;
    		eval q(( &void)0);
	    }' unless defined(&rangelock_cookie_assert_);
	}
	eval 'sub rangelock_cookie_assert {
	    my($cookie, $what) = @_;
    	    eval q( &rangelock_cookie_assert_(($cookie), ($what),  &__FILE__,  &__LINE__));
	}' unless defined(&rangelock_cookie_assert);
	if(defined(&INVARIANTS) || defined(&INVARIANT_SUPPORT)) {
	    eval 'sub RCA_LOCKED () {0x1;}' unless defined(&RCA_LOCKED);
	    eval 'sub RCA_RLOCKED () {0x2;}' unless defined(&RCA_RLOCKED);
	    eval 'sub RCA_WLOCKED () {0x4;}' unless defined(&RCA_WLOCKED);
	}
    }
}
1;

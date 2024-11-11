require '_h2ph_pre.ph';

no warnings qw(redefine misc);

unless(defined(&__SYS_BLOCKCOUNT_H__)) {
    eval 'sub __SYS_BLOCKCOUNT_H__ () {1;}' unless defined(&__SYS_BLOCKCOUNT_H__);
    if(defined(&_KERNEL)) {
	require 'sys/systm.ph';
	require 'sys/_blockcount.ph';
	eval 'sub blockcount_init {
	    my($bc) = @_;
    	    eval q({  &atomic_store_int( ($bc->{__count}), 0); });
	}' unless defined(&blockcount_init);
# some #ifdef were dropped here -- fill in the blanks
	eval 'sub blockcount_acquire {
	    my($bc,$n) = @_;
    	    eval q({ });
	}' unless defined(&blockcount_acquire);
	eval 'sub blockcount_release {
	    my($bc,$n) = @_;
    	    eval q({ \'u_int\'  &old;  &atomic_thread_fence_rel();  &old =  &atomic_fetchadd_int( ($bc->{__count}), -$n);  &KASSERT( &old >= $n, (\\"%s: counter underflow %p\\",  &__func__, $bc));  &if ( &_BLOCKCOUNT_COUNT( &old) == $n  &&  &_BLOCKCOUNT_WAITERS( &old))  &_blockcount_wakeup($bc,  &old); });
	}' unless defined(&blockcount_release);
	eval 'sub _blockcount_wait {
	    my($bc,$lo,$wmesg,$prio) = @_;
    	    eval q({  &KASSERT(($prio & ~ &PRIMASK) == 0, (\\"%s: invalid prio %x\\",  &__func__, $prio));  &while ( &_blockcount_sleep($bc, $lo, $wmesg, $prio) ==  &EAGAIN) ; });
	}' unless defined(&_blockcount_wait);
	eval 'sub blockcount_sleep {
	    my($bc, $lo, $wmesg, $prio) = @_;
    	    eval q( &_blockcount_sleep(($bc), ($lo), ($wmesg), ($prio)));
	}' unless defined(&blockcount_sleep);
	eval 'sub blockcount_wait {
	    my($bc, $lo, $wmesg, $prio) = @_;
    	    eval q( &_blockcount_wait(($bc), ($lo), ($wmesg), ($prio)));
	}' unless defined(&blockcount_wait);
    }
}
1;

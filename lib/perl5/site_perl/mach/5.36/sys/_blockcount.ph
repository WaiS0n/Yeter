require '_h2ph_pre.ph';

no warnings qw(redefine misc);

unless(defined(&__SYS__BLOCKCOUNT_H__)) {
    eval 'sub __SYS__BLOCKCOUNT_H__ () {1;}' unless defined(&__SYS__BLOCKCOUNT_H__);
    require 'machine/atomic.ph';
    eval 'sub _BLOCKCOUNT_WAITERS_FLAG () {(1 << 31);}' unless defined(&_BLOCKCOUNT_WAITERS_FLAG);
    eval 'sub _BLOCKCOUNT_COUNT {
        my($c) = @_;
	    eval q((($c) & ~ &_BLOCKCOUNT_WAITERS_FLAG));
    }' unless defined(&_BLOCKCOUNT_COUNT);
    eval 'sub _BLOCKCOUNT_WAITERS {
        my($c) = @_;
	    eval q(((($c) &  &_BLOCKCOUNT_WAITERS_FLAG) != 0));
    }' unless defined(&_BLOCKCOUNT_WAITERS);
    eval 'sub blockcount_read {
        my($count) = @_;
	    eval q({ ( &_BLOCKCOUNT_COUNT( &atomic_load_int( ($count->{__count})))); });
    }' unless defined(&blockcount_read);
}
1;

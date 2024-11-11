require '_h2ph_pre.ph';

no warnings qw(redefine misc);

unless(defined(&_MPOOL_H_)) {
    eval 'sub _MPOOL_H_ () {1;}' unless defined(&_MPOOL_H_);
    require 'sys/queue.ph';
    eval 'sub HASHSIZE () {128;}' unless defined(&HASHSIZE);
    eval 'sub HASHKEY {
        my($pgno) = @_;
	    eval q((($pgno - 1+  &HASHSIZE) %  &HASHSIZE));
    }' unless defined(&HASHKEY);
    eval 'sub MPOOL_DIRTY () {0x1;}' unless defined(&MPOOL_DIRTY);
    eval 'sub MPOOL_PINNED () {0x2;}' unless defined(&MPOOL_PINNED);
    eval 'sub MPOOL_INUSE () {0x4;}' unless defined(&MPOOL_INUSE);
    if(defined(&STATISTICS)) {
    }
    eval 'sub MPOOL_IGNOREPIN () {0x1;}' unless defined(&MPOOL_IGNOREPIN);
    eval 'sub MPOOL_PAGE_REQUEST () {0x1;}' unless defined(&MPOOL_PAGE_REQUEST);
    eval 'sub MPOOL_PAGE_NEXT () {0x2;}' unless defined(&MPOOL_PAGE_NEXT);
    if(defined(&STATISTICS)) {
    }
}
1;

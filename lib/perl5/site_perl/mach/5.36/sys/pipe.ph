require '_h2ph_pre.ph';

no warnings qw(redefine misc);

unless(defined(&_SYS_PIPE_H_)) {
    eval 'sub _SYS_PIPE_H_ () {1;}' unless defined(&_SYS_PIPE_H_);
    unless(defined(&PIPE_SIZE)) {
	eval 'sub PIPE_SIZE () {16384;}' unless defined(&PIPE_SIZE);
    }
    unless(defined(&BIG_PIPE_SIZE)) {
	eval 'sub BIG_PIPE_SIZE () {(64*1024);}' unless defined(&BIG_PIPE_SIZE);
    }
    unless(defined(&SMALL_PIPE_SIZE)) {
	eval 'sub SMALL_PIPE_SIZE () { &PAGE_SIZE;}' unless defined(&SMALL_PIPE_SIZE);
    }
    unless(defined(&PIPE_MINDIRECT)) {
	eval 'sub PIPE_MINDIRECT () {8192;}' unless defined(&PIPE_MINDIRECT);
    }
    eval 'sub PIPENPAGES () {( &BIG_PIPE_SIZE /  &PAGE_SIZE + 1);}' unless defined(&PIPENPAGES);
    if(defined(&_KERNEL)) {
    }
    eval 'sub PIPE_ASYNC () {0x4;}' unless defined(&PIPE_ASYNC);
    eval 'sub PIPE_WANTR () {0x8;}' unless defined(&PIPE_WANTR);
    eval 'sub PIPE_WANTW () {0x10;}' unless defined(&PIPE_WANTW);
    eval 'sub PIPE_WANT () {0x20;}' unless defined(&PIPE_WANT);
    eval 'sub PIPE_SEL () {0x40;}' unless defined(&PIPE_SEL);
    eval 'sub PIPE_EOF () {0x80;}' unless defined(&PIPE_EOF);
    eval 'sub PIPE_LOCKFL () {0x100;}' unless defined(&PIPE_LOCKFL);
    eval 'sub PIPE_LWANT () {0x200;}' unless defined(&PIPE_LWANT);
    eval 'sub PIPE_DIRECTW () {0x400;}' unless defined(&PIPE_DIRECTW);
    eval 'sub PIPE_DIRECTOK () {0x800;}' unless defined(&PIPE_DIRECTOK);
    eval 'sub PIPE_TYPE_NAMED () {0x1;}' unless defined(&PIPE_TYPE_NAMED);
    eval 'sub PIPE_ACTIVE () {1;}' unless defined(&PIPE_ACTIVE);
    eval 'sub PIPE_CLOSING () {2;}' unless defined(&PIPE_CLOSING);
    eval 'sub PIPE_FINALIZED () {3;}' unless defined(&PIPE_FINALIZED);
    eval 'sub PIPE_MTX {
        my($pipe) = @_;
	    eval q((($pipe)-> ($pipe_pair->{pp_mtx})));
    }' unless defined(&PIPE_MTX);
    eval 'sub PIPE_LOCK {
        my($pipe) = @_;
	    eval q( &mtx_lock( &PIPE_MTX($pipe)));
    }' unless defined(&PIPE_LOCK);
    eval 'sub PIPE_UNLOCK {
        my($pipe) = @_;
	    eval q( &mtx_unlock( &PIPE_MTX($pipe)));
    }' unless defined(&PIPE_UNLOCK);
    eval 'sub PIPE_LOCK_ASSERT {
        my($pipe, $type) = @_;
	    eval q( &mtx_assert( &PIPE_MTX($pipe), ($type)));
    }' unless defined(&PIPE_LOCK_ASSERT);
    if(defined(&_KERNEL)) {
    }
}
1;

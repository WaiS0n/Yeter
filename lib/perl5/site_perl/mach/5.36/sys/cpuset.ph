require '_h2ph_pre.ph';

no warnings qw(redefine misc);

unless(defined(&_SYS_CPUSET_H_)) {
    eval 'sub _SYS_CPUSET_H_ () {1;}' unless defined(&_SYS_CPUSET_H_);
    require 'sys/_cpuset.ph';
    require 'sys/_bitset.ph';
    require 'sys/bitset.ph';
    eval 'sub _NCPUBITS () { &_BITSET_BITS;}' unless defined(&_NCPUBITS);
    eval 'sub _NCPUWORDS () { &__bitset_words( &CPU_SETSIZE);}' unless defined(&_NCPUWORDS);
    eval 'sub CPUSETBUFSIZ () {((2+ $sizeof{\'long\'} * 2) *  &_NCPUWORDS);}' unless defined(&CPUSETBUFSIZ);
    eval 'sub CPU_CLR {
        my($n, $p) = @_;
	    eval q( &__BIT_CLR( &CPU_SETSIZE, $n, $p));
    }' unless defined(&CPU_CLR);
    eval 'sub CPU_COPY {
        my($f, $t) = @_;
	    eval q( &__BIT_COPY( &CPU_SETSIZE, $f, $t));
    }' unless defined(&CPU_COPY);
    eval 'sub CPU_ISSET {
        my($n, $p) = @_;
	    eval q( &__BIT_ISSET( &CPU_SETSIZE, $n, $p));
    }' unless defined(&CPU_ISSET);
    eval 'sub CPU_SET {
        my($n, $p) = @_;
	    eval q( &__BIT_SET( &CPU_SETSIZE, $n, $p));
    }' unless defined(&CPU_SET);
    eval 'sub CPU_ZERO {
        my($p) = @_;
	    eval q( &__BIT_ZERO( &CPU_SETSIZE, $p));
    }' unless defined(&CPU_ZERO);
    eval 'sub CPU_FILL {
        my($p) = @_;
	    eval q( &__BIT_FILL( &CPU_SETSIZE, $p));
    }' unless defined(&CPU_FILL);
    eval 'sub CPU_SETOF {
        my($n, $p) = @_;
	    eval q( &__BIT_SETOF( &CPU_SETSIZE, $n, $p));
    }' unless defined(&CPU_SETOF);
    eval 'sub CPU_EQUAL {
        my($p, $c) = @_;
	    eval q(( &__BIT_CMP( &CPU_SETSIZE, $p, $c) == 0));
    }' unless defined(&CPU_EQUAL);
    eval 'sub CPU_EMPTY {
        my($p) = @_;
	    eval q( &__BIT_EMPTY( &CPU_SETSIZE, $p));
    }' unless defined(&CPU_EMPTY);
    eval 'sub CPU_ISFULLSET {
        my($p) = @_;
	    eval q( &__BIT_ISFULLSET( &CPU_SETSIZE, $p));
    }' unless defined(&CPU_ISFULLSET);
    eval 'sub CPU_SUBSET {
        my($p, $c) = @_;
	    eval q( &__BIT_SUBSET( &CPU_SETSIZE, $p, $c));
    }' unless defined(&CPU_SUBSET);
    eval 'sub CPU_OVERLAP {
        my($p, $c) = @_;
	    eval q( &__BIT_OVERLAP( &CPU_SETSIZE, $p, $c));
    }' unless defined(&CPU_OVERLAP);
    eval 'sub CPU_CMP {
        my($p, $c) = @_;
	    eval q( &__BIT_CMP( &CPU_SETSIZE, $p, $c));
    }' unless defined(&CPU_CMP);
    eval 'sub CPU_OR {
        my($d, $s1, $s2) = @_;
	    eval q( &__BIT_OR2( &CPU_SETSIZE, $d, $s1, $s2));
    }' unless defined(&CPU_OR);
    eval 'sub CPU_AND {
        my($d, $s1, $s2) = @_;
	    eval q( &__BIT_AND2( &CPU_SETSIZE, $d, $s1, $s2));
    }' unless defined(&CPU_AND);
    eval 'sub CPU_ANDNOT {
        my($d, $s1, $s2) = @_;
	    eval q( &__BIT_ANDNOT2( &CPU_SETSIZE, $d, $s1, $s2));
    }' unless defined(&CPU_ANDNOT);
    eval 'sub CPU_XOR {
        my($d, $s1, $s2) = @_;
	    eval q( &__BIT_XOR2( &CPU_SETSIZE, $d, $s1, $s2));
    }' unless defined(&CPU_XOR);
    eval 'sub CPU_CLR_ATOMIC {
        my($n, $p) = @_;
	    eval q( &__BIT_CLR_ATOMIC( &CPU_SETSIZE, $n, $p));
    }' unless defined(&CPU_CLR_ATOMIC);
    eval 'sub CPU_SET_ATOMIC {
        my($n, $p) = @_;
	    eval q( &__BIT_SET_ATOMIC( &CPU_SETSIZE, $n, $p));
    }' unless defined(&CPU_SET_ATOMIC);
    eval 'sub CPU_SET_ATOMIC_ACQ {
        my($n, $p) = @_;
	    eval q( &__BIT_SET_ATOMIC_ACQ( &CPU_SETSIZE, $n, $p));
    }' unless defined(&CPU_SET_ATOMIC_ACQ);
    eval 'sub CPU_AND_ATOMIC {
        my($n, $p) = @_;
	    eval q( &__BIT_AND_ATOMIC( &CPU_SETSIZE, $n, $p));
    }' unless defined(&CPU_AND_ATOMIC);
    eval 'sub CPU_OR_ATOMIC {
        my($d, $s) = @_;
	    eval q( &__BIT_OR_ATOMIC( &CPU_SETSIZE, $d, $s));
    }' unless defined(&CPU_OR_ATOMIC);
    eval 'sub CPU_COPY_STORE_REL {
        my($f, $t) = @_;
	    eval q( &__BIT_COPY_STORE_REL( &CPU_SETSIZE, $f, $t));
    }' unless defined(&CPU_COPY_STORE_REL);
    eval 'sub CPU_FFS {
        my($p) = @_;
	    eval q( &__BIT_FFS( &CPU_SETSIZE, $p));
    }' unless defined(&CPU_FFS);
    eval 'sub CPU_FLS {
        my($p) = @_;
	    eval q( &__BIT_FLS( &CPU_SETSIZE, $p));
    }' unless defined(&CPU_FLS);
    eval 'sub CPU_FOREACH_ISSET {
        my($i, $p) = @_;
	    eval q( &__BIT_FOREACH_ISSET( &CPU_SETSIZE, $i, $p));
    }' unless defined(&CPU_FOREACH_ISSET);
    eval 'sub CPU_FOREACH_ISCLR {
        my($i, $p) = @_;
	    eval q( &__BIT_FOREACH_ISCLR( &CPU_SETSIZE, $i, $p));
    }' unless defined(&CPU_FOREACH_ISCLR);
    eval 'sub CPU_COUNT {
        my($p) = @_;
	    eval q(( &__BIT_COUNT( &CPU_SETSIZE, $p)));
    }' unless defined(&CPU_COUNT);
    eval 'sub CPUSET_FSET () { &__BITSET_FSET( &_NCPUWORDS);}' unless defined(&CPUSET_FSET);
    eval 'sub CPUSET_T_INITIALIZER {
        my($x) = @_;
	    eval q( &__BITSET_T_INITIALIZER($x));
    }' unless defined(&CPUSET_T_INITIALIZER);
    eval 'sub CPU_ALLOC_SIZE {
        my($_s) = @_;
	    eval q( &__BITSET_SIZE($_s));
    }' unless defined(&CPU_ALLOC_SIZE);
    eval 'sub CPU_ALLOC {
        my($_s) = @_;
	    eval q( &__cpuset_alloc($_s));
    }' unless defined(&CPU_ALLOC);
    eval 'sub CPU_FREE {
        my($p) = @_;
	    eval q( &__cpuset_free($p));
    }' unless defined(&CPU_FREE);
    eval 'sub CPU_ISSET_S {
        my($n, $_s, $p) = @_;
	    eval q( &__BIT_ISSET(($_s) * 8, $n, $p));
    }' unless defined(&CPU_ISSET_S);
    eval 'sub CPU_SET_S {
        my($n, $_s, $p) = @_;
	    eval q( &__BIT_SET(($_s) * 8, $n, $p));
    }' unless defined(&CPU_SET_S);
    eval 'sub CPU_CLR_S {
        my($n, $_s, $p) = @_;
	    eval q( &__BIT_CLR(($_s) * 8, $n, $p));
    }' unless defined(&CPU_CLR_S);
    eval 'sub CPU_ZERO_S {
        my($_s, $p) = @_;
	    eval q( &__BIT_ZERO(($_s) * 8, $p));
    }' unless defined(&CPU_ZERO_S);
    eval 'sub CPU_OR_S {
        my($_s, $d, $s1, $s2) = @_;
	    eval q( &__BIT_OR2(($_s) * 8, $d, $s1, $s2));
    }' unless defined(&CPU_OR_S);
    eval 'sub CPU_AND_S {
        my($_s, $d, $s1, $s2) = @_;
	    eval q( &__BIT_AND2(($_s) * 8, $d, $s1, $s2));
    }' unless defined(&CPU_AND_S);
    eval 'sub CPU_XOR_S {
        my($_s, $d, $s1, $s2) = @_;
	    eval q( &__BIT_XOR2(($_s) * 8, $d, $s1, $s2));
    }' unless defined(&CPU_XOR_S);
    eval 'sub CPU_COUNT_S {
        my($_s, $p) = @_;
	    eval q(( &__BIT_COUNT(($_s) * 8, $p)));
    }' unless defined(&CPU_COUNT_S);
    eval 'sub CPU_EQUAL_S {
        my($_s, $p, $c) = @_;
	    eval q(( &__BIT_CMP(($_s) * 8, $p, $c) == 0));
    }' unless defined(&CPU_EQUAL_S);
    eval 'sub CPU_LEVEL_ROOT () {1;}' unless defined(&CPU_LEVEL_ROOT);
    eval 'sub CPU_LEVEL_CPUSET () {2;}' unless defined(&CPU_LEVEL_CPUSET);
    eval 'sub CPU_LEVEL_WHICH () {3;}' unless defined(&CPU_LEVEL_WHICH);
    eval 'sub CPU_WHICH_TID () {1;}' unless defined(&CPU_WHICH_TID);
    eval 'sub CPU_WHICH_PID () {2;}' unless defined(&CPU_WHICH_PID);
    eval 'sub CPU_WHICH_CPUSET () {3;}' unless defined(&CPU_WHICH_CPUSET);
    eval 'sub CPU_WHICH_IRQ () {4;}' unless defined(&CPU_WHICH_IRQ);
    eval 'sub CPU_WHICH_JAIL () {5;}' unless defined(&CPU_WHICH_JAIL);
    eval 'sub CPU_WHICH_DOMAIN () {6;}' unless defined(&CPU_WHICH_DOMAIN);
    eval 'sub CPU_WHICH_INTRHANDLER () {7;}' unless defined(&CPU_WHICH_INTRHANDLER);
    eval 'sub CPU_WHICH_ITHREAD () {8;}' unless defined(&CPU_WHICH_ITHREAD);
    eval 'sub CPU_WHICH_TIDPID () {9;}' unless defined(&CPU_WHICH_TIDPID);
    eval 'sub CPUSET_INVALID () {-1;}' unless defined(&CPUSET_INVALID);
    eval 'sub CPUSET_DEFAULT () {0;}' unless defined(&CPUSET_DEFAULT);
    if(defined(&_KERNEL)) {
	require 'sys/queue.ph';
	eval 'sub CPU_SET_ROOT () {0x1;}' unless defined(&CPU_SET_ROOT);
	eval 'sub CPU_SET_RDONLY () {0x2;}' unless defined(&CPU_SET_RDONLY);
	if(defined(&DDB)) {
	}
    } else {
    }
}
1;

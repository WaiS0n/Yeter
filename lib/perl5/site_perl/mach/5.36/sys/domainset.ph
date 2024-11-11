require '_h2ph_pre.ph';

no warnings qw(redefine misc);

unless(defined(&_SYS_DOMAINSET_H_)) {
    eval 'sub _SYS_DOMAINSET_H_ () {1;}' unless defined(&_SYS_DOMAINSET_H_);
    require 'sys/_domainset.ph';
    require 'sys/bitset.ph';
    require 'sys/queue.ph';
    eval 'sub _NDOMAINSETBITS () { &_BITSET_BITS;}' unless defined(&_NDOMAINSETBITS);
    eval 'sub _NDOMAINSETWORDS () { &__bitset_words( &DOMAINSET_SETSIZE);}' unless defined(&_NDOMAINSETWORDS);
    eval 'sub DOMAINSETBUFSIZ () {(((2+ $sizeof{\'long\'} * 2) *  &_NDOMAINSETWORDS) + $sizeof{"::"} + $sizeof{ &__XSTRING( &DOMAINSET_POLICY_MAX)} + $sizeof{ &__XSTRING( &MAXMEMDOM)});}' unless defined(&DOMAINSETBUFSIZ);
    eval 'sub DOMAINSET_CLR {
        my($n, $p) = @_;
	    eval q( &__BIT_CLR( &DOMAINSET_SETSIZE, $n, $p));
    }' unless defined(&DOMAINSET_CLR);
    eval 'sub DOMAINSET_COPY {
        my($f, $t) = @_;
	    eval q( &__BIT_COPY( &DOMAINSET_SETSIZE, $f, $t));
    }' unless defined(&DOMAINSET_COPY);
    eval 'sub DOMAINSET_ISSET {
        my($n, $p) = @_;
	    eval q( &__BIT_ISSET( &DOMAINSET_SETSIZE, $n, $p));
    }' unless defined(&DOMAINSET_ISSET);
    eval 'sub DOMAINSET_SET {
        my($n, $p) = @_;
	    eval q( &__BIT_SET( &DOMAINSET_SETSIZE, $n, $p));
    }' unless defined(&DOMAINSET_SET);
    eval 'sub DOMAINSET_ZERO {
        my($p) = @_;
	    eval q( &__BIT_ZERO( &DOMAINSET_SETSIZE, $p));
    }' unless defined(&DOMAINSET_ZERO);
    eval 'sub DOMAINSET_FILL {
        my($p) = @_;
	    eval q( &__BIT_FILL( &DOMAINSET_SETSIZE, $p));
    }' unless defined(&DOMAINSET_FILL);
    eval 'sub DOMAINSET_SETOF {
        my($n, $p) = @_;
	    eval q( &__BIT_SETOF( &DOMAINSET_SETSIZE, $n, $p));
    }' unless defined(&DOMAINSET_SETOF);
    eval 'sub DOMAINSET_EMPTY {
        my($p) = @_;
	    eval q( &__BIT_EMPTY( &DOMAINSET_SETSIZE, $p));
    }' unless defined(&DOMAINSET_EMPTY);
    eval 'sub DOMAINSET_ISFULLSET {
        my($p) = @_;
	    eval q( &__BIT_ISFULLSET( &DOMAINSET_SETSIZE, $p));
    }' unless defined(&DOMAINSET_ISFULLSET);
    eval 'sub DOMAINSET_SUBSET {
        my($p, $c) = @_;
	    eval q( &__BIT_SUBSET( &DOMAINSET_SETSIZE, $p, $c));
    }' unless defined(&DOMAINSET_SUBSET);
    eval 'sub DOMAINSET_OVERLAP {
        my($p, $c) = @_;
	    eval q( &__BIT_OVERLAP( &DOMAINSET_SETSIZE, $p, $c));
    }' unless defined(&DOMAINSET_OVERLAP);
    eval 'sub DOMAINSET_CMP {
        my($p, $c) = @_;
	    eval q( &__BIT_CMP( &DOMAINSET_SETSIZE, $p, $c));
    }' unless defined(&DOMAINSET_CMP);
    eval 'sub DOMAINSET_OR {
        my($d, $s) = @_;
	    eval q( &__BIT_OR( &DOMAINSET_SETSIZE, $d, $s));
    }' unless defined(&DOMAINSET_OR);
    eval 'sub DOMAINSET_AND {
        my($d, $s) = @_;
	    eval q( &__BIT_AND( &DOMAINSET_SETSIZE, $d, $s));
    }' unless defined(&DOMAINSET_AND);
    eval 'sub DOMAINSET_ANDNOT {
        my($d, $s) = @_;
	    eval q( &__BIT_ANDNOT( &DOMAINSET_SETSIZE, $d, $s));
    }' unless defined(&DOMAINSET_ANDNOT);
    eval 'sub DOMAINSET_CLR_ATOMIC {
        my($n, $p) = @_;
	    eval q( &__BIT_CLR_ATOMIC( &DOMAINSET_SETSIZE, $n, $p));
    }' unless defined(&DOMAINSET_CLR_ATOMIC);
    eval 'sub DOMAINSET_SET_ATOMIC {
        my($n, $p) = @_;
	    eval q( &__BIT_SET_ATOMIC( &DOMAINSET_SETSIZE, $n, $p));
    }' unless defined(&DOMAINSET_SET_ATOMIC);
    eval 'sub DOMAINSET_SET_ATOMIC_ACQ {
        my($n, $p) = @_;
	    eval q( &__BIT_SET_ATOMIC_ACQ( &DOMAINSET_SETSIZE, $n, $p));
    }' unless defined(&DOMAINSET_SET_ATOMIC_ACQ);
    eval 'sub DOMAINSET_AND_ATOMIC {
        my($n, $p) = @_;
	    eval q( &__BIT_AND_ATOMIC( &DOMAINSET_SETSIZE, $n, $p));
    }' unless defined(&DOMAINSET_AND_ATOMIC);
    eval 'sub DOMAINSET_OR_ATOMIC {
        my($d, $s) = @_;
	    eval q( &__BIT_OR_ATOMIC( &DOMAINSET_SETSIZE, $d, $s));
    }' unless defined(&DOMAINSET_OR_ATOMIC);
    eval 'sub DOMAINSET_COPY_STORE_REL {
        my($f, $t) = @_;
	    eval q( &__BIT_COPY_STORE_REL( &DOMAINSET_SETSIZE, $f, $t));
    }' unless defined(&DOMAINSET_COPY_STORE_REL);
    eval 'sub DOMAINSET_FFS {
        my($p) = @_;
	    eval q( &__BIT_FFS( &DOMAINSET_SETSIZE, $p));
    }' unless defined(&DOMAINSET_FFS);
    eval 'sub DOMAINSET_FLS {
        my($p) = @_;
	    eval q( &__BIT_FLS( &DOMAINSET_SETSIZE, $p));
    }' unless defined(&DOMAINSET_FLS);
    eval 'sub DOMAINSET_COUNT {
        my($p) = @_;
	    eval q(( &__BIT_COUNT( &DOMAINSET_SETSIZE, $p)));
    }' unless defined(&DOMAINSET_COUNT);
    eval 'sub DOMAINSET_FSET () { &__BITSET_FSET( &_NDOMAINSETWORDS);}' unless defined(&DOMAINSET_FSET);
    eval 'sub DOMAINSET_T_INITIALIZER {
        my($x) = @_;
	    eval q( &__BITSET_T_INITIALIZER($x));
    }' unless defined(&DOMAINSET_T_INITIALIZER);
    eval 'sub DOMAINSET_POLICY_INVALID () {0;}' unless defined(&DOMAINSET_POLICY_INVALID);
    eval 'sub DOMAINSET_POLICY_ROUNDROBIN () {1;}' unless defined(&DOMAINSET_POLICY_ROUNDROBIN);
    eval 'sub DOMAINSET_POLICY_FIRSTTOUCH () {2;}' unless defined(&DOMAINSET_POLICY_FIRSTTOUCH);
    eval 'sub DOMAINSET_POLICY_PREFER () {3;}' unless defined(&DOMAINSET_POLICY_PREFER);
    eval 'sub DOMAINSET_POLICY_INTERLEAVE () {4;}' unless defined(&DOMAINSET_POLICY_INTERLEAVE);
    eval 'sub DOMAINSET_POLICY_MAX () { &DOMAINSET_POLICY_INTERLEAVE;}' unless defined(&DOMAINSET_POLICY_MAX);
    if(defined(&_KERNEL)) {
	if((defined(&MAXMEMDOM) ? &MAXMEMDOM : undef) < 256) {
	} else {
	}
	eval 'sub DOMAINSET_FT () {
	    eval q(( &domainset_firsttouch));
	}' unless defined(&DOMAINSET_FT);
	eval 'sub DOMAINSET_IL () {
	    eval q(( &domainset_interleave));
	}' unless defined(&DOMAINSET_IL);
	eval 'sub DOMAINSET_FIXED {
	    my($domain) = @_;
    	    eval q(( $domainset_fixed[($domain)]));
	}' unless defined(&DOMAINSET_FIXED);
	eval 'sub DOMAINSET_PREF {
	    my($domain) = @_;
    	    eval q(( $domainset_prefer[($domain)]));
	}' unless defined(&DOMAINSET_PREF);
	eval 'sub DOMAINSET_RR () {
	    eval q(( &domainset_roundrobin));
	}' unless defined(&DOMAINSET_RR);
	if(defined(&_SYS_SYSCTL_H_)) {
	}
    } else {
    }
}
1;

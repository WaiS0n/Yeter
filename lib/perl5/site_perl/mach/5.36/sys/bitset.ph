require '_h2ph_pre.ph';

no warnings qw(redefine misc);

unless(defined(&_SYS_BITSET_H_)) {
    eval 'sub _SYS_BITSET_H_ () {1;}' unless defined(&_SYS_BITSET_H_);
    eval 'sub __constexpr_cond {
        my($expr) = @_;
	    eval q(( &__builtin_constant_p(($expr))  && ($expr)));
    }' unless defined(&__constexpr_cond);
    eval 'sub __bitset_mask {
        my($_s, $n) = @_;
	    eval q((1 << ( &__constexpr_cond( &__bitset_words(($_s)) == 1) ? ( &__size_t)($n) : (($n) %  &_BITSET_BITS))));
    }' unless defined(&__bitset_mask);
    eval 'sub __bitset_word {
        my($_s, $n) = @_;
	    eval q(( &__constexpr_cond( &__bitset_words(($_s)) == 1) ? 0: (($n) /  &_BITSET_BITS)));
    }' unless defined(&__bitset_word);
    eval 'sub __BIT_CLR {
        my($_s, $n, $p) = @_;
	    eval q((($p)-> $__bits[ &__bitset_word($_s, $n)] &= ~ &__bitset_mask(($_s), ($n))));
    }' unless defined(&__BIT_CLR);
    eval 'sub __BIT_COPY {
        my($_s, $f, $t) = @_;
	    eval q(( &void)(*($t) = *($f)));
    }' unless defined(&__BIT_COPY);
    eval 'sub __BIT_ISSET {
        my($_s, $n, $p) = @_;
	    eval q((((($p)-> $__bits[ &__bitset_word($_s, $n)] &  &__bitset_mask(($_s), ($n))) != 0)));
    }' unless defined(&__BIT_ISSET);
    eval 'sub __BIT_SET {
        my($_s, $n, $p) = @_;
	    eval q((($p)-> $__bits[ &__bitset_word($_s, $n)] |=  &__bitset_mask(($_s), ($n))));
    }' unless defined(&__BIT_SET);
    eval 'sub __BIT_ZERO {
        my($_s, $p) = @_;
	    eval q( &do {  &__size_t  &__i;  &for ( &__i = 0;  &__i <  &__bitset_words(($_s));  &__i++) ($p)-> $__bits[ &__i] = 0; }  &while (0));
    }' unless defined(&__BIT_ZERO);
    eval 'sub __BIT_FILL {
        my($_s, $p) = @_;
	    eval q( &do {  &__size_t  &__i;  &for ( &__i = 0;  &__i <  &__bitset_words(($_s));  &__i++) ($p)-> $__bits[ &__i] = -1; }  &while (0));
    }' unless defined(&__BIT_FILL);
    eval 'sub __BIT_SETOF {
        my($_s, $n, $p) = @_;
	    eval q( &do {  &__BIT_ZERO($_s, $p); ($p)-> $__bits[ &__bitset_word($_s, $n)] =  &__bitset_mask(($_s), ($n)); }  &while (0));
    }' unless defined(&__BIT_SETOF);
    eval 'sub __BIT_EMPTY {
        my($_s, $p) = @_;
	    eval q( &__extension__ ({  &__size_t  &__i;  &for ( &__i = 0;  &__i <  &__bitset_words(($_s));  &__i++)  &if (($p)-> $__bits[ &__i])  &break;  &__i ==  &__bitset_words(($_s)); }));
    }' unless defined(&__BIT_EMPTY);
    eval 'sub __BIT_ISFULLSET {
        my($_s, $p) = @_;
	    eval q( &__extension__ ({  &__size_t  &__i;  &for ( &__i = 0;  &__i <  &__bitset_words(($_s));  &__i++)  &if (($p)-> $__bits[ &__i] != -1)  &break;  &__i ==  &__bitset_words(($_s)); }));
    }' unless defined(&__BIT_ISFULLSET);
    eval 'sub __BIT_SUBSET {
        my($_s, $p, $c) = @_;
	    eval q( &__extension__ ({  &__size_t  &__i;  &for ( &__i = 0;  &__i <  &__bitset_words(($_s));  &__i++)  &if ((($c)-> $__bits[ &__i] & ($p)-> $__bits[ &__i]) != ($c)-> $__bits[ &__i])  &break;  &__i ==  &__bitset_words(($_s)); }));
    }' unless defined(&__BIT_SUBSET);
    eval 'sub __BIT_OVERLAP {
        my($_s, $p, $c) = @_;
	    eval q( &__extension__ ({  &__size_t  &__i;  &for ( &__i = 0;  &__i <  &__bitset_words(($_s));  &__i++)  &if ((($c)-> $__bits[ &__i] & ($p)-> $__bits[ &__i]) != 0)  &break;  &__i !=  &__bitset_words(($_s)); }));
    }' unless defined(&__BIT_OVERLAP);
    eval 'sub __BIT_CMP {
        my($_s, $p, $c) = @_;
	    eval q( &__extension__ ({  &__size_t  &__i;  &for ( &__i = 0;  &__i <  &__bitset_words(($_s));  &__i++)  &if ((($c)-> $__bits[ &__i] != ($p)-> $__bits[ &__i]))  &break;  &__i !=  &__bitset_words(($_s)); }));
    }' unless defined(&__BIT_CMP);
    eval 'sub __BIT_OR {
        my($_s, $d, $s) = @_;
	    eval q( &do {  &__size_t  &__i;  &for ( &__i = 0;  &__i <  &__bitset_words(($_s));  &__i++) ($d)-> $__bits[ &__i] |= ($s)-> $__bits[ &__i]; }  &while (0));
    }' unless defined(&__BIT_OR);
    eval 'sub __BIT_OR2 {
        my($_s, $d, $s1, $s2) = @_;
	    eval q( &do {  &__size_t  &__i;  &for ( &__i = 0;  &__i <  &__bitset_words(($_s));  &__i++) ($d)-> $__bits[ &__i] = ($s1)-> $__bits[ &__i] | ($s2)-> $__bits[ &__i];}  &while (0));
    }' unless defined(&__BIT_OR2);
    eval 'sub __BIT_AND {
        my($_s, $d, $s) = @_;
	    eval q( &do {  &__size_t  &__i;  &for ( &__i = 0;  &__i <  &__bitset_words(($_s));  &__i++) ($d)-> $__bits[ &__i] &= ($s)-> $__bits[ &__i]; }  &while (0));
    }' unless defined(&__BIT_AND);
    eval 'sub __BIT_AND2 {
        my($_s, $d, $s1, $s2) = @_;
	    eval q( &do {  &__size_t  &__i;  &for ( &__i = 0;  &__i <  &__bitset_words(($_s));  &__i++) ($d)-> $__bits[ &__i] = ($s1)-> $__bits[ &__i] & ($s2)-> $__bits[ &__i];}  &while (0));
    }' unless defined(&__BIT_AND2);
    eval 'sub __BIT_ANDNOT {
        my($_s, $d, $s) = @_;
	    eval q( &do {  &__size_t  &__i;  &for ( &__i = 0;  &__i <  &__bitset_words(($_s));  &__i++) ($d)-> $__bits[ &__i] &= ~($s)-> $__bits[ &__i]; }  &while (0));
    }' unless defined(&__BIT_ANDNOT);
    eval 'sub __BIT_ANDNOT2 {
        my($_s, $d, $s1, $s2) = @_;
	    eval q( &do {  &__size_t  &__i;  &for ( &__i = 0;  &__i <  &__bitset_words(($_s));  &__i++) ($d)-> $__bits[ &__i] = ($s1)-> $__bits[ &__i] & ~($s2)-> $__bits[ &__i];}  &while (0));
    }' unless defined(&__BIT_ANDNOT2);
    eval 'sub __BIT_XOR {
        my($_s, $d, $s) = @_;
	    eval q( &do {  &__size_t  &__i;  &for ( &__i = 0;  &__i <  &__bitset_words(($_s));  &__i++) ($d)-> $__bits[ &__i] ^= ($s)-> $__bits[ &__i]; }  &while (0));
    }' unless defined(&__BIT_XOR);
    eval 'sub __BIT_XOR2 {
        my($_s, $d, $s1, $s2) = @_;
	    eval q( &do {  &__size_t  &__i;  &for ( &__i = 0;  &__i <  &__bitset_words(($_s));  &__i++) ($d)-> $__bits[ &__i] = ($s1)-> $__bits[ &__i] ^ ($s2)-> $__bits[ &__i];}  &while (0));
    }' unless defined(&__BIT_XOR2);
    eval 'sub __BIT_CLR_ATOMIC {
        my($_s, $n, $p) = @_;
	    eval q( &atomic_clear_long(($p)-> $__bits[ &__bitset_word($_s, $n)],  &__bitset_mask(($_s), $n)));
    }' unless defined(&__BIT_CLR_ATOMIC);
    eval 'sub __BIT_SET_ATOMIC {
        my($_s, $n, $p) = @_;
	    eval q( &atomic_set_long(($p)-> $__bits[ &__bitset_word($_s, $n)],  &__bitset_mask(($_s), $n)));
    }' unless defined(&__BIT_SET_ATOMIC);
    eval 'sub __BIT_SET_ATOMIC_ACQ {
        my($_s, $n, $p) = @_;
	    eval q( &atomic_set_acq_long(($p)-> $__bits[ &__bitset_word($_s, $n)],  &__bitset_mask(($_s), $n)));
    }' unless defined(&__BIT_SET_ATOMIC_ACQ);
    eval 'sub __BIT_TEST_CLR_ATOMIC {
        my($_s, $n, $p) = @_;
	    eval q(( &atomic_testandclear_long( ($p)-> $__bits[ &__bitset_word(($_s), ($n))], ($n)) != 0));
    }' unless defined(&__BIT_TEST_CLR_ATOMIC);
    eval 'sub __BIT_TEST_SET_ATOMIC {
        my($_s, $n, $p) = @_;
	    eval q(( &atomic_testandset_long( ($p)-> $__bits[ &__bitset_word(($_s), ($n))], ($n)) != 0));
    }' unless defined(&__BIT_TEST_SET_ATOMIC);
    eval 'sub __BIT_AND_ATOMIC {
        my($_s, $d, $s) = @_;
	    eval q( &do {  &__size_t  &__i;  &for ( &__i = 0;  &__i <  &__bitset_words(($_s));  &__i++)  &atomic_clear_long(($d)-> $__bits[ &__i], ~($s)-> $__bits[ &__i]); }  &while (0));
    }' unless defined(&__BIT_AND_ATOMIC);
    eval 'sub __BIT_OR_ATOMIC {
        my($_s, $d, $s) = @_;
	    eval q( &do {  &__size_t  &__i;  &for ( &__i = 0;  &__i <  &__bitset_words(($_s));  &__i++)  &atomic_set_long(($d)-> $__bits[ &__i], ($s)-> $__bits[ &__i]); }  &while (0));
    }' unless defined(&__BIT_OR_ATOMIC);
    eval 'sub __BIT_COPY_STORE_REL {
        my($_s, $f, $t) = @_;
	    eval q( &do {  &__size_t  &__i;  &for ( &__i = 0;  &__i <  &__bitset_words(($_s));  &__i++)  &atomic_store_rel_long(($t)-> $__bits[ &__i], ($f)-> $__bits[ &__i]); }  &while (0));
    }' unless defined(&__BIT_COPY_STORE_REL);
    eval 'sub __BIT_FFS_AT {
        my($_s, $p, $start) = @_;
	    eval q( &__extension__ ({  &__size_t  &__i; \'long __bit\',  &__mask;  &__mask = ~0 << (($start) %  &_BITSET_BITS);  &__bit = 0;  &for ( &__i =  &__bitset_word(($_s), ($start));  &__i <  &__bitset_words(($_s));  &__i++) {  &if ((($p)-> $__bits[ &__i] &  &__mask) != 0) {  &__bit =  &ffsl(($p)-> $__bits[ &__i] &  &__mask);  &__bit +=  &__i *  &_BITSET_BITS;  &break; }  &__mask = ~0; }  &__bit; }));
    }' unless defined(&__BIT_FFS_AT);
    eval 'sub __BIT_FFS {
        my($_s, $p) = @_;
	    eval q( &__BIT_FFS_AT(($_s), ($p), 0));
    }' unless defined(&__BIT_FFS);
    eval 'sub __BIT_FLS {
        my($_s, $p) = @_;
	    eval q( &__extension__ ({  &__size_t  &__i; \'long __bit\';  &__bit = 0;  &for ( &__i =  &__bitset_words(($_s));  &__i > 0;  &__i--) {  &if (($p)-> $__bits[ &__i - 1] != 0) {  &__bit =  &flsl(($p)-> $__bits[ &__i - 1]);  &__bit += ( &__i - 1) *  &_BITSET_BITS;  &break; } }  &__bit; }));
    }' unless defined(&__BIT_FLS);
    eval 'sub __BIT_COUNT {
        my($_s, $p) = @_;
	    eval q( &__extension__ ({  &__size_t  &__i; \'long __count\';  &__count = 0;  &for ( &__i = 0;  &__i <  &__bitset_words(($_s));  &__i++)  &__count +=  &__bitcountl(($p)-> $__bits[ &__i]);  &__count; }));
    }' unless defined(&__BIT_COUNT);
    eval 'sub __BIT_FOREACH_ADVANCE {
        my($_s, $i, $p, $op) = @_;
	    eval q( &__extension__ ({ \'int\'  &__found;  &for (;;) {  &if ( &__bits != 0) { \'int\'  &__bit =  &ffsl( &__bits) - 1;  &__bits &= ~(1 <<  &__bit); ($i) =  &__i *  &_BITSET_BITS +  &__bit;  &__found = 1;  &break; }  &if (++ &__i ==  &__bitset_words($_s)) {  &__found = 0;  &break; }  &__bits = $op(($p)-> $__bits[ &__i]); }  &__found != 0; }));
    }' unless defined(&__BIT_FOREACH_ADVANCE);
    eval 'sub __BIT_FOREACH {
        my($_s, $i, $p, $op) = @_;
	    eval q( &for (\'long __i\' = -1,  &__bits = 0;  &__BIT_FOREACH_ADVANCE($_s, $i, $p, $op); ));
    }' unless defined(&__BIT_FOREACH);
    eval 'sub __BIT_FOREACH_ISSET {
        my($_s, $i, $p) = @_;
	    eval q( &__BIT_FOREACH($_s, $i, $p, ));
    }' unless defined(&__BIT_FOREACH_ISSET);
    eval 'sub __BIT_FOREACH_ISCLR {
        my($_s, $i, $p) = @_;
	    eval q( &__BIT_FOREACH($_s, $i, $p, ~));
    }' unless defined(&__BIT_FOREACH_ISCLR);
    eval 'sub __BITSET_T_INITIALIZER {
        my($x) = @_;
	    eval q({ . &__bits = { $x } });
    }' unless defined(&__BITSET_T_INITIALIZER);
    eval 'sub __BITSET_FSET {
        my($n) = @_;
	    eval q([ 0... (($n) - 1) ] = (-1));
    }' unless defined(&__BITSET_FSET);
    eval 'sub __BITSET_SIZE {
        my($_s) = @_;
	    eval q(( &__bitset_words(($_s)) * $sizeof{\'long\'}));
    }' unless defined(&__BITSET_SIZE);
    if(defined(&_KERNEL) || defined(&_WANT_FREEBSD_BITSET)) {
	eval 'sub BIT_AND {
	    my($_s, $d, $s) = @_;
    	    eval q( &__BIT_AND($_s, $d, $s));
	}' unless defined(&BIT_AND);
	eval 'sub BIT_AND2 {
	    my($_s, $d, $s1, $s2) = @_;
    	    eval q( &__BIT_AND2($_s, $d, $s1, $s2));
	}' unless defined(&BIT_AND2);
	eval 'sub BIT_ANDNOT {
	    my($_s, $d, $s) = @_;
    	    eval q( &__BIT_ANDNOT($_s, $d, $s));
	}' unless defined(&BIT_ANDNOT);
	eval 'sub BIT_ANDNOT2 {
	    my($_s, $d, $s1, $s2) = @_;
    	    eval q( &__BIT_ANDNOT2($_s, $d, $s1, $s2));
	}' unless defined(&BIT_ANDNOT2);
	eval 'sub BIT_AND_ATOMIC {
	    my($_s, $d, $s) = @_;
    	    eval q( &__BIT_AND_ATOMIC($_s, $d, $s));
	}' unless defined(&BIT_AND_ATOMIC);
	eval 'sub BIT_CLR {
	    my($_s, $n, $p) = @_;
    	    eval q( &__BIT_CLR($_s, $n, $p));
	}' unless defined(&BIT_CLR);
	eval 'sub BIT_CLR_ATOMIC {
	    my($_s, $n, $p) = @_;
    	    eval q( &__BIT_CLR_ATOMIC($_s, $n, $p));
	}' unless defined(&BIT_CLR_ATOMIC);
	eval 'sub BIT_CMP {
	    my($_s, $p, $c) = @_;
    	    eval q( &__BIT_CMP($_s, $p, $c));
	}' unless defined(&BIT_CMP);
	eval 'sub BIT_COPY {
	    my($_s, $f, $t) = @_;
    	    eval q( &__BIT_COPY($_s, $f, $t));
	}' unless defined(&BIT_COPY);
	eval 'sub BIT_COPY_STORE_REL {
	    my($_s, $f, $t) = @_;
    	    eval q( &__BIT_COPY_STORE_REL($_s, $f, $t));
	}' unless defined(&BIT_COPY_STORE_REL);
	eval 'sub BIT_COUNT {
	    my($_s, $p) = @_;
    	    eval q( &__BIT_COUNT($_s, $p));
	}' unless defined(&BIT_COUNT);
	eval 'sub BIT_EMPTY {
	    my($_s, $p) = @_;
    	    eval q( &__BIT_EMPTY($_s, $p));
	}' unless defined(&BIT_EMPTY);
	eval 'sub BIT_FFS {
	    my($_s, $p) = @_;
    	    eval q( &__BIT_FFS($_s, $p));
	}' unless defined(&BIT_FFS);
	eval 'sub BIT_FFS_AT {
	    my($_s, $p, $start) = @_;
    	    eval q( &__BIT_FFS_AT($_s, $p, $start));
	}' unless defined(&BIT_FFS_AT);
	eval 'sub BIT_FILL {
	    my($_s, $p) = @_;
    	    eval q( &__BIT_FILL($_s, $p));
	}' unless defined(&BIT_FILL);
	eval 'sub BIT_FLS {
	    my($_s, $p) = @_;
    	    eval q( &__BIT_FLS($_s, $p));
	}' unless defined(&BIT_FLS);
	eval 'sub BIT_FOREACH {
	    my($_s, $i, $p, $op) = @_;
    	    eval q( &__BIT_FOREACH($_s, $i, $p, $op));
	}' unless defined(&BIT_FOREACH);
	eval 'sub BIT_FOREACH_ISCLR {
	    my($_s, $i, $p) = @_;
    	    eval q( &__BIT_FOREACH_ISCLR($_s, $i, $p));
	}' unless defined(&BIT_FOREACH_ISCLR);
	eval 'sub BIT_FOREACH_ISSET {
	    my($_s, $i, $p) = @_;
    	    eval q( &__BIT_FOREACH_ISSET($_s, $i, $p));
	}' unless defined(&BIT_FOREACH_ISSET);
	eval 'sub BIT_ISFULLSET {
	    my($_s, $p) = @_;
    	    eval q( &__BIT_ISFULLSET($_s, $p));
	}' unless defined(&BIT_ISFULLSET);
	eval 'sub BIT_ISSET {
	    my($_s, $n, $p) = @_;
    	    eval q( &__BIT_ISSET($_s, $n, $p));
	}' unless defined(&BIT_ISSET);
	eval 'sub BIT_OR {
	    my($_s, $d, $s) = @_;
    	    eval q( &__BIT_OR($_s, $d, $s));
	}' unless defined(&BIT_OR);
	eval 'sub BIT_OR2 {
	    my($_s, $d, $s1, $s2) = @_;
    	    eval q( &__BIT_OR2($_s, $d, $s1, $s2));
	}' unless defined(&BIT_OR2);
	eval 'sub BIT_OR_ATOMIC {
	    my($_s, $d, $s) = @_;
    	    eval q( &__BIT_OR_ATOMIC($_s, $d, $s));
	}' unless defined(&BIT_OR_ATOMIC);
	eval 'sub BIT_OVERLAP {
	    my($_s, $p, $c) = @_;
    	    eval q( &__BIT_OVERLAP($_s, $p, $c));
	}' unless defined(&BIT_OVERLAP);
	eval 'sub BIT_SET {
	    my($_s, $n, $p) = @_;
    	    eval q( &__BIT_SET($_s, $n, $p));
	}' unless defined(&BIT_SET);
	eval 'sub BIT_SETOF {
	    my($_s, $n, $p) = @_;
    	    eval q( &__BIT_SETOF($_s, $n, $p));
	}' unless defined(&BIT_SETOF);
	eval 'sub BIT_SET_ATOMIC {
	    my($_s, $n, $p) = @_;
    	    eval q( &__BIT_SET_ATOMIC($_s, $n, $p));
	}' unless defined(&BIT_SET_ATOMIC);
	eval 'sub BIT_SET_ATOMIC_ACQ {
	    my($_s, $n, $p) = @_;
    	    eval q( &__BIT_SET_ATOMIC_ACQ($_s, $n, $p));
	}' unless defined(&BIT_SET_ATOMIC_ACQ);
	eval 'sub BIT_SUBSET {
	    my($_s, $p, $c) = @_;
    	    eval q( &__BIT_SUBSET($_s, $p, $c));
	}' unless defined(&BIT_SUBSET);
	eval 'sub BIT_TEST_CLR_ATOMIC {
	    my($_s, $n, $p) = @_;
    	    eval q( &__BIT_TEST_CLR_ATOMIC($_s, $n, $p));
	}' unless defined(&BIT_TEST_CLR_ATOMIC);
	eval 'sub BIT_TEST_SET_ATOMIC {
	    my($_s, $n, $p) = @_;
    	    eval q( &__BIT_TEST_SET_ATOMIC($_s, $n, $p));
	}' unless defined(&BIT_TEST_SET_ATOMIC);
	eval 'sub BIT_XOR {
	    my($_s, $d, $s) = @_;
    	    eval q( &__BIT_XOR($_s, $d, $s));
	}' unless defined(&BIT_XOR);
	eval 'sub BIT_XOR2 {
	    my($_s, $d, $s1, $s2) = @_;
    	    eval q( &__BIT_XOR2($_s, $d, $s1, $s2));
	}' unless defined(&BIT_XOR2);
	eval 'sub BIT_ZERO {
	    my($_s, $p) = @_;
    	    eval q( &__BIT_ZERO($_s, $p));
	}' unless defined(&BIT_ZERO);
	if(defined(&_KERNEL)) {
	    eval 'sub BITSET_ALLOC {
	        my($_s, $mt, $mf) = @_;
    		eval q( &malloc( &__BITSET_SIZE(($_s)), $mt, ($mf)));
	    }' unless defined(&BITSET_ALLOC);
	    eval 'sub BITSET_FREE {
	        my($p, $mt) = @_;
    		eval q( &free($p, $mt));
	    }' unless defined(&BITSET_FREE);
	}
	eval 'sub BITSET_FSET {
	    my($n) = @_;
    	    eval q( &__BITSET_FSET($n));
	}' unless defined(&BITSET_FSET);
	eval 'sub BITSET_SIZE {
	    my($_s) = @_;
    	    eval q( &__BITSET_SIZE($_s));
	}' unless defined(&BITSET_SIZE);
	eval 'sub BITSET_T_INITIALIZER {
	    my($x) = @_;
    	    eval q( &__BITSET_T_INITIALIZER($x));
	}' unless defined(&BITSET_T_INITIALIZER);
    }
}
1;

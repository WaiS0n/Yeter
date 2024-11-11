require '_h2ph_pre.ph';

no warnings qw(redefine misc);

unless(defined(&_SYS__BITSET_H_)) {
    eval 'sub _SYS__BITSET_H_ () {1;}' unless defined(&_SYS__BITSET_H_);
    eval 'sub _BITSET_BITS () {($sizeof{\'long\'} * 8);}' unless defined(&_BITSET_BITS);
    eval 'sub __howmany {
        my($x, $y) = @_;
	    eval q(((($x) + (($y) - 1)) / ($y)));
    }' unless defined(&__howmany);
    eval 'sub __bitset_words {
        my($_s) = @_;
	    eval q(( &__howmany($_s,  &_BITSET_BITS)));
    }' unless defined(&__bitset_words);
    eval 'sub __BITSET_DEFINE {
        my($_t, $_s) = @_;
	    eval q(\'struct _t\' { \'long __bits\'[ &__bitset_words(($_s))]; });
    }' unless defined(&__BITSET_DEFINE);
    eval 'sub __BITSET_DEFINE_VAR {
        my($_t) = @_;
	    eval q( &__BITSET_DEFINE($_t, 1));
    }' unless defined(&__BITSET_DEFINE_VAR);
    if(defined(&_KERNEL) || defined(&_WANT_FREEBSD_BITSET)) {
	eval 'sub BITSET_DEFINE {
	    my($_t, $_s) = @_;
    	    eval q( &__BITSET_DEFINE($_t, $_s));
	}' unless defined(&BITSET_DEFINE);
	eval 'sub BITSET_DEFINE_VAR {
	    my($_t) = @_;
    	    eval q( &__BITSET_DEFINE_VAR($_t));
	}' unless defined(&BITSET_DEFINE_VAR);
    }
}
1;

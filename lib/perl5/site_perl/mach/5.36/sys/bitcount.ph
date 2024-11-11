require '_h2ph_pre.ph';

no warnings qw(redefine misc);

unless(defined(&_SYS_BITCOUNT_H_)) {
    eval 'sub _SYS_BITCOUNT_H_ () {1;}' unless defined(&_SYS_BITCOUNT_H_);
    require 'sys/_types.ph';
    if(defined(&__POPCNT__)) {
	eval 'sub __bitcount64 {
	    my($x) = @_;
    	    eval q( &__builtin_popcountll(( &__uint64_t)($x)));
	}' unless defined(&__bitcount64);
	eval 'sub __bitcount32 {
	    my($x) = @_;
    	    eval q( &__builtin_popcount(( &__uint32_t)($x)));
	}' unless defined(&__bitcount32);
	eval 'sub __bitcount16 {
	    my($x) = @_;
    	    eval q( &__builtin_popcount(( &__uint16_t)($x)));
	}' unless defined(&__bitcount16);
	eval 'sub __bitcountl {
	    my($x) = @_;
    	    eval q( &__builtin_popcountl(($x)));
	}' unless defined(&__bitcountl);
	eval 'sub __bitcount {
	    my($x) = @_;
    	    eval q( &__builtin_popcount(($x)));
	}' unless defined(&__bitcount);
    } else {
	eval 'sub __bitcount32 {
	    my($_x) = @_;
    	    eval q({ $_x = ($_x & 0x55555555) + (($_x & 0xaaaaaaaa) >> 1); $_x = ($_x & 0x33333333) + (($_x & 0xcccccccc) >> 2); $_x = ($_x + ($_x >> 4)) & 0xf0f0f0f; $_x = ($_x + ($_x >> 8)); $_x = ($_x + ($_x >> 16)) & 0xff; ($_x); });
	}' unless defined(&__bitcount32);
	if(defined(&__LP64__)) {
	    eval 'sub __bitcount64 {
	        my($_x) = @_;
    		eval q({ $_x = ($_x & 0x5555555555555555) + (($_x & 0xaaaaaaaaaaaaaaaa) >> 1); $_x = ($_x & 0x3333333333333333) + (($_x & 0xcccccccccccccccc) >> 2); $_x = ($_x + ($_x >> 4)) & 0xf0f0f0f0f0f0f0f; $_x = ($_x + ($_x >> 8)); $_x = ($_x + ($_x >> 16)); $_x = ($_x + ($_x >> 32)) & 0xff; ($_x); });
	    }' unless defined(&__bitcount64);
	    eval 'sub __bitcountl {
	        my($x) = @_;
    		eval q( &__bitcount64(($x)));
	    }' unless defined(&__bitcountl);
	} else {
	    eval 'sub __bitcount64 {
	        my($_x) = @_;
    		eval q({ ( &__bitcount32($_x >> 32) +  &__bitcount32($_x)); });
	    }' unless defined(&__bitcount64);
	    eval 'sub __bitcountl {
	        my($x) = @_;
    		eval q( &__bitcount32(($x)));
	    }' unless defined(&__bitcountl);
	}
	eval 'sub __bitcount {
	    my($x) = @_;
    	    eval q( &__bitcount32(($x)));
	}' unless defined(&__bitcount);
    }
}
1;

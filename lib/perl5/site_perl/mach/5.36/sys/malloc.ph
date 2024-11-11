require '_h2ph_pre.ph';

no warnings qw(redefine misc);

unless(defined(&_SYS_MALLOC_H_)) {
    eval 'sub _SYS_MALLOC_H_ () {1;}' unless defined(&_SYS_MALLOC_H_);
    unless(defined(&_STANDALONE)) {
	require 'sys/param.ph';
	if(defined(&_KERNEL)) {
	    require 'sys/systm.ph';
	}
	require 'sys/queue.ph';
	require 'sys/_lock.ph';
	require 'sys/_mutex.ph';
	require 'machine/_limits.ph';
	eval 'sub MINALLOCSIZE () { &UMA_SMALLEST_UNIT;}' unless defined(&MINALLOCSIZE);
	eval 'sub M_NOWAIT () {0x1;}' unless defined(&M_NOWAIT);
	eval 'sub M_WAITOK () {0x2;}' unless defined(&M_WAITOK);
	eval 'sub M_NORECLAIM () {0x80;}' unless defined(&M_NORECLAIM);
	eval 'sub M_ZERO () {0x100;}' unless defined(&M_ZERO);
	eval 'sub M_NOVM () {0x200;}' unless defined(&M_NOVM);
	eval 'sub M_USE_RESERVE () {0x400;}' unless defined(&M_USE_RESERVE);
	eval 'sub M_NODUMP () {0x800;}' unless defined(&M_NODUMP);
	eval 'sub M_FIRSTFIT () {0x1000;}' unless defined(&M_FIRSTFIT);
	eval 'sub M_BESTFIT () {0x2000;}' unless defined(&M_BESTFIT);
	eval 'sub M_EXEC () {0x4000;}' unless defined(&M_EXEC);
	eval 'sub M_NEXTFIT () {0x8000;}' unless defined(&M_NEXTFIT);
	eval 'sub M_VERSION () {2020110501;}' unless defined(&M_VERSION);
	eval 'sub DTMALLOC_PROBE_MALLOC () {0;}' unless defined(&DTMALLOC_PROBE_MALLOC);
	eval 'sub DTMALLOC_PROBE_FREE () {1;}' unless defined(&DTMALLOC_PROBE_FREE);
	eval 'sub DTMALLOC_PROBE_MAX () {2;}' unless defined(&DTMALLOC_PROBE_MAX);
	eval 'sub MALLOC_TYPE_STREAM_VERSION () {0x1;}' unless defined(&MALLOC_TYPE_STREAM_VERSION);
	eval 'sub MALLOC_MAX_NAME () {32;}' unless defined(&MALLOC_MAX_NAME);
	if(defined(&_KERNEL)) {
	    eval 'sub MALLOC_DEFINE {
	        my($type, $shortdesc, $longdesc) = @_;
    		eval q(\'struct malloc_type\' $type->[1] = { { . &ks_next =  &NULL, . &ks_version =  &M_VERSION, . &ks_shortdesc = $shortdesc, } };  &SYSINIT($type &_init,  &SI_SUB_KMEM,  &SI_ORDER_THIRD,  &malloc_init, $type);  &SYSUNINIT($type &_uninit,  &SI_SUB_KMEM,  &SI_ORDER_ANY,  &malloc_uninit, $type));
	    }' unless defined(&MALLOC_DEFINE);
	    eval 'sub MALLOC_DECLARE {
	        my($type) = @_;
    		eval q( &extern \'struct malloc_type\' $type->[1]);
	    }' unless defined(&MALLOC_DECLARE);
	    eval 'sub malloc {
	        my($size, $type, $flags) = @_;
    		eval q(({  &void * &_malloc_item; \'size_t\'  &_size = ($size);  &if ( &__builtin_constant_p($size)  &&  &__builtin_constant_p($flags)  && (($flags) &  &M_ZERO) != 0) {  &_malloc_item =  &malloc( &_size, $type, ($flags) &~  &M_ZERO);  &if ((($flags) &  &M_WAITOK) != 0||  &__predict_true( &_malloc_item !=  &NULL))  &memset( &_malloc_item, 0,  &_size); }  &else {  &_malloc_item =  &malloc( &_size, $type, $flags); }  &_malloc_item; }));
	    }' unless defined(&malloc);
	    eval 'sub MUL_NO_OVERFLOW () {(1 << ($sizeof{\'size_t\'} * 8/ 2));}' unless defined(&MUL_NO_OVERFLOW);
	    eval 'sub WOULD_OVERFLOW {
	        my($nmemb,$size) = @_;
    		eval q({ (($nmemb >=  &MUL_NO_OVERFLOW || $size >=  &MUL_NO_OVERFLOW)  && $nmemb > 0 &&  &__SIZE_T_MAX / $nmemb < $size); });
	    }' unless defined(&WOULD_OVERFLOW);
	    undef(&MUL_NO_OVERFLOW) if defined(&MUL_NO_OVERFLOW);
	}
    } else {
	eval 'sub M_WAITOK () {1;}' unless defined(&M_WAITOK);
	eval 'sub M_ZERO () {0;}' unless defined(&M_ZERO);
	eval 'sub M_NOWAIT () {2;}' unless defined(&M_NOWAIT);
	eval 'sub MALLOC_DECLARE {
	    my($x) = @_;
    	    eval q();
	}' unless defined(&MALLOC_DECLARE);
	eval 'sub kmem_zalloc {
	    my($size, $flags) = @_;
    	    eval q(({  &void * &p =  &Malloc(,  &__FILE__,  &__LINE__);  &if ( &p ==  &NULL  && ($flags &  &M_WAITOK) != 0)  &panic(\\"Could not malloc %zd bytes with M_WAITOK from %s line %d\\", $size,  &__FILE__,  &__LINE__);  &p; }));
	}' unless defined(&kmem_zalloc);
	eval 'sub kmem_free {
	    my($p, $size) = @_;
    	    eval q( &Free($p,  &__FILE__,  &__LINE__));
	}' unless defined(&kmem_free);
	eval 'sub KM_SLEEP () { &M_WAITOK;}' unless defined(&KM_SLEEP);
	eval 'sub KM_NOSLEEP () { &M_NOWAIT;}' unless defined(&KM_NOSLEEP);
    }
}
1;

require '_h2ph_pre.ph';

no warnings qw(redefine misc);

if(defined(&__i386__)) {
    require 'i386/atomic.ph';
} else {
    unless(defined(&_MACHINE_ATOMIC_H_)) {
	eval 'sub _MACHINE_ATOMIC_H_ () {1;}' unless defined(&_MACHINE_ATOMIC_H_);
	eval 'sub mb () {
	    eval q( &__asm  &__volatile(\\"mfence;\\" : : : \\"memory\\"));
	}' unless defined(&mb);
	eval 'sub wmb () {
	    eval q( &__asm  &__volatile(\\"sfence;\\" : : : \\"memory\\"));
	}' unless defined(&wmb);
	eval 'sub rmb () {
	    eval q( &__asm  &__volatile(\\"lfence;\\" : : : \\"memory\\"));
	}' unless defined(&rmb);
	if(defined(&_KERNEL)) {
	    eval 'sub OFFSETOF_MONITORBUF () {0x100;}' unless defined(&OFFSETOF_MONITORBUF);
	}
	if(defined(&SAN_NEEDS_INTERCEPTORS)  && !defined(&SAN_RUNTIME)) {
	    require 'sys/atomic_san.ph';
	} else {
	    require 'sys/atomic_common.ph';
	    eval 'sub ATOMIC_ASM {
	        my($NAME, $TYPE, $OP, $CONS, $V) = @_;
    		eval q( &static  &__inline  &void  &atomic_$NAME &_$TYPE( &volatile  &u_$TYPE * &p,  &u_$TYPE  &v){  &__asm  &__volatile(\\"lock; \\" $OP : \\"+m\\" (* &p) : $CONS ($V) : \\"cc\\"); }  &static  &__inline  &void  &atomic_$NAME &_barr_$TYPE( &volatile  &u_$TYPE * &p,  &u_$TYPE  &v){  &__asm  &__volatile(\\"lock; \\" $OP : \\"+m\\" (* &p) : $CONS ($V) : \\"memory\\", \\"cc\\"); } \'struct __hack\');
	    }' unless defined(&ATOMIC_ASM);
	    eval 'sub ATOMIC_CMPSET {
	        my($TYPE) = @_;
    		eval q( &static  &__inline \'int\'  &atomic_cmpset_$TYPE( &volatile  &u_$TYPE * &dst,  &u_$TYPE  &expect,  &u_$TYPE  &src) { \'u_char\'  &res;  &__asm  &__volatile( \\" lock; cmpxchg %3,%1 ;	\\" \\"# atomic_cmpset_\\" $TYPE \\"	\\" : \\"=@cce\\" ( &res), \\"+m\\" (* &dst), \\"+a\\" ( &expect) : \\"r\\" ( &src) : \\"memory\\", \\"cc\\");  &return ( &res); }  &static  &__inline \'int\'  &atomic_fcmpset_$TYPE( &volatile  &u_$TYPE * &dst,  &u_$TYPE * &expect,  &u_$TYPE  &src) { \'u_char\'  &res;  &__asm  &__volatile( \\" lock; cmpxchg %3,%1 ;		\\" \\"# atomic_fcmpset_\\" $TYPE \\"	\\" : \\"=@cce\\" ( &res), \\"+m\\" (* &dst), \\"+a\\" (* &expect) : \\"r\\" ( &src) : \\"memory\\", \\"cc\\");  &return ( &res); });
	    }' unless defined(&ATOMIC_CMPSET);
	    eval 'sub atomic_testandset_int {
	        my($p,$v) = @_;
    		eval q({ \'u_char\'  &res;  &__asm  &__volatile( \\" lock;	btsl	%2,%1 ;		\\" \\"# atomic_testandset_int\\" : \\"=@ccc\\" ( &res), \\"+m\\" (*$p) : \\"Ir\\" ($v & 0x1f) : \\"cc\\"); ( &res); });
	    }' unless defined(&atomic_testandset_int);
	    eval 'sub atomic_testandset_long {
	        my($p,$v) = @_;
    		eval q({ \'u_char\'  &res;  &__asm  &__volatile( \\" lock;	btsq	%2,%1 ;		\\" \\"# atomic_testandset_long\\" : \\"=@ccc\\" , \\"+m\\" (*$p) : \\"Jr\\" (($v & 0x3f)) : \\"cc\\"); ( &res); });
	    }' unless defined(&atomic_testandset_long);
	    eval 'sub atomic_testandclear_int {
	        my($p,$v) = @_;
    		eval q({ \'u_char\'  &res;  &__asm  &__volatile( \\" lock;	btrl	%2,%1 ;		\\" \\"# atomic_testandclear_int\\" : \\"=@ccc\\" ( &res), \\"+m\\" (*$p) : \\"Ir\\" ($v & 0x1f) : \\"cc\\"); ( &res); });
	    }' unless defined(&atomic_testandclear_int);
	    eval 'sub atomic_testandclear_long {
	        my($p,$v) = @_;
    		eval q({ \'u_char\'  &res;  &__asm  &__volatile( \\" lock;	btrq	%2,%1 ;		\\" \\"# atomic_testandclear_long\\" : \\"=@ccc\\" , \\"+m\\" (*$p) : \\"Jr\\" (($v & 0x3f)) : \\"cc\\"); ( &res); });
	    }' unless defined(&atomic_testandclear_long);
	    if(defined(&_KERNEL)) {
	    } else {
	    }
	    eval 'sub ATOMIC_LOAD {
	        my($TYPE) = @_;
    		eval q( &static  &__inline  &u_$TYPE  &atomic_load_acq_$TYPE( &volatile  &u_$TYPE * &p) {  &u_$TYPE  &res;  &res = * &p;  &__compiler_membar();  &return ( &res); } \'struct __hack\');
	    }' unless defined(&ATOMIC_LOAD);
	    eval 'sub ATOMIC_STORE {
	        my($TYPE) = @_;
    		eval q( &static  &__inline  &void  &atomic_store_rel_$TYPE( &volatile  &u_$TYPE * &p,  &u_$TYPE  &v) {  &__compiler_membar(); * &p =  &v; } \'struct __hack\');
	    }' unless defined(&ATOMIC_STORE);
	    eval 'sub atomic_thread_fence_acq {
	        my($void) = @_;
    		eval q({  &__compiler_membar(); });
	    }' unless defined(&atomic_thread_fence_acq);
	    eval 'sub atomic_thread_fence_rel {
	        my($void) = @_;
    		eval q({  &__compiler_membar(); });
	    }' unless defined(&atomic_thread_fence_rel);
	    eval 'sub atomic_thread_fence_acq_rel {
	        my($void) = @_;
    		eval q({  &__compiler_membar(); });
	    }' unless defined(&atomic_thread_fence_acq_rel);
	    eval 'sub atomic_thread_fence_seq_cst {
	        my($void) = @_;
    		eval q({  &__storeload_barrier(); });
	    }' unless defined(&atomic_thread_fence_seq_cst);
	    eval 'sub ATOMIC_LOADSTORE {
	        my($TYPE) = @_;
    		eval q( &ATOMIC_LOAD($TYPE);  &ATOMIC_STORE($TYPE));
	    }' unless defined(&ATOMIC_LOADSTORE);
	    undef(&ATOMIC_ASM) if defined(&ATOMIC_ASM);
	    undef(&ATOMIC_LOAD) if defined(&ATOMIC_LOAD);
	    undef(&ATOMIC_STORE) if defined(&ATOMIC_STORE);
	    undef(&ATOMIC_LOADSTORE) if defined(&ATOMIC_LOADSTORE);
	    unless(defined(&WANT_FUNCTIONS)) {
		eval 'sub atomic_swap_long {
		    my($p,$v) = @_;
    		    eval q({  &__asm  &__volatile( \\"	xchgq	%1,%0 ;		\\" \\"# atomic_swap_long\\" : \\"+r\\" ($v), \\"+m\\" (*$p)); ($v); });
		}' unless defined(&atomic_swap_long);
		eval 'sub atomic_set_acq_char () { &atomic_set_barr_char;}' unless defined(&atomic_set_acq_char);
		eval 'sub atomic_set_rel_char () { &atomic_set_barr_char;}' unless defined(&atomic_set_rel_char);
		eval 'sub atomic_clear_acq_char () { &atomic_clear_barr_char;}' unless defined(&atomic_clear_acq_char);
		eval 'sub atomic_clear_rel_char () { &atomic_clear_barr_char;}' unless defined(&atomic_clear_rel_char);
		eval 'sub atomic_add_acq_char () { &atomic_add_barr_char;}' unless defined(&atomic_add_acq_char);
		eval 'sub atomic_add_rel_char () { &atomic_add_barr_char;}' unless defined(&atomic_add_rel_char);
		eval 'sub atomic_subtract_acq_char () { &atomic_subtract_barr_char;}' unless defined(&atomic_subtract_acq_char);
		eval 'sub atomic_subtract_rel_char () { &atomic_subtract_barr_char;}' unless defined(&atomic_subtract_rel_char);
		eval 'sub atomic_cmpset_acq_char () { &atomic_cmpset_char;}' unless defined(&atomic_cmpset_acq_char);
		eval 'sub atomic_cmpset_rel_char () { &atomic_cmpset_char;}' unless defined(&atomic_cmpset_rel_char);
		eval 'sub atomic_fcmpset_acq_char () { &atomic_fcmpset_char;}' unless defined(&atomic_fcmpset_acq_char);
		eval 'sub atomic_fcmpset_rel_char () { &atomic_fcmpset_char;}' unless defined(&atomic_fcmpset_rel_char);
		eval 'sub atomic_set_acq_short () {\'atomic_set_barr_short\';}' unless defined(&atomic_set_acq_short);
		eval 'sub atomic_set_rel_short () {\'atomic_set_barr_short\';}' unless defined(&atomic_set_rel_short);
		eval 'sub atomic_clear_acq_short () {\'atomic_clear_barr_short\';}' unless defined(&atomic_clear_acq_short);
		eval 'sub atomic_clear_rel_short () {\'atomic_clear_barr_short\';}' unless defined(&atomic_clear_rel_short);
		eval 'sub atomic_add_acq_short () {\'atomic_add_barr_short\';}' unless defined(&atomic_add_acq_short);
		eval 'sub atomic_add_rel_short () {\'atomic_add_barr_short\';}' unless defined(&atomic_add_rel_short);
		eval 'sub atomic_subtract_acq_short () {\'atomic_subtract_barr_short\';}' unless defined(&atomic_subtract_acq_short);
		eval 'sub atomic_subtract_rel_short () {\'atomic_subtract_barr_short\';}' unless defined(&atomic_subtract_rel_short);
		eval 'sub atomic_cmpset_acq_short () {\'atomic_cmpset_short\';}' unless defined(&atomic_cmpset_acq_short);
		eval 'sub atomic_cmpset_rel_short () {\'atomic_cmpset_short\';}' unless defined(&atomic_cmpset_rel_short);
		eval 'sub atomic_fcmpset_acq_short () {\'atomic_fcmpset_short\';}' unless defined(&atomic_fcmpset_acq_short);
		eval 'sub atomic_fcmpset_rel_short () {\'atomic_fcmpset_short\';}' unless defined(&atomic_fcmpset_rel_short);
		eval 'sub atomic_set_acq_int () { &atomic_set_barr_int;}' unless defined(&atomic_set_acq_int);
		eval 'sub atomic_set_rel_int () { &atomic_set_barr_int;}' unless defined(&atomic_set_rel_int);
		eval 'sub atomic_clear_acq_int () { &atomic_clear_barr_int;}' unless defined(&atomic_clear_acq_int);
		eval 'sub atomic_clear_rel_int () { &atomic_clear_barr_int;}' unless defined(&atomic_clear_rel_int);
		eval 'sub atomic_add_acq_int () { &atomic_add_barr_int;}' unless defined(&atomic_add_acq_int);
		eval 'sub atomic_add_rel_int () { &atomic_add_barr_int;}' unless defined(&atomic_add_rel_int);
		eval 'sub atomic_subtract_acq_int () { &atomic_subtract_barr_int;}' unless defined(&atomic_subtract_acq_int);
		eval 'sub atomic_subtract_rel_int () { &atomic_subtract_barr_int;}' unless defined(&atomic_subtract_rel_int);
		eval 'sub atomic_cmpset_acq_int () { &atomic_cmpset_int;}' unless defined(&atomic_cmpset_acq_int);
		eval 'sub atomic_cmpset_rel_int () { &atomic_cmpset_int;}' unless defined(&atomic_cmpset_rel_int);
		eval 'sub atomic_fcmpset_acq_int () { &atomic_fcmpset_int;}' unless defined(&atomic_fcmpset_acq_int);
		eval 'sub atomic_fcmpset_rel_int () { &atomic_fcmpset_int;}' unless defined(&atomic_fcmpset_rel_int);
		eval 'sub atomic_set_acq_long () {\'atomic_set_barr_long\';}' unless defined(&atomic_set_acq_long);
		eval 'sub atomic_set_rel_long () {\'atomic_set_barr_long\';}' unless defined(&atomic_set_rel_long);
		eval 'sub atomic_clear_acq_long () {\'atomic_clear_barr_long\';}' unless defined(&atomic_clear_acq_long);
		eval 'sub atomic_clear_rel_long () {\'atomic_clear_barr_long\';}' unless defined(&atomic_clear_rel_long);
		eval 'sub atomic_add_acq_long () {\'atomic_add_barr_long\';}' unless defined(&atomic_add_acq_long);
		eval 'sub atomic_add_rel_long () {\'atomic_add_barr_long\';}' unless defined(&atomic_add_rel_long);
		eval 'sub atomic_subtract_acq_long () {\'atomic_subtract_barr_long\';}' unless defined(&atomic_subtract_acq_long);
		eval 'sub atomic_subtract_rel_long () {\'atomic_subtract_barr_long\';}' unless defined(&atomic_subtract_rel_long);
		eval 'sub atomic_cmpset_acq_long () {\'atomic_cmpset_long\';}' unless defined(&atomic_cmpset_acq_long);
		eval 'sub atomic_cmpset_rel_long () {\'atomic_cmpset_long\';}' unless defined(&atomic_cmpset_rel_long);
		eval 'sub atomic_fcmpset_acq_long () {\'atomic_fcmpset_long\';}' unless defined(&atomic_fcmpset_acq_long);
		eval 'sub atomic_fcmpset_rel_long () {\'atomic_fcmpset_long\';}' unless defined(&atomic_fcmpset_rel_long);
		eval 'sub atomic_readandclear_int {
		    my($p) = @_;
    		    eval q( &atomic_swap_int($p, 0));
		}' unless defined(&atomic_readandclear_int);
		eval 'sub atomic_readandclear_long {
		    my($p) = @_;
    		    eval q( &atomic_swap_long($p, 0));
		}' unless defined(&atomic_readandclear_long);
		eval 'sub atomic_testandset_acq_long () {\'atomic_testandset_long\';}' unless defined(&atomic_testandset_acq_long);
		eval 'sub atomic_set_8 () { &atomic_set_char;}' unless defined(&atomic_set_8);
		eval 'sub atomic_set_acq_8 () { &atomic_set_acq_char;}' unless defined(&atomic_set_acq_8);
		eval 'sub atomic_set_rel_8 () { &atomic_set_rel_char;}' unless defined(&atomic_set_rel_8);
		eval 'sub atomic_clear_8 () { &atomic_clear_char;}' unless defined(&atomic_clear_8);
		eval 'sub atomic_clear_acq_8 () { &atomic_clear_acq_char;}' unless defined(&atomic_clear_acq_8);
		eval 'sub atomic_clear_rel_8 () { &atomic_clear_rel_char;}' unless defined(&atomic_clear_rel_8);
		eval 'sub atomic_add_8 () { &atomic_add_char;}' unless defined(&atomic_add_8);
		eval 'sub atomic_add_acq_8 () { &atomic_add_acq_char;}' unless defined(&atomic_add_acq_8);
		eval 'sub atomic_add_rel_8 () { &atomic_add_rel_char;}' unless defined(&atomic_add_rel_8);
		eval 'sub atomic_subtract_8 () { &atomic_subtract_char;}' unless defined(&atomic_subtract_8);
		eval 'sub atomic_subtract_acq_8 () { &atomic_subtract_acq_char;}' unless defined(&atomic_subtract_acq_8);
		eval 'sub atomic_subtract_rel_8 () { &atomic_subtract_rel_char;}' unless defined(&atomic_subtract_rel_8);
		eval 'sub atomic_load_acq_8 () { &atomic_load_acq_char;}' unless defined(&atomic_load_acq_8);
		eval 'sub atomic_store_rel_8 () { &atomic_store_rel_char;}' unless defined(&atomic_store_rel_8);
		eval 'sub atomic_cmpset_8 () { &atomic_cmpset_char;}' unless defined(&atomic_cmpset_8);
		eval 'sub atomic_cmpset_acq_8 () { &atomic_cmpset_acq_char;}' unless defined(&atomic_cmpset_acq_8);
		eval 'sub atomic_cmpset_rel_8 () { &atomic_cmpset_rel_char;}' unless defined(&atomic_cmpset_rel_8);
		eval 'sub atomic_fcmpset_8 () { &atomic_fcmpset_char;}' unless defined(&atomic_fcmpset_8);
		eval 'sub atomic_fcmpset_acq_8 () { &atomic_fcmpset_acq_char;}' unless defined(&atomic_fcmpset_acq_8);
		eval 'sub atomic_fcmpset_rel_8 () { &atomic_fcmpset_rel_char;}' unless defined(&atomic_fcmpset_rel_8);
		eval 'sub atomic_set_16 () {\'atomic_set_short\';}' unless defined(&atomic_set_16);
		eval 'sub atomic_set_acq_16 () {\'atomic_set_acq_short\';}' unless defined(&atomic_set_acq_16);
		eval 'sub atomic_set_rel_16 () {\'atomic_set_rel_short\';}' unless defined(&atomic_set_rel_16);
		eval 'sub atomic_clear_16 () {\'atomic_clear_short\';}' unless defined(&atomic_clear_16);
		eval 'sub atomic_clear_acq_16 () {\'atomic_clear_acq_short\';}' unless defined(&atomic_clear_acq_16);
		eval 'sub atomic_clear_rel_16 () {\'atomic_clear_rel_short\';}' unless defined(&atomic_clear_rel_16);
		eval 'sub atomic_add_16 () {\'atomic_add_short\';}' unless defined(&atomic_add_16);
		eval 'sub atomic_add_acq_16 () {\'atomic_add_acq_short\';}' unless defined(&atomic_add_acq_16);
		eval 'sub atomic_add_rel_16 () {\'atomic_add_rel_short\';}' unless defined(&atomic_add_rel_16);
		eval 'sub atomic_subtract_16 () {\'atomic_subtract_short\';}' unless defined(&atomic_subtract_16);
		eval 'sub atomic_subtract_acq_16 () {\'atomic_subtract_acq_short\';}' unless defined(&atomic_subtract_acq_16);
		eval 'sub atomic_subtract_rel_16 () {\'atomic_subtract_rel_short\';}' unless defined(&atomic_subtract_rel_16);
		eval 'sub atomic_load_acq_16 () {\'atomic_load_acq_short\';}' unless defined(&atomic_load_acq_16);
		eval 'sub atomic_store_rel_16 () {\'atomic_store_rel_short\';}' unless defined(&atomic_store_rel_16);
		eval 'sub atomic_cmpset_16 () {\'atomic_cmpset_short\';}' unless defined(&atomic_cmpset_16);
		eval 'sub atomic_cmpset_acq_16 () {\'atomic_cmpset_acq_short\';}' unless defined(&atomic_cmpset_acq_16);
		eval 'sub atomic_cmpset_rel_16 () {\'atomic_cmpset_rel_short\';}' unless defined(&atomic_cmpset_rel_16);
		eval 'sub atomic_fcmpset_16 () {\'atomic_fcmpset_short\';}' unless defined(&atomic_fcmpset_16);
		eval 'sub atomic_fcmpset_acq_16 () {\'atomic_fcmpset_acq_short\';}' unless defined(&atomic_fcmpset_acq_16);
		eval 'sub atomic_fcmpset_rel_16 () {\'atomic_fcmpset_rel_short\';}' unless defined(&atomic_fcmpset_rel_16);
		eval 'sub atomic_set_32 () { &atomic_set_int;}' unless defined(&atomic_set_32);
		eval 'sub atomic_set_acq_32 () { &atomic_set_acq_int;}' unless defined(&atomic_set_acq_32);
		eval 'sub atomic_set_rel_32 () { &atomic_set_rel_int;}' unless defined(&atomic_set_rel_32);
		eval 'sub atomic_clear_32 () { &atomic_clear_int;}' unless defined(&atomic_clear_32);
		eval 'sub atomic_clear_acq_32 () { &atomic_clear_acq_int;}' unless defined(&atomic_clear_acq_32);
		eval 'sub atomic_clear_rel_32 () { &atomic_clear_rel_int;}' unless defined(&atomic_clear_rel_32);
		eval 'sub atomic_add_32 () { &atomic_add_int;}' unless defined(&atomic_add_32);
		eval 'sub atomic_add_acq_32 () { &atomic_add_acq_int;}' unless defined(&atomic_add_acq_32);
		eval 'sub atomic_add_rel_32 () { &atomic_add_rel_int;}' unless defined(&atomic_add_rel_32);
		eval 'sub atomic_subtract_32 () { &atomic_subtract_int;}' unless defined(&atomic_subtract_32);
		eval 'sub atomic_subtract_acq_32 () { &atomic_subtract_acq_int;}' unless defined(&atomic_subtract_acq_32);
		eval 'sub atomic_subtract_rel_32 () { &atomic_subtract_rel_int;}' unless defined(&atomic_subtract_rel_32);
		eval 'sub atomic_load_acq_32 () { &atomic_load_acq_int;}' unless defined(&atomic_load_acq_32);
		eval 'sub atomic_store_rel_32 () { &atomic_store_rel_int;}' unless defined(&atomic_store_rel_32);
		eval 'sub atomic_cmpset_32 () { &atomic_cmpset_int;}' unless defined(&atomic_cmpset_32);
		eval 'sub atomic_cmpset_acq_32 () { &atomic_cmpset_acq_int;}' unless defined(&atomic_cmpset_acq_32);
		eval 'sub atomic_cmpset_rel_32 () { &atomic_cmpset_rel_int;}' unless defined(&atomic_cmpset_rel_32);
		eval 'sub atomic_fcmpset_32 () { &atomic_fcmpset_int;}' unless defined(&atomic_fcmpset_32);
		eval 'sub atomic_fcmpset_acq_32 () { &atomic_fcmpset_acq_int;}' unless defined(&atomic_fcmpset_acq_32);
		eval 'sub atomic_fcmpset_rel_32 () { &atomic_fcmpset_rel_int;}' unless defined(&atomic_fcmpset_rel_32);
		eval 'sub atomic_swap_32 () { &atomic_swap_int;}' unless defined(&atomic_swap_32);
		eval 'sub atomic_readandclear_32 () { &atomic_readandclear_int;}' unless defined(&atomic_readandclear_32);
		eval 'sub atomic_fetchadd_32 () { &atomic_fetchadd_int;}' unless defined(&atomic_fetchadd_32);
		eval 'sub atomic_testandset_32 () { &atomic_testandset_int;}' unless defined(&atomic_testandset_32);
		eval 'sub atomic_testandclear_32 () { &atomic_testandclear_int;}' unless defined(&atomic_testandclear_32);
		eval 'sub atomic_set_64 () {\'atomic_set_long\';}' unless defined(&atomic_set_64);
		eval 'sub atomic_set_acq_64 () {\'atomic_set_acq_long\';}' unless defined(&atomic_set_acq_64);
		eval 'sub atomic_set_rel_64 () {\'atomic_set_rel_long\';}' unless defined(&atomic_set_rel_64);
		eval 'sub atomic_clear_64 () {\'atomic_clear_long\';}' unless defined(&atomic_clear_64);
		eval 'sub atomic_clear_acq_64 () {\'atomic_clear_acq_long\';}' unless defined(&atomic_clear_acq_64);
		eval 'sub atomic_clear_rel_64 () {\'atomic_clear_rel_long\';}' unless defined(&atomic_clear_rel_64);
		eval 'sub atomic_add_64 () {\'atomic_add_long\';}' unless defined(&atomic_add_64);
		eval 'sub atomic_add_acq_64 () {\'atomic_add_acq_long\';}' unless defined(&atomic_add_acq_64);
		eval 'sub atomic_add_rel_64 () {\'atomic_add_rel_long\';}' unless defined(&atomic_add_rel_64);
		eval 'sub atomic_subtract_64 () {\'atomic_subtract_long\';}' unless defined(&atomic_subtract_64);
		eval 'sub atomic_subtract_acq_64 () {\'atomic_subtract_acq_long\';}' unless defined(&atomic_subtract_acq_64);
		eval 'sub atomic_subtract_rel_64 () {\'atomic_subtract_rel_long\';}' unless defined(&atomic_subtract_rel_64);
		eval 'sub atomic_load_acq_64 () {\'atomic_load_acq_long\';}' unless defined(&atomic_load_acq_64);
		eval 'sub atomic_store_rel_64 () {\'atomic_store_rel_long\';}' unless defined(&atomic_store_rel_64);
		eval 'sub atomic_cmpset_64 () {\'atomic_cmpset_long\';}' unless defined(&atomic_cmpset_64);
		eval 'sub atomic_cmpset_acq_64 () {\'atomic_cmpset_acq_long\';}' unless defined(&atomic_cmpset_acq_64);
		eval 'sub atomic_cmpset_rel_64 () {\'atomic_cmpset_rel_long\';}' unless defined(&atomic_cmpset_rel_64);
		eval 'sub atomic_fcmpset_64 () {\'atomic_fcmpset_long\';}' unless defined(&atomic_fcmpset_64);
		eval 'sub atomic_fcmpset_acq_64 () {\'atomic_fcmpset_acq_long\';}' unless defined(&atomic_fcmpset_acq_64);
		eval 'sub atomic_fcmpset_rel_64 () {\'atomic_fcmpset_rel_long\';}' unless defined(&atomic_fcmpset_rel_64);
		eval 'sub atomic_swap_64 () {\'atomic_swap_long\';}' unless defined(&atomic_swap_64);
		eval 'sub atomic_readandclear_64 () {\'atomic_readandclear_long\';}' unless defined(&atomic_readandclear_64);
		eval 'sub atomic_fetchadd_64 () {\'atomic_fetchadd_long\';}' unless defined(&atomic_fetchadd_64);
		eval 'sub atomic_testandset_64 () {\'atomic_testandset_long\';}' unless defined(&atomic_testandset_64);
		eval 'sub atomic_testandclear_64 () {\'atomic_testandclear_long\';}' unless defined(&atomic_testandclear_64);
		eval 'sub atomic_set_ptr () {\'atomic_set_long\';}' unless defined(&atomic_set_ptr);
		eval 'sub atomic_set_acq_ptr () {\'atomic_set_acq_long\';}' unless defined(&atomic_set_acq_ptr);
		eval 'sub atomic_set_rel_ptr () {\'atomic_set_rel_long\';}' unless defined(&atomic_set_rel_ptr);
		eval 'sub atomic_clear_ptr () {\'atomic_clear_long\';}' unless defined(&atomic_clear_ptr);
		eval 'sub atomic_clear_acq_ptr () {\'atomic_clear_acq_long\';}' unless defined(&atomic_clear_acq_ptr);
		eval 'sub atomic_clear_rel_ptr () {\'atomic_clear_rel_long\';}' unless defined(&atomic_clear_rel_ptr);
		eval 'sub atomic_add_ptr () {\'atomic_add_long\';}' unless defined(&atomic_add_ptr);
		eval 'sub atomic_add_acq_ptr () {\'atomic_add_acq_long\';}' unless defined(&atomic_add_acq_ptr);
		eval 'sub atomic_add_rel_ptr () {\'atomic_add_rel_long\';}' unless defined(&atomic_add_rel_ptr);
		eval 'sub atomic_subtract_ptr () {\'atomic_subtract_long\';}' unless defined(&atomic_subtract_ptr);
		eval 'sub atomic_subtract_acq_ptr () {\'atomic_subtract_acq_long\';}' unless defined(&atomic_subtract_acq_ptr);
		eval 'sub atomic_subtract_rel_ptr () {\'atomic_subtract_rel_long\';}' unless defined(&atomic_subtract_rel_ptr);
		eval 'sub atomic_load_acq_ptr () {\'atomic_load_acq_long\';}' unless defined(&atomic_load_acq_ptr);
		eval 'sub atomic_store_rel_ptr () {\'atomic_store_rel_long\';}' unless defined(&atomic_store_rel_ptr);
		eval 'sub atomic_cmpset_ptr () {\'atomic_cmpset_long\';}' unless defined(&atomic_cmpset_ptr);
		eval 'sub atomic_cmpset_acq_ptr () {\'atomic_cmpset_acq_long\';}' unless defined(&atomic_cmpset_acq_ptr);
		eval 'sub atomic_cmpset_rel_ptr () {\'atomic_cmpset_rel_long\';}' unless defined(&atomic_cmpset_rel_ptr);
		eval 'sub atomic_fcmpset_ptr () {\'atomic_fcmpset_long\';}' unless defined(&atomic_fcmpset_ptr);
		eval 'sub atomic_fcmpset_acq_ptr () {\'atomic_fcmpset_acq_long\';}' unless defined(&atomic_fcmpset_acq_ptr);
		eval 'sub atomic_fcmpset_rel_ptr () {\'atomic_fcmpset_rel_long\';}' unless defined(&atomic_fcmpset_rel_ptr);
		eval 'sub atomic_swap_ptr () {\'atomic_swap_long\';}' unless defined(&atomic_swap_ptr);
		eval 'sub atomic_readandclear_ptr () {\'atomic_readandclear_long\';}' unless defined(&atomic_readandclear_ptr);
	    }
	}
    }
}
1;

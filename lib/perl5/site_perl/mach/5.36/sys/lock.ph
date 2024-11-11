require '_h2ph_pre.ph';

no warnings qw(redefine misc);

unless(defined(&_SYS_LOCK_H_)) {
    eval 'sub _SYS_LOCK_H_ () {1;}' unless defined(&_SYS_LOCK_H_);
    require 'sys/queue.ph';
    require 'sys/_lock.ph';
    require 'sys/ktr_class.ph';
    eval 'sub LC_SLEEPLOCK () {0x1;}' unless defined(&LC_SLEEPLOCK);
    eval 'sub LC_SPINLOCK () {0x2;}' unless defined(&LC_SPINLOCK);
    eval 'sub LC_SLEEPABLE () {0x4;}' unless defined(&LC_SLEEPABLE);
    eval 'sub LC_RECURSABLE () {0x8;}' unless defined(&LC_RECURSABLE);
    eval 'sub LC_UPGRADABLE () {0x10;}' unless defined(&LC_UPGRADABLE);
    eval 'sub LO_CLASSFLAGS () {0xffff;}' unless defined(&LO_CLASSFLAGS);
    eval 'sub LO_INITIALIZED () {0x10000;}' unless defined(&LO_INITIALIZED);
    eval 'sub LO_WITNESS () {0x20000;}' unless defined(&LO_WITNESS);
    eval 'sub LO_QUIET () {0x40000;}' unless defined(&LO_QUIET);
    eval 'sub LO_RECURSABLE () {0x80000;}' unless defined(&LO_RECURSABLE);
    eval 'sub LO_SLEEPABLE () {0x100000;}' unless defined(&LO_SLEEPABLE);
    eval 'sub LO_UPGRADABLE () {0x200000;}' unless defined(&LO_UPGRADABLE);
    eval 'sub LO_DUPOK () {0x400000;}' unless defined(&LO_DUPOK);
    eval 'sub LO_IS_VNODE () {0x800000;}' unless defined(&LO_IS_VNODE);
    eval 'sub LO_CLASSMASK () {0xf000000;}' unless defined(&LO_CLASSMASK);
    eval 'sub LO_NOPROFILE () {0x10000000;}' unless defined(&LO_NOPROFILE);
    eval 'sub LO_NEW () {0x20000000;}' unless defined(&LO_NEW);
    eval 'sub LO_CLASSSHIFT () {24;}' unless defined(&LO_CLASSSHIFT);
    eval 'sub LO_CLASSINDEX {
        my($lock) = @_;
	    eval q((((($lock)-> &lo_flags) &  &LO_CLASSMASK) >>  &LO_CLASSSHIFT));
    }' unless defined(&LO_CLASSINDEX);
    eval 'sub LOCK_CLASS {
        my($lock) = @_;
	    eval q(( $lock_classes[ &LO_CLASSINDEX(($lock))]));
    }' unless defined(&LOCK_CLASS);
    eval 'sub LOCK_CLASS_MAX () {( &LO_CLASSMASK >>  &LO_CLASSSHIFT);}' unless defined(&LOCK_CLASS_MAX);
    eval 'sub LOP_NEWORDER () {0x1;}' unless defined(&LOP_NEWORDER);
    eval 'sub LOP_QUIET () {0x2;}' unless defined(&LOP_QUIET);
    eval 'sub LOP_TRYLOCK () {0x4;}' unless defined(&LOP_TRYLOCK);
    eval 'sub LOP_EXCLUSIVE () {0x8;}' unless defined(&LOP_EXCLUSIVE);
    eval 'sub LOP_DUPOK () {0x10;}' unless defined(&LOP_DUPOK);
    eval 'sub LOP_NOSLEEP () {0x20;}' unless defined(&LOP_NOSLEEP);
    eval 'sub LA_MASKASSERT () {0xff;}' unless defined(&LA_MASKASSERT);
    eval 'sub LA_UNLOCKED () {0x;}' unless defined(&LA_UNLOCKED);
    eval 'sub LA_LOCKED () {0x1;}' unless defined(&LA_LOCKED);
    eval 'sub LA_SLOCKED () {0x2;}' unless defined(&LA_SLOCKED);
    eval 'sub LA_XLOCKED () {0x4;}' unless defined(&LA_XLOCKED);
    eval 'sub LA_RECURSED () {0x8;}' unless defined(&LA_RECURSED);
    eval 'sub LA_NOTRECURSED () {0x10;}' unless defined(&LA_NOTRECURSED);
    if(defined(&_KERNEL)) {
	if((defined(&LOCK_DEBUG) ? &LOCK_DEBUG : undef) > 0) {
	    eval 'sub LOCK_LOG_TEST {
	        my($lo, $flags) = @_;
    		eval q(((($flags) &  &LOP_QUIET) == 0 && (($lo)-> &lo_flags &  &LO_QUIET) == 0));
	    }' unless defined(&LOCK_LOG_TEST);
	} else {
	    eval 'sub LOCK_LOG_TEST {
	        my($lo, $flags) = @_;
    		eval q(0);
	    }' unless defined(&LOCK_LOG_TEST);
	}
	eval 'sub LOCK_LOG_LOCK {
	    my($opname, $lo, $flags, $recurse, $file, $line) = @_;
    	    eval q( &do {  &if ( &LOCK_LOG_TEST(, ))  &CTR6( &KTR_LOCK, $opname \\" (%s) %s %p r = %d at %s:%d\\",  ($LOCK_CLASS->{lc_name}), -> &lo_name, , ($recurse), ($file), ($line)); }  &while (0));
	}' unless defined(&LOCK_LOG_LOCK);
	eval 'sub LOCK_LOG_TRY {
	    my($opname, $lo, $flags, $result, $file, $line) = @_;
    	    eval q( &do {  &if ( &LOCK_LOG_TEST(, ))  &CTR6( &KTR_LOCK, \\"TRY_\\" $opname \\" (%s) %s %p result=%d at %s:%d\\",  ($LOCK_CLASS->{lc_name}), -> &lo_name, , ($result), ($file), ($line)); }  &while (0));
	}' unless defined(&LOCK_LOG_TRY);
	eval 'sub LOCK_LOG_INIT {
	    my($lo, $flags) = @_;
    	    eval q( &do {  &if ( &LOCK_LOG_TEST(($lo), ($flags)))  &CTR4( &KTR_LOCK, \\"%s: %p (%s) %s\\",  &__func__, ($lo),  &LOCK_CLASS($lo)-> &lc_name, ($lo)-> &lo_name); }  &while (0));
	}' unless defined(&LOCK_LOG_INIT);
	eval 'sub LOCK_LOG_DESTROY {
	    my($lo, $flags) = @_;
    	    eval q( &LOCK_LOG_INIT($lo, $flags));
	}' unless defined(&LOCK_LOG_DESTROY);
	eval 'sub lock_initialized {
	    my($lo) = @_;
    	    eval q((($lo)-> &lo_flags &  &LO_INITIALIZED));
	}' unless defined(&lock_initialized);
	eval 'sub lock_delay_arg_init {
	    my($la,$lc) = @_;
    	    eval q({  ($la->{config}) = $lc;  ($la->{delay}) =  ($lc->{base});  ($la->{spin_cnt}) = 0; });
	}' unless defined(&lock_delay_arg_init);
	eval 'sub lock_delay_arg_init_noadapt {
	    my($la) = @_;
    	    eval q({  ($la->{delay}) = 0;  ($la->{spin_cnt}) = 0; });
	}' unless defined(&lock_delay_arg_init_noadapt);
	eval 'sub lock_delay_spin {
	    my($n) = @_;
    	    eval q( &do { \'u_int\'  &_i;  &for ( &_i = ($n);  &_i > 0;  &_i--)  &cpu_spinwait(); }  &while (0));
	}' unless defined(&lock_delay_spin);
	eval 'sub LOCK_DELAY_SYSINIT {
	    my($func) = @_;
    	    eval q( &SYSINIT($func &_ld,  &SI_SUB_LOCK,  &SI_ORDER_ANY, $func,  &NULL));
	}' unless defined(&LOCK_DELAY_SYSINIT);
	eval 'sub LOCK_DELAY_SYSINIT_DEFAULT {
	    my($lc) = @_;
    	    eval q( &SYSINIT( &lock_delay_$lc &_ld,  &SI_SUB_LOCK,  &SI_ORDER_ANY,  &lock_delay_default_init, $lc));
	}' unless defined(&LOCK_DELAY_SYSINIT_DEFAULT);
	if(defined(&WITNESS)) {
	    eval 'sub WARN_GIANTOK () {0x1;}' unless defined(&WARN_GIANTOK);
	    eval 'sub WARN_PANIC () {0x2;}' unless defined(&WARN_PANIC);
	    eval 'sub WARN_SLEEPOK () {0x4;}' unless defined(&WARN_SLEEPOK);
	    eval 'sub WITNESS_INIT {
	        my($lock, $type) = @_;
    		eval q( &witness_init(($lock), ($type)));
	    }' unless defined(&WITNESS_INIT);
	    eval 'sub WITNESS_DESTROY {
	        my($lock) = @_;
    		eval q( &witness_destroy($lock));
	    }' unless defined(&WITNESS_DESTROY);
	    eval 'sub WITNESS_CHECKORDER {
	        my($lock, $flags, $file, $line, $interlock) = @_;
    		eval q( &witness_checkorder(($lock), ($flags), ($file), ($line), ($interlock)));
	    }' unless defined(&WITNESS_CHECKORDER);
	    eval 'sub WITNESS_DEFINEORDER {
	        my($lock1, $lock2) = @_;
    		eval q( &witness_defineorder(($lock1), ($lock2)));
	    }' unless defined(&WITNESS_DEFINEORDER);
	    eval 'sub WITNESS_LOCK {
	        my($lock, $flags, $file, $line) = @_;
    		eval q( &witness_lock(($lock), ($flags), ($file), ($line)));
	    }' unless defined(&WITNESS_LOCK);
	    eval 'sub WITNESS_UPGRADE {
	        my($lock, $flags, $file, $line) = @_;
    		eval q( &witness_upgrade(($lock), ($flags), ($file), ($line)));
	    }' unless defined(&WITNESS_UPGRADE);
	    eval 'sub WITNESS_DOWNGRADE {
	        my($lock, $flags, $file, $line) = @_;
    		eval q( &witness_downgrade(($lock), ($flags), ($file), ($line)));
	    }' unless defined(&WITNESS_DOWNGRADE);
	    eval 'sub WITNESS_UNLOCK {
	        my($lock, $flags, $file, $line) = @_;
    		eval q( &witness_unlock(($lock), ($flags), ($file), ($line)));
	    }' unless defined(&WITNESS_UNLOCK);
	    eval 'sub WITNESS_CHECK () {( &flags,  &lock,  &fmt, ...)  &witness_warn(( &flags), ( &lock), ( &fmt),   &__VA_ARGS__);}' unless defined(&WITNESS_CHECK);
	    eval 'sub WITNESS_WARN () {( &flags,  &lock,  &fmt, ...)  &witness_warn(( &flags), ( &lock), ( &fmt),   &__VA_ARGS__);}' unless defined(&WITNESS_WARN);
	    eval 'sub WITNESS_SAVE_DECL {
	        my($n) = @_;
    		eval q( &const \'char\' *  &__CONCAT($n,  &__wf); \'int\'  &__CONCAT($n,  &__wl));
	    }' unless defined(&WITNESS_SAVE_DECL);
	    eval 'sub WITNESS_SAVE {
	        my($lock, $n) = @_;
    		eval q( &witness_save(($lock), & &__CONCAT($n,  &__wf), & &__CONCAT($n,  &__wl)));
	    }' unless defined(&WITNESS_SAVE);
	    eval 'sub WITNESS_RESTORE {
	        my($lock, $n) = @_;
    		eval q( &witness_restore(($lock),  &__CONCAT($n,  &__wf),  &__CONCAT($n,  &__wl)));
	    }' unless defined(&WITNESS_RESTORE);
	    eval 'sub WITNESS_NORELEASE {
	        my($lock) = @_;
    		eval q( &witness_norelease(($lock)-> &lock_object));
	    }' unless defined(&WITNESS_NORELEASE);
	    eval 'sub WITNESS_RELEASEOK {
	        my($lock) = @_;
    		eval q( &witness_releaseok(($lock)-> &lock_object));
	    }' unless defined(&WITNESS_RELEASEOK);
	    eval 'sub WITNESS_FILE {
	        my($lock) = @_;
    		eval q( &witness_file($lock));
	    }' unless defined(&WITNESS_FILE);
	    eval 'sub WITNESS_LINE {
	        my($lock) = @_;
    		eval q( &witness_line($lock));
	    }' unless defined(&WITNESS_LINE);
	} else {
	    eval 'sub WITNESS_INIT {
	        my($lock, $type) = @_;
    		eval q(( &void)0);
	    }' unless defined(&WITNESS_INIT);
	    eval 'sub WITNESS_DESTROY {
	        my($lock) = @_;
    		eval q(( &void)0);
	    }' unless defined(&WITNESS_DESTROY);
	    eval 'sub WITNESS_DEFINEORDER {
	        my($lock1, $lock2) = @_;
    		eval q(0);
	    }' unless defined(&WITNESS_DEFINEORDER);
	    eval 'sub WITNESS_CHECKORDER {
	        my($lock, $flags, $file, $line, $interlock) = @_;
    		eval q(( &void)0);
	    }' unless defined(&WITNESS_CHECKORDER);
	    eval 'sub WITNESS_LOCK {
	        my($lock, $flags, $file, $line) = @_;
    		eval q(( &void)0);
	    }' unless defined(&WITNESS_LOCK);
	    eval 'sub WITNESS_UPGRADE {
	        my($lock, $flags, $file, $line) = @_;
    		eval q(( &void)0);
	    }' unless defined(&WITNESS_UPGRADE);
	    eval 'sub WITNESS_DOWNGRADE {
	        my($lock, $flags, $file, $line) = @_;
    		eval q(( &void)0);
	    }' unless defined(&WITNESS_DOWNGRADE);
	    eval 'sub WITNESS_UNLOCK {
	        my($lock, $flags, $file, $line) = @_;
    		eval q(( &void)0);
	    }' unless defined(&WITNESS_UNLOCK);
	    eval 'sub WITNESS_CHECK () {( &flags,  &lock,  &fmt, ...) 0;}' unless defined(&WITNESS_CHECK);
	    eval 'sub WITNESS_WARN () {( &flags,  &lock,  &fmt, ...) ( &void)0;}' unless defined(&WITNESS_WARN);
	    eval 'sub WITNESS_SAVE_DECL {
	        my($n) = @_;
    		eval q(( &void)0);
	    }' unless defined(&WITNESS_SAVE_DECL);
	    eval 'sub WITNESS_SAVE {
	        my($lock, $n) = @_;
    		eval q(( &void)0);
	    }' unless defined(&WITNESS_SAVE);
	    eval 'sub WITNESS_RESTORE {
	        my($lock, $n) = @_;
    		eval q(( &void)0);
	    }' unless defined(&WITNESS_RESTORE);
	    eval 'sub WITNESS_NORELEASE {
	        my($lock) = @_;
    		eval q(( &void)0);
	    }' unless defined(&WITNESS_NORELEASE);
	    eval 'sub WITNESS_RELEASEOK {
	        my($lock) = @_;
    		eval q(( &void)0);
	    }' unless defined(&WITNESS_RELEASEOK);
	    eval 'sub WITNESS_FILE {
	        my($lock) = @_;
    		eval q((\\"?\\"));
	    }' unless defined(&WITNESS_FILE);
	    eval 'sub WITNESS_LINE {
	        my($lock) = @_;
    		eval q((0));
	    }' unless defined(&WITNESS_LINE);
	}
    }
}
1;

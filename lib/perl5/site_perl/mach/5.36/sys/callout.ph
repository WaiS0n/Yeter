require '_h2ph_pre.ph';

no warnings qw(redefine misc);

unless(defined(&_SYS_CALLOUT_H_)) {
    eval 'sub _SYS_CALLOUT_H_ () {1;}' unless defined(&_SYS_CALLOUT_H_);
    require 'sys/_callout.ph';
    eval 'sub CALLOUT_LOCAL_ALLOC () {0x1;}' unless defined(&CALLOUT_LOCAL_ALLOC);
    eval 'sub CALLOUT_ACTIVE () {0x2;}' unless defined(&CALLOUT_ACTIVE);
    eval 'sub CALLOUT_PENDING () {0x4;}' unless defined(&CALLOUT_PENDING);
    eval 'sub CALLOUT_MPSAFE () {0x8;}' unless defined(&CALLOUT_MPSAFE);
    eval 'sub CALLOUT_RETURNUNLOCKED () {0x10;}' unless defined(&CALLOUT_RETURNUNLOCKED);
    eval 'sub CALLOUT_SHAREDLOCK () {0x20;}' unless defined(&CALLOUT_SHAREDLOCK);
    eval 'sub CALLOUT_DFRMIGRATION () {0x40;}' unless defined(&CALLOUT_DFRMIGRATION);
    eval 'sub CALLOUT_PROCESSED () {0x80;}' unless defined(&CALLOUT_PROCESSED);
    eval 'sub CALLOUT_DIRECT () {0x100;}' unless defined(&CALLOUT_DIRECT);
    eval 'sub C_DIRECT_EXEC () {0x1;}' unless defined(&C_DIRECT_EXEC);
    eval 'sub C_PRELBITS () {7;}' unless defined(&C_PRELBITS);
    eval 'sub C_PRELRANGE () {((1<<  &C_PRELBITS) - 1);}' unless defined(&C_PRELRANGE);
    eval 'sub C_PREL {
        my($x) = @_;
	    eval q(((($x) + 1) << 1));
    }' unless defined(&C_PREL);
    eval 'sub C_PRELGET {
        my($x) = @_;
	    eval q((((($x) >> 1) &  &C_PRELRANGE) - 1));
    }' unless defined(&C_PRELGET);
    eval 'sub C_HARDCLOCK () {0x100;}' unless defined(&C_HARDCLOCK);
    eval 'sub C_ABSOLUTE () {0x200;}' unless defined(&C_ABSOLUTE);
    eval 'sub C_PRECALC () {0x400;}' unless defined(&C_PRECALC);
    eval 'sub C_CATCH () {0x800;}' unless defined(&C_CATCH);
    eval 'sub CS_DRAIN () {0x1;}' unless defined(&CS_DRAIN);
    if(defined(&_KERNEL)) {
	eval 'sub callout_active {
	    my($c) = @_;
    	    eval q((($c)-> &c_flags &  &CALLOUT_ACTIVE));
	}' unless defined(&callout_active);
	eval 'sub callout_deactivate {
	    my($c) = @_;
    	    eval q((($c)-> &c_flags &= ~ &CALLOUT_ACTIVE));
	}' unless defined(&callout_deactivate);
	eval 'sub callout_drain {
	    my($c) = @_;
    	    eval q( &_callout_stop_safe($c,  &CS_DRAIN,  &NULL));
	}' unless defined(&callout_drain);
	eval 'sub callout_init_mtx {
	    my($c, $mtx, $flags) = @_;
    	    eval q( &_callout_init_lock(($c), (($mtx) !=  &NULL) ? ($mtx)-> &lock_object :  &NULL, ($flags)));
	}' unless defined(&callout_init_mtx);
	eval 'sub callout_init_rm {
	    my($c, $rm, $flags) = @_;
    	    eval q( &_callout_init_lock(($c), (($rm) !=  &NULL) ? ($rm)-> &lock_object :  &NULL, ($flags)));
	}' unless defined(&callout_init_rm);
	eval 'sub callout_init_rw {
	    my($c, $rw, $flags) = @_;
    	    eval q( &_callout_init_lock(($c), (($rw) !=  &NULL) ? ($rw)-> &lock_object :  &NULL, ($flags)));
	}' unless defined(&callout_init_rw);
	eval 'sub callout_pending {
	    my($c) = @_;
    	    eval q((($c)-> &c_iflags &  &CALLOUT_PENDING));
	}' unless defined(&callout_pending);
	eval 'sub callout_reset_sbt {
	    my($c, $sbt, $pr, $fn, $arg, $flags) = @_;
    	    eval q( &callout_reset_sbt_on(($c), ($sbt), ($pr), ($fn), ($arg), -1, ($flags)));
	}' unless defined(&callout_reset_sbt);
	eval 'sub callout_reset_sbt_curcpu {
	    my($c, $sbt, $pr, $fn, $arg, $flags) = @_;
    	    eval q( &callout_reset_sbt_on(($c), ($sbt), ($pr), ($fn), ($arg),  &PCPU_GET( &cpuid), ($flags)));
	}' unless defined(&callout_reset_sbt_curcpu);
	eval 'sub callout_reset_on {
	    my($c, $to_ticks, $fn, $arg, $cpu) = @_;
    	    eval q( &callout_reset_sbt_on(($c),  &tick_sbt * ($to_ticks), 0, ($fn), ($arg), ($cpu),  &C_HARDCLOCK));
	}' unless defined(&callout_reset_on);
	eval 'sub callout_reset {
	    my($c, $on_tick, $fn, $arg) = @_;
    	    eval q( &callout_reset_on(($c), ($on_tick), ($fn), ($arg), -1));
	}' unless defined(&callout_reset);
	eval 'sub callout_reset_curcpu {
	    my($c, $on_tick, $fn, $arg) = @_;
    	    eval q( &callout_reset_on(($c), ($on_tick), ($fn), ($arg),  &PCPU_GET( &cpuid)));
	}' unless defined(&callout_reset_curcpu);
	eval 'sub callout_schedule_sbt_on {
	    my($c, $sbt, $pr, $cpu, $flags) = @_;
    	    eval q( &callout_reset_sbt_on(($c), ($sbt), ($pr), ($c)-> &c_func, ($c)-> &c_arg, ($cpu), ($flags)));
	}' unless defined(&callout_schedule_sbt_on);
	eval 'sub callout_schedule_sbt {
	    my($c, $sbt, $pr, $flags) = @_;
    	    eval q( &callout_schedule_sbt_on(($c), ($sbt), ($pr), -1, ($flags)));
	}' unless defined(&callout_schedule_sbt);
	eval 'sub callout_schedule_sbt_curcpu {
	    my($c, $sbt, $pr, $flags) = @_;
    	    eval q( &callout_schedule_sbt_on(($c), ($sbt), ($pr),  &PCPU_GET( &cpuid), ($flags)));
	}' unless defined(&callout_schedule_sbt_curcpu);
	eval 'sub callout_schedule_curcpu {
	    my($c, $on_tick) = @_;
    	    eval q( &callout_schedule_on(($c), ($on_tick),  &PCPU_GET( &cpuid)));
	}' unless defined(&callout_schedule_curcpu);
	eval 'sub callout_stop {
	    my($c) = @_;
    	    eval q( &_callout_stop_safe($c, 0,  &NULL));
	}' unless defined(&callout_stop);
	eval 'sub callout_async_drain {
	    my($c, $d) = @_;
    	    eval q( &_callout_stop_safe($c, 0, $d));
	}' unless defined(&callout_async_drain);
    }
}
1;

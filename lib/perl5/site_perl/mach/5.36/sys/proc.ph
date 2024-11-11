require '_h2ph_pre.ph';

no warnings qw(redefine misc);

unless(defined(&_SYS_PROC_H_)) {
    eval 'sub _SYS_PROC_H_ () {1;}' unless defined(&_SYS_PROC_H_);
    require 'sys/callout.ph';
    require 'sys/event.ph';
    if(defined(&_KERNEL)) {
	require 'sys/_eventhandler.ph';
    }
    require 'sys/condvar.ph';
    unless(defined(&_KERNEL)) {
	require 'sys/filedesc.ph';
    }
    require 'sys/queue.ph';
    require 'sys/_lock.ph';
    require 'sys/lock_profile.ph';
    require 'sys/_mutex.ph';
    require 'sys/osd.ph';
    require 'sys/priority.ph';
    require 'sys/rtprio.ph';
    require 'sys/runq.ph';
    require 'sys/resource.ph';
    require 'sys/sigio.ph';
    require 'sys/signal.ph';
    require 'sys/signalvar.ph';
    unless(defined(&_KERNEL)) {
	require 'sys/time.ph';
    } else {
	require 'sys/pcpu.ph';
	require 'sys/systm.ph';
    }
    require 'sys/ucontext.ph';
    require 'sys/ucred.ph';
    require 'sys/types.ph';
    require 'sys/_domainset.ph';
    require 'machine/proc.ph';
    if(defined(&_KERNEL)) {
	require 'machine/cpu.ph';
    }
    eval 'sub PGRP_ORPHANED () {0x1;}' unless defined(&PGRP_ORPHANED);
    eval 'sub td_siglist () { ($td_sigqueue->{sq_signals});}' unless defined(&td_siglist);
    eval 'sub td_startzero () { &td_flags;}' unless defined(&td_startzero);
    eval 'sub td_endzero () { &td_sigmask;}' unless defined(&td_endzero);
    eval 'sub td_startcopy () { &td_endzero;}' unless defined(&td_startcopy);
    eval 'sub td_endcopy () { &td_pcb;}' unless defined(&td_endcopy);
    eval("sub TDS_INACTIVE () { 0x0; }") unless defined(&TDS_INACTIVE);
    eval("sub TDS_INHIBITED () { 1; }") unless defined(&TDS_INHIBITED);
    eval("sub TDS_CAN_RUN () { 2; }") unless defined(&TDS_CAN_RUN);
    eval("sub TDS_RUNQ () { 3; }") unless defined(&TDS_RUNQ);
    eval("sub TDS_RUNNING () { 4; }") unless defined(&TDS_RUNNING);
    eval 'sub td_retval () { ($td_uretoff->{tdu_retval});}' unless defined(&td_retval);
    if(defined(&EPOCH_TRACE)) {
    }
    eval 'sub THREAD_LOCK_ASSERT {
        my($td, $type) = @_;
	    eval q( &mtx_assert(($td)-> &td_lock, ($type)));
    }' unless defined(&THREAD_LOCK_ASSERT);
    eval 'sub THREAD_LOCK_BLOCKED_ASSERT {
        my($td, $type) = @_;
	    eval q( &do { \'struct mtx\' * &__m = ($td)-> &td_lock;  &if ( &__m !=  &blocked_lock)  &mtx_assert( &__m, ($type)); }  &while (0));
    }' unless defined(&THREAD_LOCK_BLOCKED_ASSERT);
    if(defined(&INVARIANTS)) {
	eval 'sub THREAD_LOCKPTR_ASSERT {
	    my($td, $lock) = @_;
    	    eval q( &do { \'struct mtx\' * &__m;  &__m = ($td)-> &td_lock;  &KASSERT( &__m == ($lock), (\\"Thread %p lock %p does not match %p\\", $td,  &__m, ($lock))); }  &while (0));
	}' unless defined(&THREAD_LOCKPTR_ASSERT);
	eval 'sub THREAD_LOCKPTR_BLOCKED_ASSERT {
	    my($td, $lock) = @_;
    	    eval q( &do { \'struct mtx\' * &__m;  &__m = ($td)-> &td_lock;  &KASSERT( &__m == ($lock) ||  &__m ==  &blocked_lock, (\\"Thread %p lock %p does not match %p\\", $td,  &__m, ($lock))); }  &while (0));
	}' unless defined(&THREAD_LOCKPTR_BLOCKED_ASSERT);
	eval 'sub TD_LOCKS_INC {
	    my($td) = @_;
    	    eval q((($td)-> &td_locks++));
	}' unless defined(&TD_LOCKS_INC);
	eval 'sub TD_LOCKS_DEC {
	    my($td) = @_;
    	    eval q( &do {  &KASSERT( &SCHEDULER_STOPPED_TD($td) || ($td)-> &td_locks > 0, (\\"Thread %p owns no locks\\", ($td))); ($td)-> &td_locks--; }  &while (0));
	}' unless defined(&TD_LOCKS_DEC);
    } else {
	eval 'sub THREAD_LOCKPTR_ASSERT {
	    my($td, $lock) = @_;
    	    eval q();
	}' unless defined(&THREAD_LOCKPTR_ASSERT);
	eval 'sub THREAD_LOCKPTR_BLOCKED_ASSERT {
	    my($td, $lock) = @_;
    	    eval q();
	}' unless defined(&THREAD_LOCKPTR_BLOCKED_ASSERT);
	eval 'sub TD_LOCKS_INC {
	    my($td) = @_;
    	    eval q();
	}' unless defined(&TD_LOCKS_INC);
	eval 'sub TD_LOCKS_DEC {
	    my($td) = @_;
    	    eval q();
	}' unless defined(&TD_LOCKS_DEC);
    }
    eval 'sub TDF_BORROWING () {0x1;}' unless defined(&TDF_BORROWING);
    eval 'sub TDF_INPANIC () {0x2;}' unless defined(&TDF_INPANIC);
    eval 'sub TDF_INMEM () {0x4;}' unless defined(&TDF_INMEM);
    eval 'sub TDF_SINTR () {0x8;}' unless defined(&TDF_SINTR);
    eval 'sub TDF_TIMEOUT () {0x10;}' unless defined(&TDF_TIMEOUT);
    eval 'sub TDF_IDLETD () {0x20;}' unless defined(&TDF_IDLETD);
    eval 'sub TDF_CANSWAP () {0x40;}' unless defined(&TDF_CANSWAP);
    eval 'sub TDF_SIGWAIT () {0x80;}' unless defined(&TDF_SIGWAIT);
    eval 'sub TDF_KTH_SUSP () {0x100;}' unless defined(&TDF_KTH_SUSP);
    eval 'sub TDF_ALLPROCSUSP () {0x200;}' unless defined(&TDF_ALLPROCSUSP);
    eval 'sub TDF_BOUNDARY () {0x400;}' unless defined(&TDF_BOUNDARY);
    eval 'sub TDF_UNUSED1 () {0x800;}' unless defined(&TDF_UNUSED1);
    eval 'sub TDF_UNUSED2 () {0x1000;}' unless defined(&TDF_UNUSED2);
    eval 'sub TDF_SBDRY () {0x2000;}' unless defined(&TDF_SBDRY);
    eval 'sub TDF_UPIBLOCKED () {0x4000;}' unless defined(&TDF_UPIBLOCKED);
    eval 'sub TDF_UNUSED3 () {0x8000;}' unless defined(&TDF_UNUSED3);
    eval 'sub TDF_UNUSED4 () {0x10000;}' unless defined(&TDF_UNUSED4);
    eval 'sub TDF_UNUSED5 () {0x20000;}' unless defined(&TDF_UNUSED5);
    eval 'sub TDF_NOLOAD () {0x40000;}' unless defined(&TDF_NOLOAD);
    eval 'sub TDF_SERESTART () {0x80000;}' unless defined(&TDF_SERESTART);
    eval 'sub TDF_THRWAKEUP () {0x100000;}' unless defined(&TDF_THRWAKEUP);
    eval 'sub TDF_SEINTR () {0x200000;}' unless defined(&TDF_SEINTR);
    eval 'sub TDF_SWAPINREQ () {0x400000;}' unless defined(&TDF_SWAPINREQ);
    eval 'sub TDF_UNUSED6 () {0x800000;}' unless defined(&TDF_UNUSED6);
    eval 'sub TDF_SCHED0 () {0x1000000;}' unless defined(&TDF_SCHED0);
    eval 'sub TDF_SCHED1 () {0x2000000;}' unless defined(&TDF_SCHED1);
    eval 'sub TDF_SCHED2 () {0x4000000;}' unless defined(&TDF_SCHED2);
    eval 'sub TDF_SCHED3 () {0x8000000;}' unless defined(&TDF_SCHED3);
    eval 'sub TDF_UNUSED7 () {0x10000000;}' unless defined(&TDF_UNUSED7);
    eval 'sub TDF_UNUSED8 () {0x20000000;}' unless defined(&TDF_UNUSED8);
    eval 'sub TDF_UNUSED9 () {0x40000000;}' unless defined(&TDF_UNUSED9);
    eval 'sub TDF_UNUSED10 () {0x80000000;}' unless defined(&TDF_UNUSED10);
    eval("sub TDA_AST () { 0; }") unless defined(&TDA_AST);
    eval("sub TDA_OWEUPC () { 1; }") unless defined(&TDA_OWEUPC);
    eval("sub TDA_HWPMC () { 2; }") unless defined(&TDA_HWPMC);
    eval("sub TDA_VFORK () { 3; }") unless defined(&TDA_VFORK);
    eval("sub TDA_ALRM () { 4; }") unless defined(&TDA_ALRM);
    eval("sub TDA_PROF () { 5; }") unless defined(&TDA_PROF);
    eval("sub TDA_MAC () { 6; }") unless defined(&TDA_MAC);
    eval("sub TDA_SCHED () { 7; }") unless defined(&TDA_SCHED);
    eval("sub TDA_UFS () { 8; }") unless defined(&TDA_UFS);
    eval("sub TDA_GEOM () { 9; }") unless defined(&TDA_GEOM);
    eval("sub TDA_KQUEUE () { 10; }") unless defined(&TDA_KQUEUE);
    eval("sub TDA_RACCT () { 11; }") unless defined(&TDA_RACCT);
    eval("sub TDA_MOD1 () { 12; }") unless defined(&TDA_MOD1);
    eval("sub TAD_MOD2 () { 13; }") unless defined(&TAD_MOD2);
    eval("sub TDA_SIG () { 14; }") unless defined(&TDA_SIG);
    eval("sub TDA_KTRACE () { 15; }") unless defined(&TDA_KTRACE);
    eval("sub TDA_SUSPEND () { 16; }") unless defined(&TDA_SUSPEND);
    eval("sub TDA_SIGSUSPEND () { 17; }") unless defined(&TDA_SIGSUSPEND);
    eval("sub TDA_MOD3 () { 18; }") unless defined(&TDA_MOD3);
    eval("sub TAD_MOD4 () { 19; }") unless defined(&TAD_MOD4);
    eval("sub TDA_MAX () { 20; }") unless defined(&TDA_MAX);
    eval 'sub TDAI {
        my($tda) = @_;
	    eval q((1 << ($tda)));
    }' unless defined(&TDAI);
    eval 'sub td_ast_pending {
        my($td, $tda) = @_;
	    eval q((( ($td->{td_ast}) &  &TDAI($tda)) != 0));
    }' unless defined(&td_ast_pending);
    eval 'sub TDB_SUSPEND () {0x1;}' unless defined(&TDB_SUSPEND);
    eval 'sub TDB_XSIG () {0x2;}' unless defined(&TDB_XSIG);
    eval 'sub TDB_USERWR () {0x4;}' unless defined(&TDB_USERWR);
    eval 'sub TDB_SCE () {0x8;}' unless defined(&TDB_SCE);
    eval 'sub TDB_SCX () {0x10;}' unless defined(&TDB_SCX);
    eval 'sub TDB_EXEC () {0x20;}' unless defined(&TDB_EXEC);
    eval 'sub TDB_FORK () {0x40;}' unless defined(&TDB_FORK);
    eval 'sub TDB_STOPATFORK () {0x80;}' unless defined(&TDB_STOPATFORK);
    eval 'sub TDB_CHILD () {0x100;}' unless defined(&TDB_CHILD);
    eval 'sub TDB_BORN () {0x200;}' unless defined(&TDB_BORN);
    eval 'sub TDB_EXIT () {0x400;}' unless defined(&TDB_EXIT);
    eval 'sub TDB_VFORK () {0x800;}' unless defined(&TDB_VFORK);
    eval 'sub TDB_FSTP () {0x1000;}' unless defined(&TDB_FSTP);
    eval 'sub TDB_STEP () {0x2000;}' unless defined(&TDB_STEP);
    eval 'sub TDB_SSWITCH () {0x4000;}' unless defined(&TDB_SSWITCH);
    eval 'sub TDB_BOUNDARY () {0x8000;}' unless defined(&TDB_BOUNDARY);
    eval 'sub TDB_COREDUMPREQ () {0x10000;}' unless defined(&TDB_COREDUMPREQ);
    eval 'sub TDB_SCREMOTEREQ () {0x20000;}' unless defined(&TDB_SCREMOTEREQ);
    eval 'sub TDP_OLDMASK () {0x1;}' unless defined(&TDP_OLDMASK);
    eval 'sub TDP_INKTR () {0x2;}' unless defined(&TDP_INKTR);
    eval 'sub TDP_INKTRACE () {0x4;}' unless defined(&TDP_INKTRACE);
    eval 'sub TDP_BUFNEED () {0x8;}' unless defined(&TDP_BUFNEED);
    eval 'sub TDP_COWINPROGRESS () {0x10;}' unless defined(&TDP_COWINPROGRESS);
    eval 'sub TDP_ALTSTACK () {0x20;}' unless defined(&TDP_ALTSTACK);
    eval 'sub TDP_DEADLKTREAT () {0x40;}' unless defined(&TDP_DEADLKTREAT);
    eval 'sub TDP_NOFAULTING () {0x80;}' unless defined(&TDP_NOFAULTING);
    eval 'sub TDP_SIGFASTBLOCK () {0x100;}' unless defined(&TDP_SIGFASTBLOCK);
    eval 'sub TDP_OWEUPC () {0x200;}' unless defined(&TDP_OWEUPC);
    eval 'sub TDP_ITHREAD () {0x400;}' unless defined(&TDP_ITHREAD);
    eval 'sub TDP_SYNCIO () {0x800;}' unless defined(&TDP_SYNCIO);
    eval 'sub TDP_SCHED1 () {0x1000;}' unless defined(&TDP_SCHED1);
    eval 'sub TDP_SCHED2 () {0x2000;}' unless defined(&TDP_SCHED2);
    eval 'sub TDP_SCHED3 () {0x4000;}' unless defined(&TDP_SCHED3);
    eval 'sub TDP_SCHED4 () {0x8000;}' unless defined(&TDP_SCHED4);
    eval 'sub TDP_GEOM () {0x10000;}' unless defined(&TDP_GEOM);
    eval 'sub TDP_SOFTDEP () {0x20000;}' unless defined(&TDP_SOFTDEP);
    eval 'sub TDP_NORUNNINGBUF () {0x40000;}' unless defined(&TDP_NORUNNINGBUF);
    eval 'sub TDP_WAKEUP () {0x80000;}' unless defined(&TDP_WAKEUP);
    eval 'sub TDP_INBDFLUSH () {0x100000;}' unless defined(&TDP_INBDFLUSH);
    eval 'sub TDP_KTHREAD () {0x200000;}' unless defined(&TDP_KTHREAD);
    eval 'sub TDP_CALLCHAIN () {0x400000;}' unless defined(&TDP_CALLCHAIN);
    eval 'sub TDP_IGNSUSP () {0x800000;}' unless defined(&TDP_IGNSUSP);
    eval 'sub TDP_AUDITREC () {0x1000000;}' unless defined(&TDP_AUDITREC);
    eval 'sub TDP_RFPPWAIT () {0x2000000;}' unless defined(&TDP_RFPPWAIT);
    eval 'sub TDP_RESETSPUR () {0x4000000;}' unless defined(&TDP_RESETSPUR);
    eval 'sub TDP_NERRNO () {0x8000000;}' unless defined(&TDP_NERRNO);
    eval 'sub TDP_UIOHELD () {0x10000000;}' unless defined(&TDP_UIOHELD);
    eval 'sub TDP_INTCPCALLOUT () {0x20000000;}' unless defined(&TDP_INTCPCALLOUT);
    eval 'sub TDP_EXECVMSPC () {0x40000000;}' unless defined(&TDP_EXECVMSPC);
    eval 'sub TDP_SIGFASTPENDING () {0x80000000;}' unless defined(&TDP_SIGFASTPENDING);
    eval 'sub TDP2_SBPAGES () {0x1;}' unless defined(&TDP2_SBPAGES);
    eval 'sub TDP2_COMPAT32RB () {0x2;}' unless defined(&TDP2_COMPAT32RB);
    eval 'sub TDP2_ACCT () {0x4;}' unless defined(&TDP2_ACCT);
    eval 'sub TDI_SUSPENDED () {0x1;}' unless defined(&TDI_SUSPENDED);
    eval 'sub TDI_SLEEPING () {0x2;}' unless defined(&TDI_SLEEPING);
    eval 'sub TDI_SWAPPED () {0x4;}' unless defined(&TDI_SWAPPED);
    eval 'sub TDI_LOCK () {0x8;}' unless defined(&TDI_LOCK);
    eval 'sub TDI_IWAIT () {0x10;}' unless defined(&TDI_IWAIT);
    eval 'sub TD_IS_SLEEPING {
        my($td) = @_;
	    eval q((($td)-> &td_inhibitors &  &TDI_SLEEPING));
    }' unless defined(&TD_IS_SLEEPING);
    eval 'sub TD_ON_SLEEPQ {
        my($td) = @_;
	    eval q((($td)-> &td_wchan !=  &NULL));
    }' unless defined(&TD_ON_SLEEPQ);
    eval 'sub TD_IS_SUSPENDED {
        my($td) = @_;
	    eval q((($td)-> &td_inhibitors &  &TDI_SUSPENDED));
    }' unless defined(&TD_IS_SUSPENDED);
    eval 'sub TD_IS_SWAPPED {
        my($td) = @_;
	    eval q((($td)-> &td_inhibitors &  &TDI_SWAPPED));
    }' unless defined(&TD_IS_SWAPPED);
    eval 'sub TD_ON_LOCK {
        my($td) = @_;
	    eval q((($td)-> &td_inhibitors &  &TDI_LOCK));
    }' unless defined(&TD_ON_LOCK);
    eval 'sub TD_AWAITING_INTR {
        my($td) = @_;
	    eval q((($td)-> &td_inhibitors &  &TDI_IWAIT));
    }' unless defined(&TD_AWAITING_INTR);
    if(defined(&_KERNEL)) {
	eval 'sub TD_GET_STATE {
	    my($td) = @_;
    	    eval q( &atomic_load_int(($td)-> &td_state));
	}' unless defined(&TD_GET_STATE);
    } else {
	eval 'sub TD_GET_STATE {
	    my($td) = @_;
    	    eval q((($td)-> &td_state));
	}' unless defined(&TD_GET_STATE);
    }
    eval 'sub TD_IS_RUNNING {
        my($td) = @_;
	    eval q(( &TD_GET_STATE($td) ==  &TDS_RUNNING));
    }' unless defined(&TD_IS_RUNNING);
    eval 'sub TD_ON_RUNQ {
        my($td) = @_;
	    eval q(( &TD_GET_STATE($td) ==  &TDS_RUNQ));
    }' unless defined(&TD_ON_RUNQ);
    eval 'sub TD_CAN_RUN {
        my($td) = @_;
	    eval q(( &TD_GET_STATE($td) ==  &TDS_CAN_RUN));
    }' unless defined(&TD_CAN_RUN);
    eval 'sub TD_IS_INHIBITED {
        my($td) = @_;
	    eval q(( &TD_GET_STATE($td) ==  &TDS_INHIBITED));
    }' unless defined(&TD_IS_INHIBITED);
    eval 'sub TD_ON_UPILOCK {
        my($td) = @_;
	    eval q((($td)-> &td_flags &  &TDF_UPIBLOCKED));
    }' unless defined(&TD_ON_UPILOCK);
    eval 'sub TD_IS_IDLETHREAD {
        my($td) = @_;
	    eval q((($td)-> &td_flags &  &TDF_IDLETD));
    }' unless defined(&TD_IS_IDLETHREAD);
    eval 'sub TD_CAN_ABORT {
        my($td) = @_;
	    eval q(( &TD_ON_SLEEPQ(($td))  && (($td)-> &td_flags &  &TDF_SINTR) != 0));
    }' unless defined(&TD_CAN_ABORT);
    eval 'sub KTDSTATE {
        my($td) = @_;
	    eval q(((($td)-> &td_inhibitors &  &TDI_SLEEPING) != 0? \\"sleep\\" : (($td)-> &td_inhibitors &  &TDI_SUSPENDED) != 0? \\"suspended\\" : (($td)-> &td_inhibitors &  &TDI_SWAPPED) != 0? \\"swapped\\" : (($td)-> &td_inhibitors &  &TDI_LOCK) != 0? \\"blocked\\" : (($td)-> &td_inhibitors &  &TDI_IWAIT) != 0? \\"iwait\\" : \\"yielding\\"));
    }' unless defined(&KTDSTATE);
    eval 'sub TD_SET_INHIB {
        my($td, $inhib) = @_;
	    eval q( &do {  &TD_SET_STATE($td,  &TDS_INHIBITED); ($td)-> &td_inhibitors |= ($inhib); }  &while (0));
    }' unless defined(&TD_SET_INHIB);
    eval 'sub TD_CLR_INHIB {
        my($td, $inhib) = @_;
	    eval q( &do {  &if ((($td)-> &td_inhibitors & ($inhib))  && ((($td)-> &td_inhibitors &= ~($inhib)) == 0))  &TD_SET_STATE($td,  &TDS_CAN_RUN); }  &while (0));
    }' unless defined(&TD_CLR_INHIB);
    eval 'sub TD_SET_SLEEPING {
        my($td) = @_;
	    eval q( &TD_SET_INHIB(($td),  &TDI_SLEEPING));
    }' unless defined(&TD_SET_SLEEPING);
    eval 'sub TD_SET_SWAPPED {
        my($td) = @_;
	    eval q( &TD_SET_INHIB(($td),  &TDI_SWAPPED));
    }' unless defined(&TD_SET_SWAPPED);
    eval 'sub TD_SET_LOCK {
        my($td) = @_;
	    eval q( &TD_SET_INHIB(($td),  &TDI_LOCK));
    }' unless defined(&TD_SET_LOCK);
    eval 'sub TD_SET_SUSPENDED {
        my($td) = @_;
	    eval q( &TD_SET_INHIB(($td),  &TDI_SUSPENDED));
    }' unless defined(&TD_SET_SUSPENDED);
    eval 'sub TD_SET_IWAIT {
        my($td) = @_;
	    eval q( &TD_SET_INHIB(($td),  &TDI_IWAIT));
    }' unless defined(&TD_SET_IWAIT);
    eval 'sub TD_SET_EXITING {
        my($td) = @_;
	    eval q( &TD_SET_INHIB(($td),  &TDI_EXITING));
    }' unless defined(&TD_SET_EXITING);
    eval 'sub TD_CLR_SLEEPING {
        my($td) = @_;
	    eval q( &TD_CLR_INHIB(($td),  &TDI_SLEEPING));
    }' unless defined(&TD_CLR_SLEEPING);
    eval 'sub TD_CLR_SWAPPED {
        my($td) = @_;
	    eval q( &TD_CLR_INHIB(($td),  &TDI_SWAPPED));
    }' unless defined(&TD_CLR_SWAPPED);
    eval 'sub TD_CLR_LOCK {
        my($td) = @_;
	    eval q( &TD_CLR_INHIB(($td),  &TDI_LOCK));
    }' unless defined(&TD_CLR_LOCK);
    eval 'sub TD_CLR_SUSPENDED {
        my($td) = @_;
	    eval q( &TD_CLR_INHIB(($td),  &TDI_SUSPENDED));
    }' unless defined(&TD_CLR_SUSPENDED);
    eval 'sub TD_CLR_IWAIT {
        my($td) = @_;
	    eval q( &TD_CLR_INHIB(($td),  &TDI_IWAIT));
    }' unless defined(&TD_CLR_IWAIT);
    if(defined(&_KERNEL)) {
	eval 'sub TD_SET_STATE {
	    my($td, $state) = @_;
    	    eval q( &atomic_store_int(($td)-> &td_state, $state));
	}' unless defined(&TD_SET_STATE);
    } else {
	eval 'sub TD_SET_STATE {
	    my($td, $state) = @_;
    	    eval q(($td)-> &td_state = $state);
	}' unless defined(&TD_SET_STATE);
    }
    eval 'sub TD_SET_RUNNING {
        my($td) = @_;
	    eval q( &TD_SET_STATE($td,  &TDS_RUNNING));
    }' unless defined(&TD_SET_RUNNING);
    eval 'sub TD_SET_RUNQ {
        my($td) = @_;
	    eval q( &TD_SET_STATE($td,  &TDS_RUNQ));
    }' unless defined(&TD_SET_RUNQ);
    eval 'sub TD_SET_CAN_RUN {
        my($td) = @_;
	    eval q( &TD_SET_STATE($td,  &TDS_CAN_RUN));
    }' unless defined(&TD_SET_CAN_RUN);
    eval 'sub TD_SBDRY_INTR {
        my($td) = @_;
	    eval q(((($td)-> &td_flags & ( &TDF_SEINTR |  &TDF_SERESTART)) != 0));
    }' unless defined(&TD_SBDRY_INTR);
    eval 'sub TD_SBDRY_ERRNO {
        my($td) = @_;
	    eval q(((($td)-> &td_flags &  &TDF_SEINTR) != 0?  &EINTR :  &ERESTART));
    }' unless defined(&TD_SBDRY_ERRNO);
    eval("sub PRS_NEW () { 0; }") unless defined(&PRS_NEW);
    eval("sub PRS_NORMAL () { 1; }") unless defined(&PRS_NORMAL);
    eval("sub PRS_ZOMBIE () { 2; }") unless defined(&PRS_ZOMBIE);
    eval 'sub p_siglist () { ($p_sigqueue->{sq_signals});}' unless defined(&p_siglist);
    eval 'sub p_startzero () { &p_vmspace;}' unless defined(&p_startzero);
    eval 'sub p_endzero () { &p_magic;}' unless defined(&p_endzero);
    eval 'sub p_startcopy () { &p_endzero;}' unless defined(&p_startcopy);
    eval 'sub p_endcopy () { &p_xexit;}' unless defined(&p_endcopy);
    eval 'sub p_session () { ($p_pgrp->{pg_session});}' unless defined(&p_session);
    eval 'sub p_pgid () { ($p_pgrp->{pg_id});}' unless defined(&p_pgid);
    eval 'sub NOCPU () {(-1);}' unless defined(&NOCPU);
    eval 'sub NOCPU_OLD () {(255);}' unless defined(&NOCPU_OLD);
    eval 'sub MAXCPU_OLD () {(254);}' unless defined(&MAXCPU_OLD);
    eval 'sub PROC_SLOCK {
        my($p) = @_;
	    eval q( &mtx_lock_spin(($p)-> &p_slock));
    }' unless defined(&PROC_SLOCK);
    eval 'sub PROC_SUNLOCK {
        my($p) = @_;
	    eval q( &mtx_unlock_spin(($p)-> &p_slock));
    }' unless defined(&PROC_SUNLOCK);
    eval 'sub PROC_SLOCK_ASSERT {
        my($p, $type) = @_;
	    eval q( &mtx_assert(($p)-> &p_slock, ($type)));
    }' unless defined(&PROC_SLOCK_ASSERT);
    eval 'sub PROC_STATLOCK {
        my($p) = @_;
	    eval q( &mtx_lock_spin(($p)-> &p_statmtx));
    }' unless defined(&PROC_STATLOCK);
    eval 'sub PROC_STATUNLOCK {
        my($p) = @_;
	    eval q( &mtx_unlock_spin(($p)-> &p_statmtx));
    }' unless defined(&PROC_STATUNLOCK);
    eval 'sub PROC_STATLOCK_ASSERT {
        my($p, $type) = @_;
	    eval q( &mtx_assert(($p)-> &p_statmtx, ($type)));
    }' unless defined(&PROC_STATLOCK_ASSERT);
    eval 'sub PROC_ITIMLOCK {
        my($p) = @_;
	    eval q( &mtx_lock_spin(($p)-> &p_itimmtx));
    }' unless defined(&PROC_ITIMLOCK);
    eval 'sub PROC_ITIMUNLOCK {
        my($p) = @_;
	    eval q( &mtx_unlock_spin(($p)-> &p_itimmtx));
    }' unless defined(&PROC_ITIMUNLOCK);
    eval 'sub PROC_ITIMLOCK_ASSERT {
        my($p, $type) = @_;
	    eval q( &mtx_assert(($p)-> &p_itimmtx, ($type)));
    }' unless defined(&PROC_ITIMLOCK_ASSERT);
    eval 'sub PROC_PROFLOCK {
        my($p) = @_;
	    eval q( &mtx_lock_spin(($p)-> &p_profmtx));
    }' unless defined(&PROC_PROFLOCK);
    eval 'sub PROC_PROFUNLOCK {
        my($p) = @_;
	    eval q( &mtx_unlock_spin(($p)-> &p_profmtx));
    }' unless defined(&PROC_PROFUNLOCK);
    eval 'sub PROC_PROFLOCK_ASSERT {
        my($p, $type) = @_;
	    eval q( &mtx_assert(($p)-> &p_profmtx, ($type)));
    }' unless defined(&PROC_PROFLOCK_ASSERT);
    eval 'sub P_ADVLOCK () {0x1;}' unless defined(&P_ADVLOCK);
    eval 'sub P_CONTROLT () {0x2;}' unless defined(&P_CONTROLT);
    eval 'sub P_KPROC () {0x4;}' unless defined(&P_KPROC);
    eval 'sub P_UNUSED3 () {0x8;}' unless defined(&P_UNUSED3);
    eval 'sub P_PPWAIT () {0x10;}' unless defined(&P_PPWAIT);
    eval 'sub P_PROFIL () {0x20;}' unless defined(&P_PROFIL);
    eval 'sub P_STOPPROF () {0x40;}' unless defined(&P_STOPPROF);
    eval 'sub P_HADTHREADS () {0x80;}' unless defined(&P_HADTHREADS);
    eval 'sub P_SUGID () {0x100;}' unless defined(&P_SUGID);
    eval 'sub P_SYSTEM () {0x200;}' unless defined(&P_SYSTEM);
    eval 'sub P_SINGLE_EXIT () {0x400;}' unless defined(&P_SINGLE_EXIT);
    eval 'sub P_TRACED () {0x800;}' unless defined(&P_TRACED);
    eval 'sub P_WAITED () {0x1000;}' unless defined(&P_WAITED);
    eval 'sub P_WEXIT () {0x2000;}' unless defined(&P_WEXIT);
    eval 'sub P_EXEC () {0x4000;}' unless defined(&P_EXEC);
    eval 'sub P_WKILLED () {0x8000;}' unless defined(&P_WKILLED);
    eval 'sub P_CONTINUED () {0x10000;}' unless defined(&P_CONTINUED);
    eval 'sub P_STOPPED_SIG () {0x20000;}' unless defined(&P_STOPPED_SIG);
    eval 'sub P_STOPPED_TRACE () {0x40000;}' unless defined(&P_STOPPED_TRACE);
    eval 'sub P_STOPPED_SINGLE () {0x80000;}' unless defined(&P_STOPPED_SINGLE);
    eval 'sub P_PROTECTED () {0x100000;}' unless defined(&P_PROTECTED);
    eval 'sub P_SIGEVENT () {0x200000;}' unless defined(&P_SIGEVENT);
    eval 'sub P_SINGLE_BOUNDARY () {0x400000;}' unless defined(&P_SINGLE_BOUNDARY);
    eval 'sub P_HWPMC () {0x800000;}' unless defined(&P_HWPMC);
    eval 'sub P_JAILED () {0x1000000;}' unless defined(&P_JAILED);
    eval 'sub P_TOTAL_STOP () {0x2000000;}' unless defined(&P_TOTAL_STOP);
    eval 'sub P_INEXEC () {0x4000000;}' unless defined(&P_INEXEC);
    eval 'sub P_STATCHILD () {0x8000000;}' unless defined(&P_STATCHILD);
    eval 'sub P_INMEM () {0x10000000;}' unless defined(&P_INMEM);
    eval 'sub P_SWAPPINGOUT () {0x20000000;}' unless defined(&P_SWAPPINGOUT);
    eval 'sub P_SWAPPINGIN () {0x40000000;}' unless defined(&P_SWAPPINGIN);
    eval 'sub P_PPTRACE () {0x80000000;}' unless defined(&P_PPTRACE);
    eval 'sub P_STOPPED () {( &P_STOPPED_SIG| &P_STOPPED_SINGLE| &P_STOPPED_TRACE);}' unless defined(&P_STOPPED);
    eval 'sub P_SHOULDSTOP {
        my($p) = @_;
	    eval q((($p)-> &p_flag &  &P_STOPPED));
    }' unless defined(&P_SHOULDSTOP);
    eval 'sub P_KILLED {
        my($p) = @_;
	    eval q((($p)-> &p_flag &  &P_WKILLED));
    }' unless defined(&P_KILLED);
    eval 'sub P2_INHERIT_PROTECTED () {0x1;}' unless defined(&P2_INHERIT_PROTECTED);
    eval 'sub P2_NOTRACE () {0x2;}' unless defined(&P2_NOTRACE);
    eval 'sub P2_NOTRACE_EXEC () {0x4;}' unless defined(&P2_NOTRACE_EXEC);
    eval 'sub P2_AST_SU () {0x8;}' unless defined(&P2_AST_SU);
    eval 'sub P2_PTRACE_FSTP () {0x10;}' unless defined(&P2_PTRACE_FSTP);
    eval 'sub P2_TRAPCAP () {0x20;}' unless defined(&P2_TRAPCAP);
    eval 'sub P2_ASLR_ENABLE () {0x40;}' unless defined(&P2_ASLR_ENABLE);
    eval 'sub P2_ASLR_DISABLE () {0x80;}' unless defined(&P2_ASLR_DISABLE);
    eval 'sub P2_ASLR_IGNSTART () {0x100;}' unless defined(&P2_ASLR_IGNSTART);
    eval 'sub P2_PROTMAX_ENABLE () {0x200;}' unless defined(&P2_PROTMAX_ENABLE);
    eval 'sub P2_PROTMAX_DISABLE () {0x400;}' unless defined(&P2_PROTMAX_DISABLE);
    eval 'sub P2_STKGAP_DISABLE () {0x800;}' unless defined(&P2_STKGAP_DISABLE);
    eval 'sub P2_STKGAP_DISABLE_EXEC () {0x1000;}' unless defined(&P2_STKGAP_DISABLE_EXEC);
    eval 'sub P2_ITSTOPPED () {0x2000;}' unless defined(&P2_ITSTOPPED);
    eval 'sub P2_PTRACEREQ () {0x4000;}' unless defined(&P2_PTRACEREQ);
    eval 'sub P2_NO_NEW_PRIVS () {0x8000;}' unless defined(&P2_NO_NEW_PRIVS);
    eval 'sub P2_WXORX_DISABLE () {0x10000;}' unless defined(&P2_WXORX_DISABLE);
    eval 'sub P2_WXORX_ENABLE_EXEC () {0x20000;}' unless defined(&P2_WXORX_ENABLE_EXEC);
    eval 'sub P2_WEXIT () {0x40000;}' unless defined(&P2_WEXIT);
    eval 'sub P2_REAPKILLED () {0x80000;}' unless defined(&P2_REAPKILLED);
    eval 'sub P2_MEMBAR_PRIVE () {0x100000;}' unless defined(&P2_MEMBAR_PRIVE);
    eval 'sub P2_MEMBAR_PRIVE_SYNCORE () {0x200000;}' unless defined(&P2_MEMBAR_PRIVE_SYNCORE);
    eval 'sub P2_MEMBAR_GLOBE () {0x400000;}' unless defined(&P2_MEMBAR_GLOBE);
    eval 'sub P_TREE_ORPHANED () {0x1;}' unless defined(&P_TREE_ORPHANED);
    eval 'sub P_TREE_FIRST_ORPHAN () {0x2;}' unless defined(&P_TREE_FIRST_ORPHAN);
    eval 'sub P_TREE_REAPER () {0x4;}' unless defined(&P_TREE_REAPER);
    eval 'sub P_TREE_GRPEXITED () {0x8;}' unless defined(&P_TREE_GRPEXITED);
    eval 'sub SIDL () {1;}' unless defined(&SIDL);
    eval 'sub SRUN () {2;}' unless defined(&SRUN);
    eval 'sub SSLEEP () {3;}' unless defined(&SSLEEP);
    eval 'sub SSTOP () {4;}' unless defined(&SSTOP);
    eval 'sub SZOMB () {5;}' unless defined(&SZOMB);
    eval 'sub SWAIT () {6;}' unless defined(&SWAIT);
    eval 'sub SLOCK () {7;}' unless defined(&SLOCK);
    eval 'sub P_MAGIC () {0xbeefface;}' unless defined(&P_MAGIC);
    if(defined(&_KERNEL)) {
	eval 'sub SW_TYPE_MASK () {0xff;}' unless defined(&SW_TYPE_MASK);
	eval 'sub SWT_OWEPREEMPT () {1;}' unless defined(&SWT_OWEPREEMPT);
	eval 'sub SWT_TURNSTILE () {2;}' unless defined(&SWT_TURNSTILE);
	eval 'sub SWT_SLEEPQ () {3;}' unless defined(&SWT_SLEEPQ);
	eval 'sub SWT_RELINQUISH () {4;}' unless defined(&SWT_RELINQUISH);
	eval 'sub SWT_NEEDRESCHED () {5;}' unless defined(&SWT_NEEDRESCHED);
	eval 'sub SWT_IDLE () {6;}' unless defined(&SWT_IDLE);
	eval 'sub SWT_IWAIT () {7;}' unless defined(&SWT_IWAIT);
	eval 'sub SWT_SUSPEND () {8;}' unless defined(&SWT_SUSPEND);
	eval 'sub SWT_REMOTEPREEMPT () {9;}' unless defined(&SWT_REMOTEPREEMPT);
	eval 'sub SWT_REMOTEWAKEIDLE () {10;}' unless defined(&SWT_REMOTEWAKEIDLE);
	eval 'sub SWT_BIND () {11;}' unless defined(&SWT_BIND);
	eval 'sub SWT_COUNT () {12;}' unless defined(&SWT_COUNT);
	eval 'sub SW_VOL () {0x100;}' unless defined(&SW_VOL);
	eval 'sub SW_INVOL () {0x200;}' unless defined(&SW_INVOL);
	eval 'sub SW_PREEMPT () {0x400;}' unless defined(&SW_PREEMPT);
	eval 'sub SINGLE_NO_EXIT () {0;}' unless defined(&SINGLE_NO_EXIT);
	eval 'sub SINGLE_EXIT () {1;}' unless defined(&SINGLE_EXIT);
	eval 'sub SINGLE_BOUNDARY () {2;}' unless defined(&SINGLE_BOUNDARY);
	eval 'sub SINGLE_ALLPROC () {3;}' unless defined(&SINGLE_ALLPROC);
	if(defined(&MALLOC_DECLARE)) {
	}
	eval 'sub FOREACH_PROC_IN_SYSTEM {
	    my($p) = @_;
    	    eval q( &LIST_FOREACH(($p),  &allproc,  &p_list));
	}' unless defined(&FOREACH_PROC_IN_SYSTEM);
	eval 'sub FOREACH_THREAD_IN_PROC {
	    my($p, $td) = @_;
    	    eval q( &TAILQ_FOREACH(($td), ($p)-> &p_threads,  &td_plist));
	}' unless defined(&FOREACH_THREAD_IN_PROC);
	eval 'sub FIRST_THREAD_IN_PROC {
	    my($p) = @_;
    	    eval q( &TAILQ_FIRST(($p)-> &p_threads));
	}' unless defined(&FIRST_THREAD_IN_PROC);
	eval 'sub PID_MAX () {99999;}' unless defined(&PID_MAX);
	eval 'sub NO_PID () {100000;}' unless defined(&NO_PID);
	eval 'sub THREAD0_TID () { &NO_PID;}' unless defined(&THREAD0_TID);
	eval 'sub SESS_LEADER {
	    my($p) = @_;
    	    eval q((($p)-> ($p_session->{s_leader}) == ($p)));
	}' unless defined(&SESS_LEADER);
	eval 'sub PROC_LOCK {
	    my($p) = @_;
    	    eval q( &mtx_lock(($p)-> &p_mtx));
	}' unless defined(&PROC_LOCK);
	eval 'sub PROC_TRYLOCK {
	    my($p) = @_;
    	    eval q( &mtx_trylock(($p)-> &p_mtx));
	}' unless defined(&PROC_TRYLOCK);
	eval 'sub PROC_UNLOCK {
	    my($p) = @_;
    	    eval q( &mtx_unlock(($p)-> &p_mtx));
	}' unless defined(&PROC_UNLOCK);
	eval 'sub PROC_LOCKED {
	    my($p) = @_;
    	    eval q( &mtx_owned(($p)-> &p_mtx));
	}' unless defined(&PROC_LOCKED);
	eval 'sub PROC_WAIT_UNLOCKED {
	    my($p) = @_;
    	    eval q( &mtx_wait_unlocked(($p)-> &p_mtx));
	}' unless defined(&PROC_WAIT_UNLOCKED);
	eval 'sub PROC_LOCK_ASSERT {
	    my($p, $type) = @_;
    	    eval q( &mtx_assert(($p)-> &p_mtx, ($type)));
	}' unless defined(&PROC_LOCK_ASSERT);
	eval 'sub PGRP_LOCK {
	    my($pg) = @_;
    	    eval q( &mtx_lock(($pg)-> &pg_mtx));
	}' unless defined(&PGRP_LOCK);
	eval 'sub PGRP_UNLOCK {
	    my($pg) = @_;
    	    eval q( &mtx_unlock(($pg)-> &pg_mtx));
	}' unless defined(&PGRP_UNLOCK);
	eval 'sub PGRP_LOCKED {
	    my($pg) = @_;
    	    eval q( &mtx_owned(($pg)-> &pg_mtx));
	}' unless defined(&PGRP_LOCKED);
	eval 'sub PGRP_LOCK_ASSERT {
	    my($pg, $type) = @_;
    	    eval q( &mtx_assert(($pg)-> &pg_mtx, ($type)));
	}' unless defined(&PGRP_LOCK_ASSERT);
	eval 'sub PGRP_LOCK_PGSIGNAL {
	    my($pg) = @_;
    	    eval q( &do {  &if (($pg) !=  &NULL)  &PGRP_LOCK($pg); }  &while (0));
	}' unless defined(&PGRP_LOCK_PGSIGNAL);
	eval 'sub PGRP_UNLOCK_PGSIGNAL {
	    my($pg) = @_;
    	    eval q( &do {  &if (($pg) !=  &NULL)  &PGRP_UNLOCK($pg); }  &while (0));
	}' unless defined(&PGRP_UNLOCK_PGSIGNAL);
	eval 'sub SESS_LOCK {
	    my($s) = @_;
    	    eval q( &mtx_lock(($s)-> &s_mtx));
	}' unless defined(&SESS_LOCK);
	eval 'sub SESS_UNLOCK {
	    my($s) = @_;
    	    eval q( &mtx_unlock(($s)-> &s_mtx));
	}' unless defined(&SESS_UNLOCK);
	eval 'sub SESS_LOCKED {
	    my($s) = @_;
    	    eval q( &mtx_owned(($s)-> &s_mtx));
	}' unless defined(&SESS_LOCKED);
	eval 'sub SESS_LOCK_ASSERT {
	    my($s, $type) = @_;
    	    eval q( &mtx_assert(($s)-> &s_mtx, ($type)));
	}' unless defined(&SESS_LOCK_ASSERT);
	eval 'sub PHOLD {
	    my($p) = @_;
    	    eval q( &do {  &PROC_LOCK($p);  &_PHOLD($p);  &PROC_UNLOCK($p); }  &while (0));
	}' unless defined(&PHOLD);
	eval 'sub _PHOLD {
	    my($p) = @_;
    	    eval q( &do {  &PROC_LOCK_ASSERT(($p),  &MA_OWNED);  &KASSERT(!(($p)-> &p_flag &  &P_WEXIT) || ($p) ==  &curproc, (\\"PHOLD of exiting process %p\\", $p)); ($p)-> &p_lock++;  &if ((($p)-> &p_flag &  &P_INMEM) == 0)  &faultin(($p)); }  &while (0));
	}' unless defined(&_PHOLD);
	eval 'sub _PHOLD_LITE {
	    my($p) = @_;
    	    eval q( &do {  &PROC_LOCK_ASSERT(($p),  &MA_OWNED);  &KASSERT(!(($p)-> &p_flag &  &P_WEXIT) || ($p) ==  &curproc, (\\"PHOLD of exiting process %p\\", $p)); ($p)-> &p_lock++; }  &while (0));
	}' unless defined(&_PHOLD_LITE);
	eval 'sub PROC_ASSERT_HELD {
	    my($p) = @_;
    	    eval q( &do {  &KASSERT(($p)-> &p_lock > 0, (\\"process %p not held\\", $p)); }  &while (0));
	}' unless defined(&PROC_ASSERT_HELD);
	eval 'sub PRELE {
	    my($p) = @_;
    	    eval q( &do {  &PROC_LOCK(($p));  &_PRELE(($p));  &PROC_UNLOCK(($p)); }  &while (0));
	}' unless defined(&PRELE);
	eval 'sub _PRELE {
	    my($p) = @_;
    	    eval q( &do {  &PROC_LOCK_ASSERT(($p),  &MA_OWNED);  &PROC_ASSERT_HELD($p); (--($p)-> &p_lock);  &if ((($p)-> &p_flag &  &P_WEXIT)  && ($p)-> &p_lock == 0)  &wakeup(($p)-> &p_lock); }  &while (0));
	}' unless defined(&_PRELE);
	eval 'sub PROC_ASSERT_NOT_HELD {
	    my($p) = @_;
    	    eval q( &do {  &KASSERT(($p)-> &p_lock == 0, (\\"process %p held\\", $p)); }  &while (0));
	}' unless defined(&PROC_ASSERT_NOT_HELD);
	eval 'sub PROC_UPDATE_COW {
	    my($p) = @_;
    	    eval q( &do { \'struct proc\' * &_p = ($p);  &PROC_LOCK_ASSERT(( &_p),  &MA_OWNED);  &atomic_store_int(& ($_$p->{p_cowgen}),  ($_$p->{p_cowgen}) + 1); }  &while (0));
	}' unless defined(&PROC_UPDATE_COW);
	eval 'sub PROC_COW_CHANGECOUNT {
	    my($td, $p) = @_;
    	    eval q(({ \'struct thread\' * &_td = ($td); \'struct proc\' * &_p = ($p);  &MPASS( &_td ==  &curthread);  &PROC_LOCK_ASSERT( &_p,  &MA_OWNED);  ($_$p->{p_cowgen}) -  ($_$td->{td_cowgen}); }));
	}' unless defined(&PROC_COW_CHANGECOUNT);
	eval 'sub thread_safetoswapout {
	    my($td) = @_;
    	    eval q((($td)-> &td_flags &  &TDF_CANSWAP));
	}' unless defined(&thread_safetoswapout);
	eval 'sub THREAD_NO_SLEEPING () {
	    eval q( &do {  ($curthread->{td_no_sleeping})++;  &MPASS( ($curthread->{td_no_sleeping}) > 0); }  &while (0));
	}' unless defined(&THREAD_NO_SLEEPING);
	eval 'sub THREAD_SLEEPING_OK () {
	    eval q( &do {  &MPASS( ($curthread->{td_no_sleeping}) > 0);  ($curthread->{td_no_sleeping})--; }  &while (0));
	}' unless defined(&THREAD_SLEEPING_OK);
	eval 'sub THREAD_CAN_SLEEP () {
	    eval q((( &curthread)-> &td_no_sleeping == 0));
	}' unless defined(&THREAD_CAN_SLEEP);
	eval 'sub PIDHASH {
	    my($pid) = @_;
    	    eval q(( $pidhashtbl[($pid) &  &pidhash]));
	}' unless defined(&PIDHASH);
	eval 'sub PIDHASHLOCK {
	    my($pid) = @_;
    	    eval q(( $pidhashtbl_lock[(($pid) &  &pidhashlock)]));
	}' unless defined(&PIDHASHLOCK);
	eval 'sub PGRPHASH {
	    my($pgid) = @_;
    	    eval q(( $pgrphashtbl[($pgid) &  &pgrphash]));
	}' unless defined(&PGRPHASH);
	eval 'sub thread0 () {( ($thread0_st->{t0st_thread}));}' unless defined(&thread0);
	eval 'sub FR2_DROPSIG_CAUGHT () {0x1;}' unless defined(&FR2_DROPSIG_CAUGHT);
	eval 'sub FR2_SHARE_PATHS () {0x2;}' unless defined(&FR2_SHARE_PATHS);
	eval 'sub FR2_KPROC () {0x4;}' unless defined(&FR2_KPROC);
	eval 'sub PGET_HOLD () {0x1;}' unless defined(&PGET_HOLD);
	eval 'sub PGET_CANSEE () {0x2;}' unless defined(&PGET_CANSEE);
	eval 'sub PGET_CANDEBUG () {0x4;}' unless defined(&PGET_CANDEBUG);
	eval 'sub PGET_ISCURRENT () {0x8;}' unless defined(&PGET_ISCURRENT);
	eval 'sub PGET_NOTWEXIT () {0x10;}' unless defined(&PGET_NOTWEXIT);
	eval 'sub PGET_NOTINEXEC () {0x20;}' unless defined(&PGET_NOTINEXEC);
	eval 'sub PGET_NOTID () {0x40;}' unless defined(&PGET_NOTID);
	eval 'sub PGET_WANTREAD () {( &PGET_HOLD |  &PGET_CANDEBUG |  &PGET_NOTWEXIT);}' unless defined(&PGET_WANTREAD);
	eval 'sub ASTR_ASTF_REQUIRED () {0x1;}' unless defined(&ASTR_ASTF_REQUIRED);
	eval 'sub ASTR_TDP () {0x2;}' unless defined(&ASTR_TDP);
	eval 'sub ASTR_KCLEAR () {0x4;}' unless defined(&ASTR_KCLEAR);
	eval 'sub ASTR_UNCOND () {0x8;}' unless defined(&ASTR_UNCOND);
	eval 'sub curthread_pflags_set {
	    my($flags) = @_;
    	    eval q({ \'struct thread\' * &td; \'int\'  &save;  &td =  &curthread;  &save = ~$flags | ( ($td->{td_pflags}) & $flags);  ($td->{td_pflags}) |= $flags; ( &save); });
	}' unless defined(&curthread_pflags_set);
	eval 'sub curthread_pflags_restore {
	    my($save) = @_;
    	    eval q({  ($curthread->{td_pflags}) &= $save; });
	}' unless defined(&curthread_pflags_restore);
	eval 'sub curthread_pflags2_set {
	    my($flags) = @_;
    	    eval q({ \'struct thread\' * &td; \'int\'  &save;  &td =  &curthread;  &save = ~$flags | ( ($td->{td_pflags2}) & $flags);  ($td->{td_pflags2}) |= $flags; ( &save); });
	}' unless defined(&curthread_pflags2_set);
	eval 'sub curthread_pflags2_restore {
	    my($save) = @_;
    	    eval q({  ($curthread->{td_pflags2}) &= $save; });
	}' unless defined(&curthread_pflags2_restore);
	eval 'sub td_get_sched {
	    my($td) = @_;
    	    eval q({ ($td->[1]); });
	}' unless defined(&td_get_sched);
	eval 'sub PROC_ID_PID () {0;}' unless defined(&PROC_ID_PID);
	eval 'sub PROC_ID_GROUP () {1;}' unless defined(&PROC_ID_GROUP);
	eval 'sub PROC_ID_SESSION () {2;}' unless defined(&PROC_ID_SESSION);
	eval 'sub PROC_ID_REAP () {3;}' unless defined(&PROC_ID_REAP);
    }
}
1;

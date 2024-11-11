require '_h2ph_pre.ph';

no warnings qw(redefine misc);

unless(defined(&_SYS_SIGNALVAR_H_)) {
    eval 'sub _SYS_SIGNALVAR_H_ () {1;}' unless defined(&_SYS_SIGNALVAR_H_);
    require 'sys/queue.ph';
    require 'sys/_lock.ph';
    require 'sys/_mutex.ph';
    require 'sys/signal.ph';
    eval 'sub PS_NOCLDWAIT () {0x1;}' unless defined(&PS_NOCLDWAIT);
    eval 'sub PS_NOCLDSTOP () {0x2;}' unless defined(&PS_NOCLDSTOP);
    eval 'sub PS_CLDSIGIGN () {0x4;}' unless defined(&PS_CLDSIGIGN);
    if(defined(&_KERNEL)) {
	if(defined(&COMPAT_43)) {
	}
	eval 'sub SIG_CATCH () {(( &__sighandler_t *)2);}' unless defined(&SIG_CATCH);
	eval 'sub SIGACTION {
	    my($p, $sig) = @_;
    	    eval q(( ($p->{p_sigacts}->{ps_sigact[_SIG_IDX($sig)]})));
	}' unless defined(&SIGACTION);
    }
    eval 'sub SIGADDSET {
        my($set, $signo) = @_;
	    eval q((($set). $__bits[ &_SIG_WORD($signo)] |=  &_SIG_BIT($signo)));
    }' unless defined(&SIGADDSET);
    eval 'sub SIGDELSET {
        my($set, $signo) = @_;
	    eval q((($set). $__bits[ &_SIG_WORD($signo)] &= ~ &_SIG_BIT($signo)));
    }' unless defined(&SIGDELSET);
    eval 'sub SIGEMPTYSET {
        my($set) = @_;
	    eval q( &do { \'int\'  &__i;  &for ( &__i = 0;  &__i <  &_SIG_WORDS;  &__i++) ($set). $__bits[ &__i] = 0; }  &while (0));
    }' unless defined(&SIGEMPTYSET);
    eval 'sub SIGFILLSET {
        my($set) = @_;
	    eval q( &do { \'int\'  &__i;  &for ( &__i = 0;  &__i <  &_SIG_WORDS;  &__i++) ($set). $__bits[ &__i] = ~0; }  &while (0));
    }' unless defined(&SIGFILLSET);
    eval 'sub SIGISMEMBER {
        my($set, $signo) = @_;
	    eval q((($set). $__bits[ &_SIG_WORD($signo)] &  &_SIG_BIT($signo)));
    }' unless defined(&SIGISMEMBER);
    eval 'sub SIGISEMPTY {
        my($set) = @_;
	    eval q(( &__sigisempty(($set))));
    }' unless defined(&SIGISEMPTY);
    eval 'sub SIGNOTEMPTY {
        my($set) = @_;
	    eval q((! &__sigisempty(($set))));
    }' unless defined(&SIGNOTEMPTY);
    eval 'sub SIGSETEQ {
        my($set1, $set2) = @_;
	    eval q(( &__sigseteq(($set1), ($set2))));
    }' unless defined(&SIGSETEQ);
    eval 'sub SIGSETNEQ {
        my($set1, $set2) = @_;
	    eval q((! &__sigseteq(($set1), ($set2))));
    }' unless defined(&SIGSETNEQ);
    eval 'sub SIGSETOR {
        my($set1, $set2) = @_;
	    eval q( &do { \'int\'  &__i;  &for ( &__i = 0;  &__i <  &_SIG_WORDS;  &__i++) ($set1). $__bits[ &__i] |= ($set2). $__bits[ &__i]; }  &while (0));
    }' unless defined(&SIGSETOR);
    eval 'sub SIGSETAND {
        my($set1, $set2) = @_;
	    eval q( &do { \'int\'  &__i;  &for ( &__i = 0;  &__i <  &_SIG_WORDS;  &__i++) ($set1). $__bits[ &__i] &= ($set2). $__bits[ &__i]; }  &while (0));
    }' unless defined(&SIGSETAND);
    eval 'sub SIGSETNAND {
        my($set1, $set2) = @_;
	    eval q( &do { \'int\'  &__i;  &for ( &__i = 0;  &__i <  &_SIG_WORDS;  &__i++) ($set1). $__bits[ &__i] &= ~($set2). $__bits[ &__i]; }  &while (0));
    }' unless defined(&SIGSETNAND);
    eval 'sub SIGSETLO {
        my($set1, $set2) = @_;
	    eval q((($set1). $__bits[0] = ($set2). $__bits[0]));
    }' unless defined(&SIGSETLO);
    eval 'sub SIGSETOLD {
        my($set, $oset) = @_;
	    eval q((($set). $__bits[0] = ($oset)));
    }' unless defined(&SIGSETOLD);
    eval 'sub SIG_CANTMASK {
        my($set) = @_;
	    eval q( &SIGDELSET($set,  &SIGKILL),  &SIGDELSET($set,  &SIGSTOP));
    }' unless defined(&SIG_CANTMASK);
    eval 'sub SIG_STOPSIGMASK {
        my($set) = @_;
	    eval q( &SIGDELSET($set,  &SIGSTOP),  &SIGDELSET($set,  &SIGTSTP),  &SIGDELSET($set,  &SIGTTIN),  &SIGDELSET($set,  &SIGTTOU));
    }' unless defined(&SIG_STOPSIGMASK);
    eval 'sub SIG_CONTSIGMASK {
        my($set) = @_;
	    eval q( &SIGDELSET($set,  &SIGCONT));
    }' unless defined(&SIG_CONTSIGMASK);
    eval 'sub sigcantmask () {( &sigmask( &SIGKILL) |  &sigmask( &SIGSTOP));}' unless defined(&sigcantmask);
    eval 'sub SIG2OSIG {
        my($sig, $osig) = @_;
	    eval q(($osig = ($sig). $__bits[0]));
    }' unless defined(&SIG2OSIG);
    eval 'sub OSIG2SIG {
        my($osig, $sig) = @_;
	    eval q( &SIGEMPTYSET($sig); ($sig). $__bits[0] = $osig);
    }' unless defined(&OSIG2SIG);
    eval 'sub __sigisempty {
        my($set) = @_;
	    eval q({ \'int\'  &i;  &for ( &i = 0;  &i <  &_SIG_WORDS;  &i++) {  &if ( ($set->{__bits[&i]})) (0); } (1); });
    }' unless defined(&__sigisempty);
    eval 'sub __sigseteq {
        my($set1,$set2) = @_;
	    eval q({ \'int\'  &i;  &for ( &i = 0;  &i <  &_SIG_WORDS;  &i++) {  &if ( ($set1->{__bits[&i]}) !=  ($set2->{__bits[&i]})) (0); } (1); });
    }' unless defined(&__sigseteq);
    if(defined(&COMPAT_FREEBSD6)) {
    }
    eval 'sub ksi_signo () { ($ksi_info->{si_signo});}' unless defined(&ksi_signo);
    eval 'sub ksi_errno () { ($ksi_info->{si_errno});}' unless defined(&ksi_errno);
    eval 'sub ksi_code () { ($ksi_info->{si_code});}' unless defined(&ksi_code);
    eval 'sub ksi_pid () { ($ksi_info->{si_pid});}' unless defined(&ksi_pid);
    eval 'sub ksi_uid () { ($ksi_info->{si_uid});}' unless defined(&ksi_uid);
    eval 'sub ksi_status () { ($ksi_info->{si_status});}' unless defined(&ksi_status);
    eval 'sub ksi_addr () { ($ksi_info->{si_addr});}' unless defined(&ksi_addr);
    eval 'sub ksi_value () { ($ksi_info->{si_value});}' unless defined(&ksi_value);
    eval 'sub ksi_band () { ($ksi_info->{si_band});}' unless defined(&ksi_band);
    eval 'sub ksi_trapno () { ($ksi_info->{si_trapno});}' unless defined(&ksi_trapno);
    eval 'sub ksi_overrun () { ($ksi_info->{si_overrun});}' unless defined(&ksi_overrun);
    eval 'sub ksi_timerid () { ($ksi_info->{si_timerid});}' unless defined(&ksi_timerid);
    eval 'sub ksi_mqd () { ($ksi_info->{si_mqd});}' unless defined(&ksi_mqd);
    eval 'sub KSI_TRAP () {0x1;}' unless defined(&KSI_TRAP);
    eval 'sub KSI_EXT () {0x2;}' unless defined(&KSI_EXT);
    eval 'sub KSI_INS () {0x4;}' unless defined(&KSI_INS);
    eval 'sub KSI_SIGQ () {0x8;}' unless defined(&KSI_SIGQ);
    eval 'sub KSI_HEAD () {0x10;}' unless defined(&KSI_HEAD);
    eval 'sub KSI_PTRACE () {0x20;}' unless defined(&KSI_PTRACE);
    eval 'sub KSI_COPYMASK () {( &KSI_TRAP |  &KSI_SIGQ |  &KSI_PTRACE);}' unless defined(&KSI_COPYMASK);
    eval 'sub KSI_ONQ {
        my($ksi) = @_;
	    eval q((($ksi)-> &ksi_sigq !=  &NULL));
    }' unless defined(&KSI_ONQ);
    eval 'sub SQ_INIT () {0x1;}' unless defined(&SQ_INIT);
    eval 'sub SIGFASTBLOCK_SETPTR () {1;}' unless defined(&SIGFASTBLOCK_SETPTR);
    eval 'sub SIGFASTBLOCK_UNBLOCK () {2;}' unless defined(&SIGFASTBLOCK_UNBLOCK);
    eval 'sub SIGFASTBLOCK_UNSETPTR () {3;}' unless defined(&SIGFASTBLOCK_UNSETPTR);
    eval 'sub SIGFASTBLOCK_PEND () {0x1;}' unless defined(&SIGFASTBLOCK_PEND);
    eval 'sub SIGFASTBLOCK_FLAGS () {0xf;}' unless defined(&SIGFASTBLOCK_FLAGS);
    eval 'sub SIGFASTBLOCK_INC () {0x10;}' unless defined(&SIGFASTBLOCK_INC);
    unless(defined(&_KERNEL)) {
    }
    if(defined(&_KERNEL)) {
	eval 'sub SIGPENDING {
	    my($td) = @_;
    	    eval q(((! &SIGISEMPTY(($td)-> &td_siglist)  && ! &sigsetmasked(($td)-> &td_siglist, ($td)-> &td_sigmask)) || (! &SIGISEMPTY(($td)-> ($td_proc->{p_siglist}))  && ! &sigsetmasked(($td)-> ($td_proc->{p_siglist}), ($td)-> &td_sigmask))));
	}' unless defined(&SIGPENDING);
	eval 'sub ksiginfo_init {
	    my($ksi) = @_;
    	    eval q( &do {  &bzero($ksi, $sizeof{ &ksiginfo_t}); }  &while (0));
	}' unless defined(&ksiginfo_init);
	eval 'sub ksiginfo_init_trap {
	    my($ksi) = @_;
    	    eval q( &do {  &ksiginfo_t * &kp = $ksi;  &bzero( &kp, $sizeof{ &ksiginfo_t});  ($kp->{ksi_flags}) |=  &KSI_TRAP; }  &while (0));
	}' unless defined(&ksiginfo_init_trap);
	eval 'sub ksiginfo_copy {
	    my($src,$dst) = @_;
    	    eval q({ ($dst)-> &ksi_info =  ($src->{ksi_info}); ($dst)-> &ksi_flags = ( ($src->{ksi_flags}) &  &KSI_COPYMASK); });
	}' unless defined(&ksiginfo_copy);
	eval 'sub ksiginfo_set_sigev {
	    my($dst,$sigev) = @_;
    	    eval q({  ($dst->{ksi_signo}) =  ($sigev->{sigev_signo});  ($dst->{ksi_value}) =  ($sigev->{sigev_value}); });
	}' unless defined(&ksiginfo_set_sigev);
	eval 'sub SIGIO_LOCK () {
	    eval q( &mtx_lock( &sigio_lock));
	}' unless defined(&SIGIO_LOCK);
	eval 'sub SIGIO_TRYLOCK () {
	    eval q( &mtx_trylock( &sigio_lock));
	}' unless defined(&SIGIO_TRYLOCK);
	eval 'sub SIGIO_UNLOCK () {
	    eval q( &mtx_unlock( &sigio_lock));
	}' unless defined(&SIGIO_UNLOCK);
	eval 'sub SIGIO_LOCKED () {
	    eval q( &mtx_owned( &sigio_lock));
	}' unless defined(&SIGIO_LOCKED);
	eval 'sub SIGIO_ASSERT_LOCKED () {
	    eval q( &mtx_assert( &sigio_lock,  &MA_OWNED));
	}' unless defined(&SIGIO_ASSERT_LOCKED);
	eval 'sub SIGPROCMASK_OLD () {0x1;}' unless defined(&SIGPROCMASK_OLD);
	eval 'sub SIGPROCMASK_PROC_LOCKED () {0x2;}' unless defined(&SIGPROCMASK_PROC_LOCKED);
	eval 'sub SIGPROCMASK_PS_LOCKED () {0x4;}' unless defined(&SIGPROCMASK_PS_LOCKED);
	eval 'sub SIGPROCMASK_FASTBLK () {0x8;}' unless defined(&SIGPROCMASK_FASTBLK);
	eval 'sub SIGDEFERSTOP_NOP () {0;}' unless defined(&SIGDEFERSTOP_NOP);
	eval 'sub SIGDEFERSTOP_OFF () {1;}' unless defined(&SIGDEFERSTOP_OFF);
	eval 'sub SIGDEFERSTOP_SILENT () {2;}' unless defined(&SIGDEFERSTOP_SILENT);
	eval 'sub SIGDEFERSTOP_EINTR () {3;}' unless defined(&SIGDEFERSTOP_EINTR);
	eval 'sub SIGDEFERSTOP_ERESTART () {4;}' unless defined(&SIGDEFERSTOP_ERESTART);
	eval 'sub SIGDEFERSTOP_VAL_NCHG () {(-1);}' unless defined(&SIGDEFERSTOP_VAL_NCHG);
	eval 'sub sigdeferstop {
	    my($mode) = @_;
    	    eval q({  &if ( &__predict_false($mode ==  &SIGDEFERSTOP_NOP)) ( &SIGDEFERSTOP_VAL_NCHG); ( &sigdeferstop_impl($mode)); });
	}' unless defined(&sigdeferstop);
	eval 'sub sigallowstop {
	    my($prev) = @_;
    	    eval q({  &if ( &__predict_true($prev ==  &SIGDEFERSTOP_VAL_NCHG)) ;  &sigallowstop_impl($prev); });
	}' unless defined(&sigallowstop);
    }
}
1;

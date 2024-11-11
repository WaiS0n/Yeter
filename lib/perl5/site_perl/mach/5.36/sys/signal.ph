require '_h2ph_pre.ph';

no warnings qw(redefine misc);

unless(defined(&_SYS_SIGNAL_H_)) {
    eval 'sub _SYS_SIGNAL_H_ () {1;}' unless defined(&_SYS_SIGNAL_H_);
    require 'sys/cdefs.ph';
    require 'sys/_types.ph';
    require 'sys/_sigset.ph';
    require 'sys/_sigval.ph';
    require 'machine/_limits.ph';
    require 'machine/signal.ph';
    if((defined(&__POSIX_VISIBLE) ? &__POSIX_VISIBLE : undef) >= 200809) {
	require 'sys/_pthreadtypes.ph';
	require 'sys/_timespec.ph';
	unless(defined(&_SIZE_T_DECLARED)) {
	    eval 'sub _SIZE_T_DECLARED () {1;}' unless defined(&_SIZE_T_DECLARED);
	}
	unless(defined(&_UID_T_DECLARED)) {
	    eval 'sub _UID_T_DECLARED () {1;}' unless defined(&_UID_T_DECLARED);
	}
    }
    if((defined(&__POSIX_VISIBLE) ? &__POSIX_VISIBLE : undef) || (defined(&__XSI_VISIBLE) ? &__XSI_VISIBLE : undef)) {
	eval 'sub SIGHUP () {1;}' unless defined(&SIGHUP);
    }
    eval 'sub SIGINT () {2;}' unless defined(&SIGINT);
    if((defined(&__POSIX_VISIBLE) ? &__POSIX_VISIBLE : undef) || (defined(&__XSI_VISIBLE) ? &__XSI_VISIBLE : undef)) {
	eval 'sub SIGQUIT () {3;}' unless defined(&SIGQUIT);
    }
    eval 'sub SIGILL () {4;}' unless defined(&SIGILL);
    if((defined(&__XSI_VISIBLE) ? &__XSI_VISIBLE : undef)) {
	eval 'sub SIGTRAP () {5;}' unless defined(&SIGTRAP);
    }
    eval 'sub SIGABRT () {6;}' unless defined(&SIGABRT);
    if((defined(&__BSD_VISIBLE) ? &__BSD_VISIBLE : undef)) {
	eval 'sub SIGIOT () { &SIGABRT;}' unless defined(&SIGIOT);
	eval 'sub SIGEMT () {7;}' unless defined(&SIGEMT);
    }
    eval 'sub SIGFPE () {8;}' unless defined(&SIGFPE);
    if((defined(&__POSIX_VISIBLE) ? &__POSIX_VISIBLE : undef) || (defined(&__XSI_VISIBLE) ? &__XSI_VISIBLE : undef)) {
	eval 'sub SIGKILL () {9;}' unless defined(&SIGKILL);
    }
    if((defined(&__POSIX_VISIBLE) ? &__POSIX_VISIBLE : undef) >= 200112|| (defined(&__XSI_VISIBLE) ? &__XSI_VISIBLE : undef)) {
	eval 'sub SIGBUS () {10;}' unless defined(&SIGBUS);
    }
    eval 'sub SIGSEGV () {11;}' unless defined(&SIGSEGV);
    if((defined(&__POSIX_VISIBLE) ? &__POSIX_VISIBLE : undef) >= 200112|| (defined(&__XSI_VISIBLE) ? &__XSI_VISIBLE : undef)) {
	eval 'sub SIGSYS () {12;}' unless defined(&SIGSYS);
    }
    if((defined(&__POSIX_VISIBLE) ? &__POSIX_VISIBLE : undef) || (defined(&__XSI_VISIBLE) ? &__XSI_VISIBLE : undef)) {
	eval 'sub SIGPIPE () {13;}' unless defined(&SIGPIPE);
	eval 'sub SIGALRM () {14;}' unless defined(&SIGALRM);
    }
    eval 'sub SIGTERM () {15;}' unless defined(&SIGTERM);
    if((defined(&__POSIX_VISIBLE) ? &__POSIX_VISIBLE : undef) >= 200112|| (defined(&__XSI_VISIBLE) ? &__XSI_VISIBLE : undef)) {
	eval 'sub SIGURG () {16;}' unless defined(&SIGURG);
    }
    if((defined(&__POSIX_VISIBLE) ? &__POSIX_VISIBLE : undef) || (defined(&__XSI_VISIBLE) ? &__XSI_VISIBLE : undef)) {
	eval 'sub SIGSTOP () {17;}' unless defined(&SIGSTOP);
	eval 'sub SIGTSTP () {18;}' unless defined(&SIGTSTP);
	eval 'sub SIGCONT () {19;}' unless defined(&SIGCONT);
	eval 'sub SIGCHLD () {20;}' unless defined(&SIGCHLD);
	eval 'sub SIGTTIN () {21;}' unless defined(&SIGTTIN);
	eval 'sub SIGTTOU () {22;}' unless defined(&SIGTTOU);
    }
    if((defined(&__BSD_VISIBLE) ? &__BSD_VISIBLE : undef)) {
	eval 'sub SIGIO () {23;}' unless defined(&SIGIO);
    }
    if((defined(&__XSI_VISIBLE) ? &__XSI_VISIBLE : undef)) {
	eval 'sub SIGXCPU () {24;}' unless defined(&SIGXCPU);
	eval 'sub SIGXFSZ () {25;}' unless defined(&SIGXFSZ);
	eval 'sub SIGVTALRM () {26;}' unless defined(&SIGVTALRM);
	eval 'sub SIGPROF () {27;}' unless defined(&SIGPROF);
    }
    if((defined(&__BSD_VISIBLE) ? &__BSD_VISIBLE : undef)) {
	eval 'sub SIGWINCH () {28;}' unless defined(&SIGWINCH);
	eval 'sub SIGINFO () {29;}' unless defined(&SIGINFO);
    }
    if((defined(&__POSIX_VISIBLE) ? &__POSIX_VISIBLE : undef) || (defined(&__XSI_VISIBLE) ? &__XSI_VISIBLE : undef)) {
	eval 'sub SIGUSR1 () {30;}' unless defined(&SIGUSR1);
	eval 'sub SIGUSR2 () {31;}' unless defined(&SIGUSR2);
    }
    if((defined(&__BSD_VISIBLE) ? &__BSD_VISIBLE : undef)) {
	eval 'sub SIGTHR () {32;}' unless defined(&SIGTHR);
	eval 'sub SIGLWP () { &SIGTHR;}' unless defined(&SIGLWP);
	eval 'sub SIGLIBRT () {33;}' unless defined(&SIGLIBRT);
    }
    eval 'sub SIGRTMIN () {65;}' unless defined(&SIGRTMIN);
    eval 'sub SIGRTMAX () {126;}' unless defined(&SIGRTMAX);
    eval 'sub SIG_DFL () {(( &__sighandler_t *)0);}' unless defined(&SIG_DFL);
    eval 'sub SIG_IGN () {(( &__sighandler_t *)1);}' unless defined(&SIG_IGN);
    eval 'sub SIG_ERR () {(( &__sighandler_t *)-1);}' unless defined(&SIG_ERR);
    eval 'sub SIG_HOLD () {(( &__sighandler_t *)3);}' unless defined(&SIG_HOLD);
    if((defined(&__POSIX_VISIBLE) ? &__POSIX_VISIBLE : undef) || (defined(&__XSI_VISIBLE) ? &__XSI_VISIBLE : undef)) {
	unless(defined(&_SIGSET_T_DECLARED)) {
	    eval 'sub _SIGSET_T_DECLARED () {1;}' unless defined(&_SIGSET_T_DECLARED);
	}
    }
    if((defined(&__POSIX_VISIBLE) ? &__POSIX_VISIBLE : undef) >= 199309) {
	if((defined(&__BSD_VISIBLE) ? &__BSD_VISIBLE : undef)) {
	    eval 'sub sigev_notify_kqueue () { &sigev_signo;}' unless defined(&sigev_notify_kqueue);
	    eval 'sub sigev_notify_kevent_flags () { ($_sigev_un->{_kevent_flags});}' unless defined(&sigev_notify_kevent_flags);
	    eval 'sub sigev_notify_thread_id () { ($_sigev_un->{_threadid});}' unless defined(&sigev_notify_thread_id);
	}
	eval 'sub sigev_notify_function () { ($_sigev_un->{_sigev_thread}->{_function});}' unless defined(&sigev_notify_function);
	eval 'sub sigev_notify_attributes () { ($_sigev_un->{_sigev_thread}->{_attribute});}' unless defined(&sigev_notify_attributes);
	eval 'sub SIGEV_NONE () {0;}' unless defined(&SIGEV_NONE);
	eval 'sub SIGEV_SIGNAL () {1;}' unless defined(&SIGEV_SIGNAL);
	eval 'sub SIGEV_THREAD () {2;}' unless defined(&SIGEV_THREAD);
	if((defined(&__BSD_VISIBLE) ? &__BSD_VISIBLE : undef)) {
	    eval 'sub SIGEV_KEVENT () {3;}' unless defined(&SIGEV_KEVENT);
	    eval 'sub SIGEV_THREAD_ID () {4;}' unless defined(&SIGEV_THREAD_ID);
	}
    }
    if((defined(&__POSIX_VISIBLE) ? &__POSIX_VISIBLE : undef) >= 199309|| (defined(&__XSI_VISIBLE) ? &__XSI_VISIBLE : undef)) {
	eval 'sub si_trapno () { ($_reason->{_fault}->{_trapno});}' unless defined(&si_trapno);
	eval 'sub si_timerid () { ($_reason->{_timer}->{_timerid});}' unless defined(&si_timerid);
	eval 'sub si_overrun () { ($_reason->{_timer}->{_overrun});}' unless defined(&si_overrun);
	eval 'sub si_mqd () { ($_reason->{_mesgq}->{_mqd});}' unless defined(&si_mqd);
	eval 'sub si_band () { ($_reason->{_poll}->{_band});}' unless defined(&si_band);
	eval 'sub si_syscall () { ($_reason->{_capsicum}->{_syscall});}' unless defined(&si_syscall);
	if(defined(&_WANT_LWPINFO32) || (defined(&_KERNEL)  && defined(&__LP64__))) {
	}
	eval 'sub ILL_ILLOPC () {1;}' unless defined(&ILL_ILLOPC);
	eval 'sub ILL_ILLOPN () {2;}' unless defined(&ILL_ILLOPN);
	eval 'sub ILL_ILLADR () {3;}' unless defined(&ILL_ILLADR);
	eval 'sub ILL_ILLTRP () {4;}' unless defined(&ILL_ILLTRP);
	eval 'sub ILL_PRVOPC () {5;}' unless defined(&ILL_PRVOPC);
	eval 'sub ILL_PRVREG () {6;}' unless defined(&ILL_PRVREG);
	eval 'sub ILL_COPROC () {7;}' unless defined(&ILL_COPROC);
	eval 'sub ILL_BADSTK () {8;}' unless defined(&ILL_BADSTK);
	eval 'sub BUS_ADRALN () {1;}' unless defined(&BUS_ADRALN);
	eval 'sub BUS_ADRERR () {2;}' unless defined(&BUS_ADRERR);
	eval 'sub BUS_OBJERR () {3;}' unless defined(&BUS_OBJERR);
	eval 'sub BUS_OOMERR () {100;}' unless defined(&BUS_OOMERR);
	eval 'sub SEGV_MAPERR () {1;}' unless defined(&SEGV_MAPERR);
	eval 'sub SEGV_ACCERR () {2;}' unless defined(&SEGV_ACCERR);
	eval 'sub SEGV_PKUERR () {100;}' unless defined(&SEGV_PKUERR);
	eval 'sub FPE_INTOVF () {1;}' unless defined(&FPE_INTOVF);
	eval 'sub FPE_INTDIV () {2;}' unless defined(&FPE_INTDIV);
	eval 'sub FPE_FLTDIV () {3;}' unless defined(&FPE_FLTDIV);
	eval 'sub FPE_FLTOVF () {4;}' unless defined(&FPE_FLTOVF);
	eval 'sub FPE_FLTUND () {5;}' unless defined(&FPE_FLTUND);
	eval 'sub FPE_FLTRES () {6;}' unless defined(&FPE_FLTRES);
	eval 'sub FPE_FLTINV () {7;}' unless defined(&FPE_FLTINV);
	eval 'sub FPE_FLTSUB () {8;}' unless defined(&FPE_FLTSUB);
	eval 'sub FPE_FLTIDO () {9;}' unless defined(&FPE_FLTIDO);
	eval 'sub TRAP_BRKPT () {1;}' unless defined(&TRAP_BRKPT);
	eval 'sub TRAP_TRACE () {2;}' unless defined(&TRAP_TRACE);
	eval 'sub TRAP_DTRACE () {3;}' unless defined(&TRAP_DTRACE);
	eval 'sub TRAP_CAP () {4;}' unless defined(&TRAP_CAP);
	eval 'sub CLD_EXITED () {1;}' unless defined(&CLD_EXITED);
	eval 'sub CLD_KILLED () {2;}' unless defined(&CLD_KILLED);
	eval 'sub CLD_DUMPED () {3;}' unless defined(&CLD_DUMPED);
	eval 'sub CLD_TRAPPED () {4;}' unless defined(&CLD_TRAPPED);
	eval 'sub CLD_STOPPED () {5;}' unless defined(&CLD_STOPPED);
	eval 'sub CLD_CONTINUED () {6;}' unless defined(&CLD_CONTINUED);
	eval 'sub POLL_IN () {1;}' unless defined(&POLL_IN);
	eval 'sub POLL_OUT () {2;}' unless defined(&POLL_OUT);
	eval 'sub POLL_MSG () {3;}' unless defined(&POLL_MSG);
	eval 'sub POLL_ERR () {4;}' unless defined(&POLL_ERR);
	eval 'sub POLL_PRI () {5;}' unless defined(&POLL_PRI);
	eval 'sub POLL_HUP () {6;}' unless defined(&POLL_HUP);
    }
    if((defined(&__POSIX_VISIBLE) ? &__POSIX_VISIBLE : undef) || (defined(&__XSI_VISIBLE) ? &__XSI_VISIBLE : undef)) {
	eval 'sub sa_handler () { ($__sigaction_u->{__sa_handler});}' unless defined(&sa_handler);
    }
    if((defined(&__XSI_VISIBLE) ? &__XSI_VISIBLE : undef)) {
	eval 'sub sa_sigaction () { ($__sigaction_u->{__sa_sigaction});}' unless defined(&sa_sigaction);
    }
    if((defined(&__POSIX_VISIBLE) ? &__POSIX_VISIBLE : undef) || (defined(&__XSI_VISIBLE) ? &__XSI_VISIBLE : undef)) {
	eval 'sub SA_NOCLDSTOP () {0x8;}' unless defined(&SA_NOCLDSTOP);
    }
    if((defined(&__XSI_VISIBLE) ? &__XSI_VISIBLE : undef)) {
	eval 'sub SA_ONSTACK () {0x1;}' unless defined(&SA_ONSTACK);
	eval 'sub SA_RESTART () {0x2;}' unless defined(&SA_RESTART);
	eval 'sub SA_RESETHAND () {0x4;}' unless defined(&SA_RESETHAND);
	eval 'sub SA_NODEFER () {0x10;}' unless defined(&SA_NODEFER);
	eval 'sub SA_NOCLDWAIT () {0x20;}' unless defined(&SA_NOCLDWAIT);
	eval 'sub SA_SIGINFO () {0x40;}' unless defined(&SA_SIGINFO);
    }
    if((defined(&__BSD_VISIBLE) ? &__BSD_VISIBLE : undef)) {
	eval 'sub NSIG () {32;}' unless defined(&NSIG);
    }
    if((defined(&__POSIX_VISIBLE) ? &__POSIX_VISIBLE : undef) || (defined(&__XSI_VISIBLE) ? &__XSI_VISIBLE : undef)) {
	eval 'sub SI_NOINFO () {0;}' unless defined(&SI_NOINFO);
	eval 'sub SI_USER () {0x10001;}' unless defined(&SI_USER);
	eval 'sub SI_QUEUE () {0x10002;}' unless defined(&SI_QUEUE);
	eval 'sub SI_TIMER () {0x10003;}' unless defined(&SI_TIMER);
	eval 'sub SI_ASYNCIO () {0x10004;}' unless defined(&SI_ASYNCIO);
	eval 'sub SI_MESGQ () {0x10005;}' unless defined(&SI_MESGQ);
	eval 'sub SI_KERNEL () {0x10006;}' unless defined(&SI_KERNEL);
	eval 'sub SI_LWP () {0x10007;}' unless defined(&SI_LWP);
    }
    if((defined(&__BSD_VISIBLE) ? &__BSD_VISIBLE : undef)) {
	eval 'sub SI_UNDEFINED () {0;}' unless defined(&SI_UNDEFINED);
    }
    if((defined(&__BSD_VISIBLE) ? &__BSD_VISIBLE : undef)) {
    }
    if((defined(&__XSI_VISIBLE) ? &__XSI_VISIBLE : undef)) {
	if((defined(&__BSD_VISIBLE) ? &__BSD_VISIBLE : undef)) {
	    eval 'sub __stack_t () { &sigaltstack;}' unless defined(&__stack_t);
	}
	eval 'sub SS_ONSTACK () {0x1;}' unless defined(&SS_ONSTACK);
	eval 'sub SS_DISABLE () {0x4;}' unless defined(&SS_DISABLE);
	eval 'sub MINSIGSTKSZ () { &__MINSIGSTKSZ;}' unless defined(&MINSIGSTKSZ);
	eval 'sub SIGSTKSZ () {( &MINSIGSTKSZ + 32768);}' unless defined(&SIGSTKSZ);
    }
    if((defined(&__BSD_VISIBLE) ? &__BSD_VISIBLE : undef)) {
	eval 'sub SV_ONSTACK () { &SA_ONSTACK;}' unless defined(&SV_ONSTACK);
	eval 'sub SV_INTERRUPT () { &SA_RESTART;}' unless defined(&SV_INTERRUPT);
	eval 'sub SV_RESETHAND () { &SA_RESETHAND;}' unless defined(&SV_RESETHAND);
	eval 'sub SV_NODEFER () { &SA_NODEFER;}' unless defined(&SV_NODEFER);
	eval 'sub SV_NOCLDSTOP () { &SA_NOCLDSTOP;}' unless defined(&SV_NOCLDSTOP);
	eval 'sub SV_SIGINFO () { &SA_SIGINFO;}' unless defined(&SV_SIGINFO);
	eval 'sub sv_onstack () { &sv_flags;}' unless defined(&sv_onstack);
    }
    if(defined(&_KERNEL)  && defined(&COMPAT_43)  && !defined(&__i386__)) {
    }
    if((defined(&__XSI_VISIBLE) ? &__XSI_VISIBLE : undef)) {
    }
    if((defined(&__BSD_VISIBLE) ? &__BSD_VISIBLE : undef) || (defined(&__POSIX_VISIBLE) ? &__POSIX_VISIBLE : undef) > 0 && (defined(&__POSIX_VISIBLE) ? &__POSIX_VISIBLE : undef) <= 200112) {
	eval 'sub sigmask {
	    my($m) = @_;
    	    eval q((1<< (($m)-1)));
	}' unless defined(&sigmask);
    }
    if((defined(&__BSD_VISIBLE) ? &__BSD_VISIBLE : undef)) {
	eval 'sub BADSIG () { &SIG_ERR;}' unless defined(&BADSIG);
	eval 'sub __SIGQUEUE_TID () {0x80000000;}' unless defined(&__SIGQUEUE_TID);
	eval 'sub __SIGQUEUE_RSRV () {0x40000000;}' unless defined(&__SIGQUEUE_RSRV);
    }
    if((defined(&__POSIX_VISIBLE) ? &__POSIX_VISIBLE : undef) || (defined(&__XSI_VISIBLE) ? &__XSI_VISIBLE : undef)) {
	eval 'sub SIG_BLOCK () {1;}' unless defined(&SIG_BLOCK);
	eval 'sub SIG_UNBLOCK () {2;}' unless defined(&SIG_UNBLOCK);
	eval 'sub SIG_SETMASK () {3;}' unless defined(&SIG_SETMASK);
    }
}
1;

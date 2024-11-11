require '_h2ph_pre.ph';

no warnings qw(redefine misc);

unless(defined(&_SYS_SYSTM_H_)) {
    eval 'sub _SYS_SYSTM_H_ () {1;}' unless defined(&_SYS_SYSTM_H_);
    require 'sys/types.ph';
    require 'sys/callout.ph';
    require 'sys/kassert.ph';
    require 'sys/queue.ph';
    require 'sys/stdint.ph';
    require 'machine/atomic.ph';
    require 'machine/cpufunc.ph';
    if(defined(&_KERNEL)) {
	eval("sub VM_GUEST_NO () { 0; }") unless defined(&VM_GUEST_NO);
	eval("sub VM_GUEST_VM () { 1; }") unless defined(&VM_GUEST_VM);
	eval("sub VM_GUEST_XEN () { 2; }") unless defined(&VM_GUEST_XEN);
	eval("sub VM_GUEST_HV () { 3; }") unless defined(&VM_GUEST_HV);
	eval("sub VM_GUEST_VMWARE () { 4; }") unless defined(&VM_GUEST_VMWARE);
	eval("sub VM_GUEST_KVM () { 5; }") unless defined(&VM_GUEST_KVM);
	eval("sub VM_GUEST_BHYVE () { 6; }") unless defined(&VM_GUEST_BHYVE);
	eval("sub VM_GUEST_VBOX () { 7; }") unless defined(&VM_GUEST_VBOX);
	eval("sub VM_GUEST_PARALLELS () { 8; }") unless defined(&VM_GUEST_PARALLELS);
	eval("sub VM_LAST () { 9; }") unless defined(&VM_LAST);
    }
    eval 'sub __read_mostly () { &__section(".data.read_mostly");}' unless defined(&__read_mostly);
    eval 'sub __read_frequently () { &__section(".data.read_frequently");}' unless defined(&__read_frequently);
    eval 'sub __exclusive_cache_line () { &__aligned( &CACHE_LINE_SIZE)  &__section(".data.exclusive_cache_line");}' unless defined(&__exclusive_cache_line);
    if(defined(&_STANDALONE)) {
    }
    if(defined(&_KERNEL)) {
	require 'sys/param.ph';
	require 'sys/pcpu.ph';
	require 'sys/kpilite.ph';
	eval 'sub SCHEDULER_STOPPED_TD {
	    my($td) = @_;
    	    eval q(({  &MPASS(($td) ==  &curthread);  &__predict_false(($td)-> &td_stopsched); }));
	}' unless defined(&SCHEDULER_STOPPED_TD);
	eval 'sub SCHEDULER_STOPPED () {
	    eval q( &SCHEDULER_STOPPED_TD( &curthread));
	}' unless defined(&SCHEDULER_STOPPED);
	if(defined(&__LP64__)) {
	    eval 'sub IOSIZE_MAX () { &iosize_max();}' unless defined(&IOSIZE_MAX);
	    eval 'sub DEVFS_IOSIZE_MAX () { &devfs_iosize_max();}' unless defined(&DEVFS_IOSIZE_MAX);
	} else {
	    eval 'sub IOSIZE_MAX () { &SSIZE_MAX;}' unless defined(&IOSIZE_MAX);
	    eval 'sub DEVFS_IOSIZE_MAX () { &SSIZE_MAX;}' unless defined(&DEVFS_IOSIZE_MAX);
	}
	eval 'sub HASH_NOWAIT () {0x1;}' unless defined(&HASH_NOWAIT);
	eval 'sub HASH_WAITOK () {0x2;}' unless defined(&HASH_WAITOK);
	if((defined(&KLD_MODULE)  && !defined(&KLD_TIED)) || defined(&KTR_CRITICAL) || !defined(&_KERNEL) || defined(&GENOFFSET)) {
	    eval 'sub critical_enter () {
	        eval q( &critical_enter_KBI());
	    }' unless defined(&critical_enter);
	    eval 'sub critical_exit () {
	        eval q( &critical_exit_KBI());
	    }' unless defined(&critical_exit);
	} else {
	    eval 'sub critical_enter {
	        my($void) = @_;
    		eval q({ \'struct thread_lite\' * &td;  &td =  &curthread;  ($td->{td_critnest})++;  &atomic_interrupt_fence(); });
	    }' unless defined(&critical_enter);
	    eval 'sub critical_exit {
	        my($void) = @_;
    		eval q({ \'struct thread_lite\' * &td;  &td =  &curthread;  &KASSERT( ($td->{td_critnest}) != 0, (\\"critical_exit: td_critnest == 0\\"));  &atomic_interrupt_fence();  ($td->{td_critnest})--;  &atomic_interrupt_fence();  &if ( &__predict_false( ($td->{td_owepreempt})))  &critical_exit_preempt(); });
	    }' unless defined(&critical_exit);
	}
	if(defined(&EARLY_PRINTF)) {
	}
	eval 'sub HD_COLUMN_MASK () {0xff;}' unless defined(&HD_COLUMN_MASK);
	eval 'sub HD_DELIM_MASK () {0xff00;}' unless defined(&HD_DELIM_MASK);
	eval 'sub HD_OMIT_COUNT () {(1<< 16);}' unless defined(&HD_OMIT_COUNT);
	eval 'sub HD_OMIT_HEX () {(1<< 17);}' unless defined(&HD_OMIT_HEX);
	eval 'sub HD_OMIT_CHARS () {(1<< 18);}' unless defined(&HD_OMIT_CHARS);
	eval 'sub ovbcopy {
	    my($f, $t, $l) = @_;
    	    eval q( &bcopy(($f), ($t), ($l)));
	}' unless defined(&ovbcopy);
	if(defined(&SAN_NEEDS_INTERCEPTORS)) {
	    eval 'sub SAN_INTERCEPTOR {
	        my($func) = @_;
    		eval q( &__CONCAT( &SAN_INTERCEPTOR_PREFIX,  &__CONCAT( &_, $func)));
	    }' unless defined(&SAN_INTERCEPTOR);
	    unless(defined(&SAN_RUNTIME)) {
		eval 'sub bcopy {
		    my($from, $to, $len) = @_;
    		    eval q( &SAN_INTERCEPTOR( &memmove)(($to), ($from), ($len)));
		}' unless defined(&bcopy);
		eval 'sub bzero {
		    my($buf, $len) = @_;
    		    eval q( &SAN_INTERCEPTOR( &memset)(($buf), 0, ($len)));
		}' unless defined(&bzero);
		eval 'sub bcmp {
		    my($b1, $b2, $len) = @_;
    		    eval q( &SAN_INTERCEPTOR( &memcmp)(($b1), ($b2), ($len)));
		}' unless defined(&bcmp);
		eval 'sub memset {
		    my($buf, $c, $len) = @_;
    		    eval q( &SAN_INTERCEPTOR( &memset)(($buf), ($c), ($len)));
		}' unless defined(&memset);
		eval 'sub memcpy {
		    my($to, $from, $len) = @_;
    		    eval q( &SAN_INTERCEPTOR( &memcpy)(($to), ($from), ($len)));
		}' unless defined(&memcpy);
		eval 'sub memmove {
		    my($dest, $src, $n) = @_;
    		    eval q( &SAN_INTERCEPTOR( &memmove)(($dest), ($src), ($n)));
		}' unless defined(&memmove);
		eval 'sub memcmp {
		    my($b1, $b2, $len) = @_;
    		    eval q( &SAN_INTERCEPTOR( &memcmp)(($b1), ($b2), ($len)));
		}' unless defined(&memcmp);
	    }
	} else {
	    eval 'sub bcopy {
	        my($from, $to, $len) = @_;
    		eval q( &__builtin_memmove(($to), ($from), ($len)));
	    }' unless defined(&bcopy);
	    eval 'sub bzero {
	        my($buf, $len) = @_;
    		eval q( &__builtin_memset(($buf), 0, ($len)));
	    }' unless defined(&bzero);
	    eval 'sub bcmp {
	        my($b1, $b2, $len) = @_;
    		eval q( &__builtin_memcmp(($b1), ($b2), ($len)));
	    }' unless defined(&bcmp);
	    eval 'sub memset {
	        my($buf, $c, $len) = @_;
    		eval q( &__builtin_memset(($buf), ($c), ($len)));
	    }' unless defined(&memset);
	    eval 'sub memcpy {
	        my($to, $from, $len) = @_;
    		eval q( &__builtin_memcpy(($to), ($from), ($len)));
	    }' unless defined(&memcpy);
	    eval 'sub memmove {
	        my($dest, $src, $n) = @_;
    		eval q( &__builtin_memmove(($dest), ($src), ($n)));
	    }' unless defined(&memmove);
	    eval 'sub memcmp {
	        my($b1, $b2, $len) = @_;
    		eval q( &__builtin_memcmp(($b1), ($b2), ($len)));
	    }' unless defined(&memcmp);
	}
	eval 'sub bzero_early {
	    my($buf, $len) = @_;
    	    eval q( &memset_early(($buf), 0, ($len)));
	}' unless defined(&bzero_early);
	eval 'sub bcopy_early {
	    my($from, $to, $len) = @_;
    	    eval q( &memmove_early(($to), ($from), ($len)));
	}' unless defined(&bcopy_early);
	eval 'sub copystr {
	    my($src, $dst, $len, $outlen) = @_;
    	    eval q(({ \'size_t\'  &__r,  &__len, * &__outlen;  &__len = ($len);  &__outlen = ($outlen);  &__r =  &strlcpy(($dst), ($src),  &__len);  &if ( &__outlen !=  &NULL) * &__outlen = (( &__r >=  &__len) ?  &__len :  &__r + 1); (( &__r >=  &__len) ?  &ENAMETOOLONG : 0); }));
	}' unless defined(&copystr);
	if(defined(&SAN_NEEDS_INTERCEPTORS)) {
	    unless(defined(&SAN_RUNTIME)) {
		eval 'sub copyin {
		    my($u, $k, $l) = @_;
    		    eval q( &SAN_INTERCEPTOR( &copyin)(($u), ($k), ($l)));
		}' unless defined(&copyin);
		eval 'sub copyinstr {
		    my($u, $k, $l, $lc) = @_;
    		    eval q( &SAN_INTERCEPTOR( &copyinstr)(($u), ($k), ($l), ($lc)));
		}' unless defined(&copyinstr);
		eval 'sub copyout {
		    my($k, $u, $l) = @_;
    		    eval q( &SAN_INTERCEPTOR( &copyout)(($k), ($u), ($l)));
		}' unless defined(&copyout);
	    }
	}
	if(defined(&SAN_NEEDS_INTERCEPTORS)  && !defined(&KCSAN)) {
	    unless(defined(&SAN_RUNTIME)) {
		eval 'sub fubyte {
		    my($b) = @_;
    		    eval q( &SAN_INTERCEPTOR( &fubyte)(($b)));
		}' unless defined(&fubyte);
		eval 'sub fuword16 {
		    my($b) = @_;
    		    eval q( &SAN_INTERCEPTOR( &fuword16)(($b)));
		}' unless defined(&fuword16);
		eval 'sub fueword {
		    my($b, $v) = @_;
    		    eval q( &SAN_INTERCEPTOR( &fueword)(($b), ($v)));
		}' unless defined(&fueword);
		eval 'sub fueword32 {
		    my($b, $v) = @_;
    		    eval q( &SAN_INTERCEPTOR( &fueword32)(($b), ($v)));
		}' unless defined(&fueword32);
		eval 'sub fueword64 {
		    my($b, $v) = @_;
    		    eval q( &SAN_INTERCEPTOR( &fueword64)(($b), ($v)));
		}' unless defined(&fueword64);
		eval 'sub subyte {
		    my($b, $w) = @_;
    		    eval q( &SAN_INTERCEPTOR( &subyte)(($b), ($w)));
		}' unless defined(&subyte);
		eval 'sub suword {
		    my($b, $w) = @_;
    		    eval q( &SAN_INTERCEPTOR( &suword)(($b), ($w)));
		}' unless defined(&suword);
		eval 'sub suword16 {
		    my($b, $w) = @_;
    		    eval q( &SAN_INTERCEPTOR( &suword16)(($b), ($w)));
		}' unless defined(&suword16);
		eval 'sub suword32 {
		    my($b, $w) = @_;
    		    eval q( &SAN_INTERCEPTOR( &suword32)(($b), ($w)));
		}' unless defined(&suword32);
		eval 'sub suword64 {
		    my($b, $w) = @_;
    		    eval q( &SAN_INTERCEPTOR( &suword64)(($b), ($w)));
		}' unless defined(&suword64);
		eval 'sub casueword32 {
		    my($b, $o, $p, $n) = @_;
    		    eval q( &SAN_INTERCEPTOR( &casueword32)(($b), ($o), ($p), ($n)));
		}' unless defined(&casueword32);
		eval 'sub casueword {
		    my($b, $o, $p, $n) = @_;
    		    eval q( &SAN_INTERCEPTOR( &casueword)(($b), ($o), ($p), ($n)));
		}' unless defined(&casueword);
	    }
	}
	eval 'sub tcp_hpts_softclock () {
	    eval q( &do {  &if ( &hpts_that_need_softclock > 0)  &tcp_hpts_softclock(); }  &while (0));
	}' unless defined(&tcp_hpts_softclock);
	eval 'sub GETENV_UNSIGNED () { &false;}' unless defined(&GETENV_UNSIGNED);
	eval 'sub GETENV_SIGNED () { &true;}' unless defined(&GETENV_SIGNED);
	require 'sys/libkern.ph';
	eval 'sub msleep {
	    my($chan, $mtx, $pri, $wmesg, $timo) = @_;
    	    eval q( &_sleep(($chan), ($mtx)-> &lock_object, ($pri), ($wmesg),  &tick_sbt * ($timo), 0,  &C_HARDCLOCK));
	}' unless defined(&msleep);
	eval 'sub msleep_sbt {
	    my($chan, $mtx, $pri, $wmesg, $bt, $pr, $flags) = @_;
    	    eval q( &_sleep(($chan), ($mtx)-> &lock_object, ($pri), ($wmesg), ($bt), ($pr), ($flags)));
	}' unless defined(&msleep_sbt);
	eval 'sub msleep_spin {
	    my($chan, $mtx, $wmesg, $timo) = @_;
    	    eval q( &msleep_spin_sbt(($chan), ($mtx), ($wmesg),  &tick_sbt * ($timo), 0,  &C_HARDCLOCK));
	}' unless defined(&msleep_spin);
	eval 'sub pause {
	    my($wmesg,$timo) = @_;
    	    eval q({ ( &pause_sbt($wmesg,  &tick_sbt * $timo, 0,  &C_HARDCLOCK)); });
	}' unless defined(&pause);
	eval 'sub pause_sig {
	    my($wmesg, $timo) = @_;
    	    eval q( &pause_sbt(($wmesg),  &tick_sbt * ($timo), 0,  &C_HARDCLOCK |  &C_CATCH));
	}' unless defined(&pause_sig);
	eval 'sub tsleep {
	    my($chan, $pri, $wmesg, $timo) = @_;
    	    eval q( &_sleep(($chan),  &NULL, ($pri), ($wmesg),  &tick_sbt * ($timo), 0,  &C_HARDCLOCK));
	}' unless defined(&tsleep);
	eval 'sub tsleep_sbt {
	    my($chan, $pri, $wmesg, $bt, $pr, $flags) = @_;
    	    eval q( &_sleep(($chan),  &NULL, ($pri), ($wmesg), ($bt), ($pr), ($flags)));
	}' unless defined(&tsleep_sbt);
	if(defined(&__LP64__)) {
	}
	eval 'sub UNR_NO_MTX () {(( &void *)( &uintptr_t)-1);}' unless defined(&UNR_NO_MTX);
	eval 'sub new_unrhdr64 {
	    my($unr64,$low) = @_;
    	    eval q({  ($unr64->{counter}) = $low; });
	}' unless defined(&new_unrhdr64);
	eval 'sub alloc_unr64 {
	    my($unr64) = @_;
    	    eval q({ ( &atomic_fetchadd_64( ($unr64->{counter}), 1)); });
	}' unless defined(&alloc_unr64);
	if(defined(&NO_OBSOLETE_CODE)) {
	    eval 'sub __gone_ok {
	        my($m, $msg) = @_;
    		eval q( &_Static_assert($m <  &P_OSREL_MAJOR( &__FreeBSD_version)), \\"Obsolete code: \\" $msg););
	    }' unless defined(&__gone_ok);
	} else {
	    eval 'sub __gone_ok {
	        my($m, $msg) = @_;
    		eval q();
	    }' unless defined(&__gone_ok);
	}
	eval 'sub gone_in {
	    my($major, $msg) = @_;
    	    eval q( &__gone_ok($major, $msg)  &_gone_in($major, $msg));
	}' unless defined(&gone_in);
	eval 'sub gone_in_dev {
	    my($dev, $major, $msg) = @_;
    	    eval q( &__gone_ok($major, $msg)  &_gone_in_dev($dev, $major, $msg));
	}' unless defined(&gone_in_dev);
	if(defined(&INVARIANTS)) {
	    eval 'sub __diagused () {1;}' unless defined(&__diagused);
	} else {
	    eval 'sub __diagused () { &__unused;}' unless defined(&__diagused);
	}
	if(defined(&WITNESS)) {
	    eval 'sub __witness_used () {1;}' unless defined(&__witness_used);
	} else {
	    eval 'sub __witness_used () { &__unused;}' unless defined(&__witness_used);
	}
    }
}
1;

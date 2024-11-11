require '_h2ph_pre.ph';

no warnings qw(redefine misc);

unless(defined(&_SYS_UNISTD_H_)) {
    eval 'sub _SYS_UNISTD_H_ () {1;}' unless defined(&_SYS_UNISTD_H_);
    require 'sys/cdefs.ph';
    eval 'sub _POSIX_ADVISORY_INFO () {200112;}' unless defined(&_POSIX_ADVISORY_INFO);
    eval 'sub _POSIX_ASYNCHRONOUS_IO () {200112;}' unless defined(&_POSIX_ASYNCHRONOUS_IO);
    eval 'sub _POSIX_CHOWN_RESTRICTED () {1;}' unless defined(&_POSIX_CHOWN_RESTRICTED);
    eval 'sub _POSIX_CLOCK_SELECTION () {(-1);}' unless defined(&_POSIX_CLOCK_SELECTION);
    eval 'sub _POSIX_CPUTIME () {200112;}' unless defined(&_POSIX_CPUTIME);
    eval 'sub _POSIX_FSYNC () {200112;}' unless defined(&_POSIX_FSYNC);
    eval 'sub _POSIX_IPV6 () {0;}' unless defined(&_POSIX_IPV6);
    eval 'sub _POSIX_JOB_CONTROL () {1;}' unless defined(&_POSIX_JOB_CONTROL);
    eval 'sub _POSIX_MAPPED_FILES () {200112;}' unless defined(&_POSIX_MAPPED_FILES);
    eval 'sub _POSIX_MEMLOCK () {(-1);}' unless defined(&_POSIX_MEMLOCK);
    eval 'sub _POSIX_MEMLOCK_RANGE () {200112;}' unless defined(&_POSIX_MEMLOCK_RANGE);
    eval 'sub _POSIX_MEMORY_PROTECTION () {200112;}' unless defined(&_POSIX_MEMORY_PROTECTION);
    eval 'sub _POSIX_MESSAGE_PASSING () {200112;}' unless defined(&_POSIX_MESSAGE_PASSING);
    eval 'sub _POSIX_MONOTONIC_CLOCK () {200112;}' unless defined(&_POSIX_MONOTONIC_CLOCK);
    eval 'sub _POSIX_NO_TRUNC () {1;}' unless defined(&_POSIX_NO_TRUNC);
    eval 'sub _POSIX_PRIORITIZED_IO () {(-1);}' unless defined(&_POSIX_PRIORITIZED_IO);
    eval 'sub _POSIX_PRIORITY_SCHEDULING () {0;}' unless defined(&_POSIX_PRIORITY_SCHEDULING);
    eval 'sub _POSIX_RAW_SOCKETS () {200112;}' unless defined(&_POSIX_RAW_SOCKETS);
    eval 'sub _POSIX_REALTIME_SIGNALS () {200112;}' unless defined(&_POSIX_REALTIME_SIGNALS);
    eval 'sub _POSIX_SEMAPHORES () {200112;}' unless defined(&_POSIX_SEMAPHORES);
    eval 'sub _POSIX_SHARED_MEMORY_OBJECTS () {200112;}' unless defined(&_POSIX_SHARED_MEMORY_OBJECTS);
    eval 'sub _POSIX_SPORADIC_SERVER () {(-1);}' unless defined(&_POSIX_SPORADIC_SERVER);
    eval 'sub _POSIX_SYNCHRONIZED_IO () {(-1);}' unless defined(&_POSIX_SYNCHRONIZED_IO);
    eval 'sub _POSIX_TIMEOUTS () {200112;}' unless defined(&_POSIX_TIMEOUTS);
    eval 'sub _POSIX_TIMERS () {200112;}' unless defined(&_POSIX_TIMERS);
    eval 'sub _POSIX_TYPED_MEMORY_OBJECTS () {(-1);}' unless defined(&_POSIX_TYPED_MEMORY_OBJECTS);
    eval 'sub _POSIX_VDISABLE () {0xff;}' unless defined(&_POSIX_VDISABLE);
    if((defined(&__XSI_VISIBLE) ? &__XSI_VISIBLE : undef)) {
	eval 'sub _XOPEN_SHM () {1;}' unless defined(&_XOPEN_SHM);
	eval 'sub _XOPEN_STREAMS () {(-1);}' unless defined(&_XOPEN_STREAMS);
    }
    if(defined(&_NOT_AVAILABLE)) {
	eval 'sub _POSIX_SAVED_IDS () {1;}' unless defined(&_POSIX_SAVED_IDS);
    }
    eval 'sub _POSIX_VERSION () {200112;}' unless defined(&_POSIX_VERSION);
    eval 'sub F_OK () {0;}' unless defined(&F_OK);
    eval 'sub X_OK () {0x1;}' unless defined(&X_OK);
    eval 'sub W_OK () {0x2;}' unless defined(&W_OK);
    eval 'sub R_OK () {0x4;}' unless defined(&R_OK);
    unless(defined(&SEEK_SET)) {
	eval 'sub SEEK_SET () {0;}' unless defined(&SEEK_SET);
	eval 'sub SEEK_CUR () {1;}' unless defined(&SEEK_CUR);
	eval 'sub SEEK_END () {2;}' unless defined(&SEEK_END);
    }
    if((defined(&__BSD_VISIBLE) ? &__BSD_VISIBLE : undef)) {
	eval 'sub SEEK_DATA () {3;}' unless defined(&SEEK_DATA);
	eval 'sub SEEK_HOLE () {4;}' unless defined(&SEEK_HOLE);
    }
    unless(defined(&_POSIX_SOURCE)) {
	eval 'sub L_SET () { &SEEK_SET;}' unless defined(&L_SET);
	eval 'sub L_INCR () { &SEEK_CUR;}' unless defined(&L_INCR);
	eval 'sub L_XTND () { &SEEK_END;}' unless defined(&L_XTND);
    }
    eval 'sub _PC_LINK_MAX () {1;}' unless defined(&_PC_LINK_MAX);
    eval 'sub _PC_MAX_CANON () {2;}' unless defined(&_PC_MAX_CANON);
    eval 'sub _PC_MAX_INPUT () {3;}' unless defined(&_PC_MAX_INPUT);
    eval 'sub _PC_NAME_MAX () {4;}' unless defined(&_PC_NAME_MAX);
    eval 'sub _PC_PATH_MAX () {5;}' unless defined(&_PC_PATH_MAX);
    eval 'sub _PC_PIPE_BUF () {6;}' unless defined(&_PC_PIPE_BUF);
    eval 'sub _PC_CHOWN_RESTRICTED () {7;}' unless defined(&_PC_CHOWN_RESTRICTED);
    eval 'sub _PC_NO_TRUNC () {8;}' unless defined(&_PC_NO_TRUNC);
    eval 'sub _PC_VDISABLE () {9;}' unless defined(&_PC_VDISABLE);
    if((defined(&__POSIX_VISIBLE) ? &__POSIX_VISIBLE : undef) >= 199309) {
	eval 'sub _PC_ASYNC_IO () {53;}' unless defined(&_PC_ASYNC_IO);
	eval 'sub _PC_PRIO_IO () {54;}' unless defined(&_PC_PRIO_IO);
	eval 'sub _PC_SYNC_IO () {55;}' unless defined(&_PC_SYNC_IO);
    }
    if((defined(&__POSIX_VISIBLE) ? &__POSIX_VISIBLE : undef) >= 200112) {
	eval 'sub _PC_ALLOC_SIZE_MIN () {10;}' unless defined(&_PC_ALLOC_SIZE_MIN);
	eval 'sub _PC_FILESIZEBITS () {12;}' unless defined(&_PC_FILESIZEBITS);
	eval 'sub _PC_REC_INCR_XFER_SIZE () {14;}' unless defined(&_PC_REC_INCR_XFER_SIZE);
	eval 'sub _PC_REC_MAX_XFER_SIZE () {15;}' unless defined(&_PC_REC_MAX_XFER_SIZE);
	eval 'sub _PC_REC_MIN_XFER_SIZE () {16;}' unless defined(&_PC_REC_MIN_XFER_SIZE);
	eval 'sub _PC_REC_XFER_ALIGN () {17;}' unless defined(&_PC_REC_XFER_ALIGN);
	eval 'sub _PC_SYMLINK_MAX () {18;}' unless defined(&_PC_SYMLINK_MAX);
    }
    if((defined(&__BSD_VISIBLE) ? &__BSD_VISIBLE : undef)) {
	eval 'sub _PC_ACL_EXTENDED () {59;}' unless defined(&_PC_ACL_EXTENDED);
	eval 'sub _PC_ACL_PATH_MAX () {60;}' unless defined(&_PC_ACL_PATH_MAX);
	eval 'sub _PC_CAP_PRESENT () {61;}' unless defined(&_PC_CAP_PRESENT);
	eval 'sub _PC_INF_PRESENT () {62;}' unless defined(&_PC_INF_PRESENT);
	eval 'sub _PC_MAC_PRESENT () {63;}' unless defined(&_PC_MAC_PRESENT);
	eval 'sub _PC_ACL_NFS4 () {64;}' unless defined(&_PC_ACL_NFS4);
	eval 'sub _PC_DEALLOC_PRESENT () {65;}' unless defined(&_PC_DEALLOC_PRESENT);
    }
    eval 'sub _PC_MIN_HOLE_SIZE () {21;}' unless defined(&_PC_MIN_HOLE_SIZE);
    if((defined(&__BSD_VISIBLE) ? &__BSD_VISIBLE : undef)) {
	eval 'sub RFNAMEG () {(1<<0);}' unless defined(&RFNAMEG);
	eval 'sub RFENVG () {(1<<1);}' unless defined(&RFENVG);
	eval 'sub RFFDG () {(1<<2);}' unless defined(&RFFDG);
	eval 'sub RFNOTEG () {(1<<3);}' unless defined(&RFNOTEG);
	eval 'sub RFPROC () {(1<<4);}' unless defined(&RFPROC);
	eval 'sub RFMEM () {(1<<5);}' unless defined(&RFMEM);
	eval 'sub RFNOWAIT () {(1<<6);}' unless defined(&RFNOWAIT);
	eval 'sub RFCNAMEG () {(1<<10);}' unless defined(&RFCNAMEG);
	eval 'sub RFCENVG () {(1<<11);}' unless defined(&RFCENVG);
	eval 'sub RFCFDG () {(1<<12);}' unless defined(&RFCFDG);
	eval 'sub RFTHREAD () {(1<<13);}' unless defined(&RFTHREAD);
	eval 'sub RFSIGSHARE () {(1<<14);}' unless defined(&RFSIGSHARE);
	eval 'sub RFLINUXTHPN () {(1<<16);}' unless defined(&RFLINUXTHPN);
	eval 'sub RFSTOPPED () {(1<<17);}' unless defined(&RFSTOPPED);
	eval 'sub RFHIGHPID () {(1<<18);}' unless defined(&RFHIGHPID);
	eval 'sub RFTSIGZMB () {(1<<19);}' unless defined(&RFTSIGZMB);
	eval 'sub RFTSIGSHIFT () {20;}' unless defined(&RFTSIGSHIFT);
	eval 'sub RFTSIGMASK () {0xff;}' unless defined(&RFTSIGMASK);
	eval 'sub RFTSIGNUM {
	    my($flags) = @_;
    	    eval q(((($flags) >>  &RFTSIGSHIFT) &  &RFTSIGMASK));
	}' unless defined(&RFTSIGNUM);
	eval 'sub RFTSIGFLAGS {
	    my($signum) = @_;
    	    eval q((($signum) <<  &RFTSIGSHIFT));
	}' unless defined(&RFTSIGFLAGS);
	eval 'sub RFPROCDESC () {(1<<28);}' unless defined(&RFPROCDESC);
	eval 'sub RFPPWAIT () {(1<<31);}' unless defined(&RFPPWAIT);
	eval 'sub RFSPAWN () {(1<<31);}' unless defined(&RFSPAWN);
	eval 'sub RFFLAGS () {( &RFFDG |  &RFPROC |  &RFMEM |  &RFNOWAIT |  &RFCFDG |  &RFTHREAD |  &RFSIGSHARE |  &RFLINUXTHPN |  &RFSTOPPED |  &RFHIGHPID |  &RFTSIGZMB |  &RFPROCDESC |  &RFSPAWN |  &RFPPWAIT);}' unless defined(&RFFLAGS);
	eval 'sub RFKERNELONLY () {( &RFSTOPPED |  &RFHIGHPID |  &RFPROCDESC);}' unless defined(&RFKERNELONLY);
	eval 'sub KCMP_FILE () {100;}' unless defined(&KCMP_FILE);
	eval 'sub KCMP_FILEOBJ () {101;}' unless defined(&KCMP_FILEOBJ);
	eval 'sub KCMP_FILES () {102;}' unless defined(&KCMP_FILES);
	eval 'sub KCMP_SIGHAND () {103;}' unless defined(&KCMP_SIGHAND);
	eval 'sub KCMP_VM () {104;}' unless defined(&KCMP_VM);
	eval 'sub SWAPOFF_FORCE () {0x1;}' unless defined(&SWAPOFF_FORCE);
	eval 'sub CLOSE_RANGE_CLOEXEC () {(1<<2);}' unless defined(&CLOSE_RANGE_CLOEXEC);
    }
}
1;

require '_h2ph_pre.ph';

no warnings qw(redefine misc);

unless(defined(&_SYS_RESOURCE_H_)) {
    eval 'sub _SYS_RESOURCE_H_ () {1;}' unless defined(&_SYS_RESOURCE_H_);
    require 'sys/cdefs.ph';
    require 'sys/_timeval.ph';
    require 'sys/_types.ph';
    unless(defined(&_ID_T_DECLARED)) {
	eval 'sub _ID_T_DECLARED () {1;}' unless defined(&_ID_T_DECLARED);
    }
    unless(defined(&_RLIM_T_DECLARED)) {
	eval 'sub _RLIM_T_DECLARED () {1;}' unless defined(&_RLIM_T_DECLARED);
    }
    eval 'sub PRIO_MIN () {-20;}' unless defined(&PRIO_MIN);
    eval 'sub PRIO_MAX () {20;}' unless defined(&PRIO_MAX);
    eval 'sub PRIO_PROCESS () {0;}' unless defined(&PRIO_PROCESS);
    eval 'sub PRIO_PGRP () {1;}' unless defined(&PRIO_PGRP);
    eval 'sub PRIO_USER () {2;}' unless defined(&PRIO_USER);
    eval 'sub RUSAGE_SELF () {0;}' unless defined(&RUSAGE_SELF);
    eval 'sub RUSAGE_CHILDREN () {-1;}' unless defined(&RUSAGE_CHILDREN);
    eval 'sub RUSAGE_THREAD () {1;}' unless defined(&RUSAGE_THREAD);
    eval 'sub ru_first () { &ru_ixrss;}' unless defined(&ru_first);
    eval 'sub ru_last () { &ru_nivcsw;}' unless defined(&ru_last);
    if((defined(&__BSD_VISIBLE) ? &__BSD_VISIBLE : undef)) {
    }
    eval 'sub RLIMIT_CPU () {0;}' unless defined(&RLIMIT_CPU);
    eval 'sub RLIMIT_FSIZE () {1;}' unless defined(&RLIMIT_FSIZE);
    eval 'sub RLIMIT_DATA () {2;}' unless defined(&RLIMIT_DATA);
    eval 'sub RLIMIT_STACK () {3;}' unless defined(&RLIMIT_STACK);
    eval 'sub RLIMIT_CORE () {4;}' unless defined(&RLIMIT_CORE);
    eval 'sub RLIMIT_RSS () {5;}' unless defined(&RLIMIT_RSS);
    eval 'sub RLIMIT_MEMLOCK () {6;}' unless defined(&RLIMIT_MEMLOCK);
    eval 'sub RLIMIT_NPROC () {7;}' unless defined(&RLIMIT_NPROC);
    eval 'sub RLIMIT_NOFILE () {8;}' unless defined(&RLIMIT_NOFILE);
    eval 'sub RLIMIT_SBSIZE () {9;}' unless defined(&RLIMIT_SBSIZE);
    eval 'sub RLIMIT_VMEM () {10;}' unless defined(&RLIMIT_VMEM);
    eval 'sub RLIMIT_AS () { &RLIMIT_VMEM;}' unless defined(&RLIMIT_AS);
    eval 'sub RLIMIT_NPTS () {11;}' unless defined(&RLIMIT_NPTS);
    eval 'sub RLIMIT_SWAP () {12;}' unless defined(&RLIMIT_SWAP);
    eval 'sub RLIMIT_KQUEUES () {13;}' unless defined(&RLIMIT_KQUEUES);
    eval 'sub RLIMIT_UMTXP () {14;}' unless defined(&RLIMIT_UMTXP);
    eval 'sub RLIM_NLIMITS () {15;}' unless defined(&RLIM_NLIMITS);
    eval 'sub RLIM_INFINITY () {(( &rlim_t)((( &__uint64_t)1<< 63) - 1));}' unless defined(&RLIM_INFINITY);
    eval 'sub RLIM_SAVED_MAX () { &RLIM_INFINITY;}' unless defined(&RLIM_SAVED_MAX);
    eval 'sub RLIM_SAVED_CUR () { &RLIM_INFINITY;}' unless defined(&RLIM_SAVED_CUR);
    if(defined(&_RLIMIT_IDENT)) {
    }
    if((defined(&__BSD_VISIBLE) ? &__BSD_VISIBLE : undef)) {
	eval 'sub CP_USER () {0;}' unless defined(&CP_USER);
	eval 'sub CP_NICE () {1;}' unless defined(&CP_NICE);
	eval 'sub CP_SYS () {2;}' unless defined(&CP_SYS);
	eval 'sub CP_INTR () {3;}' unless defined(&CP_INTR);
	eval 'sub CP_IDLE () {4;}' unless defined(&CP_IDLE);
	eval 'sub CPUSTATES () {5;}' unless defined(&CPUSTATES);
    }
    if(defined(&_KERNEL)) {
    } else {
    }
}
1;

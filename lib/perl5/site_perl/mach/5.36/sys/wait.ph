require '_h2ph_pre.ph';

no warnings qw(redefine misc);

unless(defined(&_SYS_WAIT_H_)) {
    eval 'sub _SYS_WAIT_H_ () {1;}' unless defined(&_SYS_WAIT_H_);
    require 'sys/cdefs.ph';
    if((defined(&__BSD_VISIBLE) ? &__BSD_VISIBLE : undef)) {
	eval 'sub WCOREFLAG () {0200;}' unless defined(&WCOREFLAG);
    }
    eval 'sub _W_INT {
        my($i) = @_;
	    eval q(($i));
    }' unless defined(&_W_INT);
    eval 'sub _WSTATUS {
        my($x) = @_;
	    eval q(( &_W_INT($x) & 0177));
    }' unless defined(&_WSTATUS);
    eval 'sub _WSTOPPED () {0177;}' unless defined(&_WSTOPPED);
    eval 'sub WIFSTOPPED {
        my($x) = @_;
	    eval q(( &_WSTATUS($x) ==  &_WSTOPPED));
    }' unless defined(&WIFSTOPPED);
    eval 'sub WSTOPSIG {
        my($x) = @_;
	    eval q(( &_W_INT($x) >> 8));
    }' unless defined(&WSTOPSIG);
    eval 'sub WIFSIGNALED {
        my($x) = @_;
	    eval q(( &_WSTATUS($x) !=  &_WSTOPPED  &&  &_WSTATUS($x) != 0 && ($x) != 0x13));
    }' unless defined(&WIFSIGNALED);
    eval 'sub WTERMSIG {
        my($x) = @_;
	    eval q(( &_WSTATUS($x)));
    }' unless defined(&WTERMSIG);
    eval 'sub WIFEXITED {
        my($x) = @_;
	    eval q(( &_WSTATUS($x) == 0));
    }' unless defined(&WIFEXITED);
    eval 'sub WEXITSTATUS {
        my($x) = @_;
	    eval q(( &_W_INT($x) >> 8));
    }' unless defined(&WEXITSTATUS);
    eval 'sub WIFCONTINUED {
        my($x) = @_;
	    eval q(($x == 0x13));
    }' unless defined(&WIFCONTINUED);
    if((defined(&__BSD_VISIBLE) ? &__BSD_VISIBLE : undef)) {
	eval 'sub WCOREDUMP {
	    my($x) = @_;
    	    eval q(( &_W_INT($x) &  &WCOREFLAG));
	}' unless defined(&WCOREDUMP);
	eval 'sub W_EXITCODE {
	    my($ret, $sig) = @_;
    	    eval q((($ret) << 8| ($sig)));
	}' unless defined(&W_EXITCODE);
	eval 'sub W_STOPCODE {
	    my($sig) = @_;
    	    eval q((($sig) << 8|  &_WSTOPPED));
	}' unless defined(&W_STOPCODE);
    }
    eval 'sub WNOHANG () {1;}' unless defined(&WNOHANG);
    eval 'sub WUNTRACED () {2;}' unless defined(&WUNTRACED);
    eval 'sub WSTOPPED () { &WUNTRACED;}' unless defined(&WSTOPPED);
    eval 'sub WCONTINUED () {4;}' unless defined(&WCONTINUED);
    eval 'sub WNOWAIT () {8;}' unless defined(&WNOWAIT);
    eval 'sub WEXITED () {16;}' unless defined(&WEXITED);
    eval 'sub WTRAPPED () {32;}' unless defined(&WTRAPPED);
    if((defined(&__BSD_VISIBLE) ? &__BSD_VISIBLE : undef)) {
	eval 'sub WLINUXCLONE () {0x80000000;}' unless defined(&WLINUXCLONE);
    }
    unless(defined(&_IDTYPE_T_DECLARED)) {
	eval("sub P_PID () { 0; }") unless defined(&P_PID);
	eval("sub P_PPID () { 1; }") unless defined(&P_PPID);
	eval("sub P_PGID () { 2; }") unless defined(&P_PGID);
	eval("sub P_SID () { 3; }") unless defined(&P_SID);
	eval("sub P_CID () { 4; }") unless defined(&P_CID);
	eval("sub P_UID () { 5; }") unless defined(&P_UID);
	eval("sub P_GID () { 6; }") unless defined(&P_GID);
	eval("sub P_ALL () { 7; }") unless defined(&P_ALL);
	eval("sub P_LWPID () { 8; }") unless defined(&P_LWPID);
	eval("sub P_TASKID () { 9; }") unless defined(&P_TASKID);
	eval("sub P_PROJID () { 10; }") unless defined(&P_PROJID);
	eval("sub P_POOLID () { 11; }") unless defined(&P_POOLID);
	eval("sub P_JAILID () { 12; }") unless defined(&P_JAILID);
	eval("sub P_CTID () { 13; }") unless defined(&P_CTID);
	eval("sub P_CPUID () { 14; }") unless defined(&P_CPUID);
	eval("sub P_PSETID () { 15; }") unless defined(&P_PSETID);
	if((defined(&__BSD_VISIBLE) ? &__BSD_VISIBLE : undef)) {
	    eval 'sub P_ZONEID () { &P_JAILID;}' unless defined(&P_ZONEID);
	}
	eval 'sub _IDTYPE_T_DECLARED () {1;}' unless defined(&_IDTYPE_T_DECLARED);
    }
    if((defined(&__BSD_VISIBLE) ? &__BSD_VISIBLE : undef)) {
	eval 'sub WAIT_ANY () {(-1);}' unless defined(&WAIT_ANY);
	eval 'sub WAIT_MYPGRP () {0;}' unless defined(&WAIT_MYPGRP);
    }
    if(defined(&_KERNEL) || defined(&_WANT_KW_EXITCODE)) {
	eval 'sub KW_EXITCODE {
	    my($ret, $sig) = @_;
    	    eval q( &W_EXITCODE(($ret) & 0xff, ($sig)));
	}' unless defined(&KW_EXITCODE);
    }
    unless(defined(&_KERNEL)) {
	require 'sys/types.ph';
	if((defined(&__POSIX_VISIBLE) ? &__POSIX_VISIBLE : undef) >= 200112) {
	}
	if((defined(&__BSD_VISIBLE) ? &__BSD_VISIBLE : undef)) {
	}
    }
}
1;

require '_h2ph_pre.ph';

no warnings qw(redefine misc);

unless(defined(&_RCTL_H_)) {
    eval 'sub _RCTL_H_ () {1;}' unless defined(&_RCTL_H_);
    require 'sys/cdefs.ph';
    require 'sys/queue.ph';
    require 'sys/types.ph';
    require 'sys/_task.ph';
    if(defined(&_KERNEL)) {
	eval 'sub RCTL_SUBJECT_TYPE_UNDEFINED () {-1;}' unless defined(&RCTL_SUBJECT_TYPE_UNDEFINED);
	eval 'sub RCTL_SUBJECT_TYPE_PROCESS () {0x;}' unless defined(&RCTL_SUBJECT_TYPE_PROCESS);
	eval 'sub RCTL_SUBJECT_TYPE_USER () {0x1;}' unless defined(&RCTL_SUBJECT_TYPE_USER);
	eval 'sub RCTL_SUBJECT_TYPE_LOGINCLASS () {0x3;}' unless defined(&RCTL_SUBJECT_TYPE_LOGINCLASS);
	eval 'sub RCTL_SUBJECT_TYPE_JAIL () {0x4;}' unless defined(&RCTL_SUBJECT_TYPE_JAIL);
	eval 'sub RCTL_SUBJECT_TYPE_MAX () { &RCTL_SUBJECT_TYPE_JAIL;}' unless defined(&RCTL_SUBJECT_TYPE_MAX);
	eval 'sub RCTL_ACTION_UNDEFINED () {-1;}' unless defined(&RCTL_ACTION_UNDEFINED);
	eval 'sub RCTL_ACTION_SIGHUP () { &SIGHUP;}' unless defined(&RCTL_ACTION_SIGHUP);
	eval 'sub RCTL_ACTION_SIGINT () { &SIGINT;}' unless defined(&RCTL_ACTION_SIGINT);
	eval 'sub RCTL_ACTION_SIGQUIT () { &SIGQUIT;}' unless defined(&RCTL_ACTION_SIGQUIT);
	eval 'sub RCTL_ACTION_SIGILL () { &SIGILL;}' unless defined(&RCTL_ACTION_SIGILL);
	eval 'sub RCTL_ACTION_SIGTRAP () { &SIGTRAP;}' unless defined(&RCTL_ACTION_SIGTRAP);
	eval 'sub RCTL_ACTION_SIGABRT () { &SIGABRT;}' unless defined(&RCTL_ACTION_SIGABRT);
	eval 'sub RCTL_ACTION_SIGEMT () { &SIGEMT;}' unless defined(&RCTL_ACTION_SIGEMT);
	eval 'sub RCTL_ACTION_SIGFPE () { &SIGFPE;}' unless defined(&RCTL_ACTION_SIGFPE);
	eval 'sub RCTL_ACTION_SIGKILL () { &SIGKILL;}' unless defined(&RCTL_ACTION_SIGKILL);
	eval 'sub RCTL_ACTION_SIGBUS () { &SIGBUS;}' unless defined(&RCTL_ACTION_SIGBUS);
	eval 'sub RCTL_ACTION_SIGSEGV () { &SIGSEGV;}' unless defined(&RCTL_ACTION_SIGSEGV);
	eval 'sub RCTL_ACTION_SIGSYS () { &SIGSYS;}' unless defined(&RCTL_ACTION_SIGSYS);
	eval 'sub RCTL_ACTION_SIGPIPE () { &SIGPIPE;}' unless defined(&RCTL_ACTION_SIGPIPE);
	eval 'sub RCTL_ACTION_SIGALRM () { &SIGALRM;}' unless defined(&RCTL_ACTION_SIGALRM);
	eval 'sub RCTL_ACTION_SIGTERM () { &SIGTERM;}' unless defined(&RCTL_ACTION_SIGTERM);
	eval 'sub RCTL_ACTION_SIGURG () { &SIGURG;}' unless defined(&RCTL_ACTION_SIGURG);
	eval 'sub RCTL_ACTION_SIGSTOP () { &SIGSTOP;}' unless defined(&RCTL_ACTION_SIGSTOP);
	eval 'sub RCTL_ACTION_SIGTSTP () { &SIGTSTP;}' unless defined(&RCTL_ACTION_SIGTSTP);
	eval 'sub RCTL_ACTION_SIGCHLD () { &SIGCHLD;}' unless defined(&RCTL_ACTION_SIGCHLD);
	eval 'sub RCTL_ACTION_SIGTTIN () { &SIGTTIN;}' unless defined(&RCTL_ACTION_SIGTTIN);
	eval 'sub RCTL_ACTION_SIGTTOU () { &SIGTTOU;}' unless defined(&RCTL_ACTION_SIGTTOU);
	eval 'sub RCTL_ACTION_SIGIO () { &SIGIO;}' unless defined(&RCTL_ACTION_SIGIO);
	eval 'sub RCTL_ACTION_SIGXCPU () { &SIGXCPU;}' unless defined(&RCTL_ACTION_SIGXCPU);
	eval 'sub RCTL_ACTION_SIGXFSZ () { &SIGXFSZ;}' unless defined(&RCTL_ACTION_SIGXFSZ);
	eval 'sub RCTL_ACTION_SIGVTALRM () { &SIGVTALRM;}' unless defined(&RCTL_ACTION_SIGVTALRM);
	eval 'sub RCTL_ACTION_SIGPROF () { &SIGPROF;}' unless defined(&RCTL_ACTION_SIGPROF);
	eval 'sub RCTL_ACTION_SIGWINCH () { &SIGWINCH;}' unless defined(&RCTL_ACTION_SIGWINCH);
	eval 'sub RCTL_ACTION_SIGINFO () { &SIGINFO;}' unless defined(&RCTL_ACTION_SIGINFO);
	eval 'sub RCTL_ACTION_SIGUSR1 () { &SIGUSR1;}' unless defined(&RCTL_ACTION_SIGUSR1);
	eval 'sub RCTL_ACTION_SIGUSR2 () { &SIGUSR2;}' unless defined(&RCTL_ACTION_SIGUSR2);
	eval 'sub RCTL_ACTION_SIGTHR () { &SIGTHR;}' unless defined(&RCTL_ACTION_SIGTHR);
	eval 'sub RCTL_ACTION_SIGNAL_MAX () { &RCTL_ACTION_SIGTHR;}' unless defined(&RCTL_ACTION_SIGNAL_MAX);
	eval 'sub RCTL_ACTION_DENY () {( &RCTL_ACTION_SIGNAL_MAX + 1);}' unless defined(&RCTL_ACTION_DENY);
	eval 'sub RCTL_ACTION_LOG () {( &RCTL_ACTION_SIGNAL_MAX + 2);}' unless defined(&RCTL_ACTION_LOG);
	eval 'sub RCTL_ACTION_DEVCTL () {( &RCTL_ACTION_SIGNAL_MAX + 3);}' unless defined(&RCTL_ACTION_DEVCTL);
	eval 'sub RCTL_ACTION_THROTTLE () {( &RCTL_ACTION_SIGNAL_MAX + 4);}' unless defined(&RCTL_ACTION_THROTTLE);
	eval 'sub RCTL_ACTION_MAX () { &RCTL_ACTION_THROTTLE;}' unless defined(&RCTL_ACTION_MAX);
	eval 'sub RCTL_AMOUNT_UNDEFINED () {-1;}' unless defined(&RCTL_AMOUNT_UNDEFINED);
    } else {
    }
}
1;

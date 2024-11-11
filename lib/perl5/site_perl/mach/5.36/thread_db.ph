require '_h2ph_pre.ph';

no warnings qw(redefine misc);

unless(defined(&_THREAD_DB_H_)) {
    eval 'sub _THREAD_DB_H_ () {1;}' unless defined(&_THREAD_DB_H_);
    require 'sys/procfs.ph';
    require 'pthread.ph';
    eval("sub TD_ERR () { -1; }") unless defined(&TD_ERR);
    eval("sub TD_OK () { 0; }") unless defined(&TD_OK);
    eval("sub TD_BADKEY () { 1; }") unless defined(&TD_BADKEY);
    eval("sub TD_BADPH () { 2; }") unless defined(&TD_BADPH);
    eval("sub TD_BADSH () { 3; }") unless defined(&TD_BADSH);
    eval("sub TD_BADTA () { 4; }") unless defined(&TD_BADTA);
    eval("sub TD_BADTH () { 5; }") unless defined(&TD_BADTH);
    eval("sub TD_DBERR () { 6; }") unless defined(&TD_DBERR);
    eval("sub TD_MALLOC () { 7; }") unless defined(&TD_MALLOC);
    eval("sub TD_NOAPLIC () { 8; }") unless defined(&TD_NOAPLIC);
    eval("sub TD_NOCAPAB () { 9; }") unless defined(&TD_NOCAPAB);
    eval("sub TD_NOEVENT () { 10; }") unless defined(&TD_NOEVENT);
    eval("sub TD_NOFPREGS () { 11; }") unless defined(&TD_NOFPREGS);
    eval("sub TD_NOLIBTHREAD () { 12; }") unless defined(&TD_NOLIBTHREAD);
    eval("sub TD_NOLWP () { 13; }") unless defined(&TD_NOLWP);
    eval("sub TD_NOMSG () { 14; }") unless defined(&TD_NOMSG);
    eval("sub TD_NOSV () { 15; }") unless defined(&TD_NOSV);
    eval("sub TD_NOTHR () { 16; }") unless defined(&TD_NOTHR);
    eval("sub TD_NOTSD () { 17; }") unless defined(&TD_NOTSD);
    eval("sub TD_NOXREGS () { 18; }") unless defined(&TD_NOXREGS);
    eval("sub TD_PARTIALREG () { 19; }") unless defined(&TD_PARTIALREG);
    eval("sub TD_EVENT_NONE () { 0; }") unless defined(&TD_EVENT_NONE);
    eval("sub TD_CATCHSIG () { 0x0001; }") unless defined(&TD_CATCHSIG);
    eval("sub TD_CONCURRENCY () { 0x0002; }") unless defined(&TD_CONCURRENCY);
    eval("sub TD_CREATE () { 0x0004; }") unless defined(&TD_CREATE);
    eval("sub TD_DEATH () { 0x0008; }") unless defined(&TD_DEATH);
    eval("sub TD_IDLE () { 0x0010; }") unless defined(&TD_IDLE);
    eval("sub TD_LOCK_TRY () { 0x0020; }") unless defined(&TD_LOCK_TRY);
    eval("sub TD_PREEMPT () { 0x0040; }") unless defined(&TD_PREEMPT);
    eval("sub TD_PRI_INHERIT () { 0x0080; }") unless defined(&TD_PRI_INHERIT);
    eval("sub TD_READY () { 0x0100; }") unless defined(&TD_READY);
    eval("sub TD_REAP () { 0x0200; }") unless defined(&TD_REAP);
    eval("sub TD_SLEEP () { 0x0400; }") unless defined(&TD_SLEEP);
    eval("sub TD_SWITCHFROM () { 0x0800; }") unless defined(&TD_SWITCHFROM);
    eval("sub TD_SWITCHTO () { 0x1000; }") unless defined(&TD_SWITCHTO);
    eval("sub TD_TIMEOUT () { 0x2000; }") unless defined(&TD_TIMEOUT);
    eval("sub TD_ALL_EVENTS () { ~0; }") unless defined(&TD_ALL_EVENTS);
    eval 'sub td_event_e () { &td_thr_events_e;}' unless defined(&td_event_e);
    eval("sub NOTIFY_BPT () { 0; }") unless defined(&NOTIFY_BPT);
    eval("sub NOTIFY_AUTOBPT () { 1; }") unless defined(&NOTIFY_AUTOBPT);
    eval("sub NOTIFY_SYSCALL () { 2; }") unless defined(&NOTIFY_SYSCALL);
    eval 'sub td_event_addset {
        my($es,$e) = @_;
	    eval q({ *$es |= $e; });
    }' unless defined(&td_event_addset);
    eval 'sub td_event_delset {
        my($es,$e) = @_;
	    eval q({ *$es &= ~$e; });
    }' unless defined(&td_event_delset);
    eval 'sub td_event_emptyset {
        my($es) = @_;
	    eval q({ *$es =  &TD_EVENT_NONE; });
    }' unless defined(&td_event_emptyset);
    eval 'sub td_event_fillset {
        my($es) = @_;
	    eval q({ *$es =  &TD_ALL_EVENTS; });
    }' unless defined(&td_event_fillset);
    eval 'sub td_eventisempty {
        my($es) = @_;
	    eval q({ ((*$es ==  &TD_EVENT_NONE) ? 1: 0); });
    }' unless defined(&td_eventisempty);
    eval 'sub td_eventismember {
        my($es,$e) = @_;
	    eval q({ ((*$es & $e) ? 1: 0); });
    }' unless defined(&td_eventismember);
    eval("sub TD_THR_UNKNOWN () { -1; }") unless defined(&TD_THR_UNKNOWN);
    eval("sub TD_THR_ANY_STATE () { 0; }") unless defined(&TD_THR_ANY_STATE);
    eval("sub TD_THR_ACTIVE () { 1; }") unless defined(&TD_THR_ACTIVE);
    eval("sub TD_THR_RUN () { 2; }") unless defined(&TD_THR_RUN);
    eval("sub TD_THR_SLEEP () { 3; }") unless defined(&TD_THR_SLEEP);
    eval("sub TD_THR_STOPPED () { 4; }") unless defined(&TD_THR_STOPPED);
    eval("sub TD_THR_STOPPED_ASLEEP () { 5; }") unless defined(&TD_THR_STOPPED_ASLEEP);
    eval("sub TD_THR_ZOMBIE () { 6; }") unless defined(&TD_THR_ZOMBIE);
    eval("sub TD_THR_SYSTEM () { 1; }") unless defined(&TD_THR_SYSTEM);
    eval("sub TD_THR_USER () { 2; }") unless defined(&TD_THR_USER);
    eval 'sub TD_THR_ANY_USER_FLAGS () {0xffffffff;}' unless defined(&TD_THR_ANY_USER_FLAGS);
    eval 'sub TD_THR_LOWEST_PRIORITY () {-20;}' unless defined(&TD_THR_LOWEST_PRIORITY);
    eval 'sub TD_SIGNO_MASK () { &NULL;}' unless defined(&TD_SIGNO_MASK);
    if(defined(&__i386__)) {
    }
    if(defined(&__i386__)) {
    }
}
1;

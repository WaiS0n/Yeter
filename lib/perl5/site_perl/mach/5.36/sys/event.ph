require '_h2ph_pre.ph';

no warnings qw(redefine misc);

unless(defined(&_SYS_EVENT_H_)) {
    eval 'sub _SYS_EVENT_H_ () {1;}' unless defined(&_SYS_EVENT_H_);
    require 'sys/_types.ph';
    require 'sys/queue.ph';
    eval 'sub EVFILT_READ () {(-1);}' unless defined(&EVFILT_READ);
    eval 'sub EVFILT_WRITE () {(-2);}' unless defined(&EVFILT_WRITE);
    eval 'sub EVFILT_AIO () {(-3);}' unless defined(&EVFILT_AIO);
    eval 'sub EVFILT_VNODE () {(-4);}' unless defined(&EVFILT_VNODE);
    eval 'sub EVFILT_PROC () {(-5);}' unless defined(&EVFILT_PROC);
    eval 'sub EVFILT_SIGNAL () {(-6);}' unless defined(&EVFILT_SIGNAL);
    eval 'sub EVFILT_TIMER () {(-7);}' unless defined(&EVFILT_TIMER);
    eval 'sub EVFILT_PROCDESC () {(-8);}' unless defined(&EVFILT_PROCDESC);
    eval 'sub EVFILT_FS () {(-9);}' unless defined(&EVFILT_FS);
    eval 'sub EVFILT_LIO () {(-10);}' unless defined(&EVFILT_LIO);
    eval 'sub EVFILT_USER () {(-11);}' unless defined(&EVFILT_USER);
    eval 'sub EVFILT_SENDFILE () {(-12);}' unless defined(&EVFILT_SENDFILE);
    eval 'sub EVFILT_EMPTY () {(-13);}' unless defined(&EVFILT_EMPTY);
    eval 'sub EVFILT_SYSCOUNT () {13;}' unless defined(&EVFILT_SYSCOUNT);
    if(defined(&__STDC_VERSION__)  && (defined(&__STDC_VERSION__) ? &__STDC_VERSION__ : undef) >= 199901) {
	eval 'sub EV_SET {
	    my($kevp_, $a, $b, $c, $d, $e, $f) = @_;
    	    eval q( &do { *($kevp_) = { . &ident = ($a), . &filter = ($b), . &flags = ($c), . &fflags = ($d), . &data = ($e), . &udata = ($f), . &ext = {0}, }; }  &while (0));
	}' unless defined(&EV_SET);
    } else {
	eval 'sub EV_SET {
	    my($kevp_, $a, $b, $c, $d, $e, $f) = @_;
    	    eval q( &do { \'struct kevent\' * &kevp = ($kevp_); ( &kevp)-> &ident = ($a); ( &kevp)-> &filter = ($b); ( &kevp)-> &flags = ($c); ( &kevp)-> &fflags = ($d); ( &kevp)-> &data = ($e); ( &kevp)-> &udata = ($f); ( &kevp)-> $ext[0] = 0; ( &kevp)-> $ext[1] = 0; ( &kevp)-> $ext[2] = 0; ( &kevp)-> $ext[3] = 0; }  &while (0));
	}' unless defined(&EV_SET);
    }
    if(defined(&_WANT_FREEBSD11_KEVENT)) {
    }
    if(defined(&_WANT_KEVENT32) || (defined(&_KERNEL)  && defined(&__LP64__))) {
	unless(defined(&__amd64__)) {
	}
	unless(defined(&__amd64__)) {
	}
	if(defined(&_WANT_FREEBSD11_KEVENT)) {
	}
    }
    eval 'sub EV_ADD () {0x1;}' unless defined(&EV_ADD);
    eval 'sub EV_DELETE () {0x2;}' unless defined(&EV_DELETE);
    eval 'sub EV_ENABLE () {0x4;}' unless defined(&EV_ENABLE);
    eval 'sub EV_DISABLE () {0x8;}' unless defined(&EV_DISABLE);
    eval 'sub EV_FORCEONESHOT () {0x100;}' unless defined(&EV_FORCEONESHOT);
    eval 'sub EV_KEEPUDATA () {0x200;}' unless defined(&EV_KEEPUDATA);
    eval 'sub EV_ONESHOT () {0x10;}' unless defined(&EV_ONESHOT);
    eval 'sub EV_CLEAR () {0x20;}' unless defined(&EV_CLEAR);
    eval 'sub EV_RECEIPT () {0x40;}' unless defined(&EV_RECEIPT);
    eval 'sub EV_DISPATCH () {0x80;}' unless defined(&EV_DISPATCH);
    eval 'sub EV_SYSFLAGS () {0xf000;}' unless defined(&EV_SYSFLAGS);
    eval 'sub EV_DROP () {0x1000;}' unless defined(&EV_DROP);
    eval 'sub EV_FLAG1 () {0x2000;}' unless defined(&EV_FLAG1);
    eval 'sub EV_FLAG2 () {0x4000;}' unless defined(&EV_FLAG2);
    eval 'sub EV_EOF () {0x8000;}' unless defined(&EV_EOF);
    eval 'sub EV_ERROR () {0x4000;}' unless defined(&EV_ERROR);
    eval 'sub NOTE_FFNOP () {0x;}' unless defined(&NOTE_FFNOP);
    eval 'sub NOTE_FFAND () {0x40000000;}' unless defined(&NOTE_FFAND);
    eval 'sub NOTE_FFOR () {0x80000000;}' unless defined(&NOTE_FFOR);
    eval 'sub NOTE_FFCOPY () {0xc0000000;}' unless defined(&NOTE_FFCOPY);
    eval 'sub NOTE_FFCTRLMASK () {0xc0000000;}' unless defined(&NOTE_FFCTRLMASK);
    eval 'sub NOTE_FFLAGSMASK () {0xffffff;}' unless defined(&NOTE_FFLAGSMASK);
    eval 'sub NOTE_TRIGGER () {0x1000000;}' unless defined(&NOTE_TRIGGER);
    eval 'sub NOTE_LOWAT () {0x1;}' unless defined(&NOTE_LOWAT);
    eval 'sub NOTE_FILE_POLL () {0x2;}' unless defined(&NOTE_FILE_POLL);
    eval 'sub NOTE_DELETE () {0x1;}' unless defined(&NOTE_DELETE);
    eval 'sub NOTE_WRITE () {0x2;}' unless defined(&NOTE_WRITE);
    eval 'sub NOTE_EXTEND () {0x4;}' unless defined(&NOTE_EXTEND);
    eval 'sub NOTE_ATTRIB () {0x8;}' unless defined(&NOTE_ATTRIB);
    eval 'sub NOTE_LINK () {0x10;}' unless defined(&NOTE_LINK);
    eval 'sub NOTE_RENAME () {0x20;}' unless defined(&NOTE_RENAME);
    eval 'sub NOTE_REVOKE () {0x40;}' unless defined(&NOTE_REVOKE);
    eval 'sub NOTE_OPEN () {0x80;}' unless defined(&NOTE_OPEN);
    eval 'sub NOTE_CLOSE () {0x100;}' unless defined(&NOTE_CLOSE);
    eval 'sub NOTE_CLOSE_WRITE () {0x200;}' unless defined(&NOTE_CLOSE_WRITE);
    eval 'sub NOTE_READ () {0x400;}' unless defined(&NOTE_READ);
    eval 'sub NOTE_EXIT () {0x80000000;}' unless defined(&NOTE_EXIT);
    eval 'sub NOTE_FORK () {0x40000000;}' unless defined(&NOTE_FORK);
    eval 'sub NOTE_EXEC () {0x20000000;}' unless defined(&NOTE_EXEC);
    eval 'sub NOTE_PCTRLMASK () {0xf0000000;}' unless defined(&NOTE_PCTRLMASK);
    eval 'sub NOTE_PDATAMASK () {0xfffff;}' unless defined(&NOTE_PDATAMASK);
    eval 'sub NOTE_TRACK () {0x1;}' unless defined(&NOTE_TRACK);
    eval 'sub NOTE_TRACKERR () {0x2;}' unless defined(&NOTE_TRACKERR);
    eval 'sub NOTE_CHILD () {0x4;}' unless defined(&NOTE_CHILD);
    eval 'sub NOTE_SECONDS () {0x1;}' unless defined(&NOTE_SECONDS);
    eval 'sub NOTE_MSECONDS () {0x2;}' unless defined(&NOTE_MSECONDS);
    eval 'sub NOTE_USECONDS () {0x4;}' unless defined(&NOTE_USECONDS);
    eval 'sub NOTE_NSECONDS () {0x8;}' unless defined(&NOTE_NSECONDS);
    eval 'sub NOTE_ABSTIME () {0x10;}' unless defined(&NOTE_ABSTIME);
    eval 'sub KQUEUE_CLOEXEC () {0x1;}' unless defined(&KQUEUE_CLOEXEC);
    if(defined(&_KERNEL)) {
	eval 'sub KNF_LISTLOCKED () {0x1;}' unless defined(&KNF_LISTLOCKED);
	eval 'sub KNF_NOKQLOCK () {0x2;}' unless defined(&KNF_NOKQLOCK);
	eval 'sub KNOTE {
	    my($list, $hint, $flags) = @_;
    	    eval q( &knote($list, $hint, $flags));
	}' unless defined(&KNOTE);
	eval 'sub KNOTE_LOCKED {
	    my($list, $hint) = @_;
    	    eval q( &knote($list, $hint,  &KNF_LISTLOCKED));
	}' unless defined(&KNOTE_LOCKED);
	eval 'sub KNOTE_UNLOCKED {
	    my($list, $hint) = @_;
    	    eval q( &knote($list, $hint, 0));
	}' unless defined(&KNOTE_UNLOCKED);
	eval 'sub KNLIST_EMPTY {
	    my($list) = @_;
    	    eval q( &SLIST_EMPTY(($list)-> &kl_list));
	}' unless defined(&KNLIST_EMPTY);
	eval 'sub NOTE_SIGNAL () {0x8000000;}' unless defined(&NOTE_SIGNAL);
	eval 'sub EVENT_REGISTER () {1;}' unless defined(&EVENT_REGISTER);
	eval 'sub EVENT_PROCESS () {2;}' unless defined(&EVENT_PROCESS);
	eval 'sub KN_ACTIVE () {0x1;}' unless defined(&KN_ACTIVE);
	eval 'sub KN_QUEUED () {0x2;}' unless defined(&KN_QUEUED);
	eval 'sub KN_DISABLED () {0x4;}' unless defined(&KN_DISABLED);
	eval 'sub KN_DETACHED () {0x8;}' unless defined(&KN_DETACHED);
	eval 'sub KN_MARKER () {0x20;}' unless defined(&KN_MARKER);
	eval 'sub KN_KQUEUE () {0x40;}' unless defined(&KN_KQUEUE);
	eval 'sub KN_SCAN () {0x100;}' unless defined(&KN_SCAN);
	eval 'sub kn_id () { ($kn_kevent->{ident});}' unless defined(&kn_id);
	eval 'sub kn_filter () { ($kn_kevent->{filter});}' unless defined(&kn_filter);
	eval 'sub kn_flags () { ($kn_kevent->{flags});}' unless defined(&kn_flags);
	eval 'sub kn_fflags () { ($kn_kevent->{fflags});}' unless defined(&kn_fflags);
	eval 'sub kn_data () { ($kn_kevent->{data});}' unless defined(&kn_data);
	eval 'sub kn_fp () { ($kn_ptr->{p_fp});}' unless defined(&kn_fp);
	eval 'sub knlist_clear {
	    my($knl, $islocked) = @_;
    	    eval q( &knlist_cleardel(($knl),  &NULL, ($islocked), 0));
	}' unless defined(&knlist_clear);
	eval 'sub knlist_delete {
	    my($knl, $td, $islocked) = @_;
    	    eval q( &knlist_cleardel(($knl), ($td), ($islocked), 1));
	}' unless defined(&knlist_delete);
    } else {
	require 'sys/cdefs.ph';
    }
}
1;

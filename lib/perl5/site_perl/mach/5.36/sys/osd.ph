require '_h2ph_pre.ph';

no warnings qw(redefine misc);

unless(defined(&_SYS_OSD_H_)) {
    eval 'sub _SYS_OSD_H_ () {1;}' unless defined(&_SYS_OSD_H_);
    require 'sys/queue.ph';
    if(defined(&_KERNEL)) {
	eval 'sub OSD_THREAD () {0;}' unless defined(&OSD_THREAD);
	eval 'sub OSD_JAIL () {1;}' unless defined(&OSD_JAIL);
	eval 'sub OSD_KHELP () {2;}' unless defined(&OSD_KHELP);
	eval 'sub OSD_FIRST () { &OSD_THREAD;}' unless defined(&OSD_FIRST);
	eval 'sub OSD_LAST () { &OSD_KHELP;}' unless defined(&OSD_LAST);
	eval 'sub osd_thread_register {
	    my($destructor) = @_;
    	    eval q( &osd_register( &OSD_THREAD, ($destructor),  &NULL));
	}' unless defined(&osd_thread_register);
	eval 'sub osd_thread_deregister {
	    my($slot) = @_;
    	    eval q( &osd_deregister( &OSD_THREAD, ($slot)));
	}' unless defined(&osd_thread_deregister);
	eval 'sub osd_thread_set {
	    my($td, $slot, $value) = @_;
    	    eval q( &osd_set( &OSD_THREAD, ($td)-> &td_osd, ($slot), ($value)));
	}' unless defined(&osd_thread_set);
	eval 'sub osd_thread_set_reserved {
	    my($td, $slot, $rsv, $value) = @_;
    	    eval q( &osd_set_reserved( &OSD_THREAD, ($td)-> &td_osd, ($slot), ($rsv), ($value)));
	}' unless defined(&osd_thread_set_reserved);
	eval 'sub osd_thread_get {
	    my($td, $slot) = @_;
    	    eval q( &osd_get( &OSD_THREAD, ($td)-> &td_osd, ($slot)));
	}' unless defined(&osd_thread_get);
	eval 'sub osd_thread_del {
	    my($td, $slot) = @_;
    	    eval q( &do {  &KASSERT(($td) ==  &curthread, (\\"Not curthread.\\"));  &osd_del( &OSD_THREAD, ($td)-> &td_osd, ($slot)); }  &while (0));
	}' unless defined(&osd_thread_del);
	eval 'sub osd_thread_call {
	    my($td, $method, $data) = @_;
    	    eval q( &osd_call( &OSD_THREAD, ($method), ($td), ($data)));
	}' unless defined(&osd_thread_call);
	eval 'sub osd_thread_exit {
	    my($td) = @_;
    	    eval q( &osd_exit( &OSD_THREAD, ($td)-> &td_osd));
	}' unless defined(&osd_thread_exit);
	eval 'sub osd_jail_register {
	    my($destructor, $methods) = @_;
    	    eval q( &osd_register( &OSD_JAIL, ($destructor), ($methods)));
	}' unless defined(&osd_jail_register);
	eval 'sub osd_jail_deregister {
	    my($slot) = @_;
    	    eval q( &osd_deregister( &OSD_JAIL, ($slot)));
	}' unless defined(&osd_jail_deregister);
	eval 'sub osd_jail_set {
	    my($pr, $slot, $value) = @_;
    	    eval q( &osd_set( &OSD_JAIL, ($pr)-> &pr_osd, ($slot), ($value)));
	}' unless defined(&osd_jail_set);
	eval 'sub osd_jail_set_reserved {
	    my($pr, $slot, $rsv, $value) = @_;
    	    eval q( &osd_set_reserved( &OSD_JAIL, ($pr)-> &pr_osd, ($slot), ($rsv), ($value)));
	}' unless defined(&osd_jail_set_reserved);
	eval 'sub osd_jail_get {
	    my($pr, $slot) = @_;
    	    eval q( &osd_get( &OSD_JAIL, ($pr)-> &pr_osd, ($slot)));
	}' unless defined(&osd_jail_get);
	eval 'sub osd_jail_del {
	    my($pr, $slot) = @_;
    	    eval q( &osd_del( &OSD_JAIL, ($pr)-> &pr_osd, ($slot)));
	}' unless defined(&osd_jail_del);
	eval 'sub osd_jail_call {
	    my($pr, $method, $data) = @_;
    	    eval q( &osd_call( &OSD_JAIL, ($method), ($pr), ($data)));
	}' unless defined(&osd_jail_call);
	eval 'sub osd_jail_exit {
	    my($pr) = @_;
    	    eval q( &osd_exit( &OSD_JAIL, ($pr)-> &pr_osd));
	}' unless defined(&osd_jail_exit);
    }
}
1;

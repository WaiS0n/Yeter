require '_h2ph_pre.ph';

no warnings qw(redefine misc);

unless(defined(&_LIBCASPER_H_)) {
    eval 'sub _LIBCASPER_H_ () {1;}' unless defined(&_LIBCASPER_H_);
    if(defined(&HAVE_CASPER)) {
	eval 'sub WITH_CASPER () {1;}' unless defined(&WITH_CASPER);
    }
    require 'sys/types.ph';
    require 'sys/nv.ph';
    require 'stdlib.ph';
    require 'unistd.ph';
    eval 'sub CASPER_NO_UNIQ () {0x1;}' unless defined(&CASPER_NO_UNIQ);
    unless(defined(&_NVLIST_T_DECLARED)) {
	eval 'sub _NVLIST_T_DECLARED () {1;}' unless defined(&_NVLIST_T_DECLARED);
    }
    unless(defined(&_CAP_CHANNEL_T_DECLARED)) {
	eval 'sub _CAP_CHANNEL_T_DECLARED () {1;}' unless defined(&_CAP_CHANNEL_T_DECLARED);
	if(defined(&WITH_CASPER)) {
	    eval 'sub CASPER_SUPPORT () {(1);}' unless defined(&CASPER_SUPPORT);
	} else {
	    eval 'sub CASPER_SUPPORT () {(0);}' unless defined(&CASPER_SUPPORT);
	}
    }
    if(defined(&WITH_CASPER)) {
    } else {
	eval 'sub cap_channel_flags {
	    my($chan) = @_;
    	    eval q({ ( ($chan->{cch_flags})); });
	}' unless defined(&cap_channel_flags);
    }
    eval 'sub channel_nvlist_flags {
        my($chan) = @_;
	    eval q({ \'int\'  &flags;  &flags = 0;  &if (( &cap_channel_flags($chan) &  &CASPER_NO_UNIQ) != 0)  &flags |=  &NV_FLAG_NO_UNIQUE; ( &flags); });
    }' unless defined(&channel_nvlist_flags);
    if(defined(&WITH_CASPER)) {
    } else {
	eval 'sub cap_init {
	    my($void) = @_;
    	    eval q({  &cap_channel_t * &chan;  &chan = ( &cap_channel_t *) &malloc($sizeof{ &chan});  &if ( &chan !=  &NULL) {  ($chan->{cch_fd}) = -1; } ( &chan); });
	}' unless defined(&cap_init);
    }
    if(defined(&WITH_CASPER)) {
    } else {
	eval 'sub cap_service_open {
	    my($__unused,$__unused) = @_;
    	    eval q({ ( &cap_init()); });
	}' unless defined(&cap_service_open);
	eval 'sub cap_service_limit {
	    my($__unused,$__unused,$__unused) = @_;
    	    eval q({ (0); });
	}' unless defined(&cap_service_limit);
    }
    if(defined(&WITH_CASPER)) {
    } else {
	eval 'sub cap_wrap {
	    my($sock,$flags) = @_;
    	    eval q({  &cap_channel_t * &chan;  &chan =  &cap_init();  &if ( &chan !=  &NULL) {  ($chan->{cch_fd}) = $sock;  ($chan->{cch_flags}) = $flags; } ( &chan); });
	}' unless defined(&cap_wrap);
    }
    if(defined(&WITH_CASPER)) {
    } else {
	eval 'sub cap_unwrap {
	    my($chan) = @_;
    	    eval q({ \'int\'  &fd;  &fd =  ($chan->{cch_fd});  &free($chan); ( &fd); });
	}' unless defined(&cap_unwrap);
    }
    if(defined(&WITH_CASPER)) {
    } else {
	eval 'sub cap_clone {
	    my($chan) = @_;
    	    eval q({  &cap_channel_t * &newchan;  &newchan =  &cap_init();  &if ( &newchan ==  &NULL) { ( &NULL); }  &if ( ($chan->{cch_fd}) == -1) {  ($newchan->{cch_fd}) = -1; }  &else {  ($newchan->{cch_fd}) =  &dup( ($chan->{cch_fd}));  &if ( ($newchan->{cch_fd}) < 0) {  &free( &newchan);  &newchan =  &NULL; } }  ($newchan->{cch_flags}) =  ($chan->{cch_flags}); ( &newchan); });
	}' unless defined(&cap_clone);
    }
    if(defined(&WITH_CASPER)) {
    } else {
	eval 'sub cap_close {
	    my($chan) = @_;
    	    eval q({  &if ( ($chan->{cch_fd}) >= 0) {  &close( ($chan->{cch_fd})); }  &free($chan); });
	}' unless defined(&cap_close);
    }
    if(defined(&WITH_CASPER)) {
    } else {
	eval 'sub cap_sock {
	    my($chan) = @_;
    	    eval q(( ($chan->{cch_fd})));
	}' unless defined(&cap_sock);
    }
    if(defined(&WITH_CASPER)) {
    } else {
	eval 'sub cap_limit_set {
	    my($__unused,$__unused) = @_;
    	    eval q({ (0); });
	}' unless defined(&cap_limit_set);
    }
    if(defined(&WITH_CASPER)) {
    } else {
	eval 'sub cap_limit_get {
	    my($__unused,$limitsp) = @_;
    	    eval q({ *$limitsp =  &nvlist_create( &channel_nvlist_flags( &chan)); (0); });
	}' unless defined(&cap_limit_get);
    }
    if(defined(&WITH_CASPER)) {
    } else {
	eval 'sub cap_send_nvlist {
	    my($chan, $nvl) = @_;
    	    eval q((0));
	}' unless defined(&cap_send_nvlist);
    }
    if(defined(&WITH_CASPER)) {
    } else {
	eval 'sub cap_recv_nvlist {
	    my($chan) = @_;
    	    eval q(( &nvlist_create( ($chan->{cch_flags}))));
	}' unless defined(&cap_recv_nvlist);
    }
    if(defined(&WITH_CASPER)) {
    } else {
	eval 'sub cap_xfer_nvlist {
	    my($chan,$nvl) = @_;
    	    eval q({  &nvlist_destroy($nvl); ( &nvlist_create( &channel_nvlist_flags($chan))); });
	}' unless defined(&cap_xfer_nvlist);
    }
}
1;

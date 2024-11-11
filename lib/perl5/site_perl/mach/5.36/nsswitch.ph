require '_h2ph_pre.ph';

no warnings qw(redefine misc);

unless(defined(&_NSSWITCH_H)) {
    eval 'sub _NSSWITCH_H () {1;}' unless defined(&_NSSWITCH_H);
    require 'sys/types.ph';
    require 'stdarg.ph';
    eval 'sub NSS_MODULE_INTERFACE_VERSION () {1;}' unless defined(&NSS_MODULE_INTERFACE_VERSION);
    unless(defined(&_PATH_NS_CONF)) {
	eval 'sub _PATH_NS_CONF () {"/etc/nsswitch.conf";}' unless defined(&_PATH_NS_CONF);
    }
    eval 'sub NS_ACTION_CONTINUE () {0;}' unless defined(&NS_ACTION_CONTINUE);
    eval 'sub NS_ACTION_RETURN () {1;}' unless defined(&NS_ACTION_RETURN);
    eval 'sub NS_SUCCESS () {(1<<0);}' unless defined(&NS_SUCCESS);
    eval 'sub NS_UNAVAIL () {(1<<1);}' unless defined(&NS_UNAVAIL);
    eval 'sub NS_NOTFOUND () {(1<<2);}' unless defined(&NS_NOTFOUND);
    eval 'sub NS_TRYAGAIN () {(1<<3);}' unless defined(&NS_TRYAGAIN);
    eval 'sub NS_RETURN () {(1<<4);}' unless defined(&NS_RETURN);
    eval 'sub NS_ADDRFAMILY () {(1<<5);}' unless defined(&NS_ADDRFAMILY);
    eval 'sub NS_TERMINATE () {( &NS_SUCCESS| &NS_RETURN);}' unless defined(&NS_TERMINATE);
    eval 'sub NS_STATUSMASK () {0xff;}' unless defined(&NS_STATUSMASK);
    eval 'sub NSSRC_FILES () {"files";}' unless defined(&NSSRC_FILES);
    eval 'sub NSSRC_DB () {"db";}' unless defined(&NSSRC_DB);
    eval 'sub NSSRC_DNS () {"dns";}' unless defined(&NSSRC_DNS);
    eval 'sub NSSRC_NIS () {"nis";}' unless defined(&NSSRC_NIS);
    eval 'sub NSSRC_COMPAT () {"compat";}' unless defined(&NSSRC_COMPAT);
    eval 'sub NSSRC_CACHE () {"cache";}' unless defined(&NSSRC_CACHE);
    eval 'sub NSSRC_FALLBACK () {"__fallback";}' unless defined(&NSSRC_FALLBACK);
    eval 'sub NSDB_HOSTS () {"hosts";}' unless defined(&NSDB_HOSTS);
    eval 'sub NSDB_GROUP () {"group";}' unless defined(&NSDB_GROUP);
    eval 'sub NSDB_GROUP_COMPAT () {"group_compat";}' unless defined(&NSDB_GROUP_COMPAT);
    eval 'sub NSDB_NETGROUP () {"netgroup";}' unless defined(&NSDB_NETGROUP);
    eval 'sub NSDB_NETWORKS () {"networks";}' unless defined(&NSDB_NETWORKS);
    eval 'sub NSDB_PASSWD () {"passwd";}' unless defined(&NSDB_PASSWD);
    eval 'sub NSDB_PASSWD_COMPAT () {"passwd_compat";}' unless defined(&NSDB_PASSWD_COMPAT);
    eval 'sub NSDB_SHELLS () {"shells";}' unless defined(&NSDB_SHELLS);
    eval 'sub NSDB_SERVICES () {"services";}' unless defined(&NSDB_SERVICES);
    eval 'sub NSDB_SERVICES_COMPAT () {"services_compat";}' unless defined(&NSDB_SERVICES_COMPAT);
    eval 'sub NSDB_SSH_HOSTKEYS () {"ssh_hostkeys";}' unless defined(&NSDB_SSH_HOSTKEYS);
    eval 'sub NSDB_PROTOCOLS () {"protocols";}' unless defined(&NSDB_PROTOCOLS);
    eval 'sub NSDB_RPC () {"rpc";}' unless defined(&NSDB_RPC);
    eval 'sub NSDB_ALIASES () {"aliases";}' unless defined(&NSDB_ALIASES);
    eval 'sub NSDB_AUTH () {"auth";}' unless defined(&NSDB_AUTH);
    eval 'sub NSDB_AUTOMOUNT () {"automount";}' unless defined(&NSDB_AUTOMOUNT);
    eval 'sub NSDB_BOOTPARAMS () {"bootparams";}' unless defined(&NSDB_BOOTPARAMS);
    eval 'sub NSDB_ETHERS () {"ethers";}' unless defined(&NSDB_ETHERS);
    eval 'sub NSDB_EXPORTS () {"exports";}' unless defined(&NSDB_EXPORTS);
    eval 'sub NSDB_NETMASKS () {"netmasks";}' unless defined(&NSDB_NETMASKS);
    eval 'sub NSDB_PHONES () {"phones";}' unless defined(&NSDB_PHONES);
    eval 'sub NSDB_PRINTCAP () {"printcap";}' unless defined(&NSDB_PRINTCAP);
    eval 'sub NSDB_REMOTE () {"remote";}' unless defined(&NSDB_REMOTE);
    eval 'sub NSDB_SENDMAILVARS () {"sendmailvars";}' unless defined(&NSDB_SENDMAILVARS);
    eval 'sub NSDB_TERMCAP () {"termcap";}' unless defined(&NSDB_TERMCAP);
    eval 'sub NSDB_TTYS () {"ttys";}' unless defined(&NSDB_TTYS);
    eval 'sub NSS_METHOD_PROTOTYPE {
        my($method) = @_;
	    eval q(\'int\' $method( &void *,  &void *,  &va_list));
    }' unless defined(&NSS_METHOD_PROTOTYPE);
    eval 'sub NS_FILES_CB {
        my($F,$C) = @_;
	    eval q({  &NSSRC_FILES, $F, $C },);
    }' unless defined(&NS_FILES_CB);
    eval 'sub NS_COMPAT_CB {
        my($F,$C) = @_;
	    eval q({  &NSSRC_COMPAT, $F, $C },);
    }' unless defined(&NS_COMPAT_CB);
    eval 'sub NS_FALLBACK_CB {
        my($F) = @_;
	    eval q({  &NSSRC_FALLBACK, $F,  &NULL },);
    }' unless defined(&NS_FALLBACK_CB);
    if(defined(&HESIOD)) {
	eval 'sub NS_DNS_CB {
	    my($F,$C) = @_;
    	    eval q({  &NSSRC_DNS, $F, $C },);
	}' unless defined(&NS_DNS_CB);
    } else {
	eval 'sub NS_DNS_CB {
	    my($F,$C) = @_;
    	    eval q();
	}' unless defined(&NS_DNS_CB);
    }
    if(defined(&YP)) {
	eval 'sub NS_NIS_CB {
	    my($F,$C) = @_;
    	    eval q({  &NSSRC_NIS, $F, $C },);
	}' unless defined(&NS_NIS_CB);
    } else {
	eval 'sub NS_NIS_CB {
	    my($F,$C) = @_;
    	    eval q();
	}' unless defined(&NS_NIS_CB);
    }
    eval("sub nss_lt_name () { 1; }") unless defined(&nss_lt_name);
    eval("sub nss_lt_id () { 2; }") unless defined(&nss_lt_id);
    eval("sub nss_lt_all () { 3; }") unless defined(&nss_lt_all);
    if(defined(&_NS_PRIVATE)) {
    }
    require 'sys/cdefs.ph';
    if(defined(&_NS_PRIVATE)) {
	if(defined(&_NSS_DEBUG)) {
	}
    }
}
1;

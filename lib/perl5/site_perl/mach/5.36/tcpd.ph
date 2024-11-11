require '_h2ph_pre.ph';

no warnings qw(redefine misc);

if(defined(&INET6)) {
    eval 'sub TCPD_SOCKADDR () {\'struct sockaddr\';}' unless defined(&TCPD_SOCKADDR);
} else {
    eval 'sub TCPD_SOCKADDR () {\'struct sockaddr_in\';}' unless defined(&TCPD_SOCKADDR);
}
unless(defined(&_STDFILE_DECLARED)) {
    eval 'sub _STDFILE_DECLARED () {1;}' unless defined(&_STDFILE_DECLARED);
}
eval 'sub STRING_LENGTH () {128;}' unless defined(&STRING_LENGTH);
unless(defined(&STRN_CPY)) {
    sub STRN_CPY {
	my($d,$s,$l) = @_;
	eval q({  &strncpy(($d),($s),($l)); ($d)[($l)-1] = 0; });
    }
}
unless(defined(&STRN_EQ)) {
    sub STRN_EQ {
	my($x,$y,$l) = @_;
	eval q(( &strncasecmp(($x),($y),($l)) == 0));
    }
}
unless(defined(&STRN_NE)) {
    sub STRN_NE {
	my($x,$y,$l) = @_;
	eval q(( &strncasecmp(($x),($y),($l)) != 0));
    }
}
unless(defined(&STR_EQ)) {
    sub STR_EQ {
	my($x,$y) = @_;
	eval q(( &strcasecmp(($x),($y)) == 0));
    }
}
unless(defined(&STR_NE)) {
    sub STR_NE {
	my($x,$y) = @_;
	eval q(( &strcasecmp(($x),($y)) != 0));
    }
}
eval 'sub STRING_UNKNOWN () {"unknown";}' unless defined(&STRING_UNKNOWN);
eval 'sub STRING_PARANOID () {"paranoid";}' unless defined(&STRING_PARANOID);
unless(defined(&HOSTNAME_KNOWN)) {
    sub HOSTNAME_KNOWN {
	my($s) = @_;
	eval q(( &STR_NE(($s), &unknown)  &&  &STR_NE(($s), &paranoid)));
    }
}
unless(defined(&NOT_INADDR)) {
    sub NOT_INADDR {
	my($s) = @_;
	eval q(($s->[ &strspn($s,\"01234567890./\")] != 0));
    }
}
unless(defined(&NOT_INADDR6)) {
    sub NOT_INADDR6 {
	my($s) = @_;
	eval q(( &strchr($s, ord(':')) ==  &NULL));
    }
}
if(defined(&TLI) || defined(&PTX) || defined(&TLI_SEQUENT)) {
} else {
    eval 'sub fromhost () { &sock_host;}' unless defined(&fromhost);
}
eval 'sub RQ_FILE () {1;}' unless defined(&RQ_FILE);
eval 'sub RQ_DAEMON () {2;}' unless defined(&RQ_DAEMON);
eval 'sub RQ_USER () {3;}' unless defined(&RQ_USER);
eval 'sub RQ_CLIENT_NAME () {4;}' unless defined(&RQ_CLIENT_NAME);
eval 'sub RQ_CLIENT_ADDR () {5;}' unless defined(&RQ_CLIENT_ADDR);
eval 'sub RQ_CLIENT_SIN () {6;}' unless defined(&RQ_CLIENT_SIN);
eval 'sub RQ_SERVER_NAME () {7;}' unless defined(&RQ_SERVER_NAME);
eval 'sub RQ_SERVER_ADDR () {8;}' unless defined(&RQ_SERVER_ADDR);
eval 'sub RQ_SERVER_SIN () {9;}' unless defined(&RQ_SERVER_SIN);
unless(defined(&eval_daemon)) {
    sub eval_daemon {
	my($r) = @_;
	eval q((($r)-> &daemon));
    }
}
unless(defined(&eval_pid)) {
    sub eval_pid {
	my($r) = @_;
	eval q((($r)-> &pid));
    }
}
unless(defined(&sock_methods)) {
    sub sock_methods {
	my($r) = @_;
	eval q({ ($r)-> &hostname =  &sock_hostname; ($r)-> &hostaddr =  &sock_hostaddr; });
    }
}
if(defined(&TLI) || defined(&PTX) || defined(&TLI_SEQUENT)) {
}
eval 'sub AC_PERMIT () {1;}' unless defined(&AC_PERMIT);
eval 'sub AC_DENY () {(-1);}' unless defined(&AC_DENY);
eval 'sub AC_ERROR () { &AC_DENY;}' unless defined(&AC_ERROR);
if(defined(&INET_ADDR_BUG)) {
    eval 'sub inet_addr () { &fix_inet_addr;}' unless defined(&inet_addr);
}
if(defined(&BROKEN_FGETS)) {
    eval 'sub fgets () { &fix_fgets;}' unless defined(&fgets);
}
if(defined(&RECVFROM_BUG)) {
    eval 'sub recvfrom () { &fix_recvfrom;}' unless defined(&recvfrom);
}
if(defined(&GETPEERNAME_BUG)) {
    eval 'sub getpeername () { &fix_getpeername;}' unless defined(&getpeername);
}
if(defined(&SOLARIS_24_GETHOSTBYNAME_BUG)) {
    eval 'sub gethostbyname () { &fix_gethostbyname;}' unless defined(&gethostbyname);
}
if(defined(&USE_STRSEP)) {
    eval 'sub strtok () { &fix_strtok;}' unless defined(&strtok);
}
if(defined(&LIBC_CALLS_STRTOK)) {
    eval 'sub strtok () { &my_strtok;}' unless defined(&strtok);
}
1;

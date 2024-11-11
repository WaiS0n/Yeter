require '_h2ph_pre.ph';

no warnings qw(redefine misc);

unless(defined(&_RESOLV_H_)) {
    eval 'sub _RESOLV_H_ () {1;}' unless defined(&_RESOLV_H_);
    require 'sys/param.ph';
    require 'sys/types.ph';
    require 'sys/cdefs.ph';
    require 'sys/socket.ph';
    require 'stdio.ph';
    require 'netinet/in.ph';
    require 'arpa/nameser.ph';
    eval 'sub __RES () {20090302;}' unless defined(&__RES);
    eval 'sub RES_SET_H_ERRNO {
        my($r,$x) = @_;
	    eval q( &__h_errno_set($r,$x));
    }' unless defined(&RES_SET_H_ERRNO);
    unless(defined(&_PATH_RESCONF)) {
	eval 'sub _PATH_RESCONF () {"/etc/resolv.conf";}' unless defined(&_PATH_RESCONF);
    }
    eval("sub res_goahead () { 0; }") unless defined(&res_goahead);
    eval("sub res_nextns () { 1; }") unless defined(&res_nextns);
    eval("sub res_modified () { 2; }") unless defined(&res_modified);
    eval("sub res_done () { 3; }") unless defined(&res_done);
    eval("sub res_error () { 4; }") unless defined(&res_error);
    eval 'sub MAXNS () {3;}' unless defined(&MAXNS);
    eval 'sub MAXDFLSRCH () {3;}' unless defined(&MAXDFLSRCH);
    eval 'sub MAXDNSRCH () {6;}' unless defined(&MAXDNSRCH);
    eval 'sub LOCALDOMAINPARTS () {2;}' unless defined(&LOCALDOMAINPARTS);
    eval 'sub RES_TIMEOUT () {5;}' unless defined(&RES_TIMEOUT);
    eval 'sub MAXRESOLVSORT () {10;}' unless defined(&MAXRESOLVSORT);
    eval 'sub RES_MAXNDOTS () {15;}' unless defined(&RES_MAXNDOTS);
    eval 'sub RES_MAXRETRANS () {30;}' unless defined(&RES_MAXRETRANS);
    eval 'sub RES_MAXRETRY () {5;}' unless defined(&RES_MAXRETRY);
    eval 'sub RES_DFLRETRY () {2;}' unless defined(&RES_DFLRETRY);
    eval 'sub RES_MAXTIME () {65535;}' unless defined(&RES_MAXTIME);
    if(defined(&sun)  && 0) {
    } else {
    }
    eval 'sub nsaddr () { $nsaddr_list[0];}' unless defined(&nsaddr);
    if(defined(&sun)  && 0) {
    } else {
    }
    if(defined(&IN6ADDR_ANY_INIT)) {
    }
    if(defined(&ISC_ALIGN64)) {
    } else {
    }
    eval 'sub RES_F_VC () {0x1;}' unless defined(&RES_F_VC);
    eval 'sub RES_F_CONN () {0x2;}' unless defined(&RES_F_CONN);
    eval 'sub RES_F_EDNS0ERR () {0x4;}' unless defined(&RES_F_EDNS0ERR);
    eval 'sub RES_F__UNUSED () {0x8;}' unless defined(&RES_F__UNUSED);
    eval 'sub RES_F_LASTMASK () {0xf0;}' unless defined(&RES_F_LASTMASK);
    eval 'sub RES_F_LASTSHIFT () {4;}' unless defined(&RES_F_LASTSHIFT);
    eval 'sub RES_GETLAST {
        my($res) = @_;
	    eval q(((($res). &_flags &  &RES_F_LASTMASK) >>  &RES_F_LASTSHIFT));
    }' unless defined(&RES_GETLAST);
    eval 'sub RES_EXHAUSTIVE () {0x1;}' unless defined(&RES_EXHAUSTIVE);
    eval 'sub RES_IPV4ONLY () {0x2;}' unless defined(&RES_IPV4ONLY);
    eval 'sub RES_IPV6ONLY () {0x4;}' unless defined(&RES_IPV6ONLY);
    eval 'sub RES_INIT () {0x1;}' unless defined(&RES_INIT);
    eval 'sub RES_DEBUG () {0x2;}' unless defined(&RES_DEBUG);
    eval 'sub RES_AAONLY () {0x4;}' unless defined(&RES_AAONLY);
    eval 'sub RES_USEVC () {0x8;}' unless defined(&RES_USEVC);
    eval 'sub RES_PRIMARY () {0x10;}' unless defined(&RES_PRIMARY);
    eval 'sub RES_IGNTC () {0x20;}' unless defined(&RES_IGNTC);
    eval 'sub RES_RECURSE () {0x40;}' unless defined(&RES_RECURSE);
    eval 'sub RES_DEFNAMES () {0x80;}' unless defined(&RES_DEFNAMES);
    eval 'sub RES_STAYOPEN () {0x100;}' unless defined(&RES_STAYOPEN);
    eval 'sub RES_DNSRCH () {0x200;}' unless defined(&RES_DNSRCH);
    eval 'sub RES_INSECURE1 () {0x400;}' unless defined(&RES_INSECURE1);
    eval 'sub RES_INSECURE2 () {0x800;}' unless defined(&RES_INSECURE2);
    eval 'sub RES_NOALIASES () {0x1000;}' unless defined(&RES_NOALIASES);
    eval 'sub RES_USE_INET6 () {0x2000;}' unless defined(&RES_USE_INET6);
    eval 'sub RES_ROTATE () {0x4000;}' unless defined(&RES_ROTATE);
    eval 'sub RES_NOCHECKNAME () {0x8000;}' unless defined(&RES_NOCHECKNAME);
    eval 'sub RES_KEEPTSIG () {0x10000;}' unless defined(&RES_KEEPTSIG);
    eval 'sub RES_BLAST () {0x20000;}' unless defined(&RES_BLAST);
    eval 'sub RES_NSID () {0x40000;}' unless defined(&RES_NSID);
    eval 'sub RES_NOTLDQUERY () {0x100000;}' unless defined(&RES_NOTLDQUERY);
    eval 'sub RES_USE_DNSSEC () {0x200000;}' unless defined(&RES_USE_DNSSEC);
    eval 'sub RES_USE_DNAME () {0x10000000;}' unless defined(&RES_USE_DNAME);
    eval 'sub RES_USE_EDNS0 () {0x40000000;}' unless defined(&RES_USE_EDNS0);
    eval 'sub RES_NO_NIBBLE2 () {0x80000000;}' unless defined(&RES_NO_NIBBLE2);
    eval 'sub RES_DEFAULT () {( &RES_RECURSE |  &RES_DEFNAMES |  &RES_DNSRCH |  &RES_NO_NIBBLE2);}' unless defined(&RES_DEFAULT);
    eval 'sub RES_PRF_STATS () {0x1;}' unless defined(&RES_PRF_STATS);
    eval 'sub RES_PRF_UPDATE () {0x2;}' unless defined(&RES_PRF_UPDATE);
    eval 'sub RES_PRF_CLASS () {0x4;}' unless defined(&RES_PRF_CLASS);
    eval 'sub RES_PRF_CMD () {0x8;}' unless defined(&RES_PRF_CMD);
    eval 'sub RES_PRF_QUES () {0x10;}' unless defined(&RES_PRF_QUES);
    eval 'sub RES_PRF_ANS () {0x20;}' unless defined(&RES_PRF_ANS);
    eval 'sub RES_PRF_AUTH () {0x40;}' unless defined(&RES_PRF_AUTH);
    eval 'sub RES_PRF_ADD () {0x80;}' unless defined(&RES_PRF_ADD);
    eval 'sub RES_PRF_HEAD1 () {0x100;}' unless defined(&RES_PRF_HEAD1);
    eval 'sub RES_PRF_HEAD2 () {0x200;}' unless defined(&RES_PRF_HEAD2);
    eval 'sub RES_PRF_TTLID () {0x400;}' unless defined(&RES_PRF_TTLID);
    eval 'sub RES_PRF_HEADX () {0x800;}' unless defined(&RES_PRF_HEADX);
    eval 'sub RES_PRF_QUERY () {0x1000;}' unless defined(&RES_PRF_QUERY);
    eval 'sub RES_PRF_REPLY () {0x2000;}' unless defined(&RES_PRF_REPLY);
    eval 'sub RES_PRF_INIT () {0x4000;}' unless defined(&RES_PRF_INIT);
    eval 'sub RES_PRF_TRUNC () {0x8000;}' unless defined(&RES_PRF_TRUNC);
    eval 'sub _res () {(* &__res_state());}' unless defined(&_res);
    unless(defined(&__BIND_NOSTATIC)) {
	eval 'sub fp_nquery () { &__fp_nquery;}' unless defined(&fp_nquery);
	eval 'sub fp_query () { &__fp_query;}' unless defined(&fp_query);
	eval 'sub hostalias () { &__hostalias;}' unless defined(&hostalias);
	eval 'sub p_query () { &__p_query;}' unless defined(&p_query);
	eval 'sub res_close () { &__res_close;}' unless defined(&res_close);
	eval 'sub res_init () { &__res_init;}' unless defined(&res_init);
	eval 'sub res_isourserver () { &__res_isourserver;}' unless defined(&res_isourserver);
	eval 'sub res_mkquery () { &__res_mkquery;}' unless defined(&res_mkquery);
	eval 'sub res_opt () { &__res_opt;}' unless defined(&res_opt);
	eval 'sub res_query () { &__res_query;}' unless defined(&res_query);
	eval 'sub res_querydomain () { &__res_querydomain;}' unless defined(&res_querydomain);
	eval 'sub res_search () { &__res_search;}' unless defined(&res_search);
	eval 'sub res_send () { &__res_send;}' unless defined(&res_send);
	eval 'sub res_sendsigned () { &__res_sendsigned;}' unless defined(&res_sendsigned);
    }
    if(!defined(&SHARED_LIBBIND) || defined(&LIB)) {
    }
    eval 'sub b64_ntop () { &__b64_ntop;}' unless defined(&b64_ntop);
    eval 'sub b64_pton () { &__b64_pton;}' unless defined(&b64_pton);
    eval 'sub dn_comp () { &__dn_comp;}' unless defined(&dn_comp);
    eval 'sub dn_count_labels () { &__dn_count_labels;}' unless defined(&dn_count_labels);
    eval 'sub dn_expand () { &__dn_expand;}' unless defined(&dn_expand);
    eval 'sub dn_skipname () { &__dn_skipname;}' unless defined(&dn_skipname);
    eval 'sub fp_resstat () { &__fp_resstat;}' unless defined(&fp_resstat);
    eval 'sub loc_aton () { &__loc_aton;}' unless defined(&loc_aton);
    eval 'sub loc_ntoa () { &__loc_ntoa;}' unless defined(&loc_ntoa);
    eval 'sub p_cdname () { &__p_cdname;}' unless defined(&p_cdname);
    eval 'sub p_cdnname () { &__p_cdnname;}' unless defined(&p_cdnname);
    eval 'sub p_class () { &__p_class;}' unless defined(&p_class);
    eval 'sub p_fqname () { &__p_fqname;}' unless defined(&p_fqname);
    eval 'sub p_fqnname () { &__p_fqnname;}' unless defined(&p_fqnname);
    eval 'sub p_option () { &__p_option;}' unless defined(&p_option);
    eval 'sub p_secstodate () { &__p_secstodate;}' unless defined(&p_secstodate);
    eval 'sub p_section () { &__p_section;}' unless defined(&p_section);
    eval 'sub p_time () { &__p_time;}' unless defined(&p_time);
    eval 'sub p_type () { &__p_type;}' unless defined(&p_type);
    eval 'sub p_rcode () { &__p_rcode;}' unless defined(&p_rcode);
    eval 'sub p_sockun () { &__p_sockun;}' unless defined(&p_sockun);
    eval 'sub putlong () {\'__putlong\';}' unless defined(&putlong);
    eval 'sub putshort () {\'__putshort\';}' unless defined(&putshort);
    eval 'sub res_dnok () { &__res_dnok;}' unless defined(&res_dnok);
    if(0) {
	eval 'sub res_findzonecut () { &__res_findzonecut;}' unless defined(&res_findzonecut);
    }
    eval 'sub res_findzonecut2 () { &__res_findzonecut2;}' unless defined(&res_findzonecut2);
    eval 'sub res_hnok () { &__res_hnok;}' unless defined(&res_hnok);
    eval 'sub res_hostalias () { &__res_hostalias;}' unless defined(&res_hostalias);
    eval 'sub res_mailok () { &__res_mailok;}' unless defined(&res_mailok);
    eval 'sub res_nameinquery () { &__res_nameinquery;}' unless defined(&res_nameinquery);
    eval 'sub res_nclose () { &__res_nclose;}' unless defined(&res_nclose);
    eval 'sub res_ninit () { &__res_ninit;}' unless defined(&res_ninit);
    eval 'sub res_nmkquery () { &__res_nmkquery;}' unless defined(&res_nmkquery);
    eval 'sub res_pquery () { &__res_pquery;}' unless defined(&res_pquery);
    eval 'sub res_nquery () { &__res_nquery;}' unless defined(&res_nquery);
    eval 'sub res_nquerydomain () { &__res_nquerydomain;}' unless defined(&res_nquerydomain);
    eval 'sub res_nsearch () { &__res_nsearch;}' unless defined(&res_nsearch);
    eval 'sub res_nsend () { &__res_nsend;}' unless defined(&res_nsend);
    if(0) {
	eval 'sub res_nsendsigned () { &__res_nsendsigned;}' unless defined(&res_nsendsigned);
    }
    eval 'sub res_nisourserver () { &__res_nisourserver;}' unless defined(&res_nisourserver);
    eval 'sub res_ownok () { &__res_ownok;}' unless defined(&res_ownok);
    eval 'sub res_queriesmatch () { &__res_queriesmatch;}' unless defined(&res_queriesmatch);
    eval 'sub res_rndinit () { &__res_rndinit;}' unless defined(&res_rndinit);
    eval 'sub res_randomid () { &__res_randomid;}' unless defined(&res_randomid);
    eval 'sub res_nrandomid () { &__res_nrandomid;}' unless defined(&res_nrandomid);
    eval 'sub sym_ntop () { &__sym_ntop;}' unless defined(&sym_ntop);
    eval 'sub sym_ntos () { &__sym_ntos;}' unless defined(&sym_ntos);
    eval 'sub sym_ston () { &__sym_ston;}' unless defined(&sym_ston);
    eval 'sub res_nopt () { &__res_nopt;}' unless defined(&res_nopt);
    eval 'sub res_nopt_rdata () { &__res_nopt_rdata;}' unless defined(&res_nopt_rdata);
    eval 'sub res_ndestroy () { &__res_ndestroy;}' unless defined(&res_ndestroy);
    eval 'sub res_nametoclass () { &__res_nametoclass;}' unless defined(&res_nametoclass);
    eval 'sub res_nametotype () { &__res_nametotype;}' unless defined(&res_nametotype);
    eval 'sub res_setservers () { &__res_setservers;}' unless defined(&res_setservers);
    eval 'sub res_getservers () { &__res_getservers;}' unless defined(&res_getservers);
    if(0) {
	eval 'sub res_buildprotolist () { &__res_buildprotolist;}' unless defined(&res_buildprotolist);
	eval 'sub res_destroyprotolist () { &__res_destroyprotolist;}' unless defined(&res_destroyprotolist);
	eval 'sub res_destroyservicelist () { &__res_destroyservicelist;}' unless defined(&res_destroyservicelist);
	eval 'sub res_get_nibblesuffix () { &__res_get_nibblesuffix;}' unless defined(&res_get_nibblesuffix);
	eval 'sub res_get_nibblesuffix2 () { &__res_get_nibblesuffix2;}' unless defined(&res_get_nibblesuffix2);
    }
    eval 'sub res_ourserver_p () { &__res_ourserver_p;}' unless defined(&res_ourserver_p);
    if(0) {
	eval 'sub res_protocolname () { &__res_protocolname;}' unless defined(&res_protocolname);
	eval 'sub res_protocolnumber () { &__res_protocolnumber;}' unless defined(&res_protocolnumber);
    }
    eval 'sub res_send_setqhook () { &__res_send_setqhook;}' unless defined(&res_send_setqhook);
    eval 'sub res_send_setrhook () { &__res_send_setrhook;}' unless defined(&res_send_setrhook);
    if(0) {
	eval 'sub res_servicename () { &__res_servicename;}' unless defined(&res_servicename);
	eval 'sub res_servicenumber () { &__res_servicenumber;}' unless defined(&res_servicenumber);
    }
    unless(defined(&__ultrix__)) {
    }
    if(0) {
    }
    if(0) {
    }
}
1;

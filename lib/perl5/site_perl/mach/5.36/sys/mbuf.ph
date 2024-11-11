require '_h2ph_pre.ph';

no warnings qw(redefine misc);

unless(defined(&_SYS_MBUF_H_)) {
    eval 'sub _SYS_MBUF_H_ () {1;}' unless defined(&_SYS_MBUF_H_);
    require 'sys/queue.ph';
    if(defined(&_KERNEL)) {
	require 'sys/systm.ph';
	require 'sys/refcount.ph';
	require 'vm/uma.ph';
	require 'sys/sdt.ph';
	eval 'sub MBUF_PROBE1 {
	    my($probe, $arg0) = @_;
    	    eval q( &SDT_PROBE1( &sdt, , , $probe, $arg0));
	}' unless defined(&MBUF_PROBE1);
	eval 'sub MBUF_PROBE2 {
	    my($probe, $arg0, $arg1) = @_;
    	    eval q( &SDT_PROBE2( &sdt, , , $probe, $arg0, $arg1));
	}' unless defined(&MBUF_PROBE2);
	eval 'sub MBUF_PROBE3 {
	    my($probe, $arg0, $arg1, $arg2) = @_;
    	    eval q( &SDT_PROBE3( &sdt, , , $probe, $arg0, $arg1, $arg2));
	}' unless defined(&MBUF_PROBE3);
	eval 'sub MBUF_PROBE4 {
	    my($probe, $arg0, $arg1, $arg2, $arg3) = @_;
    	    eval q( &SDT_PROBE4( &sdt, , , $probe, $arg0, $arg1, $arg2, $arg3));
	}' unless defined(&MBUF_PROBE4);
	eval 'sub MBUF_PROBE5 {
	    my($probe, $arg0, $arg1, $arg2, $arg3, $arg4) = @_;
    	    eval q( &SDT_PROBE5( &sdt, , , $probe, $arg0, $arg1, $arg2, $arg3, $arg4));
	}' unless defined(&MBUF_PROBE5);
    }
    eval 'sub MHSIZE () { &offsetof(\'struct mbuf\',  &m_dat);}' unless defined(&MHSIZE);
    eval 'sub MPKTHSIZE () { &offsetof(\'struct mbuf\',  &m_pktdat);}' unless defined(&MPKTHSIZE);
    eval 'sub MLEN () {(( &MSIZE -  &MHSIZE));}' unless defined(&MLEN);
    eval 'sub MHLEN () {(( &MSIZE -  &MPKTHSIZE));}' unless defined(&MHLEN);
    eval 'sub MINCLSIZE () {( &MHLEN + 1);}' unless defined(&MINCLSIZE);
    eval 'sub M_NODOM () {255;}' unless defined(&M_NODOM);
    if(defined(&_KERNEL)) {
	eval 'sub mtod {
	    my($m, $t) = @_;
    	    eval q((($t)(($m)-> &m_data)));
	}' unless defined(&mtod);
	eval 'sub mtodo {
	    my($m, $o) = @_;
    	    eval q((( &void *)((($m)-> &m_data) + ($o))));
	}' unless defined(&mtodo);
    }
    if(!defined(&__LP64__)) {
    }
    eval 'sub ether_vtag () { ($PH_per->{sixteen[0]});}' unless defined(&ether_vtag);
    eval 'sub tcp_tun_port () { ($PH_per->{sixteen[0]});}' unless defined(&tcp_tun_port);
    eval 'sub vt_nrecs () { ($PH_per->{sixteen[0]});}' unless defined(&vt_nrecs);
    eval 'sub tso_segsz () { ($PH_per->{sixteen[1]});}' unless defined(&tso_segsz);
    eval 'sub lro_nsegs () { &tso_segsz;}' unless defined(&lro_nsegs);
    eval 'sub csum_data () { ($PH_per->{thirtytwo[1]});}' unless defined(&csum_data);
    eval 'sub lro_tcp_d_len () { ($PH_loc->{sixteen[0]});}' unless defined(&lro_tcp_d_len);
    eval 'sub lro_tcp_d_csum () { ($PH_loc->{sixteen[1]});}' unless defined(&lro_tcp_d_csum);
    eval 'sub lro_tcp_h_off () { ($PH_loc->{sixteen[2]});}' unless defined(&lro_tcp_h_off);
    eval 'sub lro_etype () { ($PH_loc->{sixteen[3]});}' unless defined(&lro_etype);
    eval 'sub MBUF_PEXT_HDR_LEN () {23;}' unless defined(&MBUF_PEXT_HDR_LEN);
    eval 'sub MBUF_PEXT_TRAIL_LEN () {64;}' unless defined(&MBUF_PEXT_TRAIL_LEN);
    if(defined(&__LP64__)) {
	eval 'sub MBUF_PEXT_MAX_PGS () {(40/ $sizeof{ &vm_paddr_t});}' unless defined(&MBUF_PEXT_MAX_PGS);
    } else {
	eval 'sub MBUF_PEXT_MAX_PGS () {(64/ $sizeof{ &vm_paddr_t});}' unless defined(&MBUF_PEXT_MAX_PGS);
    }
    eval 'sub MBUF_PEXT_MAX_BYTES () {( &MBUF_PEXT_MAX_PGS *  &PAGE_SIZE +  &MBUF_PEXT_HDR_LEN +  &MBUF_PEXT_TRAIL_LEN);}' unless defined(&MBUF_PEXT_MAX_BYTES);
    eval 'sub m_ext_copylen () { &offsetof(\'struct m_ext\',  &ext_arg2);}' unless defined(&m_ext_copylen);
    eval 'sub m_epg_pa () { ($m_ext->{extpg_pa});}' unless defined(&m_epg_pa);
    eval 'sub m_epg_trail () { ($m_ext->{extpg_trail});}' unless defined(&m_epg_trail);
    eval 'sub m_epg_hdr () { ($m_ext->{extpg_hdr});}' unless defined(&m_epg_hdr);
    eval 'sub m_epg_ext_copylen () { &offsetof(\'struct m_ext\',  &ext_free);}' unless defined(&m_epg_ext_copylen);
    if(!defined(&__LP64__)) {
    }
    eval 'sub m_epg_startcopy () { &m_epg_npgs;}' unless defined(&m_epg_startcopy);
    eval 'sub m_epg_endcopy () { &m_epg_stailq;}' unless defined(&m_epg_endcopy);
    eval 'sub EPG_FLAG_ANON () {0x1;}' unless defined(&EPG_FLAG_ANON);
    eval 'sub EPG_FLAG_2FREE () {0x2;}' unless defined(&EPG_FLAG_2FREE);
    if(defined(&_KERNEL)) {
	eval 'sub m_epg_pagelen {
	    my($m,$pidx,$pgoff) = @_;
    	    eval q({  &KASSERT($pgoff == 0|| $pidx == 0, (\\"page %d with non-zero offset %d in %p\\", $pidx, $pgoff, $m));  &if ($pidx ==  ($m->{m_epg_npgs}) - 1) { ( ($m->{m_epg_last_len})); }  &else { ( &PAGE_SIZE - $pgoff); } });
	}' unless defined(&m_epg_pagelen);
	if(defined(&INVARIANTS)) {
	    eval 'sub MCHECK {
	        my($ex, $msg) = @_;
    		eval q( &KASSERT(($ex), (\\"Multi page mbuf %p with \\" $msg \\" at %s:%d\\",  &m,  &__FILE__,  &__LINE__)));
	    }' unless defined(&MCHECK);
	    eval 'sub MBUF_EXT_PGS_ASSERT_SANITY {
	        my($m) = @_;
    		eval q( &do {  &MCHECK( ($m->{m_epg_npgs}) > 0, \\"no valid pages\\");  &MCHECK( ($m->{m_epg_npgs}) <=  &nitems( ($m->{m_epg_pa})), \\"too many pages\\");  &MCHECK( ($m->{m_epg_nrdy}) <=  ($m->{m_epg_npgs}), \\"too many ready pages\\");  &MCHECK( ($m->{m_epg_1st_off}) <  &PAGE_SIZE, \\"too large page offset\\");  &MCHECK( ($m->{m_epg_last_len}) > 0, \\"zero last page length\\");  &MCHECK( ($m->{m_epg_last_len}) <=  &PAGE_SIZE, \\"too large last page length\\");  &if ( ($m->{m_epg_npgs}) == 1)  &MCHECK( ($m->{m_epg_1st_off}) +  ($m->{m_epg_last_len}) <=  &PAGE_SIZE, \\"single page too large\\");  &MCHECK( ($m->{m_epg_hdrlen}) <= $sizeof{ ($m->{m_epg_hdr})}, \\"too large header length\\");  &MCHECK( ($m->{m_epg_trllen}) <= $sizeof{ ($m->{m_epg_trail})}, \\"too large header length\\"); }  &while (0));
	    }' unless defined(&MBUF_EXT_PGS_ASSERT_SANITY);
	} else {
	    eval 'sub MBUF_EXT_PGS_ASSERT_SANITY {
	        my($m) = @_;
    		eval q( &do {}  &while (0));
	    }' unless defined(&MBUF_EXT_PGS_ASSERT_SANITY);
	}
    }
    eval 'sub M_EXT () {0x1;}' unless defined(&M_EXT);
    eval 'sub M_PKTHDR () {0x2;}' unless defined(&M_PKTHDR);
    eval 'sub M_EOR () {0x4;}' unless defined(&M_EOR);
    eval 'sub M_RDONLY () {0x8;}' unless defined(&M_RDONLY);
    eval 'sub M_BCAST () {0x10;}' unless defined(&M_BCAST);
    eval 'sub M_MCAST () {0x20;}' unless defined(&M_MCAST);
    eval 'sub M_PROMISC () {0x40;}' unless defined(&M_PROMISC);
    eval 'sub M_VLANTAG () {0x80;}' unless defined(&M_VLANTAG);
    eval 'sub M_EXTPG () {0x100;}' unless defined(&M_EXTPG);
    eval 'sub M_NOFREE () {0x200;}' unless defined(&M_NOFREE);
    eval 'sub M_TSTMP () {0x400;}' unless defined(&M_TSTMP);
    eval 'sub M_TSTMP_HPREC () {0x800;}' unless defined(&M_TSTMP_HPREC);
    eval 'sub M_TSTMP_LRO () {0x1000;}' unless defined(&M_TSTMP_LRO);
    eval 'sub M_PROTO1 () {0x2000;}' unless defined(&M_PROTO1);
    eval 'sub M_PROTO2 () {0x4000;}' unless defined(&M_PROTO2);
    eval 'sub M_PROTO3 () {0x8000;}' unless defined(&M_PROTO3);
    eval 'sub M_PROTO4 () {0x10000;}' unless defined(&M_PROTO4);
    eval 'sub M_PROTO5 () {0x20000;}' unless defined(&M_PROTO5);
    eval 'sub M_PROTO6 () {0x40000;}' unless defined(&M_PROTO6);
    eval 'sub M_PROTO7 () {0x80000;}' unless defined(&M_PROTO7);
    eval 'sub M_PROTO8 () {0x100000;}' unless defined(&M_PROTO8);
    eval 'sub M_PROTO9 () {0x200000;}' unless defined(&M_PROTO9);
    eval 'sub M_PROTO10 () {0x400000;}' unless defined(&M_PROTO10);
    eval 'sub M_PROTO11 () {0x800000;}' unless defined(&M_PROTO11);
    eval 'sub M_PROTOFLAGS () {( &M_PROTO1| &M_PROTO2| &M_PROTO3| &M_PROTO4| &M_PROTO5| &M_PROTO6| &M_PROTO7| &M_PROTO8|  &M_PROTO9| &M_PROTO10| &M_PROTO11);}' unless defined(&M_PROTOFLAGS);
    eval 'sub M_COPYFLAGS () {( &M_PKTHDR| &M_EOR| &M_RDONLY| &M_BCAST| &M_MCAST| &M_PROMISC| &M_VLANTAG| &M_TSTMP|  &M_TSTMP_HPREC| &M_TSTMP_LRO| &M_PROTOFLAGS);}' unless defined(&M_COPYFLAGS);
    eval 'sub M_DEMOTEFLAGS () {( &M_EXT |  &M_RDONLY |  &M_NOFREE |  &M_EXTPG);}' unless defined(&M_DEMOTEFLAGS);
    eval 'sub M_FLAG_BITS () {"\\20\\1M_EXT\\2M_PKTHDR\\3M_EOR\\4M_RDONLY\\5M_BCAST\\6M_MCAST" "\\7M_PROMISC\\10M_VLANTAG\\11M_EXTPG\\12M_NOFREE\\13M_TSTMP\\14M_TSTMP_HPREC\\15M_TSTMP_LRO";}' unless defined(&M_FLAG_BITS);
    eval 'sub M_FLAG_PROTOBITS () {"\\16M_PROTO1\\17M_PROTO2\\20M_PROTO3\\21M_PROTO4" "\\22M_PROTO5\\23M_PROTO6\\24M_PROTO7\\25M_PROTO8\\26M_PROTO9" "\\27M_PROTO10\\28M_PROTO11";}' unless defined(&M_FLAG_PROTOBITS);
    eval 'sub M_FLAG_PRINTF () {( &M_FLAG_BITS  &M_FLAG_PROTOBITS);}' unless defined(&M_FLAG_PRINTF);
    eval 'sub M_HASHTYPE_HASHPROP () {0x80;}' unless defined(&M_HASHTYPE_HASHPROP);
    eval 'sub M_HASHTYPE_INNER () {0x40;}' unless defined(&M_HASHTYPE_INNER);
    eval 'sub M_HASHTYPE_HASH {
        my($t) = @_;
	    eval q(( &M_HASHTYPE_HASHPROP | ($t)));
    }' unless defined(&M_HASHTYPE_HASH);
    eval 'sub M_HASHTYPE_NONE () {0;}' unless defined(&M_HASHTYPE_NONE);
    eval 'sub M_HASHTYPE_RSS_IPV4 () { &M_HASHTYPE_HASH(1);}' unless defined(&M_HASHTYPE_RSS_IPV4);
    eval 'sub M_HASHTYPE_RSS_TCP_IPV4 () { &M_HASHTYPE_HASH(2);}' unless defined(&M_HASHTYPE_RSS_TCP_IPV4);
    eval 'sub M_HASHTYPE_RSS_IPV6 () { &M_HASHTYPE_HASH(3);}' unless defined(&M_HASHTYPE_RSS_IPV6);
    eval 'sub M_HASHTYPE_RSS_TCP_IPV6 () { &M_HASHTYPE_HASH(4);}' unless defined(&M_HASHTYPE_RSS_TCP_IPV6);
    eval 'sub M_HASHTYPE_RSS_IPV6_EX () { &M_HASHTYPE_HASH(5);}' unless defined(&M_HASHTYPE_RSS_IPV6_EX);
    eval 'sub M_HASHTYPE_RSS_TCP_IPV6_EX () { &M_HASHTYPE_HASH(6);}' unless defined(&M_HASHTYPE_RSS_TCP_IPV6_EX);
    eval 'sub M_HASHTYPE_RSS_UDP_IPV4 () { &M_HASHTYPE_HASH(7);}' unless defined(&M_HASHTYPE_RSS_UDP_IPV4);
    eval 'sub M_HASHTYPE_RSS_UDP_IPV6 () { &M_HASHTYPE_HASH(9);}' unless defined(&M_HASHTYPE_RSS_UDP_IPV6);
    eval 'sub M_HASHTYPE_RSS_UDP_IPV6_EX () { &M_HASHTYPE_HASH(10);}' unless defined(&M_HASHTYPE_RSS_UDP_IPV6_EX);
    eval 'sub M_HASHTYPE_OPAQUE () {0x3f;}' unless defined(&M_HASHTYPE_OPAQUE);
    eval 'sub M_HASHTYPE_OPAQUE_HASH () { &M_HASHTYPE_HASH( &M_HASHTYPE_OPAQUE);}' unless defined(&M_HASHTYPE_OPAQUE_HASH);
    eval 'sub M_HASHTYPE_CLEAR {
        my($m) = @_;
	    eval q((($m)-> ($m_pkthdr->{rsstype}) = 0));
    }' unless defined(&M_HASHTYPE_CLEAR);
    eval 'sub M_HASHTYPE_GET {
        my($m) = @_;
	    eval q((($m)-> ($m_pkthdr->{rsstype}) & ~ &M_HASHTYPE_INNER));
    }' unless defined(&M_HASHTYPE_GET);
    eval 'sub M_HASHTYPE_SET {
        my($m, $v) = @_;
	    eval q((($m)-> ($m_pkthdr->{rsstype}) = ($v)));
    }' unless defined(&M_HASHTYPE_SET);
    eval 'sub M_HASHTYPE_TEST {
        my($m, $v) = @_;
	    eval q(( &M_HASHTYPE_GET($m) == ($v)));
    }' unless defined(&M_HASHTYPE_TEST);
    eval 'sub M_HASHTYPE_ISHASH {
        my($m) = @_;
	    eval q(((($m)-> ($m_pkthdr->{rsstype}) &  &M_HASHTYPE_HASHPROP) != 0));
    }' unless defined(&M_HASHTYPE_ISHASH);
    eval 'sub M_HASHTYPE_SETINNER {
        my($m) = @_;
	    eval q( &do { ($m)-> ($m_pkthdr->{rsstype}) |=  &M_HASHTYPE_INNER; }  &while (0));
    }' unless defined(&M_HASHTYPE_SETINNER);
    eval 'sub EXT_CLUSTER () {1;}' unless defined(&EXT_CLUSTER);
    eval 'sub EXT_SFBUF () {2;}' unless defined(&EXT_SFBUF);
    eval 'sub EXT_JUMBOP () {3;}' unless defined(&EXT_JUMBOP);
    eval 'sub EXT_JUMBO9 () {4;}' unless defined(&EXT_JUMBO9);
    eval 'sub EXT_JUMBO16 () {5;}' unless defined(&EXT_JUMBO16);
    eval 'sub EXT_PACKET () {6;}' unless defined(&EXT_PACKET);
    eval 'sub EXT_MBUF () {7;}' unless defined(&EXT_MBUF);
    eval 'sub EXT_RXRING () {8;}' unless defined(&EXT_RXRING);
    eval 'sub EXT_VENDOR1 () {224;}' unless defined(&EXT_VENDOR1);
    eval 'sub EXT_VENDOR2 () {225;}' unless defined(&EXT_VENDOR2);
    eval 'sub EXT_VENDOR3 () {226;}' unless defined(&EXT_VENDOR3);
    eval 'sub EXT_VENDOR4 () {227;}' unless defined(&EXT_VENDOR4);
    eval 'sub EXT_EXP1 () {244;}' unless defined(&EXT_EXP1);
    eval 'sub EXT_EXP2 () {245;}' unless defined(&EXT_EXP2);
    eval 'sub EXT_EXP3 () {246;}' unless defined(&EXT_EXP3);
    eval 'sub EXT_EXP4 () {247;}' unless defined(&EXT_EXP4);
    eval 'sub EXT_NET_DRV () {252;}' unless defined(&EXT_NET_DRV);
    eval 'sub EXT_MOD_TYPE () {253;}' unless defined(&EXT_MOD_TYPE);
    eval 'sub EXT_DISPOSABLE () {254;}' unless defined(&EXT_DISPOSABLE);
    eval 'sub EXT_EXTREF () {255;}' unless defined(&EXT_EXTREF);
    eval 'sub EXT_FLAG_EMBREF () {0x1;}' unless defined(&EXT_FLAG_EMBREF);
    eval 'sub EXT_FLAG_EXTREF () {0x2;}' unless defined(&EXT_FLAG_EXTREF);
    eval 'sub EXT_FLAG_NOFREE () {0x10;}' unless defined(&EXT_FLAG_NOFREE);
    eval 'sub EXT_FLAG_VENDOR1 () {0x10000;}' unless defined(&EXT_FLAG_VENDOR1);
    eval 'sub EXT_FLAG_VENDOR2 () {0x20000;}' unless defined(&EXT_FLAG_VENDOR2);
    eval 'sub EXT_FLAG_VENDOR3 () {0x40000;}' unless defined(&EXT_FLAG_VENDOR3);
    eval 'sub EXT_FLAG_VENDOR4 () {0x80000;}' unless defined(&EXT_FLAG_VENDOR4);
    eval 'sub EXT_FLAG_EXP1 () {0x100000;}' unless defined(&EXT_FLAG_EXP1);
    eval 'sub EXT_FLAG_EXP2 () {0x200000;}' unless defined(&EXT_FLAG_EXP2);
    eval 'sub EXT_FLAG_EXP3 () {0x400000;}' unless defined(&EXT_FLAG_EXP3);
    eval 'sub EXT_FLAG_EXP4 () {0x800000;}' unless defined(&EXT_FLAG_EXP4);
    eval 'sub EXT_FLAG_BITS () {"\\20\\1EXT_FLAG_EMBREF\\2EXT_FLAG_EXTREF\\5EXT_FLAG_NOFREE" "\\21EXT_FLAG_VENDOR1\\22EXT_FLAG_VENDOR2\\23EXT_FLAG_VENDOR3" "\\24EXT_FLAG_VENDOR4\\25EXT_FLAG_EXP1\\26EXT_FLAG_EXP2\\27EXT_FLAG_EXP3" "\\30EXT_FLAG_EXP4";}' unless defined(&EXT_FLAG_BITS);
    eval 'sub CSUM_IP () {0x1;}' unless defined(&CSUM_IP);
    eval 'sub CSUM_IP_UDP () {0x2;}' unless defined(&CSUM_IP_UDP);
    eval 'sub CSUM_IP_TCP () {0x4;}' unless defined(&CSUM_IP_TCP);
    eval 'sub CSUM_IP_SCTP () {0x8;}' unless defined(&CSUM_IP_SCTP);
    eval 'sub CSUM_IP_TSO () {0x10;}' unless defined(&CSUM_IP_TSO);
    eval 'sub CSUM_IP_ISCSI () {0x20;}' unless defined(&CSUM_IP_ISCSI);
    eval 'sub CSUM_INNER_IP6_UDP () {0x40;}' unless defined(&CSUM_INNER_IP6_UDP);
    eval 'sub CSUM_INNER_IP6_TCP () {0x80;}' unless defined(&CSUM_INNER_IP6_TCP);
    eval 'sub CSUM_INNER_IP6_TSO () {0x100;}' unless defined(&CSUM_INNER_IP6_TSO);
    eval 'sub CSUM_IP6_UDP () {0x200;}' unless defined(&CSUM_IP6_UDP);
    eval 'sub CSUM_IP6_TCP () {0x400;}' unless defined(&CSUM_IP6_TCP);
    eval 'sub CSUM_IP6_SCTP () {0x800;}' unless defined(&CSUM_IP6_SCTP);
    eval 'sub CSUM_IP6_TSO () {0x1000;}' unless defined(&CSUM_IP6_TSO);
    eval 'sub CSUM_IP6_ISCSI () {0x2000;}' unless defined(&CSUM_IP6_ISCSI);
    eval 'sub CSUM_INNER_IP () {0x4000;}' unless defined(&CSUM_INNER_IP);
    eval 'sub CSUM_INNER_IP_UDP () {0x8000;}' unless defined(&CSUM_INNER_IP_UDP);
    eval 'sub CSUM_INNER_IP_TCP () {0x10000;}' unless defined(&CSUM_INNER_IP_TCP);
    eval 'sub CSUM_INNER_IP_TSO () {0x20000;}' unless defined(&CSUM_INNER_IP_TSO);
    eval 'sub CSUM_ENCAP_VXLAN () {0x40000;}' unless defined(&CSUM_ENCAP_VXLAN);
    eval 'sub CSUM_ENCAP_RSVD1 () {0x80000;}' unless defined(&CSUM_ENCAP_RSVD1);
    eval 'sub CSUM_INNER_L3_CALC () {0x100000;}' unless defined(&CSUM_INNER_L3_CALC);
    eval 'sub CSUM_INNER_L3_VALID () {0x200000;}' unless defined(&CSUM_INNER_L3_VALID);
    eval 'sub CSUM_INNER_L4_CALC () {0x400000;}' unless defined(&CSUM_INNER_L4_CALC);
    eval 'sub CSUM_INNER_L4_VALID () {0x800000;}' unless defined(&CSUM_INNER_L4_VALID);
    eval 'sub CSUM_L3_CALC () {0x1000000;}' unless defined(&CSUM_L3_CALC);
    eval 'sub CSUM_L3_VALID () {0x2000000;}' unless defined(&CSUM_L3_VALID);
    eval 'sub CSUM_L4_CALC () {0x4000000;}' unless defined(&CSUM_L4_CALC);
    eval 'sub CSUM_L4_VALID () {0x8000000;}' unless defined(&CSUM_L4_VALID);
    eval 'sub CSUM_L5_CALC () {0x10000000;}' unless defined(&CSUM_L5_CALC);
    eval 'sub CSUM_L5_VALID () {0x20000000;}' unless defined(&CSUM_L5_VALID);
    eval 'sub CSUM_COALESCED () {0x40000000;}' unless defined(&CSUM_COALESCED);
    eval 'sub CSUM_SND_TAG () {0x80000000;}' unless defined(&CSUM_SND_TAG);
    eval 'sub CSUM_FLAGS_TX () {( &CSUM_IP |  &CSUM_IP_UDP |  &CSUM_IP_TCP |  &CSUM_IP_SCTP |  &CSUM_IP_TSO |  &CSUM_IP_ISCSI |  &CSUM_INNER_IP6_UDP |  &CSUM_INNER_IP6_TCP |  &CSUM_INNER_IP6_TSO |  &CSUM_IP6_UDP |  &CSUM_IP6_TCP |  &CSUM_IP6_SCTP |  &CSUM_IP6_TSO |  &CSUM_IP6_ISCSI |  &CSUM_INNER_IP |  &CSUM_INNER_IP_UDP |  &CSUM_INNER_IP_TCP |  &CSUM_INNER_IP_TSO |  &CSUM_ENCAP_VXLAN |  &CSUM_ENCAP_RSVD1 |  &CSUM_SND_TAG);}' unless defined(&CSUM_FLAGS_TX);
    eval 'sub CSUM_FLAGS_RX () {( &CSUM_INNER_L3_CALC |  &CSUM_INNER_L3_VALID |  &CSUM_INNER_L4_CALC |  &CSUM_INNER_L4_VALID |  &CSUM_L3_CALC |  &CSUM_L3_VALID |  &CSUM_L4_CALC |  &CSUM_L4_VALID |  &CSUM_L5_CALC |  &CSUM_L5_VALID |  &CSUM_COALESCED);}' unless defined(&CSUM_FLAGS_RX);
    eval 'sub CSUM_BITS () {"\\20\\1CSUM_IP\\2CSUM_IP_UDP\\3CSUM_IP_TCP\\4CSUM_IP_SCTP\\5CSUM_IP_TSO" "\\6CSUM_IP_ISCSI\\7CSUM_INNER_IP6_UDP\\10CSUM_INNER_IP6_TCP" "\\11CSUM_INNER_IP6_TSO\\12CSUM_IP6_UDP\\13CSUM_IP6_TCP\\14CSUM_IP6_SCTP" "\\15CSUM_IP6_TSO\\16CSUM_IP6_ISCSI\\17CSUM_INNER_IP\\20CSUM_INNER_IP_UDP" "\\21CSUM_INNER_IP_TCP\\22CSUM_INNER_IP_TSO\\23CSUM_ENCAP_VXLAN" "\\24CSUM_ENCAP_RSVD1\\25CSUM_INNER_L3_CALC\\26CSUM_INNER_L3_VALID" "\\27CSUM_INNER_L4_CALC\\30CSUM_INNER_L4_VALID\\31CSUM_L3_CALC" "\\32CSUM_L3_VALID\\33CSUM_L4_CALC\\34CSUM_L4_VALID\\35CSUM_L5_CALC" "\\36CSUM_L5_VALID\\37CSUM_COALESCED\\40CSUM_SND_TAG";}' unless defined(&CSUM_BITS);
    eval 'sub CSUM_IP_CHECKED () { &CSUM_L3_CALC;}' unless defined(&CSUM_IP_CHECKED);
    eval 'sub CSUM_IP_VALID () { &CSUM_L3_VALID;}' unless defined(&CSUM_IP_VALID);
    eval 'sub CSUM_DATA_VALID () { &CSUM_L4_VALID;}' unless defined(&CSUM_DATA_VALID);
    eval 'sub CSUM_PSEUDO_HDR () { &CSUM_L4_CALC;}' unless defined(&CSUM_PSEUDO_HDR);
    eval 'sub CSUM_SCTP_VALID () { &CSUM_L4_VALID;}' unless defined(&CSUM_SCTP_VALID);
    eval 'sub CSUM_DELAY_DATA () {( &CSUM_TCP| &CSUM_UDP);}' unless defined(&CSUM_DELAY_DATA);
    eval 'sub CSUM_DELAY_IP () { &CSUM_IP;}' unless defined(&CSUM_DELAY_IP);
    eval 'sub CSUM_DELAY_DATA_IPV6 () {( &CSUM_TCP_IPV6| &CSUM_UDP_IPV6);}' unless defined(&CSUM_DELAY_DATA_IPV6);
    eval 'sub CSUM_DATA_VALID_IPV6 () { &CSUM_DATA_VALID;}' unless defined(&CSUM_DATA_VALID_IPV6);
    eval 'sub CSUM_TCP () { &CSUM_IP_TCP;}' unless defined(&CSUM_TCP);
    eval 'sub CSUM_UDP () { &CSUM_IP_UDP;}' unless defined(&CSUM_UDP);
    eval 'sub CSUM_SCTP () { &CSUM_IP_SCTP;}' unless defined(&CSUM_SCTP);
    eval 'sub CSUM_TSO () {( &CSUM_IP_TSO| &CSUM_IP6_TSO);}' unless defined(&CSUM_TSO);
    eval 'sub CSUM_INNER_TSO () {( &CSUM_INNER_IP_TSO| &CSUM_INNER_IP6_TSO);}' unless defined(&CSUM_INNER_TSO);
    eval 'sub CSUM_UDP_IPV6 () { &CSUM_IP6_UDP;}' unless defined(&CSUM_UDP_IPV6);
    eval 'sub CSUM_TCP_IPV6 () { &CSUM_IP6_TCP;}' unless defined(&CSUM_TCP_IPV6);
    eval 'sub CSUM_SCTP_IPV6 () { &CSUM_IP6_SCTP;}' unless defined(&CSUM_SCTP_IPV6);
    eval 'sub CSUM_TLS_MASK () {( &CSUM_L5_CALC| &CSUM_L5_VALID);}' unless defined(&CSUM_TLS_MASK);
    eval 'sub CSUM_TLS_DECRYPTED () { &CSUM_L5_CALC;}' unless defined(&CSUM_TLS_DECRYPTED);
    eval 'sub MT_NOTMBUF () {0;}' unless defined(&MT_NOTMBUF);
    eval 'sub MT_DATA () {1;}' unless defined(&MT_DATA);
    eval 'sub MT_HEADER () { &MT_DATA;}' unless defined(&MT_HEADER);
    eval 'sub MT_VENDOR1 () {4;}' unless defined(&MT_VENDOR1);
    eval 'sub MT_VENDOR2 () {5;}' unless defined(&MT_VENDOR2);
    eval 'sub MT_VENDOR3 () {6;}' unless defined(&MT_VENDOR3);
    eval 'sub MT_VENDOR4 () {7;}' unless defined(&MT_VENDOR4);
    eval 'sub MT_SONAME () {8;}' unless defined(&MT_SONAME);
    eval 'sub MT_EXP1 () {9;}' unless defined(&MT_EXP1);
    eval 'sub MT_EXP2 () {10;}' unless defined(&MT_EXP2);
    eval 'sub MT_EXP3 () {11;}' unless defined(&MT_EXP3);
    eval 'sub MT_EXP4 () {12;}' unless defined(&MT_EXP4);
    eval 'sub MT_CONTROL () {14;}' unless defined(&MT_CONTROL);
    eval 'sub MT_EXTCONTROL () {15;}' unless defined(&MT_EXTCONTROL);
    eval 'sub MT_OOBDATA () {16;}' unless defined(&MT_OOBDATA);
    eval 'sub MT_NOINIT () {255;}' unless defined(&MT_NOINIT);
    eval 'sub MBUF_MEM_NAME () {"mbuf";}' unless defined(&MBUF_MEM_NAME);
    eval 'sub MBUF_CLUSTER_MEM_NAME () {"mbuf_cluster";}' unless defined(&MBUF_CLUSTER_MEM_NAME);
    eval 'sub MBUF_PACKET_MEM_NAME () {"mbuf_packet";}' unless defined(&MBUF_PACKET_MEM_NAME);
    eval 'sub MBUF_JUMBOP_MEM_NAME () {"mbuf_jumbo_page";}' unless defined(&MBUF_JUMBOP_MEM_NAME);
    eval 'sub MBUF_JUMBO9_MEM_NAME () {"mbuf_jumbo_9k";}' unless defined(&MBUF_JUMBO9_MEM_NAME);
    eval 'sub MBUF_JUMBO16_MEM_NAME () {"mbuf_jumbo_16k";}' unless defined(&MBUF_JUMBO16_MEM_NAME);
    eval 'sub MBUF_TAG_MEM_NAME () {"mbuf_tag";}' unless defined(&MBUF_TAG_MEM_NAME);
    eval 'sub MBUF_EXTREFCNT_MEM_NAME () {"mbuf_ext_refcnt";}' unless defined(&MBUF_EXTREFCNT_MEM_NAME);
    eval 'sub MBUF_EXTPGS_MEM_NAME () {"mbuf_extpgs";}' unless defined(&MBUF_EXTPGS_MEM_NAME);
    if(defined(&_KERNEL)) {
	eval 'sub MBUF_CHECKSLEEP {
	    my($how) = @_;
    	    eval q( &do {  &if ($how ==  &M_WAITOK)  &WITNESS_WARN( &WARN_GIANTOK |  &WARN_SLEEPOK,  &NULL, \\"Sleeping in \\\\\\"%s\\\\\\"\\",  &__func__); }  &while (0));
	}' unless defined(&MBUF_CHECKSLEEP);
	eval 'sub m_gettype {
	    my($size) = @_;
    	    eval q({ \'int\'  &type;  &switch ($size) {  &case  &MSIZE:  &type =  &EXT_MBUF;  &break;  &case  &MCLBYTES:  &type =  &EXT_CLUSTER;  &break;  &case  &MJUMPAGESIZE:  &type =  &EXT_JUMBOP;  &break;  &case  &MJUM9BYTES:  &type =  &EXT_JUMBO9;  &break;  &case  &MJUM16BYTES:  &type =  &EXT_JUMBO16;  &break;  &default:  &panic(\\"%s: invalid cluster size %d\\",  &__func__, $size); } ( &type); });
	}' unless defined(&m_gettype);
	eval 'sub m_getzone {
	    my($size) = @_;
    	    eval q({  &uma_zone_t  &zone;  &switch ($size) {  &case  &MCLBYTES:  &zone =  &zone_clust;  &break;  &case  &MJUMPAGESIZE:  &zone =  &zone_jumbop;  &break;  &case  &MJUM9BYTES:  &zone =  &zone_jumbo9;  &break;  &case  &MJUM16BYTES:  &zone =  &zone_jumbo16;  &break;  &default:  &panic(\\"%s: invalid cluster size %d\\",  &__func__, $size); } ( &zone); });
	}' unless defined(&m_getzone);
	eval 'sub m_get_raw {
	    my($how,$type) = @_;
    	    eval q({ \'struct mbuf\' * &m; \'struct mb_args\'  &args;  ($args->{flags}) = 0;  ($args->{type}) = $type |  &MT_NOINIT;  &m =  &uma_zalloc_arg( &zone_mbuf,  &args, $how);  &MBUF_PROBE3( &m__get_raw, $how, $type,  &m); ( &m); });
	}' unless defined(&m_get_raw);
	eval 'sub m_get {
	    my($how,$type) = @_;
    	    eval q({ \'struct mbuf\' * &m; \'struct mb_args\'  &args;  ($args->{flags}) = 0;  ($args->{type}) = $type;  &m =  &uma_zalloc_arg( &zone_mbuf,  &args, $how);  &MBUF_PROBE3( &m__get, $how, $type,  &m); ( &m); });
	}' unless defined(&m_get);
	eval 'sub m_gethdr_raw {
	    my($how,$type) = @_;
    	    eval q({ \'struct mbuf\' * &m; \'struct mb_args\'  &args;  ($args->{flags}) =  &M_PKTHDR;  ($args->{type}) = $type |  &MT_NOINIT;  &m =  &uma_zalloc_arg( &zone_mbuf,  &args, $how);  &MBUF_PROBE3( &m__gethdr_raw, $how, $type,  &m); ( &m); });
	}' unless defined(&m_gethdr_raw);
	eval 'sub m_gethdr {
	    my($how,$type) = @_;
    	    eval q({ \'struct mbuf\' * &m; \'struct mb_args\'  &args;  ($args->{flags}) =  &M_PKTHDR;  ($args->{type}) = $type;  &m =  &uma_zalloc_arg( &zone_mbuf,  &args, $how);  &MBUF_PROBE3( &m__gethdr, $how, $type,  &m); ( &m); });
	}' unless defined(&m_gethdr);
	eval 'sub m_getcl {
	    my($how,$type,$flags) = @_;
    	    eval q({ \'struct mbuf\' * &m; \'struct mb_args\'  &args;  ($args->{flags}) = $flags;  ($args->{type}) = $type;  &m =  &uma_zalloc_arg( &zone_pack,  &args, $how);  &MBUF_PROBE4( &m__getcl, $how, $type, $flags,  &m); ( &m); });
	}' unless defined(&m_getcl);
	eval 'sub m_chtype {
	    my($m,$new_type) = @_;
    	    eval q({  ($m->{m_type}) = $new_type; });
	}' unless defined(&m_chtype);
	eval 'sub m_clrprotoflags {
	    my($m) = @_;
    	    eval q({  &while ($m) {  ($m->{m_flags}) &= ~ &M_PROTOFLAGS; $m =  ($m->{m_next}); } });
	}' unless defined(&m_clrprotoflags);
	eval 'sub m_last {
	    my($m) = @_;
    	    eval q({  &while ( ($m->{m_next})) $m =  ($m->{m_next}); ($m); });
	}' unless defined(&m_last);
	eval 'sub m_extrefcnt {
	    my($m) = @_;
    	    eval q({  &KASSERT( ($m->{m_flags}) &  &M_EXT, (\\"%s: M_EXT missing\\",  &__func__)); (( ($m->{m_ext}->{ext_flags}) &  &EXT_FLAG_EMBREF) ?  ($m->{m_ext}->{ext_count}) : * ($m->{m_ext}->{ext_cnt})); });
	}' unless defined(&m_extrefcnt);
	eval 'sub M_MOVE_PKTHDR {
	    my($to, $from) = @_;
    	    eval q( &m_move_pkthdr(($to), ($from)));
	}' unless defined(&M_MOVE_PKTHDR);
	eval 'sub MGET {
	    my($m, $how, $type) = @_;
    	    eval q((($m) =  &m_get(($how), ($type))));
	}' unless defined(&MGET);
	eval 'sub MGETHDR {
	    my($m, $how, $type) = @_;
    	    eval q((($m) =  &m_gethdr(($how), ($type))));
	}' unless defined(&MGETHDR);
	eval 'sub MCLGET {
	    my($m, $how) = @_;
    	    eval q( &m_clget(($m), ($how)));
	}' unless defined(&MCLGET);
	eval 'sub MEXTADD {
	    my($m, $buf, $size, $free, $arg1, $arg2, $flags, $type) = @_;
    	    eval q( &m_extadd(, ($buf), ($size), ($free), ($arg1), ($arg2), ($flags), ($type)));
	}' unless defined(&MEXTADD);
	eval 'sub m_getm {
	    my($m, $len, $how, $type) = @_;
    	    eval q( &m_getm2(($m), ($len), ($how), ($type),  &M_PKTHDR));
	}' unless defined(&m_getm);
	eval 'sub M_WRITABLE {
	    my($m) = @_;
    	    eval q(((($m)-> &m_flags & ( &M_RDONLY |  &M_EXTPG)) == 0 && (!((($m)-> &m_flags &  &M_EXT)) || ( &m_extrefcnt($m) == 1))));
	}' unless defined(&M_WRITABLE);
	eval 'sub M_ASSERTPKTHDR {
	    my($m) = @_;
    	    eval q( &KASSERT(($m) !=  &NULL  && ($m)-> &m_flags &  &M_PKTHDR, (\\"%s: no mbuf packet header!\\",  &__func__)));
	}' unless defined(&M_ASSERTPKTHDR);
	eval 'sub M_ASSERT_NO_SND_TAG {
	    my($m) = @_;
    	    eval q( &KASSERT(($m) !=  &NULL  && ($m)-> &m_flags &  &M_PKTHDR  && (($m)-> ($m_pkthdr->{csum_flags}) &  &CSUM_SND_TAG) == 0, (\\"%s: receive mbuf has send tag!\\",  &__func__)));
	}' unless defined(&M_ASSERT_NO_SND_TAG);
	eval 'sub M_ASSERTEXTPG {
	    my($m) = @_;
    	    eval q( &KASSERT((($m)-> &m_flags & ( &M_EXTPG| &M_PKTHDR)) ==  &M_EXTPG, (\\"%s: m %p is not multipage!\\",  &__func__, $m)));
	}' unless defined(&M_ASSERTEXTPG);
	eval 'sub M_ASSERTVALID {
	    my($m) = @_;
    	    eval q( &KASSERT((($m)-> &m_flags & 0) == 0, (\\"%s: attempted use of a free mbuf!\\",  &__func__)));
	}' unless defined(&M_ASSERTVALID);
	if(defined(&INVARIANTS)) {
	    eval 'sub M_ASSERTMAPPED {
	        my($m) = @_;
    		eval q( &do {  &for (\'struct mbuf\' * &__m = ($m);  &__m !=  &NULL;  &__m =  ($__m->{m_next}))  &KASSERT(( ($__m->{m_flags}) &  &M_EXTPG) == 0, (\\"%s: chain %p contains an unmapped mbuf\\",  &__func__, ($m)));}  &while (0));
	    }' unless defined(&M_ASSERTMAPPED);
	} else {
	    eval 'sub M_ASSERTMAPPED {
	        my($m) = @_;
    		eval q( &do {}  &while (0));
	    }' unless defined(&M_ASSERTMAPPED);
	}
	eval 'sub M_START {
	    my($m) = @_;
    	    eval q(((($m)-> &m_flags &  &M_EXTPG) ?  &NULL : (($m)-> &m_flags &  &M_EXT) ? ($m)-> ($m_ext->{ext_buf}) : (($m)-> &m_flags &  &M_PKTHDR) ? ($m)-> $m_pktdat[0] : ($m)-> $m_dat[0]));
	}' unless defined(&M_START);
	eval 'sub M_SIZE {
	    my($m) = @_;
    	    eval q(((($m)-> &m_flags &  &M_EXT) ? ($m)-> ($m_ext->{ext_size}) : (($m)-> &m_flags &  &M_PKTHDR) ?  &MHLEN :  &MLEN));
	}' unless defined(&M_SIZE);
	if(defined(&INVARIANTS)) {
	}
	eval 'sub M_ALIGN {
	    my($m, $len) = @_;
    	    eval q( &m_align($m, $len));
	}' unless defined(&M_ALIGN);
	eval 'sub MH_ALIGN {
	    my($m, $len) = @_;
    	    eval q( &m_align($m, $len));
	}' unless defined(&MH_ALIGN);
	eval 'sub MEXT_ALIGN {
	    my($m, $len) = @_;
    	    eval q( &m_align($m, $len));
	}' unless defined(&MEXT_ALIGN);
	eval 'sub M_LEADINGSPACE {
	    my($m) = @_;
    	    eval q(( &M_WRITABLE($m) ? (($m)-> &m_data -  &M_START($m)) : 0));
	}' unless defined(&M_LEADINGSPACE);
	eval 'sub M_TRAILINGROOM {
	    my($m) = @_;
    	    eval q((( &M_START($m) +  &M_SIZE($m)) - (($m)-> &m_data + ($m)-> &m_len)));
	}' unless defined(&M_TRAILINGROOM);
	eval 'sub M_TRAILINGSPACE {
	    my($m) = @_;
    	    eval q(( &M_WRITABLE($m) ?  &M_TRAILINGROOM($m) : 0));
	}' unless defined(&M_TRAILINGSPACE);
	eval 'sub M_PREPEND {
	    my($m, $plen, $how) = @_;
    	    eval q( &do { \'struct mbuf\' ** &_mmp = ($m); \'struct mbuf\' * &_mm = * &_mmp; \'int\'  &_mplen = ($plen); \'int\'  &__mhow = ($how);  &MBUF_CHECKSLEEP($how);  &if ( &M_LEADINGSPACE( &_mm) >=  &_mplen) {  ($_$mm->{m_data}) -=  &_mplen;  ($_$mm->{m_len}) +=  &_mplen; }  &else  &_mm =  &m_prepend( &_mm,  &_mplen,  &__mhow);  &if ( &_mm !=  &NULL  &&  ($_$mm->{m_flags}) &  &M_PKTHDR)  ($_$mm->{m_pkthdr}->{len}) +=  &_mplen; * &_mmp =  &_mm; }  &while (0));
	}' unless defined(&M_PREPEND);
	eval 'sub MCHTYPE {
	    my($m, $t) = @_;
    	    eval q( &m_chtype(($m), ($t)));
	}' unless defined(&MCHTYPE);
	eval 'sub M_COPYALL () {1000000000;}' unless defined(&M_COPYALL);
	eval 'sub MTAG_PERSISTENT () {0x800;}' unless defined(&MTAG_PERSISTENT);
	eval 'sub PACKET_TAG_NONE () {0;}' unless defined(&PACKET_TAG_NONE);
	eval 'sub PACKET_TAG_IPSEC_IN_DONE () {1;}' unless defined(&PACKET_TAG_IPSEC_IN_DONE);
	eval 'sub PACKET_TAG_IPSEC_OUT_DONE () {2;}' unless defined(&PACKET_TAG_IPSEC_OUT_DONE);
	eval 'sub PACKET_TAG_IPSEC_IN_CRYPTO_DONE () {3;}' unless defined(&PACKET_TAG_IPSEC_IN_CRYPTO_DONE);
	eval 'sub PACKET_TAG_IPSEC_OUT_CRYPTO_NEEDED () {4;}' unless defined(&PACKET_TAG_IPSEC_OUT_CRYPTO_NEEDED);
	eval 'sub PACKET_TAG_IPSEC_IN_COULD_DO_CRYPTO () {5;}' unless defined(&PACKET_TAG_IPSEC_IN_COULD_DO_CRYPTO);
	eval 'sub PACKET_TAG_IPSEC_PENDING_TDB () {6;}' unless defined(&PACKET_TAG_IPSEC_PENDING_TDB);
	eval 'sub PACKET_TAG_BRIDGE () {7;}' unless defined(&PACKET_TAG_BRIDGE);
	eval 'sub PACKET_TAG_GIF () {8;}' unless defined(&PACKET_TAG_GIF);
	eval 'sub PACKET_TAG_GRE () {9;}' unless defined(&PACKET_TAG_GRE);
	eval 'sub PACKET_TAG_IN_PACKET_CHECKSUM () {10;}' unless defined(&PACKET_TAG_IN_PACKET_CHECKSUM);
	eval 'sub PACKET_TAG_ENCAP () {11;}' unless defined(&PACKET_TAG_ENCAP);
	eval 'sub PACKET_TAG_IPSEC_SOCKET () {12;}' unless defined(&PACKET_TAG_IPSEC_SOCKET);
	eval 'sub PACKET_TAG_IPSEC_HISTORY () {13;}' unless defined(&PACKET_TAG_IPSEC_HISTORY);
	eval 'sub PACKET_TAG_IPV6_INPUT () {14;}' unless defined(&PACKET_TAG_IPV6_INPUT);
	eval 'sub PACKET_TAG_DUMMYNET () {15;}' unless defined(&PACKET_TAG_DUMMYNET);
	eval 'sub PACKET_TAG_DIVERT () {17;}' unless defined(&PACKET_TAG_DIVERT);
	eval 'sub PACKET_TAG_IPFORWARD () {18;}' unless defined(&PACKET_TAG_IPFORWARD);
	eval 'sub PACKET_TAG_MACLABEL () {(19|  &MTAG_PERSISTENT);}' unless defined(&PACKET_TAG_MACLABEL);
	eval 'sub PACKET_TAG_PF () {21;}' unless defined(&PACKET_TAG_PF);
	eval 'sub PACKET_TAG_IPOPTIONS () {27;}' unless defined(&PACKET_TAG_IPOPTIONS);
	eval 'sub PACKET_TAG_CARP () {28;}' unless defined(&PACKET_TAG_CARP);
	eval 'sub PACKET_TAG_IPSEC_NAT_T_PORTS () {29;}' unless defined(&PACKET_TAG_IPSEC_NAT_T_PORTS);
	eval 'sub PACKET_TAG_ND_OUTGOING () {30;}' unless defined(&PACKET_TAG_ND_OUTGOING);
	eval 'sub PACKET_TAG_PF_REASSEMBLED () {31;}' unless defined(&PACKET_TAG_PF_REASSEMBLED);
	eval 'sub MTAG_ABI_COMPAT () {0;}' unless defined(&MTAG_ABI_COMPAT);
	eval 'sub m_tag_get {
	    my($type,$length,$wait) = @_;
    	    eval q({ ( &m_tag_alloc( &MTAG_ABI_COMPAT, $type, $length, $wait)); });
	}' unless defined(&m_tag_get);
	eval 'sub m_tag_find {
	    my($m,$type,$start) = @_;
    	    eval q({ ( &SLIST_EMPTY( ($m->{m_pkthdr}->{tags})) ?  &NULL :  &m_tag_locate($m,  &MTAG_ABI_COMPAT, $type, $start)); });
	}' unless defined(&m_tag_find);
	eval 'sub m_snd_tag_ref {
	    my($mst) = @_;
    	    eval q({  &refcount_acquire( ($mst->{refcount})); ($mst); });
	}' unless defined(&m_snd_tag_ref);
	eval 'sub m_snd_tag_rele {
	    my($mst) = @_;
    	    eval q({  &if ( &refcount_release( ($mst->{refcount})))  &m_snd_tag_destroy($mst); });
	}' unless defined(&m_snd_tag_rele);
	eval 'sub m_free {
	    my($m) = @_;
    	    eval q({ \'struct mbuf\' * &n =  ($m->{m_next});  &MBUF_PROBE1( &m__free, $m);  &if (( ($m->{m_flags}) & ( &M_PKTHDR| &M_NOFREE)) == ( &M_PKTHDR| &M_NOFREE))  &m_tag_delete_chain($m,  &NULL);  &if ( ($m->{m_flags}) &  &M_PKTHDR  &&  ($m->{m_pkthdr}->{csum_flags}) &  &CSUM_SND_TAG)  &m_snd_tag_rele( ($m->{m_pkthdr}->{snd_tag}));  &if ( ($m->{m_flags}) &  &M_EXTPG)  &mb_free_extpg($m);  &else  &if ( ($m->{m_flags}) &  &M_EXT)  &mb_free_ext($m);  &else  &if (( ($m->{m_flags}) &  &M_NOFREE) == 0)  &uma_zfree( &zone_mbuf, $m); ( &n); });
	}' unless defined(&m_free);
	eval 'sub rt_m_getfib {
	    my($m) = @_;
    	    eval q({  &KASSERT( ($m->{m_flags}) &  &M_PKTHDR , (\\"Attempt to get FIB from non header mbuf.\\")); ( ($m->{m_pkthdr}->{fibnum})); });
	}' unless defined(&rt_m_getfib);
	eval 'sub M_GETFIB {
	    my($_m) = @_;
    	    eval q( &rt_m_getfib($_m));
	}' unless defined(&M_GETFIB);
	eval 'sub M_SETFIB {
	    my($_m, $_fib) = @_;
    	    eval q( &do {  &KASSERT(($_m)-> &m_flags &  &M_PKTHDR, (\\"Attempt to set FIB on non header mbuf.\\")); (($_m)-> ($m_pkthdr->{fibnum})) = ($_fib); }  &while (0));
	}' unless defined(&M_SETFIB);
	eval 'sub MBUF_HASHFLAG_L2 () {(1<< 2);}' unless defined(&MBUF_HASHFLAG_L2);
	eval 'sub MBUF_HASHFLAG_L3 () {(1<< 3);}' unless defined(&MBUF_HASHFLAG_L3);
	eval 'sub MBUF_HASHFLAG_L4 () {(1<< 4);}' unless defined(&MBUF_HASHFLAG_L4);
	if(defined(&MBUF_PROFILING)) {
	    eval 'sub M_PROFILE {
	        my($m) = @_;
    		eval q( &m_profile($m));
	    }' unless defined(&M_PROFILE);
	} else {
	    eval 'sub M_PROFILE {
	        my($m) = @_;
    		eval q();
	    }' unless defined(&M_PROFILE);
	}
	eval 'sub mbufq_init {
	    my($mq,$maxlen) = @_;
    	    eval q({  &STAILQ_INIT( ($mq->{mq_head}));  ($mq->{mq_maxlen}) = $maxlen;  ($mq->{mq_len}) = 0; });
	}' unless defined(&mbufq_init);
	eval 'sub mbufq_flush {
	    my($mq) = @_;
    	    eval q({ \'struct mbuf\' * &m;  &m =  &STAILQ_FIRST( ($mq->{mq_head}));  &STAILQ_INIT( ($mq->{mq_head}));  ($mq->{mq_len}) = 0; ( &m); });
	}' unless defined(&mbufq_flush);
	eval 'sub mbufq_drain {
	    my($mq) = @_;
    	    eval q({ \'struct mbuf\' * &m, * &n;  &n =  &mbufq_flush($mq);  &while (( &m =  &n) !=  &NULL) {  &n =  &STAILQ_NEXT( &m,  &m_stailqpkt);  &m_freem( &m); } });
	}' unless defined(&mbufq_drain);
	eval 'sub mbufq_first {
	    my($mq) = @_;
    	    eval q({ ( &STAILQ_FIRST( ($mq->{mq_head}))); });
	}' unless defined(&mbufq_first);
	eval 'sub mbufq_last {
	    my($mq) = @_;
    	    eval q({ ( &STAILQ_LAST( ($mq->{mq_head}),  &mbuf,  &m_stailqpkt)); });
	}' unless defined(&mbufq_last);
	eval 'sub mbufq_empty {
	    my($mq) = @_;
    	    eval q({ ( ($mq->{mq_len}) == 0); });
	}' unless defined(&mbufq_empty);
	eval 'sub mbufq_full {
	    my($mq) = @_;
    	    eval q({ ( ($mq->{mq_maxlen}) > 0 &&  ($mq->{mq_len}) >=  ($mq->{mq_maxlen})); });
	}' unless defined(&mbufq_full);
	eval 'sub mbufq_len {
	    my($mq) = @_;
    	    eval q({ ( ($mq->{mq_len})); });
	}' unless defined(&mbufq_len);
	eval 'sub mbufq_enqueue {
	    my($mq,$m) = @_;
    	    eval q({  &if ( &mbufq_full($mq)) ( &ENOBUFS);  &STAILQ_INSERT_TAIL( ($mq->{mq_head}), $m,  &m_stailqpkt);  ($mq->{mq_len})++; (0); });
	}' unless defined(&mbufq_enqueue);
	eval 'sub mbufq_dequeue {
	    my($mq) = @_;
    	    eval q({ \'struct mbuf\' * &m;  &m =  &STAILQ_FIRST( ($mq->{mq_head}));  &if ( &m) {  &STAILQ_REMOVE_HEAD( ($mq->{mq_head}),  &m_stailqpkt);  ($m->{m_nextpkt}) =  &NULL;  ($mq->{mq_len})--; } ( &m); });
	}' unless defined(&mbufq_dequeue);
	eval 'sub mbufq_prepend {
	    my($mq,$m) = @_;
    	    eval q({  &STAILQ_INSERT_HEAD( ($mq->{mq_head}), $m,  &m_stailqpkt);  ($mq->{mq_len})++; });
	}' unless defined(&mbufq_prepend);
	if(defined(&_SYS_TIMESPEC_H_)) {
	    eval 'sub mbuf_tstmp2timespec {
	        my($m,$ts) = @_;
    		eval q({  &KASSERT(( ($m->{m_flags}) &  &M_PKTHDR) != 0, (\\"mbuf %p no M_PKTHDR\\", $m));  &KASSERT(( ($m->{m_flags}) & ( &M_TSTMP| &M_TSTMP_LRO)) != 0, (\\"mbuf %p no M_TSTMP or M_TSTMP_LRO\\", $m));  ($ts->{tv_sec}) =  ($m->{m_pkthdr}->{rcv_tstmp}) / 1000000000;  ($ts->{tv_nsec}) =  ($m->{m_pkthdr}->{rcv_tstmp}) % 1000000000; });
	    }' unless defined(&mbuf_tstmp2timespec);
	}
	eval 'sub mbuf_tstmp2timeval {
	    my($m,$tv) = @_;
    	    eval q({  &KASSERT(( ($m->{m_flags}) &  &M_PKTHDR) != 0, (\\"mbuf %p no M_PKTHDR\\", $m));  &KASSERT(( ($m->{m_flags}) & ( &M_TSTMP| &M_TSTMP_LRO)) != 0, (\\"mbuf %p no M_TSTMP or M_TSTMP_LRO\\", $m));  ($tv->{tv_sec}) =  ($m->{m_pkthdr}->{rcv_tstmp}) / 1000000000;  ($tv->{tv_usec}) = ( ($m->{m_pkthdr}->{rcv_tstmp}) % 1000000000) / 1000; });
	}' unless defined(&mbuf_tstmp2timeval);
	if(defined(&DEBUGNET)) {
	}
	eval 'sub mbuf_has_tls_session {
	    my($m) = @_;
    	    eval q({  &if ( ($m->{m_flags}) &  &M_EXTPG) {  &if ( ($m->{m_epg_tls}) !=  &NULL) { ( &true); } } ( &false); });
	}' unless defined(&mbuf_has_tls_session);
    }
}
1;

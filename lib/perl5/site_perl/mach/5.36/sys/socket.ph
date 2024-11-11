require '_h2ph_pre.ph';

no warnings qw(redefine misc);

unless(defined(&_SYS_SOCKET_H_)) {
    eval 'sub _SYS_SOCKET_H_ () {1;}' unless defined(&_SYS_SOCKET_H_);
    require 'sys/cdefs.ph';
    require 'sys/_types.ph';
    require 'sys/_iovec.ph';
    require 'machine/_align.ph';
    if((defined(&__BSD_VISIBLE) ? &__BSD_VISIBLE : undef)) {
	unless(defined(&_GID_T_DECLARED)) {
	    eval 'sub _GID_T_DECLARED () {1;}' unless defined(&_GID_T_DECLARED);
	}
	unless(defined(&_OFF_T_DECLARED)) {
	    eval 'sub _OFF_T_DECLARED () {1;}' unless defined(&_OFF_T_DECLARED);
	}
	unless(defined(&_PID_T_DECLARED)) {
	    eval 'sub _PID_T_DECLARED () {1;}' unless defined(&_PID_T_DECLARED);
	}
    }
    unless(defined(&_SA_FAMILY_T_DECLARED)) {
	eval 'sub _SA_FAMILY_T_DECLARED () {1;}' unless defined(&_SA_FAMILY_T_DECLARED);
    }
    unless(defined(&_SOCKLEN_T_DECLARED)) {
	eval 'sub _SOCKLEN_T_DECLARED () {1;}' unless defined(&_SOCKLEN_T_DECLARED);
    }
    unless(defined(&_SSIZE_T_DECLARED)) {
	eval 'sub _SSIZE_T_DECLARED () {1;}' unless defined(&_SSIZE_T_DECLARED);
    }
    if((defined(&__BSD_VISIBLE) ? &__BSD_VISIBLE : undef) ) {
	unless(defined(&_UID_T_DECLARED)) {
	    eval 'sub _UID_T_DECLARED () {1;}' unless defined(&_UID_T_DECLARED);
	}
    }
    unless(defined(&_UINT32_T_DECLARED)) {
	eval 'sub _UINT32_T_DECLARED () {1;}' unless defined(&_UINT32_T_DECLARED);
    }
    unless(defined(&_UINTPTR_T_DECLARED)) {
	eval 'sub _UINTPTR_T_DECLARED () {1;}' unless defined(&_UINTPTR_T_DECLARED);
    }
    eval 'sub SOCK_STREAM () {1;}' unless defined(&SOCK_STREAM);
    eval 'sub SOCK_DGRAM () {2;}' unless defined(&SOCK_DGRAM);
    eval 'sub SOCK_RAW () {3;}' unless defined(&SOCK_RAW);
    if((defined(&__BSD_VISIBLE) ? &__BSD_VISIBLE : undef)) {
	eval 'sub SOCK_RDM () {4;}' unless defined(&SOCK_RDM);
    }
    eval 'sub SOCK_SEQPACKET () {5;}' unless defined(&SOCK_SEQPACKET);
    if((defined(&__BSD_VISIBLE) ? &__BSD_VISIBLE : undef)) {
	eval 'sub SOCK_CLOEXEC () {0x10000000;}' unless defined(&SOCK_CLOEXEC);
	eval 'sub SOCK_NONBLOCK () {0x20000000;}' unless defined(&SOCK_NONBLOCK);
	if(defined(&_KERNEL)) {
	    eval 'sub ACCEPT4_INHERIT () {0x1;}' unless defined(&ACCEPT4_INHERIT);
	    eval 'sub ACCEPT4_COMPAT () {0x2;}' unless defined(&ACCEPT4_COMPAT);
	}
    }
    eval 'sub SO_DEBUG () {0x1;}' unless defined(&SO_DEBUG);
    eval 'sub SO_ACCEPTCONN () {0x2;}' unless defined(&SO_ACCEPTCONN);
    eval 'sub SO_REUSEADDR () {0x4;}' unless defined(&SO_REUSEADDR);
    eval 'sub SO_KEEPALIVE () {0x8;}' unless defined(&SO_KEEPALIVE);
    eval 'sub SO_DONTROUTE () {0x10;}' unless defined(&SO_DONTROUTE);
    eval 'sub SO_BROADCAST () {0x20;}' unless defined(&SO_BROADCAST);
    if((defined(&__BSD_VISIBLE) ? &__BSD_VISIBLE : undef)) {
	eval 'sub SO_USELOOPBACK () {0x40;}' unless defined(&SO_USELOOPBACK);
    }
    eval 'sub SO_LINGER () {0x80;}' unless defined(&SO_LINGER);
    eval 'sub SO_OOBINLINE () {0x100;}' unless defined(&SO_OOBINLINE);
    if((defined(&__BSD_VISIBLE) ? &__BSD_VISIBLE : undef)) {
	eval 'sub SO_REUSEPORT () {0x200;}' unless defined(&SO_REUSEPORT);
	eval 'sub SO_TIMESTAMP () {0x400;}' unless defined(&SO_TIMESTAMP);
	eval 'sub SO_NOSIGPIPE () {0x800;}' unless defined(&SO_NOSIGPIPE);
	eval 'sub SO_ACCEPTFILTER () {0x1000;}' unless defined(&SO_ACCEPTFILTER);
	eval 'sub SO_BINTIME () {0x2000;}' unless defined(&SO_BINTIME);
    }
    eval 'sub SO_NO_OFFLOAD () {0x4000;}' unless defined(&SO_NO_OFFLOAD);
    eval 'sub SO_NO_DDP () {0x8000;}' unless defined(&SO_NO_DDP);
    eval 'sub SO_REUSEPORT_LB () {0x10000;}' unless defined(&SO_REUSEPORT_LB);
    eval 'sub SO_RERROR () {0x20000;}' unless defined(&SO_RERROR);
    eval 'sub SO_SNDBUF () {0x1001;}' unless defined(&SO_SNDBUF);
    eval 'sub SO_RCVBUF () {0x1002;}' unless defined(&SO_RCVBUF);
    eval 'sub SO_SNDLOWAT () {0x1003;}' unless defined(&SO_SNDLOWAT);
    eval 'sub SO_RCVLOWAT () {0x1004;}' unless defined(&SO_RCVLOWAT);
    eval 'sub SO_SNDTIMEO () {0x1005;}' unless defined(&SO_SNDTIMEO);
    eval 'sub SO_RCVTIMEO () {0x1006;}' unless defined(&SO_RCVTIMEO);
    eval 'sub SO_ERROR () {0x1007;}' unless defined(&SO_ERROR);
    eval 'sub SO_TYPE () {0x1008;}' unless defined(&SO_TYPE);
    if((defined(&__BSD_VISIBLE) ? &__BSD_VISIBLE : undef)) {
	eval 'sub SO_LABEL () {0x1009;}' unless defined(&SO_LABEL);
	eval 'sub SO_PEERLABEL () {0x1010;}' unless defined(&SO_PEERLABEL);
	eval 'sub SO_LISTENQLIMIT () {0x1011;}' unless defined(&SO_LISTENQLIMIT);
	eval 'sub SO_LISTENQLEN () {0x1012;}' unless defined(&SO_LISTENQLEN);
	eval 'sub SO_LISTENINCQLEN () {0x1013;}' unless defined(&SO_LISTENINCQLEN);
	eval 'sub SO_SETFIB () {0x1014;}' unless defined(&SO_SETFIB);
	eval 'sub SO_USER_COOKIE () {0x1015;}' unless defined(&SO_USER_COOKIE);
	eval 'sub SO_PROTOCOL () {0x1016;}' unless defined(&SO_PROTOCOL);
	eval 'sub SO_PROTOTYPE () { &SO_PROTOCOL;}' unless defined(&SO_PROTOTYPE);
	eval 'sub SO_TS_CLOCK () {0x1017;}' unless defined(&SO_TS_CLOCK);
	eval 'sub SO_MAX_PACING_RATE () {0x1018;}' unless defined(&SO_MAX_PACING_RATE);
	eval 'sub SO_DOMAIN () {0x1019;}' unless defined(&SO_DOMAIN);
    }
    if((defined(&__BSD_VISIBLE) ? &__BSD_VISIBLE : undef)) {
	eval 'sub SO_TS_REALTIME_MICRO () {0;}' unless defined(&SO_TS_REALTIME_MICRO);
	eval 'sub SO_TS_BINTIME () {1;}' unless defined(&SO_TS_BINTIME);
	eval 'sub SO_TS_REALTIME () {2;}' unless defined(&SO_TS_REALTIME);
	eval 'sub SO_TS_MONOTONIC () {3;}' unless defined(&SO_TS_MONOTONIC);
	eval 'sub SO_TS_DEFAULT () { &SO_TS_REALTIME_MICRO;}' unless defined(&SO_TS_DEFAULT);
	eval 'sub SO_TS_CLOCK_MAX () { &SO_TS_MONOTONIC;}' unless defined(&SO_TS_CLOCK_MAX);
    }
    if((defined(&__BSD_VISIBLE) ? &__BSD_VISIBLE : undef)) {
	eval 'sub SO_VENDOR () {0x80000000;}' unless defined(&SO_VENDOR);
    }
    if((defined(&__BSD_VISIBLE) ? &__BSD_VISIBLE : undef)) {
    }
    eval 'sub SOL_SOCKET () {0xffff;}' unless defined(&SOL_SOCKET);
    eval 'sub AF_UNSPEC () {0;}' unless defined(&AF_UNSPEC);
    if((defined(&__BSD_VISIBLE) ? &__BSD_VISIBLE : undef)) {
	eval 'sub AF_LOCAL () { &AF_UNIX;}' unless defined(&AF_LOCAL);
    }
    eval 'sub AF_UNIX () {1;}' unless defined(&AF_UNIX);
    eval 'sub AF_INET () {2;}' unless defined(&AF_INET);
    if((defined(&__BSD_VISIBLE) ? &__BSD_VISIBLE : undef)) {
	eval 'sub AF_IMPLINK () {3;}' unless defined(&AF_IMPLINK);
	eval 'sub AF_PUP () {4;}' unless defined(&AF_PUP);
	eval 'sub AF_CHAOS () {5;}' unless defined(&AF_CHAOS);
	eval 'sub AF_NETBIOS () {6;}' unless defined(&AF_NETBIOS);
	eval 'sub AF_ISO () {7;}' unless defined(&AF_ISO);
	eval 'sub AF_OSI () { &AF_ISO;}' unless defined(&AF_OSI);
	eval 'sub AF_ECMA () {8;}' unless defined(&AF_ECMA);
	eval 'sub AF_DATAKIT () {9;}' unless defined(&AF_DATAKIT);
	eval 'sub AF_CCITT () {10;}' unless defined(&AF_CCITT);
	eval 'sub AF_SNA () {11;}' unless defined(&AF_SNA);
	eval 'sub AF_DECnet () {12;}' unless defined(&AF_DECnet);
	eval 'sub AF_DLI () {13;}' unless defined(&AF_DLI);
	eval 'sub AF_LAT () {14;}' unless defined(&AF_LAT);
	eval 'sub AF_HYLINK () {15;}' unless defined(&AF_HYLINK);
	eval 'sub AF_APPLETALK () {16;}' unless defined(&AF_APPLETALK);
	eval 'sub AF_ROUTE () {17;}' unless defined(&AF_ROUTE);
	eval 'sub AF_LINK () {18;}' unless defined(&AF_LINK);
	eval 'sub pseudo_AF_XTP () {19;}' unless defined(&pseudo_AF_XTP);
	eval 'sub AF_COIP () {20;}' unless defined(&AF_COIP);
	eval 'sub AF_CNT () {21;}' unless defined(&AF_CNT);
	eval 'sub pseudo_AF_RTIP () {22;}' unless defined(&pseudo_AF_RTIP);
	eval 'sub AF_IPX () {23;}' unless defined(&AF_IPX);
	eval 'sub AF_SIP () {24;}' unless defined(&AF_SIP);
	eval 'sub pseudo_AF_PIP () {25;}' unless defined(&pseudo_AF_PIP);
	eval 'sub AF_ISDN () {26;}' unless defined(&AF_ISDN);
	eval 'sub AF_E164 () { &AF_ISDN;}' unless defined(&AF_E164);
	eval 'sub pseudo_AF_KEY () {27;}' unless defined(&pseudo_AF_KEY);
    }
    eval 'sub AF_INET6 () {28;}' unless defined(&AF_INET6);
    if((defined(&__BSD_VISIBLE) ? &__BSD_VISIBLE : undef)) {
	eval 'sub AF_NATM () {29;}' unless defined(&AF_NATM);
	eval 'sub AF_ATM () {30;}' unless defined(&AF_ATM);
	eval 'sub pseudo_AF_HDRCMPLT () {31;}' unless defined(&pseudo_AF_HDRCMPLT);
	eval 'sub AF_NETGRAPH () {32;}' unless defined(&AF_NETGRAPH);
	eval 'sub AF_SLOW () {33;}' unless defined(&AF_SLOW);
	eval 'sub AF_SCLUSTER () {34;}' unless defined(&AF_SCLUSTER);
	eval 'sub AF_ARP () {35;}' unless defined(&AF_ARP);
	eval 'sub AF_BLUETOOTH () {36;}' unless defined(&AF_BLUETOOTH);
	eval 'sub AF_IEEE80211 () {37;}' unless defined(&AF_IEEE80211);
	eval 'sub AF_NETLINK () {38;}' unless defined(&AF_NETLINK);
	eval 'sub AF_INET_SDP () {40;}' unless defined(&AF_INET_SDP);
	eval 'sub AF_INET6_SDP () {42;}' unless defined(&AF_INET6_SDP);
	eval 'sub AF_HYPERV () {43;}' unless defined(&AF_HYPERV);
	eval 'sub AF_DIVERT () {44;}' unless defined(&AF_DIVERT);
	eval 'sub AF_MAX () {44;}' unless defined(&AF_MAX);
	eval 'sub AF_VENDOR00 () {39;}' unless defined(&AF_VENDOR00);
	eval 'sub AF_VENDOR01 () {41;}' unless defined(&AF_VENDOR01);
	eval 'sub AF_VENDOR03 () {45;}' unless defined(&AF_VENDOR03);
	eval 'sub AF_VENDOR04 () {47;}' unless defined(&AF_VENDOR04);
	eval 'sub AF_VENDOR05 () {49;}' unless defined(&AF_VENDOR05);
	eval 'sub AF_VENDOR06 () {51;}' unless defined(&AF_VENDOR06);
	eval 'sub AF_VENDOR07 () {53;}' unless defined(&AF_VENDOR07);
	eval 'sub AF_VENDOR08 () {55;}' unless defined(&AF_VENDOR08);
	eval 'sub AF_VENDOR09 () {57;}' unless defined(&AF_VENDOR09);
	eval 'sub AF_VENDOR10 () {59;}' unless defined(&AF_VENDOR10);
	eval 'sub AF_VENDOR11 () {61;}' unless defined(&AF_VENDOR11);
	eval 'sub AF_VENDOR12 () {63;}' unless defined(&AF_VENDOR12);
	eval 'sub AF_VENDOR13 () {65;}' unless defined(&AF_VENDOR13);
	eval 'sub AF_VENDOR14 () {67;}' unless defined(&AF_VENDOR14);
	eval 'sub AF_VENDOR15 () {69;}' unless defined(&AF_VENDOR15);
	eval 'sub AF_VENDOR16 () {71;}' unless defined(&AF_VENDOR16);
	eval 'sub AF_VENDOR17 () {73;}' unless defined(&AF_VENDOR17);
	eval 'sub AF_VENDOR18 () {75;}' unless defined(&AF_VENDOR18);
	eval 'sub AF_VENDOR19 () {77;}' unless defined(&AF_VENDOR19);
	eval 'sub AF_VENDOR20 () {79;}' unless defined(&AF_VENDOR20);
	eval 'sub AF_VENDOR21 () {81;}' unless defined(&AF_VENDOR21);
	eval 'sub AF_VENDOR22 () {83;}' unless defined(&AF_VENDOR22);
	eval 'sub AF_VENDOR23 () {85;}' unless defined(&AF_VENDOR23);
	eval 'sub AF_VENDOR24 () {87;}' unless defined(&AF_VENDOR24);
	eval 'sub AF_VENDOR25 () {89;}' unless defined(&AF_VENDOR25);
	eval 'sub AF_VENDOR26 () {91;}' unless defined(&AF_VENDOR26);
	eval 'sub AF_VENDOR27 () {93;}' unless defined(&AF_VENDOR27);
	eval 'sub AF_VENDOR28 () {95;}' unless defined(&AF_VENDOR28);
	eval 'sub AF_VENDOR29 () {97;}' unless defined(&AF_VENDOR29);
	eval 'sub AF_VENDOR30 () {99;}' unless defined(&AF_VENDOR30);
	eval 'sub AF_VENDOR31 () {101;}' unless defined(&AF_VENDOR31);
	eval 'sub AF_VENDOR32 () {103;}' unless defined(&AF_VENDOR32);
	eval 'sub AF_VENDOR33 () {105;}' unless defined(&AF_VENDOR33);
	eval 'sub AF_VENDOR34 () {107;}' unless defined(&AF_VENDOR34);
	eval 'sub AF_VENDOR35 () {109;}' unless defined(&AF_VENDOR35);
	eval 'sub AF_VENDOR36 () {111;}' unless defined(&AF_VENDOR36);
	eval 'sub AF_VENDOR37 () {113;}' unless defined(&AF_VENDOR37);
	eval 'sub AF_VENDOR38 () {115;}' unless defined(&AF_VENDOR38);
	eval 'sub AF_VENDOR39 () {117;}' unless defined(&AF_VENDOR39);
	eval 'sub AF_VENDOR40 () {119;}' unless defined(&AF_VENDOR40);
	eval 'sub AF_VENDOR41 () {121;}' unless defined(&AF_VENDOR41);
	eval 'sub AF_VENDOR42 () {123;}' unless defined(&AF_VENDOR42);
	eval 'sub AF_VENDOR43 () {125;}' unless defined(&AF_VENDOR43);
	eval 'sub AF_VENDOR44 () {127;}' unless defined(&AF_VENDOR44);
	eval 'sub AF_VENDOR45 () {129;}' unless defined(&AF_VENDOR45);
	eval 'sub AF_VENDOR46 () {131;}' unless defined(&AF_VENDOR46);
	eval 'sub AF_VENDOR47 () {133;}' unless defined(&AF_VENDOR47);
    }
    if((defined(&__BSD_VISIBLE) ? &__BSD_VISIBLE : undef)) {
	eval 'sub SOCK_MAXADDRLEN () {255;}' unless defined(&SOCK_MAXADDRLEN);
    }
    require 'sys/_sockaddr_storage.ph';
    if((defined(&__BSD_VISIBLE) ? &__BSD_VISIBLE : undef)) {
	eval 'sub PF_UNSPEC () { &AF_UNSPEC;}' unless defined(&PF_UNSPEC);
	eval 'sub PF_LOCAL () { &AF_LOCAL;}' unless defined(&PF_LOCAL);
	eval 'sub PF_UNIX () { &PF_LOCAL;}' unless defined(&PF_UNIX);
	eval 'sub PF_INET () { &AF_INET;}' unless defined(&PF_INET);
	eval 'sub PF_IMPLINK () { &AF_IMPLINK;}' unless defined(&PF_IMPLINK);
	eval 'sub PF_PUP () { &AF_PUP;}' unless defined(&PF_PUP);
	eval 'sub PF_CHAOS () { &AF_CHAOS;}' unless defined(&PF_CHAOS);
	eval 'sub PF_NETBIOS () { &AF_NETBIOS;}' unless defined(&PF_NETBIOS);
	eval 'sub PF_ISO () { &AF_ISO;}' unless defined(&PF_ISO);
	eval 'sub PF_OSI () { &AF_ISO;}' unless defined(&PF_OSI);
	eval 'sub PF_ECMA () { &AF_ECMA;}' unless defined(&PF_ECMA);
	eval 'sub PF_DATAKIT () { &AF_DATAKIT;}' unless defined(&PF_DATAKIT);
	eval 'sub PF_CCITT () { &AF_CCITT;}' unless defined(&PF_CCITT);
	eval 'sub PF_SNA () { &AF_SNA;}' unless defined(&PF_SNA);
	eval 'sub PF_DECnet () { &AF_DECnet;}' unless defined(&PF_DECnet);
	eval 'sub PF_DLI () { &AF_DLI;}' unless defined(&PF_DLI);
	eval 'sub PF_LAT () { &AF_LAT;}' unless defined(&PF_LAT);
	eval 'sub PF_HYLINK () { &AF_HYLINK;}' unless defined(&PF_HYLINK);
	eval 'sub PF_APPLETALK () { &AF_APPLETALK;}' unless defined(&PF_APPLETALK);
	eval 'sub PF_ROUTE () { &AF_ROUTE;}' unless defined(&PF_ROUTE);
	eval 'sub PF_LINK () { &AF_LINK;}' unless defined(&PF_LINK);
	eval 'sub PF_XTP () { &pseudo_AF_XTP;}' unless defined(&PF_XTP);
	eval 'sub PF_COIP () { &AF_COIP;}' unless defined(&PF_COIP);
	eval 'sub PF_CNT () { &AF_CNT;}' unless defined(&PF_CNT);
	eval 'sub PF_SIP () { &AF_SIP;}' unless defined(&PF_SIP);
	eval 'sub PF_IPX () { &AF_IPX;}' unless defined(&PF_IPX);
	eval 'sub PF_RTIP () { &pseudo_AF_RTIP;}' unless defined(&PF_RTIP);
	eval 'sub PF_PIP () { &pseudo_AF_PIP;}' unless defined(&PF_PIP);
	eval 'sub PF_ISDN () { &AF_ISDN;}' unless defined(&PF_ISDN);
	eval 'sub PF_KEY () { &pseudo_AF_KEY;}' unless defined(&PF_KEY);
	eval 'sub PF_INET6 () { &AF_INET6;}' unless defined(&PF_INET6);
	eval 'sub PF_NATM () { &AF_NATM;}' unless defined(&PF_NATM);
	eval 'sub PF_ATM () { &AF_ATM;}' unless defined(&PF_ATM);
	eval 'sub PF_NETGRAPH () { &AF_NETGRAPH;}' unless defined(&PF_NETGRAPH);
	eval 'sub PF_SLOW () { &AF_SLOW;}' unless defined(&PF_SLOW);
	eval 'sub PF_SCLUSTER () { &AF_SCLUSTER;}' unless defined(&PF_SCLUSTER);
	eval 'sub PF_ARP () { &AF_ARP;}' unless defined(&PF_ARP);
	eval 'sub PF_BLUETOOTH () { &AF_BLUETOOTH;}' unless defined(&PF_BLUETOOTH);
	eval 'sub PF_IEEE80211 () { &AF_IEEE80211;}' unless defined(&PF_IEEE80211);
	eval 'sub PF_NETLINK () { &AF_NETLINK;}' unless defined(&PF_NETLINK);
	eval 'sub PF_INET_SDP () { &AF_INET_SDP;}' unless defined(&PF_INET_SDP);
	eval 'sub PF_INET6_SDP () { &AF_INET6_SDP;}' unless defined(&PF_INET6_SDP);
	eval 'sub PF_DIVERT () { &AF_DIVERT;}' unless defined(&PF_DIVERT);
	eval 'sub PF_MAX () { &AF_MAX;}' unless defined(&PF_MAX);
	eval 'sub NET_RT_DUMP () {1;}' unless defined(&NET_RT_DUMP);
	eval 'sub NET_RT_FLAGS () {2;}' unless defined(&NET_RT_FLAGS);
	eval 'sub NET_RT_IFLIST () {3;}' unless defined(&NET_RT_IFLIST);
	eval 'sub NET_RT_IFMALIST () {4;}' unless defined(&NET_RT_IFMALIST);
	eval 'sub NET_RT_IFLISTL () {5;}' unless defined(&NET_RT_IFLISTL);
	eval 'sub NET_RT_NHOP () {6;}' unless defined(&NET_RT_NHOP);
	eval 'sub NET_RT_NHGRP () {7;}' unless defined(&NET_RT_NHGRP);
    }
    eval 'sub SOMAXCONN () {128;}' unless defined(&SOMAXCONN);
    eval 'sub MSG_OOB () {0x1;}' unless defined(&MSG_OOB);
    eval 'sub MSG_PEEK () {0x2;}' unless defined(&MSG_PEEK);
    eval 'sub MSG_DONTROUTE () {0x4;}' unless defined(&MSG_DONTROUTE);
    eval 'sub MSG_EOR () {0x8;}' unless defined(&MSG_EOR);
    eval 'sub MSG_TRUNC () {0x10;}' unless defined(&MSG_TRUNC);
    eval 'sub MSG_CTRUNC () {0x20;}' unless defined(&MSG_CTRUNC);
    eval 'sub MSG_WAITALL () {0x40;}' unless defined(&MSG_WAITALL);
    if((defined(&__BSD_VISIBLE) ? &__BSD_VISIBLE : undef)) {
	eval 'sub MSG_DONTWAIT () {0x80;}' unless defined(&MSG_DONTWAIT);
	eval 'sub MSG_EOF () {0x100;}' unless defined(&MSG_EOF);
	eval 'sub MSG_NOTIFICATION () {0x2000;}' unless defined(&MSG_NOTIFICATION);
	eval 'sub MSG_NBIO () {0x4000;}' unless defined(&MSG_NBIO);
	eval 'sub MSG_COMPAT () {0x8000;}' unless defined(&MSG_COMPAT);
    }
    if(defined(&_KERNEL)) {
	eval 'sub MSG_SOCALLBCK () {0x10000;}' unless defined(&MSG_SOCALLBCK);
    }
    if((defined(&__POSIX_VISIBLE) ? &__POSIX_VISIBLE : undef) >= 200809) {
	eval 'sub MSG_NOSIGNAL () {0x20000;}' unless defined(&MSG_NOSIGNAL);
    }
    if((defined(&__BSD_VISIBLE) ? &__BSD_VISIBLE : undef)) {
	eval 'sub MSG_CMSG_CLOEXEC () {0x40000;}' unless defined(&MSG_CMSG_CLOEXEC);
	eval 'sub MSG_WAITFORONE () {0x80000;}' unless defined(&MSG_WAITFORONE);
    }
    if(defined(&_KERNEL)) {
	eval 'sub MSG_MORETOCOME () {0x100000;}' unless defined(&MSG_MORETOCOME);
	eval 'sub MSG_TLSAPPDATA () {0x200000;}' unless defined(&MSG_TLSAPPDATA);
    }
    if((defined(&__BSD_VISIBLE) ? &__BSD_VISIBLE : undef)) {
	eval 'sub CMGROUP_MAX () {16;}' unless defined(&CMGROUP_MAX);
	eval 'sub SOCKCREDSIZE {
	    my($ngrps) = @_;
    	    eval q(($sizeof{\'struct sockcred\'} + ($sizeof{ &gid_t} * (($ngrps) - 1))));
	}' unless defined(&SOCKCREDSIZE);
	eval 'sub SOCKCRED2SIZE {
	    my($ngrps) = @_;
    	    eval q(($sizeof{\'struct sockcred2\'} + ($sizeof{ &gid_t} * (($ngrps) - 1))));
	}' unless defined(&SOCKCRED2SIZE);
    }
    eval 'sub CMSG_DATA {
        my($cmsg) = @_;
	    eval q((($cmsg) +  &_ALIGN($sizeof{\'struct cmsghdr\'})));
    }' unless defined(&CMSG_DATA);
    eval 'sub CMSG_NXTHDR {
        my($mhdr, $cmsg) = @_;
	    eval q(( == 0?  &CMSG_FIRSTHDR : (($cmsg) +  &_ALIGN(()-> &cmsg_len) +  &_ALIGN > ($mhdr)-> &msg_control + ($mhdr)-> &msg_controllen) ? 0: ( &void *)(($cmsg) +  &_ALIGN((($cmsg))-> &cmsg_len))));
    }' unless defined(&CMSG_NXTHDR);
    eval 'sub CMSG_FIRSTHDR {
        my($mhdr) = @_;
	    eval q((($mhdr)-> &msg_controllen >= $sizeof{\'struct cmsghdr\'} ? ($mhdr)-> &msg_control : 0));
    }' unless defined(&CMSG_FIRSTHDR);
    if((defined(&__BSD_VISIBLE) ? &__BSD_VISIBLE : undef)) {
	eval 'sub CMSG_SPACE {
	    my($l) = @_;
    	    eval q(( &_ALIGN($sizeof{\'struct cmsghdr\'}) +  &_ALIGN($l)));
	}' unless defined(&CMSG_SPACE);
	eval 'sub CMSG_LEN {
	    my($l) = @_;
    	    eval q(( &_ALIGN($sizeof{\'struct cmsghdr\'}) + ($l)));
	}' unless defined(&CMSG_LEN);
    }
    if(defined(&_KERNEL)) {
	eval 'sub CMSG_ALIGN {
	    my($n) = @_;
    	    eval q( &_ALIGN($n));
	}' unless defined(&CMSG_ALIGN);
    }
    eval 'sub SCM_RIGHTS () {0x1;}' unless defined(&SCM_RIGHTS);
    if((defined(&__BSD_VISIBLE) ? &__BSD_VISIBLE : undef)) {
	eval 'sub SCM_TIMESTAMP () {0x2;}' unless defined(&SCM_TIMESTAMP);
	eval 'sub SCM_CREDS () {0x3;}' unless defined(&SCM_CREDS);
	eval 'sub SCM_BINTIME () {0x4;}' unless defined(&SCM_BINTIME);
	eval 'sub SCM_REALTIME () {0x5;}' unless defined(&SCM_REALTIME);
	eval 'sub SCM_MONOTONIC () {0x6;}' unless defined(&SCM_MONOTONIC);
	eval 'sub SCM_TIME_INFO () {0x7;}' unless defined(&SCM_TIME_INFO);
	eval 'sub SCM_CREDS2 () {0x8;}' unless defined(&SCM_CREDS2);
	eval 'sub ST_INFO_HW () {0x1;}' unless defined(&ST_INFO_HW);
	eval 'sub ST_INFO_HW_HPREC () {0x2;}' unless defined(&ST_INFO_HW_HPREC);
    }
    if((defined(&__BSD_VISIBLE) ? &__BSD_VISIBLE : undef)) {
    }
    eval 'sub SHUT_RD () {0;}' unless defined(&SHUT_RD);
    eval 'sub SHUT_WR () {1;}' unless defined(&SHUT_WR);
    eval 'sub SHUT_RDWR () {2;}' unless defined(&SHUT_RDWR);
    if((defined(&__BSD_VISIBLE) ? &__BSD_VISIBLE : undef)) {
	eval 'sub PRU_FLUSH_RD () { &SHUT_RD;}' unless defined(&PRU_FLUSH_RD);
	eval 'sub PRU_FLUSH_WR () { &SHUT_WR;}' unless defined(&PRU_FLUSH_WR);
	eval 'sub PRU_FLUSH_RDWR () { &SHUT_RDWR;}' unless defined(&PRU_FLUSH_RDWR);
    }
    if((defined(&__BSD_VISIBLE) ? &__BSD_VISIBLE : undef)) {
	eval 'sub SF_NODISKIO () {0x1;}' unless defined(&SF_NODISKIO);
	eval 'sub SF_MNOWAIT () {0x2;}' unless defined(&SF_MNOWAIT);
	eval 'sub SF_SYNC () {0x4;}' unless defined(&SF_SYNC);
	eval 'sub SF_USER_READAHEAD () {0x8;}' unless defined(&SF_USER_READAHEAD);
	eval 'sub SF_NOCACHE () {0x10;}' unless defined(&SF_NOCACHE);
	eval 'sub SF_FLAGS {
	    my($rh, $flags) = @_;
    	    eval q(((($rh) << 16) | ($flags)));
	}' unless defined(&SF_FLAGS);
	if(defined(&_KERNEL)) {
	    eval 'sub SF_READAHEAD {
	        my($flags) = @_;
    		eval q((($flags) >> 16));
	    }' unless defined(&SF_READAHEAD);
	}
    }
    unless(defined(&_KERNEL)) {
	require 'sys/cdefs.ph';
	if((defined(&__BSD_VISIBLE) ? &__BSD_VISIBLE : undef)) {
	}
	if((defined(&__BSD_VISIBLE) ? &__BSD_VISIBLE : undef)) {
	}
	if((defined(&__BSD_VISIBLE) ? &__BSD_VISIBLE : undef)) {
	}
    }
    if(defined(&_KERNEL)) {
    }
}
1;

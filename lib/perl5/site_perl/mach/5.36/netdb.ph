require '_h2ph_pre.ph';

no warnings qw(redefine misc);

unless(defined(&_NETDB_H_)) {
    eval 'sub _NETDB_H_ () {1;}' unless defined(&_NETDB_H_);
    require 'sys/cdefs.ph';
    require 'sys/_types.ph';
    unless(defined(&_IN_ADDR_T_DECLARED)) {
	eval 'sub _IN_ADDR_T_DECLARED () {1;}' unless defined(&_IN_ADDR_T_DECLARED);
    }
    unless(defined(&_IN_PORT_T_DECLARED)) {
	eval 'sub _IN_PORT_T_DECLARED () {1;}' unless defined(&_IN_PORT_T_DECLARED);
    }
    unless(defined(&_SIZE_T_DECLARED)) {
	eval 'sub _SIZE_T_DECLARED () {1;}' unless defined(&_SIZE_T_DECLARED);
    }
    unless(defined(&_SOCKLEN_T_DECLARED)) {
	eval 'sub _SOCKLEN_T_DECLARED () {1;}' unless defined(&_SOCKLEN_T_DECLARED);
    }
    unless(defined(&_UINT32_T_DECLARED)) {
	eval 'sub _UINT32_T_DECLARED () {1;}' unless defined(&_UINT32_T_DECLARED);
    }
    unless(defined(&_PATH_HEQUIV)) {
	eval 'sub _PATH_HEQUIV () {"/etc/hosts.equiv";}' unless defined(&_PATH_HEQUIV);
    }
    eval 'sub _PATH_HOSTS () {"/etc/hosts";}' unless defined(&_PATH_HOSTS);
    eval 'sub _PATH_NETWORKS () {"/etc/networks";}' unless defined(&_PATH_NETWORKS);
    eval 'sub _PATH_PROTOCOLS () {"/etc/protocols";}' unless defined(&_PATH_PROTOCOLS);
    eval 'sub _PATH_SERVICES () {"/etc/services";}' unless defined(&_PATH_SERVICES);
    eval 'sub _PATH_SERVICES_DB () {"/var/db/services.db";}' unless defined(&_PATH_SERVICES_DB);
    eval 'sub h_errno () {(* &__h_errno());}' unless defined(&h_errno);
    eval 'sub h_addr () { $h_addr_list[0];}' unless defined(&h_addr);
    eval 'sub IPPORT_RESERVED () {1024;}' unless defined(&IPPORT_RESERVED);
    eval 'sub NETDB_INTERNAL () {-1;}' unless defined(&NETDB_INTERNAL);
    eval 'sub NETDB_SUCCESS () {0;}' unless defined(&NETDB_SUCCESS);
    eval 'sub HOST_NOT_FOUND () {1;}' unless defined(&HOST_NOT_FOUND);
    eval 'sub TRY_AGAIN () {2;}' unless defined(&TRY_AGAIN);
    eval 'sub NO_RECOVERY () {3;}' unless defined(&NO_RECOVERY);
    eval 'sub NO_DATA () {4;}' unless defined(&NO_DATA);
    eval 'sub NO_ADDRESS () { &NO_DATA;}' unless defined(&NO_ADDRESS);
    if((defined(&__BSD_VISIBLE) ? &__BSD_VISIBLE : undef) ) {
	eval 'sub EAI_ADDRFAMILY () {1;}' unless defined(&EAI_ADDRFAMILY);
    }
    eval 'sub EAI_AGAIN () {2;}' unless defined(&EAI_AGAIN);
    eval 'sub EAI_BADFLAGS () {3;}' unless defined(&EAI_BADFLAGS);
    eval 'sub EAI_FAIL () {4;}' unless defined(&EAI_FAIL);
    eval 'sub EAI_FAMILY () {5;}' unless defined(&EAI_FAMILY);
    eval 'sub EAI_MEMORY () {6;}' unless defined(&EAI_MEMORY);
    if((defined(&__BSD_VISIBLE) ? &__BSD_VISIBLE : undef) ) {
	eval 'sub EAI_NODATA () {7;}' unless defined(&EAI_NODATA);
    }
    eval 'sub EAI_NONAME () {8;}' unless defined(&EAI_NONAME);
    eval 'sub EAI_SERVICE () {9;}' unless defined(&EAI_SERVICE);
    eval 'sub EAI_SOCKTYPE () {10;}' unless defined(&EAI_SOCKTYPE);
    eval 'sub EAI_SYSTEM () {11;}' unless defined(&EAI_SYSTEM);
    if((defined(&__BSD_VISIBLE) ? &__BSD_VISIBLE : undef) ) {
	eval 'sub EAI_BADHINTS () {12;}' unless defined(&EAI_BADHINTS);
	eval 'sub EAI_PROTOCOL () {13;}' unless defined(&EAI_PROTOCOL);
	eval 'sub EAI_OVERFLOW () {14;}' unless defined(&EAI_OVERFLOW);
    }
    eval 'sub EAI_MAX () {15;}' unless defined(&EAI_MAX);
    eval 'sub AI_PASSIVE () {0x1;}' unless defined(&AI_PASSIVE);
    eval 'sub AI_CANONNAME () {0x2;}' unless defined(&AI_CANONNAME);
    eval 'sub AI_NUMERICHOST () {0x4;}' unless defined(&AI_NUMERICHOST);
    eval 'sub AI_NUMERICSERV () {0x8;}' unless defined(&AI_NUMERICSERV);
    eval 'sub AI_MASK () {( &AI_PASSIVE |  &AI_CANONNAME |  &AI_NUMERICHOST |  &AI_NUMERICSERV |  &AI_ADDRCONFIG |  &AI_ALL |  &AI_V4MAPPED);}' unless defined(&AI_MASK);
    eval 'sub AI_ALL () {0x100;}' unless defined(&AI_ALL);
    eval 'sub AI_V4MAPPED_CFG () {0x200;}' unless defined(&AI_V4MAPPED_CFG);
    eval 'sub AI_ADDRCONFIG () {0x400;}' unless defined(&AI_ADDRCONFIG);
    eval 'sub AI_V4MAPPED () {0x800;}' unless defined(&AI_V4MAPPED);
    eval 'sub AI_DEFAULT () {( &AI_V4MAPPED_CFG |  &AI_ADDRCONFIG);}' unless defined(&AI_DEFAULT);
    eval 'sub NI_MAXHOST () {1025;}' unless defined(&NI_MAXHOST);
    eval 'sub NI_MAXSERV () {32;}' unless defined(&NI_MAXSERV);
    eval 'sub NI_NOFQDN () {0x1;}' unless defined(&NI_NOFQDN);
    eval 'sub NI_NUMERICHOST () {0x2;}' unless defined(&NI_NUMERICHOST);
    eval 'sub NI_NAMEREQD () {0x4;}' unless defined(&NI_NAMEREQD);
    eval 'sub NI_NUMERICSERV () {0x8;}' unless defined(&NI_NUMERICSERV);
    eval 'sub NI_DGRAM () {0x10;}' unless defined(&NI_DGRAM);
    eval 'sub NI_NUMERICSCOPE () {0x20;}' unless defined(&NI_NUMERICSCOPE);
    eval 'sub SCOPE_DELIMITER () {ord(\'%\');}' unless defined(&SCOPE_DELIMITER);
    if((defined(&__BSD_VISIBLE) ? &__BSD_VISIBLE : undef) || ((defined(&__POSIX_VISIBLE) ? &__POSIX_VISIBLE : undef)  && (defined(&__POSIX_VISIBLE) ? &__POSIX_VISIBLE : undef) <= 200112)) {
    }
    if((defined(&__BSD_VISIBLE) ? &__BSD_VISIBLE : undef)) {
    }
}
1;

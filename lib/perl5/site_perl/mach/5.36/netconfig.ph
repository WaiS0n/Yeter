require '_h2ph_pre.ph';

no warnings qw(redefine misc);

unless(defined(&_NETCONFIG_H_)) {
    eval 'sub _NETCONFIG_H_ () {1;}' unless defined(&_NETCONFIG_H_);
    require 'sys/cdefs.ph';
    eval 'sub NETCONFIG () {"/etc/netconfig";}' unless defined(&NETCONFIG);
    eval 'sub NETPATH () {"NETPATH";}' unless defined(&NETPATH);
    eval 'sub NC_TPI_CLTS () {1;}' unless defined(&NC_TPI_CLTS);
    eval 'sub NC_TPI_COTS () {2;}' unless defined(&NC_TPI_COTS);
    eval 'sub NC_TPI_COTS_ORD () {3;}' unless defined(&NC_TPI_COTS_ORD);
    eval 'sub NC_TPI_RAW () {4;}' unless defined(&NC_TPI_RAW);
    eval 'sub NC_NOFLAG () {0x;}' unless defined(&NC_NOFLAG);
    eval 'sub NC_VISIBLE () {0x1;}' unless defined(&NC_VISIBLE);
    eval 'sub NC_BROADCAST () {0x2;}' unless defined(&NC_BROADCAST);
    eval 'sub NC_NOPROTOFMLY () {"-";}' unless defined(&NC_NOPROTOFMLY);
    eval 'sub NC_LOOPBACK () {"loopback";}' unless defined(&NC_LOOPBACK);
    eval 'sub NC_INET () {"inet";}' unless defined(&NC_INET);
    eval 'sub NC_INET6 () {"inet6";}' unless defined(&NC_INET6);
    eval 'sub NC_IMPLINK () {"implink";}' unless defined(&NC_IMPLINK);
    eval 'sub NC_PUP () {"pup";}' unless defined(&NC_PUP);
    eval 'sub NC_CHAOS () {"chaos";}' unless defined(&NC_CHAOS);
    eval 'sub NC_NS () {"ns";}' unless defined(&NC_NS);
    eval 'sub NC_NBS () {"nbs";}' unless defined(&NC_NBS);
    eval 'sub NC_ECMA () {"ecma";}' unless defined(&NC_ECMA);
    eval 'sub NC_DATAKIT () {"datakit";}' unless defined(&NC_DATAKIT);
    eval 'sub NC_CCITT () {"ccitt";}' unless defined(&NC_CCITT);
    eval 'sub NC_SNA () {"sna";}' unless defined(&NC_SNA);
    eval 'sub NC_DECNET () {"decnet";}' unless defined(&NC_DECNET);
    eval 'sub NC_DLI () {"dli";}' unless defined(&NC_DLI);
    eval 'sub NC_LAT () {"lat";}' unless defined(&NC_LAT);
    eval 'sub NC_HYLINK () {"hylink";}' unless defined(&NC_HYLINK);
    eval 'sub NC_APPLETALK () {"appletalk";}' unless defined(&NC_APPLETALK);
    eval 'sub NC_NIT () {"nit";}' unless defined(&NC_NIT);
    eval 'sub NC_IEEE802 () {"ieee802";}' unless defined(&NC_IEEE802);
    eval 'sub NC_OSI () {"osi";}' unless defined(&NC_OSI);
    eval 'sub NC_X25 () {"x25";}' unless defined(&NC_X25);
    eval 'sub NC_OSINET () {"osinet";}' unless defined(&NC_OSINET);
    eval 'sub NC_GOSIP () {"gosip";}' unless defined(&NC_GOSIP);
    eval 'sub NC_NOPROTO () {"-";}' unless defined(&NC_NOPROTO);
    eval 'sub NC_TCP () {"tcp";}' unless defined(&NC_TCP);
    eval 'sub NC_UDP () {"udp";}' unless defined(&NC_UDP);
    eval 'sub NC_ICMP () {"icmp";}' unless defined(&NC_ICMP);
}
1;

require '_h2ph_pre.ph';

no warnings qw(redefine misc);

unless(defined(&_ALIAS_H_)) {
    eval 'sub _ALIAS_H_ () {1;}' unless defined(&_ALIAS_H_);
    require 'netinet/in_systm.ph';
    require 'netinet/in.ph';
    require 'netinet/ip.ph';
    eval 'sub LIBALIAS_BUF_SIZE () {128;}' unless defined(&LIBALIAS_BUF_SIZE);
    if(defined(&_KERNEL)) {
	eval 'sub NO_FW_PUNCH () {1;}' unless defined(&NO_FW_PUNCH);
	eval 'sub NO_USE_SOCKETS () {1;}' unless defined(&NO_USE_SOCKETS);
    }
    eval 'sub PKT_ALIAS_LOG () {0x1;}' unless defined(&PKT_ALIAS_LOG);
    eval 'sub PKT_ALIAS_DENY_INCOMING () {0x2;}' unless defined(&PKT_ALIAS_DENY_INCOMING);
    eval 'sub PKT_ALIAS_SAME_PORTS () {0x4;}' unless defined(&PKT_ALIAS_SAME_PORTS);
    unless(defined(&NO_USE_SOCKETS)) {
	eval 'sub PKT_ALIAS_USE_SOCKETS () {0x8;}' unless defined(&PKT_ALIAS_USE_SOCKETS);
    }
    eval 'sub PKT_ALIAS_UNREGISTERED_ONLY () {0x10;}' unless defined(&PKT_ALIAS_UNREGISTERED_ONLY);
    eval 'sub PKT_ALIAS_RESET_ON_ADDR_CHANGE () {0x20;}' unless defined(&PKT_ALIAS_RESET_ON_ADDR_CHANGE);
    eval 'sub PKT_ALIAS_PROXY_ONLY () {0x40;}' unless defined(&PKT_ALIAS_PROXY_ONLY);
    eval 'sub PKT_ALIAS_REVERSE () {0x80;}' unless defined(&PKT_ALIAS_REVERSE);
    unless(defined(&NO_FW_PUNCH)) {
	eval 'sub PKT_ALIAS_PUNCH_FW () {0x100;}' unless defined(&PKT_ALIAS_PUNCH_FW);
    }
    eval 'sub PKT_ALIAS_SKIP_GLOBAL () {0x200;}' unless defined(&PKT_ALIAS_SKIP_GLOBAL);
    eval 'sub PKT_ALIAS_UNREGISTERED_CGN () {0x400;}' unless defined(&PKT_ALIAS_UNREGISTERED_CGN);
    eval 'sub PKT_ALIAS_ERROR () {-1;}' unless defined(&PKT_ALIAS_ERROR);
    eval 'sub PKT_ALIAS_OK () {1;}' unless defined(&PKT_ALIAS_OK);
    eval 'sub PKT_ALIAS_IGNORED () {2;}' unless defined(&PKT_ALIAS_IGNORED);
    eval 'sub PKT_ALIAS_UNRESOLVED_FRAGMENT () {3;}' unless defined(&PKT_ALIAS_UNRESOLVED_FRAGMENT);
    eval 'sub PKT_ALIAS_FOUND_HEADER_FRAGMENT () {4;}' unless defined(&PKT_ALIAS_FOUND_HEADER_FRAGMENT);
}
1;

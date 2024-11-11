require '_h2ph_pre.ph';

no warnings qw(redefine misc);

unless(defined(&_BLACKLIST_H)) {
    eval 'sub _BLACKLIST_H () {1;}' unless defined(&_BLACKLIST_H);
    require 'sys/socket.ph';
    eval 'sub BLACKLIST_API_ENUM () {1;}' unless defined(&BLACKLIST_API_ENUM);
    eval("sub BLACKLIST_AUTH_OK () { 0; }") unless defined(&BLACKLIST_AUTH_OK);
    eval("sub BLACKLIST_AUTH_FAIL () { 1; }") unless defined(&BLACKLIST_AUTH_FAIL);
    eval("sub BLACKLIST_ABUSIVE_BEHAVIOR () { 2; }") unless defined(&BLACKLIST_ABUSIVE_BEHAVIOR);
    eval("sub BLACKLIST_BAD_USER () { 3; }") unless defined(&BLACKLIST_BAD_USER);
}
1;

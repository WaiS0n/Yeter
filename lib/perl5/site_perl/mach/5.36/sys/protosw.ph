require '_h2ph_pre.ph';

no warnings qw(redefine misc);

unless(defined(&_SYS_PROTOSW_H_)) {
    eval 'sub _SYS_PROTOSW_H_ () {1;}' unless defined(&_SYS_PROTOSW_H_);
    require 'sys/queue.ph';
    eval("sub PRUS_OOB () { 0x1; }") unless defined(&PRUS_OOB);
    eval("sub PRUS_EOF () { 0x2; }") unless defined(&PRUS_EOF);
    eval("sub PRUS_MORETOCOME () { 0x4; }") unless defined(&PRUS_MORETOCOME);
    eval("sub PRUS_NOTREADY () { 0x8; }") unless defined(&PRUS_NOTREADY);
    eval("sub PRUS_IPV6 () { 0x10; }") unless defined(&PRUS_IPV6);
    eval 'sub PR_ATOMIC () {0x1;}' unless defined(&PR_ATOMIC);
    eval 'sub PR_ADDR () {0x2;}' unless defined(&PR_ADDR);
    eval 'sub PR_CONNREQUIRED () {0x4;}' unless defined(&PR_CONNREQUIRED);
    eval 'sub PR_WANTRCVD () {0x8;}' unless defined(&PR_WANTRCVD);
    eval 'sub PR_RIGHTS () {0x10;}' unless defined(&PR_RIGHTS);
    eval 'sub PR_IMPLOPCL () {0x20;}' unless defined(&PR_IMPLOPCL);
    eval 'sub PR_CAPATTACH () {0x80;}' unless defined(&PR_CAPATTACH);
    eval 'sub PR_SOCKBUF () {0x100;}' unless defined(&PR_SOCKBUF);
    eval 'sub PRCO_GETOPT () {0;}' unless defined(&PRCO_GETOPT);
    eval 'sub PRCO_SETOPT () {1;}' unless defined(&PRCO_SETOPT);
    eval 'sub PRCO_NCMDS () {2;}' unless defined(&PRCO_NCMDS);
    if(defined(&PRCOREQUESTS)) {
    }
    if(defined(&_KERNEL)) {
    }
}
1;

require '_h2ph_pre.ph';

no warnings qw(redefine misc);

unless(defined(&rpoll_h_)) {
    eval 'sub rpoll_h_ () {1;}' unless defined(&rpoll_h_);
    if(defined(&__cplusplus)) {
    }
    eval("sub RPOLL_IN () { 1; }") unless defined(&RPOLL_IN);
    eval("sub RPOLL_OUT () { 2; }") unless defined(&RPOLL_OUT);
    eval("sub RPOLL_EXCEPT () { 4; }") unless defined(&RPOLL_EXCEPT);
    if(defined(&__cplusplus)) {
    }
}
1;

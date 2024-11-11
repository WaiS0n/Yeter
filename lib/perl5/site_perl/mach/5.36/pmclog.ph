require '_h2ph_pre.ph';

no warnings qw(redefine misc);

unless(defined(&_PMCLOG_H_)) {
    eval 'sub _PMCLOG_H_ () {1;}' unless defined(&_PMCLOG_H_);
    require 'sys/cdefs.ph';
    require 'sys/pmclog.ph';
    eval("sub PMCLOG_OK () { 0; }") unless defined(&PMCLOG_OK);
    eval("sub PMCLOG_EOF () { 1; }") unless defined(&PMCLOG_EOF);
    eval("sub PMCLOG_REQUIRE_DATA () { 2; }") unless defined(&PMCLOG_REQUIRE_DATA);
    eval("sub PMCLOG_ERROR () { 3; }") unless defined(&PMCLOG_ERROR);
    eval("sub PL_STATE_NEW_RECORD () { 0; }") unless defined(&PL_STATE_NEW_RECORD);
    eval("sub PL_STATE_EXPECTING_HEADER () { 1; }") unless defined(&PL_STATE_EXPECTING_HEADER);
    eval("sub PL_STATE_PARTIAL_RECORD () { 2; }") unless defined(&PL_STATE_PARTIAL_RECORD);
    eval("sub PL_STATE_ERROR () { 3; }") unless defined(&PL_STATE_ERROR);
    eval 'sub PMCLOG_FD_NONE () {(-1);}' unless defined(&PMCLOG_FD_NONE);
}
1;

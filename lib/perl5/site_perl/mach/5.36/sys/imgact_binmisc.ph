require '_h2ph_pre.ph';

no warnings qw(redefine misc);

unless(defined(&_IMGACT_BINMISC_H_)) {
    eval 'sub _IMGACT_BINMISC_H_ () {1;}' unless defined(&_IMGACT_BINMISC_H_);
    require 'sys/param.ph';
    eval 'sub IBE_VERSION () {1;}' unless defined(&IBE_VERSION);
    eval 'sub IBE_NAME_MAX () {32;}' unless defined(&IBE_NAME_MAX);
    eval 'sub IBE_MAGIC_MAX () {256;}' unless defined(&IBE_MAGIC_MAX);
    eval 'sub IBE_ARG_LEN_MAX () {256;}' unless defined(&IBE_ARG_LEN_MAX);
    eval 'sub IBE_INTERP_LEN_MAX () {( &MAXPATHLEN +  &IBE_ARG_LEN_MAX);}' unless defined(&IBE_INTERP_LEN_MAX);
    eval 'sub IBE_MAX_ENTRIES () {64;}' unless defined(&IBE_MAX_ENTRIES);
    eval 'sub IBE_MATCH_MAX () { &PAGE_SIZE;}' unless defined(&IBE_MATCH_MAX);
    eval 'sub IBF_ENABLED () {0x1;}' unless defined(&IBF_ENABLED);
    eval 'sub IBF_USE_MASK () {0x2;}' unless defined(&IBF_USE_MASK);
    eval 'sub IBF_PRE_OPEN () {0x4;}' unless defined(&IBF_PRE_OPEN);
    eval 'sub IBF_VALID_UFLAGS () {0x7;}' unless defined(&IBF_VALID_UFLAGS);
    eval 'sub IBE_SYSCTL_NAME () {"kern.binmisc";}' unless defined(&IBE_SYSCTL_NAME);
    eval 'sub IBE_SYSCTL_NAME_ADD () { &IBE_SYSCTL_NAME ".add";}' unless defined(&IBE_SYSCTL_NAME_ADD);
    eval 'sub IBE_SYSCTL_NAME_REMOVE () { &IBE_SYSCTL_NAME ".remove";}' unless defined(&IBE_SYSCTL_NAME_REMOVE);
    eval 'sub IBE_SYSCTL_NAME_DISABLE () { &IBE_SYSCTL_NAME ".disable";}' unless defined(&IBE_SYSCTL_NAME_DISABLE);
    eval 'sub IBE_SYSCTL_NAME_ENABLE () { &IBE_SYSCTL_NAME ".enable";}' unless defined(&IBE_SYSCTL_NAME_ENABLE);
    eval 'sub IBE_SYSCTL_NAME_LOOKUP () { &IBE_SYSCTL_NAME ".lookup";}' unless defined(&IBE_SYSCTL_NAME_LOOKUP);
    eval 'sub IBE_SYSCTL_NAME_LIST () { &IBE_SYSCTL_NAME ".list";}' unless defined(&IBE_SYSCTL_NAME_LIST);
    eval 'sub KMOD_NAME () {"imgact_binmisc";}' unless defined(&KMOD_NAME);
}
1;

require '_h2ph_pre.ph';

no warnings qw(redefine misc);

unless(defined(&_MTLIB_H)) {
    eval 'sub _MTLIB_H () {1;}' unless defined(&_MTLIB_H);
    eval("sub MT_TYPE_NONE () { 0; }") unless defined(&MT_TYPE_NONE);
    eval("sub MT_TYPE_STRING () { 1; }") unless defined(&MT_TYPE_STRING);
    eval("sub MT_TYPE_INT () { 2; }") unless defined(&MT_TYPE_INT);
    eval("sub MT_TYPE_UINT () { 3; }") unless defined(&MT_TYPE_UINT);
    eval("sub MT_TYPE_NODE () { 4; }") unless defined(&MT_TYPE_NODE);
    eval("sub MT_PF_NONE () { 0x00; }") unless defined(&MT_PF_NONE);
    eval("sub MT_PF_VERBOSE () { 0x01; }") unless defined(&MT_PF_VERBOSE);
    eval("sub MT_PF_FULL_PATH () { 0x02; }") unless defined(&MT_PF_FULL_PATH);
    eval("sub MT_PF_INCLUDE_ROOT () { 0x04; }") unless defined(&MT_PF_INCLUDE_ROOT);
}
1;

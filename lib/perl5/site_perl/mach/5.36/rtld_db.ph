require '_h2ph_pre.ph';

no warnings qw(redefine misc);

unless(defined(&_RTLD_DB_H_)) {
    eval 'sub _RTLD_DB_H_ () {1;}' unless defined(&_RTLD_DB_H_);
    require 'sys/param.ph';
    eval 'sub RD_VERSION () {1;}' unless defined(&RD_VERSION);
    eval("sub RD_OK () { 0; }") unless defined(&RD_OK);
    eval("sub RD_ERR () { 1; }") unless defined(&RD_ERR);
    eval("sub RD_DBERR () { 2; }") unless defined(&RD_DBERR);
    eval("sub RD_NOCAPAB () { 3; }") unless defined(&RD_NOCAPAB);
    eval("sub RD_NODYNAM () { 4; }") unless defined(&RD_NODYNAM);
    eval("sub RD_NOBASE () { 5; }") unless defined(&RD_NOBASE);
    eval("sub RD_NOMAPS () { 6; }") unless defined(&RD_NOMAPS);
    eval 'sub RD_RDL_R () {0x1;}' unless defined(&RD_RDL_R);
    eval 'sub RD_RDL_W () {0x2;}' unless defined(&RD_RDL_W);
    eval 'sub RD_RDL_X () {0x4;}' unless defined(&RD_RDL_X);
    eval("sub RDL_TYPE_NONE () { 0; }") unless defined(&RDL_TYPE_NONE);
    eval("sub RDL_TYPE_DEF () { 1; }") unless defined(&RDL_TYPE_DEF);
    eval("sub RDL_TYPE_VNODE () { 2; }") unless defined(&RDL_TYPE_VNODE);
    eval("sub RDL_TYPE_SWAP () { 3; }") unless defined(&RDL_TYPE_SWAP);
    eval("sub RDL_TYPE_DEV () { 4; }") unless defined(&RDL_TYPE_DEV);
    eval("sub RDL_TYPE_UNKNOWN () { 255; }") unless defined(&RDL_TYPE_UNKNOWN);
    eval("sub RD_NONE () { 0; }") unless defined(&RD_NONE);
    eval("sub RD_PREINIT () { 1; }") unless defined(&RD_PREINIT);
    eval("sub RD_POSTINIT () { 2; }") unless defined(&RD_POSTINIT);
    eval("sub RD_DLACTIVITY () { 3; }") unless defined(&RD_DLACTIVITY);
    eval("sub RD_NOTIFY_BPT () { 0; }") unless defined(&RD_NOTIFY_BPT);
    eval("sub RD_NOTIFY_AUTOBPT () { 1; }") unless defined(&RD_NOTIFY_AUTOBPT);
    eval("sub RD_NOTIFY_SYSCALL () { 2; }") unless defined(&RD_NOTIFY_SYSCALL);
    eval("sub RD_NOSTATE () { 0; }") unless defined(&RD_NOSTATE);
    eval("sub RD_CONSISTENT () { 1; }") unless defined(&RD_CONSISTENT);
    eval("sub RD_ADD () { 2; }") unless defined(&RD_ADD);
    eval("sub RD_DELETE () { 3; }") unless defined(&RD_DELETE);
    eval("sub RD_RESOLVE_NONE () { 0; }") unless defined(&RD_RESOLVE_NONE);
    eval("sub RD_RESOLVE_STEP () { 1; }") unless defined(&RD_RESOLVE_STEP);
    eval("sub RD_RESOLVE_TARGET () { 2; }") unless defined(&RD_RESOLVE_TARGET);
    eval("sub RD_RESOLVE_TARGET_STEP () { 3; }") unless defined(&RD_RESOLVE_TARGET_STEP);
    eval 'sub RD_FLG_PI_PLTBOUND () {0x1;}' unless defined(&RD_FLG_PI_PLTBOUND);
}
1;

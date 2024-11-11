require '_h2ph_pre.ph';

no warnings qw(redefine misc);

unless(defined(&_LIBBE_H)) {
    eval 'sub _LIBBE_H () {1;}' unless defined(&_LIBBE_H);
    require 'libnvpair.ph';
    require 'stdbool.ph';
    eval 'sub BE_MAXPATHLEN () {512;}' unless defined(&BE_MAXPATHLEN);
    eval("sub BE_ERR_SUCCESS () { 0; }") unless defined(&BE_ERR_SUCCESS);
    eval("sub BE_ERR_INVALIDNAME () { 1; }") unless defined(&BE_ERR_INVALIDNAME);
    eval("sub BE_ERR_EXISTS () { 2; }") unless defined(&BE_ERR_EXISTS);
    eval("sub BE_ERR_NOENT () { 3; }") unless defined(&BE_ERR_NOENT);
    eval("sub BE_ERR_PERMS () { 4; }") unless defined(&BE_ERR_PERMS);
    eval("sub BE_ERR_DESTROYACT () { 5; }") unless defined(&BE_ERR_DESTROYACT);
    eval("sub BE_ERR_DESTROYMNT () { 6; }") unless defined(&BE_ERR_DESTROYMNT);
    eval("sub BE_ERR_BADPATH () { 7; }") unless defined(&BE_ERR_BADPATH);
    eval("sub BE_ERR_PATHBUSY () { 8; }") unless defined(&BE_ERR_PATHBUSY);
    eval("sub BE_ERR_PATHLEN () { 9; }") unless defined(&BE_ERR_PATHLEN);
    eval("sub BE_ERR_BADMOUNT () { 10; }") unless defined(&BE_ERR_BADMOUNT);
    eval("sub BE_ERR_NOORIGIN () { 11; }") unless defined(&BE_ERR_NOORIGIN);
    eval("sub BE_ERR_MOUNTED () { 12; }") unless defined(&BE_ERR_MOUNTED);
    eval("sub BE_ERR_NOMOUNT () { 13; }") unless defined(&BE_ERR_NOMOUNT);
    eval("sub BE_ERR_ZFSOPEN () { 14; }") unless defined(&BE_ERR_ZFSOPEN);
    eval("sub BE_ERR_ZFSCLONE () { 15; }") unless defined(&BE_ERR_ZFSCLONE);
    eval("sub BE_ERR_IO () { 16; }") unless defined(&BE_ERR_IO);
    eval("sub BE_ERR_NOPOOL () { 17; }") unless defined(&BE_ERR_NOPOOL);
    eval("sub BE_ERR_NOMEM () { 18; }") unless defined(&BE_ERR_NOMEM);
    eval("sub BE_ERR_UNKNOWN () { 19; }") unless defined(&BE_ERR_UNKNOWN);
    eval("sub BE_ERR_INVORIGIN () { 20; }") unless defined(&BE_ERR_INVORIGIN);
    eval("sub BE_ERR_HASCLONES () { 21; }") unless defined(&BE_ERR_HASCLONES);
    eval("sub BE_DESTROY_FORCE () { 1<<0; }") unless defined(&BE_DESTROY_FORCE);
    eval("sub BE_DESTROY_ORIGIN () { 1<<1; }") unless defined(&BE_DESTROY_ORIGIN);
    eval("sub BE_DESTROY_AUTOORIGIN () { 1<<2; }") unless defined(&BE_DESTROY_AUTOORIGIN);
    eval("sub BE_MNT_FORCE () { 1<<0; }") unless defined(&BE_MNT_FORCE);
    eval("sub BE_MNT_DEEP () { 1<<1; }") unless defined(&BE_MNT_DEEP);
    if((defined(&SOON) ? &SOON : undef)) {
    }
}
1;

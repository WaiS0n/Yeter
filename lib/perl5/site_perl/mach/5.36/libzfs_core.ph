require '_h2ph_pre.ph';

no warnings qw(redefine misc);

unless(defined(&_LIBZFS_CORE_H)) {
    eval 'sub _LIBZFS_CORE_H () { &extern  &__attribute__(( &visibility("default")));}' unless defined(&_LIBZFS_CORE_H);
    require 'libnvpair.ph';
    require 'sys/param.ph';
    require 'sys/types.ph';
    require 'sys/fs/zfs.ph';
    if(defined(&__cplusplus)) {
    }
    eval("sub LZC_DATSET_TYPE_ZFS () { 2; }") unless defined(&LZC_DATSET_TYPE_ZFS);
    eval("sub LZC_DATSET_TYPE_ZVOL () { 3; }") unless defined(&LZC_DATSET_TYPE_ZVOL);
    eval("sub LZC_SEND_FLAG_EMBED_DATA () { 1<<0; }") unless defined(&LZC_SEND_FLAG_EMBED_DATA);
    eval("sub LZC_SEND_FLAG_LARGE_BLOCK () { 1<<1; }") unless defined(&LZC_SEND_FLAG_LARGE_BLOCK);
    eval("sub LZC_SEND_FLAG_COMPRESS () { 1<<2; }") unless defined(&LZC_SEND_FLAG_COMPRESS);
    eval("sub LZC_SEND_FLAG_RAW () { 1<<3; }") unless defined(&LZC_SEND_FLAG_RAW);
    eval("sub LZC_SEND_FLAG_SAVED () { 1<<4; }") unless defined(&LZC_SEND_FLAG_SAVED);
    if(defined(&__cplusplus)) {
    }
}
1;

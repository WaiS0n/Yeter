require '_h2ph_pre.ph';

no warnings qw(redefine misc);

unless(defined(&_SHA256_H_)) {
    eval 'sub _SHA256_H_ () {1;}' unless defined(&_SHA256_H_);
    unless(defined(&_KERNEL)) {
	require 'sys/types.ph';
    }
    eval 'sub SHA256_BLOCK_LENGTH () {64;}' unless defined(&SHA256_BLOCK_LENGTH);
    eval 'sub SHA256_DIGEST_LENGTH () {32;}' unless defined(&SHA256_DIGEST_LENGTH);
    eval 'sub SHA256_DIGEST_STRING_LENGTH () {( &SHA256_DIGEST_LENGTH * 2+ 1);}' unless defined(&SHA256_DIGEST_STRING_LENGTH);
    unless(defined(&SHA256_Init)) {
	eval 'sub SHA256_Init () { &_libmd_SHA256_Init;}' unless defined(&SHA256_Init);
    }
    unless(defined(&SHA256_Update)) {
	eval 'sub SHA256_Update () { &_libmd_SHA256_Update;}' unless defined(&SHA256_Update);
    }
    unless(defined(&SHA256_Final)) {
	eval 'sub SHA256_Final () { &_libmd_SHA256_Final;}' unless defined(&SHA256_Final);
    }
    unless(defined(&SHA256_End)) {
	eval 'sub SHA256_End () { &_libmd_SHA256_End;}' unless defined(&SHA256_End);
    }
    unless(defined(&SHA256_Fd)) {
	eval 'sub SHA256_Fd () { &_libmd_SHA256_Fd;}' unless defined(&SHA256_Fd);
    }
    unless(defined(&SHA256_FdChunk)) {
	eval 'sub SHA256_FdChunk () { &_libmd_SHA256_FdChunk;}' unless defined(&SHA256_FdChunk);
    }
    unless(defined(&SHA256_File)) {
	eval 'sub SHA256_File () { &_libmd_SHA256_File;}' unless defined(&SHA256_File);
    }
    unless(defined(&SHA256_FileChunk)) {
	eval 'sub SHA256_FileChunk () { &_libmd_SHA256_FileChunk;}' unless defined(&SHA256_FileChunk);
    }
    unless(defined(&SHA256_Data)) {
	eval 'sub SHA256_Data () { &_libmd_SHA256_Data;}' unless defined(&SHA256_Data);
    }
    unless(defined(&SHA256_Transform)) {
	eval 'sub SHA256_Transform () { &_libmd_SHA256_Transform;}' unless defined(&SHA256_Transform);
    }
    unless(defined(&SHA256_version)) {
	eval 'sub SHA256_version () { &_libmd_SHA256_version;}' unless defined(&SHA256_version);
    }
    unless(defined(&_KERNEL)) {
    }
}
1;

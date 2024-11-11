require '_h2ph_pre.ph';

no warnings qw(redefine misc);

unless(defined(&_SHA512_H_)) {
    eval 'sub _SHA512_H_ () {1;}' unless defined(&_SHA512_H_);
    unless(defined(&_KERNEL)) {
	require 'sys/types.ph';
    }
    eval 'sub SHA512_BLOCK_LENGTH () {128;}' unless defined(&SHA512_BLOCK_LENGTH);
    eval 'sub SHA512_DIGEST_LENGTH () {64;}' unless defined(&SHA512_DIGEST_LENGTH);
    eval 'sub SHA512_DIGEST_STRING_LENGTH () {( &SHA512_DIGEST_LENGTH * 2+ 1);}' unless defined(&SHA512_DIGEST_STRING_LENGTH);
    unless(defined(&SHA512_Init)) {
	eval 'sub SHA512_Init () { &_libmd_SHA512_Init;}' unless defined(&SHA512_Init);
    }
    unless(defined(&SHA512_Update)) {
	eval 'sub SHA512_Update () { &_libmd_SHA512_Update;}' unless defined(&SHA512_Update);
    }
    unless(defined(&SHA512_Final)) {
	eval 'sub SHA512_Final () { &_libmd_SHA512_Final;}' unless defined(&SHA512_Final);
    }
    unless(defined(&SHA512_End)) {
	eval 'sub SHA512_End () { &_libmd_SHA512_End;}' unless defined(&SHA512_End);
    }
    unless(defined(&SHA512_Fd)) {
	eval 'sub SHA512_Fd () { &_libmd_SHA512_Fd;}' unless defined(&SHA512_Fd);
    }
    unless(defined(&SHA512_FdChunk)) {
	eval 'sub SHA512_FdChunk () { &_libmd_SHA512_FdChunk;}' unless defined(&SHA512_FdChunk);
    }
    unless(defined(&SHA512_File)) {
	eval 'sub SHA512_File () { &_libmd_SHA512_File;}' unless defined(&SHA512_File);
    }
    unless(defined(&SHA512_FileChunk)) {
	eval 'sub SHA512_FileChunk () { &_libmd_SHA512_FileChunk;}' unless defined(&SHA512_FileChunk);
    }
    unless(defined(&SHA512_Data)) {
	eval 'sub SHA512_Data () { &_libmd_SHA512_Data;}' unless defined(&SHA512_Data);
    }
    unless(defined(&SHA512_Transform)) {
	eval 'sub SHA512_Transform () { &_libmd_SHA512_Transform;}' unless defined(&SHA512_Transform);
    }
    unless(defined(&SHA512_version)) {
	eval 'sub SHA512_version () { &_libmd_SHA512_version;}' unless defined(&SHA512_version);
    }
    unless(defined(&_KERNEL)) {
    }
}
1;

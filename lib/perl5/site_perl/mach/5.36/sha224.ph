require '_h2ph_pre.ph';

no warnings qw(redefine misc);

unless(defined(&_SHA224_H_)) {
    eval 'sub _SHA224_H_ () {1;}' unless defined(&_SHA224_H_);
    unless(defined(&_KERNEL)) {
	require 'sys/types.ph';
    }
    eval 'sub SHA224_BLOCK_LENGTH () {64;}' unless defined(&SHA224_BLOCK_LENGTH);
    eval 'sub SHA224_DIGEST_LENGTH () {28;}' unless defined(&SHA224_DIGEST_LENGTH);
    eval 'sub SHA224_DIGEST_STRING_LENGTH () {( &SHA224_DIGEST_LENGTH * 2+ 1);}' unless defined(&SHA224_DIGEST_STRING_LENGTH);
    unless(defined(&SHA224_Init)) {
	eval 'sub SHA224_Init () { &_libmd_SHA224_Init;}' unless defined(&SHA224_Init);
    }
    unless(defined(&SHA224_Update)) {
	eval 'sub SHA224_Update () { &_libmd_SHA224_Update;}' unless defined(&SHA224_Update);
    }
    unless(defined(&SHA224_Final)) {
	eval 'sub SHA224_Final () { &_libmd_SHA224_Final;}' unless defined(&SHA224_Final);
    }
    unless(defined(&SHA224_End)) {
	eval 'sub SHA224_End () { &_libmd_SHA224_End;}' unless defined(&SHA224_End);
    }
    unless(defined(&SHA224_Fd)) {
	eval 'sub SHA224_Fd () { &_libmd_SHA224_Fd;}' unless defined(&SHA224_Fd);
    }
    unless(defined(&SHA224_FdChunk)) {
	eval 'sub SHA224_FdChunk () { &_libmd_SHA224_FdChunk;}' unless defined(&SHA224_FdChunk);
    }
    unless(defined(&SHA224_File)) {
	eval 'sub SHA224_File () { &_libmd_SHA224_File;}' unless defined(&SHA224_File);
    }
    unless(defined(&SHA224_FileChunk)) {
	eval 'sub SHA224_FileChunk () { &_libmd_SHA224_FileChunk;}' unless defined(&SHA224_FileChunk);
    }
    unless(defined(&SHA224_Data)) {
	eval 'sub SHA224_Data () { &_libmd_SHA224_Data;}' unless defined(&SHA224_Data);
    }
    unless(defined(&SHA224_version)) {
	eval 'sub SHA224_version () { &_libmd_SHA224_version;}' unless defined(&SHA224_version);
    }
    unless(defined(&_KERNEL)) {
    }
}
1;

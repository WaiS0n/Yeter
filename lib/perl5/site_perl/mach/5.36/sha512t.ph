require '_h2ph_pre.ph';

no warnings qw(redefine misc);

unless(defined(&_SHA512T_H_)) {
    eval 'sub _SHA512T_H_ () {1;}' unless defined(&_SHA512T_H_);
    require 'sha512.ph';
    unless(defined(&_KERNEL)) {
	require 'sys/types.ph';
    }
    eval 'sub SHA512_224_DIGEST_LENGTH () {28;}' unless defined(&SHA512_224_DIGEST_LENGTH);
    eval 'sub SHA512_224_DIGEST_STRING_LENGTH () {( &SHA512_224_DIGEST_LENGTH * 2+ 1);}' unless defined(&SHA512_224_DIGEST_STRING_LENGTH);
    eval 'sub SHA512_256_DIGEST_LENGTH () {32;}' unless defined(&SHA512_256_DIGEST_LENGTH);
    eval 'sub SHA512_256_DIGEST_STRING_LENGTH () {( &SHA512_256_DIGEST_LENGTH * 2+ 1);}' unless defined(&SHA512_256_DIGEST_STRING_LENGTH);
    unless(defined(&SHA512_224_Init)) {
	eval 'sub SHA512_224_Init () { &_libmd_SHA512_224_Init;}' unless defined(&SHA512_224_Init);
    }
    unless(defined(&SHA512_224_Update)) {
	eval 'sub SHA512_224_Update () { &_libmd_SHA512_224_Update;}' unless defined(&SHA512_224_Update);
    }
    unless(defined(&SHA512_224_Final)) {
	eval 'sub SHA512_224_Final () { &_libmd_SHA512_224_Final;}' unless defined(&SHA512_224_Final);
    }
    unless(defined(&SHA512_224_End)) {
	eval 'sub SHA512_224_End () { &_libmd_SHA512_224_End;}' unless defined(&SHA512_224_End);
    }
    unless(defined(&SHA512_224_Fd)) {
	eval 'sub SHA512_224_Fd () { &_libmd_SHA512_224_Fd;}' unless defined(&SHA512_224_Fd);
    }
    unless(defined(&SHA512_224_FdChunk)) {
	eval 'sub SHA512_224_FdChunk () { &_libmd_SHA512_224_FdChunk;}' unless defined(&SHA512_224_FdChunk);
    }
    unless(defined(&SHA512_224_File)) {
	eval 'sub SHA512_224_File () { &_libmd_SHA512_224_File;}' unless defined(&SHA512_224_File);
    }
    unless(defined(&SHA512_224_FileChunk)) {
	eval 'sub SHA512_224_FileChunk () { &_libmd_SHA512_224_FileChunk;}' unless defined(&SHA512_224_FileChunk);
    }
    unless(defined(&SHA512_224_Data)) {
	eval 'sub SHA512_224_Data () { &_libmd_SHA512_224_Data;}' unless defined(&SHA512_224_Data);
    }
    unless(defined(&SHA512_224_Transform)) {
	eval 'sub SHA512_224_Transform () { &_libmd_SHA512_224_Transform;}' unless defined(&SHA512_224_Transform);
    }
    unless(defined(&SHA512_224_version)) {
	eval 'sub SHA512_224_version () { &_libmd_SHA512_224_version;}' unless defined(&SHA512_224_version);
    }
    unless(defined(&SHA512_256_Init)) {
	eval 'sub SHA512_256_Init () { &_libmd_SHA512_256_Init;}' unless defined(&SHA512_256_Init);
    }
    unless(defined(&SHA512_256_Update)) {
	eval 'sub SHA512_256_Update () { &_libmd_SHA512_256_Update;}' unless defined(&SHA512_256_Update);
    }
    unless(defined(&SHA512_256_Final)) {
	eval 'sub SHA512_256_Final () { &_libmd_SHA512_256_Final;}' unless defined(&SHA512_256_Final);
    }
    unless(defined(&SHA512_256_End)) {
	eval 'sub SHA512_256_End () { &_libmd_SHA512_256_End;}' unless defined(&SHA512_256_End);
    }
    unless(defined(&SHA512_256_Fd)) {
	eval 'sub SHA512_256_Fd () { &_libmd_SHA512_256_Fd;}' unless defined(&SHA512_256_Fd);
    }
    unless(defined(&SHA512_256_FdChunk)) {
	eval 'sub SHA512_256_FdChunk () { &_libmd_SHA512_256_FdChunk;}' unless defined(&SHA512_256_FdChunk);
    }
    unless(defined(&SHA512_256_File)) {
	eval 'sub SHA512_256_File () { &_libmd_SHA512_256_File;}' unless defined(&SHA512_256_File);
    }
    unless(defined(&SHA512_256_FileChunk)) {
	eval 'sub SHA512_256_FileChunk () { &_libmd_SHA512_256_FileChunk;}' unless defined(&SHA512_256_FileChunk);
    }
    unless(defined(&SHA512_256_Data)) {
	eval 'sub SHA512_256_Data () { &_libmd_SHA512_256_Data;}' unless defined(&SHA512_256_Data);
    }
    unless(defined(&SHA512_256_Transform)) {
	eval 'sub SHA512_256_Transform () { &_libmd_SHA512_256_Transform;}' unless defined(&SHA512_256_Transform);
    }
    unless(defined(&SHA512_256_version)) {
	eval 'sub SHA512_256_version () { &_libmd_SHA512_256_version;}' unless defined(&SHA512_256_version);
    }
    unless(defined(&_KERNEL)) {
    }
    unless(defined(&_KERNEL)) {
    }
}
1;

require '_h2ph_pre.ph';

no warnings qw(redefine misc);

unless(defined(&_SHA_H_)) {
    eval 'sub _SHA_H_ () {1;}' unless defined(&_SHA_H_);
    require 'sys/cdefs.ph';
    require 'sys/types.ph';
    eval 'sub SHA_CBLOCK () {64;}' unless defined(&SHA_CBLOCK);
    eval 'sub SHA_LBLOCK () {16;}' unless defined(&SHA_LBLOCK);
    eval 'sub SHA_BLOCK () {16;}' unless defined(&SHA_BLOCK);
    eval 'sub SHA_LAST_BLOCK () {56;}' unless defined(&SHA_LAST_BLOCK);
    eval 'sub SHA_LENGTH_BLOCK () {8;}' unless defined(&SHA_LENGTH_BLOCK);
    eval 'sub SHA_DIGEST_LENGTH () {20;}' unless defined(&SHA_DIGEST_LENGTH);
    eval 'sub SHA1_CTX () { &SHA_CTX;}' unless defined(&SHA1_CTX);
    unless(defined(&SHA_Init)) {
	eval 'sub SHA_Init () { &_libmd_SHA_Init;}' unless defined(&SHA_Init);
    }
    unless(defined(&SHA_Update)) {
	eval 'sub SHA_Update () { &_libmd_SHA_Update;}' unless defined(&SHA_Update);
    }
    unless(defined(&SHA_Final)) {
	eval 'sub SHA_Final () { &_libmd_SHA_Final;}' unless defined(&SHA_Final);
    }
    unless(defined(&SHA_End)) {
	eval 'sub SHA_End () { &_libmd_SHA_End;}' unless defined(&SHA_End);
    }
    unless(defined(&SHA_Fd)) {
	eval 'sub SHA_Fd () { &_libmd_SHA_Fd;}' unless defined(&SHA_Fd);
    }
    unless(defined(&SHA_FdChunk)) {
	eval 'sub SHA_FdChunk () { &_libmd_SHA_FdChunk;}' unless defined(&SHA_FdChunk);
    }
    unless(defined(&SHA_File)) {
	eval 'sub SHA_File () { &_libmd_SHA_File;}' unless defined(&SHA_File);
    }
    unless(defined(&SHA_FileChunk)) {
	eval 'sub SHA_FileChunk () { &_libmd_SHA_FileChunk;}' unless defined(&SHA_FileChunk);
    }
    unless(defined(&SHA_Data)) {
	eval 'sub SHA_Data () { &_libmd_SHA_Data;}' unless defined(&SHA_Data);
    }
    unless(defined(&SHA_Transform)) {
	eval 'sub SHA_Transform () { &_libmd_SHA_Transform;}' unless defined(&SHA_Transform);
    }
    unless(defined(&SHA_version)) {
	eval 'sub SHA_version () { &_libmd_SHA_version;}' unless defined(&SHA_version);
    }
    unless(defined(&sha_block)) {
	eval 'sub sha_block () { &_libmd_sha_block;}' unless defined(&sha_block);
    }
    unless(defined(&SHA1_Init)) {
	eval 'sub SHA1_Init () { &_libmd_SHA1_Init;}' unless defined(&SHA1_Init);
    }
    unless(defined(&SHA1_Update)) {
	eval 'sub SHA1_Update () { &_libmd_SHA1_Update;}' unless defined(&SHA1_Update);
    }
    unless(defined(&SHA1_Final)) {
	eval 'sub SHA1_Final () { &_libmd_SHA1_Final;}' unless defined(&SHA1_Final);
    }
    unless(defined(&SHA1_End)) {
	eval 'sub SHA1_End () { &_libmd_SHA1_End;}' unless defined(&SHA1_End);
    }
    unless(defined(&SHA1_Fd)) {
	eval 'sub SHA1_Fd () { &_libmd_SHA1_Fd;}' unless defined(&SHA1_Fd);
    }
    unless(defined(&SHA1_FdChunk)) {
	eval 'sub SHA1_FdChunk () { &_libmd_SHA1_FdChunk;}' unless defined(&SHA1_FdChunk);
    }
    unless(defined(&SHA1_File)) {
	eval 'sub SHA1_File () { &_libmd_SHA1_File;}' unless defined(&SHA1_File);
    }
    unless(defined(&SHA1_FileChunk)) {
	eval 'sub SHA1_FileChunk () { &_libmd_SHA1_FileChunk;}' unless defined(&SHA1_FileChunk);
    }
    unless(defined(&SHA1_Data)) {
	eval 'sub SHA1_Data () { &_libmd_SHA1_Data;}' unless defined(&SHA1_Data);
    }
    unless(defined(&SHA1_Transform)) {
	eval 'sub SHA1_Transform () { &_libmd_SHA1_Transform;}' unless defined(&SHA1_Transform);
    }
    unless(defined(&SHA1_version)) {
	eval 'sub SHA1_version () { &_libmd_SHA1_version;}' unless defined(&SHA1_version);
    }
    unless(defined(&sha1_block)) {
	eval 'sub sha1_block () { &_libmd_sha1_block;}' unless defined(&sha1_block);
    }
}
1;

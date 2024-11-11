require '_h2ph_pre.ph';

no warnings qw(redefine misc);

unless(defined(&_SHA384_H_)) {
    eval 'sub _SHA384_H_ () {1;}' unless defined(&_SHA384_H_);
    unless(defined(&_KERNEL)) {
	require 'sys/types.ph';
    }
    eval 'sub SHA384_BLOCK_LENGTH () {128;}' unless defined(&SHA384_BLOCK_LENGTH);
    eval 'sub SHA384_DIGEST_LENGTH () {48;}' unless defined(&SHA384_DIGEST_LENGTH);
    eval 'sub SHA384_DIGEST_STRING_LENGTH () {( &SHA384_DIGEST_LENGTH * 2+ 1);}' unless defined(&SHA384_DIGEST_STRING_LENGTH);
    unless(defined(&SHA384_Init)) {
	eval 'sub SHA384_Init () { &_libmd_SHA384_Init;}' unless defined(&SHA384_Init);
    }
    unless(defined(&SHA384_Update)) {
	eval 'sub SHA384_Update () { &_libmd_SHA384_Update;}' unless defined(&SHA384_Update);
    }
    unless(defined(&SHA384_Final)) {
	eval 'sub SHA384_Final () { &_libmd_SHA384_Final;}' unless defined(&SHA384_Final);
    }
    unless(defined(&SHA384_End)) {
	eval 'sub SHA384_End () { &_libmd_SHA384_End;}' unless defined(&SHA384_End);
    }
    unless(defined(&SHA384_Fd)) {
	eval 'sub SHA384_Fd () { &_libmd_SHA384_Fd;}' unless defined(&SHA384_Fd);
    }
    unless(defined(&SHA384_FdChunk)) {
	eval 'sub SHA384_FdChunk () { &_libmd_SHA384_FdChunk;}' unless defined(&SHA384_FdChunk);
    }
    unless(defined(&SHA384_File)) {
	eval 'sub SHA384_File () { &_libmd_SHA384_File;}' unless defined(&SHA384_File);
    }
    unless(defined(&SHA384_FileChunk)) {
	eval 'sub SHA384_FileChunk () { &_libmd_SHA384_FileChunk;}' unless defined(&SHA384_FileChunk);
    }
    unless(defined(&SHA384_Data)) {
	eval 'sub SHA384_Data () { &_libmd_SHA384_Data;}' unless defined(&SHA384_Data);
    }
    unless(defined(&SHA384_version)) {
	eval 'sub SHA384_version () { &_libmd_SHA384_version;}' unless defined(&SHA384_version);
    }
    unless(defined(&_KERNEL)) {
    }
}
1;

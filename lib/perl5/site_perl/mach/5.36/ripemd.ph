require '_h2ph_pre.ph';

no warnings qw(redefine misc);

unless(defined(&HEADER_RIPEMD_H)) {
    eval 'sub HEADER_RIPEMD_H () {1;}' unless defined(&HEADER_RIPEMD_H);
    require 'sys/cdefs.ph';
    require 'sys/types.ph';
    eval 'sub RIPEMD160_CBLOCK () {64;}' unless defined(&RIPEMD160_CBLOCK);
    eval 'sub RIPEMD160_LBLOCK () {16;}' unless defined(&RIPEMD160_LBLOCK);
    eval 'sub RIPEMD160_BLOCK () {16;}' unless defined(&RIPEMD160_BLOCK);
    eval 'sub RIPEMD160_LAST_BLOCK () {56;}' unless defined(&RIPEMD160_LAST_BLOCK);
    eval 'sub RIPEMD160_LENGTH_BLOCK () {8;}' unless defined(&RIPEMD160_LENGTH_BLOCK);
    eval 'sub RIPEMD160_DIGEST_LENGTH () {20;}' unless defined(&RIPEMD160_DIGEST_LENGTH);
    unless(defined(&RIPEMD160_Init)) {
	eval 'sub RIPEMD160_Init () { &_libmd_RIPEMD160_Init;}' unless defined(&RIPEMD160_Init);
    }
    unless(defined(&RIPEMD160_Update)) {
	eval 'sub RIPEMD160_Update () { &_libmd_RIPEMD160_Update;}' unless defined(&RIPEMD160_Update);
    }
    unless(defined(&RIPEMD160_Final)) {
	eval 'sub RIPEMD160_Final () { &_libmd_RIPEMD160_Final;}' unless defined(&RIPEMD160_Final);
    }
    unless(defined(&RIPEMD160_End)) {
	eval 'sub RIPEMD160_End () { &_libmd_RIPEMD160_End;}' unless defined(&RIPEMD160_End);
    }
    unless(defined(&RIPEMD160_Fd)) {
	eval 'sub RIPEMD160_Fd () { &_libmd_RIPEMD160_Fd;}' unless defined(&RIPEMD160_Fd);
    }
    unless(defined(&RIPEMD160_FdChunk)) {
	eval 'sub RIPEMD160_FdChunk () { &_libmd_RIPEMD160_FdChunk;}' unless defined(&RIPEMD160_FdChunk);
    }
    unless(defined(&RIPEMD160_File)) {
	eval 'sub RIPEMD160_File () { &_libmd_RIPEMD160_File;}' unless defined(&RIPEMD160_File);
    }
    unless(defined(&RIPEMD160_FileChunk)) {
	eval 'sub RIPEMD160_FileChunk () { &_libmd_RIPEMD160_FileChunk;}' unless defined(&RIPEMD160_FileChunk);
    }
    unless(defined(&RIPEMD160_Data)) {
	eval 'sub RIPEMD160_Data () { &_libmd_RIPEMD160_Data;}' unless defined(&RIPEMD160_Data);
    }
    unless(defined(&RIPEMD160_Transform)) {
	eval 'sub RIPEMD160_Transform () { &_libmd_RIPEMD160_Transform;}' unless defined(&RIPEMD160_Transform);
    }
    unless(defined(&RMD160_version)) {
	eval 'sub RMD160_version () { &_libmd_RMD160_version;}' unless defined(&RMD160_version);
    }
    unless(defined(&ripemd160_block)) {
	eval 'sub ripemd160_block () { &_libmd_ripemd160_block;}' unless defined(&ripemd160_block);
    }
}
1;

require '_h2ph_pre.ph';

no warnings qw(redefine misc);

unless(defined(&_MD4_H_)) {
    eval 'sub _MD4_H_ () {1;}' unless defined(&_MD4_H_);
    require 'sys/cdefs.ph';
    unless(defined(&MD4Init)) {
	eval 'sub MD4Init () { &_libmd_MD4Init;}' unless defined(&MD4Init);
    }
    unless(defined(&MD4Update)) {
	eval 'sub MD4Update () { &_libmd_MD4Update;}' unless defined(&MD4Update);
    }
    unless(defined(&MD4Pad)) {
	eval 'sub MD4Pad () { &_libmd_MD4Pad;}' unless defined(&MD4Pad);
    }
    unless(defined(&MD4Final)) {
	eval 'sub MD4Final () { &_libmd_MD4Final;}' unless defined(&MD4Final);
    }
    unless(defined(&MD4End)) {
	eval 'sub MD4End () { &_libmd_MD4End;}' unless defined(&MD4End);
    }
    unless(defined(&MD4Fd)) {
	eval 'sub MD4Fd () { &_libmd_MD4Fd;}' unless defined(&MD4Fd);
    }
    unless(defined(&MD4FdChunk)) {
	eval 'sub MD4FdChunk () { &_libmd_MD4FdChunk;}' unless defined(&MD4FdChunk);
    }
    unless(defined(&MD4File)) {
	eval 'sub MD4File () { &_libmd_MD4File;}' unless defined(&MD4File);
    }
    unless(defined(&MD4FileChunk)) {
	eval 'sub MD4FileChunk () { &_libmd_MD4FileChunk;}' unless defined(&MD4FileChunk);
    }
    unless(defined(&MD4Data)) {
	eval 'sub MD4Data () { &_libmd_MD4Data;}' unless defined(&MD4Data);
    }
}
1;

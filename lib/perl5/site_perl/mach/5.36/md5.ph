require '_h2ph_pre.ph';

no warnings qw(redefine misc);

unless(defined(&_MD5_H_)) {
    eval 'sub _MD5_H_ () {1;}' unless defined(&_MD5_H_);
    unless(defined(&_KERNEL)) {
	unless(defined(&MD5Init)) {
	    eval 'sub MD5Init () { &_libmd_MD5Init;}' unless defined(&MD5Init);
	}
	unless(defined(&MD5Update)) {
	    eval 'sub MD5Update () { &_libmd_MD5Update;}' unless defined(&MD5Update);
	}
	unless(defined(&MD5Pad)) {
	    eval 'sub MD5Pad () { &_libmd_MD5Pad;}' unless defined(&MD5Pad);
	}
	unless(defined(&MD5Final)) {
	    eval 'sub MD5Final () { &_libmd_MD5Final;}' unless defined(&MD5Final);
	}
	unless(defined(&MD5Transform)) {
	    eval 'sub MD5Transform () { &_libmd_MD5Transform;}' unless defined(&MD5Transform);
	}
	unless(defined(&MD5End)) {
	    eval 'sub MD5End () { &_libmd_MD5End;}' unless defined(&MD5End);
	}
	unless(defined(&MD5Fd)) {
	    eval 'sub MD5Fd () { &_libmd_MD5Fd;}' unless defined(&MD5Fd);
	}
	unless(defined(&MD5FdChunk)) {
	    eval 'sub MD5FdChunk () { &_libmd_MD5FdChunk;}' unless defined(&MD5FdChunk);
	}
	unless(defined(&MD5File)) {
	    eval 'sub MD5File () { &_libmd_MD5File;}' unless defined(&MD5File);
	}
	unless(defined(&MD5FileChunk)) {
	    eval 'sub MD5FileChunk () { &_libmd_MD5FileChunk;}' unless defined(&MD5FileChunk);
	}
	unless(defined(&MD5Data)) {
	    eval 'sub MD5Data () { &_libmd_MD5Data;}' unless defined(&MD5Data);
	}
    }
    require 'sys/md5.ph';
}
1;

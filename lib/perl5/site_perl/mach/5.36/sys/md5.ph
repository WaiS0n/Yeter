require '_h2ph_pre.ph';

no warnings qw(redefine misc);

unless(defined(&_SYS_MD5_H_)) {
    eval 'sub _SYS_MD5_H_ () {1;}' unless defined(&_SYS_MD5_H_);
    eval 'sub MD5_BLOCK_LENGTH () {64;}' unless defined(&MD5_BLOCK_LENGTH);
    eval 'sub MD5_DIGEST_LENGTH () {16;}' unless defined(&MD5_DIGEST_LENGTH);
    eval 'sub MD5_DIGEST_STRING_LENGTH () {( &MD5_DIGEST_LENGTH * 2+ 1);}' unless defined(&MD5_DIGEST_STRING_LENGTH);
    require 'sys/cdefs.ph';
    unless(defined(&_KERNEL)) {
    }
}
1;

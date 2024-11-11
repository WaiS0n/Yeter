require '_h2ph_pre.ph';

no warnings qw(redefine misc);

unless(defined(&_SKEIN_FREEBSD_H_)) {
    eval 'sub _SKEIN_FREEBSD_H_ () {1;}' unless defined(&_SKEIN_FREEBSD_H_);
    eval 'sub SKEIN_256_BLOCK_BYTES () {( 8* &SKEIN_256_STATE_WORDS);}' unless defined(&SKEIN_256_BLOCK_BYTES);
    eval 'sub SKEIN_512_BLOCK_BYTES () {( 8* &SKEIN_512_STATE_WORDS);}' unless defined(&SKEIN_512_BLOCK_BYTES);
    eval 'sub SKEIN1024_BLOCK_BYTES () {( 8* &SKEIN1024_STATE_WORDS);}' unless defined(&SKEIN1024_BLOCK_BYTES);
    eval 'sub SKEIN256_BLOCK_LENGTH () { &SKEIN_256_BLOCK_BYTES;}' unless defined(&SKEIN256_BLOCK_LENGTH);
    eval 'sub SKEIN256_DIGEST_LENGTH () {32;}' unless defined(&SKEIN256_DIGEST_LENGTH);
    eval 'sub SKEIN256_DIGEST_STRING_LENGTH () {( &SKEIN256_DIGEST_LENGTH * 2+ 1);}' unless defined(&SKEIN256_DIGEST_STRING_LENGTH);
    eval 'sub SKEIN512_BLOCK_LENGTH () { &SKEIN_512_BLOCK_BYTES;}' unless defined(&SKEIN512_BLOCK_LENGTH);
    eval 'sub SKEIN512_DIGEST_LENGTH () {64;}' unless defined(&SKEIN512_DIGEST_LENGTH);
    eval 'sub SKEIN512_DIGEST_STRING_LENGTH () {( &SKEIN512_DIGEST_LENGTH * 2+ 1);}' unless defined(&SKEIN512_DIGEST_STRING_LENGTH);
    eval 'sub SKEIN1024_BLOCK_LENGTH () { &SKEIN1024_BLOCK_BYTES;}' unless defined(&SKEIN1024_BLOCK_LENGTH);
    eval 'sub SKEIN1024_DIGEST_LENGTH () {128;}' unless defined(&SKEIN1024_DIGEST_LENGTH);
    eval 'sub SKEIN1024_DIGEST_STRING_LENGTH () {( &SKEIN1024_DIGEST_LENGTH * 2+ 1);}' unless defined(&SKEIN1024_DIGEST_STRING_LENGTH);
    unless(defined(&_KERNEL)) {
    }
}
1;

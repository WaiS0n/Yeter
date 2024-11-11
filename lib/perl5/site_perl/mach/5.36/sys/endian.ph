require '_h2ph_pre.ph';

no warnings qw(redefine misc);

unless(defined(&_SYS_ENDIAN_H_)) {
    eval 'sub _SYS_ENDIAN_H_ () {1;}' unless defined(&_SYS_ENDIAN_H_);
    require 'sys/cdefs.ph';
    require 'sys/_types.ph';
    require 'machine/endian.ph';
    unless(defined(&_UINT8_T_DECLARED)) {
	eval 'sub _UINT8_T_DECLARED () {1;}' unless defined(&_UINT8_T_DECLARED);
    }
    unless(defined(&_UINT16_T_DECLARED)) {
	eval 'sub _UINT16_T_DECLARED () {1;}' unless defined(&_UINT16_T_DECLARED);
    }
    unless(defined(&_UINT32_T_DECLARED)) {
	eval 'sub _UINT32_T_DECLARED () {1;}' unless defined(&_UINT32_T_DECLARED);
    }
    unless(defined(&_UINT64_T_DECLARED)) {
	eval 'sub _UINT64_T_DECLARED () {1;}' unless defined(&_UINT64_T_DECLARED);
    }
    eval 'sub bswap16 {
        my($x) = @_;
	    eval q( &__bswap16($x));
    }' unless defined(&bswap16);
    eval 'sub bswap32 {
        my($x) = @_;
	    eval q( &__bswap32($x));
    }' unless defined(&bswap32);
    eval 'sub bswap64 {
        my($x) = @_;
	    eval q( &__bswap64($x));
    }' unless defined(&bswap64);
    eval 'sub be32dec {
        my($pp) = @_;
	    eval q({  &uint8_t  &const * &p = ( &uint8_t  &const *)$pp; (( $p[0] << 24) | ( $p[1] << 16) | ( $p[2] << 8) |  $p[3]); });
    }' unless defined(&be32dec);
    eval 'sub be64dec {
        my($pp) = @_;
	    eval q({  &uint8_t  &const * &p = ( &uint8_t  &const *)$pp; ((( &uint64_t) &be32dec( &p) << 32) |  &be32dec( &p + 4)); });
    }' unless defined(&be64dec);
    eval 'sub le16dec {
        my($pp) = @_;
	    eval q({  &uint8_t  &const * &p = ( &uint8_t  &const *)$pp; (( $p[1] << 8) |  $p[0]); });
    }' unless defined(&le16dec);
    eval 'sub le32dec {
        my($pp) = @_;
	    eval q({  &uint8_t  &const * &p = ( &uint8_t  &const *)$pp; (( $p[3] << 24) | ( $p[2] << 16) | ( $p[1] << 8) |  $p[0]); });
    }' unless defined(&le32dec);
    eval 'sub le64dec {
        my($pp) = @_;
	    eval q({  &uint8_t  &const * &p = ( &uint8_t  &const *)$pp; ((( &uint64_t) &le32dec( &p + 4) << 32) |  &le32dec( &p)); });
    }' unless defined(&le64dec);
    eval 'sub be16enc {
        my($pp,$u) = @_;
	    eval q({  &uint8_t * &p = ( &uint8_t *)$pp;  $p[0] = ($u >> 8) & 0xff;  $p[1] = $u & 0xff; });
    }' unless defined(&be16enc);
    eval 'sub be32enc {
        my($pp,$u) = @_;
	    eval q({  &uint8_t * &p = ( &uint8_t *)$pp;  $p[0] = ($u >> 24) & 0xff;  $p[1] = ($u >> 16) & 0xff;  $p[2] = ($u >> 8) & 0xff;  $p[3] = $u & 0xff; });
    }' unless defined(&be32enc);
    eval 'sub be64enc {
        my($pp,$u) = @_;
	    eval q({  &uint8_t * &p = ( &uint8_t *)$pp;  &be32enc( &p, ( &uint32_t)($u >> 32));  &be32enc( &p + 4, ( &uint32_t)($u & 0xffffffff)); });
    }' unless defined(&be64enc);
    eval 'sub le16enc {
        my($pp,$u) = @_;
	    eval q({  &uint8_t * &p = ( &uint8_t *)$pp;  $p[0] = $u & 0xff;  $p[1] = ($u >> 8) & 0xff; });
    }' unless defined(&le16enc);
    eval 'sub le32enc {
        my($pp,$u) = @_;
	    eval q({  &uint8_t * &p = ( &uint8_t *)$pp;  $p[0] = $u & 0xff;  $p[1] = ($u >> 8) & 0xff;  $p[2] = ($u >> 16) & 0xff;  $p[3] = ($u >> 24) & 0xff; });
    }' unless defined(&le32enc);
    eval 'sub le64enc {
        my($pp,$u) = @_;
	    eval q({  &uint8_t * &p = ( &uint8_t *)$pp;  &le32enc( &p, ( &uint32_t)($u & 0xffffffff));  &le32enc( &p + 4, ( &uint32_t)($u >> 32)); });
    }' unless defined(&le64enc);
}
1;

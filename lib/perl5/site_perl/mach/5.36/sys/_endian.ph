require '_h2ph_pre.ph';

no warnings qw(redefine misc);

unless(defined(&_SYS__ENDIAN_H_)) {
    eval 'sub _SYS__ENDIAN_H_ () {1;}' unless defined(&_SYS__ENDIAN_H_);
    if(!defined(&_MACHINE_ENDIAN_H_)  && !defined(&_BYTESWAP_H_)  && !defined(&_ENDIAN_H_)) {
	die("sys/_endian.h should not be included directly");
    }
    require 'sys/cdefs.ph';
    eval 'sub _BYTE_ORDER () { &__BYTE_ORDER__;}' unless defined(&_BYTE_ORDER);
    undef(&_LITTLE_ENDIAN) if defined(&_LITTLE_ENDIAN);
    eval 'sub _LITTLE_ENDIAN () { &__ORDER_LITTLE_ENDIAN__;}' unless defined(&_LITTLE_ENDIAN);
    undef(&_BIG_ENDIAN) if defined(&_BIG_ENDIAN);
    eval 'sub _BIG_ENDIAN () { &__ORDER_BIG_ENDIAN__;}' unless defined(&_BIG_ENDIAN);
    eval 'sub _PDP_ENDIAN () { &__ORDER_PDP_ENDIAN__;}' unless defined(&_PDP_ENDIAN);
    if((defined(&_BYTE_ORDER) ? &_BYTE_ORDER : undef) == (defined(&_LITTLE_ENDIAN) ? &_LITTLE_ENDIAN : undef)) {
	eval 'sub _QUAD_HIGHWORD () {1;}' unless defined(&_QUAD_HIGHWORD);
	eval 'sub _QUAD_LOWWORD () {0;}' unless defined(&_QUAD_LOWWORD);
    }
 elsif((defined(&_BYTE_ORDER) ? &_BYTE_ORDER : undef) == (defined(&_BIG_ENDIAN) ? &_BIG_ENDIAN : undef)) {
	eval 'sub _QUAD_HIGHWORD () {0;}' unless defined(&_QUAD_HIGHWORD);
	eval 'sub _QUAD_LOWWORD () {1;}' unless defined(&_QUAD_LOWWORD);
    } else {
	die("Unsupported endian");
    }
    if((defined(&__BSD_VISIBLE) ? &__BSD_VISIBLE : undef) || (defined(&_POSIX_C_SOURCE) ? &_POSIX_C_SOURCE : undef) > 200809) {
	eval 'sub LITTLE_ENDIAN () { &_LITTLE_ENDIAN;}' unless defined(&LITTLE_ENDIAN);
	eval 'sub BIG_ENDIAN () { &_BIG_ENDIAN;}' unless defined(&BIG_ENDIAN);
	eval 'sub PDP_ENDIAN () { &_PDP_ENDIAN;}' unless defined(&PDP_ENDIAN);
	eval 'sub BYTE_ORDER () { &_BYTE_ORDER;}' unless defined(&BYTE_ORDER);
    }
    eval 'sub __bswap16 {
        my($x) = @_;
	    eval q( &__builtin_bswap16($x));
    }' unless defined(&__bswap16);
    eval 'sub __bswap32 {
        my($x) = @_;
	    eval q( &__builtin_bswap32($x));
    }' unless defined(&__bswap32);
    eval 'sub __bswap64 {
        my($x) = @_;
	    eval q( &__builtin_bswap64($x));
    }' unless defined(&__bswap64);
    if((defined(&_BYTE_ORDER) ? &_BYTE_ORDER : undef) == (defined(&_LITTLE_ENDIAN) ? &_LITTLE_ENDIAN : undef)) {
	eval 'sub __ntohl {
	    my($x) = @_;
    	    eval q(( &__bswap32($x)));
	}' unless defined(&__ntohl);
	eval 'sub __ntohs {
	    my($x) = @_;
    	    eval q(( &__bswap16($x)));
	}' unless defined(&__ntohs);
	eval 'sub __htonl {
	    my($x) = @_;
    	    eval q(( &__bswap32($x)));
	}' unless defined(&__htonl);
	eval 'sub __htons {
	    my($x) = @_;
    	    eval q(( &__bswap16($x)));
	}' unless defined(&__htons);
    }
 elsif((defined(&_BYTE_ORDER) ? &_BYTE_ORDER : undef) == (defined(&_BIG_ENDIAN) ? &_BIG_ENDIAN : undef)) {
	eval 'sub __htonl {
	    my($x) = @_;
    	    eval q((( &__uint32_t)($x)));
	}' unless defined(&__htonl);
	eval 'sub __htons {
	    my($x) = @_;
    	    eval q((( &__uint16_t)($x)));
	}' unless defined(&__htons);
	eval 'sub __ntohl {
	    my($x) = @_;
    	    eval q((( &__uint32_t)($x)));
	}' unless defined(&__ntohl);
	eval 'sub __ntohs {
	    my($x) = @_;
    	    eval q((( &__uint16_t)($x)));
	}' unless defined(&__ntohs);
    }
    if((defined(&_BYTE_ORDER) ? &_BYTE_ORDER : undef) == (defined(&_LITTLE_ENDIAN) ? &_LITTLE_ENDIAN : undef)) {
	eval 'sub htobe16 {
	    my($x) = @_;
    	    eval q( &__bswap16(($x)));
	}' unless defined(&htobe16);
	eval 'sub htobe32 {
	    my($x) = @_;
    	    eval q( &__bswap32(($x)));
	}' unless defined(&htobe32);
	eval 'sub htobe64 {
	    my($x) = @_;
    	    eval q( &__bswap64(($x)));
	}' unless defined(&htobe64);
	eval 'sub htole16 {
	    my($x) = @_;
    	    eval q((( &uint16_t)($x)));
	}' unless defined(&htole16);
	eval 'sub htole32 {
	    my($x) = @_;
    	    eval q((( &uint32_t)($x)));
	}' unless defined(&htole32);
	eval 'sub htole64 {
	    my($x) = @_;
    	    eval q((( &uint64_t)($x)));
	}' unless defined(&htole64);
	eval 'sub be16toh {
	    my($x) = @_;
    	    eval q( &__bswap16(($x)));
	}' unless defined(&be16toh);
	eval 'sub be32toh {
	    my($x) = @_;
    	    eval q( &__bswap32(($x)));
	}' unless defined(&be32toh);
	eval 'sub be64toh {
	    my($x) = @_;
    	    eval q( &__bswap64(($x)));
	}' unless defined(&be64toh);
	eval 'sub le16toh {
	    my($x) = @_;
    	    eval q((( &uint16_t)($x)));
	}' unless defined(&le16toh);
	eval 'sub le32toh {
	    my($x) = @_;
    	    eval q((( &uint32_t)($x)));
	}' unless defined(&le32toh);
	eval 'sub le64toh {
	    my($x) = @_;
    	    eval q((( &uint64_t)($x)));
	}' unless defined(&le64toh);
    } else {
	eval 'sub htobe16 {
	    my($x) = @_;
    	    eval q((( &uint16_t)($x)));
	}' unless defined(&htobe16);
	eval 'sub htobe32 {
	    my($x) = @_;
    	    eval q((( &uint32_t)($x)));
	}' unless defined(&htobe32);
	eval 'sub htobe64 {
	    my($x) = @_;
    	    eval q((( &uint64_t)($x)));
	}' unless defined(&htobe64);
	eval 'sub htole16 {
	    my($x) = @_;
    	    eval q( &__bswap16(($x)));
	}' unless defined(&htole16);
	eval 'sub htole32 {
	    my($x) = @_;
    	    eval q( &__bswap32(($x)));
	}' unless defined(&htole32);
	eval 'sub htole64 {
	    my($x) = @_;
    	    eval q( &__bswap64(($x)));
	}' unless defined(&htole64);
	eval 'sub be16toh {
	    my($x) = @_;
    	    eval q((( &uint16_t)($x)));
	}' unless defined(&be16toh);
	eval 'sub be32toh {
	    my($x) = @_;
    	    eval q((( &uint32_t)($x)));
	}' unless defined(&be32toh);
	eval 'sub be64toh {
	    my($x) = @_;
    	    eval q((( &uint64_t)($x)));
	}' unless defined(&be64toh);
	eval 'sub le16toh {
	    my($x) = @_;
    	    eval q( &__bswap16(($x)));
	}' unless defined(&le16toh);
	eval 'sub le32toh {
	    my($x) = @_;
    	    eval q( &__bswap32(($x)));
	}' unless defined(&le32toh);
	eval 'sub le64toh {
	    my($x) = @_;
    	    eval q( &__bswap64(($x)));
	}' unless defined(&le64toh);
    }
}
1;

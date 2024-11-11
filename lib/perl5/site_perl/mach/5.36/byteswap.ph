require '_h2ph_pre.ph';

no warnings qw(redefine misc);

unless(defined(&_BYTESWAP_H_)) {
    eval 'sub _BYTESWAP_H_ () {1;}' unless defined(&_BYTESWAP_H_);
    require 'sys/_endian.ph';
    eval 'sub __bswap_16 {
        my($x) = @_;
	    eval q( &__bswap16($x));
    }' unless defined(&__bswap_16);
    eval 'sub __bswap_32 {
        my($x) = @_;
	    eval q( &__bswap32($x));
    }' unless defined(&__bswap_32);
    eval 'sub __bswap_64 {
        my($x) = @_;
	    eval q( &__bswap64($x));
    }' unless defined(&__bswap_64);
    eval 'sub bswap_16 {
        my($x) = @_;
	    eval q( &__bswap16($x));
    }' unless defined(&bswap_16);
    eval 'sub bswap_32 {
        my($x) = @_;
	    eval q( &__bswap32($x));
    }' unless defined(&bswap_32);
    eval 'sub bswap_64 {
        my($x) = @_;
	    eval q( &__bswap64($x));
    }' unless defined(&bswap_64);
}
1;

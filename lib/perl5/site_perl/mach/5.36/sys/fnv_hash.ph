require '_h2ph_pre.ph';

no warnings qw(redefine misc);

unless(defined(&_SYS_FNV_HASH_H_)) {
    eval 'sub _SYS_FNV_HASH_H_ () {1;}' unless defined(&_SYS_FNV_HASH_H_);
    eval 'sub FNV1_32_INIT () {(( &Fnv32_t) 33554467);}' unless defined(&FNV1_32_INIT);
    eval 'sub FNV1_64_INIT () {(( &Fnv64_t) 0xcbf29ce484222325);}' unless defined(&FNV1_64_INIT);
    eval 'sub FNV_32_PRIME () {(( &Fnv32_t) 0x1000193);}' unless defined(&FNV_32_PRIME);
    eval 'sub FNV_64_PRIME () {(( &Fnv64_t) 0x100000001b3);}' unless defined(&FNV_64_PRIME);
    eval 'sub fnv_32_buf {
        my($buf,$len,$hval) = @_;
	    eval q({  &const  &u_int8_t * &s = ( &const  &u_int8_t *)$buf;  &while ($len-- != 0) { $hval *=  &FNV_32_PRIME; $hval ^= * &s++; } $hval; });
    }' unless defined(&fnv_32_buf);
    eval 'sub fnv_32_str {
        my($str,$hval) = @_;
	    eval q({  &const  &u_int8_t * &s = ( &const  &u_int8_t *)$str;  &Fnv32_t  &c;  &while (( &c = * &s++) != 0) { $hval *=  &FNV_32_PRIME; $hval ^=  &c; } $hval; });
    }' unless defined(&fnv_32_str);
    eval 'sub fnv_64_buf {
        my($buf,$len,$hval) = @_;
	    eval q({  &const  &u_int8_t * &s = ( &const  &u_int8_t *)$buf;  &while ($len-- != 0) { $hval *=  &FNV_64_PRIME; $hval ^= * &s++; } $hval; });
    }' unless defined(&fnv_64_buf);
    eval 'sub fnv_64_str {
        my($str,$hval) = @_;
	    eval q({  &const  &u_int8_t * &s = ( &const  &u_int8_t *)$str;  &u_register_t  &c;  &while (( &c = * &s++) != 0) { $hval *=  &FNV_64_PRIME; $hval ^=  &c; } $hval; });
    }' unless defined(&fnv_64_str);
}
1;

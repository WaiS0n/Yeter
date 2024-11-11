require '_h2ph_pre.ph';

no warnings qw(redefine misc);

unless(defined(&_SYS_GSB_CRC32_H_)) {
    eval 'sub _SYS_GSB_CRC32_H_ () {1;}' unless defined(&_SYS_GSB_CRC32_H_);
    require 'sys/types.ph';
    if(defined(&_KERNEL)) {
	eval 'sub crc32_raw {
	    my($buf,$size,$crc) = @_;
    	    eval q({  &const  &uint8_t * &p = ( &const  &uint8_t *)$buf;  &while ($size--) $crc =  $crc32_tab[($crc ^ * &p++) & 0xff] ^ ($crc >> 8); ($crc); });
	}' unless defined(&crc32_raw);
	eval 'sub crc32 {
	    my($buf,$size) = @_;
    	    eval q({  &uint32_t  &crc;  &crc =  &crc32_raw($buf, $size, ~0); ( &crc ^ ~0); });
	}' unless defined(&crc32);
    }
    if(defined(&__amd64__) || defined(&__i386__)) {
    }
    if(defined(&__aarch64__)) {
    }
    if(defined(&TESTING)) {
    }
}
1;

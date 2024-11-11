require '_h2ph_pre.ph';

no warnings qw(redefine misc);

unless(defined(&_SKEIN_PORT_H_)) {
    eval 'sub _SKEIN_PORT_H_ () {1;}' unless defined(&_SKEIN_PORT_H_);
    require 'sys/endian.ph';
    require 'sys/types.ph';
    unless(defined(&_SPL_SYS_TYPES_H_)) {
    }
    unless(defined(&RotL_64)) {
	eval 'sub RotL_64 {
	    my($x,$N) = @_;
    	    eval q(((($x) << ($N)) | (($x) >> (64-($N)))));
	}' unless defined(&RotL_64);
    }
    unless(defined(&SKEIN_NEED_SWAP)) {
	if((defined(&BYTE_ORDER) ? &BYTE_ORDER : undef) == (defined(&BIG_ENDIAN) ? &BIG_ENDIAN : undef)) {
	    eval 'sub SKEIN_NEED_SWAP () {(1);}' unless defined(&SKEIN_NEED_SWAP);
	    if(defined(&SKEIN_PORT_CODE)) {
	    }
	}
 elsif((defined(&BYTE_ORDER) ? &BYTE_ORDER : undef) == (defined(&LITTLE_ENDIAN) ? &LITTLE_ENDIAN : undef)) {
	    eval 'sub SKEIN_NEED_SWAP () {(0);}' unless defined(&SKEIN_NEED_SWAP);
	    eval 'sub Skein_Put64_LSB_First {
	        my($dst08,$src64,$bCnt) = @_;
    		eval q( &memcpy($dst08,$src64,$bCnt));
	    }' unless defined(&Skein_Put64_LSB_First);
	    eval 'sub Skein_Get64_LSB_First {
	        my($dst64,$src08,$wCnt) = @_;
    		eval q( &memcpy($dst64,$src08,8*($wCnt)));
	    }' unless defined(&Skein_Get64_LSB_First);
	} else {
	    die("Skein needs endianness setting!");
	}
    }
    unless(defined(&Skein_Swap64)) {
	if((defined(&SKEIN_NEED_SWAP) ? &SKEIN_NEED_SWAP : undef)) {
	    eval 'sub Skein_Swap64 {
	        my($w64) = @_;
    		eval q( &bswap64($w64));
	    }' unless defined(&Skein_Swap64);
	} else {
	    eval 'sub Skein_Swap64 {
	        my($w64) = @_;
    		eval q(($w64));
	    }' unless defined(&Skein_Swap64);
	}
    }
    unless(defined(&Skein_Put64_LSB_First)) {
	if(defined(&SKEIN_PORT_CODE)) {
	} else {
	}
    }
    unless(defined(&Skein_Get64_LSB_First)) {
	if(defined(&SKEIN_PORT_CODE)) {
	} else {
	}
    }
    unless(defined(&SKEIN256_Init)) {
	eval 'sub SKEIN256_Init () { &_libmd_SKEIN256_Init;}' unless defined(&SKEIN256_Init);
	eval 'sub SKEIN512_Init () { &_libmd_SKEIN512_Init;}' unless defined(&SKEIN512_Init);
	eval 'sub SKEIN1024_Init () { &_libmd_SKEIN1024_Init;}' unless defined(&SKEIN1024_Init);
    }
    unless(defined(&SKEIN256_Update)) {
	eval 'sub SKEIN256_Update () { &_libmd_SKEIN256_Update;}' unless defined(&SKEIN256_Update);
	eval 'sub SKEIN512_Update () { &_libmd_SKEIN512_Update;}' unless defined(&SKEIN512_Update);
	eval 'sub SKEIN1024_Update () { &_libmd_SKEIN1024_Update;}' unless defined(&SKEIN1024_Update);
    }
    unless(defined(&SKEIN256_Final)) {
	eval 'sub SKEIN256_Final () { &_libmd_SKEIN256_Final;}' unless defined(&SKEIN256_Final);
	eval 'sub SKEIN512_Final () { &_libmd_SKEIN512_Final;}' unless defined(&SKEIN512_Final);
	eval 'sub SKEIN1024_Final () { &_libmd_SKEIN1024_Final;}' unless defined(&SKEIN1024_Final);
    }
    unless(defined(&SKEIN256_End)) {
	eval 'sub SKEIN256_End () { &_libmd_SKEIN256_End;}' unless defined(&SKEIN256_End);
	eval 'sub SKEIN512_End () { &_libmd_SKEIN512_End;}' unless defined(&SKEIN512_End);
	eval 'sub SKEIN1024_End () { &_libmd_SKEIN1024_End;}' unless defined(&SKEIN1024_End);
    }
    unless(defined(&SKEIN256_Fd)) {
	eval 'sub SKEIN256_Fd () { &_libmd_SKEIN256_Fd;}' unless defined(&SKEIN256_Fd);
	eval 'sub SKEIN512_Fd () { &_libmd_SKEIN512_Fd;}' unless defined(&SKEIN512_Fd);
	eval 'sub SKEIN1024_Fd () { &_libmd_SKEIN1024_Fd;}' unless defined(&SKEIN1024_Fd);
    }
    unless(defined(&SKEIN256_FdChunk)) {
	eval 'sub SKEIN256_FdChunk () { &_libmd_SKEIN256_FdChunk;}' unless defined(&SKEIN256_FdChunk);
	eval 'sub SKEIN512_FdChunk () { &_libmd_SKEIN512_FdChunk;}' unless defined(&SKEIN512_FdChunk);
	eval 'sub SKEIN1024_FdChunk () { &_libmd_SKEIN1024_FdChunk;}' unless defined(&SKEIN1024_FdChunk);
    }
    unless(defined(&SKEIN256_File)) {
	eval 'sub SKEIN256_File () { &_libmd_SKEIN256_File;}' unless defined(&SKEIN256_File);
	eval 'sub SKEIN512_File () { &_libmd_SKEIN512_File;}' unless defined(&SKEIN512_File);
	eval 'sub SKEIN1024_File () { &_libmd_SKEIN1024_File;}' unless defined(&SKEIN1024_File);
    }
    unless(defined(&SKEIN256_FileChunk)) {
	eval 'sub SKEIN256_FileChunk () { &_libmd_SKEIN256_FileChunk;}' unless defined(&SKEIN256_FileChunk);
	eval 'sub SKEIN512_FileChunk () { &_libmd_SKEIN512_FileChunk;}' unless defined(&SKEIN512_FileChunk);
	eval 'sub SKEIN1024_FileChunk () { &_libmd_SKEIN1024_FileChunk;}' unless defined(&SKEIN1024_FileChunk);
    }
    unless(defined(&SKEIN256_Data)) {
	eval 'sub SKEIN256_Data () { &_libmd_SKEIN256_Data;}' unless defined(&SKEIN256_Data);
	eval 'sub SKEIN512_Data () { &_libmd_SKEIN512_Data;}' unless defined(&SKEIN512_Data);
	eval 'sub SKEIN1024_Data () { &_libmd_SKEIN1024_Data;}' unless defined(&SKEIN1024_Data);
    }
}
1;

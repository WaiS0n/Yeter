require '_h2ph_pre.ph';

no warnings qw(redefine misc);

unless(defined(&ZCONF_H)) {
    eval 'sub ZCONF_H () {1;}' unless defined(&ZCONF_H);
    if(defined(&__FreeBSD__)) {
	if(defined(&_KERNEL)) {
	    eval 'sub Z_SOLO () {1;}' unless defined(&Z_SOLO);
	}
	if(defined(&Z_SOLO)) {
	    require 'sys/types.ph';
	    eval 'sub Z_U8 () { &__uint64_t;}' unless defined(&Z_U8);
	    eval 'sub Z_U4 () { &__uint32_t;}' unless defined(&Z_U4);
	}
    }
    if(defined(&Z_PREFIX)) {
	eval 'sub Z_PREFIX_SET () {1;}' unless defined(&Z_PREFIX_SET);
	eval 'sub _dist_code () { &z__dist_code;}' unless defined(&_dist_code);
	eval 'sub _length_code () { &z__length_code;}' unless defined(&_length_code);
	eval 'sub _tr_align () { &z__tr_align;}' unless defined(&_tr_align);
	eval 'sub _tr_flush_bits () { &z__tr_flush_bits;}' unless defined(&_tr_flush_bits);
	eval 'sub _tr_flush_block () { &z__tr_flush_block;}' unless defined(&_tr_flush_block);
	eval 'sub _tr_init () { &z__tr_init;}' unless defined(&_tr_init);
	eval 'sub _tr_stored_block () { &z__tr_stored_block;}' unless defined(&_tr_stored_block);
	eval 'sub _tr_tally () { &z__tr_tally;}' unless defined(&_tr_tally);
	eval 'sub adler32 () { &z_adler32;}' unless defined(&adler32);
	eval 'sub adler32_combine () { &z_adler32_combine;}' unless defined(&adler32_combine);
	eval 'sub adler32_combine64 () { &z_adler32_combine64;}' unless defined(&adler32_combine64);
	eval 'sub adler32_z () { &z_adler32_z;}' unless defined(&adler32_z);
	if(!defined(&Z_SOLO)  && !defined(&_KERNEL)) {
	    eval 'sub compress () { &z_compress;}' unless defined(&compress);
	    eval 'sub compress2 () { &z_compress2;}' unless defined(&compress2);
	    eval 'sub compressBound () { &z_compressBound;}' unless defined(&compressBound);
	}
	eval 'sub crc32 () { &z_crc32;}' unless defined(&crc32);
	eval 'sub crc32_combine () { &z_crc32_combine;}' unless defined(&crc32_combine);
	eval 'sub crc32_combine64 () { &z_crc32_combine64;}' unless defined(&crc32_combine64);
	eval 'sub crc32_combine_gen () { &z_crc32_combine_gen;}' unless defined(&crc32_combine_gen);
	eval 'sub crc32_combine_gen64 () { &z_crc32_combine_gen64;}' unless defined(&crc32_combine_gen64);
	eval 'sub crc32_combine_op () { &z_crc32_combine_op;}' unless defined(&crc32_combine_op);
	eval 'sub crc32_z () { &z_crc32_z;}' unless defined(&crc32_z);
	eval 'sub deflate () { &z_deflate;}' unless defined(&deflate);
	eval 'sub deflateBound () { &z_deflateBound;}' unless defined(&deflateBound);
	eval 'sub deflateCopy () { &z_deflateCopy;}' unless defined(&deflateCopy);
	eval 'sub deflateEnd () { &z_deflateEnd;}' unless defined(&deflateEnd);
	eval 'sub deflateGetDictionary () { &z_deflateGetDictionary;}' unless defined(&deflateGetDictionary);
	eval 'sub deflateInit () { &z_deflateInit;}' unless defined(&deflateInit);
	eval 'sub deflateInit2 () { &z_deflateInit2;}' unless defined(&deflateInit2);
	eval 'sub deflateInit2_ () { &z_deflateInit2_;}' unless defined(&deflateInit2_);
	eval 'sub deflateInit_ () { &z_deflateInit_;}' unless defined(&deflateInit_);
	eval 'sub deflateParams () { &z_deflateParams;}' unless defined(&deflateParams);
	eval 'sub deflatePending () { &z_deflatePending;}' unless defined(&deflatePending);
	eval 'sub deflatePrime () { &z_deflatePrime;}' unless defined(&deflatePrime);
	eval 'sub deflateReset () { &z_deflateReset;}' unless defined(&deflateReset);
	eval 'sub deflateResetKeep () { &z_deflateResetKeep;}' unless defined(&deflateResetKeep);
	eval 'sub deflateSetDictionary () { &z_deflateSetDictionary;}' unless defined(&deflateSetDictionary);
	eval 'sub deflateSetHeader () { &z_deflateSetHeader;}' unless defined(&deflateSetHeader);
	eval 'sub deflateTune () { &z_deflateTune;}' unless defined(&deflateTune);
	eval 'sub deflate_copyright () { &z_deflate_copyright;}' unless defined(&deflate_copyright);
	eval 'sub get_crc_table () { &z_get_crc_table;}' unless defined(&get_crc_table);
	unless(defined(&Z_SOLO)) {
	    eval 'sub gz_error () { &z_gz_error;}' unless defined(&gz_error);
	    eval 'sub gz_intmax () { &z_gz_intmax;}' unless defined(&gz_intmax);
	    eval 'sub gz_strwinerror () { &z_gz_strwinerror;}' unless defined(&gz_strwinerror);
	    eval 'sub gzbuffer () { &z_gzbuffer;}' unless defined(&gzbuffer);
	    eval 'sub gzclearerr () { &z_gzclearerr;}' unless defined(&gzclearerr);
	    eval 'sub gzclose () { &z_gzclose;}' unless defined(&gzclose);
	    eval 'sub gzclose_r () { &z_gzclose_r;}' unless defined(&gzclose_r);
	    eval 'sub gzclose_w () { &z_gzclose_w;}' unless defined(&gzclose_w);
	    eval 'sub gzdirect () { &z_gzdirect;}' unless defined(&gzdirect);
	    eval 'sub gzdopen () { &z_gzdopen;}' unless defined(&gzdopen);
	    eval 'sub gzeof () { &z_gzeof;}' unless defined(&gzeof);
	    eval 'sub gzerror () { &z_gzerror;}' unless defined(&gzerror);
	    eval 'sub gzflush () { &z_gzflush;}' unless defined(&gzflush);
	    eval 'sub gzfread () { &z_gzfread;}' unless defined(&gzfread);
	    eval 'sub gzfwrite () { &z_gzfwrite;}' unless defined(&gzfwrite);
	    eval 'sub gzgetc () { &z_gzgetc;}' unless defined(&gzgetc);
	    eval 'sub gzgetc_ () { &z_gzgetc_;}' unless defined(&gzgetc_);
	    eval 'sub gzgets () { &z_gzgets;}' unless defined(&gzgets);
	    eval 'sub gzoffset () { &z_gzoffset;}' unless defined(&gzoffset);
	    eval 'sub gzoffset64 () { &z_gzoffset64;}' unless defined(&gzoffset64);
	    eval 'sub gzopen () { &z_gzopen;}' unless defined(&gzopen);
	    eval 'sub gzopen64 () { &z_gzopen64;}' unless defined(&gzopen64);
	    if(defined(&_WIN32)) {
		eval 'sub gzopen_w () { &z_gzopen_w;}' unless defined(&gzopen_w);
	    }
	    eval 'sub gzprintf () { &z_gzprintf;}' unless defined(&gzprintf);
	    eval 'sub gzputc () { &z_gzputc;}' unless defined(&gzputc);
	    eval 'sub gzputs () { &z_gzputs;}' unless defined(&gzputs);
	    eval 'sub gzread () { &z_gzread;}' unless defined(&gzread);
	    eval 'sub gzrewind () { &z_gzrewind;}' unless defined(&gzrewind);
	    eval 'sub gzseek () { &z_gzseek;}' unless defined(&gzseek);
	    eval 'sub gzseek64 () { &z_gzseek64;}' unless defined(&gzseek64);
	    eval 'sub gzsetparams () { &z_gzsetparams;}' unless defined(&gzsetparams);
	    eval 'sub gztell () { &z_gztell;}' unless defined(&gztell);
	    eval 'sub gztell64 () { &z_gztell64;}' unless defined(&gztell64);
	    eval 'sub gzungetc () { &z_gzungetc;}' unless defined(&gzungetc);
	    eval 'sub gzvprintf () { &z_gzvprintf;}' unless defined(&gzvprintf);
	    eval 'sub gzwrite () { &z_gzwrite;}' unless defined(&gzwrite);
	}
	eval 'sub inflate () { &z_inflate;}' unless defined(&inflate);
	eval 'sub inflateBack () { &z_inflateBack;}' unless defined(&inflateBack);
	eval 'sub inflateBackEnd () { &z_inflateBackEnd;}' unless defined(&inflateBackEnd);
	eval 'sub inflateBackInit () { &z_inflateBackInit;}' unless defined(&inflateBackInit);
	eval 'sub inflateBackInit_ () { &z_inflateBackInit_;}' unless defined(&inflateBackInit_);
	eval 'sub inflateCodesUsed () { &z_inflateCodesUsed;}' unless defined(&inflateCodesUsed);
	eval 'sub inflateCopy () { &z_inflateCopy;}' unless defined(&inflateCopy);
	eval 'sub inflateEnd () { &z_inflateEnd;}' unless defined(&inflateEnd);
	eval 'sub inflateGetDictionary () { &z_inflateGetDictionary;}' unless defined(&inflateGetDictionary);
	eval 'sub inflateGetHeader () { &z_inflateGetHeader;}' unless defined(&inflateGetHeader);
	eval 'sub inflateInit () { &z_inflateInit;}' unless defined(&inflateInit);
	eval 'sub inflateInit2 () { &z_inflateInit2;}' unless defined(&inflateInit2);
	eval 'sub inflateInit2_ () { &z_inflateInit2_;}' unless defined(&inflateInit2_);
	eval 'sub inflateInit_ () { &z_inflateInit_;}' unless defined(&inflateInit_);
	eval 'sub inflateMark () { &z_inflateMark;}' unless defined(&inflateMark);
	eval 'sub inflatePrime () { &z_inflatePrime;}' unless defined(&inflatePrime);
	eval 'sub inflateReset () { &z_inflateReset;}' unless defined(&inflateReset);
	eval 'sub inflateReset2 () { &z_inflateReset2;}' unless defined(&inflateReset2);
	eval 'sub inflateResetKeep () { &z_inflateResetKeep;}' unless defined(&inflateResetKeep);
	eval 'sub inflateSetDictionary () { &z_inflateSetDictionary;}' unless defined(&inflateSetDictionary);
	eval 'sub inflateSync () { &z_inflateSync;}' unless defined(&inflateSync);
	eval 'sub inflateSyncPoint () { &z_inflateSyncPoint;}' unless defined(&inflateSyncPoint);
	eval 'sub inflateUndermine () { &z_inflateUndermine;}' unless defined(&inflateUndermine);
	eval 'sub inflateValidate () { &z_inflateValidate;}' unless defined(&inflateValidate);
	eval 'sub inflate_copyright () { &z_inflate_copyright;}' unless defined(&inflate_copyright);
	eval 'sub inflate_fast () { &z_inflate_fast;}' unless defined(&inflate_fast);
	eval 'sub inflate_table () { &z_inflate_table;}' unless defined(&inflate_table);
	if(!defined(&Z_SOLO)  && !defined(&_KERNEL)) {
	    eval 'sub uncompress () { &z_uncompress;}' unless defined(&uncompress);
	    eval 'sub uncompress2 () { &z_uncompress2;}' unless defined(&uncompress2);
	}
	eval 'sub zError () { &z_zError;}' unless defined(&zError);
	if(!defined(&Z_SOLO)  && !defined(&_KERNEL)) {
	    eval 'sub zcalloc () { &z_zcalloc;}' unless defined(&zcalloc);
	    eval 'sub zcfree () { &z_zcfree;}' unless defined(&zcfree);
	}
	eval 'sub zlibCompileFlags () { &z_zlibCompileFlags;}' unless defined(&zlibCompileFlags);
	eval 'sub zlibVersion () { &z_zlibVersion;}' unless defined(&zlibVersion);
	eval 'sub Byte () { &z_Byte;}' unless defined(&Byte);
	eval 'sub Bytef () { &z_Bytef;}' unless defined(&Bytef);
	eval 'sub alloc_func () { &z_alloc_func;}' unless defined(&alloc_func);
	eval 'sub charf () { &z_charf;}' unless defined(&charf);
	eval 'sub free_func () { &z_free_func;}' unless defined(&free_func);
	unless(defined(&Z_SOLO)) {
	    eval 'sub gzFile () { &z_gzFile;}' unless defined(&gzFile);
	}
	eval 'sub gz_header () { &z_gz_header;}' unless defined(&gz_header);
	eval 'sub gz_headerp () { &z_gz_headerp;}' unless defined(&gz_headerp);
	eval 'sub in_func () { &z_in_func;}' unless defined(&in_func);
	eval 'sub intf () { &z_intf;}' unless defined(&intf);
	eval 'sub out_func () { &z_out_func;}' unless defined(&out_func);
	eval 'sub uInt () { &z_uInt;}' unless defined(&uInt);
	eval 'sub uIntf () { &z_uIntf;}' unless defined(&uIntf);
	eval 'sub uLong () { &z_uLong;}' unless defined(&uLong);
	eval 'sub uLongf () { &z_uLongf;}' unless defined(&uLongf);
	eval 'sub voidp () { &z_voidp;}' unless defined(&voidp);
	eval 'sub voidpc () { &z_voidpc;}' unless defined(&voidpc);
	eval 'sub voidpf () { &z_voidpf;}' unless defined(&voidpf);
	eval 'sub gz_header_s () { &z_gz_header_s;}' unless defined(&gz_header_s);
	eval 'sub internal_state () { &z_internal_state;}' unless defined(&internal_state);
    }
    if(defined(&__MSDOS__)  && !defined(&MSDOS)) {
	eval 'sub MSDOS () {1;}' unless defined(&MSDOS);
    }
    if((defined(&OS_2) || defined(&__OS2__))  && !defined(&OS2)) {
	eval 'sub OS2 () {1;}' unless defined(&OS2);
    }
    if(defined(&_WINDOWS)  && !defined(&WINDOWS)) {
	eval 'sub WINDOWS () {1;}' unless defined(&WINDOWS);
    }
    if(defined(&_WIN32) || defined(&_WIN32_WCE) || defined(&__WIN32__)) {
	unless(defined(&WIN32)) {
	    eval 'sub WIN32 () {1;}' unless defined(&WIN32);
	}
    }
    if((defined(&MSDOS) || defined(&OS2) || defined(&WINDOWS))  && !defined(&WIN32)) {
	if(!defined(&__GNUC__)  && !defined(&__FLAT__)  && !defined(&__386__)) {
	    unless(defined(&SYS16BIT)) {
		eval 'sub SYS16BIT () {1;}' unless defined(&SYS16BIT);
	    }
	}
    }
    if(defined(&SYS16BIT)) {
	eval 'sub MAXSEG_64K () {1;}' unless defined(&MAXSEG_64K);
    }
    if(defined(&MSDOS)) {
	eval 'sub UNALIGNED_OK () {1;}' unless defined(&UNALIGNED_OK);
    }
    if(defined(&__STDC_VERSION__)) {
	unless(defined(&STDC)) {
	    eval 'sub STDC () {1;}' unless defined(&STDC);
	}
	if((defined(&__STDC_VERSION__) ? &__STDC_VERSION__ : undef) >= 199901) {
	    unless(defined(&STDC99)) {
		eval 'sub STDC99 () {1;}' unless defined(&STDC99);
	    }
	}
    }
    if(!defined(&STDC)  && (defined(&__STDC__) || defined(&__cplusplus))) {
	eval 'sub STDC () {1;}' unless defined(&STDC);
    }
    if(!defined(&STDC)  && (defined(&__GNUC__) || defined(&__BORLANDC__))) {
	eval 'sub STDC () {1;}' unless defined(&STDC);
    }
    if(!defined(&STDC)  && (defined(&MSDOS) || defined(&WINDOWS) || defined(&WIN32))) {
	eval 'sub STDC () {1;}' unless defined(&STDC);
    }
    if(!defined(&STDC)  && (defined(&OS2) || defined(&__HOS_AIX__))) {
	eval 'sub STDC () {1;}' unless defined(&STDC);
    }
    if(defined(&__OS400__)  && !defined(&STDC) ) {
	eval 'sub STDC () {1;}' unless defined(&STDC);
    }
    unless(defined(&STDC)) {
	unless(defined(&const)) {
	    eval 'sub const () {1;}' unless defined(&const);
	}
    }
    if(defined(&ZLIB_CONST)  && !defined(&z_const)) {
	eval 'sub z_const () { &const;}' unless defined(&z_const);
    } else {
	eval 'sub z_const () {1;}' unless defined(&z_const);
    }
    if(defined(&Z_SOLO)) {
	if(defined(&_WIN64)) {
	} else {
	}
    } else {
	eval 'sub z_longlong () {\'long long\';}' unless defined(&z_longlong);
	if(defined(&NO_SIZE_T)) {
	}
 elsif(defined(&STDC)) {
	    require 'stddef.ph';
	} else {
	}
	undef(&z_longlong) if defined(&z_longlong);
    }
    unless(defined(&MAX_MEM_LEVEL)) {
	if(defined(&MAXSEG_64K)) {
	    eval 'sub MAX_MEM_LEVEL () {8;}' unless defined(&MAX_MEM_LEVEL);
	} else {
	    eval 'sub MAX_MEM_LEVEL () {9;}' unless defined(&MAX_MEM_LEVEL);
	}
    }
    unless(defined(&MAX_WBITS)) {
	eval 'sub MAX_WBITS () {15;}' unless defined(&MAX_WBITS);
    }
    unless(defined(&OF)) {
	if(defined(&STDC)) {
	    eval 'sub OF {
	        my($args) = @_;
    		eval q($args);
	    }' unless defined(&OF);
	} else {
	    eval 'sub OF {
	        my($args) = @_;
    		eval q(());
	    }' unless defined(&OF);
	}
    }
    if(defined(&SYS16BIT)) {
	if(defined(&M_I86SM) || defined(&M_I86MM)) {
	    eval 'sub SMALL_MEDIUM () {1;}' unless defined(&SMALL_MEDIUM);
	    if(defined(&_MSC_VER)) {
		eval 'sub FAR () { &_far;}' unless defined(&FAR);
	    } else {
		eval 'sub FAR () { &far;}' unless defined(&FAR);
	    }
	}
	if((defined(&__SMALL__) || defined(&__MEDIUM__))) {
	    eval 'sub SMALL_MEDIUM () {1;}' unless defined(&SMALL_MEDIUM);
	    if(defined(&__BORLANDC__)) {
		eval 'sub FAR () { &_far;}' unless defined(&FAR);
	    } else {
		eval 'sub FAR () { &far;}' unless defined(&FAR);
	    }
	}
    }
    if(defined(&WINDOWS) || defined(&WIN32)) {
	if(defined(&ZLIB_DLL)) {
	    if(defined(&WIN32)  && (!defined(&__BORLANDC__) || ((defined(&__BORLANDC__) ? &__BORLANDC__ : undef) >= 0x500))) {
		if(defined(&ZLIB_INTERNAL)) {
		    eval 'sub ZEXTERN () { &extern  &__declspec( &dllexport);}' unless defined(&ZEXTERN);
		} else {
		    eval 'sub ZEXTERN () { &extern  &__declspec( &dllimport);}' unless defined(&ZEXTERN);
		}
	    }
	}
	if(defined(&ZLIB_WINAPI)) {
	    if(defined(&FAR)) {
		undef(&FAR) if defined(&FAR);
	    }
	    unless(defined(&WIN32_LEAN_AND_MEAN)) {
		eval 'sub WIN32_LEAN_AND_MEAN () {1;}' unless defined(&WIN32_LEAN_AND_MEAN);
	    }
	    require 'windows.ph';
	    eval 'sub ZEXPORT () { &WINAPI;}' unless defined(&ZEXPORT);
	    if(defined(&WIN32)) {
		eval 'sub ZEXPORTVA () { &WINAPIV;}' unless defined(&ZEXPORTVA);
	    } else {
		eval 'sub ZEXPORTVA () { &FAR  &CDECL;}' unless defined(&ZEXPORTVA);
	    }
	}
    }
    if(defined (&__BEOS__)) {
	if(defined(&ZLIB_DLL)) {
	    if(defined(&ZLIB_INTERNAL)) {
		eval 'sub ZEXPORT () { &__declspec( &dllexport);}' unless defined(&ZEXPORT);
		eval 'sub ZEXPORTVA () { &__declspec( &dllexport);}' unless defined(&ZEXPORTVA);
	    } else {
		eval 'sub ZEXPORT () { &__declspec( &dllimport);}' unless defined(&ZEXPORT);
		eval 'sub ZEXPORTVA () { &__declspec( &dllimport);}' unless defined(&ZEXPORTVA);
	    }
	}
    }
    unless(defined(&ZEXTERN)) {
	eval 'sub ZEXTERN () { &extern;}' unless defined(&ZEXTERN);
    }
    unless(defined(&ZEXPORT)) {
	eval 'sub ZEXPORT () {1;}' unless defined(&ZEXPORT);
    }
    unless(defined(&ZEXPORTVA)) {
	eval 'sub ZEXPORTVA () {1;}' unless defined(&ZEXPORTVA);
    }
    unless(defined(&FAR)) {
	eval 'sub FAR () {1;}' unless defined(&FAR);
    }
    if(!defined(&__MACTYPES__)) {
    }
    if(defined(&SMALL_MEDIUM)) {
	eval 'sub Bytef () { &Byte  &FAR;}' unless defined(&Bytef);
    } else {
    }
    if(defined(&STDC)) {
    } else {
    }
    if(!defined(&Z_U4)  && !defined(&Z_SOLO)  && defined(&STDC)) {
	require 'limits.ph';
	if(((defined(&UINT_MAX) ? &UINT_MAX : undef) == 0xffffffff)) {
	    eval 'sub Z_U4 () {\'unsigned\';}' unless defined(&Z_U4);
	}
 elsif(((defined(&ULONG_MAX) ? &ULONG_MAX : undef) == 0xffffffff)) {
	    eval 'sub Z_U4 () {\'unsigned long\';}' unless defined(&Z_U4);
	}
 elsif(((defined(&USHRT_MAX) ? &USHRT_MAX : undef) == 0xffffffff)) {
	    eval 'sub Z_U4 () {\'unsigned short\';}' unless defined(&Z_U4);
	}
    }
    if(defined(&Z_U4)) {
    } else {
    }
    if(0) {
	eval 'sub Z_HAVE_UNISTD_H () {1;}' unless defined(&Z_HAVE_UNISTD_H);
    }
    if(defined(&HAVE_STDARG_H)) {
	eval 'sub Z_HAVE_STDARG_H () {1;}' unless defined(&Z_HAVE_STDARG_H);
    }
    if(defined(&STDC)) {
	unless(defined(&Z_SOLO)) {
	    require 'sys/types.ph';
	}
    }
    if(defined(&STDC) || defined(&Z_HAVE_STDARG_H)) {
	unless(defined(&Z_SOLO)) {
	    require 'stdarg.ph';
	}
    }
    if(defined(&_WIN32)) {
	unless(defined(&Z_SOLO)) {
	    require 'stddef.ph';
	}
    }
    if(defined(&_LARGEFILE64_SOURCE)  && -(defined(&_LARGEFILE64_SOURCE) ? &_LARGEFILE64_SOURCE : undef) - -1== 1) {
	undef(&_LARGEFILE64_SOURCE) if defined(&_LARGEFILE64_SOURCE);
    }
    unless(defined(&Z_HAVE_UNISTD_H)) {
	if(defined(&__WATCOMC__)) {
	    eval 'sub Z_HAVE_UNISTD_H () {1;}' unless defined(&Z_HAVE_UNISTD_H);
	}
    }
    unless(defined(&Z_HAVE_UNISTD_H)) {
	if(defined(&_LARGEFILE64_SOURCE)  && !defined(&_WIN32)) {
	    eval 'sub Z_HAVE_UNISTD_H () {1;}' unless defined(&Z_HAVE_UNISTD_H);
	}
    }
    unless(defined(&Z_SOLO)) {
	if(defined(&Z_HAVE_UNISTD_H)) {
	    require 'unistd.ph';
	    if(defined(&VMS)) {
		require 'unixio.ph';
	    }
	    unless(defined(&z_off_t)) {
		eval 'sub z_off_t () { &off_t;}' unless defined(&z_off_t);
	    }
	}
    }
    if(defined(&_LFS64_LARGEFILE)  && (defined(&_LFS64_LARGEFILE) ? &_LFS64_LARGEFILE : undef)-0) {
	eval 'sub Z_LFS64 () {1;}' unless defined(&Z_LFS64);
    }
    if(defined(&_LARGEFILE64_SOURCE)  && defined(&Z_LFS64)) {
	eval 'sub Z_LARGE64 () {1;}' unless defined(&Z_LARGE64);
    }
    if(defined(&_FILE_OFFSET_BITS)  && (defined(&_FILE_OFFSET_BITS) ? &_FILE_OFFSET_BITS : undef)-0== 64 && defined(&Z_LFS64)) {
	eval 'sub Z_WANT64 () {1;}' unless defined(&Z_WANT64);
    }
    if(!defined(&SEEK_SET)  && !defined(&Z_SOLO)) {
	eval 'sub SEEK_SET () {0;}' unless defined(&SEEK_SET);
	eval 'sub SEEK_CUR () {1;}' unless defined(&SEEK_CUR);
	eval 'sub SEEK_END () {2;}' unless defined(&SEEK_END);
    }
    if(defined(&Z_SOLO)) {
	require 'sys/types.ph';
    }
    eval 'sub z_off_t () { &off_t;}' unless defined(&z_off_t);
    unless(defined(&_FILE_OFFSET_BITS)) {
	eval 'sub _FILE_OFFSET_BITS () {64;}' unless defined(&_FILE_OFFSET_BITS);
    }
    unless(defined(&z_off_t)) {
	eval 'sub z_off_t () {\'long\';}' unless defined(&z_off_t);
    }
    if(!defined(&_WIN32)  && defined(&Z_LARGE64)) {
	eval 'sub z_off64_t () { &off64_t;}' unless defined(&z_off64_t);
    } else {
	if(defined(&_WIN32)  && !defined(&__GNUC__)) {
	    eval 'sub z_off64_t () { &__int64;}' unless defined(&z_off64_t);
	} else {
	    eval 'sub z_off64_t () { &z_off_t;}' unless defined(&z_off64_t);
	}
    }
    if(defined(&__MVS__)) {
    }
}
1;

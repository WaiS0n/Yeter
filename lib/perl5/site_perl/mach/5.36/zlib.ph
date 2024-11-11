require '_h2ph_pre.ph';

no warnings qw(redefine misc);

unless(defined(&ZLIB_H)) {
    eval 'sub ZLIB_H () {1;}' unless defined(&ZLIB_H);
    require 'zconf.ph';
    if(defined(&__cplusplus)) {
    }
    eval 'sub ZLIB_VERSION () {"1.3.1";}' unless defined(&ZLIB_VERSION);
    eval 'sub ZLIB_VERNUM () {0x1310;}' unless defined(&ZLIB_VERNUM);
    eval 'sub ZLIB_VER_MAJOR () {1;}' unless defined(&ZLIB_VER_MAJOR);
    eval 'sub ZLIB_VER_MINOR () {3;}' unless defined(&ZLIB_VER_MINOR);
    eval 'sub ZLIB_VER_REVISION () {1;}' unless defined(&ZLIB_VER_REVISION);
    eval 'sub ZLIB_VER_SUBREVISION () {0;}' unless defined(&ZLIB_VER_SUBREVISION);
    eval 'sub Z_NO_FLUSH () {0;}' unless defined(&Z_NO_FLUSH);
    eval 'sub Z_PARTIAL_FLUSH () {1;}' unless defined(&Z_PARTIAL_FLUSH);
    eval 'sub Z_SYNC_FLUSH () {2;}' unless defined(&Z_SYNC_FLUSH);
    eval 'sub Z_FULL_FLUSH () {3;}' unless defined(&Z_FULL_FLUSH);
    eval 'sub Z_FINISH () {4;}' unless defined(&Z_FINISH);
    eval 'sub Z_BLOCK () {5;}' unless defined(&Z_BLOCK);
    eval 'sub Z_TREES () {6;}' unless defined(&Z_TREES);
    eval 'sub Z_OK () {0;}' unless defined(&Z_OK);
    eval 'sub Z_STREAM_END () {1;}' unless defined(&Z_STREAM_END);
    eval 'sub Z_NEED_DICT () {2;}' unless defined(&Z_NEED_DICT);
    eval 'sub Z_ERRNO () {(-1);}' unless defined(&Z_ERRNO);
    eval 'sub Z_STREAM_ERROR () {(-2);}' unless defined(&Z_STREAM_ERROR);
    eval 'sub Z_DATA_ERROR () {(-3);}' unless defined(&Z_DATA_ERROR);
    eval 'sub Z_MEM_ERROR () {(-4);}' unless defined(&Z_MEM_ERROR);
    eval 'sub Z_BUF_ERROR () {(-5);}' unless defined(&Z_BUF_ERROR);
    eval 'sub Z_VERSION_ERROR () {(-6);}' unless defined(&Z_VERSION_ERROR);
    eval 'sub Z_NO_COMPRESSION () {0;}' unless defined(&Z_NO_COMPRESSION);
    eval 'sub Z_BEST_SPEED () {1;}' unless defined(&Z_BEST_SPEED);
    eval 'sub Z_BEST_COMPRESSION () {9;}' unless defined(&Z_BEST_COMPRESSION);
    eval 'sub Z_DEFAULT_COMPRESSION () {(-1);}' unless defined(&Z_DEFAULT_COMPRESSION);
    eval 'sub Z_FILTERED () {1;}' unless defined(&Z_FILTERED);
    eval 'sub Z_HUFFMAN_ONLY () {2;}' unless defined(&Z_HUFFMAN_ONLY);
    eval 'sub Z_RLE () {3;}' unless defined(&Z_RLE);
    eval 'sub Z_FIXED () {4;}' unless defined(&Z_FIXED);
    eval 'sub Z_DEFAULT_STRATEGY () {0;}' unless defined(&Z_DEFAULT_STRATEGY);
    eval 'sub Z_BINARY () {0;}' unless defined(&Z_BINARY);
    eval 'sub Z_TEXT () {1;}' unless defined(&Z_TEXT);
    eval 'sub Z_ASCII () { &Z_TEXT;}' unless defined(&Z_ASCII);
    eval 'sub Z_UNKNOWN () {2;}' unless defined(&Z_UNKNOWN);
    eval 'sub Z_DEFLATED () {8;}' unless defined(&Z_DEFLATED);
    eval 'sub Z_NULL () {0;}' unless defined(&Z_NULL);
    eval 'sub zlib_version () { &zlibVersion();}' unless defined(&zlib_version);
    if(!defined(&Z_SOLO) || defined(&_KERNEL)) {
    }
    unless(defined(&Z_SOLO)) {
    }
    if(defined(&Z_PREFIX_SET)) {
	eval 'sub z_deflateInit {
	    my($strm, $level) = @_;
    	    eval q( &deflateInit_(, ,  &ZLIB_VERSION, $sizeof{ &z_stream}));
	}' unless defined(&z_deflateInit);
	eval 'sub z_inflateInit {
	    my($strm) = @_;
    	    eval q( &inflateInit_(,  &ZLIB_VERSION, $sizeof{ &z_stream}));
	}' unless defined(&z_inflateInit);
	eval 'sub z_deflateInit2 {
	    my($strm, $level, $method, $windowBits, $memLevel, $strategy) = @_;
    	    eval q( &deflateInit2_(,,,,, ,  &ZLIB_VERSION, $sizeof{ &z_stream}));
	}' unless defined(&z_deflateInit2);
	eval 'sub z_inflateInit2 {
	    my($strm, $windowBits) = @_;
    	    eval q( &inflateInit2_(, ,  &ZLIB_VERSION, $sizeof{ &z_stream}));
	}' unless defined(&z_inflateInit2);
	eval 'sub z_inflateBackInit {
	    my($strm, $windowBits, $window) = @_;
    	    eval q( &inflateBackInit_(, , ,  &ZLIB_VERSION, $sizeof{ &z_stream}));
	}' unless defined(&z_inflateBackInit);
    } else {
	eval 'sub deflateInit {
	    my($strm, $level) = @_;
    	    eval q( &deflateInit_(, ,  &ZLIB_VERSION, $sizeof{ &z_stream}));
	}' unless defined(&deflateInit);
	eval 'sub inflateInit {
	    my($strm) = @_;
    	    eval q( &inflateInit_(,  &ZLIB_VERSION, $sizeof{ &z_stream}));
	}' unless defined(&inflateInit);
	eval 'sub deflateInit2 {
	    my($strm, $level, $method, $windowBits, $memLevel, $strategy) = @_;
    	    eval q( &deflateInit2_(,,,,, ,  &ZLIB_VERSION, $sizeof{ &z_stream}));
	}' unless defined(&deflateInit2);
	eval 'sub inflateInit2 {
	    my($strm, $windowBits) = @_;
    	    eval q( &inflateInit2_(, ,  &ZLIB_VERSION, $sizeof{ &z_stream}));
	}' unless defined(&inflateInit2);
	eval 'sub inflateBackInit {
	    my($strm, $windowBits, $window) = @_;
    	    eval q( &inflateBackInit_(, , ,  &ZLIB_VERSION, $sizeof{ &z_stream}));
	}' unless defined(&inflateBackInit);
    }
    unless(defined(&Z_SOLO)) {
	if(defined(&Z_PREFIX_SET)) {
	    undef(&z_gzgetc) if defined(&z_gzgetc);
	    eval 'sub z_gzgetc {
	        my($g) = @_;
    		eval q((($g)-> &have ? (($g)-> &have--, ($g)-> &pos++, *(($g)-> &next)++) : ( &gzgetc)($g)));
	    }' unless defined(&z_gzgetc);
	} else {
	    eval 'sub gzgetc {
	        my($g) = @_;
    		eval q((($g)-> &have ? (($g)-> &have--, ($g)-> &pos++, *(($g)-> &next)++) : ( &gzgetc)($g)));
	    }' unless defined(&gzgetc);
	}
	if(defined(&Z_LARGE64)) {
	}
	if(!defined(&ZLIB_INTERNAL)  && defined(&Z_WANT64)) {
	    if(defined(&Z_PREFIX_SET)) {
		eval 'sub z_gzopen () { &z_gzopen64;}' unless defined(&z_gzopen);
		eval 'sub z_gzseek () { &z_gzseek64;}' unless defined(&z_gzseek);
		eval 'sub z_gztell () { &z_gztell64;}' unless defined(&z_gztell);
		eval 'sub z_gzoffset () { &z_gzoffset64;}' unless defined(&z_gzoffset);
		eval 'sub z_adler32_combine () { &z_adler32_combine64;}' unless defined(&z_adler32_combine);
		eval 'sub z_crc32_combine () { &z_crc32_combine64;}' unless defined(&z_crc32_combine);
		eval 'sub z_crc32_combine_gen () { &z_crc32_combine_gen64;}' unless defined(&z_crc32_combine_gen);
	    } else {
		eval 'sub gzopen () { &gzopen64;}' unless defined(&gzopen);
		eval 'sub gzseek () { &gzseek64;}' unless defined(&gzseek);
		eval 'sub gztell () { &gztell64;}' unless defined(&gztell);
		eval 'sub gzoffset () { &gzoffset64;}' unless defined(&gzoffset);
		eval 'sub adler32_combine () { &adler32_combine64;}' unless defined(&adler32_combine);
		eval 'sub crc32_combine () { &crc32_combine64;}' unless defined(&crc32_combine);
		eval 'sub crc32_combine_gen () { &crc32_combine_gen64;}' unless defined(&crc32_combine_gen);
	    }
	    unless(defined(&Z_LARGE64)) {
	    }
	} else {
	}
    } else {
    }
    if(defined(&_WIN32)  && !defined(&Z_SOLO)) {
    }
    if(defined(&STDC) || defined(&Z_HAVE_STDARG_H)) {
	unless(defined(&Z_SOLO)) {
	}
    }
    if(defined(&__cplusplus)) {
    }
}
1;

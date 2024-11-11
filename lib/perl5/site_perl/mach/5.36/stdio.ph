require '_h2ph_pre.ph';

no warnings qw(redefine misc);

unless(defined(&_STDIO_H_)) {
    eval 'sub _STDIO_H_ () {1;}' unless defined(&_STDIO_H_);
    require 'sys/cdefs.ph';
    require 'sys/_null.ph';
    require 'sys/_types.ph';
    unless(defined(&_SIZE_T_DECLARED)) {
	eval 'sub _SIZE_T_DECLARED () {1;}' unless defined(&_SIZE_T_DECLARED);
    }
    unless(defined(&_RSIZE_T_DEFINED)) {
	eval 'sub _RSIZE_T_DEFINED () {1;}' unless defined(&_RSIZE_T_DEFINED);
    }
    if((defined(&__POSIX_VISIBLE) ? &__POSIX_VISIBLE : undef) >= 200809) {
	unless(defined(&_OFF_T_DECLARED)) {
	    eval 'sub _OFF_T_DECLARED () {1;}' unless defined(&_OFF_T_DECLARED);
	}
	unless(defined(&_SSIZE_T_DECLARED)) {
	    eval 'sub _SSIZE_T_DECLARED () {1;}' unless defined(&_SSIZE_T_DECLARED);
	}
    }
    unless(defined(&_OFF64_T_DECLARED)) {
	eval 'sub _OFF64_T_DECLARED () {1;}' unless defined(&_OFF64_T_DECLARED);
    }
    if((defined(&__POSIX_VISIBLE) ? &__POSIX_VISIBLE : undef) >= 200112|| (defined(&__XSI_VISIBLE) ? &__XSI_VISIBLE : undef)) {
	unless(defined(&_VA_LIST_DECLARED)) {
	    eval 'sub _VA_LIST_DECLARED () {1;}' unless defined(&_VA_LIST_DECLARED);
	}
    }
    eval 'sub _FSTDIO () {1;}' unless defined(&_FSTDIO);
    unless(defined(&_STDFILE_DECLARED)) {
	eval 'sub _STDFILE_DECLARED () {1;}' unless defined(&_STDFILE_DECLARED);
    }
    unless(defined(&_STDSTREAM_DECLARED)) {
	eval 'sub _STDSTREAM_DECLARED () {1;}' unless defined(&_STDSTREAM_DECLARED);
    }
    eval 'sub __SLBF () {0x1;}' unless defined(&__SLBF);
    eval 'sub __SNBF () {0x2;}' unless defined(&__SNBF);
    eval 'sub __SRD () {0x4;}' unless defined(&__SRD);
    eval 'sub __SWR () {0x8;}' unless defined(&__SWR);
    eval 'sub __SRW () {0x10;}' unless defined(&__SRW);
    eval 'sub __SEOF () {0x20;}' unless defined(&__SEOF);
    eval 'sub __SERR () {0x40;}' unless defined(&__SERR);
    eval 'sub __SMBF () {0x80;}' unless defined(&__SMBF);
    eval 'sub __SAPP () {0x100;}' unless defined(&__SAPP);
    eval 'sub __SSTR () {0x200;}' unless defined(&__SSTR);
    eval 'sub __SOPT () {0x400;}' unless defined(&__SOPT);
    eval 'sub __SNPT () {0x800;}' unless defined(&__SNPT);
    eval 'sub __SOFF () {0x1000;}' unless defined(&__SOFF);
    eval 'sub __SMOD () {0x2000;}' unless defined(&__SMOD);
    eval 'sub __SALC () {0x4000;}' unless defined(&__SALC);
    eval 'sub __SIGN () {0x8000;}' unless defined(&__SIGN);
    eval 'sub __S2OAP () {0x1;}' unless defined(&__S2OAP);
    eval 'sub _IOFBF () {0;}' unless defined(&_IOFBF);
    eval 'sub _IOLBF () {1;}' unless defined(&_IOLBF);
    eval 'sub _IONBF () {2;}' unless defined(&_IONBF);
    eval 'sub BUFSIZ () {1024;}' unless defined(&BUFSIZ);
    eval 'sub EOF () {(-1);}' unless defined(&EOF);
    unless(defined(&FOPEN_MAX)) {
	eval 'sub FOPEN_MAX () {20;}' unless defined(&FOPEN_MAX);
    }
    eval 'sub FILENAME_MAX () {1024;}' unless defined(&FILENAME_MAX);
    if((defined(&__XSI_VISIBLE) ? &__XSI_VISIBLE : undef)) {
	eval 'sub P_tmpdir () {"/tmp/";}' unless defined(&P_tmpdir);
    }
    eval 'sub L_tmpnam () {1024;}' unless defined(&L_tmpnam);
    eval 'sub TMP_MAX () {308915776;}' unless defined(&TMP_MAX);
    unless(defined(&SEEK_SET)) {
	eval 'sub SEEK_SET () {0;}' unless defined(&SEEK_SET);
    }
    unless(defined(&SEEK_CUR)) {
	eval 'sub SEEK_CUR () {1;}' unless defined(&SEEK_CUR);
    }
    unless(defined(&SEEK_END)) {
	eval 'sub SEEK_END () {2;}' unless defined(&SEEK_END);
    }
    eval 'sub stdin () { &__stdinp;}' unless defined(&stdin);
    eval 'sub stdout () { &__stdoutp;}' unless defined(&stdout);
    eval 'sub stderr () { &__stderrp;}' unless defined(&stderr);
    if(defined(&_XLOCALE_H_)) {
	require 'xlocale/_stdio.ph';
    }
    if((defined(&__EXT1_VISIBLE) ? &__EXT1_VISIBLE : undef)) {
    }
    if((defined(&__ISO_C_VISIBLE) ? &__ISO_C_VISIBLE : undef) >= 1999|| (defined(&__POSIX_VISIBLE) ? &__POSIX_VISIBLE : undef) >= 199506) {
    }
    if((defined(&__ISO_C_VISIBLE) ? &__ISO_C_VISIBLE : undef) >= 1999) {
    }
    if((defined(&__BSD_VISIBLE) ? &__BSD_VISIBLE : undef) || ((defined(&__POSIX_VISIBLE) ? &__POSIX_VISIBLE : undef)  && (defined(&__POSIX_VISIBLE) ? &__POSIX_VISIBLE : undef) <= 199506)) {
	eval 'sub L_cuserid () {17;}' unless defined(&L_cuserid);
    }
    if((defined(&__POSIX_VISIBLE) ? &__POSIX_VISIBLE : undef)) {
	eval 'sub L_ctermid () {1024;}' unless defined(&L_ctermid);
    }
    if((defined(&__POSIX_VISIBLE) ? &__POSIX_VISIBLE : undef) >= 199209) {
    }
    if((defined(&__POSIX_VISIBLE) ? &__POSIX_VISIBLE : undef) >= 199506) {
    }
    if((defined(&__BSD_VISIBLE) ? &__BSD_VISIBLE : undef)) {
    }
    if((defined(&__POSIX_VISIBLE) ? &__POSIX_VISIBLE : undef) >= 200112|| (defined(&__XSI_VISIBLE) ? &__XSI_VISIBLE : undef) >= 500) {
    }
    if((defined(&__BSD_VISIBLE) ? &__BSD_VISIBLE : undef) || (defined(&__XSI_VISIBLE) ? &__XSI_VISIBLE : undef) > 0 && (defined(&__XSI_VISIBLE) ? &__XSI_VISIBLE : undef) < 600) {
    }
    if((defined(&__XSI_VISIBLE) ? &__XSI_VISIBLE : undef)) {
    }
    if((defined(&__POSIX_VISIBLE) ? &__POSIX_VISIBLE : undef) >= 200809) {
    }
    if((defined(&__BSD_VISIBLE) ? &__BSD_VISIBLE : undef)) {
	eval 'sub fropen {
	    my($cookie, $fn) = @_;
    	    eval q( &funopen($cookie, $fn, 0, 0, 0));
	}' unless defined(&fropen);
	eval 'sub fwopen {
	    my($cookie, $fn) = @_;
    	    eval q( &funopen($cookie, 0, $fn, 0, 0));
	}' unless defined(&fwopen);
	unless(defined(&_FTRUNCATE_DECLARED)) {
	    eval 'sub _FTRUNCATE_DECLARED () {1;}' unless defined(&_FTRUNCATE_DECLARED);
	}
	unless(defined(&_LSEEK_DECLARED)) {
	    eval 'sub _LSEEK_DECLARED () {1;}' unless defined(&_LSEEK_DECLARED);
	}
	unless(defined(&_MMAP_DECLARED)) {
	    eval 'sub _MMAP_DECLARED () {1;}' unless defined(&_MMAP_DECLARED);
	}
	unless(defined(&_TRUNCATE_DECLARED)) {
	    eval 'sub _TRUNCATE_DECLARED () {1;}' unless defined(&_TRUNCATE_DECLARED);
	}
    }
    eval 'sub __sgetc {
        my($p) = @_;
	    eval q((---> &_r < 0?  &__srget : (*($p)-> &_p++)));
    }' unless defined(&__sgetc);
    if(defined(&__GNUC__)  && defined(&__STDC__)) {
	eval 'sub __sputc {
	    my($_c,$_p) = @_;
    	    eval q({  &if (-- ($_p->{_w}) >= 0|| ( ($_p->{_w}) >=  ($_p->{_lbfsize})  && $_c != ord(\'\\\\n\'))) (* ($_p->{_p})++ = $_c);  &else ( &__swbuf($_c, $_p)); });
	}' unless defined(&__sputc);
    } else {
	eval 'sub __sputc {
	    my($c, $p) = @_;
    	    eval q((---> &_w < 0? -> &_w >= -> &_lbfsize ? (*-> &_p = ), *-> &_p != ord(\'\\\\n\' ? 				*->_p++ : 				__swbuf(\'\\\\n\'), $p) :  &__swbuf(($c), $p) : (*($p)-> &_p = ($c), *($p)-> &_p++)));
	}' unless defined(&__sputc);
    }
    unless(defined(&__LIBC_ISTHREADED_DECLARED)) {
	eval 'sub __LIBC_ISTHREADED_DECLARED () {1;}' unless defined(&__LIBC_ISTHREADED_DECLARED);
    }
    unless(defined(&__cplusplus)) {
	eval 'sub __sfeof {
	    my($p) = @_;
    	    eval q(((($p)-> &_flags &  &__SEOF) != 0));
	}' unless defined(&__sfeof);
	eval 'sub __sferror {
	    my($p) = @_;
    	    eval q(((($p)-> &_flags &  &__SERR) != 0));
	}' unless defined(&__sferror);
	eval 'sub __sclearerr {
	    my($p) = @_;
    	    eval q((( &void)(($p)-> &_flags &= ~( &__SERR| &__SEOF))));
	}' unless defined(&__sclearerr);
	eval 'sub __sfileno {
	    my($p) = @_;
    	    eval q((($p)-> &_file));
	}' unless defined(&__sfileno);
	eval 'sub feof {
	    my($p) = @_;
    	    eval q((! &__isthreaded ?  &__sfeof($p) : ( &feof)($p)));
	}' unless defined(&feof);
	eval 'sub ferror {
	    my($p) = @_;
    	    eval q((! &__isthreaded ?  &__sferror($p) : ( &ferror)($p)));
	}' unless defined(&ferror);
	eval 'sub clearerr {
	    my($p) = @_;
    	    eval q((! &__isthreaded ?  &__sclearerr($p) : ( &clearerr)($p)));
	}' unless defined(&clearerr);
	if((defined(&__POSIX_VISIBLE) ? &__POSIX_VISIBLE : undef)) {
	    eval 'sub fileno {
	        my($p) = @_;
    		eval q((! &__isthreaded ?  &__sfileno($p) : ( &fileno)($p)));
	    }' unless defined(&fileno);
	}
	eval 'sub getc {
	    my($fp) = @_;
    	    eval q((! &__isthreaded ?  &__sgetc($fp) : ( &getc)($fp)));
	}' unless defined(&getc);
	eval 'sub putc {
	    my($x, $fp) = @_;
    	    eval q((! &__isthreaded ?  &__sputc($x, $fp) : ( &putc)($x, $fp)));
	}' unless defined(&putc);
	eval 'sub getchar () {
	    eval q( &getc( &stdin));
	}' unless defined(&getchar);
	eval 'sub putchar {
	    my($x) = @_;
    	    eval q( &putc($x,  &stdout));
	}' unless defined(&putchar);
	if((defined(&__BSD_VISIBLE) ? &__BSD_VISIBLE : undef)) {
	    eval 'sub clearerr_unlocked {
	        my($p) = @_;
    		eval q( &__sclearerr($p));
	    }' unless defined(&clearerr_unlocked);
	    eval 'sub feof_unlocked {
	        my($p) = @_;
    		eval q( &__sfeof($p));
	    }' unless defined(&feof_unlocked);
	    eval 'sub ferror_unlocked {
	        my($p) = @_;
    		eval q( &__sferror($p));
	    }' unless defined(&ferror_unlocked);
	    eval 'sub fileno_unlocked {
	        my($p) = @_;
    		eval q( &__sfileno($p));
	    }' unless defined(&fileno_unlocked);
	    eval 'sub fputc_unlocked {
	        my($s, $p) = @_;
    		eval q( &__sputc($s, $p));
	    }' unless defined(&fputc_unlocked);
	}
	if((defined(&__POSIX_VISIBLE) ? &__POSIX_VISIBLE : undef) >= 199506) {
	    eval 'sub getc_unlocked {
	        my($fp) = @_;
    		eval q( &__sgetc($fp));
	    }' unless defined(&getc_unlocked);
	    eval 'sub putc_unlocked {
	        my($x, $fp) = @_;
    		eval q( &__sputc($x, $fp));
	    }' unless defined(&putc_unlocked);
	    eval 'sub getchar_unlocked () {
	        eval q( &getc_unlocked( &stdin));
	    }' unless defined(&getchar_unlocked);
	    eval 'sub putchar_unlocked {
	        my($x) = @_;
    		eval q( &putc_unlocked($x,  &stdout));
	    }' unless defined(&putchar_unlocked);
	}
    }
}
1;

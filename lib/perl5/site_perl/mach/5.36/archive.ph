require '_h2ph_pre.ph';

no warnings qw(redefine misc);

unless(defined(&ARCHIVE_H_INCLUDED)) {
    eval 'sub ARCHIVE_H_INCLUDED () {1;}' unless defined(&ARCHIVE_H_INCLUDED);
    eval 'sub ARCHIVE_VERSION_NUMBER () {3007004;}' unless defined(&ARCHIVE_VERSION_NUMBER);
    require 'sys/stat.ph';
    require 'stddef.ph';
    require 'stdio.ph';
    require 'time.ph';
    if(defined(&__BORLANDC__)  && (defined(&__BORLANDC__) ? &__BORLANDC__ : undef) >= 0x560) {
	require 'stdint.ph';
    }
 elsif(!defined(&__WATCOMC__)  && !defined(&_MSC_VER)  && !defined(&__INTERIX)  && !defined(&__BORLANDC__)  && !defined(&_SCO_DS)  && !defined(&__osf__)  && !defined(&__CLANG_INTTYPES_H)) {
	require 'inttypes.ph';
    }
    if(!defined(&__LA_INT64_T_DEFINED)) {
	if((defined(&ARCHIVE_VERSION_NUMBER) ? &ARCHIVE_VERSION_NUMBER : undef) < 4000000) {
	    eval 'sub __LA_INT64_T () { &la_int64_t;}' unless defined(&__LA_INT64_T);
	}
	eval 'sub __LA_INT64_T_DEFINED () {1;}' unless defined(&__LA_INT64_T_DEFINED);
	if(defined(&_WIN32)  && !defined(&__CYGWIN__)  && !defined(&__WATCOMC__)) {
	} else {
	    require 'unistd.ph';
	    if(defined(&_SCO_DS) || defined(&__osf__)) {
	    } else {
	    }
	}
    }
    if(!defined(&__LA_SSIZE_T_DEFINED)) {
	if((defined(&ARCHIVE_VERSION_NUMBER) ? &ARCHIVE_VERSION_NUMBER : undef) < 4000000) {
	    eval 'sub __LA_SSIZE_T () { &la_ssize_t;}' unless defined(&__LA_SSIZE_T);
	}
	eval 'sub __LA_SSIZE_T_DEFINED () {1;}' unless defined(&__LA_SSIZE_T_DEFINED);
	if(defined(&_WIN32)  && !defined(&__CYGWIN__)  && !defined(&__WATCOMC__)) {
	    if(defined(&_SSIZE_T_DEFINED) || defined(&_SSIZE_T_)) {
	    }
 elsif(defined(&_WIN64)) {
	    } else {
	    }
	} else {
	    require 'unistd.ph';
	}
    }
    if(defined(&__LIBARCHIVE_BUILD)  && defined(&__ANDROID__)) {
	require 'android_lf.ph';
    }
    if(((defined (&__WIN32__)) || (defined (&_WIN32)) || defined(&__CYGWIN__))  && (!defined (&LIBARCHIVE_STATIC))) {
	if(defined(&__LIBARCHIVE_BUILD)) {
	    if(defined(&__GNUC__)) {
		eval 'sub __LA_DECL () { &__attribute__(( &dllexport))  &extern;}' unless defined(&__LA_DECL);
	    } else {
		eval 'sub __LA_DECL () { &__declspec( &dllexport);}' unless defined(&__LA_DECL);
	    }
	} else {
	    if(defined(&__GNUC__)) {
		eval 'sub __LA_DECL () {1;}' unless defined(&__LA_DECL);
	    } else {
		eval 'sub __LA_DECL () { &__declspec( &dllimport);}' unless defined(&__LA_DECL);
	    }
	}
    }
 elsif(defined (&__LIBARCHIVE_ENABLE_VISIBILITY)) {
	eval 'sub __LA_DECL () { &__attribute__(( &visibility("default")));}' unless defined(&__LA_DECL);
    } else {
	eval 'sub __LA_DECL () {1;}' unless defined(&__LA_DECL);
    }
    if(defined(&__GNUC__)  && (defined(&__GNUC__) ? &__GNUC__ : undef) >= 3 && !defined(&__MINGW32__)) {
	eval 'sub __LA_PRINTF {
	    my($fmtarg, $firstvararg) = @_;
    	    eval q( &__attribute__(( &__format__ ( &__printf__, $fmtarg, $firstvararg))));
	}' unless defined(&__LA_PRINTF);
    } else {
	eval 'sub __LA_PRINTF {
	    my($fmtarg, $firstvararg) = @_;
    	    eval q();
	}' unless defined(&__LA_PRINTF);
    }
    if(defined(&__GNUC__)  && (defined(&__GNUC__) ? &__GNUC__ : undef) >= 3 && (defined(&__GNUC_MINOR__) ? &__GNUC_MINOR__ : undef) >= 1) {
	eval 'sub __LA_DEPRECATED () { &__attribute__(( &deprecated));}' unless defined(&__LA_DEPRECATED);
    } else {
	eval 'sub __LA_DEPRECATED () {1;}' unless defined(&__LA_DEPRECATED);
    }
    if(defined(&__cplusplus)) {
    }
    eval 'sub ARCHIVE_VERSION_ONLY_STRING () {"3.7.4";}' unless defined(&ARCHIVE_VERSION_ONLY_STRING);
    eval 'sub ARCHIVE_VERSION_STRING () {"libarchive "  &ARCHIVE_VERSION_ONLY_STRING;}' unless defined(&ARCHIVE_VERSION_STRING);
    eval 'sub ARCHIVE_EOF () {1;}' unless defined(&ARCHIVE_EOF);
    eval 'sub ARCHIVE_OK () {0;}' unless defined(&ARCHIVE_OK);
    eval 'sub ARCHIVE_RETRY () {(-10);}' unless defined(&ARCHIVE_RETRY);
    eval 'sub ARCHIVE_WARN () {(-20);}' unless defined(&ARCHIVE_WARN);
    eval 'sub ARCHIVE_FAILED () {(-25);}' unless defined(&ARCHIVE_FAILED);
    eval 'sub ARCHIVE_FATAL () {(-30);}' unless defined(&ARCHIVE_FATAL);
    eval 'sub ARCHIVE_FILTER_NONE () {0;}' unless defined(&ARCHIVE_FILTER_NONE);
    eval 'sub ARCHIVE_FILTER_GZIP () {1;}' unless defined(&ARCHIVE_FILTER_GZIP);
    eval 'sub ARCHIVE_FILTER_BZIP2 () {2;}' unless defined(&ARCHIVE_FILTER_BZIP2);
    eval 'sub ARCHIVE_FILTER_COMPRESS () {3;}' unless defined(&ARCHIVE_FILTER_COMPRESS);
    eval 'sub ARCHIVE_FILTER_PROGRAM () {4;}' unless defined(&ARCHIVE_FILTER_PROGRAM);
    eval 'sub ARCHIVE_FILTER_LZMA () {5;}' unless defined(&ARCHIVE_FILTER_LZMA);
    eval 'sub ARCHIVE_FILTER_XZ () {6;}' unless defined(&ARCHIVE_FILTER_XZ);
    eval 'sub ARCHIVE_FILTER_UU () {7;}' unless defined(&ARCHIVE_FILTER_UU);
    eval 'sub ARCHIVE_FILTER_RPM () {8;}' unless defined(&ARCHIVE_FILTER_RPM);
    eval 'sub ARCHIVE_FILTER_LZIP () {9;}' unless defined(&ARCHIVE_FILTER_LZIP);
    eval 'sub ARCHIVE_FILTER_LRZIP () {10;}' unless defined(&ARCHIVE_FILTER_LRZIP);
    eval 'sub ARCHIVE_FILTER_LZOP () {11;}' unless defined(&ARCHIVE_FILTER_LZOP);
    eval 'sub ARCHIVE_FILTER_GRZIP () {12;}' unless defined(&ARCHIVE_FILTER_GRZIP);
    eval 'sub ARCHIVE_FILTER_LZ4 () {13;}' unless defined(&ARCHIVE_FILTER_LZ4);
    eval 'sub ARCHIVE_FILTER_ZSTD () {14;}' unless defined(&ARCHIVE_FILTER_ZSTD);
    if((defined(&ARCHIVE_VERSION_NUMBER) ? &ARCHIVE_VERSION_NUMBER : undef) < 4000000) {
	eval 'sub ARCHIVE_COMPRESSION_NONE () { &ARCHIVE_FILTER_NONE;}' unless defined(&ARCHIVE_COMPRESSION_NONE);
	eval 'sub ARCHIVE_COMPRESSION_GZIP () { &ARCHIVE_FILTER_GZIP;}' unless defined(&ARCHIVE_COMPRESSION_GZIP);
	eval 'sub ARCHIVE_COMPRESSION_BZIP2 () { &ARCHIVE_FILTER_BZIP2;}' unless defined(&ARCHIVE_COMPRESSION_BZIP2);
	eval 'sub ARCHIVE_COMPRESSION_COMPRESS () { &ARCHIVE_FILTER_COMPRESS;}' unless defined(&ARCHIVE_COMPRESSION_COMPRESS);
	eval 'sub ARCHIVE_COMPRESSION_PROGRAM () { &ARCHIVE_FILTER_PROGRAM;}' unless defined(&ARCHIVE_COMPRESSION_PROGRAM);
	eval 'sub ARCHIVE_COMPRESSION_LZMA () { &ARCHIVE_FILTER_LZMA;}' unless defined(&ARCHIVE_COMPRESSION_LZMA);
	eval 'sub ARCHIVE_COMPRESSION_XZ () { &ARCHIVE_FILTER_XZ;}' unless defined(&ARCHIVE_COMPRESSION_XZ);
	eval 'sub ARCHIVE_COMPRESSION_UU () { &ARCHIVE_FILTER_UU;}' unless defined(&ARCHIVE_COMPRESSION_UU);
	eval 'sub ARCHIVE_COMPRESSION_RPM () { &ARCHIVE_FILTER_RPM;}' unless defined(&ARCHIVE_COMPRESSION_RPM);
	eval 'sub ARCHIVE_COMPRESSION_LZIP () { &ARCHIVE_FILTER_LZIP;}' unless defined(&ARCHIVE_COMPRESSION_LZIP);
	eval 'sub ARCHIVE_COMPRESSION_LRZIP () { &ARCHIVE_FILTER_LRZIP;}' unless defined(&ARCHIVE_COMPRESSION_LRZIP);
    }
    eval 'sub ARCHIVE_FORMAT_BASE_MASK () {0xff0000;}' unless defined(&ARCHIVE_FORMAT_BASE_MASK);
    eval 'sub ARCHIVE_FORMAT_CPIO () {0x10000;}' unless defined(&ARCHIVE_FORMAT_CPIO);
    eval 'sub ARCHIVE_FORMAT_CPIO_POSIX () {( &ARCHIVE_FORMAT_CPIO | 1);}' unless defined(&ARCHIVE_FORMAT_CPIO_POSIX);
    eval 'sub ARCHIVE_FORMAT_CPIO_BIN_LE () {( &ARCHIVE_FORMAT_CPIO | 2);}' unless defined(&ARCHIVE_FORMAT_CPIO_BIN_LE);
    eval 'sub ARCHIVE_FORMAT_CPIO_BIN_BE () {( &ARCHIVE_FORMAT_CPIO | 3);}' unless defined(&ARCHIVE_FORMAT_CPIO_BIN_BE);
    eval 'sub ARCHIVE_FORMAT_CPIO_SVR4_NOCRC () {( &ARCHIVE_FORMAT_CPIO | 4);}' unless defined(&ARCHIVE_FORMAT_CPIO_SVR4_NOCRC);
    eval 'sub ARCHIVE_FORMAT_CPIO_SVR4_CRC () {( &ARCHIVE_FORMAT_CPIO | 5);}' unless defined(&ARCHIVE_FORMAT_CPIO_SVR4_CRC);
    eval 'sub ARCHIVE_FORMAT_CPIO_AFIO_LARGE () {( &ARCHIVE_FORMAT_CPIO | 6);}' unless defined(&ARCHIVE_FORMAT_CPIO_AFIO_LARGE);
    eval 'sub ARCHIVE_FORMAT_CPIO_PWB () {( &ARCHIVE_FORMAT_CPIO | 7);}' unless defined(&ARCHIVE_FORMAT_CPIO_PWB);
    eval 'sub ARCHIVE_FORMAT_SHAR () {0x20000;}' unless defined(&ARCHIVE_FORMAT_SHAR);
    eval 'sub ARCHIVE_FORMAT_SHAR_BASE () {( &ARCHIVE_FORMAT_SHAR | 1);}' unless defined(&ARCHIVE_FORMAT_SHAR_BASE);
    eval 'sub ARCHIVE_FORMAT_SHAR_DUMP () {( &ARCHIVE_FORMAT_SHAR | 2);}' unless defined(&ARCHIVE_FORMAT_SHAR_DUMP);
    eval 'sub ARCHIVE_FORMAT_TAR () {0x30000;}' unless defined(&ARCHIVE_FORMAT_TAR);
    eval 'sub ARCHIVE_FORMAT_TAR_USTAR () {( &ARCHIVE_FORMAT_TAR | 1);}' unless defined(&ARCHIVE_FORMAT_TAR_USTAR);
    eval 'sub ARCHIVE_FORMAT_TAR_PAX_INTERCHANGE () {( &ARCHIVE_FORMAT_TAR | 2);}' unless defined(&ARCHIVE_FORMAT_TAR_PAX_INTERCHANGE);
    eval 'sub ARCHIVE_FORMAT_TAR_PAX_RESTRICTED () {( &ARCHIVE_FORMAT_TAR | 3);}' unless defined(&ARCHIVE_FORMAT_TAR_PAX_RESTRICTED);
    eval 'sub ARCHIVE_FORMAT_TAR_GNUTAR () {( &ARCHIVE_FORMAT_TAR | 4);}' unless defined(&ARCHIVE_FORMAT_TAR_GNUTAR);
    eval 'sub ARCHIVE_FORMAT_ISO9660 () {0x40000;}' unless defined(&ARCHIVE_FORMAT_ISO9660);
    eval 'sub ARCHIVE_FORMAT_ISO9660_ROCKRIDGE () {( &ARCHIVE_FORMAT_ISO9660 | 1);}' unless defined(&ARCHIVE_FORMAT_ISO9660_ROCKRIDGE);
    eval 'sub ARCHIVE_FORMAT_ZIP () {0x50000;}' unless defined(&ARCHIVE_FORMAT_ZIP);
    eval 'sub ARCHIVE_FORMAT_EMPTY () {0x60000;}' unless defined(&ARCHIVE_FORMAT_EMPTY);
    eval 'sub ARCHIVE_FORMAT_AR () {0x70000;}' unless defined(&ARCHIVE_FORMAT_AR);
    eval 'sub ARCHIVE_FORMAT_AR_GNU () {( &ARCHIVE_FORMAT_AR | 1);}' unless defined(&ARCHIVE_FORMAT_AR_GNU);
    eval 'sub ARCHIVE_FORMAT_AR_BSD () {( &ARCHIVE_FORMAT_AR | 2);}' unless defined(&ARCHIVE_FORMAT_AR_BSD);
    eval 'sub ARCHIVE_FORMAT_MTREE () {0x80000;}' unless defined(&ARCHIVE_FORMAT_MTREE);
    eval 'sub ARCHIVE_FORMAT_RAW () {0x90000;}' unless defined(&ARCHIVE_FORMAT_RAW);
    eval 'sub ARCHIVE_FORMAT_XAR () {0xa0000;}' unless defined(&ARCHIVE_FORMAT_XAR);
    eval 'sub ARCHIVE_FORMAT_LHA () {0xb0000;}' unless defined(&ARCHIVE_FORMAT_LHA);
    eval 'sub ARCHIVE_FORMAT_CAB () {0xc0000;}' unless defined(&ARCHIVE_FORMAT_CAB);
    eval 'sub ARCHIVE_FORMAT_RAR () {0xd0000;}' unless defined(&ARCHIVE_FORMAT_RAR);
    eval 'sub ARCHIVE_FORMAT_7ZIP () {0xe0000;}' unless defined(&ARCHIVE_FORMAT_7ZIP);
    eval 'sub ARCHIVE_FORMAT_WARC () {0xf0000;}' unless defined(&ARCHIVE_FORMAT_WARC);
    eval 'sub ARCHIVE_FORMAT_RAR_V5 () {0x100000;}' unless defined(&ARCHIVE_FORMAT_RAR_V5);
    eval 'sub ARCHIVE_READ_FORMAT_CAPS_NONE () {(0);}' unless defined(&ARCHIVE_READ_FORMAT_CAPS_NONE);
    eval 'sub ARCHIVE_READ_FORMAT_CAPS_ENCRYPT_DATA () {(1<<0);}' unless defined(&ARCHIVE_READ_FORMAT_CAPS_ENCRYPT_DATA);
    eval 'sub ARCHIVE_READ_FORMAT_CAPS_ENCRYPT_METADATA () {(1<<1);}' unless defined(&ARCHIVE_READ_FORMAT_CAPS_ENCRYPT_METADATA);
    eval 'sub ARCHIVE_READ_FORMAT_ENCRYPTION_UNSUPPORTED () {-2;}' unless defined(&ARCHIVE_READ_FORMAT_ENCRYPTION_UNSUPPORTED);
    eval 'sub ARCHIVE_READ_FORMAT_ENCRYPTION_DONT_KNOW () {-1;}' unless defined(&ARCHIVE_READ_FORMAT_ENCRYPTION_DONT_KNOW);
    if((defined(&ARCHIVE_VERSION_NUMBER) ? &ARCHIVE_VERSION_NUMBER : undef) < 4000000) {
    }
    if(defined(&_WIN32)  && !defined(&__CYGWIN__)) {
    }
    eval 'sub ARCHIVE_EXTRACT_OWNER () {(0x1);}' unless defined(&ARCHIVE_EXTRACT_OWNER);
    eval 'sub ARCHIVE_EXTRACT_PERM () {(0x2);}' unless defined(&ARCHIVE_EXTRACT_PERM);
    eval 'sub ARCHIVE_EXTRACT_TIME () {(0x4);}' unless defined(&ARCHIVE_EXTRACT_TIME);
    eval 'sub ARCHIVE_EXTRACT_NO_OVERWRITE () {(0x8);}' unless defined(&ARCHIVE_EXTRACT_NO_OVERWRITE);
    eval 'sub ARCHIVE_EXTRACT_UNLINK () {(0x10);}' unless defined(&ARCHIVE_EXTRACT_UNLINK);
    eval 'sub ARCHIVE_EXTRACT_ACL () {(0x20);}' unless defined(&ARCHIVE_EXTRACT_ACL);
    eval 'sub ARCHIVE_EXTRACT_FFLAGS () {(0x40);}' unless defined(&ARCHIVE_EXTRACT_FFLAGS);
    eval 'sub ARCHIVE_EXTRACT_XATTR () {(0x80);}' unless defined(&ARCHIVE_EXTRACT_XATTR);
    eval 'sub ARCHIVE_EXTRACT_SECURE_SYMLINKS () {(0x100);}' unless defined(&ARCHIVE_EXTRACT_SECURE_SYMLINKS);
    eval 'sub ARCHIVE_EXTRACT_SECURE_NODOTDOT () {(0x200);}' unless defined(&ARCHIVE_EXTRACT_SECURE_NODOTDOT);
    eval 'sub ARCHIVE_EXTRACT_NO_AUTODIR () {(0x400);}' unless defined(&ARCHIVE_EXTRACT_NO_AUTODIR);
    eval 'sub ARCHIVE_EXTRACT_NO_OVERWRITE_NEWER () {(0x800);}' unless defined(&ARCHIVE_EXTRACT_NO_OVERWRITE_NEWER);
    eval 'sub ARCHIVE_EXTRACT_SPARSE () {(0x1000);}' unless defined(&ARCHIVE_EXTRACT_SPARSE);
    eval 'sub ARCHIVE_EXTRACT_MAC_METADATA () {(0x2000);}' unless defined(&ARCHIVE_EXTRACT_MAC_METADATA);
    eval 'sub ARCHIVE_EXTRACT_NO_HFS_COMPRESSION () {(0x4000);}' unless defined(&ARCHIVE_EXTRACT_NO_HFS_COMPRESSION);
    eval 'sub ARCHIVE_EXTRACT_HFS_COMPRESSION_FORCED () {(0x8000);}' unless defined(&ARCHIVE_EXTRACT_HFS_COMPRESSION_FORCED);
    eval 'sub ARCHIVE_EXTRACT_SECURE_NOABSOLUTEPATHS () {(0x10000);}' unless defined(&ARCHIVE_EXTRACT_SECURE_NOABSOLUTEPATHS);
    eval 'sub ARCHIVE_EXTRACT_CLEAR_NOCHANGE_FFLAGS () {(0x20000);}' unless defined(&ARCHIVE_EXTRACT_CLEAR_NOCHANGE_FFLAGS);
    eval 'sub ARCHIVE_EXTRACT_SAFE_WRITES () {(0x40000);}' unless defined(&ARCHIVE_EXTRACT_SAFE_WRITES);
    if((defined(&ARCHIVE_VERSION_NUMBER) ? &ARCHIVE_VERSION_NUMBER : undef) < 4000000) {
    }
    if((defined(&ARCHIVE_VERSION_NUMBER) ? &ARCHIVE_VERSION_NUMBER : undef) < 4000000) {
    }
    if((defined(&ARCHIVE_VERSION_NUMBER) ? &ARCHIVE_VERSION_NUMBER : undef) < 4000000) {
    }
    eval 'sub ARCHIVE_READDISK_RESTORE_ATIME () {(0x1);}' unless defined(&ARCHIVE_READDISK_RESTORE_ATIME);
    eval 'sub ARCHIVE_READDISK_HONOR_NODUMP () {(0x2);}' unless defined(&ARCHIVE_READDISK_HONOR_NODUMP);
    eval 'sub ARCHIVE_READDISK_MAC_COPYFILE () {(0x4);}' unless defined(&ARCHIVE_READDISK_MAC_COPYFILE);
    eval 'sub ARCHIVE_READDISK_NO_TRAVERSE_MOUNTS () {(0x8);}' unless defined(&ARCHIVE_READDISK_NO_TRAVERSE_MOUNTS);
    eval 'sub ARCHIVE_READDISK_NO_XATTR () {(0x10);}' unless defined(&ARCHIVE_READDISK_NO_XATTR);
    eval 'sub ARCHIVE_READDISK_NO_ACL () {(0x20);}' unless defined(&ARCHIVE_READDISK_NO_ACL);
    eval 'sub ARCHIVE_READDISK_NO_FFLAGS () {(0x40);}' unless defined(&ARCHIVE_READDISK_NO_FFLAGS);
    eval 'sub ARCHIVE_READDISK_NO_SPARSE () {(0x80);}' unless defined(&ARCHIVE_READDISK_NO_SPARSE);
    if((defined(&ARCHIVE_VERSION_NUMBER) ? &ARCHIVE_VERSION_NUMBER : undef) < 4000000) {
    }
    eval 'sub ARCHIVE_MATCH_MTIME () {(0x100);}' unless defined(&ARCHIVE_MATCH_MTIME);
    eval 'sub ARCHIVE_MATCH_CTIME () {(0x200);}' unless defined(&ARCHIVE_MATCH_CTIME);
    eval 'sub ARCHIVE_MATCH_NEWER () {(0x1);}' unless defined(&ARCHIVE_MATCH_NEWER);
    eval 'sub ARCHIVE_MATCH_OLDER () {(0x2);}' unless defined(&ARCHIVE_MATCH_OLDER);
    eval 'sub ARCHIVE_MATCH_EQUAL () {(0x10);}' unless defined(&ARCHIVE_MATCH_EQUAL);
    if(defined(&__cplusplus)) {
    }
    undef(&__LA_DECL) if defined(&__LA_DECL);
}
1;

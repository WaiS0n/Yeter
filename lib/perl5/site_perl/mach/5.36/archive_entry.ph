require '_h2ph_pre.ph';

no warnings qw(redefine misc);

unless(defined(&ARCHIVE_ENTRY_H_INCLUDED)) {
    eval 'sub ARCHIVE_ENTRY_H_INCLUDED () {1;}' unless defined(&ARCHIVE_ENTRY_H_INCLUDED);
    eval 'sub ARCHIVE_VERSION_NUMBER () {3007004;}' unless defined(&ARCHIVE_VERSION_NUMBER);
    require 'sys/types.ph';
    require 'stddef.ph';
    require 'stdint.ph';
    require 'time.ph';
    if(defined(&_WIN32)  && !defined(&__CYGWIN__)) {
	require 'windows.ph';
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
    if((defined(&ARCHIVE_VERSION_NUMBER) ? &ARCHIVE_VERSION_NUMBER : undef) >= 3999000) {
	eval 'sub __LA_MODE_T () {\'int\';}' unless defined(&__LA_MODE_T);
    }
 elsif(defined(&_WIN32)  && !defined(&__CYGWIN__)  && !defined(&__BORLANDC__)  && !defined(&__WATCOMC__)) {
	eval 'sub __LA_MODE_T () {\'unsigned short\';}' unless defined(&__LA_MODE_T);
    } else {
	eval 'sub __LA_MODE_T () { &mode_t;}' unless defined(&__LA_MODE_T);
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
    if(defined(&__GNUC__)  && (defined(&__GNUC__) ? &__GNUC__ : undef) >= 3 && (defined(&__GNUC_MINOR__) ? &__GNUC_MINOR__ : undef) >= 1) {
	eval 'sub __LA_DEPRECATED () { &__attribute__(( &deprecated));}' unless defined(&__LA_DEPRECATED);
    } else {
	eval 'sub __LA_DEPRECATED () {1;}' unless defined(&__LA_DEPRECATED);
    }
    if(defined(&__cplusplus)) {
    }
    eval 'sub AE_IFMT () {(( &__LA_MODE_T)0170000);}' unless defined(&AE_IFMT);
    eval 'sub AE_IFREG () {(( &__LA_MODE_T)0100000);}' unless defined(&AE_IFREG);
    eval 'sub AE_IFLNK () {(( &__LA_MODE_T)0120000);}' unless defined(&AE_IFLNK);
    eval 'sub AE_IFSOCK () {(( &__LA_MODE_T)0140000);}' unless defined(&AE_IFSOCK);
    eval 'sub AE_IFCHR () {(( &__LA_MODE_T)0020000);}' unless defined(&AE_IFCHR);
    eval 'sub AE_IFBLK () {(( &__LA_MODE_T)0060000);}' unless defined(&AE_IFBLK);
    eval 'sub AE_IFDIR () {(( &__LA_MODE_T)0040000);}' unless defined(&AE_IFDIR);
    eval 'sub AE_IFIFO () {(( &__LA_MODE_T)0010000);}' unless defined(&AE_IFIFO);
    eval 'sub AE_SYMLINK_TYPE_UNDEFINED () {0;}' unless defined(&AE_SYMLINK_TYPE_UNDEFINED);
    eval 'sub AE_SYMLINK_TYPE_FILE () {1;}' unless defined(&AE_SYMLINK_TYPE_FILE);
    eval 'sub AE_SYMLINK_TYPE_DIRECTORY () {2;}' unless defined(&AE_SYMLINK_TYPE_DIRECTORY);
    if(defined(&_WIN32)  && !defined(&__CYGWIN__)) {
    }
    eval 'sub ARCHIVE_ENTRY_DIGEST_MD5 () {0x1;}' unless defined(&ARCHIVE_ENTRY_DIGEST_MD5);
    eval 'sub ARCHIVE_ENTRY_DIGEST_RMD160 () {0x2;}' unless defined(&ARCHIVE_ENTRY_DIGEST_RMD160);
    eval 'sub ARCHIVE_ENTRY_DIGEST_SHA1 () {0x3;}' unless defined(&ARCHIVE_ENTRY_DIGEST_SHA1);
    eval 'sub ARCHIVE_ENTRY_DIGEST_SHA256 () {0x4;}' unless defined(&ARCHIVE_ENTRY_DIGEST_SHA256);
    eval 'sub ARCHIVE_ENTRY_DIGEST_SHA384 () {0x5;}' unless defined(&ARCHIVE_ENTRY_DIGEST_SHA384);
    eval 'sub ARCHIVE_ENTRY_DIGEST_SHA512 () {0x6;}' unless defined(&ARCHIVE_ENTRY_DIGEST_SHA512);
    eval 'sub ARCHIVE_ENTRY_ACL_EXECUTE () {0x1;}' unless defined(&ARCHIVE_ENTRY_ACL_EXECUTE);
    eval 'sub ARCHIVE_ENTRY_ACL_WRITE () {0x2;}' unless defined(&ARCHIVE_ENTRY_ACL_WRITE);
    eval 'sub ARCHIVE_ENTRY_ACL_READ () {0x4;}' unless defined(&ARCHIVE_ENTRY_ACL_READ);
    eval 'sub ARCHIVE_ENTRY_ACL_READ_DATA () {0x8;}' unless defined(&ARCHIVE_ENTRY_ACL_READ_DATA);
    eval 'sub ARCHIVE_ENTRY_ACL_LIST_DIRECTORY () {0x8;}' unless defined(&ARCHIVE_ENTRY_ACL_LIST_DIRECTORY);
    eval 'sub ARCHIVE_ENTRY_ACL_WRITE_DATA () {0x10;}' unless defined(&ARCHIVE_ENTRY_ACL_WRITE_DATA);
    eval 'sub ARCHIVE_ENTRY_ACL_ADD_FILE () {0x10;}' unless defined(&ARCHIVE_ENTRY_ACL_ADD_FILE);
    eval 'sub ARCHIVE_ENTRY_ACL_APPEND_DATA () {0x20;}' unless defined(&ARCHIVE_ENTRY_ACL_APPEND_DATA);
    eval 'sub ARCHIVE_ENTRY_ACL_ADD_SUBDIRECTORY () {0x20;}' unless defined(&ARCHIVE_ENTRY_ACL_ADD_SUBDIRECTORY);
    eval 'sub ARCHIVE_ENTRY_ACL_READ_NAMED_ATTRS () {0x40;}' unless defined(&ARCHIVE_ENTRY_ACL_READ_NAMED_ATTRS);
    eval 'sub ARCHIVE_ENTRY_ACL_WRITE_NAMED_ATTRS () {0x80;}' unless defined(&ARCHIVE_ENTRY_ACL_WRITE_NAMED_ATTRS);
    eval 'sub ARCHIVE_ENTRY_ACL_DELETE_CHILD () {0x100;}' unless defined(&ARCHIVE_ENTRY_ACL_DELETE_CHILD);
    eval 'sub ARCHIVE_ENTRY_ACL_READ_ATTRIBUTES () {0x200;}' unless defined(&ARCHIVE_ENTRY_ACL_READ_ATTRIBUTES);
    eval 'sub ARCHIVE_ENTRY_ACL_WRITE_ATTRIBUTES () {0x400;}' unless defined(&ARCHIVE_ENTRY_ACL_WRITE_ATTRIBUTES);
    eval 'sub ARCHIVE_ENTRY_ACL_DELETE () {0x800;}' unless defined(&ARCHIVE_ENTRY_ACL_DELETE);
    eval 'sub ARCHIVE_ENTRY_ACL_READ_ACL () {0x1000;}' unless defined(&ARCHIVE_ENTRY_ACL_READ_ACL);
    eval 'sub ARCHIVE_ENTRY_ACL_WRITE_ACL () {0x2000;}' unless defined(&ARCHIVE_ENTRY_ACL_WRITE_ACL);
    eval 'sub ARCHIVE_ENTRY_ACL_WRITE_OWNER () {0x4000;}' unless defined(&ARCHIVE_ENTRY_ACL_WRITE_OWNER);
    eval 'sub ARCHIVE_ENTRY_ACL_SYNCHRONIZE () {0x8000;}' unless defined(&ARCHIVE_ENTRY_ACL_SYNCHRONIZE);
    eval 'sub ARCHIVE_ENTRY_ACL_PERMS_POSIX1E () {( &ARCHIVE_ENTRY_ACL_EXECUTE |  &ARCHIVE_ENTRY_ACL_WRITE |  &ARCHIVE_ENTRY_ACL_READ);}' unless defined(&ARCHIVE_ENTRY_ACL_PERMS_POSIX1E);
    eval 'sub ARCHIVE_ENTRY_ACL_PERMS_NFS4 () {( &ARCHIVE_ENTRY_ACL_EXECUTE |  &ARCHIVE_ENTRY_ACL_READ_DATA |  &ARCHIVE_ENTRY_ACL_LIST_DIRECTORY |  &ARCHIVE_ENTRY_ACL_WRITE_DATA |  &ARCHIVE_ENTRY_ACL_ADD_FILE |  &ARCHIVE_ENTRY_ACL_APPEND_DATA |  &ARCHIVE_ENTRY_ACL_ADD_SUBDIRECTORY |  &ARCHIVE_ENTRY_ACL_READ_NAMED_ATTRS |  &ARCHIVE_ENTRY_ACL_WRITE_NAMED_ATTRS |  &ARCHIVE_ENTRY_ACL_DELETE_CHILD |  &ARCHIVE_ENTRY_ACL_READ_ATTRIBUTES |  &ARCHIVE_ENTRY_ACL_WRITE_ATTRIBUTES |  &ARCHIVE_ENTRY_ACL_DELETE |  &ARCHIVE_ENTRY_ACL_READ_ACL |  &ARCHIVE_ENTRY_ACL_WRITE_ACL |  &ARCHIVE_ENTRY_ACL_WRITE_OWNER |  &ARCHIVE_ENTRY_ACL_SYNCHRONIZE);}' unless defined(&ARCHIVE_ENTRY_ACL_PERMS_NFS4);
    eval 'sub ARCHIVE_ENTRY_ACL_ENTRY_INHERITED () {0x1000000;}' unless defined(&ARCHIVE_ENTRY_ACL_ENTRY_INHERITED);
    eval 'sub ARCHIVE_ENTRY_ACL_ENTRY_FILE_INHERIT () {0x2000000;}' unless defined(&ARCHIVE_ENTRY_ACL_ENTRY_FILE_INHERIT);
    eval 'sub ARCHIVE_ENTRY_ACL_ENTRY_DIRECTORY_INHERIT () {0x4000000;}' unless defined(&ARCHIVE_ENTRY_ACL_ENTRY_DIRECTORY_INHERIT);
    eval 'sub ARCHIVE_ENTRY_ACL_ENTRY_NO_PROPAGATE_INHERIT () {0x8000000;}' unless defined(&ARCHIVE_ENTRY_ACL_ENTRY_NO_PROPAGATE_INHERIT);
    eval 'sub ARCHIVE_ENTRY_ACL_ENTRY_INHERIT_ONLY () {0x10000000;}' unless defined(&ARCHIVE_ENTRY_ACL_ENTRY_INHERIT_ONLY);
    eval 'sub ARCHIVE_ENTRY_ACL_ENTRY_SUCCESSFUL_ACCESS () {0x20000000;}' unless defined(&ARCHIVE_ENTRY_ACL_ENTRY_SUCCESSFUL_ACCESS);
    eval 'sub ARCHIVE_ENTRY_ACL_ENTRY_FAILED_ACCESS () {0x40000000;}' unless defined(&ARCHIVE_ENTRY_ACL_ENTRY_FAILED_ACCESS);
    eval 'sub ARCHIVE_ENTRY_ACL_INHERITANCE_NFS4 () {( &ARCHIVE_ENTRY_ACL_ENTRY_FILE_INHERIT |  &ARCHIVE_ENTRY_ACL_ENTRY_DIRECTORY_INHERIT |  &ARCHIVE_ENTRY_ACL_ENTRY_NO_PROPAGATE_INHERIT |  &ARCHIVE_ENTRY_ACL_ENTRY_INHERIT_ONLY |  &ARCHIVE_ENTRY_ACL_ENTRY_SUCCESSFUL_ACCESS |  &ARCHIVE_ENTRY_ACL_ENTRY_FAILED_ACCESS |  &ARCHIVE_ENTRY_ACL_ENTRY_INHERITED);}' unless defined(&ARCHIVE_ENTRY_ACL_INHERITANCE_NFS4);
    eval 'sub ARCHIVE_ENTRY_ACL_TYPE_ACCESS () {0x100;}' unless defined(&ARCHIVE_ENTRY_ACL_TYPE_ACCESS);
    eval 'sub ARCHIVE_ENTRY_ACL_TYPE_DEFAULT () {0x200;}' unless defined(&ARCHIVE_ENTRY_ACL_TYPE_DEFAULT);
    eval 'sub ARCHIVE_ENTRY_ACL_TYPE_ALLOW () {0x400;}' unless defined(&ARCHIVE_ENTRY_ACL_TYPE_ALLOW);
    eval 'sub ARCHIVE_ENTRY_ACL_TYPE_DENY () {0x800;}' unless defined(&ARCHIVE_ENTRY_ACL_TYPE_DENY);
    eval 'sub ARCHIVE_ENTRY_ACL_TYPE_AUDIT () {0x1000;}' unless defined(&ARCHIVE_ENTRY_ACL_TYPE_AUDIT);
    eval 'sub ARCHIVE_ENTRY_ACL_TYPE_ALARM () {0x2000;}' unless defined(&ARCHIVE_ENTRY_ACL_TYPE_ALARM);
    eval 'sub ARCHIVE_ENTRY_ACL_TYPE_POSIX1E () {( &ARCHIVE_ENTRY_ACL_TYPE_ACCESS |  &ARCHIVE_ENTRY_ACL_TYPE_DEFAULT);}' unless defined(&ARCHIVE_ENTRY_ACL_TYPE_POSIX1E);
    eval 'sub ARCHIVE_ENTRY_ACL_TYPE_NFS4 () {( &ARCHIVE_ENTRY_ACL_TYPE_ALLOW |  &ARCHIVE_ENTRY_ACL_TYPE_DENY |  &ARCHIVE_ENTRY_ACL_TYPE_AUDIT |  &ARCHIVE_ENTRY_ACL_TYPE_ALARM);}' unless defined(&ARCHIVE_ENTRY_ACL_TYPE_NFS4);
    eval 'sub ARCHIVE_ENTRY_ACL_USER () {10001;}' unless defined(&ARCHIVE_ENTRY_ACL_USER);
    eval 'sub ARCHIVE_ENTRY_ACL_USER_OBJ () {10002;}' unless defined(&ARCHIVE_ENTRY_ACL_USER_OBJ);
    eval 'sub ARCHIVE_ENTRY_ACL_GROUP () {10003;}' unless defined(&ARCHIVE_ENTRY_ACL_GROUP);
    eval 'sub ARCHIVE_ENTRY_ACL_GROUP_OBJ () {10004;}' unless defined(&ARCHIVE_ENTRY_ACL_GROUP_OBJ);
    eval 'sub ARCHIVE_ENTRY_ACL_MASK () {10005;}' unless defined(&ARCHIVE_ENTRY_ACL_MASK);
    eval 'sub ARCHIVE_ENTRY_ACL_OTHER () {10006;}' unless defined(&ARCHIVE_ENTRY_ACL_OTHER);
    eval 'sub ARCHIVE_ENTRY_ACL_EVERYONE () {10107;}' unless defined(&ARCHIVE_ENTRY_ACL_EVERYONE);
    eval 'sub ARCHIVE_ENTRY_ACL_STYLE_EXTRA_ID () {0x1;}' unless defined(&ARCHIVE_ENTRY_ACL_STYLE_EXTRA_ID);
    eval 'sub ARCHIVE_ENTRY_ACL_STYLE_MARK_DEFAULT () {0x2;}' unless defined(&ARCHIVE_ENTRY_ACL_STYLE_MARK_DEFAULT);
    eval 'sub ARCHIVE_ENTRY_ACL_STYLE_SOLARIS () {0x4;}' unless defined(&ARCHIVE_ENTRY_ACL_STYLE_SOLARIS);
    eval 'sub ARCHIVE_ENTRY_ACL_STYLE_SEPARATOR_COMMA () {0x8;}' unless defined(&ARCHIVE_ENTRY_ACL_STYLE_SEPARATOR_COMMA);
    eval 'sub ARCHIVE_ENTRY_ACL_STYLE_COMPACT () {0x10;}' unless defined(&ARCHIVE_ENTRY_ACL_STYLE_COMPACT);
    eval 'sub OLD_ARCHIVE_ENTRY_ACL_STYLE_EXTRA_ID () {1024;}' unless defined(&OLD_ARCHIVE_ENTRY_ACL_STYLE_EXTRA_ID);
    eval 'sub OLD_ARCHIVE_ENTRY_ACL_STYLE_MARK_DEFAULT () {2048;}' unless defined(&OLD_ARCHIVE_ENTRY_ACL_STYLE_MARK_DEFAULT);
    if(defined(&__cplusplus)) {
    }
    undef(&__LA_DECL) if defined(&__LA_DECL);
}
1;

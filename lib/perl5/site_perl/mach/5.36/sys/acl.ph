require '_h2ph_pre.ph';

no warnings qw(redefine misc);

unless(defined(&_SYS_ACL_H_)) {
    eval 'sub _SYS_ACL_H_ () {1;}' unless defined(&_SYS_ACL_H_);
    require 'sys/param.ph';
    require 'sys/queue.ph';
    require 'vm/uma.ph';
    eval 'sub ACL_MAX_ENTRIES () {254;}' unless defined(&ACL_MAX_ENTRIES);
    if(defined(&_KERNEL) || defined(&_ACL_PRIVATE)) {
	eval 'sub POSIX1E_ACL_ACCESS_EXTATTR_NAMESPACE () { &EXTATTR_NAMESPACE_SYSTEM;}' unless defined(&POSIX1E_ACL_ACCESS_EXTATTR_NAMESPACE);
	eval 'sub POSIX1E_ACL_ACCESS_EXTATTR_NAME () {"posix1e.acl_access";}' unless defined(&POSIX1E_ACL_ACCESS_EXTATTR_NAME);
	eval 'sub POSIX1E_ACL_DEFAULT_EXTATTR_NAMESPACE () { &EXTATTR_NAMESPACE_SYSTEM;}' unless defined(&POSIX1E_ACL_DEFAULT_EXTATTR_NAMESPACE);
	eval 'sub POSIX1E_ACL_DEFAULT_EXTATTR_NAME () {"posix1e.acl_default";}' unless defined(&POSIX1E_ACL_DEFAULT_EXTATTR_NAME);
	eval 'sub NFS4_ACL_EXTATTR_NAMESPACE () { &EXTATTR_NAMESPACE_SYSTEM;}' unless defined(&NFS4_ACL_EXTATTR_NAMESPACE);
	eval 'sub NFS4_ACL_EXTATTR_NAME () {"nfs4.acl";}' unless defined(&NFS4_ACL_EXTATTR_NAME);
	eval 'sub OLDACL_MAX_ENTRIES () {32;}' unless defined(&OLDACL_MAX_ENTRIES);
    } else {
    }
    eval 'sub ACL_BRAND_UNKNOWN () {0;}' unless defined(&ACL_BRAND_UNKNOWN);
    eval 'sub ACL_BRAND_POSIX () {1;}' unless defined(&ACL_BRAND_POSIX);
    eval 'sub ACL_BRAND_NFS4 () {2;}' unless defined(&ACL_BRAND_NFS4);
    eval 'sub ACL_UNDEFINED_TAG () {0x;}' unless defined(&ACL_UNDEFINED_TAG);
    eval 'sub ACL_USER_OBJ () {0x1;}' unless defined(&ACL_USER_OBJ);
    eval 'sub ACL_USER () {0x2;}' unless defined(&ACL_USER);
    eval 'sub ACL_GROUP_OBJ () {0x4;}' unless defined(&ACL_GROUP_OBJ);
    eval 'sub ACL_GROUP () {0x8;}' unless defined(&ACL_GROUP);
    eval 'sub ACL_MASK () {0x10;}' unless defined(&ACL_MASK);
    eval 'sub ACL_OTHER () {0x20;}' unless defined(&ACL_OTHER);
    eval 'sub ACL_OTHER_OBJ () { &ACL_OTHER;}' unless defined(&ACL_OTHER_OBJ);
    eval 'sub ACL_EVERYONE () {0x40;}' unless defined(&ACL_EVERYONE);
    eval 'sub ACL_ENTRY_TYPE_ALLOW () {0x100;}' unless defined(&ACL_ENTRY_TYPE_ALLOW);
    eval 'sub ACL_ENTRY_TYPE_DENY () {0x200;}' unless defined(&ACL_ENTRY_TYPE_DENY);
    eval 'sub ACL_ENTRY_TYPE_AUDIT () {0x400;}' unless defined(&ACL_ENTRY_TYPE_AUDIT);
    eval 'sub ACL_ENTRY_TYPE_ALARM () {0x800;}' unless defined(&ACL_ENTRY_TYPE_ALARM);
    eval 'sub ACL_TYPE_ACCESS_OLD () {0x;}' unless defined(&ACL_TYPE_ACCESS_OLD);
    eval 'sub ACL_TYPE_DEFAULT_OLD () {0x1;}' unless defined(&ACL_TYPE_DEFAULT_OLD);
    eval 'sub ACL_TYPE_ACCESS () {0x2;}' unless defined(&ACL_TYPE_ACCESS);
    eval 'sub ACL_TYPE_DEFAULT () {0x3;}' unless defined(&ACL_TYPE_DEFAULT);
    eval 'sub ACL_TYPE_NFS4 () {0x4;}' unless defined(&ACL_TYPE_NFS4);
    eval 'sub ACL_EXECUTE () {0x1;}' unless defined(&ACL_EXECUTE);
    eval 'sub ACL_WRITE () {0x2;}' unless defined(&ACL_WRITE);
    eval 'sub ACL_READ () {0x4;}' unless defined(&ACL_READ);
    eval 'sub ACL_PERM_NONE () {0x;}' unless defined(&ACL_PERM_NONE);
    eval 'sub ACL_PERM_BITS () {( &ACL_EXECUTE |  &ACL_WRITE |  &ACL_READ);}' unless defined(&ACL_PERM_BITS);
    eval 'sub ACL_POSIX1E_BITS () {( &ACL_EXECUTE |  &ACL_WRITE |  &ACL_READ);}' unless defined(&ACL_POSIX1E_BITS);
    eval 'sub ACL_READ_DATA () {0x8;}' unless defined(&ACL_READ_DATA);
    eval 'sub ACL_LIST_DIRECTORY () {0x8;}' unless defined(&ACL_LIST_DIRECTORY);
    eval 'sub ACL_WRITE_DATA () {0x10;}' unless defined(&ACL_WRITE_DATA);
    eval 'sub ACL_ADD_FILE () {0x10;}' unless defined(&ACL_ADD_FILE);
    eval 'sub ACL_APPEND_DATA () {0x20;}' unless defined(&ACL_APPEND_DATA);
    eval 'sub ACL_ADD_SUBDIRECTORY () {0x20;}' unless defined(&ACL_ADD_SUBDIRECTORY);
    eval 'sub ACL_READ_NAMED_ATTRS () {0x40;}' unless defined(&ACL_READ_NAMED_ATTRS);
    eval 'sub ACL_WRITE_NAMED_ATTRS () {0x80;}' unless defined(&ACL_WRITE_NAMED_ATTRS);
    eval 'sub ACL_DELETE_CHILD () {0x100;}' unless defined(&ACL_DELETE_CHILD);
    eval 'sub ACL_READ_ATTRIBUTES () {0x200;}' unless defined(&ACL_READ_ATTRIBUTES);
    eval 'sub ACL_WRITE_ATTRIBUTES () {0x400;}' unless defined(&ACL_WRITE_ATTRIBUTES);
    eval 'sub ACL_DELETE () {0x800;}' unless defined(&ACL_DELETE);
    eval 'sub ACL_READ_ACL () {0x1000;}' unless defined(&ACL_READ_ACL);
    eval 'sub ACL_WRITE_ACL () {0x2000;}' unless defined(&ACL_WRITE_ACL);
    eval 'sub ACL_WRITE_OWNER () {0x4000;}' unless defined(&ACL_WRITE_OWNER);
    eval 'sub ACL_SYNCHRONIZE () {0x8000;}' unless defined(&ACL_SYNCHRONIZE);
    eval 'sub ACL_FULL_SET () {( &ACL_READ_DATA |  &ACL_WRITE_DATA |  &ACL_APPEND_DATA |  &ACL_READ_NAMED_ATTRS |  &ACL_WRITE_NAMED_ATTRS |  &ACL_EXECUTE |  &ACL_DELETE_CHILD |  &ACL_READ_ATTRIBUTES |  &ACL_WRITE_ATTRIBUTES |  &ACL_DELETE |  &ACL_READ_ACL |  &ACL_WRITE_ACL |  &ACL_WRITE_OWNER |  &ACL_SYNCHRONIZE);}' unless defined(&ACL_FULL_SET);
    eval 'sub ACL_MODIFY_SET () {( &ACL_FULL_SET & ~( &ACL_WRITE_ACL |  &ACL_WRITE_OWNER));}' unless defined(&ACL_MODIFY_SET);
    eval 'sub ACL_READ_SET () {( &ACL_READ_DATA |  &ACL_READ_NAMED_ATTRS |  &ACL_READ_ATTRIBUTES |  &ACL_READ_ACL);}' unless defined(&ACL_READ_SET);
    eval 'sub ACL_WRITE_SET () {( &ACL_WRITE_DATA |  &ACL_APPEND_DATA |  &ACL_WRITE_NAMED_ATTRS |  &ACL_WRITE_ATTRIBUTES);}' unless defined(&ACL_WRITE_SET);
    eval 'sub ACL_NFS4_PERM_BITS () { &ACL_FULL_SET;}' unless defined(&ACL_NFS4_PERM_BITS);
    eval 'sub ACL_FIRST_ENTRY () {0;}' unless defined(&ACL_FIRST_ENTRY);
    eval 'sub ACL_NEXT_ENTRY () {1;}' unless defined(&ACL_NEXT_ENTRY);
    eval 'sub ACL_ENTRY_FILE_INHERIT () {0x1;}' unless defined(&ACL_ENTRY_FILE_INHERIT);
    eval 'sub ACL_ENTRY_DIRECTORY_INHERIT () {0x2;}' unless defined(&ACL_ENTRY_DIRECTORY_INHERIT);
    eval 'sub ACL_ENTRY_NO_PROPAGATE_INHERIT () {0x4;}' unless defined(&ACL_ENTRY_NO_PROPAGATE_INHERIT);
    eval 'sub ACL_ENTRY_INHERIT_ONLY () {0x8;}' unless defined(&ACL_ENTRY_INHERIT_ONLY);
    eval 'sub ACL_ENTRY_SUCCESSFUL_ACCESS () {0x10;}' unless defined(&ACL_ENTRY_SUCCESSFUL_ACCESS);
    eval 'sub ACL_ENTRY_FAILED_ACCESS () {0x20;}' unless defined(&ACL_ENTRY_FAILED_ACCESS);
    eval 'sub ACL_ENTRY_INHERITED () {0x80;}' unless defined(&ACL_ENTRY_INHERITED);
    eval 'sub ACL_FLAGS_BITS () {( &ACL_ENTRY_FILE_INHERIT |  &ACL_ENTRY_DIRECTORY_INHERIT |  &ACL_ENTRY_NO_PROPAGATE_INHERIT |  &ACL_ENTRY_INHERIT_ONLY |  &ACL_ENTRY_SUCCESSFUL_ACCESS |  &ACL_ENTRY_FAILED_ACCESS |  &ACL_ENTRY_INHERITED);}' unless defined(&ACL_FLAGS_BITS);
    eval 'sub ACL_UNDEFINED_ID () {(( &uid_t)-1);}' unless defined(&ACL_UNDEFINED_ID);
    eval 'sub ACL_TEXT_VERBOSE () {0x1;}' unless defined(&ACL_TEXT_VERBOSE);
    eval 'sub ACL_TEXT_NUMERIC_IDS () {0x2;}' unless defined(&ACL_TEXT_NUMERIC_IDS);
    eval 'sub ACL_TEXT_APPEND_ID () {0x4;}' unless defined(&ACL_TEXT_APPEND_ID);
    eval 'sub ACL_OVERRIDE_MASK () {( &S_IRWXU |  &S_IRWXG |  &S_IRWXO);}' unless defined(&ACL_OVERRIDE_MASK);
    eval 'sub ACL_PRESERVE_MASK () {(~ &ACL_OVERRIDE_MASK);}' unless defined(&ACL_PRESERVE_MASK);
    if(defined(&_KERNEL)) {
    } else {
	if(defined(&_ACL_PRIVATE)) {
	}
    }
}
1;

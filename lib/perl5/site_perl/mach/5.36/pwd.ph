require '_h2ph_pre.ph';

no warnings qw(redefine misc);

unless(defined(&_PWD_H_)) {
    eval 'sub _PWD_H_ () {1;}' unless defined(&_PWD_H_);
    require 'sys/cdefs.ph';
    require 'sys/_types.ph';
    unless(defined(&_GID_T_DECLARED)) {
	eval 'sub _GID_T_DECLARED () {1;}' unless defined(&_GID_T_DECLARED);
    }
    unless(defined(&_TIME_T_DECLARED)) {
	eval 'sub _TIME_T_DECLARED () {1;}' unless defined(&_TIME_T_DECLARED);
    }
    unless(defined(&_UID_T_DECLARED)) {
	eval 'sub _UID_T_DECLARED () {1;}' unless defined(&_UID_T_DECLARED);
    }
    unless(defined(&_SIZE_T_DECLARED)) {
	eval 'sub _SIZE_T_DECLARED () {1;}' unless defined(&_SIZE_T_DECLARED);
    }
    eval 'sub _PATH_PWD () {"/etc";}' unless defined(&_PATH_PWD);
    eval 'sub _PATH_PASSWD () {"/etc/passwd";}' unless defined(&_PATH_PASSWD);
    eval 'sub _PASSWD () {"passwd";}' unless defined(&_PASSWD);
    eval 'sub _PATH_MASTERPASSWD () {"/etc/master.passwd";}' unless defined(&_PATH_MASTERPASSWD);
    eval 'sub _MASTERPASSWD () {"master.passwd";}' unless defined(&_MASTERPASSWD);
    eval 'sub _PATH_MP_DB () {"/etc/pwd.db";}' unless defined(&_PATH_MP_DB);
    eval 'sub _MP_DB () {"pwd.db";}' unless defined(&_MP_DB);
    eval 'sub _PATH_SMP_DB () {"/etc/spwd.db";}' unless defined(&_PATH_SMP_DB);
    eval 'sub _SMP_DB () {"spwd.db";}' unless defined(&_SMP_DB);
    eval 'sub _PATH_PWD_MKDB () {"/usr/sbin/pwd_mkdb";}' unless defined(&_PATH_PWD_MKDB);
    eval 'sub _PW_VERSION_MASK () {ord(\'\\xF0\');}' unless defined(&_PW_VERSION_MASK);
    eval 'sub _PW_VERSIONED {
        my($x, $v) = @_;
	    eval q((((($x) & 0xcf) | (($v)<<4))));
    }' unless defined(&_PW_VERSIONED);
    eval 'sub _PW_KEYBYNAME () {ord(\'\\x31\');}' unless defined(&_PW_KEYBYNAME);
    eval 'sub _PW_KEYBYNUM () {ord(\'\\x32\');}' unless defined(&_PW_KEYBYNUM);
    eval 'sub _PW_KEYBYUID () {ord(\'\\x33\');}' unless defined(&_PW_KEYBYUID);
    eval 'sub _PW_KEYYPENABLED () {ord(\'\\x34\');}' unless defined(&_PW_KEYYPENABLED);
    eval 'sub _PW_KEYYPBYNUM () {ord(\'\\x35\');}' unless defined(&_PW_KEYYPBYNUM);
    eval 'sub _PWD_VERSION_KEY () {"\\xFF" "VERSION";}' unless defined(&_PWD_VERSION_KEY);
    eval 'sub _PWD_CURRENT_VERSION () {ord(\'\\x04\');}' unless defined(&_PWD_CURRENT_VERSION);
    eval 'sub _PASSWORD_EFMT1 () {ord(\'_\');}' unless defined(&_PASSWORD_EFMT1);
    eval 'sub _PASSWORD_LEN () {128;}' unless defined(&_PASSWORD_LEN);
    eval 'sub _PWF {
        my($x) = @_;
	    eval q((1<< $x));
    }' unless defined(&_PWF);
    eval 'sub _PWF_NAME () { &_PWF(0);}' unless defined(&_PWF_NAME);
    eval 'sub _PWF_PASSWD () { &_PWF(1);}' unless defined(&_PWF_PASSWD);
    eval 'sub _PWF_UID () { &_PWF(2);}' unless defined(&_PWF_UID);
    eval 'sub _PWF_GID () { &_PWF(3);}' unless defined(&_PWF_GID);
    eval 'sub _PWF_CHANGE () { &_PWF(4);}' unless defined(&_PWF_CHANGE);
    eval 'sub _PWF_CLASS () { &_PWF(5);}' unless defined(&_PWF_CLASS);
    eval 'sub _PWF_GECOS () { &_PWF(6);}' unless defined(&_PWF_GECOS);
    eval 'sub _PWF_DIR () { &_PWF(7);}' unless defined(&_PWF_DIR);
    eval 'sub _PWF_SHELL () { &_PWF(8);}' unless defined(&_PWF_SHELL);
    eval 'sub _PWF_EXPIRE () { &_PWF(9);}' unless defined(&_PWF_EXPIRE);
    eval 'sub _PWF_SOURCE () {0x3000;}' unless defined(&_PWF_SOURCE);
    eval 'sub _PWF_FILES () {0x1000;}' unless defined(&_PWF_FILES);
    eval 'sub _PWF_NIS () {0x2000;}' unless defined(&_PWF_NIS);
    eval 'sub _PWF_HESIOD () {0x3000;}' unless defined(&_PWF_HESIOD);
    if((defined(&__XSI_VISIBLE) ? &__XSI_VISIBLE : undef) >= 500) {
    }
    if((defined(&__POSIX_VISIBLE) ? &__POSIX_VISIBLE : undef) >= 200112|| (defined(&__XSI_VISIBLE) ? &__XSI_VISIBLE : undef) >= 500) {
    }
    if((defined(&__BSD_VISIBLE) ? &__BSD_VISIBLE : undef)) {
    }
}
1;

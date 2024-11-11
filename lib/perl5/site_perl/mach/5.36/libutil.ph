require '_h2ph_pre.ph';

no warnings qw(redefine misc);

unless(defined(&_LIBUTIL_H_)) {
    eval 'sub _LIBUTIL_H_ () {1;}' unless defined(&_LIBUTIL_H_);
    require 'sys/cdefs.ph';
    require 'sys/_types.ph';
    require 'sys/_stdint.ph';
    unless(defined(&_GID_T_DECLARED)) {
	eval 'sub _GID_T_DECLARED () {1;}' unless defined(&_GID_T_DECLARED);
    }
    unless(defined(&_MODE_T_DECLARED)) {
	eval 'sub _MODE_T_DECLARED () {1;}' unless defined(&_MODE_T_DECLARED);
    }
    unless(defined(&_PID_T_DECLARED)) {
	eval 'sub _PID_T_DECLARED () {1;}' unless defined(&_PID_T_DECLARED);
    }
    unless(defined(&_SIZE_T_DECLARED)) {
	eval 'sub _SIZE_T_DECLARED () {1;}' unless defined(&_SIZE_T_DECLARED);
    }
    unless(defined(&_UID_T_DECLARED)) {
	eval 'sub _UID_T_DECLARED () {1;}' unless defined(&_UID_T_DECLARED);
    }
    eval 'sub PROPERTY_MAX_NAME () {64;}' unless defined(&PROPERTY_MAX_NAME);
    eval 'sub PROPERTY_MAX_VALUE () {512;}' unless defined(&PROPERTY_MAX_VALUE);
    if(defined(&_STDIO_H_)) {
    }
    if(defined(&_PWD_H_)) {
    }
    if(defined(&_GRP_H_)) {
    }
    if(defined(&_UFS_UFS_QUOTA_H_)) {
    }
    if(defined(&_SYS_CPUSET_H_)) {
	eval 'sub CPUSET_PARSE_OK () {0;}' unless defined(&CPUSET_PARSE_OK);
	eval 'sub CPUSET_PARSE_GETAFFINITY () {-1;}' unless defined(&CPUSET_PARSE_GETAFFINITY);
	eval 'sub CPUSET_PARSE_ERROR () {-2;}' unless defined(&CPUSET_PARSE_ERROR);
	eval 'sub CPUSET_PARSE_INVALID_CPU () {-3;}' unless defined(&CPUSET_PARSE_INVALID_CPU);
    }
    eval 'sub FPARSELN_UNESCESC () {0x1;}' unless defined(&FPARSELN_UNESCESC);
    eval 'sub FPARSELN_UNESCCONT () {0x2;}' unless defined(&FPARSELN_UNESCCONT);
    eval 'sub FPARSELN_UNESCCOMM () {0x4;}' unless defined(&FPARSELN_UNESCCOMM);
    eval 'sub FPARSELN_UNESCREST () {0x8;}' unless defined(&FPARSELN_UNESCREST);
    eval 'sub FPARSELN_UNESCALL () {0xf;}' unless defined(&FPARSELN_UNESCALL);
    eval 'sub HD_COLUMN_MASK () {0xff;}' unless defined(&HD_COLUMN_MASK);
    eval 'sub HD_DELIM_MASK () {0xff00;}' unless defined(&HD_DELIM_MASK);
    eval 'sub HD_OMIT_COUNT () {(1<< 16);}' unless defined(&HD_OMIT_COUNT);
    eval 'sub HD_OMIT_HEX () {(1<< 17);}' unless defined(&HD_OMIT_HEX);
    eval 'sub HD_OMIT_CHARS () {(1<< 18);}' unless defined(&HD_OMIT_CHARS);
    eval 'sub HN_DECIMAL () {0x1;}' unless defined(&HN_DECIMAL);
    eval 'sub HN_NOSPACE () {0x2;}' unless defined(&HN_NOSPACE);
    eval 'sub HN_B () {0x4;}' unless defined(&HN_B);
    eval 'sub HN_DIVISOR_1000 () {0x8;}' unless defined(&HN_DIVISOR_1000);
    eval 'sub HN_IEC_PREFIXES () {0x10;}' unless defined(&HN_IEC_PREFIXES);
    eval 'sub HN_GETSCALE () {0x10;}' unless defined(&HN_GETSCALE);
    eval 'sub HN_AUTOSCALE () {0x20;}' unless defined(&HN_AUTOSCALE);
    eval 'sub HOSTNAME_FOUND () {0;}' unless defined(&HOSTNAME_FOUND);
    eval 'sub HOSTNAME_INCORRECTNAME () {1;}' unless defined(&HOSTNAME_INCORRECTNAME);
    eval 'sub HOSTNAME_INVALIDADDR () {2;}' unless defined(&HOSTNAME_INVALIDADDR);
    eval 'sub HOSTNAME_INVALIDNAME () {3;}' unless defined(&HOSTNAME_INVALIDNAME);
    eval 'sub PWSCAN_MASTER () {0x1;}' unless defined(&PWSCAN_MASTER);
    eval 'sub PWSCAN_WARN () {0x2;}' unless defined(&PWSCAN_WARN);
    eval 'sub UU_LOCK_INUSE () {1;}' unless defined(&UU_LOCK_INUSE);
    eval 'sub UU_LOCK_OK () {0;}' unless defined(&UU_LOCK_OK);
    eval 'sub UU_LOCK_OPEN_ERR () {(-1);}' unless defined(&UU_LOCK_OPEN_ERR);
    eval 'sub UU_LOCK_READ_ERR () {(-2);}' unless defined(&UU_LOCK_READ_ERR);
    eval 'sub UU_LOCK_CREAT_ERR () {(-3);}' unless defined(&UU_LOCK_CREAT_ERR);
    eval 'sub UU_LOCK_WRITE_ERR () {(-4);}' unless defined(&UU_LOCK_WRITE_ERR);
    eval 'sub UU_LOCK_LINK_ERR () {(-5);}' unless defined(&UU_LOCK_LINK_ERR);
    eval 'sub UU_LOCK_TRY_ERR () {(-6);}' unless defined(&UU_LOCK_TRY_ERR);
    eval 'sub UU_LOCK_OWNER_ERR () {(-7);}' unless defined(&UU_LOCK_OWNER_ERR);
}
1;

require '_h2ph_pre.ph';

no warnings qw(redefine misc);

unless(defined(&_SYS_CAPSICUM_H_)) {
    eval 'sub _SYS_CAPSICUM_H_ () {1;}' unless defined(&_SYS_CAPSICUM_H_);
    require 'sys/cdefs.ph';
    require 'sys/param.ph';
    require 'sys/caprights.ph';
    require 'sys/file.ph';
    require 'sys/fcntl.ph';
    unless(defined(&_KERNEL)) {
	require 'stdbool.ph';
    }
    eval 'sub CAPRIGHT {
        my($idx, $bit) = @_;
	    eval q(((1 << (57+ ($idx))) | ($bit)));
    }' unless defined(&CAPRIGHT);
    eval 'sub CAP_READ () { &CAPRIGHT(0, 0x1);}' unless defined(&CAP_READ);
    eval 'sub CAP_WRITE () { &CAPRIGHT(0, 0x2);}' unless defined(&CAP_WRITE);
    eval 'sub CAP_SEEK_TELL () { &CAPRIGHT(0, 0x4);}' unless defined(&CAP_SEEK_TELL);
    eval 'sub CAP_SEEK () {( &CAP_SEEK_TELL | 0x8);}' unless defined(&CAP_SEEK);
    eval 'sub CAP_PREAD () {( &CAP_SEEK |  &CAP_READ);}' unless defined(&CAP_PREAD);
    eval 'sub CAP_PWRITE () {( &CAP_SEEK |  &CAP_WRITE);}' unless defined(&CAP_PWRITE);
    eval 'sub CAP_MMAP () { &CAPRIGHT(0, 0x10);}' unless defined(&CAP_MMAP);
    eval 'sub CAP_MMAP_R () {( &CAP_MMAP |  &CAP_SEEK |  &CAP_READ);}' unless defined(&CAP_MMAP_R);
    eval 'sub CAP_MMAP_W () {( &CAP_MMAP |  &CAP_SEEK |  &CAP_WRITE);}' unless defined(&CAP_MMAP_W);
    eval 'sub CAP_MMAP_X () {( &CAP_MMAP |  &CAP_SEEK | 0x20);}' unless defined(&CAP_MMAP_X);
    eval 'sub CAP_MMAP_RW () {( &CAP_MMAP_R |  &CAP_MMAP_W);}' unless defined(&CAP_MMAP_RW);
    eval 'sub CAP_MMAP_RX () {( &CAP_MMAP_R |  &CAP_MMAP_X);}' unless defined(&CAP_MMAP_RX);
    eval 'sub CAP_MMAP_WX () {( &CAP_MMAP_W |  &CAP_MMAP_X);}' unless defined(&CAP_MMAP_WX);
    eval 'sub CAP_MMAP_RWX () {( &CAP_MMAP_R |  &CAP_MMAP_W |  &CAP_MMAP_X);}' unless defined(&CAP_MMAP_RWX);
    eval 'sub CAP_CREATE () { &CAPRIGHT(0, 0x40);}' unless defined(&CAP_CREATE);
    eval 'sub CAP_FEXECVE () { &CAPRIGHT(0, 0x80);}' unless defined(&CAP_FEXECVE);
    eval 'sub CAP_FSYNC () { &CAPRIGHT(0, 0x100);}' unless defined(&CAP_FSYNC);
    eval 'sub CAP_FTRUNCATE () { &CAPRIGHT(0, 0x200);}' unless defined(&CAP_FTRUNCATE);
    eval 'sub CAP_LOOKUP () { &CAPRIGHT(0, 0x400);}' unless defined(&CAP_LOOKUP);
    eval 'sub CAP_FCHDIR () { &CAPRIGHT(0, 0x800);}' unless defined(&CAP_FCHDIR);
    eval 'sub CAP_FCHFLAGS () { &CAPRIGHT(0, 0x1000);}' unless defined(&CAP_FCHFLAGS);
    eval 'sub CAP_CHFLAGSAT () {( &CAP_FCHFLAGS |  &CAP_LOOKUP);}' unless defined(&CAP_CHFLAGSAT);
    eval 'sub CAP_FCHMOD () { &CAPRIGHT(0, 0x2000);}' unless defined(&CAP_FCHMOD);
    eval 'sub CAP_FCHMODAT () {( &CAP_FCHMOD |  &CAP_LOOKUP);}' unless defined(&CAP_FCHMODAT);
    eval 'sub CAP_FCHOWN () { &CAPRIGHT(0, 0x4000);}' unless defined(&CAP_FCHOWN);
    eval 'sub CAP_FCHOWNAT () {( &CAP_FCHOWN |  &CAP_LOOKUP);}' unless defined(&CAP_FCHOWNAT);
    eval 'sub CAP_FCNTL () { &CAPRIGHT(0, 0x8000);}' unless defined(&CAP_FCNTL);
    eval 'sub CAP_FLOCK () { &CAPRIGHT(0, 0x10000);}' unless defined(&CAP_FLOCK);
    eval 'sub CAP_FPATHCONF () { &CAPRIGHT(0, 0x20000);}' unless defined(&CAP_FPATHCONF);
    eval 'sub CAP_FSCK () { &CAPRIGHT(0, 0x40000);}' unless defined(&CAP_FSCK);
    eval 'sub CAP_FSTAT () { &CAPRIGHT(0, 0x80000);}' unless defined(&CAP_FSTAT);
    eval 'sub CAP_FSTATAT () {( &CAP_FSTAT |  &CAP_LOOKUP);}' unless defined(&CAP_FSTATAT);
    eval 'sub CAP_FSTATFS () { &CAPRIGHT(0, 0x100000);}' unless defined(&CAP_FSTATFS);
    eval 'sub CAP_FUTIMES () { &CAPRIGHT(0, 0x200000);}' unless defined(&CAP_FUTIMES);
    eval 'sub CAP_FUTIMESAT () {( &CAP_FUTIMES |  &CAP_LOOKUP);}' unless defined(&CAP_FUTIMESAT);
    eval 'sub CAP_LINKAT_TARGET () {( &CAP_LOOKUP | 0x400000);}' unless defined(&CAP_LINKAT_TARGET);
    eval 'sub CAP_MKDIRAT () {( &CAP_LOOKUP | 0x800000);}' unless defined(&CAP_MKDIRAT);
    eval 'sub CAP_MKFIFOAT () {( &CAP_LOOKUP | 0x1000000);}' unless defined(&CAP_MKFIFOAT);
    eval 'sub CAP_MKNODAT () {( &CAP_LOOKUP | 0x2000000);}' unless defined(&CAP_MKNODAT);
    eval 'sub CAP_RENAMEAT_SOURCE () {( &CAP_LOOKUP | 0x4000000);}' unless defined(&CAP_RENAMEAT_SOURCE);
    eval 'sub CAP_SYMLINKAT () {( &CAP_LOOKUP | 0x8000000);}' unless defined(&CAP_SYMLINKAT);
    eval 'sub CAP_UNLINKAT () {( &CAP_LOOKUP | 0x10000000);}' unless defined(&CAP_UNLINKAT);
    eval 'sub CAP_ACCEPT () { &CAPRIGHT(0, 0x20000000);}' unless defined(&CAP_ACCEPT);
    eval 'sub CAP_BIND () { &CAPRIGHT(0, 0x40000000);}' unless defined(&CAP_BIND);
    eval 'sub CAP_CONNECT () { &CAPRIGHT(0, 0x80000000);}' unless defined(&CAP_CONNECT);
    eval 'sub CAP_GETPEERNAME () { &CAPRIGHT(0, 0x100000000);}' unless defined(&CAP_GETPEERNAME);
    eval 'sub CAP_GETSOCKNAME () { &CAPRIGHT(0, 0x200000000);}' unless defined(&CAP_GETSOCKNAME);
    eval 'sub CAP_GETSOCKOPT () { &CAPRIGHT(0, 0x400000000);}' unless defined(&CAP_GETSOCKOPT);
    eval 'sub CAP_LISTEN () { &CAPRIGHT(0, 0x800000000);}' unless defined(&CAP_LISTEN);
    eval 'sub CAP_PEELOFF () { &CAPRIGHT(0, 0x1000000000);}' unless defined(&CAP_PEELOFF);
    eval 'sub CAP_RECV () { &CAP_READ;}' unless defined(&CAP_RECV);
    eval 'sub CAP_SEND () { &CAP_WRITE;}' unless defined(&CAP_SEND);
    eval 'sub CAP_SETSOCKOPT () { &CAPRIGHT(0, 0x2000000000);}' unless defined(&CAP_SETSOCKOPT);
    eval 'sub CAP_SHUTDOWN () { &CAPRIGHT(0, 0x4000000000);}' unless defined(&CAP_SHUTDOWN);
    eval 'sub CAP_BINDAT () {( &CAP_LOOKUP | 0x8000000000);}' unless defined(&CAP_BINDAT);
    eval 'sub CAP_CONNECTAT () {( &CAP_LOOKUP | 0x10000000000);}' unless defined(&CAP_CONNECTAT);
    eval 'sub CAP_LINKAT_SOURCE () {( &CAP_LOOKUP | 0x20000000000);}' unless defined(&CAP_LINKAT_SOURCE);
    eval 'sub CAP_RENAMEAT_TARGET () {( &CAP_LOOKUP | 0x40000000000);}' unless defined(&CAP_RENAMEAT_TARGET);
    eval 'sub CAP_SOCK_CLIENT () {( &CAP_CONNECT |  &CAP_GETPEERNAME |  &CAP_GETSOCKNAME |  &CAP_GETSOCKOPT |  &CAP_PEELOFF |  &CAP_RECV |  &CAP_SEND |  &CAP_SETSOCKOPT |  &CAP_SHUTDOWN);}' unless defined(&CAP_SOCK_CLIENT);
    eval 'sub CAP_SOCK_SERVER () {( &CAP_ACCEPT |  &CAP_BIND |  &CAP_GETPEERNAME |  &CAP_GETSOCKNAME |  &CAP_GETSOCKOPT |  &CAP_LISTEN |  &CAP_PEELOFF |  &CAP_RECV |  &CAP_SEND |  &CAP_SETSOCKOPT |  &CAP_SHUTDOWN);}' unless defined(&CAP_SOCK_SERVER);
    eval 'sub CAP_ALL0 () { &CAPRIGHT(0, 0x7ffffffffff);}' unless defined(&CAP_ALL0);
    eval 'sub CAP_UNUSED0_44 () { &CAPRIGHT(0, 0x80000000000);}' unless defined(&CAP_UNUSED0_44);
    eval 'sub CAP_UNUSED0_57 () { &CAPRIGHT(0, 0x100000000000000);}' unless defined(&CAP_UNUSED0_57);
    eval 'sub CAP_MAC_GET () { &CAPRIGHT(1, 0x1);}' unless defined(&CAP_MAC_GET);
    eval 'sub CAP_MAC_SET () { &CAPRIGHT(1, 0x2);}' unless defined(&CAP_MAC_SET);
    eval 'sub CAP_SEM_GETVALUE () { &CAPRIGHT(1, 0x4);}' unless defined(&CAP_SEM_GETVALUE);
    eval 'sub CAP_SEM_POST () { &CAPRIGHT(1, 0x8);}' unless defined(&CAP_SEM_POST);
    eval 'sub CAP_SEM_WAIT () { &CAPRIGHT(1, 0x10);}' unless defined(&CAP_SEM_WAIT);
    eval 'sub CAP_EVENT () { &CAPRIGHT(1, 0x20);}' unless defined(&CAP_EVENT);
    eval 'sub CAP_KQUEUE_EVENT () { &CAPRIGHT(1, 0x40);}' unless defined(&CAP_KQUEUE_EVENT);
    eval 'sub CAP_IOCTL () { &CAPRIGHT(1, 0x80);}' unless defined(&CAP_IOCTL);
    eval 'sub CAP_TTYHOOK () { &CAPRIGHT(1, 0x100);}' unless defined(&CAP_TTYHOOK);
    eval 'sub CAP_PDGETPID () { &CAPRIGHT(1, 0x200);}' unless defined(&CAP_PDGETPID);
    eval 'sub CAP_PDWAIT () { &CAPRIGHT(1, 0x400);}' unless defined(&CAP_PDWAIT);
    eval 'sub CAP_PDKILL () { &CAPRIGHT(1, 0x800);}' unless defined(&CAP_PDKILL);
    eval 'sub CAP_EXTATTR_DELETE () { &CAPRIGHT(1, 0x1000);}' unless defined(&CAP_EXTATTR_DELETE);
    eval 'sub CAP_EXTATTR_GET () { &CAPRIGHT(1, 0x2000);}' unless defined(&CAP_EXTATTR_GET);
    eval 'sub CAP_EXTATTR_LIST () { &CAPRIGHT(1, 0x4000);}' unless defined(&CAP_EXTATTR_LIST);
    eval 'sub CAP_EXTATTR_SET () { &CAPRIGHT(1, 0x8000);}' unless defined(&CAP_EXTATTR_SET);
    eval 'sub CAP_ACL_CHECK () { &CAPRIGHT(1, 0x10000);}' unless defined(&CAP_ACL_CHECK);
    eval 'sub CAP_ACL_DELETE () { &CAPRIGHT(1, 0x20000);}' unless defined(&CAP_ACL_DELETE);
    eval 'sub CAP_ACL_GET () { &CAPRIGHT(1, 0x40000);}' unless defined(&CAP_ACL_GET);
    eval 'sub CAP_ACL_SET () { &CAPRIGHT(1, 0x80000);}' unless defined(&CAP_ACL_SET);
    eval 'sub CAP_KQUEUE_CHANGE () { &CAPRIGHT(1, 0x100000);}' unless defined(&CAP_KQUEUE_CHANGE);
    eval 'sub CAP_KQUEUE () {( &CAP_KQUEUE_EVENT |  &CAP_KQUEUE_CHANGE);}' unless defined(&CAP_KQUEUE);
    eval 'sub CAP_ALL1 () { &CAPRIGHT(1, 0x1fffff);}' unless defined(&CAP_ALL1);
    eval 'sub CAP_UNUSED1_22 () { &CAPRIGHT(1, 0x200000);}' unless defined(&CAP_UNUSED1_22);
    eval 'sub CAP_UNUSED1_57 () { &CAPRIGHT(1, 0x100000000000000);}' unless defined(&CAP_UNUSED1_57);
    eval 'sub CAP_POLL_EVENT () { &CAP_EVENT;}' unless defined(&CAP_POLL_EVENT);
    eval 'sub CAP_ALL {
        my($rights) = @_;
	    eval q( &do { ($rights)-> $cr_rights[0] = (( &uint64_t) &CAP_RIGHTS_VERSION << 62) |  &CAP_ALL0; ($rights)-> $cr_rights[1] =  &CAP_ALL1; }  &while (0));
    }' unless defined(&CAP_ALL);
    eval 'sub CAP_NONE {
        my($rights) = @_;
	    eval q( &do { ($rights)-> $cr_rights[0] = (( &uint64_t) &CAP_RIGHTS_VERSION << 62) |  &CAPRIGHT(0, 0); ($rights)-> $cr_rights[1] =  &CAPRIGHT(1, 0); }  &while (0));
    }' unless defined(&CAP_NONE);
    eval 'sub CAPRVER {
        my($right) = @_;
	    eval q(((($right) >> 62)));
    }' unless defined(&CAPRVER);
    eval 'sub CAPVER {
        my($rights) = @_;
	    eval q( &CAPRVER(($rights)-> $cr_rights[0]));
    }' unless defined(&CAPVER);
    eval 'sub CAPARSIZE {
        my($rights) = @_;
	    eval q(( &CAPVER($rights) + 2));
    }' unless defined(&CAPARSIZE);
    eval 'sub CAPIDXBIT {
        my($right) = @_;
	    eval q((((($right) >> 57) & 0x1f)));
    }' unless defined(&CAPIDXBIT);
    eval 'sub CAP_FCNTL_GETFL () {(1<<  &F_GETFL);}' unless defined(&CAP_FCNTL_GETFL);
    eval 'sub CAP_FCNTL_SETFL () {(1<<  &F_SETFL);}' unless defined(&CAP_FCNTL_SETFL);
    eval 'sub CAP_FCNTL_GETOWN () {(1<<  &F_GETOWN);}' unless defined(&CAP_FCNTL_GETOWN);
    eval 'sub CAP_FCNTL_SETOWN () {(1<<  &F_SETOWN);}' unless defined(&CAP_FCNTL_SETOWN);
    eval 'sub CAP_FCNTL_ALL () {( &CAP_FCNTL_GETFL |  &CAP_FCNTL_SETFL |  &CAP_FCNTL_GETOWN |  &CAP_FCNTL_SETOWN);}' unless defined(&CAP_FCNTL_ALL);
    eval 'sub CAP_IOCTLS_ALL () { &SSIZE_MAX;}' unless defined(&CAP_IOCTLS_ALL);
    eval 'sub cap_rights_init () {(...)  &__cap_rights_init( &CAP_RIGHTS_VERSION,  &__VA_ARGS__, 0);}' unless defined(&cap_rights_init);
    eval 'sub cap_rights_set () {(...)  &__cap_rights_set( &__VA_ARGS__, 0);}' unless defined(&cap_rights_set);
    eval 'sub cap_rights_clear () {(...)  &__cap_rights_clear( &__VA_ARGS__, 0);}' unless defined(&cap_rights_clear);
    eval 'sub cap_rights_is_set () {(...)  &__cap_rights_is_set( &__VA_ARGS__, 0);}' unless defined(&cap_rights_is_set);
    if(defined(&_KERNEL)) {
	eval 'sub cap_rights_init_zero {
	    my($r) = @_;
    	    eval q(({  &cap_rights_t * &_r = ($r);  &CAP_NONE( &_r);  &_r; }));
	}' unless defined(&cap_rights_init_zero);
	eval 'sub cap_rights_init_one {
	    my($r, $right) = @_;
    	    eval q(({  &CTASSERT( &CAPRVER($right) ==  &CAP_RIGHTS_VERSION);  &cap_rights_t * &_r = ($r);  &CAP_NONE( &_r);  ($_$r->{c$r_rights[CAPIDXBIT($right) }- 1]) |= $right;  &_r; }));
	}' unless defined(&cap_rights_init_one);
	eval 'sub cap_rights_set_one {
	    my($r, $right) = @_;
    	    eval q(({  &CTASSERT( &CAPRVER($right) ==  &CAP_RIGHTS_VERSION);  &cap_rights_t * &_r = ($r);  ($_$r->{c$r_rights[CAPIDXBIT($right) }- 1]) |= $right;  &_r; }));
	}' unless defined(&cap_rights_set_one);
	eval 'sub cap_rights_contains () { &cap_rights_contains_transient;}' unless defined(&cap_rights_contains);
	eval 'sub cap_check_inline {
	    my($havep,$needp) = @_;
    	    eval q({  &if ( &__predict_false(! &cap_rights_contains($havep, $needp))) ( &cap_check_failed_notcapable($havep, $needp)); (0); });
	}' unless defined(&cap_check_inline);
	eval 'sub cap_check_inline_transient {
	    my($havep,$needp) = @_;
    	    eval q({  &if ( &__predict_false(! &cap_rights_contains($havep, $needp))) (1); (0); });
	}' unless defined(&cap_check_inline_transient);
    } else {
    }
    if(defined(&_KERNEL)) {
	require 'sys/systm.ph';
	eval 'sub IN_CAPABILITY_MODE {
	    my($td) = @_;
    	    eval q(((($td)-> ($td_ucred->{cr_flags}) &  &CRED_FLAG_CAPMODE) != 0));
	}' unless defined(&IN_CAPABILITY_MODE);
	eval 'sub cap_rights_fde_inline {
	    my($fdep) = @_;
    	    eval q((($fdep)-> &fde_rights));
	}' unless defined(&cap_rights_fde_inline);
    } else {
	eval 'sub cap_rights_get {
	    my($fd, $rights) = @_;
    	    eval q( &__cap_rights_get( &CAP_RIGHTS_VERSION, ($fd), ($rights)));
	}' unless defined(&cap_rights_get);
    }
}
1;

require '_h2ph_pre.ph';

no warnings qw(redefine misc);

unless(defined(&_LIBPROCSTAT_H_)) {
    eval 'sub _LIBPROCSTAT_H_ () {1;}' unless defined(&_LIBPROCSTAT_H_);
    unless(defined(&ZFS)) {
	require 'sys/elf.ph';
    }
    require 'sys/caprights.ph';
    eval 'sub PS_FST_VTYPE_VNON () {1;}' unless defined(&PS_FST_VTYPE_VNON);
    eval 'sub PS_FST_VTYPE_VREG () {2;}' unless defined(&PS_FST_VTYPE_VREG);
    eval 'sub PS_FST_VTYPE_VDIR () {3;}' unless defined(&PS_FST_VTYPE_VDIR);
    eval 'sub PS_FST_VTYPE_VBLK () {4;}' unless defined(&PS_FST_VTYPE_VBLK);
    eval 'sub PS_FST_VTYPE_VCHR () {5;}' unless defined(&PS_FST_VTYPE_VCHR);
    eval 'sub PS_FST_VTYPE_VLNK () {6;}' unless defined(&PS_FST_VTYPE_VLNK);
    eval 'sub PS_FST_VTYPE_VSOCK () {7;}' unless defined(&PS_FST_VTYPE_VSOCK);
    eval 'sub PS_FST_VTYPE_VFIFO () {8;}' unless defined(&PS_FST_VTYPE_VFIFO);
    eval 'sub PS_FST_VTYPE_VBAD () {9;}' unless defined(&PS_FST_VTYPE_VBAD);
    eval 'sub PS_FST_VTYPE_UNKNOWN () {255;}' unless defined(&PS_FST_VTYPE_UNKNOWN);
    eval 'sub PS_FST_TYPE_VNODE () {1;}' unless defined(&PS_FST_TYPE_VNODE);
    eval 'sub PS_FST_TYPE_FIFO () {2;}' unless defined(&PS_FST_TYPE_FIFO);
    eval 'sub PS_FST_TYPE_SOCKET () {3;}' unless defined(&PS_FST_TYPE_SOCKET);
    eval 'sub PS_FST_TYPE_PIPE () {4;}' unless defined(&PS_FST_TYPE_PIPE);
    eval 'sub PS_FST_TYPE_PTS () {5;}' unless defined(&PS_FST_TYPE_PTS);
    eval 'sub PS_FST_TYPE_KQUEUE () {6;}' unless defined(&PS_FST_TYPE_KQUEUE);
    eval 'sub PS_FST_TYPE_MQUEUE () {8;}' unless defined(&PS_FST_TYPE_MQUEUE);
    eval 'sub PS_FST_TYPE_SHM () {9;}' unless defined(&PS_FST_TYPE_SHM);
    eval 'sub PS_FST_TYPE_SEM () {10;}' unless defined(&PS_FST_TYPE_SEM);
    eval 'sub PS_FST_TYPE_UNKNOWN () {11;}' unless defined(&PS_FST_TYPE_UNKNOWN);
    eval 'sub PS_FST_TYPE_NONE () {12;}' unless defined(&PS_FST_TYPE_NONE);
    eval 'sub PS_FST_TYPE_PROCDESC () {13;}' unless defined(&PS_FST_TYPE_PROCDESC);
    eval 'sub PS_FST_TYPE_DEV () {14;}' unless defined(&PS_FST_TYPE_DEV);
    eval 'sub PS_FST_TYPE_EVENTFD () {15;}' unless defined(&PS_FST_TYPE_EVENTFD);
    eval 'sub PS_FST_UFLAG_RDIR () {0x1;}' unless defined(&PS_FST_UFLAG_RDIR);
    eval 'sub PS_FST_UFLAG_CDIR () {0x2;}' unless defined(&PS_FST_UFLAG_CDIR);
    eval 'sub PS_FST_UFLAG_JAIL () {0x4;}' unless defined(&PS_FST_UFLAG_JAIL);
    eval 'sub PS_FST_UFLAG_TRACE () {0x8;}' unless defined(&PS_FST_UFLAG_TRACE);
    eval 'sub PS_FST_UFLAG_TEXT () {0x10;}' unless defined(&PS_FST_UFLAG_TEXT);
    eval 'sub PS_FST_UFLAG_MMAP () {0x20;}' unless defined(&PS_FST_UFLAG_MMAP);
    eval 'sub PS_FST_UFLAG_CTTY () {0x40;}' unless defined(&PS_FST_UFLAG_CTTY);
    eval 'sub PS_FST_FFLAG_READ () {0x1;}' unless defined(&PS_FST_FFLAG_READ);
    eval 'sub PS_FST_FFLAG_WRITE () {0x2;}' unless defined(&PS_FST_FFLAG_WRITE);
    eval 'sub PS_FST_FFLAG_NONBLOCK () {0x4;}' unless defined(&PS_FST_FFLAG_NONBLOCK);
    eval 'sub PS_FST_FFLAG_APPEND () {0x8;}' unless defined(&PS_FST_FFLAG_APPEND);
    eval 'sub PS_FST_FFLAG_SHLOCK () {0x10;}' unless defined(&PS_FST_FFLAG_SHLOCK);
    eval 'sub PS_FST_FFLAG_EXLOCK () {0x20;}' unless defined(&PS_FST_FFLAG_EXLOCK);
    eval 'sub PS_FST_FFLAG_ASYNC () {0x40;}' unless defined(&PS_FST_FFLAG_ASYNC);
    eval 'sub PS_FST_FFLAG_SYNC () {0x80;}' unless defined(&PS_FST_FFLAG_SYNC);
    eval 'sub PS_FST_FFLAG_NOFOLLOW () {0x100;}' unless defined(&PS_FST_FFLAG_NOFOLLOW);
    eval 'sub PS_FST_FFLAG_CREAT () {0x200;}' unless defined(&PS_FST_FFLAG_CREAT);
    eval 'sub PS_FST_FFLAG_TRUNC () {0x400;}' unless defined(&PS_FST_FFLAG_TRUNC);
    eval 'sub PS_FST_FFLAG_EXCL () {0x800;}' unless defined(&PS_FST_FFLAG_EXCL);
    eval 'sub PS_FST_FFLAG_DIRECT () {0x1000;}' unless defined(&PS_FST_FFLAG_DIRECT);
    eval 'sub PS_FST_FFLAG_EXEC () {0x2000;}' unless defined(&PS_FST_FFLAG_EXEC);
    eval 'sub PS_FST_FFLAG_HASLOCK () {0x4000;}' unless defined(&PS_FST_FFLAG_HASLOCK);
    if(!defined(&__ILP32__)  && !defined(&__riscv)) {
	eval 'sub PS_ARCH_HAS_FREEBSD32 () {1;}' unless defined(&PS_ARCH_HAS_FREEBSD32);
    }
    eval 'sub PS_ADVLOCK_RO () {0x1;}' unless defined(&PS_ADVLOCK_RO);
    eval 'sub PS_ADVLOCK_RW () {0x2;}' unless defined(&PS_ADVLOCK_RW);
    eval 'sub PS_ADVLOCK_TYPE_FLOCK () {0x1;}' unless defined(&PS_ADVLOCK_TYPE_FLOCK);
    eval 'sub PS_ADVLOCK_TYPE_PID () {0x2;}' unless defined(&PS_ADVLOCK_TYPE_PID);
    eval 'sub PS_ADVLOCK_TYPE_REMOTE () {0x3;}' unless defined(&PS_ADVLOCK_TYPE_REMOTE);
    unless(defined(&ZFS)) {
    }
    unless(defined(&ZFS)) {
    }
}
1;

require '_h2ph_pre.ph';

no warnings qw(redefine misc);

unless(defined(&_SYS_USER_H_)) {
    eval 'sub _SYS_USER_H_ () {1;}' unless defined(&_SYS_USER_H_);
    require 'machine/pcb.ph';
    unless(defined(&_KERNEL)) {
	require 'sys/errno.ph';
	require 'sys/time.ph';
	require 'sys/resource.ph';
	require 'sys/ucred.ph';
	require 'sys/uio.ph';
	require 'sys/queue.ph';
	require 'sys/_lock.ph';
	require 'sys/_mutex.ph';
	require 'sys/proc.ph';
	require 'vm/vm.ph';
	require 'vm/vm_param.ph';
	require 'vm/pmap.ph';
	require 'vm/vm_map.ph';
    }
    unless(defined(&_SYS_RESOURCEVAR_H_)) {
	require 'sys/resourcevar.ph';
    }
    unless(defined(&_SYS_SIGNALVAR_H_)) {
	require 'sys/signalvar.ph';
    }
    unless(defined(&_SYS_SOCKET_VAR_H_)) {
	require 'sys/socket.ph';
    }
    require 'sys/caprights.ph';
    eval 'sub KI_NSPARE_INT () {2;}' unless defined(&KI_NSPARE_INT);
    eval 'sub KI_NSPARE_LONG () {12;}' unless defined(&KI_NSPARE_LONG);
    eval 'sub KI_NSPARE_PTR () {5;}' unless defined(&KI_NSPARE_PTR);
    unless(defined(&_KERNEL)) {
	unless(defined(&KINFO_PROC_SIZE)) {
	    die("Unknown architecture");
	}
    }
    eval 'sub WMESGLEN () {8;}' unless defined(&WMESGLEN);
    eval 'sub LOCKNAMELEN () {8;}' unless defined(&LOCKNAMELEN);
    eval 'sub TDNAMLEN () {16;}' unless defined(&TDNAMLEN);
    eval 'sub COMMLEN () {19;}' unless defined(&COMMLEN);
    eval 'sub KI_EMULNAMELEN () {16;}' unless defined(&KI_EMULNAMELEN);
    eval 'sub KI_NGROUPS () {16;}' unless defined(&KI_NGROUPS);
    eval 'sub LOGNAMELEN () {17;}' unless defined(&LOGNAMELEN);
    eval 'sub LOGINCLASSLEN () {17;}' unless defined(&LOGINCLASSLEN);
    unless(defined(&BURN_BRIDGES)) {
	eval 'sub OCOMMLEN () { &TDNAMLEN;}' unless defined(&OCOMMLEN);
	eval 'sub ki_ocomm () { &ki_tdname;}' unless defined(&ki_ocomm);
    }
    eval 'sub KI_CRF_CAPABILITY_MODE () {0x1;}' unless defined(&KI_CRF_CAPABILITY_MODE);
    eval 'sub KI_CRF_GRP_OVERFLOW () {0x80000000;}' unless defined(&KI_CRF_GRP_OVERFLOW);
    eval 'sub ki_childstime () { ($ki_rusage_ch->{ru_stime});}' unless defined(&ki_childstime);
    eval 'sub ki_childutime () { ($ki_rusage_ch->{ru_utime});}' unless defined(&ki_childutime);
    eval 'sub PS_INMEM () {0x1;}' unless defined(&PS_INMEM);
    eval 'sub KI_CTTY () {0x1;}' unless defined(&KI_CTTY);
    eval 'sub KI_SLEADER () {0x2;}' unless defined(&KI_SLEADER);
    eval 'sub KI_LOCKBLOCK () {0x4;}' unless defined(&KI_LOCKBLOCK);
    eval 'sub KF_ATTR_VALID () {0x1;}' unless defined(&KF_ATTR_VALID);
    eval 'sub KF_TYPE_NONE () {0;}' unless defined(&KF_TYPE_NONE);
    eval 'sub KF_TYPE_VNODE () {1;}' unless defined(&KF_TYPE_VNODE);
    eval 'sub KF_TYPE_SOCKET () {2;}' unless defined(&KF_TYPE_SOCKET);
    eval 'sub KF_TYPE_PIPE () {3;}' unless defined(&KF_TYPE_PIPE);
    eval 'sub KF_TYPE_FIFO () {4;}' unless defined(&KF_TYPE_FIFO);
    eval 'sub KF_TYPE_KQUEUE () {5;}' unless defined(&KF_TYPE_KQUEUE);
    eval 'sub KF_TYPE_MQUEUE () {7;}' unless defined(&KF_TYPE_MQUEUE);
    eval 'sub KF_TYPE_SHM () {8;}' unless defined(&KF_TYPE_SHM);
    eval 'sub KF_TYPE_SEM () {9;}' unless defined(&KF_TYPE_SEM);
    eval 'sub KF_TYPE_PTS () {10;}' unless defined(&KF_TYPE_PTS);
    eval 'sub KF_TYPE_PROCDESC () {11;}' unless defined(&KF_TYPE_PROCDESC);
    eval 'sub KF_TYPE_DEV () {12;}' unless defined(&KF_TYPE_DEV);
    eval 'sub KF_TYPE_EVENTFD () {13;}' unless defined(&KF_TYPE_EVENTFD);
    eval 'sub KF_TYPE_TIMERFD () {14;}' unless defined(&KF_TYPE_TIMERFD);
    eval 'sub KF_TYPE_UNKNOWN () {255;}' unless defined(&KF_TYPE_UNKNOWN);
    eval 'sub KF_VTYPE_VNON () {0;}' unless defined(&KF_VTYPE_VNON);
    eval 'sub KF_VTYPE_VREG () {1;}' unless defined(&KF_VTYPE_VREG);
    eval 'sub KF_VTYPE_VDIR () {2;}' unless defined(&KF_VTYPE_VDIR);
    eval 'sub KF_VTYPE_VBLK () {3;}' unless defined(&KF_VTYPE_VBLK);
    eval 'sub KF_VTYPE_VCHR () {4;}' unless defined(&KF_VTYPE_VCHR);
    eval 'sub KF_VTYPE_VLNK () {5;}' unless defined(&KF_VTYPE_VLNK);
    eval 'sub KF_VTYPE_VSOCK () {6;}' unless defined(&KF_VTYPE_VSOCK);
    eval 'sub KF_VTYPE_VFIFO () {7;}' unless defined(&KF_VTYPE_VFIFO);
    eval 'sub KF_VTYPE_VBAD () {8;}' unless defined(&KF_VTYPE_VBAD);
    eval 'sub KF_VTYPE_UNKNOWN () {255;}' unless defined(&KF_VTYPE_UNKNOWN);
    eval 'sub KF_FD_TYPE_CWD () {-1;}' unless defined(&KF_FD_TYPE_CWD);
    eval 'sub KF_FD_TYPE_ROOT () {-2;}' unless defined(&KF_FD_TYPE_ROOT);
    eval 'sub KF_FD_TYPE_JAIL () {-3;}' unless defined(&KF_FD_TYPE_JAIL);
    eval 'sub KF_FD_TYPE_TRACE () {-4;}' unless defined(&KF_FD_TYPE_TRACE);
    eval 'sub KF_FD_TYPE_TEXT () {-5;}' unless defined(&KF_FD_TYPE_TEXT);
    eval 'sub KF_FD_TYPE_CTTY () {-6;}' unless defined(&KF_FD_TYPE_CTTY);
    eval 'sub KF_FLAG_READ () {0x1;}' unless defined(&KF_FLAG_READ);
    eval 'sub KF_FLAG_WRITE () {0x2;}' unless defined(&KF_FLAG_WRITE);
    eval 'sub KF_FLAG_APPEND () {0x4;}' unless defined(&KF_FLAG_APPEND);
    eval 'sub KF_FLAG_ASYNC () {0x8;}' unless defined(&KF_FLAG_ASYNC);
    eval 'sub KF_FLAG_FSYNC () {0x10;}' unless defined(&KF_FLAG_FSYNC);
    eval 'sub KF_FLAG_NONBLOCK () {0x20;}' unless defined(&KF_FLAG_NONBLOCK);
    eval 'sub KF_FLAG_DIRECT () {0x40;}' unless defined(&KF_FLAG_DIRECT);
    eval 'sub KF_FLAG_HASLOCK () {0x80;}' unless defined(&KF_FLAG_HASLOCK);
    eval 'sub KF_FLAG_SHLOCK () {0x100;}' unless defined(&KF_FLAG_SHLOCK);
    eval 'sub KF_FLAG_EXLOCK () {0x200;}' unless defined(&KF_FLAG_EXLOCK);
    eval 'sub KF_FLAG_NOFOLLOW () {0x400;}' unless defined(&KF_FLAG_NOFOLLOW);
    eval 'sub KF_FLAG_CREAT () {0x800;}' unless defined(&KF_FLAG_CREAT);
    eval 'sub KF_FLAG_TRUNC () {0x1000;}' unless defined(&KF_FLAG_TRUNC);
    eval 'sub KF_FLAG_EXCL () {0x2000;}' unless defined(&KF_FLAG_EXCL);
    eval 'sub KF_FLAG_EXEC () {0x4000;}' unless defined(&KF_FLAG_EXEC);
    if(defined(&__amd64__)) {
	eval 'sub KINFO_OFILE_SIZE () {1328;}' unless defined(&KINFO_OFILE_SIZE);
    }
    if(defined(&__i386__)) {
	eval 'sub KINFO_OFILE_SIZE () {1324;}' unless defined(&KINFO_OFILE_SIZE);
    }
    if(defined(&__amd64__) || defined(&__i386__)) {
	eval 'sub KINFO_FILE_SIZE () {1392;}' unless defined(&KINFO_FILE_SIZE);
    }
    eval 'sub KLOCKF_RW_READ () {0x1;}' unless defined(&KLOCKF_RW_READ);
    eval 'sub KLOCKF_RW_WRITE () {0x2;}' unless defined(&KLOCKF_RW_WRITE);
    eval 'sub KLOCKF_TYPE_FLOCK () {0x1;}' unless defined(&KLOCKF_TYPE_FLOCK);
    eval 'sub KLOCKF_TYPE_PID () {0x2;}' unless defined(&KLOCKF_TYPE_PID);
    eval 'sub KLOCKF_TYPE_REMOTE () {0x3;}' unless defined(&KLOCKF_TYPE_REMOTE);
    eval 'sub KVME_TYPE_NONE () {0;}' unless defined(&KVME_TYPE_NONE);
    eval 'sub KVME_TYPE_DEFAULT () {1;}' unless defined(&KVME_TYPE_DEFAULT);
    eval 'sub KVME_TYPE_VNODE () {2;}' unless defined(&KVME_TYPE_VNODE);
    eval 'sub KVME_TYPE_SWAP () {3;}' unless defined(&KVME_TYPE_SWAP);
    eval 'sub KVME_TYPE_DEVICE () {4;}' unless defined(&KVME_TYPE_DEVICE);
    eval 'sub KVME_TYPE_PHYS () {5;}' unless defined(&KVME_TYPE_PHYS);
    eval 'sub KVME_TYPE_DEAD () {6;}' unless defined(&KVME_TYPE_DEAD);
    eval 'sub KVME_TYPE_SG () {7;}' unless defined(&KVME_TYPE_SG);
    eval 'sub KVME_TYPE_MGTDEVICE () {8;}' unless defined(&KVME_TYPE_MGTDEVICE);
    eval 'sub KVME_TYPE_GUARD () {9;}' unless defined(&KVME_TYPE_GUARD);
    eval 'sub KVME_TYPE_UNKNOWN () {255;}' unless defined(&KVME_TYPE_UNKNOWN);
    eval 'sub KVME_PROT_READ () {0x1;}' unless defined(&KVME_PROT_READ);
    eval 'sub KVME_PROT_WRITE () {0x2;}' unless defined(&KVME_PROT_WRITE);
    eval 'sub KVME_PROT_EXEC () {0x4;}' unless defined(&KVME_PROT_EXEC);
    eval 'sub KVME_FLAG_COW () {0x1;}' unless defined(&KVME_FLAG_COW);
    eval 'sub KVME_FLAG_NEEDS_COPY () {0x2;}' unless defined(&KVME_FLAG_NEEDS_COPY);
    eval 'sub KVME_FLAG_NOCOREDUMP () {0x4;}' unless defined(&KVME_FLAG_NOCOREDUMP);
    eval 'sub KVME_FLAG_SUPER () {0x8;}' unless defined(&KVME_FLAG_SUPER);
    eval 'sub KVME_FLAG_GROWS_UP () {0x10;}' unless defined(&KVME_FLAG_GROWS_UP);
    eval 'sub KVME_FLAG_GROWS_DOWN () {0x20;}' unless defined(&KVME_FLAG_GROWS_DOWN);
    eval 'sub KVME_FLAG_USER_WIRED () {0x40;}' unless defined(&KVME_FLAG_USER_WIRED);
    if(defined(&__amd64__)) {
	eval 'sub KINFO_OVMENTRY_SIZE () {1168;}' unless defined(&KINFO_OVMENTRY_SIZE);
    }
    if(defined(&__i386__)) {
	eval 'sub KINFO_OVMENTRY_SIZE () {1128;}' unless defined(&KINFO_OVMENTRY_SIZE);
    }
    if(defined(&__amd64__) || defined(&__i386__)) {
	eval 'sub KINFO_VMENTRY_SIZE () {1160;}' unless defined(&KINFO_VMENTRY_SIZE);
    }
    eval 'sub kve_vn_fsid () { ($kve_type_spec->{_kve_vn_fsid});}' unless defined(&kve_vn_fsid);
    eval 'sub kve_obj () { ($kve_type_spec->{_kve_obj});}' unless defined(&kve_obj);
    eval 'sub kvo_vn_fsid () { ($kvo_type_spec->{_kvo_vn_fsid});}' unless defined(&kvo_vn_fsid);
    eval 'sub kvo_backing_obj () { ($kvo_type_spec->{_kvo_backing_obj});}' unless defined(&kvo_backing_obj);
    eval 'sub KKST_MAXLEN () {1024;}' unless defined(&KKST_MAXLEN);
    eval 'sub KKST_STATE_STACKOK () {0;}' unless defined(&KKST_STATE_STACKOK);
    eval 'sub KKST_STATE_SWAPPED () {1;}' unless defined(&KKST_STATE_SWAPPED);
    eval 'sub KKST_STATE_RUNNING () {2;}' unless defined(&KKST_STATE_RUNNING);
    if(defined(&__amd64__) || defined(&__i386__)) {
	eval 'sub KINFO_KSTACK_SIZE () {1096;}' unless defined(&KINFO_KSTACK_SIZE);
    }
    eval 'sub KMAP_FLAG_WIREFUTURE () {0x1;}' unless defined(&KMAP_FLAG_WIREFUTURE);
    eval 'sub KMAP_FLAG_ASLR () {0x2;}' unless defined(&KMAP_FLAG_ASLR);
    eval 'sub KMAP_FLAG_ASLR_IGNSTART () {0x4;}' unless defined(&KMAP_FLAG_ASLR_IGNSTART);
    eval 'sub KMAP_FLAG_WXORX () {0x8;}' unless defined(&KMAP_FLAG_WXORX);
    eval 'sub KMAP_FLAG_ASLR_STACK () {0x10;}' unless defined(&KMAP_FLAG_ASLR_STACK);
    eval 'sub KMAP_FLAG_ASLR_SHARED_PAGE () {0x20;}' unless defined(&KMAP_FLAG_ASLR_SHARED_PAGE);
    if(defined(&_KERNEL)) {
	eval 'sub KERN_PROC_NOTHREADS () {0x1;}' unless defined(&KERN_PROC_NOTHREADS);
	eval 'sub KERN_PROC_MASK32 () {0x2;}' unless defined(&KERN_PROC_MASK32);
	eval 'sub KERN_FILEDESC_PACK_KINFO () {0x1;}' unless defined(&KERN_FILEDESC_PACK_KINFO);
	eval 'sub KERN_VMMAP_PACK_KINFO () {0x1;}' unless defined(&KERN_VMMAP_PACK_KINFO);
    }
}
1;

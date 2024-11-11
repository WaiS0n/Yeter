require '_h2ph_pre.ph';

no warnings qw(redefine misc);

unless(defined(&_SYS_MOUNT_H_)) {
    eval 'sub _SYS_MOUNT_H_ () {1;}' unless defined(&_SYS_MOUNT_H_);
    require 'sys/ucred.ph';
    require 'sys/queue.ph';
    if(defined(&_KERNEL)) {
	require 'sys/types.ph';
	require 'sys/lock.ph';
	require 'sys/lockmgr.ph';
	require 'sys/tslog.ph';
	require 'sys/_mutex.ph';
	require 'sys/_sx.ph';
    }
    eval 'sub MAXFIDSZ () {16;}' unless defined(&MAXFIDSZ);
    eval 'sub MFSNAMELEN () {16;}' unless defined(&MFSNAMELEN);
    eval 'sub MNAMELEN () {1024;}' unless defined(&MNAMELEN);
    eval 'sub STATFS_VERSION () {0x20140518;}' unless defined(&STATFS_VERSION);
    if(defined(&_WANT_FREEBSD11_STATFS) || defined(&_KERNEL)) {
	eval 'sub FREEBSD11_STATFS_VERSION () {0x20030518;}' unless defined(&FREEBSD11_STATFS_VERSION);
    }
    if(defined(&_KERNEL)) {
	eval 'sub OMFSNAMELEN () {16;}' unless defined(&OMFSNAMELEN);
	eval 'sub OMNAMELEN () {(88- 2* $sizeof{\'long\'});}' unless defined(&OMNAMELEN);
    }
    if(defined(&_WANT_MOUNT) || defined(&_KERNEL)) {
	eval 'sub mnt_startzero () { &mnt_list;}' unless defined(&mnt_startzero);
	eval 'sub mnt_endzero () { &mnt_gjprovider;}' unless defined(&mnt_endzero);
    }
    if(defined(&_KERNEL)) {
	eval 'sub MNT_VNODE_FOREACH_ALL {
	    my($vp, $mp, $mvp) = @_;
    	    eval q( &for ($vp =  &__mnt_vnode_first_all(($mvp), ($mp)); ($vp) !=  &NULL; $vp =  &__mnt_vnode_next_all(($mvp), ($mp))));
	}' unless defined(&MNT_VNODE_FOREACH_ALL);
	eval 'sub MNT_VNODE_FOREACH_ALL_ABORT {
	    my($mp, $mvp) = @_;
    	    eval q( &do {  &MNT_ILOCK($mp);  &__mnt_vnode_markerfree_all(($mvp), ($mp));  &mtx_assert( &MNT_MTX($mp),  &MA_NOTOWNED); }  &while (0));
	}' unless defined(&MNT_VNODE_FOREACH_ALL_ABORT);
	eval 'sub MNT_VNODE_FOREACH_LAZY {
	    my($vp, $mp, $mvp, $cb, $cbarg) = @_;
    	    eval q( &for ($vp =  &__mnt_vnode_first_lazy(($mvp), ($mp), ($cb), ($cbarg)); ($vp) !=  &NULL; $vp =  &__mnt_vnode_next_lazy(($mvp), ($mp), ($cb), ($cbarg))));
	}' unless defined(&MNT_VNODE_FOREACH_LAZY);
	eval 'sub MNT_VNODE_FOREACH_LAZY_ABORT {
	    my($mp, $mvp) = @_;
    	    eval q( &__mnt_vnode_markerfree_lazy(($mvp), ($mp)));
	}' unless defined(&MNT_VNODE_FOREACH_LAZY_ABORT);
	eval 'sub MNT_ILOCK {
	    my($mp) = @_;
    	    eval q( &mtx_lock(($mp)-> &mnt_mtx));
	}' unless defined(&MNT_ILOCK);
	eval 'sub MNT_ITRYLOCK {
	    my($mp) = @_;
    	    eval q( &mtx_trylock(($mp)-> &mnt_mtx));
	}' unless defined(&MNT_ITRYLOCK);
	eval 'sub MNT_IUNLOCK {
	    my($mp) = @_;
    	    eval q( &mtx_unlock(($mp)-> &mnt_mtx));
	}' unless defined(&MNT_IUNLOCK);
	eval 'sub MNT_MTX {
	    my($mp) = @_;
    	    eval q((($mp)-> &mnt_mtx));
	}' unless defined(&MNT_MTX);
	eval 'sub MNT_REF {
	    my($mp) = @_;
    	    eval q( &do {  &mtx_assert( &MNT_MTX($mp),  &MA_OWNED);  ($mp->{mnt_ref})++; }  &while (0));
	}' unless defined(&MNT_REF);
	eval 'sub MNT_REL {
	    my($mp) = @_;
    	    eval q( &do {  &mtx_assert( &MNT_MTX($mp),  &MA_OWNED); ($mp)-> &mnt_ref--;  &if (($mp)-> &mnt_vfs_ops  && ($mp)-> &mnt_ref < 0)  &vfs_dump_mount_counters($mp);  &if (($mp)-> &mnt_ref == 0 && ($mp)-> &mnt_vfs_ops)  &wakeup(($mp)); }  &while (0));
	}' unless defined(&MNT_REL);
    }
    if(defined(&_WANT_MNTOPTNAMES) || defined(&_KERNEL)) {
	eval 'sub MNTOPT_NAMES () {{  &MNT_ASYNC, "asynchronous" }, {  &MNT_EXPORTED, "NFS exported" }, {  &MNT_LOCAL, "local" }, {  &MNT_NOATIME, "noatime" }, {  &MNT_NOEXEC, "noexec" }, {  &MNT_NOSUID, "nosuid" }, {  &MNT_NOSYMFOLLOW, "nosymfollow" }, {  &MNT_QUOTA, "with quotas" }, {  &MNT_RDONLY, "read-only" }, {  &MNT_SYNCHRONOUS, "synchronous" }, {  &MNT_UNION, "union" }, {  &MNT_NOCLUSTERR, "noclusterr" }, {  &MNT_NOCLUSTERW, "noclusterw" }, {  &MNT_SUIDDIR, "suiddir" }, {  &MNT_SOFTDEP, "soft-updates" }, {  &MNT_SUJ, "journaled soft-updates" }, {  &MNT_MULTILABEL, "multilabel" }, {  &MNT_ACLS, "acls" }, {  &MNT_NFS4ACLS, "nfsv4acls" }, {  &MNT_GJOURNAL, "gjournal" }, {  &MNT_AUTOMOUNTED, "automounted" }, {  &MNT_VERIFIED, "verified" }, {  &MNT_UNTRUSTED, "untrusted" }, {  &MNT_NOCOVER, "nocover" }, {  &MNT_EMPTYDIR, "emptydir" }, {  &MNT_UPDATE, "update" }, {  &MNT_DELEXPORT, "delexport" }, {  &MNT_RELOAD, "reload" }, {  &MNT_FORCE, "force" }, {  &MNT_SNAPSHOT, "snapshot" }, { 0,  &NULL };}' unless defined(&MNTOPT_NAMES);
    }
    eval 'sub MNT_RDONLY () {0x1;}' unless defined(&MNT_RDONLY);
    eval 'sub MNT_SYNCHRONOUS () {0x2;}' unless defined(&MNT_SYNCHRONOUS);
    eval 'sub MNT_NOEXEC () {0x4;}' unless defined(&MNT_NOEXEC);
    eval 'sub MNT_NOSUID () {0x8;}' unless defined(&MNT_NOSUID);
    eval 'sub MNT_NFS4ACLS () {0x10;}' unless defined(&MNT_NFS4ACLS);
    eval 'sub MNT_UNION () {0x20;}' unless defined(&MNT_UNION);
    eval 'sub MNT_ASYNC () {0x40;}' unless defined(&MNT_ASYNC);
    eval 'sub MNT_SUIDDIR () {0x100000;}' unless defined(&MNT_SUIDDIR);
    eval 'sub MNT_SOFTDEP () {0x200000;}' unless defined(&MNT_SOFTDEP);
    eval 'sub MNT_NOSYMFOLLOW () {0x400000;}' unless defined(&MNT_NOSYMFOLLOW);
    eval 'sub MNT_GJOURNAL () {0x2000000;}' unless defined(&MNT_GJOURNAL);
    eval 'sub MNT_MULTILABEL () {0x4000000;}' unless defined(&MNT_MULTILABEL);
    eval 'sub MNT_ACLS () {0x8000000;}' unless defined(&MNT_ACLS);
    eval 'sub MNT_NOATIME () {0x10000000;}' unless defined(&MNT_NOATIME);
    eval 'sub MNT_NOCLUSTERR () {0x40000000;}' unless defined(&MNT_NOCLUSTERR);
    eval 'sub MNT_NOCLUSTERW () {0x80000000;}' unless defined(&MNT_NOCLUSTERW);
    eval 'sub MNT_SUJ () {0x100000000;}' unless defined(&MNT_SUJ);
    eval 'sub MNT_AUTOMOUNTED () {0x200000000;}' unless defined(&MNT_AUTOMOUNTED);
    eval 'sub MNT_UNTRUSTED () {0x800000000;}' unless defined(&MNT_UNTRUSTED);
    eval 'sub MNT_EXRDONLY () {0x80;}' unless defined(&MNT_EXRDONLY);
    eval 'sub MNT_EXPORTED () {0x100;}' unless defined(&MNT_EXPORTED);
    eval 'sub MNT_DEFEXPORTED () {0x200;}' unless defined(&MNT_DEFEXPORTED);
    eval 'sub MNT_EXPORTANON () {0x400;}' unless defined(&MNT_EXPORTANON);
    eval 'sub MNT_EXKERB () {0x800;}' unless defined(&MNT_EXKERB);
    eval 'sub MNT_EXPUBLIC () {0x20000000;}' unless defined(&MNT_EXPUBLIC);
    eval 'sub MNT_EXTLS () {0x4000000000;}' unless defined(&MNT_EXTLS);
    eval 'sub MNT_EXTLSCERT () {0x8000000000;}' unless defined(&MNT_EXTLSCERT);
    eval 'sub MNT_EXTLSCERTUSER () {0x10000000000;}' unless defined(&MNT_EXTLSCERTUSER);
    eval 'sub MNT_LOCAL () {0x1000;}' unless defined(&MNT_LOCAL);
    eval 'sub MNT_QUOTA () {0x2000;}' unless defined(&MNT_QUOTA);
    eval 'sub MNT_ROOTFS () {0x4000;}' unless defined(&MNT_ROOTFS);
    eval 'sub MNT_USER () {0x8000;}' unless defined(&MNT_USER);
    eval 'sub MNT_IGNORE () {0x800000;}' unless defined(&MNT_IGNORE);
    eval 'sub MNT_VERIFIED () {0x400000000;}' unless defined(&MNT_VERIFIED);
    eval 'sub MNT_VISFLAGMASK () {( &MNT_RDONLY |  &MNT_SYNCHRONOUS |  &MNT_NOEXEC |  &MNT_NOSUID |  &MNT_UNION |  &MNT_SUJ |  &MNT_ASYNC |  &MNT_EXRDONLY |  &MNT_EXPORTED |  &MNT_DEFEXPORTED |  &MNT_EXPORTANON|  &MNT_EXKERB |  &MNT_LOCAL |  &MNT_USER |  &MNT_QUOTA |  &MNT_ROOTFS |  &MNT_NOATIME |  &MNT_NOCLUSTERR|  &MNT_NOCLUSTERW |  &MNT_SUIDDIR |  &MNT_SOFTDEP |  &MNT_IGNORE |  &MNT_EXPUBLIC |  &MNT_NOSYMFOLLOW |  &MNT_GJOURNAL |  &MNT_MULTILABEL |  &MNT_ACLS |  &MNT_NFS4ACLS |  &MNT_AUTOMOUNTED |  &MNT_VERIFIED |  &MNT_UNTRUSTED);}' unless defined(&MNT_VISFLAGMASK);
    eval 'sub MNT_UPDATEMASK () {( &MNT_NOSUID |  &MNT_NOEXEC |  &MNT_SYNCHRONOUS |  &MNT_UNION |  &MNT_ASYNC |  &MNT_NOATIME |  &MNT_NOSYMFOLLOW |  &MNT_IGNORE |  &MNT_NOCLUSTERR |  &MNT_NOCLUSTERW |  &MNT_SUIDDIR |  &MNT_ACLS |  &MNT_USER |  &MNT_NFS4ACLS |  &MNT_AUTOMOUNTED |  &MNT_UNTRUSTED);}' unless defined(&MNT_UPDATEMASK);
    eval 'sub MNT_UPDATE () {0x10000;}' unless defined(&MNT_UPDATE);
    eval 'sub MNT_DELEXPORT () {0x20000;}' unless defined(&MNT_DELEXPORT);
    eval 'sub MNT_RELOAD () {0x40000;}' unless defined(&MNT_RELOAD);
    eval 'sub MNT_FORCE () {0x80000;}' unless defined(&MNT_FORCE);
    eval 'sub MNT_SNAPSHOT () {0x1000000;}' unless defined(&MNT_SNAPSHOT);
    eval 'sub MNT_NONBUSY () {0x4000000;}' unless defined(&MNT_NONBUSY);
    eval 'sub MNT_BYFSID () {0x8000000;}' unless defined(&MNT_BYFSID);
    eval 'sub MNT_NOCOVER () {0x1000000000;}' unless defined(&MNT_NOCOVER);
    eval 'sub MNT_EMPTYDIR () {0x2000000000;}' unless defined(&MNT_EMPTYDIR);
    eval 'sub MNT_RECURSE () {0x100000000000;}' unless defined(&MNT_RECURSE);
    eval 'sub MNT_DEFERRED () {0x200000000000;}' unless defined(&MNT_DEFERRED);
    eval 'sub MNT_CMDFLAGS () {( &MNT_UPDATE |  &MNT_DELEXPORT |  &MNT_RELOAD |  &MNT_FORCE |  &MNT_SNAPSHOT |  &MNT_NONBUSY |  &MNT_BYFSID |  &MNT_NOCOVER |  &MNT_EMPTYDIR |  &MNT_RECURSE |  &MNT_DEFERRED);}' unless defined(&MNT_CMDFLAGS);
    eval 'sub MNTK_UNMOUNTF () {0x1;}' unless defined(&MNTK_UNMOUNTF);
    eval 'sub MNTK_ASYNC () {0x2;}' unless defined(&MNTK_ASYNC);
    eval 'sub MNTK_SOFTDEP () {0x4;}' unless defined(&MNTK_SOFTDEP);
    eval 'sub MNTK_NOMSYNC () {0x8;}' unless defined(&MNTK_NOMSYNC);
    eval 'sub MNTK_DRAINING () {0x10;}' unless defined(&MNTK_DRAINING);
    eval 'sub MNTK_REFEXPIRE () {0x20;}' unless defined(&MNTK_REFEXPIRE);
    eval 'sub MNTK_EXTENDED_SHARED () {0x40;}' unless defined(&MNTK_EXTENDED_SHARED);
    eval 'sub MNTK_SHARED_WRITES () {0x80;}' unless defined(&MNTK_SHARED_WRITES);
    eval 'sub MNTK_NO_IOPF () {0x100;}' unless defined(&MNTK_NO_IOPF);
    eval 'sub MNTK_RECURSE () {0x200;}' unless defined(&MNTK_RECURSE);
    eval 'sub MNTK_UPPER_WAITER () {0x400;}' unless defined(&MNTK_UPPER_WAITER);
    eval 'sub MNTK_UNLOCKED_INSMNTQUE () {0x1000;}' unless defined(&MNTK_UNLOCKED_INSMNTQUE);
    eval 'sub MNTK_UNMAPPED_BUFS () {0x2000;}' unless defined(&MNTK_UNMAPPED_BUFS);
    eval 'sub MNTK_USES_BCACHE () {0x4000;}' unless defined(&MNTK_USES_BCACHE);
    eval 'sub MNTK_VMSETSIZE_BUG () {0x10000;}' unless defined(&MNTK_VMSETSIZE_BUG);
    eval 'sub MNTK_UNIONFS () {0x20000;}' unless defined(&MNTK_UNIONFS);
    eval 'sub MNTK_FPLOOKUP () {0x40000;}' unless defined(&MNTK_FPLOOKUP);
    eval 'sub MNTK_SUSPEND_ALL () {0x80000;}' unless defined(&MNTK_SUSPEND_ALL);
    eval 'sub MNTK_TASKQUEUE_WAITER () {0x100000;}' unless defined(&MNTK_TASKQUEUE_WAITER);
    eval 'sub MNTK_NOASYNC () {0x800000;}' unless defined(&MNTK_NOASYNC);
    eval 'sub MNTK_UNMOUNT () {0x1000000;}' unless defined(&MNTK_UNMOUNT);
    eval 'sub MNTK_MWAIT () {0x2000000;}' unless defined(&MNTK_MWAIT);
    eval 'sub MNTK_SUSPEND () {0x8000000;}' unless defined(&MNTK_SUSPEND);
    eval 'sub MNTK_SUSPEND2 () {0x4000000;}' unless defined(&MNTK_SUSPEND2);
    eval 'sub MNTK_SUSPENDED () {0x10000000;}' unless defined(&MNTK_SUSPENDED);
    eval 'sub MNTK_NULL_NOCACHE () {0x20000000;}' unless defined(&MNTK_NULL_NOCACHE);
    eval 'sub MNTK_LOOKUP_SHARED () {0x40000000;}' unless defined(&MNTK_LOOKUP_SHARED);
    if(defined(&_KERNEL)) {
	eval 'sub MNT_SHARED_WRITES {
	    my($mp) = @_;
    	    eval q({ ($mp !=  &NULL  && ( ($mp->{mnt_kern_flag}) &  &MNTK_SHARED_WRITES) != 0); });
	}' unless defined(&MNT_SHARED_WRITES);
	eval 'sub MNT_EXTENDED_SHARED {
	    my($mp) = @_;
    	    eval q({ ($mp !=  &NULL  && ( ($mp->{mnt_kern_flag}) &  &MNTK_EXTENDED_SHARED) != 0); });
	}' unless defined(&MNT_EXTENDED_SHARED);
    }
    eval 'sub VFS_VFSCONF () {0;}' unless defined(&VFS_VFSCONF);
    eval 'sub VFS_GENERIC () {0;}' unless defined(&VFS_GENERIC);
    eval 'sub VFS_MAXTYPENUM () {1;}' unless defined(&VFS_MAXTYPENUM);
    eval 'sub VFS_CONF () {2;}' unless defined(&VFS_CONF);
    eval 'sub MNT_WAIT () {1;}' unless defined(&MNT_WAIT);
    eval 'sub MNT_NOWAIT () {2;}' unless defined(&MNT_NOWAIT);
    eval 'sub MNT_LAZY () {3;}' unless defined(&MNT_LAZY);
    eval 'sub MNT_SUSPEND () {4;}' unless defined(&MNT_SUSPEND);
    eval 'sub MAXSECFLAVORS () {5;}' unless defined(&MAXSECFLAVORS);
    unless(defined(&BURN_BRIDGES)) {
    }
    eval 'sub VFCF_STATIC () {0x10000;}' unless defined(&VFCF_STATIC);
    eval 'sub VFCF_NETWORK () {0x20000;}' unless defined(&VFCF_NETWORK);
    eval 'sub VFCF_READONLY () {0x40000;}' unless defined(&VFCF_READONLY);
    eval 'sub VFCF_SYNTHETIC () {0x80000;}' unless defined(&VFCF_SYNTHETIC);
    eval 'sub VFCF_LOOPBACK () {0x100000;}' unless defined(&VFCF_LOOPBACK);
    eval 'sub VFCF_UNICODE () {0x200000;}' unless defined(&VFCF_UNICODE);
    eval 'sub VFCF_JAIL () {0x400000;}' unless defined(&VFCF_JAIL);
    eval 'sub VFCF_DELEGADMIN () {0x800000;}' unless defined(&VFCF_DELEGADMIN);
    eval 'sub VFCF_SBDRY () {0x1000000;}' unless defined(&VFCF_SBDRY);
    eval 'sub VFCF_FILEMOUNT () {0x2000000;}' unless defined(&VFCF_FILEMOUNT);
    eval 'sub VFS_CTL_VERS1 () {0x1;}' unless defined(&VFS_CTL_VERS1);
    eval 'sub VFS_CTL_QUERY () {0x10001;}' unless defined(&VFS_CTL_QUERY);
    eval 'sub VFS_CTL_TIMEO () {0x10002;}' unless defined(&VFS_CTL_TIMEO);
    eval 'sub VFS_CTL_NOLOCKS () {0x10003;}' unless defined(&VFS_CTL_NOLOCKS);
    eval 'sub VQ_NOTRESP () {0x1;}' unless defined(&VQ_NOTRESP);
    eval 'sub VQ_NEEDAUTH () {0x2;}' unless defined(&VQ_NEEDAUTH);
    eval 'sub VQ_LOWDISK () {0x4;}' unless defined(&VQ_LOWDISK);
    eval 'sub VQ_MOUNT () {0x8;}' unless defined(&VQ_MOUNT);
    eval 'sub VQ_UNMOUNT () {0x10;}' unless defined(&VQ_UNMOUNT);
    eval 'sub VQ_DEAD () {0x20;}' unless defined(&VQ_DEAD);
    eval 'sub VQ_ASSIST () {0x40;}' unless defined(&VQ_ASSIST);
    eval 'sub VQ_NOTRESPLOCK () {0x80;}' unless defined(&VQ_NOTRESPLOCK);
    eval 'sub VQ_FLAG0100 () {0x100;}' unless defined(&VQ_FLAG0100);
    eval 'sub VQ_FLAG0200 () {0x200;}' unless defined(&VQ_FLAG0200);
    eval 'sub VQ_FLAG0400 () {0x400;}' unless defined(&VQ_FLAG0400);
    eval 'sub VQ_FLAG0800 () {0x800;}' unless defined(&VQ_FLAG0800);
    eval 'sub VQ_FLAG1000 () {0x1000;}' unless defined(&VQ_FLAG1000);
    eval 'sub VQ_FLAG2000 () {0x2000;}' unless defined(&VQ_FLAG2000);
    eval 'sub VQ_FLAG4000 () {0x4000;}' unless defined(&VQ_FLAG4000);
    eval 'sub VQ_FLAG8000 () {0x8000;}' unless defined(&VQ_FLAG8000);
    if(defined(&_KERNEL)) {
	eval 'sub VCTLTOREQ {
	    my($vc, $req) = @_;
    	    eval q( &do { ($req)-> &newptr = ($vc)-> &vc_ptr; ($req)-> &newlen = ($vc)-> &vc_len; ($req)-> &newidx = 0; }  &while (0));
	}' unless defined(&VCTLTOREQ);
    }
    if(defined(&_KERNEL)) {
	eval 'sub MBF_NOWAIT () {0x1;}' unless defined(&MBF_NOWAIT);
	eval 'sub MBF_MNTLSTLOCK () {0x2;}' unless defined(&MBF_MNTLSTLOCK);
	eval 'sub MBF_MASK () {( &MBF_NOWAIT |  &MBF_MNTLSTLOCK);}' unless defined(&MBF_MASK);
	if(defined(&MALLOC_DECLARE)) {
	}
	eval 'sub VFS_MOUNT {
	    my($MP) = @_;
    	    eval q(({ \'int\'  &_rc;  &TSRAW( &curthread,  &TS_ENTER, \\"VFS_MOUNT\\", ($MP)-> ($mnt_vfc->{vfc_name}));  &_rc = (*($MP)-> ($mnt_op->{vfs_mount}))($MP);  &TSRAW( &curthread,  &TS_EXIT, \\"VFS_MOUNT\\", ($MP)-> ($mnt_vfc->{vfc_name}));  &_rc; }));
	}' unless defined(&VFS_MOUNT);
	eval 'sub VFS_UNMOUNT {
	    my($MP, $FORCE) = @_;
    	    eval q(({ \'int\'  &_rc;  &_rc = (*($MP)-> ($mnt_op->{vfs_unmount}))($MP, $FORCE);  &_rc; }));
	}' unless defined(&VFS_UNMOUNT);
	eval 'sub VFS_ROOT {
	    my($MP, $FLAGS, $VPP) = @_;
    	    eval q(({ \'int\'  &_rc;  &_rc = (*($MP)-> ($mnt_op->{vfs_root}))($MP, $FLAGS, $VPP);  &_rc; }));
	}' unless defined(&VFS_ROOT);
	eval 'sub VFS_CACHEDROOT {
	    my($MP, $FLAGS, $VPP) = @_;
    	    eval q(({ \'int\'  &_rc;  &_rc = (*($MP)-> ($mnt_op->{vfs_cachedroot}))($MP, $FLAGS, $VPP);  &_rc; }));
	}' unless defined(&VFS_CACHEDROOT);
	eval 'sub VFS_QUOTACTL {
	    my($MP, $C, $U, $A, $MP_BUSY) = @_;
    	    eval q(({ \'int\'  &_rc;  &_rc = (*($MP)-> ($mnt_op->{vfs_quotactl}))($MP, $C, $U, $A, $MP_BUSY);  &_rc; }));
	}' unless defined(&VFS_QUOTACTL);
	eval 'sub VFS_STATFS {
	    my($MP, $SBP) = @_;
    	    eval q(({ \'int\'  &_rc;  &_rc =  &__vfs_statfs(($MP), ($SBP));  &_rc; }));
	}' unless defined(&VFS_STATFS);
	eval 'sub VFS_SYNC {
	    my($MP, $WAIT) = @_;
    	    eval q(({ \'int\'  &_rc;  &_rc = (*($MP)-> ($mnt_op->{vfs_sync}))($MP, $WAIT);  &_rc; }));
	}' unless defined(&VFS_SYNC);
	eval 'sub VFS_VGET {
	    my($MP, $INO, $FLAGS, $VPP) = @_;
    	    eval q(({ \'int\'  &_rc;  &_rc = (*($MP)-> ($mnt_op->{vfs_vget}))($MP, $INO, $FLAGS, $VPP);  &_rc; }));
	}' unless defined(&VFS_VGET);
	eval 'sub VFS_FHTOVP {
	    my($MP, $FIDP, $FLAGS, $VPP) = @_;
    	    eval q(({ \'int\'  &_rc;  &_rc = (*($MP)-> ($mnt_op->{vfs_fhtovp}))($MP, $FIDP, $FLAGS, $VPP);  &_rc; }));
	}' unless defined(&VFS_FHTOVP);
	eval 'sub VFS_CHECKEXP {
	    my($MP, $NAM, $EXFLG, $CRED, $NUMSEC, $SEC) = @_;
    	    eval q(({ \'int\'  &_rc;  &_rc = (*($MP)-> ($mnt_op->{vfs_checkexp}))($MP, $NAM, $EXFLG, $CRED, $NUMSEC, $SEC);  &_rc; }));
	}' unless defined(&VFS_CHECKEXP);
	eval 'sub VFS_EXTATTRCTL {
	    my($MP, $C, $FN, $NS, $N) = @_;
    	    eval q(({ \'int\'  &_rc;  &_rc = (*($MP)-> ($mnt_op->{vfs_extattrctl}))($MP, $C, $FN, $NS, $N);  &_rc; }));
	}' unless defined(&VFS_EXTATTRCTL);
	eval 'sub VFS_SYSCTL {
	    my($MP, $OP, $REQ) = @_;
    	    eval q(({ \'int\'  &_rc;  &_rc = (*($MP)-> ($mnt_op->{vfs_sysctl}))($MP, $OP, $REQ);  &_rc; }));
	}' unless defined(&VFS_SYSCTL);
	eval 'sub VFS_SUSP_CLEAN {
	    my($MP) = @_;
    	    eval q( &do {  &if (*($MP)-> ($mnt_op->{vfs_susp_clean}) !=  &NULL) { (*($MP)-> ($mnt_op->{vfs_susp_clean}))($MP); } }  &while (0));
	}' unless defined(&VFS_SUSP_CLEAN);
	eval 'sub VFS_RECLAIM_LOWERVP {
	    my($MP, $VP) = @_;
    	    eval q( &do {  &if (*($MP)-> ($mnt_op->{vfs_reclaim_lowervp}) !=  &NULL) { (*($MP)-> ($mnt_op->{vfs_reclaim_lowervp}))(($MP), ($VP)); } }  &while (0));
	}' unless defined(&VFS_RECLAIM_LOWERVP);
	eval 'sub VFS_UNLINK_LOWERVP {
	    my($MP, $VP) = @_;
    	    eval q( &do {  &if (*($MP)-> ($mnt_op->{vfs_unlink_lowervp}) !=  &NULL) { (*($MP)-> ($mnt_op->{vfs_unlink_lowervp}))(($MP), ($VP)); } }  &while (0));
	}' unless defined(&VFS_UNLINK_LOWERVP);
	eval 'sub VFS_PURGE {
	    my($MP) = @_;
    	    eval q( &do {  &if (*($MP)-> ($mnt_op->{vfs_purge}) !=  &NULL) { (*($MP)-> ($mnt_op->{vfs_purge}))($MP); } }  &while (0));
	}' unless defined(&VFS_PURGE);
	eval 'sub VFS_KNOTE_LOCKED {
	    my($vp, $hint) = @_;
    	    eval q( &do {  &VN_KNOTE(($vp), ($hint),  &KNF_LISTLOCKED); }  &while (0));
	}' unless defined(&VFS_KNOTE_LOCKED);
	eval 'sub VFS_KNOTE_UNLOCKED {
	    my($vp, $hint) = @_;
    	    eval q( &do {  &VN_KNOTE(($vp), ($hint), 0); }  &while (0));
	}' unless defined(&VFS_KNOTE_UNLOCKED);
	require 'sys/module.ph';
	eval 'sub VFS_VERSION_00 () {0x19660120;}' unless defined(&VFS_VERSION_00);
	eval 'sub VFS_VERSION_01 () {0x20121030;}' unless defined(&VFS_VERSION_01);
	eval 'sub VFS_VERSION_02 () {0x20180504;}' unless defined(&VFS_VERSION_02);
	eval 'sub VFS_VERSION () { &VFS_VERSION_02;}' unless defined(&VFS_VERSION);
	eval 'sub VFS_SET {
	    my($vfsops, $fsname, $flags) = @_;
    	    eval q( &static \'struct vfsconf\' $fsname   &_vfsconf = { . &vfc_version =  &VFS_VERSION, . &vfc_name = $fsname, . &vfc_vfsops = $vfsops, . &vfc_typenum = -1, . &vfc_flags = $flags, };  &static  &moduledata_t $fsname   &_mod = { $fsname,  &vfs_modevent, & $fsname   &_vfsconf };  &DECLARE_MODULE($fsname, $fsname   &_mod,  &SI_SUB_VFS,  &SI_ORDER_MIDDLE));
	}' unless defined(&VFS_SET);
	eval("sub VFS_NOTIFY_UPPER_RECLAIM () { 0; }") unless defined(&VFS_NOTIFY_UPPER_RECLAIM);
	eval("sub VFS_NOTIFY_UPPER_UNLINK () { 1; }") unless defined(&VFS_NOTIFY_UPPER_UNLINK);
	eval 'sub VFS_SUPPORTS_EXJAIL_CLONE () {1;}' unless defined(&VFS_SUPPORTS_EXJAIL_CLONE);
	eval 'sub vfsconf_lock () {
	    eval q( &sx_xlock( &vfsconf_sx));
	}' unless defined(&vfsconf_lock);
	eval 'sub vfsconf_unlock () {
	    eval q( &sx_xunlock( &vfsconf_sx));
	}' unless defined(&vfsconf_unlock);
	eval 'sub vfsconf_slock () {
	    eval q( &sx_slock( &vfsconf_sx));
	}' unless defined(&vfsconf_slock);
	eval 'sub vfsconf_sunlock () {
	    eval q( &sx_sunlock( &vfsconf_sx));
	}' unless defined(&vfsconf_sunlock);
	if(defined(&DIAGNOSTIC)) {
	} else {
	    eval 'sub vfs_assert_mount_counters {
	        my($mp) = @_;
    		eval q( &do { }  &while (0));
	    }' unless defined(&vfs_assert_mount_counters);
	    eval 'sub vfs_dump_mount_counters {
	        my($mp) = @_;
    		eval q( &do { }  &while (0));
	    }' unless defined(&vfs_dump_mount_counters);
	}
	eval("sub MNT_COUNT_REF () { 0; }") unless defined(&MNT_COUNT_REF);
	eval("sub MNT_COUNT_LOCKREF () { 1; }") unless defined(&MNT_COUNT_LOCKREF);
	eval("sub MNT_COUNT_WRITEOPCOUNT () { 2; }") unless defined(&MNT_COUNT_WRITEOPCOUNT);
	eval 'sub vfs_mount_pcpu {
	    my($mp) = @_;
    	    eval q( &zpcpu_get( ($mp->{mnt_pcpu})));
	}' unless defined(&vfs_mount_pcpu);
	eval 'sub vfs_mount_pcpu_remote {
	    my($mp, $cpu) = @_;
    	    eval q( &zpcpu_get_cpu( ($mp->{mnt_pcpu}), $cpu));
	}' unless defined(&vfs_mount_pcpu_remote);
	eval 'sub vfs_op_thread_entered {
	    my($mp) = @_;
    	    eval q(({  &MPASS( ($curthread->{td_critnest}) > 0); \'struct mount_pcpu\' * &_mpcpu =  &vfs_mount_pcpu($mp);  ($_$mpcpu->{mntp_thread_in_ops}) == 1; }));
	}' unless defined(&vfs_op_thread_entered);
	eval 'sub vfs_op_thread_enter_crit {
	    my($mp, $_mpcpu) = @_;
    	    eval q(({  &bool  &_retval_crit =  &true;  &MPASS( ($curthread->{td_critnest}) > 0); $_mpcpu =  &vfs_mount_pcpu($mp);  &MPASS( ($mpcpu->{mntp_thread_in_ops}) == 0);  ($_$mpcpu->{mntp_thread_in_ops}) = 1;  &atomic_interrupt_fence();  &if ( &__predict_false( ($mp->{mnt_vfs_ops}) > 0)) {  &vfs_op_thread_exit_crit($mp, $_mpcpu);  &_retval_crit =  &false; }  &_retval_crit; }));
	}' unless defined(&vfs_op_thread_enter_crit);
	eval 'sub vfs_op_thread_enter {
	    my($mp, $_mpcpu) = @_;
    	    eval q(({  &bool  &_retval;  &critical_enter();  &_retval =  &vfs_op_thread_enter_crit($mp, $_mpcpu);  &if ( &__predict_false(! &_retval))  &critical_exit();  &_retval; }));
	}' unless defined(&vfs_op_thread_enter);
	eval 'sub vfs_op_thread_exit_crit {
	    my($mp, $_mpcpu) = @_;
    	    eval q( &do {  &MPASS($_mpcpu ==  &vfs_mount_pcpu($mp));  &MPASS( ($_$mpcpu->{mntp_thread_in_ops}) == 1);  &atomic_interrupt_fence();  ($_$mpcpu->{mntp_thread_in_ops}) = 0; }  &while (0));
	}' unless defined(&vfs_op_thread_exit_crit);
	eval 'sub vfs_op_thread_exit {
	    my($mp, $_mpcpu) = @_;
    	    eval q( &do {  &vfs_op_thread_exit_crit($mp, $_mpcpu);  &critical_exit(); }  &while (0));
	}' unless defined(&vfs_op_thread_exit);
	eval 'sub vfs_mp_count_add_pcpu {
	    my($_mpcpu, $count, $val) = @_;
    	    eval q( &do {  &MPASS( ($_mpcpu->{mntp_thread_in_ops}) == 1);  ($_mpcpu->{mntp_})$count += $val; }  &while (0));
	}' unless defined(&vfs_mp_count_add_pcpu);
	eval 'sub vfs_mp_count_sub_pcpu {
	    my($_mpcpu, $count, $val) = @_;
    	    eval q( &do {  &MPASS( ($_mpcpu->{mntp_thread_in_ops}) == 1);  ($_mpcpu->{mntp_})$count -= $val; }  &while (0));
	}' unless defined(&vfs_mp_count_sub_pcpu);
    } else {
	require 'sys/cdefs.ph';
    }
}
1;

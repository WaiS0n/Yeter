require '_h2ph_pre.ph';

no warnings qw(redefine misc);

unless(defined(&_SYS_VNODE_H_)) {
    eval 'sub _SYS_VNODE_H_ () {1;}' unless defined(&_SYS_VNODE_H_);
    require 'sys/bufobj.ph';
    require 'sys/queue.ph';
    require 'sys/lock.ph';
    require 'sys/lockmgr.ph';
    require 'sys/mutex.ph';
    require 'sys/rangelock.ph';
    require 'sys/selinfo.ph';
    require 'sys/uio.ph';
    require 'sys/acl.ph';
    require 'sys/ktr.ph';
    require 'sys/_seqc.ph';
    eval("sub VGET_NONE () { 0; }") unless defined(&VGET_NONE);
    eval("sub VGET_HOLDCNT () { 1; }") unless defined(&VGET_HOLDCNT);
    eval("sub VGET_USECOUNT () { 2; }") unless defined(&VGET_USECOUNT);
    if(defined(&_KERNEL) || defined(&_KVM_VNODE)) {
	unless(defined(&DEBUG_LOCKS)) {
	    if(defined(&_LP64)) {
	    }
	}
    }
    eval 'sub bo2vnode {
        my($bo) = @_;
	    eval q( &__containerof(($bo), \'struct vnode\',  &v_bufobj));
    }' unless defined(&bo2vnode);
    eval 'sub v_object () { ($v_bufobj->{bo_object});}' unless defined(&v_object);
    eval 'sub VN_KNLIST_EMPTY {
        my($vp) = @_;
	    eval q((($vp)-> &v_pollinfo ==  &NULL ||  &KNLIST_EMPTY(($vp)-> ($v_pollinfo->{vpi_selinfo}->{si_note}))));
    }' unless defined(&VN_KNLIST_EMPTY);
    eval 'sub VN_KNOTE {
        my($vp, $b, $a) = @_;
	    eval q( &do {  &if (! &VN_KNLIST_EMPTY($vp))  &KNOTE( ($vp->{v_pollinfo}->{vpi_selinfo}->{si_note}), ($b), ($a) |  &KNF_NOKQLOCK); }  &while (0));
    }' unless defined(&VN_KNOTE);
    eval 'sub VN_KNOTE_LOCKED {
        my($vp, $b) = @_;
	    eval q( &VN_KNOTE($vp, $b,  &KNF_LISTLOCKED));
    }' unless defined(&VN_KNOTE_LOCKED);
    eval 'sub VN_KNOTE_UNLOCKED {
        my($vp, $b) = @_;
	    eval q( &VN_KNOTE($vp, $b, 0));
    }' unless defined(&VN_KNOTE_UNLOCKED);
    eval 'sub VHOLD_NO_SMR () {(1<<29);}' unless defined(&VHOLD_NO_SMR);
    eval 'sub VHOLD_ALL_FLAGS () {( &VHOLD_NO_SMR);}' unless defined(&VHOLD_ALL_FLAGS);
    eval 'sub VIRF_DOOMED () {0x1;}' unless defined(&VIRF_DOOMED);
    eval 'sub VIRF_PGREAD () {0x2;}' unless defined(&VIRF_PGREAD);
    eval 'sub VIRF_MOUNTPOINT () {0x4;}' unless defined(&VIRF_MOUNTPOINT);
    eval 'sub VIRF_TEXT_REF () {0x8;}' unless defined(&VIRF_TEXT_REF);
    eval 'sub VIRF_CROSSMP () {0x10;}' unless defined(&VIRF_CROSSMP);
    eval 'sub VI_UNUSED0 () {0x1;}' unless defined(&VI_UNUSED0);
    eval 'sub VI_MOUNT () {0x2;}' unless defined(&VI_MOUNT);
    eval 'sub VI_DOINGINACT () {0x4;}' unless defined(&VI_DOINGINACT);
    eval 'sub VI_OWEINACT () {0x8;}' unless defined(&VI_OWEINACT);
    eval 'sub VI_DEFINACT () {0x10;}' unless defined(&VI_DEFINACT);
    eval 'sub VI_FOPENING () {0x20;}' unless defined(&VI_FOPENING);
    eval 'sub VV_ROOT () {0x1;}' unless defined(&VV_ROOT);
    eval 'sub VV_ISTTY () {0x2;}' unless defined(&VV_ISTTY);
    eval 'sub VV_NOSYNC () {0x4;}' unless defined(&VV_NOSYNC);
    eval 'sub VV_ETERNALDEV () {0x8;}' unless defined(&VV_ETERNALDEV);
    eval 'sub VV_CACHEDLABEL () {0x10;}' unless defined(&VV_CACHEDLABEL);
    eval 'sub VV_VMSIZEVNLOCK () {0x20;}' unless defined(&VV_VMSIZEVNLOCK);
    eval 'sub VV_COPYONWRITE () {0x40;}' unless defined(&VV_COPYONWRITE);
    eval 'sub VV_SYSTEM () {0x80;}' unless defined(&VV_SYSTEM);
    eval 'sub VV_PROCDEP () {0x100;}' unless defined(&VV_PROCDEP);
    eval 'sub VV_UNLINKED () {0x200;}' unless defined(&VV_UNLINKED);
    eval 'sub VV_DELETED () {0x400;}' unless defined(&VV_DELETED);
    eval 'sub VV_MD () {0x800;}' unless defined(&VV_MD);
    eval 'sub VV_FORCEINSMQ () {0x1000;}' unless defined(&VV_FORCEINSMQ);
    eval 'sub VV_READLINK () {0x2000;}' unless defined(&VV_READLINK);
    eval 'sub VV_UNREF () {0x4000;}' unless defined(&VV_UNREF);
    eval 'sub VV_CROSSLOCK () {0x8000;}' unless defined(&VV_CROSSLOCK);
    eval 'sub VMP_LAZYLIST () {0x1;}' unless defined(&VMP_LAZYLIST);
    eval 'sub VA_UTIMES_NULL () {0x1;}' unless defined(&VA_UTIMES_NULL);
    eval 'sub VA_EXCLUSIVE () {0x2;}' unless defined(&VA_EXCLUSIVE);
    eval 'sub VA_SYNC () {0x4;}' unless defined(&VA_SYNC);
    eval 'sub IO_UNIT () {0x1;}' unless defined(&IO_UNIT);
    eval 'sub IO_APPEND () {0x2;}' unless defined(&IO_APPEND);
    eval 'sub IO_NDELAY () {0x4;}' unless defined(&IO_NDELAY);
    eval 'sub IO_NODELOCKED () {0x8;}' unless defined(&IO_NODELOCKED);
    eval 'sub IO_ASYNC () {0x10;}' unless defined(&IO_ASYNC);
    eval 'sub IO_VMIO () {0x20;}' unless defined(&IO_VMIO);
    eval 'sub IO_INVAL () {0x40;}' unless defined(&IO_INVAL);
    eval 'sub IO_SYNC () {0x80;}' unless defined(&IO_SYNC);
    eval 'sub IO_DIRECT () {0x100;}' unless defined(&IO_DIRECT);
    eval 'sub IO_NOREUSE () {0x200;}' unless defined(&IO_NOREUSE);
    eval 'sub IO_EXT () {0x400;}' unless defined(&IO_EXT);
    eval 'sub IO_NORMAL () {0x800;}' unless defined(&IO_NORMAL);
    eval 'sub IO_NOMACCHECK () {0x1000;}' unless defined(&IO_NOMACCHECK);
    eval 'sub IO_BUFLOCKED () {0x2000;}' unless defined(&IO_BUFLOCKED);
    eval 'sub IO_RANGELOCKED () {0x4000;}' unless defined(&IO_RANGELOCKED);
    eval 'sub IO_DATASYNC () {0x8000;}' unless defined(&IO_DATASYNC);
    eval 'sub IO_SEQMAX () {0x7f;}' unless defined(&IO_SEQMAX);
    eval 'sub IO_SEQSHIFT () {16;}' unless defined(&IO_SEQSHIFT);
    eval 'sub VEXEC () {000000000100;}' unless defined(&VEXEC);
    eval 'sub VWRITE () {000000000200;}' unless defined(&VWRITE);
    eval 'sub VREAD () {000000000400;}' unless defined(&VREAD);
    eval 'sub VADMIN () {000000010000;}' unless defined(&VADMIN);
    eval 'sub VAPPEND () {000000040000;}' unless defined(&VAPPEND);
    eval 'sub VEXPLICIT_DENY () {000000100000;}' unless defined(&VEXPLICIT_DENY);
    eval 'sub VREAD_NAMED_ATTRS () {000000200000;}' unless defined(&VREAD_NAMED_ATTRS);
    eval 'sub VWRITE_NAMED_ATTRS () {000000400000;}' unless defined(&VWRITE_NAMED_ATTRS);
    eval 'sub VDELETE_CHILD () {000001000000;}' unless defined(&VDELETE_CHILD);
    eval 'sub VREAD_ATTRIBUTES () {000002000000;}' unless defined(&VREAD_ATTRIBUTES);
    eval 'sub VWRITE_ATTRIBUTES () {000004000000;}' unless defined(&VWRITE_ATTRIBUTES);
    eval 'sub VDELETE () {000010000000;}' unless defined(&VDELETE);
    eval 'sub VREAD_ACL () {000020000000;}' unless defined(&VREAD_ACL);
    eval 'sub VWRITE_ACL () {000040000000;}' unless defined(&VWRITE_ACL);
    eval 'sub VWRITE_OWNER () {000100000000;}' unless defined(&VWRITE_OWNER);
    eval 'sub VSYNCHRONIZE () {000200000000;}' unless defined(&VSYNCHRONIZE);
    eval 'sub VCREAT () {000400000000;}' unless defined(&VCREAT);
    eval 'sub VVERIFY () {001000000000;}' unless defined(&VVERIFY);
    eval 'sub VADMIN_PERMS () {( &VADMIN |  &VWRITE_ATTRIBUTES |  &VWRITE_ACL |  &VWRITE_OWNER);}' unless defined(&VADMIN_PERMS);
    eval 'sub VSTAT_PERMS () {( &VREAD_ATTRIBUTES |  &VREAD_ACL);}' unless defined(&VSTAT_PERMS);
    eval 'sub VMODIFY_PERMS () {( &VWRITE |  &VAPPEND |  &VADMIN_PERMS |  &VDELETE_CHILD |  &VDELETE);}' unless defined(&VMODIFY_PERMS);
    eval 'sub VNOVAL () {(-1);}' unless defined(&VNOVAL);
    eval 'sub VLKTIMEOUT () {( &hz / 20+ 1);}' unless defined(&VLKTIMEOUT);
    if(defined(&_KERNEL)) {
	if(defined(&MALLOC_DECLARE)) {
	}
	eval 'sub IFTOVT {
	    my($mode) = @_;
    	    eval q(( $iftovt_tab[(($mode) &  &S_IFMT) >> 12]));
	}' unless defined(&IFTOVT);
	eval 'sub VTTOIF {
	    my($indx) = @_;
    	    eval q(( $vttoif_tab[($indx)]));
	}' unless defined(&VTTOIF);
	eval 'sub MAKEIMODE {
	    my($indx, $mode) = @_;
    	    eval q(( &VTTOIF($indx) | ($mode)));
	}' unless defined(&MAKEIMODE);
	eval 'sub SKIPSYSTEM () {0x1;}' unless defined(&SKIPSYSTEM);
	eval 'sub FORCECLOSE () {0x2;}' unless defined(&FORCECLOSE);
	eval 'sub WRITECLOSE () {0x4;}' unless defined(&WRITECLOSE);
	eval 'sub EARLYFLUSH () {0x8;}' unless defined(&EARLYFLUSH);
	eval 'sub V_SAVE () {0x1;}' unless defined(&V_SAVE);
	eval 'sub V_ALT () {0x2;}' unless defined(&V_ALT);
	eval 'sub V_NORMAL () {0x4;}' unless defined(&V_NORMAL);
	eval 'sub V_CLEANONLY () {0x8;}' unless defined(&V_CLEANONLY);
	eval 'sub V_VMIO () {0x10;}' unless defined(&V_VMIO);
	eval 'sub V_ALLOWCLEAN () {0x20;}' unless defined(&V_ALLOWCLEAN);
	eval 'sub REVOKEALL () {0x1;}' unless defined(&REVOKEALL);
	eval 'sub V_WAIT () {0x1;}' unless defined(&V_WAIT);
	eval 'sub V_NOWAIT () {0x2;}' unless defined(&V_NOWAIT);
	eval 'sub V_XSLEEP () {0x4;}' unless defined(&V_XSLEEP);
	eval 'sub V_PCATCH () {0x8;}' unless defined(&V_PCATCH);
	eval 'sub V_VALID_FLAGS () {( &V_WAIT |  &V_NOWAIT |  &V_XSLEEP |  &V_PCATCH);}' unless defined(&V_VALID_FLAGS);
	eval 'sub VR_START_WRITE () {0x1;}' unless defined(&VR_START_WRITE);
	eval 'sub VR_NO_SUSPCLR () {0x2;}' unless defined(&VR_NO_SUSPCLR);
	eval 'sub VS_SKIP_UNMOUNT () {0x1;}' unless defined(&VS_SKIP_UNMOUNT);
	eval 'sub VREF {
	    my($vp) = @_;
    	    eval q( &vref($vp));
	}' unless defined(&VREF);
	if(defined(&DIAGNOSTIC)) {
	    eval 'sub VATTR_NULL {
	        my($vap) = @_;
    		eval q( &vattr_null($vap));
	    }' unless defined(&VATTR_NULL);
	} else {
	    eval 'sub VATTR_NULL {
	        my($vap) = @_;
    		eval q((*($vap) =  &va_null));
	    }' unless defined(&VATTR_NULL);
	}
	eval 'sub NULLVP () {( &NULL);}' unless defined(&NULLVP);
	eval 'sub VI_LOCK {
	    my($vp) = @_;
    	    eval q( &mtx_lock(($vp)-> &v_interlock));
	}' unless defined(&VI_LOCK);
	eval 'sub VI_LOCK_FLAGS {
	    my($vp, $flags) = @_;
    	    eval q( &mtx_lock_flags(($vp)-> &v_interlock, ($flags)));
	}' unless defined(&VI_LOCK_FLAGS);
	eval 'sub VI_TRYLOCK {
	    my($vp) = @_;
    	    eval q( &mtx_trylock(($vp)-> &v_interlock));
	}' unless defined(&VI_TRYLOCK);
	eval 'sub VI_UNLOCK {
	    my($vp) = @_;
    	    eval q( &mtx_unlock(($vp)-> &v_interlock));
	}' unless defined(&VI_UNLOCK);
	eval 'sub VI_MTX {
	    my($vp) = @_;
    	    eval q((($vp)-> &v_interlock));
	}' unless defined(&VI_MTX);
	eval 'sub VN_LOCK_AREC {
	    my($vp) = @_;
    	    eval q( &lockallowrecurse(($vp)-> &v_vnlock));
	}' unless defined(&VN_LOCK_AREC);
	eval 'sub VN_LOCK_ASHARE {
	    my($vp) = @_;
    	    eval q( &lockallowshare(($vp)-> &v_vnlock));
	}' unless defined(&VN_LOCK_ASHARE);
	eval 'sub VN_LOCK_DSHARE {
	    my($vp) = @_;
    	    eval q( &lockdisableshare(($vp)-> &v_vnlock));
	}' unless defined(&VN_LOCK_DSHARE);
    }
    eval 'sub VDESC_MAX_VPS () {16;}' unless defined(&VDESC_MAX_VPS);
    eval 'sub VDESC_VP0_WILLRELE () {0x1;}' unless defined(&VDESC_VP0_WILLRELE);
    eval 'sub VDESC_VP1_WILLRELE () {0x2;}' unless defined(&VDESC_VP1_WILLRELE);
    eval 'sub VDESC_VP2_WILLRELE () {0x4;}' unless defined(&VDESC_VP2_WILLRELE);
    eval 'sub VDESC_VP3_WILLRELE () {0x8;}' unless defined(&VDESC_VP3_WILLRELE);
    eval 'sub VDESC_NO_OFFSET () {-1;}' unless defined(&VDESC_NO_OFFSET);
    if(defined(&_KERNEL)) {
	eval 'sub VOPARG_OFFSETOF {
	    my($s_type, $field) = @_;
    	    eval q( &__offsetof($s_type, $field));
	}' unless defined(&VOPARG_OFFSETOF);
	eval 'sub VOPARG_OFFSETTO {
	    my($s_type, $s_offset, $struct_p) = @_;
    	    eval q((($s_type)((($struct_p)) + ($s_offset))));
	}' unless defined(&VOPARG_OFFSETTO);
	if(defined(&DEBUG_VFS_LOCKS)) {
	    eval 'sub ASSERT_VI_LOCKED {
	        my($vp, $str) = @_;
    		eval q( &assert_vi_locked(($vp), ($str)));
	    }' unless defined(&ASSERT_VI_LOCKED);
	    eval 'sub ASSERT_VI_UNLOCKED {
	        my($vp, $str) = @_;
    		eval q( &assert_vi_unlocked(($vp), ($str)));
	    }' unless defined(&ASSERT_VI_UNLOCKED);
	    eval 'sub ASSERT_VOP_ELOCKED {
	        my($vp, $str) = @_;
    		eval q( &assert_vop_elocked(($vp), ($str)));
	    }' unless defined(&ASSERT_VOP_ELOCKED);
	    eval 'sub ASSERT_VOP_LOCKED {
	        my($vp, $str) = @_;
    		eval q( &assert_vop_locked(($vp), ($str)));
	    }' unless defined(&ASSERT_VOP_LOCKED);
	    eval 'sub ASSERT_VOP_UNLOCKED {
	        my($vp, $str) = @_;
    		eval q( &assert_vop_unlocked(($vp), ($str)));
	    }' unless defined(&ASSERT_VOP_UNLOCKED);
	    eval 'sub ASSERT_VOP_IN_SEQC {
	        my($vp) = @_;
    		eval q( &do { \'struct vnode\' * &_vp = ($vp);  &VNPASS( &seqc_in_modify( ($_$vp->{v_seqc})),  &_vp); }  &while (0));
	    }' unless defined(&ASSERT_VOP_IN_SEQC);
	    eval 'sub ASSERT_VOP_NOT_IN_SEQC {
	        my($vp) = @_;
    		eval q( &do { \'struct vnode\' * &_vp = ($vp);  &VNPASS(! &seqc_in_modify( ($_$vp->{v_seqc})),  &_vp); }  &while (0));
	    }' unless defined(&ASSERT_VOP_NOT_IN_SEQC);
	} else {
	    eval 'sub ASSERT_VI_LOCKED {
	        my($vp, $str) = @_;
    		eval q((( &void)0));
	    }' unless defined(&ASSERT_VI_LOCKED);
	    eval 'sub ASSERT_VI_UNLOCKED {
	        my($vp, $str) = @_;
    		eval q((( &void)0));
	    }' unless defined(&ASSERT_VI_UNLOCKED);
	    eval 'sub ASSERT_VOP_ELOCKED {
	        my($vp, $str) = @_;
    		eval q((( &void)0));
	    }' unless defined(&ASSERT_VOP_ELOCKED);
	    eval 'sub ASSERT_VOP_LOCKED {
	        my($vp, $str) = @_;
    		eval q((( &void)0));
	    }' unless defined(&ASSERT_VOP_LOCKED);
	    eval 'sub ASSERT_VOP_UNLOCKED {
	        my($vp, $str) = @_;
    		eval q((( &void)0));
	    }' unless defined(&ASSERT_VOP_UNLOCKED);
	    eval 'sub ASSERT_VOP_IN_SEQC {
	        my($vp) = @_;
    		eval q((( &void)0));
	    }' unless defined(&ASSERT_VOP_IN_SEQC);
	    eval 'sub ASSERT_VOP_NOT_IN_SEQC {
	        my($vp) = @_;
    		eval q((( &void)0));
	    }' unless defined(&ASSERT_VOP_NOT_IN_SEQC);
	}
	eval 'sub VCALL {
	    my($c) = @_;
    	    eval q((($c)-> ($a_desc->{vdesc_call})($c)));
	}' unless defined(&VCALL);
	eval 'sub DOINGASYNC {
	    my($vp) = @_;
    	    eval q(((($vp)-> ($v_mount->{mnt_kern_flag}) &  &MNTK_ASYNC) != 0 && (( ($curthread->{td_pflags}) &  &TDP_SYNCIO) == 0)));
	}' unless defined(&DOINGASYNC);
	eval 'sub vn_canvmio {
	    my($vp) = @_;
    	    eval q({  &if ($vp  && ( ($vp->{v_type}) ==  &VREG || ( &vmiodirenable  &&  ($vp->{v_type}) ==  &VDIR))) ( &TRUE); ( &FALSE); });
	}' unless defined(&vn_canvmio);
	require 'sys/vnode_if.ph';
	eval 'sub VN_OPEN_NOAUDIT () {0x1;}' unless defined(&VN_OPEN_NOAUDIT);
	eval 'sub VN_OPEN_NOCAPCHECK () {0x2;}' unless defined(&VN_OPEN_NOCAPCHECK);
	eval 'sub VN_OPEN_NAMECACHE () {0x4;}' unless defined(&VN_OPEN_NAMECACHE);
	eval 'sub VN_OPEN_INVFS () {0x8;}' unless defined(&VN_OPEN_INVFS);
	eval 'sub VN_OPEN_WANTIOCTLCAPS () {0x10;}' unless defined(&VN_OPEN_WANTIOCTLCAPS);
	eval 'sub COPY_FILE_RANGE_KFLAGS () {0xff000000;}' unless defined(&COPY_FILE_RANGE_KFLAGS);
	eval 'sub COPY_FILE_RANGE_TIMEO1SEC () {0x1000000;}' unless defined(&COPY_FILE_RANGE_TIMEO1SEC);
	eval 'sub VFS_CACHE_DROPOLD () {0x1;}' unless defined(&VFS_CACHE_DROPOLD);
	eval 'sub cache_enter {
	    my($dvp, $vp, $cnp) = @_;
    	    eval q( &cache_enter_time($dvp, $vp, $cnp,  &NULL,  &NULL));
	}' unless defined(&cache_enter);
	if(defined(&INVARIANTS)) {
	} else {
	    eval 'sub cache_validate {
	        my($dvp,$vp,$cnp) = @_;
    		eval q({ });
	    }' unless defined(&cache_validate);
	    eval 'sub cache_validate_vop_vector {
	        my($mp,$vops) = @_;
    		eval q({ });
	    }' unless defined(&cache_validate_vop_vector);
	    eval 'sub cache_assert_no_entries {
	        my($vp) = @_;
    		eval q({ });
	    }' unless defined(&cache_assert_no_entries);
	}
	eval 'sub vn_lock {
	    my($vp, $flags) = @_;
    	    eval q( &_vn_lock($vp, $flags,  &__FILE__,  &__LINE__));
	}' unless defined(&vn_lock);
	eval 'sub vn_seqc_read_any {
	    my($vp) = @_;
    	    eval q( &seqc_read_any(($vp)-> &v_seqc));
	}' unless defined(&vn_seqc_read_any);
	eval 'sub vn_seqc_read_notmodify {
	    my($vp) = @_;
    	    eval q( &seqc_read_notmodify(($vp)-> &v_seqc));
	}' unless defined(&vn_seqc_read_notmodify);
	eval 'sub vn_seqc_consistent {
	    my($vp, $seq) = @_;
    	    eval q( &seqc_consistent(($vp)-> &v_seqc, $seq));
	}' unless defined(&vn_seqc_consistent);
	eval 'sub vn_rangelock_unlock {
	    my($vp, $cookie) = @_;
    	    eval q( &rangelock_unlock(($vp)-> &v_rl, ($cookie),  &VI_MTX($vp)));
	}' unless defined(&vn_rangelock_unlock);
	eval 'sub vn_rangelock_unlock_range {
	    my($vp, $cookie, $start, $end) = @_;
    	    eval q( &rangelock_unlock_range(($vp)-> &v_rl, ($cookie), ($start), ($end),  &VI_MTX($vp)));
	}' unless defined(&vn_rangelock_unlock_range);
	eval 'sub vn_rangelock_rlock {
	    my($vp, $start, $end) = @_;
    	    eval q( &rangelock_rlock(($vp)-> &v_rl, ($start), ($end),  &VI_MTX($vp)));
	}' unless defined(&vn_rangelock_rlock);
	eval 'sub vn_rangelock_tryrlock {
	    my($vp, $start, $end) = @_;
    	    eval q( &rangelock_tryrlock(($vp)-> &v_rl, ($start), ($end),  &VI_MTX($vp)));
	}' unless defined(&vn_rangelock_tryrlock);
	eval 'sub vn_rangelock_wlock {
	    my($vp, $start, $end) = @_;
    	    eval q( &rangelock_wlock(($vp)-> &v_rl, ($start), ($end),  &VI_MTX($vp)));
	}' unless defined(&vn_rangelock_wlock);
	eval 'sub vn_rangelock_trywlock {
	    my($vp, $start, $end) = @_;
    	    eval q( &rangelock_trywlock(($vp)-> &v_rl, ($start), ($end),  &VI_MTX($vp)));
	}' unless defined(&vn_rangelock_trywlock);
	eval 'sub vn_irflag_read {
	    my($vp) = @_;
    	    eval q( &atomic_load_short(($vp)-> &v_irflag));
	}' unless defined(&vn_irflag_read);
	if(defined(&DEBUG_VFS_LOCKS)) {
	} else {
	    eval 'sub vop_fdatasync_debugpre {
	        my($x) = @_;
    		eval q( &do { }  &while (0));
	    }' unless defined(&vop_fdatasync_debugpre);
	    eval 'sub vop_fdatasync_debugpost {
	        my($x, $y) = @_;
    		eval q( &do { }  &while (0));
	    }' unless defined(&vop_fdatasync_debugpost);
	    eval 'sub vop_fplookup_vexec_debugpre {
	        my($x) = @_;
    		eval q( &do { }  &while (0));
	    }' unless defined(&vop_fplookup_vexec_debugpre);
	    eval 'sub vop_fplookup_vexec_debugpost {
	        my($x, $y) = @_;
    		eval q( &do { }  &while (0));
	    }' unless defined(&vop_fplookup_vexec_debugpost);
	    eval 'sub vop_fplookup_symlink_debugpre {
	        my($x) = @_;
    		eval q( &do { }  &while (0));
	    }' unless defined(&vop_fplookup_symlink_debugpre);
	    eval 'sub vop_fplookup_symlink_debugpost {
	        my($x, $y) = @_;
    		eval q( &do { }  &while (0));
	    }' unless defined(&vop_fplookup_symlink_debugpost);
	    eval 'sub vop_fsync_debugpre {
	        my($x) = @_;
    		eval q( &do { }  &while (0));
	    }' unless defined(&vop_fsync_debugpre);
	    eval 'sub vop_fsync_debugpost {
	        my($x, $y) = @_;
    		eval q( &do { }  &while (0));
	    }' unless defined(&vop_fsync_debugpost);
	    eval 'sub vop_strategy_debugpre {
	        my($x) = @_;
    		eval q( &do { }  &while (0));
	    }' unless defined(&vop_strategy_debugpre);
	    eval 'sub vop_lock_debugpre {
	        my($x) = @_;
    		eval q( &do { }  &while (0));
	    }' unless defined(&vop_lock_debugpre);
	    eval 'sub vop_lock_debugpost {
	        my($x, $y) = @_;
    		eval q( &do { }  &while (0));
	    }' unless defined(&vop_lock_debugpost);
	    eval 'sub vop_unlock_debugpre {
	        my($x) = @_;
    		eval q( &do { }  &while (0));
	    }' unless defined(&vop_unlock_debugpre);
	    eval 'sub vop_need_inactive_debugpre {
	        my($x) = @_;
    		eval q( &do { }  &while (0));
	    }' unless defined(&vop_need_inactive_debugpre);
	    eval 'sub vop_need_inactive_debugpost {
	        my($x, $y) = @_;
    		eval q( &do { }  &while (0));
	    }' unless defined(&vop_need_inactive_debugpost);
	    eval 'sub vop_mkdir_debugpost {
	        my($x, $y) = @_;
    		eval q( &do { }  &while (0));
	    }' unless defined(&vop_mkdir_debugpost);
	}
	eval 'sub vop_stat_helper_pre {
	    my($ap) = @_;
    	    eval q(({ \'struct vop_stat_args\' * &_ap = ($ap); \'int\'  &_error;  &AUDIT_ARG_VNODE1( ($ap->{a_vp}));  &_error =  &mac_vnode_check_stat( ($_$ap->{a_active_cred}),  ($_$ap->{a_file_cred}),  ($_$ap->{a_vp}));  &if ( &__predict_true( &_error == 0)) {  ($ap->{a_sb}->{st_padding0}) = 0;  ($ap->{a_sb}->{st_padding1}) = 0;  &bzero( ($_$ap->{a_sb}->{st_spare}), $sizeof{ ($_$ap->{a_sb}->{st_spare})}); }  &_error; }));
	}' unless defined(&vop_stat_helper_pre);
	eval 'sub vop_stat_helper_post {
	    my($ap, $error) = @_;
    	    eval q(({ \'struct vop_stat_args\' * &_ap = ($ap); \'int\'  &_error = ($error);  &if ( &priv_check_cred_vfs_generation( ($_$ap->{a_active_cred})))  ($_$ap->{a_sb}->{st_gen}) = 0;  &_error; }));
	}' unless defined(&vop_stat_helper_post);
	eval 'sub VOP_WRITE_PRE {
	    my($ap) = @_;
    	    eval q(\'struct vattr\'  &va; \'int\'  &error;  &off_t  &osize,  &ooffset,  &noffset;  &osize =  &ooffset =  &noffset = 0;  &if (! &VN_KNLIST_EMPTY(($ap)-> &a_vp)) {  &error =  &VOP_GETATTR(($ap)-> &a_vp,  &va, ($ap)-> &a_cred);  &if ( &error)  &return ( &error);  &ooffset = ($ap)-> ($a_uio->{uio_offset});  &osize = ( &off_t) ($va->{va_size}); });
	}' unless defined(&VOP_WRITE_PRE);
	eval 'sub VOP_WRITE_POST {
	    my($ap, $ret) = @_;
    	    eval q( &noffset = ($ap)-> ($a_uio->{uio_offset});  &if ( &noffset >  &ooffset  && ! &VN_KNLIST_EMPTY(($ap)-> &a_vp)) {  &VFS_KNOTE_LOCKED(($ap)-> &a_vp,  &NOTE_WRITE | ( &noffset >  &osize ?  &NOTE_EXTEND : 0)); });
	}' unless defined(&VOP_WRITE_POST);
	eval 'sub VOP_LOCK {
	    my($vp, $flags) = @_;
    	    eval q( &VOP_LOCK1($vp, $flags,  &__FILE__,  &__LINE__));
	}' unless defined(&VOP_LOCK);
	if(defined(&INVARIANTS)) {
	    eval 'sub VOP_ADD_WRITECOUNT_CHECKED {
	        my($vp, $cnt) = @_;
    		eval q( &do { \'int\'  &error_;  &error_ =  &VOP_ADD_WRITECOUNT(($vp), ($cnt));  &VNASSERT( &error_ == 0, ($vp), (\\"VOP_ADD_WRITECOUNT returned %d\\",  &error_)); }  &while (0));
	    }' unless defined(&VOP_ADD_WRITECOUNT_CHECKED);
	    eval 'sub VOP_SET_TEXT_CHECKED {
	        my($vp) = @_;
    		eval q( &do { \'int\'  &error_;  &error_ =  &VOP_SET_TEXT(($vp));  &VNASSERT( &error_ == 0, ($vp), (\\"VOP_SET_TEXT returned %d\\",  &error_)); }  &while (0));
	    }' unless defined(&VOP_SET_TEXT_CHECKED);
	    eval 'sub VOP_UNSET_TEXT_CHECKED {
	        my($vp) = @_;
    		eval q( &do { \'int\'  &error_;  &error_ =  &VOP_UNSET_TEXT(($vp));  &VNASSERT( &error_ == 0, ($vp), (\\"VOP_UNSET_TEXT returned %d\\",  &error_)); }  &while (0));
	    }' unless defined(&VOP_UNSET_TEXT_CHECKED);
	} else {
	    eval 'sub VOP_ADD_WRITECOUNT_CHECKED {
	        my($vp, $cnt) = @_;
    		eval q( &VOP_ADD_WRITECOUNT(($vp), ($cnt)));
	    }' unless defined(&VOP_ADD_WRITECOUNT_CHECKED);
	    eval 'sub VOP_SET_TEXT_CHECKED {
	        my($vp) = @_;
    		eval q( &VOP_SET_TEXT(($vp)));
	    }' unless defined(&VOP_SET_TEXT_CHECKED);
	    eval 'sub VOP_UNSET_TEXT_CHECKED {
	        my($vp) = @_;
    		eval q( &VOP_UNSET_TEXT(($vp)));
	    }' unless defined(&VOP_UNSET_TEXT_CHECKED);
	}
	eval 'sub VN_IS_DOOMED {
	    my($vp) = @_;
    	    eval q( &__predict_false(( &vn_irflag_read($vp) &  &VIRF_DOOMED) != 0));
	}' unless defined(&VN_IS_DOOMED);
	eval 'sub vrefcnt {
	    my($vp) = @_;
    	    eval q({ ( ($vp->{v_usecount})); });
	}' unless defined(&vrefcnt);
	eval 'sub vholdl {
	    my($vp) = @_;
    	    eval q( &do {  &ASSERT_VI_LOCKED($vp,  &__func__);  &vhold($vp); }  &while (0));
	}' unless defined(&vholdl);
	eval 'sub vrefl {
	    my($vp) = @_;
    	    eval q( &do {  &ASSERT_VI_LOCKED($vp,  &__func__);  &vref($vp); }  &while (0));
	}' unless defined(&vrefl);
	eval 'sub VOP_PANIC () {(( &void*)( &uintptr_t) &vop_panic);}' unless defined(&VOP_PANIC);
	eval 'sub VOP_NULL () {(( &void*)( &uintptr_t) &vop_null);}' unless defined(&VOP_NULL);
	eval 'sub VOP_EBADF () {(( &void*)( &uintptr_t) &vop_ebadf);}' unless defined(&VOP_EBADF);
	eval 'sub VOP_ENOTTY () {(( &void*)( &uintptr_t) &vop_enotty);}' unless defined(&VOP_ENOTTY);
	eval 'sub VOP_EINVAL () {(( &void*)( &uintptr_t) &vop_einval);}' unless defined(&VOP_EINVAL);
	eval 'sub VOP_ENOENT () {(( &void*)( &uintptr_t) &vop_enoent);}' unless defined(&VOP_ENOENT);
	eval 'sub VOP_EOPNOTSUPP () {(( &void*)( &uintptr_t) &vop_eopnotsupp);}' unless defined(&VOP_EOPNOTSUPP);
	eval 'sub VOP_EAGAIN () {(( &void*)( &uintptr_t) &vop_eagain);}' unless defined(&VOP_EAGAIN);
	if(defined(&INVARIANTS)) {
	}
# some #ifdef were dropped here -- fill in the blanks
	eval 'sub vn_set_state () {
	    eval q((\'struct vnode\' * &vp,  &__enum_uint8( &vstate)  &state) {  ($vp->{v_state}) =  &state; });
	}' unless defined(&vn_set_state);
	eval 'sub __enum_uint8 {
	    my($vstate) = @_;
    	    eval q((\'struct vnode\' * &vp) { ( ($vp->{v_state})); });
	}' unless defined(&__enum_uint8);
	eval 'sub VOP_UNLOCK_FLAGS {
	    my($vp, $flags) = @_;
    	    eval q(({ \'struct vnode\' * &_vp = ($vp); \'int\'  &_flags = ($flags); \'int\'  &_error;  &if (( &_flags & ~( &LK_INTERLOCK |  &LK_RELEASE)) != 0)  &panic(\\"%s: unsupported flags %x\\\\n\\",  &__func__, $flags);  &_error =  &VOP_UNLOCK( &_vp);  &if ( &_flags &  &LK_INTERLOCK)  &VI_UNLOCK( &_vp);  &_error; }));
	}' unless defined(&VOP_UNLOCK_FLAGS);
	require 'sys/kernel.ph';
	eval 'sub VFS_VOP_VECTOR_REGISTER {
	    my($vnodeops) = @_;
    	    eval q( &SYSINIT( &vfs_vector_$vnodeops &_f,  &SI_SUB_VFS,  &SI_ORDER_ANY,  &vfs_vector_op_register, $vnodeops));
	}' unless defined(&VFS_VOP_VECTOR_REGISTER);
	eval 'sub VFS_SMR_DECLARE () { &extern  &smr_t  &vfs_smr;}' unless defined(&VFS_SMR_DECLARE);
	eval 'sub VFS_SMR () {
	    eval q( &vfs_smr);
	}' unless defined(&VFS_SMR);
	eval 'sub vfs_smr_enter () {
	    eval q( &smr_enter( &VFS_SMR()));
	}' unless defined(&vfs_smr_enter);
	eval 'sub vfs_smr_exit () {
	    eval q( &smr_exit( &VFS_SMR()));
	}' unless defined(&vfs_smr_exit);
	eval 'sub vfs_smr_synchronize () {
	    eval q( &smr_synchronize( &VFS_SMR()));
	}' unless defined(&vfs_smr_synchronize);
	eval 'sub vfs_smr_entered_load {
	    my($ptr) = @_;
    	    eval q( &smr_entered_load(($ptr),  &VFS_SMR()));
	}' unless defined(&vfs_smr_entered_load);
	eval 'sub VFS_SMR_ASSERT_ENTERED () {
	    eval q( &SMR_ASSERT_ENTERED( &VFS_SMR()));
	}' unless defined(&VFS_SMR_ASSERT_ENTERED);
	eval 'sub VFS_SMR_ASSERT_NOT_ENTERED () {
	    eval q( &SMR_ASSERT_NOT_ENTERED( &VFS_SMR()));
	}' unless defined(&VFS_SMR_ASSERT_NOT_ENTERED);
	eval 'sub VFS_SMR_ZONE_SET {
	    my($zone) = @_;
    	    eval q( &uma_zone_set_smr(($zone),  &VFS_SMR()));
	}' unless defined(&VFS_SMR_ZONE_SET);
	eval 'sub vn_load_v_data_smr {
	    my($vp) = @_;
    	    eval q(({ \'struct vnode\' * &_vp = ($vp);  &VFS_SMR_ASSERT_ENTERED();  &atomic_load_consume_ptr(( &_vp)-> &v_data);}));
	}' unless defined(&vn_load_v_data_smr);
    }
}
1;

require '_h2ph_pre.ph';

no warnings qw(redefine misc);

unless(defined(&_SYS_FILEDESC_H_)) {
    eval 'sub _SYS_FILEDESC_H_ () {1;}' unless defined(&_SYS_FILEDESC_H_);
    require 'sys/types.ph';
    require 'sys/caprights.ph';
    require 'sys/queue.ph';
    require 'sys/event.ph';
    require 'sys/lock.ph';
    require 'sys/mutex.ph';
    require 'sys/priority.ph';
    require 'sys/seqc.ph';
    require 'sys/sx.ph';
    require 'sys/_smr.ph';
    require 'sys/smr_types.ph';
    require 'machine/_limits.ph';
    eval 'sub fde_rights () { ($fde_caps->{fc_rights});}' unless defined(&fde_rights);
    eval 'sub fde_fcntls () { ($fde_caps->{fc_fcntls});}' unless defined(&fde_fcntls);
    eval 'sub fde_ioctls () { ($fde_caps->{fc_ioctls});}' unless defined(&fde_ioctls);
    eval 'sub fde_nioctls () { ($fde_caps->{fc_nioctls});}' unless defined(&fde_nioctls);
    if(defined(&_KERNEL)) {
	eval 'sub fde_copy {
	    my($from,$to) = @_;
    	    eval q({  ($to->{fde_file}) =  ($from->{fde_file});  ($to->{fde_caps}) =  ($from->{fde_caps});  ($to->{fde_flags}) =  ($from->{fde_flags}); });
	}' unless defined(&fde_copy);
    }
    eval 'sub fd_seqc {
        my($fdt, $fd) = @_;
	    eval q((($fdt)-> ($fdt_ofiles[&(fd)]->{fde_seqc})));
    }' unless defined(&fd_seqc);
    eval 'sub NDSLOTTYPE () {\'u_long\';}' unless defined(&NDSLOTTYPE);
    eval 'sub fd_nfiles () { ($fd_files->{fdt_nfiles});}' unless defined(&fd_nfiles);
    eval 'sub fd_ofiles () { ($fd_files->{fdt_ofiles});}' unless defined(&fd_ofiles);
    eval 'sub UF_EXCLOSE () {0x1;}' unless defined(&UF_EXCLOSE);
    if(defined(&_KERNEL)) {
	eval 'sub PWDDESC_LOCK {
	    my($pdp) = @_;
    	    eval q((($pdp)-> &pd_lock));
	}' unless defined(&PWDDESC_LOCK);
	eval 'sub PWDDESC_LOCK_INIT {
	    my($pdp) = @_;
    	    eval q( &mtx_init( &PWDDESC_LOCK($pdp), \\"pwddesc\\",  &NULL,  &MTX_DEF));
	}' unless defined(&PWDDESC_LOCK_INIT);
	eval 'sub PWDDESC_LOCK_DESTROY {
	    my($pdp) = @_;
    	    eval q( &mtx_destroy( &PWDDESC_LOCK($pdp)));
	}' unless defined(&PWDDESC_LOCK_DESTROY);
	eval 'sub PWDDESC_XLOCK {
	    my($pdp) = @_;
    	    eval q( &mtx_lock( &PWDDESC_LOCK($pdp)));
	}' unless defined(&PWDDESC_XLOCK);
	eval 'sub PWDDESC_XUNLOCK {
	    my($pdp) = @_;
    	    eval q( &mtx_unlock( &PWDDESC_LOCK($pdp)));
	}' unless defined(&PWDDESC_XUNLOCK);
	eval 'sub PWDDESC_LOCK_ASSERT {
	    my($pdp, $what) = @_;
    	    eval q( &mtx_assert( &PWDDESC_LOCK($pdp), ($what)));
	}' unless defined(&PWDDESC_LOCK_ASSERT);
	eval 'sub PWDDESC_ASSERT_XLOCKED {
	    my($pdp) = @_;
    	    eval q( &PWDDESC_LOCK_ASSERT(($pdp),  &MA_OWNED));
	}' unless defined(&PWDDESC_ASSERT_XLOCKED);
	eval 'sub PWDDESC_ASSERT_UNLOCKED {
	    my($pdp) = @_;
    	    eval q( &PWDDESC_LOCK_ASSERT(($pdp),  &MA_NOTOWNED));
	}' unless defined(&PWDDESC_ASSERT_UNLOCKED);
	eval 'sub PWDDESC_XLOCKED_LOAD_PWD {
	    my($pdp) = @_;
    	    eval q(({ \'struct pwddesc\' * &_pdp = ($pdp); \'struct pwd\' * &_pwd;  &_pwd =  &smr_serialized_load(( &_pdp)-> &pd_pwd, ( &PWDDESC_ASSERT_XLOCKED( &_pdp),  &true));  &_pwd; }));
	}' unless defined(&PWDDESC_XLOCKED_LOAD_PWD);
	eval 'sub FILEDESC_LOCK_INIT {
	    my($fdp) = @_;
    	    eval q( &sx_init(($fdp)-> &fd_sx, \\"filedesc structure\\"));
	}' unless defined(&FILEDESC_LOCK_INIT);
	eval 'sub FILEDESC_LOCK_DESTROY {
	    my($fdp) = @_;
    	    eval q( &sx_destroy(($fdp)-> &fd_sx));
	}' unless defined(&FILEDESC_LOCK_DESTROY);
	eval 'sub FILEDESC_LOCK {
	    my($fdp) = @_;
    	    eval q((($fdp)-> &fd_sx));
	}' unless defined(&FILEDESC_LOCK);
	eval 'sub FILEDESC_XLOCK {
	    my($fdp) = @_;
    	    eval q( &sx_xlock(($fdp)-> &fd_sx));
	}' unless defined(&FILEDESC_XLOCK);
	eval 'sub FILEDESC_XUNLOCK {
	    my($fdp) = @_;
    	    eval q( &sx_xunlock(($fdp)-> &fd_sx));
	}' unless defined(&FILEDESC_XUNLOCK);
	eval 'sub FILEDESC_SLOCK {
	    my($fdp) = @_;
    	    eval q( &sx_slock(($fdp)-> &fd_sx));
	}' unless defined(&FILEDESC_SLOCK);
	eval 'sub FILEDESC_SUNLOCK {
	    my($fdp) = @_;
    	    eval q( &sx_sunlock(($fdp)-> &fd_sx));
	}' unless defined(&FILEDESC_SUNLOCK);
	eval 'sub FILEDESC_LOCK_ASSERT {
	    my($fdp) = @_;
    	    eval q( &sx_assert(($fdp)-> &fd_sx,  &SX_LOCKED |  &SX_NOTRECURSED));
	}' unless defined(&FILEDESC_LOCK_ASSERT);
	eval 'sub FILEDESC_XLOCK_ASSERT {
	    my($fdp) = @_;
    	    eval q( &sx_assert(($fdp)-> &fd_sx,  &SX_XLOCKED |  &SX_NOTRECURSED));
	}' unless defined(&FILEDESC_XLOCK_ASSERT);
	eval 'sub FILEDESC_UNLOCK_ASSERT {
	    my($fdp) = @_;
    	    eval q( &sx_assert(($fdp)-> &fd_sx,  &SX_UNLOCKED));
	}' unless defined(&FILEDESC_UNLOCK_ASSERT);
	eval 'sub FILEDESC_IS_ONLY_USER {
	    my($fdp) = @_;
    	    eval q(({ \'struct filedesc\' * &_fdp = ($fdp);  &MPASS( ($curproc->{p_fd}) ==  &_fdp); ( ($curproc->{p_numthreads}) == 1 &&  &refcount_load(& ($_$fdp->{fd_refcnt})) == 1); }));
	}' unless defined(&FILEDESC_IS_ONLY_USER);
    } else {
	eval 'sub PWDDESC_KVM_LOAD_PWD {
	    my($pdp) = @_;
    	    eval q(({ \'struct pwddesc\' * &_pdp = ($pdp); \'struct pwd\' * &_pwd;  &_pwd =  &smr_kvm_load(( &_pdp)-> &pd_pwd);  &_pwd; }));
	}' unless defined(&PWDDESC_KVM_LOAD_PWD);
    }
    if(defined(&_KERNEL)) {
	eval("sub FDDUP_NORMAL () { 0; }") unless defined(&FDDUP_NORMAL);
	eval("sub FDDUP_FCNTL () { 1; }") unless defined(&FDDUP_FCNTL);
	eval("sub FDDUP_FIXED () { 2; }") unless defined(&FDDUP_FIXED);
	eval("sub FDDUP_LASTMODE () { 3; }") unless defined(&FDDUP_LASTMODE);
	eval 'sub FDDUP_FLAG_CLOEXEC () {0x1;}' unless defined(&FDDUP_FLAG_CLOEXEC);
	eval 'sub falloc {
	    my($td, $resultfp, $resultfd, $flags) = @_;
    	    eval q( &falloc_caps($td, $resultfp, $resultfd, $flags,  &NULL));
	}' unless defined(&falloc);
	eval 'sub filecaps_init {
	    my($fcaps) = @_;
    	    eval q({  &bzero($fcaps, $sizeof{$fcaps});  ($fcaps->{fc_nioctls}) = -1; });
	}' unless defined(&filecaps_init);
	eval 'sub falloc_noinstall {
	    my($td, $resultfp) = @_;
    	    eval q( &_falloc_noinstall($td, $resultfp, 1));
	}' unless defined(&falloc_noinstall);
	eval 'sub fput_only_user {
	    my($fdp, $fp) = @_;
    	    eval q(({  &MPASS( &FILEDESC_IS_ONLY_USER($fdp));  &MPASS( &refcount_load( ($fp->{f_count})) > 0); }));
	}' unless defined(&fput_only_user);
	eval 'sub fdeget_noref {
	    my($fdp,$fd) = @_;
    	    eval q({ \'struct filedescent\' * &fde;  &FILEDESC_LOCK_ASSERT;  &if ( &__predict_false($fd >=  ($fdp->{fd_nfiles}))) ( &NULL);  &fde =  ($fdp->{fd_ofiles[$fd]});  &if ( &__predict_false( ($fde->{fde_file}) ==  &NULL)) ( &NULL); ( &fde); });
	}' unless defined(&fdeget_noref);
	if(defined(&CAPABILITIES)) {
	    eval 'sub fd_modified {
	        my($fdp,$fd,$seqc) = @_;
    		eval q({ (! &seqc_consistent( &fd_seqc( ($fdp->{fd_files}), $fd), $seqc)); });
	    }' unless defined(&fd_modified);
	}
	eval 'sub pwd_set {
	    my($pdp,$newpwd) = @_;
    	    eval q({  &smr_serialized_store( ($pdp->{pd_pwd}), $newpwd, ( &PWDDESC_ASSERT_XLOCKED($pdp),  &true)); });
	}' unless defined(&pwd_set);
	eval 'sub pwd_get_smr () {
	    eval q( &vfs_smr_entered_load( ($curproc->{p_pd}->{pd_pwd})));
	}' unless defined(&pwd_get_smr);
    }
}
1;

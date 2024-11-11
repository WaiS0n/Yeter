require '_h2ph_pre.ph';

no warnings qw(redefine misc);

unless(defined(&_SYS_NAMEI_H_)) {
    eval 'sub _SYS_NAMEI_H_ () {1;}' unless defined(&_SYS_NAMEI_H_);
    require 'sys/caprights.ph';
    require 'sys/filedesc.ph';
    require 'sys/queue.ph';
    require 'sys/_seqc.ph';
    require 'sys/_uio.ph';
    eval("sub LOOKUP () { 0; }") unless defined(&LOOKUP);
    eval("sub CREATE () { 1; }") unless defined(&CREATE);
    eval("sub DELETE () { 2; }") unless defined(&DELETE);
    eval("sub RENAME () { 3; }") unless defined(&RENAME);
    if(defined(&_KERNEL)) {
	eval("sub CACHE_FPL_STATUS_DESTROYED () { 0; }") unless defined(&CACHE_FPL_STATUS_DESTROYED);
	eval("sub CACHE_FPL_STATUS_ABORTED () { 1; }") unless defined(&CACHE_FPL_STATUS_ABORTED);
	eval("sub CACHE_FPL_STATUS_PARTIAL () { 2; }") unless defined(&CACHE_FPL_STATUS_PARTIAL);
	eval("sub CACHE_FPL_STATUS_HANDLED () { 3; }") unless defined(&CACHE_FPL_STATUS_HANDLED);
	eval("sub CACHE_FPL_STATUS_UNSET () { 4; }") unless defined(&CACHE_FPL_STATUS_UNSET);
	eval 'sub NAMEI_DBG_INITED () {0x1;}' unless defined(&NAMEI_DBG_INITED);
	eval 'sub NAMEI_DBG_CALLED () {0x2;}' unless defined(&NAMEI_DBG_CALLED);
	eval 'sub NAMEI_DBG_HADSTARTDIR () {0x4;}' unless defined(&NAMEI_DBG_HADSTARTDIR);
	eval 'sub NC_NOMAKEENTRY () {0x1;}' unless defined(&NC_NOMAKEENTRY);
	eval 'sub NC_KEEPPOSENTRY () {0x2;}' unless defined(&NC_KEEPPOSENTRY);
	eval 'sub NOCACHE () { &NC_NOMAKEENTRY;}' unless defined(&NOCACHE);
	eval 'sub LOCKLEAF () {0x4;}' unless defined(&LOCKLEAF);
	eval 'sub LOCKPARENT () {0x8;}' unless defined(&LOCKPARENT);
	eval 'sub WANTPARENT () {0x10;}' unless defined(&WANTPARENT);
	eval 'sub FAILIFEXISTS () {0x20;}' unless defined(&FAILIFEXISTS);
	eval 'sub FOLLOW () {0x40;}' unless defined(&FOLLOW);
	eval 'sub EMPTYPATH () {0x80;}' unless defined(&EMPTYPATH);
	eval 'sub LOCKSHARED () {0x100;}' unless defined(&LOCKSHARED);
	eval 'sub NOFOLLOW () {0x;}' unless defined(&NOFOLLOW);
	eval 'sub RBENEATH () {0x100000000;}' unless defined(&RBENEATH);
	eval 'sub MODMASK () {0xf000001ff;}' unless defined(&MODMASK);
	eval 'sub RDONLY () {0x200;}' unless defined(&RDONLY);
	eval 'sub ISRESTARTED () {0x400;}' unless defined(&ISRESTARTED);
	eval 'sub ISWHITEOUT () {0x1000;}' unless defined(&ISWHITEOUT);
	eval 'sub DOWHITEOUT () {0x2000;}' unless defined(&DOWHITEOUT);
	eval 'sub WILLBEDIR () {0x4000;}' unless defined(&WILLBEDIR);
	eval 'sub ISOPEN () {0x8000;}' unless defined(&ISOPEN);
	eval 'sub NOCROSSMOUNT () {0x10000;}' unless defined(&NOCROSSMOUNT);
	eval 'sub NOMACCHECK () {0x20000;}' unless defined(&NOMACCHECK);
	eval 'sub AUDITVNODE1 () {0x40000;}' unless defined(&AUDITVNODE1);
	eval 'sub AUDITVNODE2 () {0x80000;}' unless defined(&AUDITVNODE2);
	eval 'sub NOCAPCHECK () {0x100000;}' unless defined(&NOCAPCHECK);
	eval 'sub OPENREAD () {0x200000;}' unless defined(&OPENREAD);
	eval 'sub OPENWRITE () {0x400000;}' unless defined(&OPENWRITE);
	eval 'sub WANTIOCTLCAPS () {0x800000;}' unless defined(&WANTIOCTLCAPS);
	eval 'sub NOEXECCHECK () {0x2000000;}' unless defined(&NOEXECCHECK);
	eval 'sub MAKEENTRY () {0x4000000;}' unless defined(&MAKEENTRY);
	eval 'sub ISSYMLINK () {0x8000000;}' unless defined(&ISSYMLINK);
	eval 'sub ISLASTCN () {0x10000000;}' unless defined(&ISLASTCN);
	eval 'sub ISDOTDOT () {0x20000000;}' unless defined(&ISDOTDOT);
	eval 'sub TRAILINGSLASH () {0x40000000;}' unless defined(&TRAILINGSLASH);
	eval 'sub PARAMASK () {0x7ffffe00;}' unless defined(&PARAMASK);
	eval 'sub NAMEI_INTERNAL_FLAGS () {( &NOEXECCHECK |  &MAKEENTRY |  &ISSYMLINK |  &ISLASTCN |  &ISDOTDOT |  &TRAILINGSLASH |  &ISRESTARTED);}' unless defined(&NAMEI_INTERNAL_FLAGS);
	eval 'sub NIRES_ABS () {0x1;}' unless defined(&NIRES_ABS);
	eval 'sub NIRES_STRICTREL () {0x2;}' unless defined(&NIRES_STRICTREL);
	eval 'sub NIRES_EMPTYPATH () {0x4;}' unless defined(&NIRES_EMPTYPATH);
	eval 'sub NI_LCF_STRICTRELATIVE () {0x1;}' unless defined(&NI_LCF_STRICTRELATIVE);
	eval 'sub NI_LCF_CAP_DOTDOT () {0x2;}' unless defined(&NI_LCF_CAP_DOTDOT);
	eval 'sub NDINIT {
	    my($ndp, $op, $flags, $segflg, $namep) = @_;
    	    eval q( &NDINIT_ALL($ndp, $op, $flags, $segflg, $namep,  &AT_FDCWD,  &NULL,  &cap_no_rights));
	}' unless defined(&NDINIT);
	eval 'sub NDINIT_AT {
	    my($ndp, $op, $flags, $segflg, $namep, $dirfd) = @_;
    	    eval q( &NDINIT_ALL($ndp, $op, $flags, $segflg, $namep, $dirfd,  &NULL,  &cap_no_rights));
	}' unless defined(&NDINIT_AT);
	eval 'sub NDINIT_ATRIGHTS {
	    my($ndp, $op, $flags, $segflg, $namep, $dirfd, $rightsp) = @_;
    	    eval q( &NDINIT_ALL($ndp, $op, $flags, $segflg, $namep, $dirfd,  &NULL, $rightsp));
	}' unless defined(&NDINIT_ATRIGHTS);
	eval 'sub NDINIT_ATVP {
	    my($ndp, $op, $flags, $segflg, $namep, $vp) = @_;
    	    eval q( &NDINIT_ALL($ndp, $op, $flags, $segflg, $namep,  &AT_FDCWD, $vp,  &cap_no_rights));
	}' unless defined(&NDINIT_ATVP);
	if(defined(&INVARIANTS) || (defined(&KLD_MODULE)  && !defined(&KLD_TIED))) {
	    eval 'sub NDINIT_PREFILL {
	        my($arg) = @_;
    		eval q( &memset($arg, 0xff,  &offsetof(\'struct nameidata\',  &ni_dvp_seqc)));
	    }' unless defined(&NDINIT_PREFILL);
	    eval 'sub NDINIT_DBG {
	        my($arg) = @_;
    		eval q({ ($arg)-> &ni_debugflags =  &NAMEI_DBG_INITED; });
	    }' unless defined(&NDINIT_DBG);
	    eval 'sub NDREINIT_DBG {
	        my($arg) = @_;
    		eval q({  &if ((($arg)-> &ni_debugflags &  &NAMEI_DBG_INITED) == 0)  &panic(\\"namei data not inited\\");  &if ((($arg)-> &ni_debugflags &  &NAMEI_DBG_HADSTARTDIR) != 0)  &panic(\\"NDREINIT on namei data with NAMEI_DBG_HADSTARTDIR\\"); ($arg)-> &ni_debugflags =  &NAMEI_DBG_INITED; });
	    }' unless defined(&NDREINIT_DBG);
	} else {
	    eval 'sub NDINIT_PREFILL {
	        my($arg) = @_;
    		eval q( &do { }  &while (0));
	    }' unless defined(&NDINIT_PREFILL);
	    eval 'sub NDINIT_DBG {
	        my($arg) = @_;
    		eval q( &do { }  &while (0));
	    }' unless defined(&NDINIT_DBG);
	    eval 'sub NDREINIT_DBG {
	        my($arg) = @_;
    		eval q( &do { }  &while (0));
	    }' unless defined(&NDREINIT_DBG);
	}
	eval 'sub NDINIT_ALL {
	    my($ndp, $op, $flags, $segflg, $namep, $dirfd, $startdir, $rightsp) = @_;
    	    eval q( &do { \'struct nameidata\' * &_ndp = ($ndp);  &cap_rights_t * &_rightsp = ($rightsp);  &MPASS( &_rightsp !=  &NULL);  &NDINIT_PREFILL( &_ndp);  &NDINIT_DBG( &_ndp);  ($_$ndp->{ni_cnd}->{cn_nameiop}) = $op;  ($_$ndp->{ni_cnd}->{cn_flags}) = $flags;  ($_$ndp->{ni_segflg}) = $segflg;  ($_$ndp->{ni_dirp}) = $namep;  ($_$ndp->{ni_dirfd}) = $dirfd;  ($_$ndp->{ni_startdir}) = $startdir;  ($_$ndp->{ni_resflags}) = 0;  &filecaps_init(& ($_$ndp->{ni_filecaps}));  ($_$ndp->{ni_rightsneeded}) =  &_rightsp; }  &while (0));
	}' unless defined(&NDINIT_ALL);
	eval 'sub NDREINIT {
	    my($ndp) = @_;
    	    eval q( &do { \'struct nameidata\' * &_ndp = ($ndp);  &NDREINIT_DBG( &_ndp);  &filecaps_free(& ($_$ndp->{ni_filecaps}));  ($_$ndp->{ni_resflags}) = 0;  ($_$ndp->{ni_startdir}) =  &NULL; }  &while (0));
	}' unless defined(&NDREINIT);
	eval 'sub NDPREINIT {
	    my($ndp) = @_;
    	    eval q( &do { ($ndp)-> &ni_dvp_seqc =  &SEQC_MOD; ($ndp)-> &ni_vp_seqc =  &SEQC_MOD; }  &while (0));
	}' unless defined(&NDPREINIT);
	eval 'sub NDFREE_IOCTLCAPS {
	    my($ndp) = @_;
    	    eval q( &do { \'struct nameidata\' * &_ndp = ($ndp);  &filecaps_free(& ($_$ndp->{ni_filecaps})); }  &while (0));
	}' unless defined(&NDFREE_IOCTLCAPS);
	eval 'sub NDFREE_PNBUF {
	    my($ndp) = @_;
    	    eval q( &do { \'struct nameidata\' * &_ndp = ($ndp);  &MPASS( ($_$ndp->{ni_cnd}->{cn_pnbuf}) !=  &NULL);  &uma_zfree( &namei_zone,  ($_$ndp->{ni_cnd}->{cn_pnbuf}));  ($_$ndp->{ni_cnd}->{cn_pnbuf}) =  &NULL; }  &while (0));
	}' unless defined(&NDFREE_PNBUF);
	eval 'sub namei_setup_rootdir {
	    my($ndp, $cnp, $pwd) = @_;
    	    eval q( &do {  &if ( &__predict_true(( ($cnp->{cn_flags}) &  &ISRESTARTED) == 0))  ($ndp->{ni_rootdir}) =  ($pwd->{pwd_adir});  &else  ($ndp->{ni_rootdir}) =  ($pwd->{pwd_rdir}); }  &while (0));
	}' unless defined(&namei_setup_rootdir);
    }
}
1;

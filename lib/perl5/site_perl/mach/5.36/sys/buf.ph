require '_h2ph_pre.ph';

no warnings qw(redefine misc);

unless(defined(&_SYS_BUF_H_)) {
    eval 'sub _SYS_BUF_H_ () {1;}' unless defined(&_SYS_BUF_H_);
    require 'sys/bufobj.ph';
    require 'sys/queue.ph';
    require 'sys/lock.ph';
    require 'sys/lockmgr.ph';
    require 'vm/uma.ph';
    if(defined(&FULL_BUF_TRACKING)) {
	eval 'sub BUF_TRACKING_SIZE () {32;}' unless defined(&BUF_TRACKING_SIZE);
	eval 'sub BUF_TRACKING_ENTRY {
	    my($x) = @_;
    	    eval q((($x) & ( &BUF_TRACKING_SIZE - 1)));
	}' unless defined(&BUF_TRACKING_ENTRY);
    }
 elsif(defined(&BUF_TRACKING)) {
    }
    eval 'sub b_object () { ($b_bufobj->{bo_object});}' unless defined(&b_object);
    eval 'sub B_AGE () {0x1;}' unless defined(&B_AGE);
    eval 'sub B_NEEDCOMMIT () {0x2;}' unless defined(&B_NEEDCOMMIT);
    eval 'sub B_ASYNC () {0x4;}' unless defined(&B_ASYNC);
    eval 'sub B_DIRECT () {0x8;}' unless defined(&B_DIRECT);
    eval 'sub B_DEFERRED () {0x10;}' unless defined(&B_DEFERRED);
    eval 'sub B_CACHE () {0x20;}' unless defined(&B_CACHE);
    eval 'sub B_VALIDSUSPWRT () {0x40;}' unless defined(&B_VALIDSUSPWRT);
    eval 'sub B_DELWRI () {0x80;}' unless defined(&B_DELWRI);
    eval 'sub B_CKHASH () {0x100;}' unless defined(&B_CKHASH);
    eval 'sub B_DONE () {0x200;}' unless defined(&B_DONE);
    eval 'sub B_EINTR () {0x400;}' unless defined(&B_EINTR);
    eval 'sub B_NOREUSE () {0x800;}' unless defined(&B_NOREUSE);
    eval 'sub B_REUSE () {0x1000;}' unless defined(&B_REUSE);
    eval 'sub B_INVAL () {0x2000;}' unless defined(&B_INVAL);
    eval 'sub B_BARRIER () {0x4000;}' unless defined(&B_BARRIER);
    eval 'sub B_NOCACHE () {0x8000;}' unless defined(&B_NOCACHE);
    eval 'sub B_MALLOC () {0x10000;}' unless defined(&B_MALLOC);
    eval 'sub B_CLUSTEROK () {0x20000;}' unless defined(&B_CLUSTEROK);
    eval 'sub B_INVALONERR () {0x40000;}' unless defined(&B_INVALONERR);
    eval 'sub B_IOSTARTED () {0x80000;}' unless defined(&B_IOSTARTED);
    eval 'sub B_00100000 () {0x100000;}' unless defined(&B_00100000);
    eval 'sub B_MAXPHYS () {0x200000;}' unless defined(&B_MAXPHYS);
    eval 'sub B_RELBUF () {0x400000;}' unless defined(&B_RELBUF);
    eval 'sub B_FS_FLAG1 () {0x800000;}' unless defined(&B_FS_FLAG1);
    eval 'sub B_NOCOPY () {0x1000000;}' unless defined(&B_NOCOPY);
    eval 'sub B_INFREECNT () {0x2000000;}' unless defined(&B_INFREECNT);
    eval 'sub B_PAGING () {0x4000000;}' unless defined(&B_PAGING);
    eval 'sub B_MANAGED () {0x8000000;}' unless defined(&B_MANAGED);
    eval 'sub B_RAM () {0x10000000;}' unless defined(&B_RAM);
    eval 'sub B_VMIO () {0x20000000;}' unless defined(&B_VMIO);
    eval 'sub B_CLUSTER () {0x40000000;}' unless defined(&B_CLUSTER);
    eval 'sub B_REMFREE () {0x80000000;}' unless defined(&B_REMFREE);
    eval 'sub PRINT_BUF_FLAGS () {"\\20\\40remfree\\37cluster\\36vmio\\35ram\\34managed" "\\33paging\\32infreecnt\\31nocopy\\30b23\\27relbuf\\26maxphys\\25b20" "\\24iostarted\\23invalonerr\\22clusterok\\21malloc\\20nocache\\17b14" "\\16inval\\15reuse\\14noreuse\\13eintr\\12done\\11b8\\10delwri" "\\7validsuspwrt\\6cache\\5deferred\\4direct\\3async\\2needcommit\\1age";}' unless defined(&PRINT_BUF_FLAGS);
    eval 'sub BX_VNDIRTY () {0x1;}' unless defined(&BX_VNDIRTY);
    eval 'sub BX_VNCLEAN () {0x2;}' unless defined(&BX_VNCLEAN);
    eval 'sub BX_CVTENXIO () {0x4;}' unless defined(&BX_CVTENXIO);
    eval 'sub BX_BKGRDWRITE () {0x10;}' unless defined(&BX_BKGRDWRITE);
    eval 'sub BX_BKGRDMARKER () {0x20;}' unless defined(&BX_BKGRDMARKER);
    eval 'sub BX_ALTDATA () {0x40;}' unless defined(&BX_ALTDATA);
    eval 'sub BX_FSPRIV () {0xff0000;}' unless defined(&BX_FSPRIV);
    eval 'sub PRINT_BUF_XFLAGS () {"\\20\\7altdata\\6bkgrdmarker\\5bkgrdwrite\\3cvtenxio" "\\2clean\\1dirty";}' unless defined(&PRINT_BUF_XFLAGS);
    eval 'sub NOOFFSET () {(-1);}' unless defined(&NOOFFSET);
    eval 'sub BV_SCANNED () {0x1;}' unless defined(&BV_SCANNED);
    eval 'sub BV_BKGRDINPROG () {0x2;}' unless defined(&BV_BKGRDINPROG);
    eval 'sub BV_BKGRDWAIT () {0x4;}' unless defined(&BV_BKGRDWAIT);
    eval 'sub BV_BKGRDERR () {0x8;}' unless defined(&BV_BKGRDERR);
    eval 'sub PRINT_BUF_VFLAGS () {"\\20\\4bkgrderr\\3bkgrdwait\\2bkgrdinprog\\1scanned";}' unless defined(&PRINT_BUF_VFLAGS);
    if(defined(&_KERNEL)) {
	unless(defined(&NSWBUF_MIN)) {
	    eval 'sub NSWBUF_MIN () {16;}' unless defined(&NSWBUF_MIN);
	}
	require 'sys/proc.ph';
	require 'sys/mutex.ph';
	eval 'sub BUF_LOCKINIT {
	    my($bp, $wmesg) = @_;
    	    eval q( &lockinit(($bp)-> &b_lock,  &PRIBIO + 4, $wmesg, 0,  &LK_NEW));
	}' unless defined(&BUF_LOCKINIT);
	eval 'sub BUF_LOCK {
	    my($bp, $locktype, $interlock) = @_;
    	    eval q( &_lockmgr_args_rw(($bp)-> &b_lock, ($locktype), ($interlock),  &LK_WMESG_DEFAULT,  &LK_PRIO_DEFAULT,  &LK_TIMO_DEFAULT,  &LOCK_FILE,  &LOCK_LINE));
	}' unless defined(&BUF_LOCK);
	eval 'sub BUF_TIMELOCK {
	    my($bp, $locktype, $interlock, $wmesg, $catch, $timo) = @_;
    	    eval q( &_lockmgr_args_rw(($bp)-> &b_lock, ($locktype) |  &LK_TIMELOCK, ($interlock), ($wmesg), ( &PRIBIO + 4) | ($catch), ($timo),  &LOCK_FILE,  &LOCK_LINE));
	}' unless defined(&BUF_TIMELOCK);
	eval 'sub BUF_UNLOCK {
	    my($bp) = @_;
    	    eval q( &do {  &KASSERT((($bp)-> &b_flags &  &B_REMFREE) == 0, (\\"BUF_UNLOCK %p while B_REMFREE is still set.\\", ($bp)));  &BUF_UNLOCK_RAW(($bp)); }  &while (0));
	}' unless defined(&BUF_UNLOCK);
	eval 'sub BUF_UNLOCK_RAW {
	    my($bp) = @_;
    	    eval q( &do { ( &void) &_lockmgr_args(($bp)-> &b_lock,  &LK_RELEASE,  &NULL,  &LK_WMESG_DEFAULT,  &LK_PRIO_DEFAULT,  &LK_TIMO_DEFAULT,  &LOCK_FILE,  &LOCK_LINE); }  &while (0));
	}' unless defined(&BUF_UNLOCK_RAW);
	eval 'sub BUF_LOCKRECURSED {
	    my($bp) = @_;
    	    eval q( &lockmgr_recursed(($bp)-> &b_lock));
	}' unless defined(&BUF_LOCKRECURSED);
	eval 'sub BUF_ISLOCKED {
	    my($bp) = @_;
    	    eval q( &lockstatus(($bp)-> &b_lock));
	}' unless defined(&BUF_ISLOCKED);
	eval 'sub BUF_LOCKFREE {
	    my($bp) = @_;
    	    eval q( &lockdestroy(($bp)-> &b_lock));
	}' unless defined(&BUF_LOCKFREE);
	eval 'sub BUF_LOCKPRINTINFO {
	    my($bp) = @_;
    	    eval q( &lockmgr_printinfo(($bp)-> &b_lock));
	}' unless defined(&BUF_LOCKPRINTINFO);
	if(defined(&INVARIANTS)  && defined(&INVARIANT_SUPPORT)) {
	    eval 'sub BUF_ASSERT_LOCKED {
	        my($bp) = @_;
    		eval q( &_lockmgr_assert(($bp)-> &b_lock,  &KA_LOCKED,  &LOCK_FILE,  &LOCK_LINE));
	    }' unless defined(&BUF_ASSERT_LOCKED);
	    eval 'sub BUF_ASSERT_SLOCKED {
	        my($bp) = @_;
    		eval q( &_lockmgr_assert(($bp)-> &b_lock,  &KA_SLOCKED,  &LOCK_FILE,  &LOCK_LINE));
	    }' unless defined(&BUF_ASSERT_SLOCKED);
	    eval 'sub BUF_ASSERT_XLOCKED {
	        my($bp) = @_;
    		eval q( &_lockmgr_assert(($bp)-> &b_lock,  &KA_XLOCKED,  &LOCK_FILE,  &LOCK_LINE));
	    }' unless defined(&BUF_ASSERT_XLOCKED);
	    eval 'sub BUF_ASSERT_UNLOCKED {
	        my($bp) = @_;
    		eval q( &_lockmgr_assert(($bp)-> &b_lock,  &KA_UNLOCKED,  &LOCK_FILE,  &LOCK_LINE));
	    }' unless defined(&BUF_ASSERT_UNLOCKED);
	} else {
	    eval 'sub BUF_ASSERT_LOCKED {
	        my($bp) = @_;
    		eval q();
	    }' unless defined(&BUF_ASSERT_LOCKED);
	    eval 'sub BUF_ASSERT_SLOCKED {
	        my($bp) = @_;
    		eval q();
	    }' unless defined(&BUF_ASSERT_SLOCKED);
	    eval 'sub BUF_ASSERT_XLOCKED {
	        my($bp) = @_;
    		eval q();
	    }' unless defined(&BUF_ASSERT_XLOCKED);
	    eval 'sub BUF_ASSERT_UNLOCKED {
	        my($bp) = @_;
    		eval q();
	    }' unless defined(&BUF_ASSERT_UNLOCKED);
	}
	if(defined(&_SYS_PROC_H_)) {
	    eval 'sub BUF_KERNPROC {
	        my($bp) = @_;
    		eval q( &_lockmgr_disown(($bp)-> &b_lock,  &LOCK_FILE,  &LOCK_LINE));
	    }' unless defined(&BUF_KERNPROC);
	}
    }
    if(defined(&_KERNEL)) {
	eval 'sub bwrite {
	    my($bp) = @_;
    	    eval q({  &KASSERT( ($bp->{b_bufobj}) !=  &NULL, (\\"bwrite: no bufobj bp=%p\\", $bp));  &KASSERT( ($bp->{b_bufobj}->{bo_ops}) !=  &NULL, (\\"bwrite: no bo_ops bp=%p\\", $bp));  &KASSERT( ($bp->{b_bufobj}->{bo_ops}->{bop_write}) !=  &NULL, (\\"bwrite: no bop_write bp=%p\\", $bp)); ( &BO_WRITE( ($bp->{b_bufobj}), $bp)); });
	}' unless defined(&bwrite);
	eval 'sub bstrategy {
	    my($bp) = @_;
    	    eval q({  &KASSERT( ($bp->{b_bufobj}) !=  &NULL, (\\"bstrategy: no bufobj bp=%p\\", $bp));  &KASSERT( ($bp->{b_bufobj}->{bo_ops}) !=  &NULL, (\\"bstrategy: no bo_ops bp=%p\\", $bp));  &KASSERT( ($bp->{b_bufobj}->{bo_ops}->{bop_strategy}) !=  &NULL, (\\"bstrategy: no bop_strategy bp=%p\\", $bp));  &BO_STRATEGY( ($bp->{b_bufobj}), $bp); });
	}' unless defined(&bstrategy);
	eval 'sub buf_start {
	    my($bp) = @_;
    	    eval q({  &KASSERT(( ($bp->{b_flags}) &  &B_IOSTARTED) == 0, (\\"recursed buf_start %p\\", $bp));  ($bp->{b_flags}) |=  &B_IOSTARTED;  &if ( ($bioops->{io_start})) (* ($bioops->{io_start}))($bp); });
	}' unless defined(&buf_start);
	eval 'sub buf_complete {
	    my($bp) = @_;
    	    eval q({  &if (( ($bp->{b_flags}) &  &B_IOSTARTED) != 0) {  ($bp->{b_flags}) &= ~ &B_IOSTARTED;  &if ( ($bioops->{io_complete})) (* ($bioops->{io_complete}))($bp); } });
	}' unless defined(&buf_complete);
	eval 'sub buf_deallocate {
	    my($bp) = @_;
    	    eval q({  &if ( ($bioops->{io_deallocate})) (* ($bioops->{io_deallocate}))($bp); });
	}' unless defined(&buf_deallocate);
	eval 'sub buf_countdeps {
	    my($bp,$i) = @_;
    	    eval q({  &if ( ($b$ioops->{io_countdeps})) ((* ($b$ioops->{io_countdeps}))($bp, $i));  &else (0); });
	}' unless defined(&buf_countdeps);
# some #ifdef were dropped here -- fill in the blanks
	eval 'sub buf_track {
	    my($__unused,$__unused) = @_;
    	    eval q({ });
	}' unless defined(&buf_track);
    }
    eval 'sub clrbuf {
        my($bp) = @_;
	    eval q({  &bzero(-> &b_data, ($bp)-> &b_bcount); ($bp)-> &b_resid = 0; });
    }' unless defined(&clrbuf);
    eval 'sub GB_LOCK_NOWAIT () {0x1;}' unless defined(&GB_LOCK_NOWAIT);
    eval 'sub GB_NOCREAT () {0x2;}' unless defined(&GB_NOCREAT);
    eval 'sub GB_NOWAIT_BD () {0x4;}' unless defined(&GB_NOWAIT_BD);
    eval 'sub GB_UNMAPPED () {0x8;}' unless defined(&GB_UNMAPPED);
    eval 'sub GB_KVAALLOC () {0x10;}' unless defined(&GB_KVAALLOC);
    eval 'sub GB_CKHASH () {0x20;}' unless defined(&GB_CKHASH);
    eval 'sub GB_NOSPARSE () {0x40;}' unless defined(&GB_NOSPARSE);
    eval 'sub GB_CVTENXIO () {0x80;}' unless defined(&GB_CVTENXIO);
    eval 'sub GB_NOWITNESS () {0x100;}' unless defined(&GB_NOWITNESS);
    if(defined(&_KERNEL)) {
	eval 'sub buf_mapped {
	    my($bp) = @_;
    	    eval q({ ( ($bp->{b_data}) !=  &unmapped_buf); });
	}' unless defined(&buf_mapped);
	eval 'sub bread {
	    my($vp, $blkno, $size, $cred, $bpp) = @_;
    	    eval q( &breadn_flags($vp, $blkno, $blkno, $size,  &NULL,  &NULL, 0, $cred, 0,  &NULL, $bpp));
	}' unless defined(&bread);
	eval 'sub bread_gb {
	    my($vp, $blkno, $size, $cred, $gbflags, $bpp) = @_;
    	    eval q( &breadn_flags($vp, $blkno, $blkno, $size,  &NULL,  &NULL, 0, $cred, $gbflags,  &NULL, $bpp));
	}' unless defined(&bread_gb);
	eval 'sub breadn {
	    my($vp, $blkno, $size, $rablkno, $rabsize, $cnt, $cred, $bpp) = @_;
    	    eval q( &breadn_flags($vp, $blkno, $blkno, $size, $rablkno, $rabsize, $cnt, $cred, 0,  &NULL, $bpp));
	}' unless defined(&breadn);
    }
}
1;

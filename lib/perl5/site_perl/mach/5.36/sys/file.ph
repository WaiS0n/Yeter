require '_h2ph_pre.ph';

no warnings qw(redefine misc);

unless(defined(&_SYS_FILE_H_)) {
    eval 'sub _SYS_FILE_H_ () {1;}' unless defined(&_SYS_FILE_H_);
    unless(defined(&_KERNEL)) {
	require 'sys/types.ph';
	require 'sys/fcntl.ph';
	require 'sys/unistd.ph';
    } else {
	require 'sys/queue.ph';
	require 'sys/refcount.ph';
	require 'sys/_lock.ph';
	require 'sys/_mutex.ph';
	require 'vm/vm.ph';
    }
    eval 'sub DTYPE_NONE () {0;}' unless defined(&DTYPE_NONE);
    eval 'sub DTYPE_VNODE () {1;}' unless defined(&DTYPE_VNODE);
    eval 'sub DTYPE_SOCKET () {2;}' unless defined(&DTYPE_SOCKET);
    eval 'sub DTYPE_PIPE () {3;}' unless defined(&DTYPE_PIPE);
    eval 'sub DTYPE_FIFO () {4;}' unless defined(&DTYPE_FIFO);
    eval 'sub DTYPE_KQUEUE () {5;}' unless defined(&DTYPE_KQUEUE);
    eval 'sub DTYPE_CRYPTO () {6;}' unless defined(&DTYPE_CRYPTO);
    eval 'sub DTYPE_MQUEUE () {7;}' unless defined(&DTYPE_MQUEUE);
    eval 'sub DTYPE_SHM () {8;}' unless defined(&DTYPE_SHM);
    eval 'sub DTYPE_SEM () {9;}' unless defined(&DTYPE_SEM);
    eval 'sub DTYPE_PTS () {10;}' unless defined(&DTYPE_PTS);
    eval 'sub DTYPE_DEV () {11;}' unless defined(&DTYPE_DEV);
    eval 'sub DTYPE_PROCDESC () {12;}' unless defined(&DTYPE_PROCDESC);
    eval 'sub DTYPE_EVENTFD () {13;}' unless defined(&DTYPE_EVENTFD);
    eval 'sub DTYPE_TIMERFD () {14;}' unless defined(&DTYPE_TIMERFD);
    if(defined(&_KERNEL)) {
	eval 'sub FOF_OFFSET () {0x1;}' unless defined(&FOF_OFFSET);
	eval 'sub FOF_NOLOCK () {0x2;}' unless defined(&FOF_NOLOCK);
	eval 'sub FOF_NEXTOFF_R () {0x4;}' unless defined(&FOF_NEXTOFF_R);
	eval 'sub FOF_NEXTOFF_W () {0x8;}' unless defined(&FOF_NEXTOFF_W);
	eval 'sub FOF_NOUPDATE () {0x10;}' unless defined(&FOF_NOUPDATE);
	eval 'sub foffset_get {
	    my($fp) = @_;
    	    eval q({ ( &foffset_lock($fp,  &FOF_NOLOCK)); });
	}' unless defined(&foffset_get);
	eval 'sub DFLAG_PASSABLE () {0x1;}' unless defined(&DFLAG_PASSABLE);
	eval 'sub DFLAG_SEEKABLE () {0x2;}' unless defined(&DFLAG_SEEKABLE);
    }
    if(defined(&_KERNEL) || defined(&_WANT_FILE)) {
	if((defined(&__BSD_VISIBLE) ? &__BSD_VISIBLE : undef)) {
	    eval 'sub f_cdevpriv () { ($f_vnun->{fvn_cdevpriv});}' unless defined(&f_cdevpriv);
	    eval 'sub f_advice () { ($f_vnun->{fvn_advice});}' unless defined(&f_advice);
	    eval 'sub FOFFSET_LOCKED () {0x1;}' unless defined(&FOFFSET_LOCKED);
	    eval 'sub FOFFSET_LOCK_WAITING () {0x2;}' unless defined(&FOFFSET_LOCK_WAITING);
	}
    }
    if((defined(&__BSD_VISIBLE) ? &__BSD_VISIBLE : undef)) {
    }
    if(defined(&_KERNEL)) {
	eval 'sub fhold {
	    my($fp) = @_;
    	    eval q({ ( &refcount_acquire_checked( ($fp->{f_count}))); });
	}' unless defined(&fhold);
	eval 'sub fdrop {
	    my($fp, $td) = @_;
    	    eval q(({ \'struct file\' * &_fp; \'int\'  &_error;  &_error = 0;  &_fp = ($fp);  &if ( &__predict_false( &refcount_release(& ($_$fp->{f_count}))))  &_error =  &_fdrop( &_fp, $td);  &_error; }));
	}' unless defined(&fdrop);
	eval 'sub fdrop_close {
	    my($fp, $td) = @_;
    	    eval q(({ \'struct file\' * &_fp; \'int\'  &_error;  &_error = 0;  &_fp = ($fp);  &if ( &__predict_true( &refcount_release(& ($_$fp->{f_count}))))  &_error =  &_fdrop( &_fp, $td);  &_error; }));
	}' unless defined(&fdrop_close);
	eval 'sub fo_read {
	    my($fp,$uio,$active_cred,$flags,$td) = @_;
    	    eval q({ ((* ($fp->{f_ops}->{fo_read}))($fp, $uio, $active_cred, $flags, $td)); });
	}' unless defined(&fo_read);
	eval 'sub fo_write {
	    my($fp,$uio,$active_cred,$flags,$td) = @_;
    	    eval q({ ((* ($fp->{f_ops}->{fo_write}))($fp, $uio, $active_cred, $flags, $td)); });
	}' unless defined(&fo_write);
	eval 'sub fo_truncate {
	    my($fp,$length,$active_cred,$td) = @_;
    	    eval q({ ((* ($fp->{f_ops}->{fo_truncate}))($fp, $length, $active_cred, $td)); });
	}' unless defined(&fo_truncate);
	eval 'sub fo_ioctl {
	    my($fp,$com,$data,$active_cred,$td) = @_;
    	    eval q({ ((* ($fp->{f_ops}->{fo_ioctl}))($fp, $com, $data, $active_cred, $td)); });
	}' unless defined(&fo_ioctl);
	eval 'sub fo_poll {
	    my($fp,$events,$active_cred,$td) = @_;
    	    eval q({ ((* ($fp->{f_ops}->{fo_poll}))($fp, $events, $active_cred, $td)); });
	}' unless defined(&fo_poll);
	eval 'sub fo_stat {
	    my($fp,$sb,$active_cred) = @_;
    	    eval q({ ((* ($fp->{f_ops}->{fo_stat}))($fp, $sb, $active_cred)); });
	}' unless defined(&fo_stat);
	eval 'sub fo_close {
	    my($fp,$td) = @_;
    	    eval q({ ((* ($fp->{f_ops}->{fo_close}))($fp, $td)); });
	}' unless defined(&fo_close);
	eval 'sub fo_kqfilter {
	    my($fp,$kn) = @_;
    	    eval q({ ((* ($fp->{f_ops}->{fo_kqfilter}))($fp, $kn)); });
	}' unless defined(&fo_kqfilter);
	eval 'sub fo_chmod {
	    my($fp,$mode,$active_cred,$td) = @_;
    	    eval q({ ((* ($fp->{f_ops}->{fo_chmod}))($fp, $mode, $active_cred, $td)); });
	}' unless defined(&fo_chmod);
	eval 'sub fo_chown {
	    my($fp,$uid,$gid,$active_cred,$td) = @_;
    	    eval q({ ((* ($fp->{f_ops}->{fo_chown}))($fp, $uid, $gid, $active_cred, $td)); });
	}' unless defined(&fo_chown);
	eval 'sub fo_sendfile {
	    my($fp,$sockfd,$hdr_uio,$trl_uio,$offset,$nbytes,$sent,$flags,$td) = @_;
    	    eval q({ ((* ($fp->{f_ops}->{fo_sendfile}))($fp, $sockfd, $hdr_uio, $trl_uio, $offset, $nbytes, $sent, $flags, $td)); });
	}' unless defined(&fo_sendfile);
	eval 'sub fo_seek {
	    my($fp,$offset,$whence,$td) = @_;
    	    eval q({ ((* ($fp->{f_ops}->{fo_seek}))($fp, $offset, $whence, $td)); });
	}' unless defined(&fo_seek);
	eval 'sub fo_fill_kinfo {
	    my($fp,$kif,$fdp) = @_;
    	    eval q({ ((* ($fp->{f_ops}->{fo_fill_kinfo}))($fp, $kif, $fdp)); });
	}' unless defined(&fo_fill_kinfo);
	eval 'sub fo_mmap {
	    my($fp,$map,$addr,$size,$prot,$cap_maxprot,$flags,$foff,$td) = @_;
    	    eval q({  &if ( ($fp->{f_ops}->{fo_mmap}) ==  &NULL) ( &ENODEV); ((* ($fp->{f_ops}->{fo_mmap}))($fp, $map, $addr, $size, $prot, $cap_maxprot, $flags, $foff, $td)); });
	}' unless defined(&fo_mmap);
	eval 'sub fo_aio_queue {
	    my($fp,$job) = @_;
    	    eval q({ ((* ($fp->{f_ops}->{fo_aio_queue}))($fp, $job)); });
	}' unless defined(&fo_aio_queue);
	eval 'sub fo_add_seals {
	    my($fp,$seals) = @_;
    	    eval q({  &if ( ($fp->{f_ops}->{fo_add_seals}) ==  &NULL) ( &EINVAL); ((* ($fp->{f_ops}->{fo_add_seals}))($fp, $seals)); });
	}' unless defined(&fo_add_seals);
	eval 'sub fo_get_seals {
	    my($fp,$seals) = @_;
    	    eval q({  &if ( ($fp->{f_ops}->{fo_get_seals}) ==  &NULL) ( &EINVAL); ((* ($fp->{f_ops}->{fo_get_seals}))($fp, $seals)); });
	}' unless defined(&fo_get_seals);
	eval 'sub fo_fallocate {
	    my($fp,$offset,$len,$td) = @_;
    	    eval q({  &if ( ($fp->{f_ops}->{fo_fallocate}) ==  &NULL) ( &ENODEV); ((* ($fp->{f_ops}->{fo_fallocate}))($fp, $offset, $len, $td)); });
	}' unless defined(&fo_fallocate);
	eval 'sub fo_fspacectl {
	    my($fp,$cmd,$offset,$length,$flags,$active_cred,$td) = @_;
    	    eval q({  &if ( ($fp->{f_ops}->{fo_fspacectl}) ==  &NULL) ( &ENODEV); ((* ($fp->{f_ops}->{fo_fspacectl}))($fp, $cmd, $offset, $length, $flags, $active_cred, $td)); });
	}' unless defined(&fo_fspacectl);
	eval 'sub fo_cmp {
	    my($fp1,$fp2,$td) = @_;
    	    eval q({  &if ( ($fp1->{f_ops}->{fo_cmp}) ==  &NULL) ( &ENODEV); ((* ($fp1->{f_ops}->{fo_cmp}))($fp1, $fp2, $td)); });
	}' unless defined(&fo_cmp);
    }
}
1;

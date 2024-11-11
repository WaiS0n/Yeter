require '_h2ph_pre.ph';

no warnings qw(redefine misc);

unless(defined(&_RACCT_H_)) {
    eval 'sub _RACCT_H_ () {1;}' unless defined(&_RACCT_H_);
    require 'sys/cdefs.ph';
    require 'sys/types.ph';
    require 'sys/queue.ph';
    require 'sys/stdint.ph';
    require 'sys/sysctl.ph';
    eval 'sub RACCT_UNDEFINED () {-1;}' unless defined(&RACCT_UNDEFINED);
    eval 'sub RACCT_CPU () {0;}' unless defined(&RACCT_CPU);
    eval 'sub RACCT_DATA () {1;}' unless defined(&RACCT_DATA);
    eval 'sub RACCT_STACK () {2;}' unless defined(&RACCT_STACK);
    eval 'sub RACCT_CORE () {3;}' unless defined(&RACCT_CORE);
    eval 'sub RACCT_RSS () {4;}' unless defined(&RACCT_RSS);
    eval 'sub RACCT_MEMLOCK () {5;}' unless defined(&RACCT_MEMLOCK);
    eval 'sub RACCT_NPROC () {6;}' unless defined(&RACCT_NPROC);
    eval 'sub RACCT_NOFILE () {7;}' unless defined(&RACCT_NOFILE);
    eval 'sub RACCT_VMEM () {8;}' unless defined(&RACCT_VMEM);
    eval 'sub RACCT_NPTS () {9;}' unless defined(&RACCT_NPTS);
    eval 'sub RACCT_SWAP () {10;}' unless defined(&RACCT_SWAP);
    eval 'sub RACCT_NTHR () {11;}' unless defined(&RACCT_NTHR);
    eval 'sub RACCT_MSGQQUEUED () {12;}' unless defined(&RACCT_MSGQQUEUED);
    eval 'sub RACCT_MSGQSIZE () {13;}' unless defined(&RACCT_MSGQSIZE);
    eval 'sub RACCT_NMSGQ () {14;}' unless defined(&RACCT_NMSGQ);
    eval 'sub RACCT_NSEM () {15;}' unless defined(&RACCT_NSEM);
    eval 'sub RACCT_NSEMOP () {16;}' unless defined(&RACCT_NSEMOP);
    eval 'sub RACCT_NSHM () {17;}' unless defined(&RACCT_NSHM);
    eval 'sub RACCT_SHMSIZE () {18;}' unless defined(&RACCT_SHMSIZE);
    eval 'sub RACCT_WALLCLOCK () {19;}' unless defined(&RACCT_WALLCLOCK);
    eval 'sub RACCT_PCTCPU () {20;}' unless defined(&RACCT_PCTCPU);
    eval 'sub RACCT_READBPS () {21;}' unless defined(&RACCT_READBPS);
    eval 'sub RACCT_WRITEBPS () {22;}' unless defined(&RACCT_WRITEBPS);
    eval 'sub RACCT_READIOPS () {23;}' unless defined(&RACCT_READIOPS);
    eval 'sub RACCT_WRITEIOPS () {24;}' unless defined(&RACCT_WRITEIOPS);
    eval 'sub RACCT_MAX () { &RACCT_WRITEIOPS;}' unless defined(&RACCT_MAX);
    eval 'sub RACCT_IN_MILLIONS () {0x1;}' unless defined(&RACCT_IN_MILLIONS);
    eval 'sub RACCT_RECLAIMABLE () {0x2;}' unless defined(&RACCT_RECLAIMABLE);
    eval 'sub RACCT_INHERITABLE () {0x4;}' unless defined(&RACCT_INHERITABLE);
    eval 'sub RACCT_DENIABLE () {0x8;}' unless defined(&RACCT_DENIABLE);
    eval 'sub RACCT_SLOPPY () {0x10;}' unless defined(&RACCT_SLOPPY);
    eval 'sub RACCT_DECAYING () {0x20;}' unless defined(&RACCT_DECAYING);
    eval 'sub ASSERT_RACCT_ENABLED () {
        eval q( &KASSERT( &racct_enable, (\\"%s called with !racct_enable\\",  &__func__)));
    }' unless defined(&ASSERT_RACCT_ENABLED);
    eval 'sub RACCT_IS_IN_MILLIONS {
        my($X) = @_;
	    eval q((($X) !=  &RACCT_UNDEFINED  && ( $racct_types[($X)] &  &RACCT_IN_MILLIONS) != 0));
    }' unless defined(&RACCT_IS_IN_MILLIONS);
    eval 'sub RACCT_IS_RECLAIMABLE {
        my($X) = @_;
	    eval q(( $racct_types[$X] &  &RACCT_RECLAIMABLE));
    }' unless defined(&RACCT_IS_RECLAIMABLE);
    eval 'sub RACCT_IS_INHERITABLE {
        my($X) = @_;
	    eval q(( $racct_types[$X] &  &RACCT_INHERITABLE));
    }' unless defined(&RACCT_IS_INHERITABLE);
    eval 'sub RACCT_IS_DENIABLE {
        my($X) = @_;
	    eval q(( $racct_types[$X] &  &RACCT_DENIABLE));
    }' unless defined(&RACCT_IS_DENIABLE);
    eval 'sub RACCT_IS_SLOPPY {
        my($X) = @_;
	    eval q(( $racct_types[$X] &  &RACCT_SLOPPY));
    }' unless defined(&RACCT_IS_SLOPPY);
    eval 'sub RACCT_IS_DECAYING {
        my($X) = @_;
	    eval q(( $racct_types[$X] &  &RACCT_DECAYING));
    }' unless defined(&RACCT_IS_DECAYING);
    eval 'sub RACCT_CAN_DROP {
        my($X) = @_;
	    eval q(( &RACCT_IS_RECLAIMABLE($X) |  &RACCT_IS_DECAYING($X)));
    }' unless defined(&RACCT_CAN_DROP);
    if(defined(&RACCT)) {
	eval 'sub RACCT_LOCK () {
	    eval q( &mtx_lock( &racct_lock));
	}' unless defined(&RACCT_LOCK);
	eval 'sub RACCT_UNLOCK () {
	    eval q( &mtx_unlock( &racct_lock));
	}' unless defined(&RACCT_UNLOCK);
	eval 'sub RACCT_LOCK_ASSERT () {
	    eval q( &mtx_assert( &racct_lock,  &MA_OWNED));
	}' unless defined(&RACCT_LOCK_ASSERT);
	eval 'sub RACCT_ENABLED () {
	    eval q( &__predict_false( &racct_enable));
	}' unless defined(&RACCT_ENABLED);
	eval 'sub RACCT_PROC_LOCK {
	    my($p) = @_;
    	    eval q( &do {  &if ( &RACCT_ENABLED())  &PROC_LOCK($p); }  &while (0));
	}' unless defined(&RACCT_PROC_LOCK);
	eval 'sub RACCT_PROC_UNLOCK {
	    my($p) = @_;
    	    eval q( &do {  &if ( &RACCT_ENABLED())  &PROC_UNLOCK($p); }  &while (0));
	}' unless defined(&RACCT_PROC_UNLOCK);
    } else {
	eval 'sub RACCT_PROC_LOCK {
	    my($p) = @_;
    	    eval q( &do { }  &while (0));
	}' unless defined(&RACCT_PROC_LOCK);
	eval 'sub RACCT_PROC_UNLOCK {
	    my($p) = @_;
    	    eval q( &do { }  &while (0));
	}' unless defined(&RACCT_PROC_UNLOCK);
	eval 'sub racct_add {
	    my($p,$resource,$amount) = @_;
    	    eval q({ (0); });
	}' unless defined(&racct_add);
	eval 'sub racct_add_cred {
	    my($cred,$resource,$amount) = @_;
    	    eval q({ });
	}' unless defined(&racct_add_cred);
	eval 'sub racct_add_force {
	    my($p,$resource,$amount) = @_;
    	    eval q({ });
	}' unless defined(&racct_add_force);
	eval 'sub racct_set {
	    my($p,$resource,$amount) = @_;
    	    eval q({ (0); });
	}' unless defined(&racct_set);
	eval 'sub racct_set_force {
	    my($p,$resource,$amount) = @_;
    	    eval q({ });
	}' unless defined(&racct_set_force);
	eval 'sub racct_sub {
	    my($p,$resource,$amount) = @_;
    	    eval q({ });
	}' unless defined(&racct_sub);
	eval 'sub racct_sub_cred {
	    my($cred,$resource,$amount) = @_;
    	    eval q({ });
	}' unless defined(&racct_sub_cred);
	eval 'sub racct_get_limit {
	    my($p,$resource) = @_;
    	    eval q({ ( &UINT64_MAX); });
	}' unless defined(&racct_get_limit);
	eval 'sub racct_get_available {
	    my($p,$resource) = @_;
    	    eval q({ ( &UINT64_MAX); });
	}' unless defined(&racct_get_available);
	eval 'sub racct_create {
	    my($x) = @_;
    	    eval q();
	}' unless defined(&racct_create);
	eval 'sub racct_destroy {
	    my($x) = @_;
    	    eval q();
	}' unless defined(&racct_destroy);
	eval 'sub racct_proc_fork {
	    my($parent,$child) = @_;
    	    eval q({ (0); });
	}' unless defined(&racct_proc_fork);
	eval 'sub racct_proc_fork_done {
	    my($child) = @_;
    	    eval q({ });
	}' unless defined(&racct_proc_fork_done);
	eval 'sub racct_proc_exit {
	    my($p) = @_;
    	    eval q({ });
	}' unless defined(&racct_proc_exit);
    }
}
1;

require '_h2ph_pre.ph';

no warnings qw(redefine misc);

unless(defined(&_SYS_LOCKSTAT_H)) {
    eval 'sub _SYS_LOCKSTAT_H () {1;}' unless defined(&_SYS_LOCKSTAT_H);
    if(defined(&_KERNEL)) {
	require 'sys/param.ph';
	require 'sys/queue.ph';
	require 'sys/sdt.ph';
	eval 'sub LOCKSTAT_WRITER () {0;}' unless defined(&LOCKSTAT_WRITER);
	eval 'sub LOCKSTAT_READER () {1;}' unless defined(&LOCKSTAT_READER);
	if(defined(&KDTRACE_HOOKS)) {
	    eval 'sub LOCKSTAT_RECORD0 {
	        my($probe, $lp) = @_;
    		eval q( &SDT_PROBE1( &lockstat, , , $probe, $lp));
	    }' unless defined(&LOCKSTAT_RECORD0);
	    eval 'sub LOCKSTAT_RECORD1 {
	        my($probe, $lp, $arg1) = @_;
    		eval q( &SDT_PROBE2( &lockstat, , , $probe, $lp, $arg1));
	    }' unless defined(&LOCKSTAT_RECORD1);
	    eval 'sub LOCKSTAT_RECORD2 {
	        my($probe, $lp, $arg1, $arg2) = @_;
    		eval q( &SDT_PROBE3( &lockstat, , , $probe, $lp, $arg1, $arg2));
	    }' unless defined(&LOCKSTAT_RECORD2);
	    eval 'sub LOCKSTAT_RECORD3 {
	        my($probe, $lp, $arg1, $arg2, $arg3) = @_;
    		eval q( &SDT_PROBE4( &lockstat, , , $probe, $lp, $arg1, $arg2, $arg3));
	    }' unless defined(&LOCKSTAT_RECORD3);
	    eval 'sub LOCKSTAT_RECORD4 {
	        my($probe, $lp, $arg1, $arg2, $arg3, $arg4) = @_;
    		eval q( &SDT_PROBE5( &lockstat, , , $probe, $lp, $arg1, $arg2, $arg3, $arg4));
	    }' unless defined(&LOCKSTAT_RECORD4);
	    eval 'sub LOCKSTAT_PROFILE_OBTAIN_LOCK_SUCCESS {
	        my($probe, $lp, $c, $wt, $f, $l) = @_;
    		eval q( &do {  &lock_profile_obtain_lock_success(($lp)-> &lock_object,  &false, $c, $wt, $f, $l);  &LOCKSTAT_RECORD0($probe, $lp); }  &while (0));
	    }' unless defined(&LOCKSTAT_PROFILE_OBTAIN_LOCK_SUCCESS);
	    eval 'sub LOCKSTAT_PROFILE_OBTAIN_SPIN_LOCK_SUCCESS {
	        my($probe, $lp, $c, $wt, $f, $l) = @_;
    		eval q( &do {  &lock_profile_obtain_lock_success(($lp)-> &lock_object,  &true, $c, $wt, $f, $l);  &LOCKSTAT_RECORD0($probe, $lp); }  &while (0));
	    }' unless defined(&LOCKSTAT_PROFILE_OBTAIN_SPIN_LOCK_SUCCESS);
	    eval 'sub LOCKSTAT_PROFILE_OBTAIN_RWLOCK_SUCCESS {
	        my($probe, $lp, $c, $wt, $f, $l, $a) = @_;
    		eval q( &do {  &lock_profile_obtain_lock_success(($lp)-> &lock_object,  &false, $c, $wt, $f, $l);  &LOCKSTAT_RECORD1($probe, $lp, $a); }  &while (0));
	    }' unless defined(&LOCKSTAT_PROFILE_OBTAIN_RWLOCK_SUCCESS);
	    eval 'sub LOCKSTAT_PROFILE_RELEASE_LOCK {
	        my($probe, $lp) = @_;
    		eval q( &do {  &lock_profile_release_lock(($lp)-> &lock_object,  &false);  &LOCKSTAT_RECORD0($probe, $lp); }  &while (0));
	    }' unless defined(&LOCKSTAT_PROFILE_RELEASE_LOCK);
	    eval 'sub LOCKSTAT_PROFILE_RELEASE_SPIN_LOCK {
	        my($probe, $lp) = @_;
    		eval q( &do {  &lock_profile_release_lock(($lp)-> &lock_object,  &true);  &LOCKSTAT_RECORD0($probe, $lp); }  &while (0));
	    }' unless defined(&LOCKSTAT_PROFILE_RELEASE_SPIN_LOCK);
	    eval 'sub LOCKSTAT_PROFILE_RELEASE_RWLOCK {
	        my($probe, $lp, $a) = @_;
    		eval q( &do {  &lock_profile_release_lock(($lp)-> &lock_object,  &false);  &LOCKSTAT_RECORD1($probe, $lp, $a); }  &while (0));
	    }' unless defined(&LOCKSTAT_PROFILE_RELEASE_RWLOCK);
	    eval 'sub LOCKSTAT_PROFILE_ENABLED {
	        my($probe) = @_;
    		eval q( &__predict_false( &lockstat_enabled));
	    }' unless defined(&LOCKSTAT_PROFILE_ENABLED);
	} else {
	    eval 'sub LOCKSTAT_RECORD0 {
	        my($probe, $lp) = @_;
    		eval q();
	    }' unless defined(&LOCKSTAT_RECORD0);
	    eval 'sub LOCKSTAT_RECORD1 {
	        my($probe, $lp, $arg1) = @_;
    		eval q();
	    }' unless defined(&LOCKSTAT_RECORD1);
	    eval 'sub LOCKSTAT_RECORD2 {
	        my($probe, $lp, $arg1, $arg2) = @_;
    		eval q();
	    }' unless defined(&LOCKSTAT_RECORD2);
	    eval 'sub LOCKSTAT_RECORD3 {
	        my($probe, $lp, $arg1, $arg2, $arg3) = @_;
    		eval q();
	    }' unless defined(&LOCKSTAT_RECORD3);
	    eval 'sub LOCKSTAT_RECORD4 {
	        my($probe, $lp, $arg1, $arg2, $arg3, $arg4) = @_;
    		eval q();
	    }' unless defined(&LOCKSTAT_RECORD4);
	    eval 'sub LOCKSTAT_PROFILE_OBTAIN_LOCK_SUCCESS {
	        my($probe, $lp, $c, $wt, $f, $l) = @_;
    		eval q( &lock_profile_obtain_lock_success(($lp)-> &lock_object,  &false, $c, $wt, $f, $l));
	    }' unless defined(&LOCKSTAT_PROFILE_OBTAIN_LOCK_SUCCESS);
	    eval 'sub LOCKSTAT_PROFILE_OBTAIN_SPIN_LOCK_SUCCESS {
	        my($probe, $lp, $c, $wt, $f, $l) = @_;
    		eval q( &lock_profile_obtain_lock_success(($lp)-> &lock_object,  &true, $c, $wt, $f, $l));
	    }' unless defined(&LOCKSTAT_PROFILE_OBTAIN_SPIN_LOCK_SUCCESS);
	    eval 'sub LOCKSTAT_PROFILE_OBTAIN_RWLOCK_SUCCESS {
	        my($probe, $lp, $c, $wt, $f, $l, $a) = @_;
    		eval q( &LOCKSTAT_PROFILE_OBTAIN_LOCK_SUCCESS($probe, $lp, $c, $wt, $f, $l));
	    }' unless defined(&LOCKSTAT_PROFILE_OBTAIN_RWLOCK_SUCCESS);
	    eval 'sub LOCKSTAT_PROFILE_RELEASE_LOCK {
	        my($probe, $lp) = @_;
    		eval q( &lock_profile_release_lock(($lp)-> &lock_object,  &false));
	    }' unless defined(&LOCKSTAT_PROFILE_RELEASE_LOCK);
	    eval 'sub LOCKSTAT_PROFILE_RELEASE_SPIN_LOCK {
	        my($probe, $lp) = @_;
    		eval q( &lock_profile_release_lock(($lp)-> &lock_object,  &true));
	    }' unless defined(&LOCKSTAT_PROFILE_RELEASE_SPIN_LOCK);
	    eval 'sub LOCKSTAT_PROFILE_RELEASE_RWLOCK {
	        my($probe, $lp, $a) = @_;
    		eval q( &LOCKSTAT_PROFILE_RELEASE_LOCK($probe, $lp));
	    }' unless defined(&LOCKSTAT_PROFILE_RELEASE_RWLOCK);
	    eval 'sub LOCKSTAT_PROFILE_ENABLED {
	        my($probe) = @_;
    		eval q(0);
	    }' unless defined(&LOCKSTAT_PROFILE_ENABLED);
	}
    }
}
1;

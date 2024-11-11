require '_h2ph_pre.ph';

no warnings qw(redefine misc);

unless(defined(&_SYS_LOCK_PROFILE_H_)) {
    eval 'sub _SYS_LOCK_PROFILE_H_ () {1;}' unless defined(&_SYS_LOCK_PROFILE_H_);
    if(defined(&_KERNEL)) {
	if(defined(&LOCK_PROFILING)) {
	    require 'machine/cpufunc.ph';
	    require 'sys/lock.ph';
	    unless(defined(&USE_CPU_NANOSECONDS)) {
	    }
	    eval 'sub lock_profile_obtain_lock_failed {
	        my($lo,$spin,$contested,$waittime) = @_;
    		eval q({  &if (! &lock_prof_enable || ( ($lo->{lo_flags}) &  &LO_NOPROFILE) || *$contested) ; *$waittime =  &nanoseconds(); *$contested = 1; });
	    }' unless defined(&lock_profile_obtain_lock_failed);
	} else {
	    eval 'sub lock_profile_release_lock {
	        my($lo, $spin) = @_;
    		eval q(( &void)0);
	    }' unless defined(&lock_profile_release_lock);
	    eval 'sub lock_profile_obtain_lock_failed {
	        my($lo, $spin, $contested, $waittime) = @_;
    		eval q(( &void)0);
	    }' unless defined(&lock_profile_obtain_lock_failed);
	    eval 'sub lock_profile_obtain_lock_success {
	        my($lo, $spin, $contested, $waittime, $file, $line) = @_;
    		eval q(( &void)0);
	    }' unless defined(&lock_profile_obtain_lock_success);
	    eval 'sub lock_profile_thread_exit {
	        my($td) = @_;
    		eval q(( &void)0);
	    }' unless defined(&lock_profile_thread_exit);
	}
    }
}
1;

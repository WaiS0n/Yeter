require '_h2ph_pre.ph';

no warnings qw(redefine misc);

unless(defined(&_SYS_CONDVAR_H_)) {
    eval 'sub _SYS_CONDVAR_H_ () {1;}' unless defined(&_SYS_CONDVAR_H_);
    if(defined(&_KERNEL)) {
	require 'sys/types.ph';
	eval 'sub cv_wait {
	    my($cvp, $lock) = @_;
    	    eval q( &_cv_wait(($cvp), ($lock)-> &lock_object));
	}' unless defined(&cv_wait);
	eval 'sub cv_wait_unlock {
	    my($cvp, $lock) = @_;
    	    eval q( &_cv_wait_unlock(($cvp), ($lock)-> &lock_object));
	}' unless defined(&cv_wait_unlock);
	eval 'sub cv_wait_sig {
	    my($cvp, $lock) = @_;
    	    eval q( &_cv_wait_sig(($cvp), ($lock)-> &lock_object));
	}' unless defined(&cv_wait_sig);
	eval 'sub cv_timedwait {
	    my($cvp, $lock, $timo) = @_;
    	    eval q( &_cv_timedwait_sbt(($cvp), ($lock)-> &lock_object,  &tick_sbt * ($timo), 0,  &C_HARDCLOCK));
	}' unless defined(&cv_timedwait);
	eval 'sub cv_timedwait_sbt {
	    my($cvp, $lock, $sbt, $pr, $flags) = @_;
    	    eval q( &_cv_timedwait_sbt(($cvp), ($lock)-> &lock_object, ($sbt), ($pr), ($flags)));
	}' unless defined(&cv_timedwait_sbt);
	eval 'sub cv_timedwait_sig {
	    my($cvp, $lock, $timo) = @_;
    	    eval q( &_cv_timedwait_sig_sbt(($cvp), ($lock)-> &lock_object,  &tick_sbt * ($timo), 0,  &C_HARDCLOCK));
	}' unless defined(&cv_timedwait_sig);
	eval 'sub cv_timedwait_sig_sbt {
	    my($cvp, $lock, $sbt, $pr, $flags) = @_;
    	    eval q( &_cv_timedwait_sig_sbt(($cvp), ($lock)-> &lock_object, ($sbt), ($pr), ($flags)));
	}' unless defined(&cv_timedwait_sig_sbt);
	eval 'sub cv_broadcast {
	    my($cvp) = @_;
    	    eval q( &cv_broadcastpri($cvp, 0));
	}' unless defined(&cv_broadcast);
	eval 'sub cv_wmesg {
	    my($cvp) = @_;
    	    eval q((($cvp)-> &cv_description));
	}' unless defined(&cv_wmesg);
    }
}
1;

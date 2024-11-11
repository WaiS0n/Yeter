require '_h2ph_pre.ph';

no warnings qw(redefine misc);

unless(defined(&_SYS_SEMA_H_)) {
    eval 'sub _SYS_SEMA_H_ () {1;}' unless defined(&_SYS_SEMA_H_);
    require 'sys/queue.ph';
    require 'sys/_lock.ph';
    require 'sys/_mutex.ph';
    require 'sys/condvar.ph';
    if(defined(&_KERNEL)) {
	eval 'sub sema_post {
	    my($sema) = @_;
    	    eval q( &_sema_post(($sema),  &LOCK_FILE,  &LOCK_LINE));
	}' unless defined(&sema_post);
	eval 'sub sema_wait {
	    my($sema) = @_;
    	    eval q( &_sema_wait(($sema),  &LOCK_FILE,  &LOCK_LINE));
	}' unless defined(&sema_wait);
	eval 'sub sema_timedwait {
	    my($sema, $timo) = @_;
    	    eval q( &_sema_timedwait(($sema), ($timo),  &LOCK_FILE,  &LOCK_LINE));
	}' unless defined(&sema_timedwait);
	eval 'sub sema_trywait {
	    my($sema) = @_;
    	    eval q( &_sema_trywait(($sema),  &LOCK_FILE,  &LOCK_LINE));
	}' unless defined(&sema_trywait);
    }
}
1;

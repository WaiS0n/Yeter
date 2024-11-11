require '_h2ph_pre.ph';

no warnings qw(redefine misc);

unless(defined(&_SYS_TTY_H_)) {
    eval 'sub _SYS_TTY_H_ () {1;}' unless defined(&_SYS_TTY_H_);
    require 'sys/param.ph';
    require 'sys/queue.ph';
    require 'sys/lock.ph';
    require 'sys/mutex.ph';
    require 'sys/condvar.ph';
    require 'sys/selinfo.ph';
    require 'sys/_termios.ph';
    require 'sys/ttycom.ph';
    require 'sys/ttyqueue.ph';
    eval 'sub TF_NOPREFIX () {0x1;}' unless defined(&TF_NOPREFIX);
    eval 'sub TF_INITLOCK () {0x2;}' unless defined(&TF_INITLOCK);
    eval 'sub TF_CALLOUT () {0x4;}' unless defined(&TF_CALLOUT);
    eval 'sub TF_OPENED_IN () {0x8;}' unless defined(&TF_OPENED_IN);
    eval 'sub TF_OPENED_OUT () {0x10;}' unless defined(&TF_OPENED_OUT);
    eval 'sub TF_OPENED_CONS () {0x20;}' unless defined(&TF_OPENED_CONS);
    eval 'sub TF_OPENED () {( &TF_OPENED_IN| &TF_OPENED_OUT| &TF_OPENED_CONS);}' unless defined(&TF_OPENED);
    eval 'sub TF_GONE () {0x40;}' unless defined(&TF_GONE);
    eval 'sub TF_OPENCLOSE () {0x80;}' unless defined(&TF_OPENCLOSE);
    eval 'sub TF_ASYNC () {0x100;}' unless defined(&TF_ASYNC);
    eval 'sub TF_LITERAL () {0x200;}' unless defined(&TF_LITERAL);
    eval 'sub TF_HIWAT_IN () {0x400;}' unless defined(&TF_HIWAT_IN);
    eval 'sub TF_HIWAT_OUT () {0x800;}' unless defined(&TF_HIWAT_OUT);
    eval 'sub TF_HIWAT () {( &TF_HIWAT_IN| &TF_HIWAT_OUT);}' unless defined(&TF_HIWAT);
    eval 'sub TF_STOPPED () {0x1000;}' unless defined(&TF_STOPPED);
    eval 'sub TF_EXCLUDE () {0x2000;}' unless defined(&TF_EXCLUDE);
    eval 'sub TF_BYPASS () {0x4000;}' unless defined(&TF_BYPASS);
    eval 'sub TF_ZOMBIE () {0x8000;}' unless defined(&TF_ZOMBIE);
    eval 'sub TF_HOOK () {0x10000;}' unless defined(&TF_HOOK);
    eval 'sub TF_BUSY_IN () {0x20000;}' unless defined(&TF_BUSY_IN);
    eval 'sub TF_BUSY_OUT () {0x40000;}' unless defined(&TF_BUSY_OUT);
    eval 'sub TF_BUSY () {( &TF_BUSY_IN| &TF_BUSY_OUT);}' unless defined(&TF_BUSY);
    if(defined(&_KERNEL)) {
	eval 'sub TTYUNIT_INIT () {0x1;}' unless defined(&TTYUNIT_INIT);
	eval 'sub TTYUNIT_LOCK () {0x2;}' unless defined(&TTYUNIT_LOCK);
	eval 'sub TTYUNIT_CALLOUT () {0x4;}' unless defined(&TTYUNIT_CALLOUT);
	eval 'sub tty_lock {
	    my($tp) = @_;
    	    eval q( &mtx_lock(($tp)-> &t_mtx));
	}' unless defined(&tty_lock);
	eval 'sub tty_unlock {
	    my($tp) = @_;
    	    eval q( &mtx_unlock(($tp)-> &t_mtx));
	}' unless defined(&tty_unlock);
	eval 'sub tty_lock_owned {
	    my($tp) = @_;
    	    eval q( &mtx_owned(($tp)-> &t_mtx));
	}' unless defined(&tty_lock_owned);
	eval 'sub tty_assert_locked {
	    my($tp) = @_;
    	    eval q( &mtx_assert(($tp)-> &t_mtx,  &MA_OWNED));
	}' unless defined(&tty_assert_locked);
	eval 'sub tty_getlock {
	    my($tp) = @_;
    	    eval q((($tp)-> &t_mtx));
	}' unless defined(&tty_getlock);
	eval 'sub tty_lock_assert {
	    my($tp, $ma) = @_;
    	    eval q( &mtx_assert(($tp)-> &t_mtx, ($ma)));
	}' unless defined(&tty_lock_assert);
	eval 'sub TTYMK_CLONING () {0x1;}' unless defined(&TTYMK_CLONING);
	eval 'sub tty_makedev () {( &tp,  &cred,  &fmt, ...) ( &void ) &tty_makedevf(( &tp), ( &cred), 0, ( &fmt),   &__VA_ARGS__);}' unless defined(&tty_makedev);
	eval 'sub tty_makealias () {( &tp, &fmt,...)  &make_dev_alias(( &tp)-> &t_dev,  &fmt,   &__VA_ARGS__);}' unless defined(&tty_makealias);
	eval 'sub tty_opened {
	    my($tp) = @_;
    	    eval q((($tp)-> &t_flags &  &TF_OPENED));
	}' unless defined(&tty_opened);
	eval 'sub tty_gone {
	    my($tp) = @_;
    	    eval q((($tp)-> &t_flags &  &TF_GONE));
	}' unless defined(&tty_gone);
	eval 'sub tty_softc {
	    my($tp) = @_;
    	    eval q((($tp)-> &t_devswsoftc));
	}' unless defined(&tty_softc);
	eval 'sub tty_devname {
	    my($tp) = @_;
    	    eval q( &devtoname(($tp)-> &t_dev));
	}' unless defined(&tty_devname);
	require 'sys/ttydisc.ph';
	require 'sys/ttydevsw.ph';
	require 'sys/ttyhook.ph';
    }
}
1;

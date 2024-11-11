require '_h2ph_pre.ph';

no warnings qw(redefine misc);

unless(defined(&_SYS_PRIORITY_H_)) {
    eval 'sub _SYS_PRIORITY_H_ () {1;}' unless defined(&_SYS_PRIORITY_H_);
    eval 'sub PRI_ITHD () {1;}' unless defined(&PRI_ITHD);
    eval 'sub PRI_REALTIME () {2;}' unless defined(&PRI_REALTIME);
    eval 'sub PRI_TIMESHARE () {3;}' unless defined(&PRI_TIMESHARE);
    eval 'sub PRI_IDLE () {4;}' unless defined(&PRI_IDLE);
    eval 'sub PRI_FIFO_BIT () {8;}' unless defined(&PRI_FIFO_BIT);
    eval 'sub PRI_FIFO () {( &PRI_FIFO_BIT |  &PRI_REALTIME);}' unless defined(&PRI_FIFO);
    eval 'sub PRI_BASE {
        my($P) = @_;
	    eval q((($P) & ~ &PRI_FIFO_BIT));
    }' unless defined(&PRI_BASE);
    eval 'sub PRI_IS_REALTIME {
        my($P) = @_;
	    eval q(( &PRI_BASE($P) ==  &PRI_REALTIME));
    }' unless defined(&PRI_IS_REALTIME);
    eval 'sub PRI_NEED_RR {
        my($P) = @_;
	    eval q((($P) !=  &PRI_FIFO));
    }' unless defined(&PRI_NEED_RR);
    eval 'sub PRI_MIN () {(0);}' unless defined(&PRI_MIN);
    eval 'sub PRI_MAX () {(255);}' unless defined(&PRI_MAX);
    eval 'sub PRI_MIN_ITHD () {( &PRI_MIN);}' unless defined(&PRI_MIN_ITHD);
    eval 'sub PRI_MAX_ITHD () {( &PRI_MIN_REALTIME - 1);}' unless defined(&PRI_MAX_ITHD);
    eval 'sub PI_REALTIME () {( &PRI_MIN_ITHD + 0);}' unless defined(&PI_REALTIME);
    eval 'sub PI_INTR () {( &PRI_MIN_ITHD + 4);}' unless defined(&PI_INTR);
    eval 'sub PI_AV () { &PI_INTR;}' unless defined(&PI_AV);
    eval 'sub PI_NET () { &PI_INTR;}' unless defined(&PI_NET);
    eval 'sub PI_DISK () { &PI_INTR;}' unless defined(&PI_DISK);
    eval 'sub PI_TTY () { &PI_INTR;}' unless defined(&PI_TTY);
    eval 'sub PI_DULL () { &PI_INTR;}' unless defined(&PI_DULL);
    eval 'sub PI_SOFT () {( &PRI_MIN_ITHD + 8);}' unless defined(&PI_SOFT);
    eval 'sub PI_SOFTCLOCK () { &PI_SOFT;}' unless defined(&PI_SOFTCLOCK);
    eval 'sub PI_SWI {
        my($x) = @_;
	    eval q( &PI_SOFT);
    }' unless defined(&PI_SWI);
    eval 'sub PRI_MIN_REALTIME () {(16);}' unless defined(&PRI_MIN_REALTIME);
    eval 'sub PRI_MAX_REALTIME () {( &PRI_MIN_KERN - 1);}' unless defined(&PRI_MAX_REALTIME);
    eval 'sub PRI_MIN_KERN () {(48);}' unless defined(&PRI_MIN_KERN);
    eval 'sub PRI_MAX_KERN () {( &PRI_MIN_TIMESHARE - 1);}' unless defined(&PRI_MAX_KERN);
    eval 'sub PSWP () {( &PRI_MIN_KERN + 0);}' unless defined(&PSWP);
    eval 'sub PVM () {( &PRI_MIN_KERN + 4);}' unless defined(&PVM);
    eval 'sub PINOD () {( &PRI_MIN_KERN + 8);}' unless defined(&PINOD);
    eval 'sub PRIBIO () {( &PRI_MIN_KERN + 12);}' unless defined(&PRIBIO);
    eval 'sub PVFS () {( &PRI_MIN_KERN + 16);}' unless defined(&PVFS);
    eval 'sub PZERO () {( &PRI_MIN_KERN + 20);}' unless defined(&PZERO);
    eval 'sub PSOCK () {( &PRI_MIN_KERN + 24);}' unless defined(&PSOCK);
    eval 'sub PWAIT () {( &PRI_MIN_KERN + 28);}' unless defined(&PWAIT);
    eval 'sub PLOCK () {( &PRI_MIN_KERN + 32);}' unless defined(&PLOCK);
    eval 'sub PPAUSE () {( &PRI_MIN_KERN + 36);}' unless defined(&PPAUSE);
    eval 'sub PRI_MIN_TIMESHARE () {(88);}' unless defined(&PRI_MIN_TIMESHARE);
    eval 'sub PRI_MAX_TIMESHARE () {( &PRI_MIN_IDLE - 1);}' unless defined(&PRI_MAX_TIMESHARE);
    eval 'sub PUSER () {( &PRI_MIN_TIMESHARE);}' unless defined(&PUSER);
    eval 'sub PRI_MIN_IDLE () {(224);}' unless defined(&PRI_MIN_IDLE);
    eval 'sub PRI_MAX_IDLE () {( &PRI_MAX);}' unless defined(&PRI_MAX_IDLE);
    if(defined(&_KERNEL)) {
	eval 'sub PRI_USER () {-2;}' unless defined(&PRI_USER);
	eval 'sub PRI_UNCHANGED () {-1;}' unless defined(&PRI_UNCHANGED);
    }
}
1;

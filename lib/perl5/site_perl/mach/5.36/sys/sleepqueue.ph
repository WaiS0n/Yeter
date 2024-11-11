require '_h2ph_pre.ph';

no warnings qw(redefine misc);

unless(defined(&_SYS_SLEEPQUEUE_H_)) {
    eval 'sub _SYS_SLEEPQUEUE_H_ () {1;}' unless defined(&_SYS_SLEEPQUEUE_H_);
    if(defined(&_KERNEL)) {
	eval 'sub SLEEPQ_TYPE () {0xff;}' unless defined(&SLEEPQ_TYPE);
	eval 'sub SLEEPQ_SLEEP () {0x;}' unless defined(&SLEEPQ_SLEEP);
	eval 'sub SLEEPQ_CONDVAR () {0x1;}' unless defined(&SLEEPQ_CONDVAR);
	eval 'sub SLEEPQ_PAUSE () {0x2;}' unless defined(&SLEEPQ_PAUSE);
	eval 'sub SLEEPQ_SX () {0x3;}' unless defined(&SLEEPQ_SX);
	eval 'sub SLEEPQ_LK () {0x4;}' unless defined(&SLEEPQ_LK);
	eval 'sub SLEEPQ_INTERRUPTIBLE () {0x100;}' unless defined(&SLEEPQ_INTERRUPTIBLE);
	eval 'sub SLEEPQ_UNFAIR () {0x200;}' unless defined(&SLEEPQ_UNFAIR);
	eval 'sub SLEEPQ_DROP () {0x400;}' unless defined(&SLEEPQ_DROP);
	eval 'sub sleepq_set_timeout {
	    my($wchan, $timo) = @_;
    	    eval q( &sleepq_set_timeout_sbt(($wchan),  &tick_sbt * ($timo), 0,  &C_HARDCLOCK));
	}' unless defined(&sleepq_set_timeout);
	if(defined(&STACK)) {
	}
    }
}
1;

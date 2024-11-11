require '_h2ph_pre.ph';

no warnings qw(redefine misc);

unless(defined(&_SYS_POLL_H_)) {
    eval 'sub _SYS_POLL_H_ () {1;}' unless defined(&_SYS_POLL_H_);
    require 'sys/cdefs.ph';
    eval 'sub POLLIN () {0x1;}' unless defined(&POLLIN);
    eval 'sub POLLPRI () {0x2;}' unless defined(&POLLPRI);
    eval 'sub POLLOUT () {0x4;}' unless defined(&POLLOUT);
    eval 'sub POLLRDNORM () {0x40;}' unless defined(&POLLRDNORM);
    eval 'sub POLLWRNORM () { &POLLOUT;}' unless defined(&POLLWRNORM);
    eval 'sub POLLRDBAND () {0x80;}' unless defined(&POLLRDBAND);
    eval 'sub POLLWRBAND () {0x100;}' unless defined(&POLLWRBAND);
    if((defined(&__BSD_VISIBLE) ? &__BSD_VISIBLE : undef)) {
	eval 'sub POLLINIGNEOF () {0x2000;}' unless defined(&POLLINIGNEOF);
	eval 'sub POLLRDHUP () {0x4000;}' unless defined(&POLLRDHUP);
    }
    eval 'sub POLLERR () {0x8;}' unless defined(&POLLERR);
    eval 'sub POLLHUP () {0x10;}' unless defined(&POLLHUP);
    eval 'sub POLLNVAL () {0x20;}' unless defined(&POLLNVAL);
    if((defined(&__BSD_VISIBLE) ? &__BSD_VISIBLE : undef)) {
	eval 'sub POLLSTANDARD () {( &POLLIN| &POLLPRI| &POLLOUT| &POLLRDNORM| &POLLRDBAND|  &POLLWRBAND| &POLLERR| &POLLHUP| &POLLNVAL);}' unless defined(&POLLSTANDARD);
	eval 'sub INFTIM () {(-1);}' unless defined(&INFTIM);
    }
    unless(defined(&_KERNEL)) {
	if((defined(&__BSD_VISIBLE) ? &__BSD_VISIBLE : undef)) {
	    require 'sys/_types.ph';
	    require 'sys/_sigset.ph';
	    require 'sys/timespec.ph';
	    unless(defined(&_SIGSET_T_DECLARED)) {
		eval 'sub _SIGSET_T_DECLARED () {1;}' unless defined(&_SIGSET_T_DECLARED);
	    }
	}
	if((defined(&__BSD_VISIBLE) ? &__BSD_VISIBLE : undef)) {
	}
    }
}
1;

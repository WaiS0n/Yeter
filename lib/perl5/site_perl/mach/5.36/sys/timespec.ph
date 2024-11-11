require '_h2ph_pre.ph';

no warnings qw(redefine misc);

unless(defined(&_SYS_TIMESPEC_H_)) {
    eval 'sub _SYS_TIMESPEC_H_ () {1;}' unless defined(&_SYS_TIMESPEC_H_);
    require 'sys/cdefs.ph';
    require 'sys/_timespec.ph';
    if((defined(&__BSD_VISIBLE) ? &__BSD_VISIBLE : undef)) {
	eval 'sub TIMEVAL_TO_TIMESPEC {
	    my($tv, $ts) = @_;
    	    eval q( &do { ($ts)-> &tv_sec = ($tv)-> &tv_sec; ($ts)-> &tv_nsec = ($tv)-> &tv_usec * 1000; }  &while (0));
	}' unless defined(&TIMEVAL_TO_TIMESPEC);
	eval 'sub TIMESPEC_TO_TIMEVAL {
	    my($tv, $ts) = @_;
    	    eval q( &do { ($tv)-> &tv_sec = ($ts)-> &tv_sec; ($tv)-> &tv_usec = ($ts)-> &tv_nsec / 1000; }  &while (0));
	}' unless defined(&TIMESPEC_TO_TIMEVAL);
    }
}
1;

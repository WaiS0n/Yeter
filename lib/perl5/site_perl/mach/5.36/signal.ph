require '_h2ph_pre.ph';

no warnings qw(redefine misc);

unless(defined(&_SIGNAL_H_)) {
    eval 'sub _SIGNAL_H_ () {1;}' unless defined(&_SIGNAL_H_);
    require 'sys/cdefs.ph';
    require 'sys/_types.ph';
    require 'sys/signal.ph';
    if((defined(&__POSIX_VISIBLE) ? &__POSIX_VISIBLE : undef) >= 200112|| (defined(&__XSI_VISIBLE) ? &__XSI_VISIBLE : undef)) {
	require 'machine/ucontext.ph';
	require 'sys/_ucontext.ph';
    }
    if((defined(&__BSD_VISIBLE) ? &__BSD_VISIBLE : undef)) {
    }
    if((defined(&__POSIX_VISIBLE) ? &__POSIX_VISIBLE : undef) >= 200112|| (defined(&__XSI_VISIBLE) ? &__XSI_VISIBLE : undef)) {
	unless(defined(&_PID_T_DECLARED)) {
	    eval 'sub _PID_T_DECLARED () {1;}' unless defined(&_PID_T_DECLARED);
	}
    }
    if((defined(&__POSIX_VISIBLE) ? &__POSIX_VISIBLE : undef) || (defined(&__XSI_VISIBLE) ? &__XSI_VISIBLE : undef)) {
	if(!defined(&_PTHREAD_T_DECLARED)  && (defined(&__POSIX_VISIBLE) ? &__POSIX_VISIBLE : undef) >= 200809) {
	    eval 'sub _PTHREAD_T_DECLARED () {1;}' unless defined(&_PTHREAD_T_DECLARED);
	}
    }
    if((defined(&__POSIX_VISIBLE) ? &__POSIX_VISIBLE : undef) || (defined(&__XSI_VISIBLE) ? &__XSI_VISIBLE : undef)) {
    }
    if((defined(&__POSIX_VISIBLE) ? &__POSIX_VISIBLE : undef) >= 199506|| (defined(&__XSI_VISIBLE) ? &__XSI_VISIBLE : undef) >= 600) {
    }
    if((defined(&__XSI_VISIBLE) ? &__XSI_VISIBLE : undef)) {
    }
    if((defined(&__XSI_VISIBLE) ? &__XSI_VISIBLE : undef) >= 600) {
    }
    if((defined(&__POSIX_VISIBLE) ? &__POSIX_VISIBLE : undef) >= 200809) {
    }
    if((defined(&__BSD_VISIBLE) ? &__BSD_VISIBLE : undef)) {
    }
}
1;

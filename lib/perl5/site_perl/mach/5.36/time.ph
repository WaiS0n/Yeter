require '_h2ph_pre.ph';

no warnings qw(redefine misc);

unless(defined(&_TIME_H_)) {
    eval 'sub _TIME_H_ () {1;}' unless defined(&_TIME_H_);
    require 'sys/cdefs.ph';
    require 'sys/_null.ph';
    require 'sys/_types.ph';
    require 'sys/_clock_id.ph';
    if((defined(&__POSIX_VISIBLE) ? &__POSIX_VISIBLE : undef) > 0 && (defined(&__POSIX_VISIBLE) ? &__POSIX_VISIBLE : undef) < 200112|| (defined(&__BSD_VISIBLE) ? &__BSD_VISIBLE : undef)) {
	eval 'sub CLK_TCK () {128;}' unless defined(&CLK_TCK);
    }
    eval 'sub CLOCKS_PER_SEC () {128;}' unless defined(&CLOCKS_PER_SEC);
    unless(defined(&_CLOCK_T_DECLARED)) {
	eval 'sub _CLOCK_T_DECLARED () {1;}' unless defined(&_CLOCK_T_DECLARED);
    }
    unless(defined(&_TIME_T_DECLARED)) {
	eval 'sub _TIME_T_DECLARED () {1;}' unless defined(&_TIME_T_DECLARED);
    }
    unless(defined(&_SIZE_T_DECLARED)) {
	eval 'sub _SIZE_T_DECLARED () {1;}' unless defined(&_SIZE_T_DECLARED);
    }
    if((defined(&__POSIX_VISIBLE) ? &__POSIX_VISIBLE : undef) >= 199309) {
	unless(defined(&_CLOCKID_T_DECLARED)) {
	    eval 'sub _CLOCKID_T_DECLARED () {1;}' unless defined(&_CLOCKID_T_DECLARED);
	}
	unless(defined(&_TIMER_T_DECLARED)) {
	    eval 'sub _TIMER_T_DECLARED () {1;}' unless defined(&_TIMER_T_DECLARED);
	}
	require 'sys/timespec.ph';
    }
    if((defined(&__POSIX_VISIBLE) ? &__POSIX_VISIBLE : undef) >= 200112) {
	unless(defined(&_PID_T_DECLARED)) {
	    eval 'sub _PID_T_DECLARED () {1;}' unless defined(&_PID_T_DECLARED);
	}
    }
    if((defined(&__POSIX_VISIBLE) ? &__POSIX_VISIBLE : undef)) {
    }
    unless(defined(&_STANDALONE)) {
    }
    if((defined(&__POSIX_VISIBLE) ? &__POSIX_VISIBLE : undef) >= 200112) {
    }
    if((defined(&__POSIX_VISIBLE) ? &__POSIX_VISIBLE : undef)) {
    }
    if((defined(&__POSIX_VISIBLE) ? &__POSIX_VISIBLE : undef) >= 199309) {
    }
    if((defined(&__POSIX_VISIBLE) ? &__POSIX_VISIBLE : undef) >= 200112) {
    }
    if((defined(&__POSIX_VISIBLE) ? &__POSIX_VISIBLE : undef) >= 199506) {
    }
    if((defined(&__XSI_VISIBLE) ? &__XSI_VISIBLE : undef)) {
    }
    if((defined(&__BSD_VISIBLE) ? &__BSD_VISIBLE : undef)) {
    }
    if((defined(&__POSIX_VISIBLE) ? &__POSIX_VISIBLE : undef) >= 200809|| defined(&_XLOCALE_H_)) {
	require 'xlocale/_time.ph';
    }
    if((defined(&__BSD_VISIBLE) ? &__BSD_VISIBLE : undef) || (defined(&__ISO_C_VISIBLE) ? &__ISO_C_VISIBLE : undef) >= 2011|| (defined(&__cplusplus)  && (defined(&__cplusplus) ? &__cplusplus : undef) >= 201703)) {
	require 'sys/_timespec.ph';
	eval 'sub TIME_UTC () {1;}' unless defined(&TIME_UTC);
	if((defined(&__BSD_VISIBLE) ? &__BSD_VISIBLE : undef) || (defined(&__ISO_C_VISIBLE) ? &__ISO_C_VISIBLE : undef) >= 2023) {
	    eval 'sub TIME_MONOTONIC () {2;}' unless defined(&TIME_MONOTONIC);
	}
    }
}
1;

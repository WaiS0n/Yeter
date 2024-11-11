require '_h2ph_pre.ph';

no warnings qw(redefine misc);

unless(defined(&_SYS_SYS__CLOCK_ID_H)) {
    eval 'sub _SYS_SYS__CLOCK_ID_H () {1;}' unless defined(&_SYS_SYS__CLOCK_ID_H);
    if((defined(&__POSIX_VISIBLE) ? &__POSIX_VISIBLE : undef) >= 199309) {
	eval 'sub CLOCK_REALTIME () {0;}' unless defined(&CLOCK_REALTIME);
    }
    if(defined(&__BSD_VISIBLE)) {
	eval 'sub CLOCK_VIRTUAL () {1;}' unless defined(&CLOCK_VIRTUAL);
	eval 'sub CLOCK_PROF () {2;}' unless defined(&CLOCK_PROF);
    }
    if((defined(&__POSIX_VISIBLE) ? &__POSIX_VISIBLE : undef) >= 199309) {
	eval 'sub CLOCK_MONOTONIC () {4;}' unless defined(&CLOCK_MONOTONIC);
	eval 'sub CLOCK_UPTIME_FAST () {8;}' unless defined(&CLOCK_UPTIME_FAST);
    }
    if(defined(&__BSD_VISIBLE)) {
	eval 'sub CLOCK_UPTIME () {5;}' unless defined(&CLOCK_UPTIME);
	eval 'sub CLOCK_UPTIME_PRECISE () {7;}' unless defined(&CLOCK_UPTIME_PRECISE);
	eval 'sub CLOCK_REALTIME_PRECISE () {9;}' unless defined(&CLOCK_REALTIME_PRECISE);
	eval 'sub CLOCK_REALTIME_FAST () {10;}' unless defined(&CLOCK_REALTIME_FAST);
	eval 'sub CLOCK_MONOTONIC_PRECISE () {11;}' unless defined(&CLOCK_MONOTONIC_PRECISE);
	eval 'sub CLOCK_MONOTONIC_FAST () {12;}' unless defined(&CLOCK_MONOTONIC_FAST);
	eval 'sub CLOCK_SECOND () {13;}' unless defined(&CLOCK_SECOND);
    }
    if((defined(&__POSIX_VISIBLE) ? &__POSIX_VISIBLE : undef) >= 199309) {
	eval 'sub CLOCK_THREAD_CPUTIME_ID () {14;}' unless defined(&CLOCK_THREAD_CPUTIME_ID);
	eval 'sub CLOCK_PROCESS_CPUTIME_ID () {15;}' unless defined(&CLOCK_PROCESS_CPUTIME_ID);
    }
    if((defined(&__BSD_VISIBLE) ? &__BSD_VISIBLE : undef)) {
	eval 'sub CLOCK_BOOTTIME () { &CLOCK_UPTIME;}' unless defined(&CLOCK_BOOTTIME);
	eval 'sub CLOCK_REALTIME_COARSE () { &CLOCK_REALTIME_FAST;}' unless defined(&CLOCK_REALTIME_COARSE);
	eval 'sub CLOCK_MONOTONIC_COARSE () { &CLOCK_MONOTONIC_FAST;}' unless defined(&CLOCK_MONOTONIC_COARSE);
    }
    if((defined(&__BSD_VISIBLE) ? &__BSD_VISIBLE : undef)) {
	eval 'sub TIMER_RELTIME () {0x;}' unless defined(&TIMER_RELTIME);
    }
    if((defined(&__POSIX_VISIBLE) ? &__POSIX_VISIBLE : undef) >= 199309) {
	eval 'sub TIMER_ABSTIME () {0x1;}' unless defined(&TIMER_ABSTIME);
    }
}
1;

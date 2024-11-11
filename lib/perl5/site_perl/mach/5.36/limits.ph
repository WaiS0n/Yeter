require '_h2ph_pre.ph';

no warnings qw(redefine misc);

unless(defined(&_LIMITS_H_)) {
    eval 'sub _LIMITS_H_ () {1;}' unless defined(&_LIMITS_H_);
    require 'sys/cdefs.ph';
    if((defined(&__POSIX_VISIBLE) ? &__POSIX_VISIBLE : undef)) {
	eval 'sub _POSIX_ARG_MAX () {4096;}' unless defined(&_POSIX_ARG_MAX);
	eval 'sub _POSIX_LINK_MAX () {8;}' unless defined(&_POSIX_LINK_MAX);
	eval 'sub _POSIX_MAX_CANON () {255;}' unless defined(&_POSIX_MAX_CANON);
	eval 'sub _POSIX_MAX_INPUT () {255;}' unless defined(&_POSIX_MAX_INPUT);
	eval 'sub _POSIX_NAME_MAX () {14;}' unless defined(&_POSIX_NAME_MAX);
	eval 'sub _POSIX_PIPE_BUF () {512;}' unless defined(&_POSIX_PIPE_BUF);
	eval 'sub _POSIX_SSIZE_MAX () {32767;}' unless defined(&_POSIX_SSIZE_MAX);
	eval 'sub _POSIX_STREAM_MAX () {8;}' unless defined(&_POSIX_STREAM_MAX);
	if((defined(&__POSIX_VISIBLE) ? &__POSIX_VISIBLE : undef) >= 200112) {
	    eval 'sub _POSIX_CHILD_MAX () {25;}' unless defined(&_POSIX_CHILD_MAX);
	    eval 'sub _POSIX_NGROUPS_MAX () {8;}' unless defined(&_POSIX_NGROUPS_MAX);
	    eval 'sub _POSIX_OPEN_MAX () {20;}' unless defined(&_POSIX_OPEN_MAX);
	    eval 'sub _POSIX_PATH_MAX () {256;}' unless defined(&_POSIX_PATH_MAX);
	    eval 'sub _POSIX_TZNAME_MAX () {6;}' unless defined(&_POSIX_TZNAME_MAX);
	} else {
	    eval 'sub _POSIX_CHILD_MAX () {6;}' unless defined(&_POSIX_CHILD_MAX);
	    eval 'sub _POSIX_NGROUPS_MAX () {0;}' unless defined(&_POSIX_NGROUPS_MAX);
	    eval 'sub _POSIX_OPEN_MAX () {16;}' unless defined(&_POSIX_OPEN_MAX);
	    eval 'sub _POSIX_PATH_MAX () {255;}' unless defined(&_POSIX_PATH_MAX);
	    eval 'sub _POSIX_TZNAME_MAX () {3;}' unless defined(&_POSIX_TZNAME_MAX);
	}
	if((defined(&__POSIX_VISIBLE) ? &__POSIX_VISIBLE : undef) >= 200112) {
	    eval 'sub BC_BASE_MAX () {99;}' unless defined(&BC_BASE_MAX);
	    eval 'sub BC_DIM_MAX () {2048;}' unless defined(&BC_DIM_MAX);
	    eval 'sub BC_SCALE_MAX () {99;}' unless defined(&BC_SCALE_MAX);
	    eval 'sub BC_STRING_MAX () {1000;}' unless defined(&BC_STRING_MAX);
	    eval 'sub CHARCLASS_NAME_MAX () {14;}' unless defined(&CHARCLASS_NAME_MAX);
	    eval 'sub COLL_WEIGHTS_MAX () {10;}' unless defined(&COLL_WEIGHTS_MAX);
	    eval 'sub EXPR_NEST_MAX () {32;}' unless defined(&EXPR_NEST_MAX);
	    eval 'sub LINE_MAX () {2048;}' unless defined(&LINE_MAX);
	    eval 'sub RE_DUP_MAX () {255;}' unless defined(&RE_DUP_MAX);
	    eval 'sub _POSIX2_BC_BASE_MAX () {99;}' unless defined(&_POSIX2_BC_BASE_MAX);
	    eval 'sub _POSIX2_BC_DIM_MAX () {2048;}' unless defined(&_POSIX2_BC_DIM_MAX);
	    eval 'sub _POSIX2_BC_SCALE_MAX () {99;}' unless defined(&_POSIX2_BC_SCALE_MAX);
	    eval 'sub _POSIX2_BC_STRING_MAX () {1000;}' unless defined(&_POSIX2_BC_STRING_MAX);
	    eval 'sub _POSIX2_CHARCLASS_NAME_MAX () {14;}' unless defined(&_POSIX2_CHARCLASS_NAME_MAX);
	    eval 'sub _POSIX2_COLL_WEIGHTS_MAX () {2;}' unless defined(&_POSIX2_COLL_WEIGHTS_MAX);
	    eval 'sub _POSIX2_EQUIV_CLASS_MAX () {2;}' unless defined(&_POSIX2_EQUIV_CLASS_MAX);
	    eval 'sub _POSIX2_EXPR_NEST_MAX () {32;}' unless defined(&_POSIX2_EXPR_NEST_MAX);
	    eval 'sub _POSIX2_LINE_MAX () {2048;}' unless defined(&_POSIX2_LINE_MAX);
	    eval 'sub _POSIX2_RE_DUP_MAX () {255;}' unless defined(&_POSIX2_RE_DUP_MAX);
	}
    }
    if((defined(&__POSIX_VISIBLE) ? &__POSIX_VISIBLE : undef) >= 199309) {
	eval 'sub _POSIX_AIO_LISTIO_MAX () {2;}' unless defined(&_POSIX_AIO_LISTIO_MAX);
	eval 'sub _POSIX_AIO_MAX () {1;}' unless defined(&_POSIX_AIO_MAX);
	eval 'sub _POSIX_DELAYTIMER_MAX () {32;}' unless defined(&_POSIX_DELAYTIMER_MAX);
	eval 'sub _POSIX_MQ_OPEN_MAX () {8;}' unless defined(&_POSIX_MQ_OPEN_MAX);
	eval 'sub _POSIX_MQ_PRIO_MAX () {32;}' unless defined(&_POSIX_MQ_PRIO_MAX);
	eval 'sub _POSIX_RTSIG_MAX () {8;}' unless defined(&_POSIX_RTSIG_MAX);
	eval 'sub _POSIX_SEM_NSEMS_MAX () {256;}' unless defined(&_POSIX_SEM_NSEMS_MAX);
	eval 'sub _POSIX_SEM_VALUE_MAX () {32767;}' unless defined(&_POSIX_SEM_VALUE_MAX);
	eval 'sub _POSIX_SIGQUEUE_MAX () {32;}' unless defined(&_POSIX_SIGQUEUE_MAX);
	eval 'sub _POSIX_TIMER_MAX () {32;}' unless defined(&_POSIX_TIMER_MAX);
	eval 'sub _POSIX_CLOCKRES_MIN () {20000000;}' unless defined(&_POSIX_CLOCKRES_MIN);
    }
    if((defined(&__POSIX_VISIBLE) ? &__POSIX_VISIBLE : undef) >= 199506) {
	eval 'sub _POSIX_THREAD_DESTRUCTOR_ITERATIONS () {4;}' unless defined(&_POSIX_THREAD_DESTRUCTOR_ITERATIONS);
	eval 'sub _POSIX_THREAD_KEYS_MAX () {128;}' unless defined(&_POSIX_THREAD_KEYS_MAX);
	eval 'sub _POSIX_THREAD_THREADS_MAX () {64;}' unless defined(&_POSIX_THREAD_THREADS_MAX);
    }
    if((defined(&__POSIX_VISIBLE) ? &__POSIX_VISIBLE : undef) >= 200112) {
	eval 'sub _POSIX_HOST_NAME_MAX () {255;}' unless defined(&_POSIX_HOST_NAME_MAX);
	eval 'sub _POSIX_LOGIN_NAME_MAX () {9;}' unless defined(&_POSIX_LOGIN_NAME_MAX);
	eval 'sub _POSIX_SS_REPL_MAX () {4;}' unless defined(&_POSIX_SS_REPL_MAX);
	eval 'sub _POSIX_SYMLINK_MAX () {255;}' unless defined(&_POSIX_SYMLINK_MAX);
	eval 'sub _POSIX_SYMLOOP_MAX () {8;}' unless defined(&_POSIX_SYMLOOP_MAX);
	eval 'sub _POSIX_TRACE_EVENT_NAME_MAX () {30;}' unless defined(&_POSIX_TRACE_EVENT_NAME_MAX);
	eval 'sub _POSIX_TRACE_NAME_MAX () {8;}' unless defined(&_POSIX_TRACE_NAME_MAX);
	eval 'sub _POSIX_TRACE_SYS_MAX () {8;}' unless defined(&_POSIX_TRACE_SYS_MAX);
	eval 'sub _POSIX_TRACE_USER_EVENT_MAX () {32;}' unless defined(&_POSIX_TRACE_USER_EVENT_MAX);
	eval 'sub _POSIX_TTY_NAME_MAX () {9;}' unless defined(&_POSIX_TTY_NAME_MAX);
	eval 'sub _POSIX_RE_DUP_MAX () { &_POSIX2_RE_DUP_MAX;}' unless defined(&_POSIX_RE_DUP_MAX);
    }
    if((defined(&__XSI_VISIBLE) ? &__XSI_VISIBLE : undef) || (defined(&__POSIX_VISIBLE) ? &__POSIX_VISIBLE : undef) >= 200809) {
	eval 'sub NL_ARGMAX () {4096;}' unless defined(&NL_ARGMAX);
	eval 'sub NL_MSGMAX () {32767;}' unless defined(&NL_MSGMAX);
	eval 'sub NL_SETMAX () {255;}' unless defined(&NL_SETMAX);
	eval 'sub NL_TEXTMAX () {2048;}' unless defined(&NL_TEXTMAX);
    }
    if((defined(&__XSI_VISIBLE) ? &__XSI_VISIBLE : undef)) {
	eval 'sub _XOPEN_IOV_MAX () {16;}' unless defined(&_XOPEN_IOV_MAX);
	eval 'sub _XOPEN_NAME_MAX () {255;}' unless defined(&_XOPEN_NAME_MAX);
	eval 'sub _XOPEN_PATH_MAX () {1024;}' unless defined(&_XOPEN_PATH_MAX);
	eval 'sub PASS_MAX () {128;}' unless defined(&PASS_MAX);
	eval 'sub NL_LANGMAX () {31;}' unless defined(&NL_LANGMAX);
	eval 'sub NL_NMAX () {1;}' unless defined(&NL_NMAX);
    }
    eval 'sub MB_LEN_MAX () {6;}' unless defined(&MB_LEN_MAX);
    require 'sys/limits.ph';
    if((defined(&__POSIX_VISIBLE) ? &__POSIX_VISIBLE : undef)) {
	require 'sys/syslimits.ph';
    }
}
1;

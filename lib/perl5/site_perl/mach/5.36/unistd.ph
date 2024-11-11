require '_h2ph_pre.ph';

no warnings qw(redefine misc);

unless(defined(&_UNISTD_H_)) {
    eval 'sub _UNISTD_H_ () {1;}' unless defined(&_UNISTD_H_);
    require 'sys/cdefs.ph';
    require 'sys/types.ph';
    require 'sys/unistd.ph';
    require 'sys/_null.ph';
    require 'sys/_types.ph';
    unless(defined(&_GID_T_DECLARED)) {
	eval 'sub _GID_T_DECLARED () {1;}' unless defined(&_GID_T_DECLARED);
    }
    unless(defined(&_OFF_T_DECLARED)) {
	eval 'sub _OFF_T_DECLARED () {1;}' unless defined(&_OFF_T_DECLARED);
    }
    unless(defined(&_PID_T_DECLARED)) {
	eval 'sub _PID_T_DECLARED () {1;}' unless defined(&_PID_T_DECLARED);
    }
    unless(defined(&_SIZE_T_DECLARED)) {
	eval 'sub _SIZE_T_DECLARED () {1;}' unless defined(&_SIZE_T_DECLARED);
    }
    unless(defined(&_SSIZE_T_DECLARED)) {
	eval 'sub _SSIZE_T_DECLARED () {1;}' unless defined(&_SSIZE_T_DECLARED);
    }
    unless(defined(&_UID_T_DECLARED)) {
	eval 'sub _UID_T_DECLARED () {1;}' unless defined(&_UID_T_DECLARED);
    }
    unless(defined(&_USECONDS_T_DECLARED)) {
	eval 'sub _USECONDS_T_DECLARED () {1;}' unless defined(&_USECONDS_T_DECLARED);
    }
    eval 'sub STDIN_FILENO () {0;}' unless defined(&STDIN_FILENO);
    eval 'sub STDOUT_FILENO () {1;}' unless defined(&STDOUT_FILENO);
    eval 'sub STDERR_FILENO () {2;}' unless defined(&STDERR_FILENO);
    if((defined(&__XSI_VISIBLE) ? &__XSI_VISIBLE : undef) || (defined(&__POSIX_VISIBLE) ? &__POSIX_VISIBLE : undef) >= 200112) {
	eval 'sub F_ULOCK () {0;}' unless defined(&F_ULOCK);
	eval 'sub F_LOCK () {1;}' unless defined(&F_LOCK);
	eval 'sub F_TLOCK () {2;}' unless defined(&F_TLOCK);
	eval 'sub F_TEST () {3;}' unless defined(&F_TEST);
    }
    eval 'sub _POSIX_BARRIERS () {200112;}' unless defined(&_POSIX_BARRIERS);
    eval 'sub _POSIX_CPUTIME () {200112;}' unless defined(&_POSIX_CPUTIME);
    eval 'sub _POSIX_READER_WRITER_LOCKS () {200112;}' unless defined(&_POSIX_READER_WRITER_LOCKS);
    eval 'sub _POSIX_REGEXP () {1;}' unless defined(&_POSIX_REGEXP);
    eval 'sub _POSIX_SHELL () {1;}' unless defined(&_POSIX_SHELL);
    eval 'sub _POSIX_SPAWN () {200112;}' unless defined(&_POSIX_SPAWN);
    eval 'sub _POSIX_SPIN_LOCKS () {200112;}' unless defined(&_POSIX_SPIN_LOCKS);
    eval 'sub _POSIX_THREAD_ATTR_STACKADDR () {200112;}' unless defined(&_POSIX_THREAD_ATTR_STACKADDR);
    eval 'sub _POSIX_THREAD_ATTR_STACKSIZE () {200112;}' unless defined(&_POSIX_THREAD_ATTR_STACKSIZE);
    eval 'sub _POSIX_THREAD_CPUTIME () {200112;}' unless defined(&_POSIX_THREAD_CPUTIME);
    eval 'sub _POSIX_THREAD_PRIO_INHERIT () {200112;}' unless defined(&_POSIX_THREAD_PRIO_INHERIT);
    eval 'sub _POSIX_THREAD_PRIO_PROTECT () {200112;}' unless defined(&_POSIX_THREAD_PRIO_PROTECT);
    eval 'sub _POSIX_THREAD_PRIORITY_SCHEDULING () {200112;}' unless defined(&_POSIX_THREAD_PRIORITY_SCHEDULING);
    eval 'sub _POSIX_THREAD_PROCESS_SHARED () {200112;}' unless defined(&_POSIX_THREAD_PROCESS_SHARED);
    eval 'sub _POSIX_THREAD_SAFE_FUNCTIONS () {-1;}' unless defined(&_POSIX_THREAD_SAFE_FUNCTIONS);
    eval 'sub _POSIX_THREAD_SPORADIC_SERVER () {-1;}' unless defined(&_POSIX_THREAD_SPORADIC_SERVER);
    eval 'sub _POSIX_THREADS () {200112;}' unless defined(&_POSIX_THREADS);
    eval 'sub _POSIX_TRACE () {-1;}' unless defined(&_POSIX_TRACE);
    eval 'sub _POSIX_TRACE_EVENT_FILTER () {-1;}' unless defined(&_POSIX_TRACE_EVENT_FILTER);
    eval 'sub _POSIX_TRACE_INHERIT () {-1;}' unless defined(&_POSIX_TRACE_INHERIT);
    eval 'sub _POSIX_TRACE_LOG () {-1;}' unless defined(&_POSIX_TRACE_LOG);
    eval 'sub _POSIX2_C_BIND () {200112;}' unless defined(&_POSIX2_C_BIND);
    eval 'sub _POSIX2_C_DEV () {-1;}' unless defined(&_POSIX2_C_DEV);
    eval 'sub _POSIX2_CHAR_TERM () {1;}' unless defined(&_POSIX2_CHAR_TERM);
    eval 'sub _POSIX2_FORT_DEV () {-1;}' unless defined(&_POSIX2_FORT_DEV);
    eval 'sub _POSIX2_FORT_RUN () {200112;}' unless defined(&_POSIX2_FORT_RUN);
    eval 'sub _POSIX2_LOCALEDEF () {-1;}' unless defined(&_POSIX2_LOCALEDEF);
    eval 'sub _POSIX2_PBS () {-1;}' unless defined(&_POSIX2_PBS);
    eval 'sub _POSIX2_PBS_ACCOUNTING () {-1;}' unless defined(&_POSIX2_PBS_ACCOUNTING);
    eval 'sub _POSIX2_PBS_CHECKPOINT () {-1;}' unless defined(&_POSIX2_PBS_CHECKPOINT);
    eval 'sub _POSIX2_PBS_LOCATE () {-1;}' unless defined(&_POSIX2_PBS_LOCATE);
    eval 'sub _POSIX2_PBS_MESSAGE () {-1;}' unless defined(&_POSIX2_PBS_MESSAGE);
    eval 'sub _POSIX2_PBS_TRACK () {-1;}' unless defined(&_POSIX2_PBS_TRACK);
    eval 'sub _POSIX2_SW_DEV () {-1;}' unless defined(&_POSIX2_SW_DEV);
    eval 'sub _POSIX2_UPE () {200112;}' unless defined(&_POSIX2_UPE);
    eval 'sub _V6_ILP32_OFF32 () {-1;}' unless defined(&_V6_ILP32_OFF32);
    eval 'sub _V6_ILP32_OFFBIG () {0;}' unless defined(&_V6_ILP32_OFFBIG);
    eval 'sub _V6_LP64_OFF64 () {0;}' unless defined(&_V6_LP64_OFF64);
    eval 'sub _V6_LPBIG_OFFBIG () {-1;}' unless defined(&_V6_LPBIG_OFFBIG);
    if((defined(&__XSI_VISIBLE) ? &__XSI_VISIBLE : undef)) {
	eval 'sub _XOPEN_CRYPT () {-1;}' unless defined(&_XOPEN_CRYPT);
	eval 'sub _XOPEN_ENH_I18N () {-1;}' unless defined(&_XOPEN_ENH_I18N);
	eval 'sub _XOPEN_LEGACY () {-1;}' unless defined(&_XOPEN_LEGACY);
	eval 'sub _XOPEN_REALTIME () {-1;}' unless defined(&_XOPEN_REALTIME);
	eval 'sub _XOPEN_REALTIME_THREADS () {-1;}' unless defined(&_XOPEN_REALTIME_THREADS);
	eval 'sub _XOPEN_UNIX () {-1;}' unless defined(&_XOPEN_UNIX);
    }
    eval 'sub _POSIX2_VERSION () {199212;}' unless defined(&_POSIX2_VERSION);
    eval 'sub _SC_ARG_MAX () {1;}' unless defined(&_SC_ARG_MAX);
    eval 'sub _SC_CHILD_MAX () {2;}' unless defined(&_SC_CHILD_MAX);
    eval 'sub _SC_CLK_TCK () {3;}' unless defined(&_SC_CLK_TCK);
    eval 'sub _SC_NGROUPS_MAX () {4;}' unless defined(&_SC_NGROUPS_MAX);
    eval 'sub _SC_OPEN_MAX () {5;}' unless defined(&_SC_OPEN_MAX);
    eval 'sub _SC_JOB_CONTROL () {6;}' unless defined(&_SC_JOB_CONTROL);
    eval 'sub _SC_SAVED_IDS () {7;}' unless defined(&_SC_SAVED_IDS);
    eval 'sub _SC_VERSION () {8;}' unless defined(&_SC_VERSION);
    eval 'sub _SC_BC_BASE_MAX () {9;}' unless defined(&_SC_BC_BASE_MAX);
    eval 'sub _SC_BC_DIM_MAX () {10;}' unless defined(&_SC_BC_DIM_MAX);
    eval 'sub _SC_BC_SCALE_MAX () {11;}' unless defined(&_SC_BC_SCALE_MAX);
    eval 'sub _SC_BC_STRING_MAX () {12;}' unless defined(&_SC_BC_STRING_MAX);
    eval 'sub _SC_COLL_WEIGHTS_MAX () {13;}' unless defined(&_SC_COLL_WEIGHTS_MAX);
    eval 'sub _SC_EXPR_NEST_MAX () {14;}' unless defined(&_SC_EXPR_NEST_MAX);
    eval 'sub _SC_LINE_MAX () {15;}' unless defined(&_SC_LINE_MAX);
    eval 'sub _SC_RE_DUP_MAX () {16;}' unless defined(&_SC_RE_DUP_MAX);
    eval 'sub _SC_2_VERSION () {17;}' unless defined(&_SC_2_VERSION);
    eval 'sub _SC_2_C_BIND () {18;}' unless defined(&_SC_2_C_BIND);
    eval 'sub _SC_2_C_DEV () {19;}' unless defined(&_SC_2_C_DEV);
    eval 'sub _SC_2_CHAR_TERM () {20;}' unless defined(&_SC_2_CHAR_TERM);
    eval 'sub _SC_2_FORT_DEV () {21;}' unless defined(&_SC_2_FORT_DEV);
    eval 'sub _SC_2_FORT_RUN () {22;}' unless defined(&_SC_2_FORT_RUN);
    eval 'sub _SC_2_LOCALEDEF () {23;}' unless defined(&_SC_2_LOCALEDEF);
    eval 'sub _SC_2_SW_DEV () {24;}' unless defined(&_SC_2_SW_DEV);
    eval 'sub _SC_2_UPE () {25;}' unless defined(&_SC_2_UPE);
    eval 'sub _SC_STREAM_MAX () {26;}' unless defined(&_SC_STREAM_MAX);
    eval 'sub _SC_TZNAME_MAX () {27;}' unless defined(&_SC_TZNAME_MAX);
    if((defined(&__POSIX_VISIBLE) ? &__POSIX_VISIBLE : undef) >= 199309) {
	eval 'sub _SC_ASYNCHRONOUS_IO () {28;}' unless defined(&_SC_ASYNCHRONOUS_IO);
	eval 'sub _SC_MAPPED_FILES () {29;}' unless defined(&_SC_MAPPED_FILES);
	eval 'sub _SC_MEMLOCK () {30;}' unless defined(&_SC_MEMLOCK);
	eval 'sub _SC_MEMLOCK_RANGE () {31;}' unless defined(&_SC_MEMLOCK_RANGE);
	eval 'sub _SC_MEMORY_PROTECTION () {32;}' unless defined(&_SC_MEMORY_PROTECTION);
	eval 'sub _SC_MESSAGE_PASSING () {33;}' unless defined(&_SC_MESSAGE_PASSING);
	eval 'sub _SC_PRIORITIZED_IO () {34;}' unless defined(&_SC_PRIORITIZED_IO);
	eval 'sub _SC_PRIORITY_SCHEDULING () {35;}' unless defined(&_SC_PRIORITY_SCHEDULING);
	eval 'sub _SC_REALTIME_SIGNALS () {36;}' unless defined(&_SC_REALTIME_SIGNALS);
	eval 'sub _SC_SEMAPHORES () {37;}' unless defined(&_SC_SEMAPHORES);
	eval 'sub _SC_FSYNC () {38;}' unless defined(&_SC_FSYNC);
	eval 'sub _SC_SHARED_MEMORY_OBJECTS () {39;}' unless defined(&_SC_SHARED_MEMORY_OBJECTS);
	eval 'sub _SC_SYNCHRONIZED_IO () {40;}' unless defined(&_SC_SYNCHRONIZED_IO);
	eval 'sub _SC_TIMERS () {41;}' unless defined(&_SC_TIMERS);
	eval 'sub _SC_AIO_LISTIO_MAX () {42;}' unless defined(&_SC_AIO_LISTIO_MAX);
	eval 'sub _SC_AIO_MAX () {43;}' unless defined(&_SC_AIO_MAX);
	eval 'sub _SC_AIO_PRIO_DELTA_MAX () {44;}' unless defined(&_SC_AIO_PRIO_DELTA_MAX);
	eval 'sub _SC_DELAYTIMER_MAX () {45;}' unless defined(&_SC_DELAYTIMER_MAX);
	eval 'sub _SC_MQ_OPEN_MAX () {46;}' unless defined(&_SC_MQ_OPEN_MAX);
	eval 'sub _SC_PAGESIZE () {47;}' unless defined(&_SC_PAGESIZE);
	eval 'sub _SC_RTSIG_MAX () {48;}' unless defined(&_SC_RTSIG_MAX);
	eval 'sub _SC_SEM_NSEMS_MAX () {49;}' unless defined(&_SC_SEM_NSEMS_MAX);
	eval 'sub _SC_SEM_VALUE_MAX () {50;}' unless defined(&_SC_SEM_VALUE_MAX);
	eval 'sub _SC_SIGQUEUE_MAX () {51;}' unless defined(&_SC_SIGQUEUE_MAX);
	eval 'sub _SC_TIMER_MAX () {52;}' unless defined(&_SC_TIMER_MAX);
    }
    if((defined(&__POSIX_VISIBLE) ? &__POSIX_VISIBLE : undef) >= 200112) {
	eval 'sub _SC_2_PBS () {59;}' unless defined(&_SC_2_PBS);
	eval 'sub _SC_2_PBS_ACCOUNTING () {60;}' unless defined(&_SC_2_PBS_ACCOUNTING);
	eval 'sub _SC_2_PBS_CHECKPOINT () {61;}' unless defined(&_SC_2_PBS_CHECKPOINT);
	eval 'sub _SC_2_PBS_LOCATE () {62;}' unless defined(&_SC_2_PBS_LOCATE);
	eval 'sub _SC_2_PBS_MESSAGE () {63;}' unless defined(&_SC_2_PBS_MESSAGE);
	eval 'sub _SC_2_PBS_TRACK () {64;}' unless defined(&_SC_2_PBS_TRACK);
	eval 'sub _SC_ADVISORY_INFO () {65;}' unless defined(&_SC_ADVISORY_INFO);
	eval 'sub _SC_BARRIERS () {66;}' unless defined(&_SC_BARRIERS);
	eval 'sub _SC_CLOCK_SELECTION () {67;}' unless defined(&_SC_CLOCK_SELECTION);
	eval 'sub _SC_CPUTIME () {68;}' unless defined(&_SC_CPUTIME);
	eval 'sub _SC_FILE_LOCKING () {69;}' unless defined(&_SC_FILE_LOCKING);
	eval 'sub _SC_GETGR_R_SIZE_MAX () {70;}' unless defined(&_SC_GETGR_R_SIZE_MAX);
	eval 'sub _SC_GETPW_R_SIZE_MAX () {71;}' unless defined(&_SC_GETPW_R_SIZE_MAX);
	eval 'sub _SC_HOST_NAME_MAX () {72;}' unless defined(&_SC_HOST_NAME_MAX);
	eval 'sub _SC_LOGIN_NAME_MAX () {73;}' unless defined(&_SC_LOGIN_NAME_MAX);
	eval 'sub _SC_MONOTONIC_CLOCK () {74;}' unless defined(&_SC_MONOTONIC_CLOCK);
	eval 'sub _SC_MQ_PRIO_MAX () {75;}' unless defined(&_SC_MQ_PRIO_MAX);
	eval 'sub _SC_READER_WRITER_LOCKS () {76;}' unless defined(&_SC_READER_WRITER_LOCKS);
	eval 'sub _SC_REGEXP () {77;}' unless defined(&_SC_REGEXP);
	eval 'sub _SC_SHELL () {78;}' unless defined(&_SC_SHELL);
	eval 'sub _SC_SPAWN () {79;}' unless defined(&_SC_SPAWN);
	eval 'sub _SC_SPIN_LOCKS () {80;}' unless defined(&_SC_SPIN_LOCKS);
	eval 'sub _SC_SPORADIC_SERVER () {81;}' unless defined(&_SC_SPORADIC_SERVER);
	eval 'sub _SC_THREAD_ATTR_STACKADDR () {82;}' unless defined(&_SC_THREAD_ATTR_STACKADDR);
	eval 'sub _SC_THREAD_ATTR_STACKSIZE () {83;}' unless defined(&_SC_THREAD_ATTR_STACKSIZE);
	eval 'sub _SC_THREAD_CPUTIME () {84;}' unless defined(&_SC_THREAD_CPUTIME);
	eval 'sub _SC_THREAD_DESTRUCTOR_ITERATIONS () {85;}' unless defined(&_SC_THREAD_DESTRUCTOR_ITERATIONS);
	eval 'sub _SC_THREAD_KEYS_MAX () {86;}' unless defined(&_SC_THREAD_KEYS_MAX);
	eval 'sub _SC_THREAD_PRIO_INHERIT () {87;}' unless defined(&_SC_THREAD_PRIO_INHERIT);
	eval 'sub _SC_THREAD_PRIO_PROTECT () {88;}' unless defined(&_SC_THREAD_PRIO_PROTECT);
	eval 'sub _SC_THREAD_PRIORITY_SCHEDULING () {89;}' unless defined(&_SC_THREAD_PRIORITY_SCHEDULING);
	eval 'sub _SC_THREAD_PROCESS_SHARED () {90;}' unless defined(&_SC_THREAD_PROCESS_SHARED);
	eval 'sub _SC_THREAD_SAFE_FUNCTIONS () {91;}' unless defined(&_SC_THREAD_SAFE_FUNCTIONS);
	eval 'sub _SC_THREAD_SPORADIC_SERVER () {92;}' unless defined(&_SC_THREAD_SPORADIC_SERVER);
	eval 'sub _SC_THREAD_STACK_MIN () {93;}' unless defined(&_SC_THREAD_STACK_MIN);
	eval 'sub _SC_THREAD_THREADS_MAX () {94;}' unless defined(&_SC_THREAD_THREADS_MAX);
	eval 'sub _SC_TIMEOUTS () {95;}' unless defined(&_SC_TIMEOUTS);
	eval 'sub _SC_THREADS () {96;}' unless defined(&_SC_THREADS);
	eval 'sub _SC_TRACE () {97;}' unless defined(&_SC_TRACE);
	eval 'sub _SC_TRACE_EVENT_FILTER () {98;}' unless defined(&_SC_TRACE_EVENT_FILTER);
	eval 'sub _SC_TRACE_INHERIT () {99;}' unless defined(&_SC_TRACE_INHERIT);
	eval 'sub _SC_TRACE_LOG () {100;}' unless defined(&_SC_TRACE_LOG);
	eval 'sub _SC_TTY_NAME_MAX () {101;}' unless defined(&_SC_TTY_NAME_MAX);
	eval 'sub _SC_TYPED_MEMORY_OBJECTS () {102;}' unless defined(&_SC_TYPED_MEMORY_OBJECTS);
	eval 'sub _SC_V6_ILP32_OFF32 () {103;}' unless defined(&_SC_V6_ILP32_OFF32);
	eval 'sub _SC_V6_ILP32_OFFBIG () {104;}' unless defined(&_SC_V6_ILP32_OFFBIG);
	eval 'sub _SC_V6_LP64_OFF64 () {105;}' unless defined(&_SC_V6_LP64_OFF64);
	eval 'sub _SC_V6_LPBIG_OFFBIG () {106;}' unless defined(&_SC_V6_LPBIG_OFFBIG);
	eval 'sub _SC_IPV6 () {118;}' unless defined(&_SC_IPV6);
	eval 'sub _SC_RAW_SOCKETS () {119;}' unless defined(&_SC_RAW_SOCKETS);
	eval 'sub _SC_SYMLOOP_MAX () {120;}' unless defined(&_SC_SYMLOOP_MAX);
    }
    if((defined(&__XSI_VISIBLE) ? &__XSI_VISIBLE : undef)) {
	eval 'sub _SC_ATEXIT_MAX () {107;}' unless defined(&_SC_ATEXIT_MAX);
	eval 'sub _SC_IOV_MAX () {56;}' unless defined(&_SC_IOV_MAX);
	eval 'sub _SC_PAGE_SIZE () { &_SC_PAGESIZE;}' unless defined(&_SC_PAGE_SIZE);
	eval 'sub _SC_XOPEN_CRYPT () {108;}' unless defined(&_SC_XOPEN_CRYPT);
	eval 'sub _SC_XOPEN_ENH_I18N () {109;}' unless defined(&_SC_XOPEN_ENH_I18N);
	eval 'sub _SC_XOPEN_LEGACY () {110;}' unless defined(&_SC_XOPEN_LEGACY);
	eval 'sub _SC_XOPEN_REALTIME () {111;}' unless defined(&_SC_XOPEN_REALTIME);
	eval 'sub _SC_XOPEN_REALTIME_THREADS () {112;}' unless defined(&_SC_XOPEN_REALTIME_THREADS);
	eval 'sub _SC_XOPEN_SHM () {113;}' unless defined(&_SC_XOPEN_SHM);
	eval 'sub _SC_XOPEN_STREAMS () {114;}' unless defined(&_SC_XOPEN_STREAMS);
	eval 'sub _SC_XOPEN_UNIX () {115;}' unless defined(&_SC_XOPEN_UNIX);
	eval 'sub _SC_XOPEN_VERSION () {116;}' unless defined(&_SC_XOPEN_VERSION);
	eval 'sub _SC_XOPEN_XCU_VERSION () {117;}' unless defined(&_SC_XOPEN_XCU_VERSION);
    }
    if((defined(&__BSD_VISIBLE) ? &__BSD_VISIBLE : undef)) {
	eval 'sub _SC_NPROCESSORS_CONF () {57;}' unless defined(&_SC_NPROCESSORS_CONF);
	eval 'sub _SC_NPROCESSORS_ONLN () {58;}' unless defined(&_SC_NPROCESSORS_ONLN);
	eval 'sub _SC_CPUSET_SIZE () {122;}' unless defined(&_SC_CPUSET_SIZE);
    }
    eval 'sub _SC_PHYS_PAGES () {121;}' unless defined(&_SC_PHYS_PAGES);
    if((defined(&__POSIX_VISIBLE) ? &__POSIX_VISIBLE : undef) >= 199209) {
	eval 'sub _CS_PATH () {1;}' unless defined(&_CS_PATH);
    }
    if((defined(&__POSIX_VISIBLE) ? &__POSIX_VISIBLE : undef) >= 200112) {
	eval 'sub _CS_POSIX_V6_ILP32_OFF32_CFLAGS () {2;}' unless defined(&_CS_POSIX_V6_ILP32_OFF32_CFLAGS);
	eval 'sub _CS_POSIX_V6_ILP32_OFF32_LDFLAGS () {3;}' unless defined(&_CS_POSIX_V6_ILP32_OFF32_LDFLAGS);
	eval 'sub _CS_POSIX_V6_ILP32_OFF32_LIBS () {4;}' unless defined(&_CS_POSIX_V6_ILP32_OFF32_LIBS);
	eval 'sub _CS_POSIX_V6_ILP32_OFFBIG_CFLAGS () {5;}' unless defined(&_CS_POSIX_V6_ILP32_OFFBIG_CFLAGS);
	eval 'sub _CS_POSIX_V6_ILP32_OFFBIG_LDFLAGS () {6;}' unless defined(&_CS_POSIX_V6_ILP32_OFFBIG_LDFLAGS);
	eval 'sub _CS_POSIX_V6_ILP32_OFFBIG_LIBS () {7;}' unless defined(&_CS_POSIX_V6_ILP32_OFFBIG_LIBS);
	eval 'sub _CS_POSIX_V6_LP64_OFF64_CFLAGS () {8;}' unless defined(&_CS_POSIX_V6_LP64_OFF64_CFLAGS);
	eval 'sub _CS_POSIX_V6_LP64_OFF64_LDFLAGS () {9;}' unless defined(&_CS_POSIX_V6_LP64_OFF64_LDFLAGS);
	eval 'sub _CS_POSIX_V6_LP64_OFF64_LIBS () {10;}' unless defined(&_CS_POSIX_V6_LP64_OFF64_LIBS);
	eval 'sub _CS_POSIX_V6_LPBIG_OFFBIG_CFLAGS () {11;}' unless defined(&_CS_POSIX_V6_LPBIG_OFFBIG_CFLAGS);
	eval 'sub _CS_POSIX_V6_LPBIG_OFFBIG_LDFLAGS () {12;}' unless defined(&_CS_POSIX_V6_LPBIG_OFFBIG_LDFLAGS);
	eval 'sub _CS_POSIX_V6_LPBIG_OFFBIG_LIBS () {13;}' unless defined(&_CS_POSIX_V6_LPBIG_OFFBIG_LIBS);
	eval 'sub _CS_POSIX_V6_WIDTH_RESTRICTED_ENVS () {14;}' unless defined(&_CS_POSIX_V6_WIDTH_RESTRICTED_ENVS);
    }
    unless(defined(&_LSEEK_DECLARED)) {
	eval 'sub _LSEEK_DECLARED () {1;}' unless defined(&_LSEEK_DECLARED);
    }
    if((defined(&__POSIX_VISIBLE) ? &__POSIX_VISIBLE : undef) >= 199209|| (defined(&__XSI_VISIBLE) ? &__XSI_VISIBLE : undef)) {
	unless(defined(&_GETOPT_DECLARED)) {
	    eval 'sub _GETOPT_DECLARED () {1;}' unless defined(&_GETOPT_DECLARED);
	}
    }
    if((defined(&__POSIX_VISIBLE) ? &__POSIX_VISIBLE : undef) >= 199506|| (defined(&__XSI_VISIBLE) ? &__XSI_VISIBLE : undef)) {
	unless(defined(&_FTRUNCATE_DECLARED)) {
	    eval 'sub _FTRUNCATE_DECLARED () {1;}' unless defined(&_FTRUNCATE_DECLARED);
	}
    }
    if((defined(&__POSIX_VISIBLE) ? &__POSIX_VISIBLE : undef) >= 199506) {
    }
    if((defined(&__POSIX_VISIBLE) ? &__POSIX_VISIBLE : undef) >= 200112|| (defined(&__XSI_VISIBLE) ? &__XSI_VISIBLE : undef)) {
    }
    if((defined(&__POSIX_VISIBLE) ? &__POSIX_VISIBLE : undef) >= 200112) {
    }
    if((defined(&__POSIX_VISIBLE) ? &__POSIX_VISIBLE : undef) >= 200809|| (defined(&__XSI_VISIBLE) ? &__XSI_VISIBLE : undef)) {
	unless(defined(&_TRUNCATE_DECLARED)) {
	    eval 'sub _TRUNCATE_DECLARED () {1;}' unless defined(&_TRUNCATE_DECLARED);
	}
    }
    if((defined(&__POSIX_VISIBLE) ? &__POSIX_VISIBLE : undef) >= 200809) {
    }
    if((defined(&__POSIX_VISIBLE) ? &__POSIX_VISIBLE : undef) >= 200112|| (defined(&__XSI_VISIBLE) ? &__XSI_VISIBLE : undef) >= 402) {
    }
    if((defined(&__XSI_VISIBLE) ? &__XSI_VISIBLE : undef)) {
	unless(defined(&_SWAB_DECLARED)) {
	    eval 'sub _SWAB_DECLARED () {1;}' unless defined(&_SWAB_DECLARED);
	}
    }
    if(((defined(&__XSI_VISIBLE) ? &__XSI_VISIBLE : undef)  && (defined(&__XSI_VISIBLE) ? &__XSI_VISIBLE : undef) <= 500) || (defined(&__BSD_VISIBLE) ? &__BSD_VISIBLE : undef)) {
    }
    if(((defined(&__XSI_VISIBLE) ? &__XSI_VISIBLE : undef)  && (defined(&__XSI_VISIBLE) ? &__XSI_VISIBLE : undef) <= 600) || (defined(&__BSD_VISIBLE) ? &__BSD_VISIBLE : undef)) {
    }
    if((defined(&__BSD_VISIBLE) ? &__BSD_VISIBLE : undef)) {
	unless(defined(&_MKDTEMP_DECLARED)) {
	    eval 'sub _MKDTEMP_DECLARED () {1;}' unless defined(&_MKDTEMP_DECLARED);
	}
	unless(defined(&_MKNOD_DECLARED)) {
	    eval 'sub _MKNOD_DECLARED () {1;}' unless defined(&_MKNOD_DECLARED);
	}
	unless(defined(&_MKSTEMP_DECLARED)) {
	    eval 'sub _MKSTEMP_DECLARED () {1;}' unless defined(&_MKSTEMP_DECLARED);
	}
	unless(defined(&_MKTEMP_DECLARED)) {
	    eval 'sub _MKTEMP_DECLARED () {1;}' unless defined(&_MKTEMP_DECLARED);
	}
	unless(defined(&_SELECT_DECLARED)) {
	    eval 'sub _SELECT_DECLARED () {1;}' unless defined(&_SELECT_DECLARED);
	}
	unless(defined(&_OPTRESET_DECLARED)) {
	    eval 'sub _OPTRESET_DECLARED () {1;}' unless defined(&_OPTRESET_DECLARED);
	}
    }
}
1;

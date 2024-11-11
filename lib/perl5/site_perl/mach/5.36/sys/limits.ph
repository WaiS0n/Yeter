require '_h2ph_pre.ph';

no warnings qw(redefine misc);

unless(defined(&_SYS_LIMITS_H_)) {
    eval 'sub _SYS_LIMITS_H_ () {1;}' unless defined(&_SYS_LIMITS_H_);
    require 'sys/cdefs.ph';
    require 'machine/_limits.ph';
    eval 'sub CHAR_BIT () { &__CHAR_BIT;}' unless defined(&CHAR_BIT);
    eval 'sub SCHAR_MAX () { &__SCHAR_MAX;}' unless defined(&SCHAR_MAX);
    eval 'sub SCHAR_MIN () { &__SCHAR_MIN;}' unless defined(&SCHAR_MIN);
    eval 'sub UCHAR_MAX () { &__UCHAR_MAX;}' unless defined(&UCHAR_MAX);
    if(defined(&__CHAR_UNSIGNED__)) {
	eval 'sub CHAR_MAX () { &UCHAR_MAX;}' unless defined(&CHAR_MAX);
	eval 'sub CHAR_MIN () {0;}' unless defined(&CHAR_MIN);
    } else {
	eval 'sub CHAR_MAX () { &SCHAR_MAX;}' unless defined(&CHAR_MAX);
	eval 'sub CHAR_MIN () { &SCHAR_MIN;}' unless defined(&CHAR_MIN);
    }
    eval 'sub USHRT_MAX () { &__USHRT_MAX;}' unless defined(&USHRT_MAX);
    eval 'sub SHRT_MAX () { &__SHRT_MAX;}' unless defined(&SHRT_MAX);
    eval 'sub SHRT_MIN () { &__SHRT_MIN;}' unless defined(&SHRT_MIN);
    eval 'sub UINT_MAX () { &__UINT_MAX;}' unless defined(&UINT_MAX);
    eval 'sub INT_MAX () { &__INT_MAX;}' unless defined(&INT_MAX);
    eval 'sub INT_MIN () { &__INT_MIN;}' unless defined(&INT_MIN);
    eval 'sub ULONG_MAX () { &__ULONG_MAX;}' unless defined(&ULONG_MAX);
    eval 'sub LONG_MAX () { &__LONG_MAX;}' unless defined(&LONG_MAX);
    eval 'sub LONG_MIN () { &__LONG_MIN;}' unless defined(&LONG_MIN);
    if(defined(&__LONG_LONG_SUPPORTED)) {
	eval 'sub ULLONG_MAX () { &__ULLONG_MAX;}' unless defined(&ULLONG_MAX);
	eval 'sub LLONG_MAX () { &__LLONG_MAX;}' unless defined(&LLONG_MAX);
	eval 'sub LLONG_MIN () { &__LLONG_MIN;}' unless defined(&LLONG_MIN);
    }
    if((defined(&__POSIX_VISIBLE) ? &__POSIX_VISIBLE : undef) || (defined(&__XSI_VISIBLE) ? &__XSI_VISIBLE : undef)) {
	eval 'sub SSIZE_MAX () { &__SSIZE_MAX;}' unless defined(&SSIZE_MAX);
    }
    if((defined(&__POSIX_VISIBLE) ? &__POSIX_VISIBLE : undef) >= 200112|| (defined(&__XSI_VISIBLE) ? &__XSI_VISIBLE : undef)) {
	eval 'sub SIZE_T_MAX () { &__SIZE_T_MAX;}' unless defined(&SIZE_T_MAX);
	eval 'sub OFF_MAX () { &__OFF_MAX;}' unless defined(&OFF_MAX);
	eval 'sub OFF_MIN () { &__OFF_MIN;}' unless defined(&OFF_MIN);
    }
    if((defined(&__BSD_VISIBLE) ? &__BSD_VISIBLE : undef)) {
	eval 'sub GID_MAX () { &UINT_MAX;}' unless defined(&GID_MAX);
	eval 'sub UID_MAX () { &UINT_MAX;}' unless defined(&UID_MAX);
	eval 'sub UQUAD_MAX () {( &__UQUAD_MAX);}' unless defined(&UQUAD_MAX);
	eval 'sub QUAD_MAX () {( &__QUAD_MAX);}' unless defined(&QUAD_MAX);
	eval 'sub QUAD_MIN () {( &__QUAD_MIN);}' unless defined(&QUAD_MIN);
    }
    if((defined(&__XSI_VISIBLE) ? &__XSI_VISIBLE : undef) || (defined(&__POSIX_VISIBLE) ? &__POSIX_VISIBLE : undef) >= 200809) {
	eval 'sub LONG_BIT () { &__LONG_BIT;}' unless defined(&LONG_BIT);
	eval 'sub WORD_BIT () { &__WORD_BIT;}' unless defined(&WORD_BIT);
    }
    if((defined(&__POSIX_VISIBLE) ? &__POSIX_VISIBLE : undef)) {
	eval 'sub MQ_PRIO_MAX () {64;}' unless defined(&MQ_PRIO_MAX);
    }
}
1;

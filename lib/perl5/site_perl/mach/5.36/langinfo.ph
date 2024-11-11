require '_h2ph_pre.ph';

no warnings qw(redefine misc);

unless(defined(&_LANGINFO_H_)) {
    eval 'sub _LANGINFO_H_ () {1;}' unless defined(&_LANGINFO_H_);
    require 'sys/cdefs.ph';
    require 'sys/_types.ph';
    unless(defined(&_NL_ITEM_DECLARED)) {
	eval 'sub _NL_ITEM_DECLARED () {1;}' unless defined(&_NL_ITEM_DECLARED);
    }
    eval 'sub CODESET () {0;}' unless defined(&CODESET);
    eval 'sub D_T_FMT () {1;}' unless defined(&D_T_FMT);
    eval 'sub D_FMT () {2;}' unless defined(&D_FMT);
    eval 'sub T_FMT () {3;}' unless defined(&T_FMT);
    eval 'sub T_FMT_AMPM () {4;}' unless defined(&T_FMT_AMPM);
    eval 'sub AM_STR () {5;}' unless defined(&AM_STR);
    eval 'sub PM_STR () {6;}' unless defined(&PM_STR);
    eval 'sub DAY_1 () {7;}' unless defined(&DAY_1);
    eval 'sub DAY_2 () {8;}' unless defined(&DAY_2);
    eval 'sub DAY_3 () {9;}' unless defined(&DAY_3);
    eval 'sub DAY_4 () {10;}' unless defined(&DAY_4);
    eval 'sub DAY_5 () {11;}' unless defined(&DAY_5);
    eval 'sub DAY_6 () {12;}' unless defined(&DAY_6);
    eval 'sub DAY_7 () {13;}' unless defined(&DAY_7);
    eval 'sub ABDAY_1 () {14;}' unless defined(&ABDAY_1);
    eval 'sub ABDAY_2 () {15;}' unless defined(&ABDAY_2);
    eval 'sub ABDAY_3 () {16;}' unless defined(&ABDAY_3);
    eval 'sub ABDAY_4 () {17;}' unless defined(&ABDAY_4);
    eval 'sub ABDAY_5 () {18;}' unless defined(&ABDAY_5);
    eval 'sub ABDAY_6 () {19;}' unless defined(&ABDAY_6);
    eval 'sub ABDAY_7 () {20;}' unless defined(&ABDAY_7);
    eval 'sub MON_1 () {21;}' unless defined(&MON_1);
    eval 'sub MON_2 () {22;}' unless defined(&MON_2);
    eval 'sub MON_3 () {23;}' unless defined(&MON_3);
    eval 'sub MON_4 () {24;}' unless defined(&MON_4);
    eval 'sub MON_5 () {25;}' unless defined(&MON_5);
    eval 'sub MON_6 () {26;}' unless defined(&MON_6);
    eval 'sub MON_7 () {27;}' unless defined(&MON_7);
    eval 'sub MON_8 () {28;}' unless defined(&MON_8);
    eval 'sub MON_9 () {29;}' unless defined(&MON_9);
    eval 'sub MON_10 () {30;}' unless defined(&MON_10);
    eval 'sub MON_11 () {31;}' unless defined(&MON_11);
    eval 'sub MON_12 () {32;}' unless defined(&MON_12);
    eval 'sub ABMON_1 () {33;}' unless defined(&ABMON_1);
    eval 'sub ABMON_2 () {34;}' unless defined(&ABMON_2);
    eval 'sub ABMON_3 () {35;}' unless defined(&ABMON_3);
    eval 'sub ABMON_4 () {36;}' unless defined(&ABMON_4);
    eval 'sub ABMON_5 () {37;}' unless defined(&ABMON_5);
    eval 'sub ABMON_6 () {38;}' unless defined(&ABMON_6);
    eval 'sub ABMON_7 () {39;}' unless defined(&ABMON_7);
    eval 'sub ABMON_8 () {40;}' unless defined(&ABMON_8);
    eval 'sub ABMON_9 () {41;}' unless defined(&ABMON_9);
    eval 'sub ABMON_10 () {42;}' unless defined(&ABMON_10);
    eval 'sub ABMON_11 () {43;}' unless defined(&ABMON_11);
    eval 'sub ABMON_12 () {44;}' unless defined(&ABMON_12);
    eval 'sub ERA () {45;}' unless defined(&ERA);
    eval 'sub ERA_D_FMT () {46;}' unless defined(&ERA_D_FMT);
    eval 'sub ERA_D_T_FMT () {47;}' unless defined(&ERA_D_T_FMT);
    eval 'sub ERA_T_FMT () {48;}' unless defined(&ERA_T_FMT);
    eval 'sub ALT_DIGITS () {49;}' unless defined(&ALT_DIGITS);
    eval 'sub RADIXCHAR () {50;}' unless defined(&RADIXCHAR);
    eval 'sub THOUSEP () {51;}' unless defined(&THOUSEP);
    eval 'sub YESEXPR () {52;}' unless defined(&YESEXPR);
    eval 'sub NOEXPR () {53;}' unless defined(&NOEXPR);
    if((defined(&__BSD_VISIBLE) ? &__BSD_VISIBLE : undef) || ((defined(&__XSI_VISIBLE) ? &__XSI_VISIBLE : undef)  && (defined(&__XSI_VISIBLE) ? &__XSI_VISIBLE : undef) <= 500)) {
	eval 'sub YESSTR () {54;}' unless defined(&YESSTR);
	eval 'sub NOSTR () {55;}' unless defined(&NOSTR);
    }
    eval 'sub CRNCYSTR () {56;}' unless defined(&CRNCYSTR);
    if((defined(&__BSD_VISIBLE) ? &__BSD_VISIBLE : undef)) {
	eval 'sub D_MD_ORDER () {57;}' unless defined(&D_MD_ORDER);
    }
    eval 'sub ALTMON_1 () {58;}' unless defined(&ALTMON_1);
    eval 'sub ALTMON_2 () {59;}' unless defined(&ALTMON_2);
    eval 'sub ALTMON_3 () {60;}' unless defined(&ALTMON_3);
    eval 'sub ALTMON_4 () {61;}' unless defined(&ALTMON_4);
    eval 'sub ALTMON_5 () {62;}' unless defined(&ALTMON_5);
    eval 'sub ALTMON_6 () {63;}' unless defined(&ALTMON_6);
    eval 'sub ALTMON_7 () {64;}' unless defined(&ALTMON_7);
    eval 'sub ALTMON_8 () {65;}' unless defined(&ALTMON_8);
    eval 'sub ALTMON_9 () {66;}' unless defined(&ALTMON_9);
    eval 'sub ALTMON_10 () {67;}' unless defined(&ALTMON_10);
    eval 'sub ALTMON_11 () {68;}' unless defined(&ALTMON_11);
    eval 'sub ALTMON_12 () {69;}' unless defined(&ALTMON_12);
    if((defined(&__POSIX_VISIBLE) ? &__POSIX_VISIBLE : undef) >= 200809|| defined(&_XLOCALE_H_)) {
	require 'xlocale/_langinfo.ph';
    }
}
1;

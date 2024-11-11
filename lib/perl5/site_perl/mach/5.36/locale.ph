require '_h2ph_pre.ph';

no warnings qw(redefine misc);

unless(defined(&_LOCALE_H_)) {
    eval 'sub _LOCALE_H_ () {1;}' unless defined(&_LOCALE_H_);
    require 'sys/_null.ph';
    eval 'sub LC_ALL () {0;}' unless defined(&LC_ALL);
    eval 'sub LC_COLLATE () {1;}' unless defined(&LC_COLLATE);
    eval 'sub LC_CTYPE () {2;}' unless defined(&LC_CTYPE);
    eval 'sub LC_MONETARY () {3;}' unless defined(&LC_MONETARY);
    eval 'sub LC_NUMERIC () {4;}' unless defined(&LC_NUMERIC);
    eval 'sub LC_TIME () {5;}' unless defined(&LC_TIME);
    eval 'sub LC_MESSAGES () {6;}' unless defined(&LC_MESSAGES);
    eval 'sub _LC_LAST () {7;}' unless defined(&_LC_LAST);
    require 'sys/cdefs.ph';
    if((defined(&__POSIX_VISIBLE) ? &__POSIX_VISIBLE : undef) >= 200809) {
	require 'xlocale/_locale.ph';
    }
}
1;

require '_h2ph_pre.ph';

no warnings qw(redefine misc);

unless(defined(&_UCHAR_H_)) {
    eval 'sub _UCHAR_H_ () {1;}' unless defined(&_UCHAR_H_);
    require 'sys/cdefs.ph';
    require 'sys/_types.ph';
    unless(defined(&_CHAR16_T_DECLARED)) {
	eval 'sub _CHAR16_T_DECLARED () {1;}' unless defined(&_CHAR16_T_DECLARED);
    }
    unless(defined(&_CHAR32_T_DECLARED)) {
	eval 'sub _CHAR32_T_DECLARED () {1;}' unless defined(&_CHAR32_T_DECLARED);
    }
    unless(defined(&_MBSTATE_T_DECLARED)) {
	eval 'sub _MBSTATE_T_DECLARED () {1;}' unless defined(&_MBSTATE_T_DECLARED);
    }
    unless(defined(&_SIZE_T_DECLARED)) {
	eval 'sub _SIZE_T_DECLARED () {1;}' unless defined(&_SIZE_T_DECLARED);
    }
    if((defined(&__BSD_VISIBLE) ? &__BSD_VISIBLE : undef) || defined(&_XLOCALE_H_)) {
	require 'xlocale/_uchar.ph';
    }
}
1;

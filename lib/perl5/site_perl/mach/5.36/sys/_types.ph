require '_h2ph_pre.ph';

no warnings qw(redefine misc);

unless(defined(&_SYS__TYPES_H_)) {
    eval 'sub _SYS__TYPES_H_ () {1;}' unless defined(&_SYS__TYPES_H_);
    require 'sys/cdefs.ph';
    if((defined(&__SIZEOF_LONG__) ? &__SIZEOF_LONG__ : undef) == 8) {
    }
 elsif((defined(&__SIZEOF_LONG__) ? &__SIZEOF_LONG__ : undef) == 4) {
    } else {
	die("unsupported\ long\ size");
    }
    if((defined(&__SIZEOF_POINTER__) ? &__SIZEOF_POINTER__ : undef) == 8) {
    }
 elsif((defined(&__SIZEOF_POINTER__) ? &__SIZEOF_POINTER__ : undef) == 4) {
    } else {
	die("unsupported\ pointer\ size");
    }
    if((defined(&__SIZEOF_SIZE_T__) ? &__SIZEOF_SIZE_T__ : undef) == 8) {
    }
 elsif((defined(&__SIZEOF_SIZE_T__) ? &__SIZEOF_SIZE_T__ : undef) == 4) {
    } else {
	die("unsupported\ size_t\ size");
    }
    if((defined(&__SIZEOF_PTRDIFF_T__) ? &__SIZEOF_PTRDIFF_T__ : undef) == 8) {
    }
 elsif((defined(&__SIZEOF_PTRDIFF_T__) ? &__SIZEOF_PTRDIFF_T__ : undef) == 4) {
    } else {
	die("unsupported\ ptrdiff_t\ size");
    }
    require 'machine/_types.ph';
    if(!defined(&__clang__) || !defined(&__cplusplus)) {
    }
    if(defined(&__cplusplus)  && (defined(&__cplusplus) ? &__cplusplus : undef) >= 201103) {
	eval 'sub _CHAR16_T_DECLARED () {1;}' unless defined(&_CHAR16_T_DECLARED);
	eval 'sub _CHAR32_T_DECLARED () {1;}' unless defined(&_CHAR32_T_DECLARED);
    }
    unless(defined(&_STANDALONE)) {
    }
    if(!defined(&__GNUC_VA_LIST)  && !defined(&__NO_GNUC_VA_LIST)) {
	eval 'sub __GNUC_VA_LIST () {1;}' unless defined(&__GNUC_VA_LIST);
    }
    eval 'sub __INO64 () {1;}' unless defined(&__INO64);
}
1;

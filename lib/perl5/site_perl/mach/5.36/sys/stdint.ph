require '_h2ph_pre.ph';

no warnings qw(redefine misc);

unless(defined(&_SYS_STDINT_H_)) {
    eval 'sub _SYS_STDINT_H_ () {1;}' unless defined(&_SYS_STDINT_H_);
    require 'sys/cdefs.ph';
    require 'sys/_types.ph';
    require 'machine/_stdint.ph';
    require 'sys/_stdint.ph';
    if(defined(&UINTPTR_MAX)  && defined(&UINT64_MAX)  && ((defined(&UINTPTR_MAX) ? &UINTPTR_MAX : undef) == (defined(&UINT64_MAX) ? &UINT64_MAX : undef))) {
	eval 'sub __WORDSIZE () {64;}' unless defined(&__WORDSIZE);
    } else {
	eval 'sub __WORDSIZE () {32;}' unless defined(&__WORDSIZE);
    }
    eval 'sub WCHAR_MIN () { &__WCHAR_MIN;}' unless defined(&WCHAR_MIN);
    eval 'sub WCHAR_MAX () { &__WCHAR_MAX;}' unless defined(&WCHAR_MAX);
    if((defined(&__EXT1_VISIBLE) ? &__EXT1_VISIBLE : undef)) {
	unless(defined(&RSIZE_MAX)) {
	    eval 'sub RSIZE_MAX () {( &SIZE_MAX >> 1);}' unless defined(&RSIZE_MAX);
	}
    }
}
1;

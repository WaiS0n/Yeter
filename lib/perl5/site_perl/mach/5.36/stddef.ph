require '_h2ph_pre.ph';

no warnings qw(redefine misc);

unless(defined(&_STDDEF_H_)) {
    eval 'sub _STDDEF_H_ () {1;}' unless defined(&_STDDEF_H_);
    require 'sys/cdefs.ph';
    require 'sys/_null.ph';
    require 'sys/_types.ph';
    unless(defined(&_PTRDIFF_T_DECLARED)) {
	eval 'sub _PTRDIFF_T_DECLARED () {1;}' unless defined(&_PTRDIFF_T_DECLARED);
    }
    if((defined(&__BSD_VISIBLE) ? &__BSD_VISIBLE : undef)) {
	unless(defined(&_RUNE_T_DECLARED)) {
	    eval 'sub _RUNE_T_DECLARED () {1;}' unless defined(&_RUNE_T_DECLARED);
	}
    }
    unless(defined(&_SIZE_T_DECLARED)) {
	eval 'sub _SIZE_T_DECLARED () {1;}' unless defined(&_SIZE_T_DECLARED);
    }
    unless(defined(&__cplusplus)) {
	unless(defined(&_WCHAR_T_DECLARED)) {
	    eval 'sub _WCHAR_T_DECLARED () {1;}' unless defined(&_WCHAR_T_DECLARED);
	}
    }
    if((defined(&__ISO_C_VISIBLE) ? &__ISO_C_VISIBLE : undef) >= 2011|| (defined(&__cplusplus) ? &__cplusplus : undef) >= 201103) {
	unless(defined(&__CLANG_MAX_ALIGN_T_DEFINED)) {
	    eval 'sub __CLANG_MAX_ALIGN_T_DEFINED () {1;}' unless defined(&__CLANG_MAX_ALIGN_T_DEFINED);
	    eval 'sub _GCC_MAX_ALIGN_T () {1;}' unless defined(&_GCC_MAX_ALIGN_T);
	}
    }
    eval 'sub offsetof {
        my($type, $field) = @_;
	    eval q( &__offsetof($type, $field));
    }' unless defined(&offsetof);
    if((defined(&__EXT1_VISIBLE) ? &__EXT1_VISIBLE : undef)) {
	unless(defined(&_RSIZE_T_DEFINED)) {
	    eval 'sub _RSIZE_T_DEFINED () {1;}' unless defined(&_RSIZE_T_DEFINED);
	}
    }
}
1;

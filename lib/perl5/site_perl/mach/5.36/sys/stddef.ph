require '_h2ph_pre.ph';

no warnings qw(redefine misc);

unless(defined(&_SYS_STDDEF_H_)) {
    eval 'sub _SYS_STDDEF_H_ () {1;}' unless defined(&_SYS_STDDEF_H_);
    require 'sys/cdefs.ph';
    require 'sys/_null.ph';
    require 'sys/_types.ph';
    unless(defined(&_PTRDIFF_T_DECLARED)) {
	eval 'sub _PTRDIFF_T_DECLARED () {1;}' unless defined(&_PTRDIFF_T_DECLARED);
    }
    eval 'sub offsetof {
        my($type, $field) = @_;
	    eval q( &__offsetof($type, $field));
    }' unless defined(&offsetof);
}
1;

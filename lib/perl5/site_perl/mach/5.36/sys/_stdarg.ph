require '_h2ph_pre.ph';

no warnings qw(redefine misc);

unless(defined(&_SYS__STDARG_H_)) {
    eval 'sub _SYS__STDARG_H_ () {1;}' unless defined(&_SYS__STDARG_H_);
    require 'sys/cdefs.ph';
    require 'sys/_types.ph';
    unless(defined(&_VA_LIST_DECLARED)) {
	eval 'sub _VA_LIST_DECLARED () {1;}' unless defined(&_VA_LIST_DECLARED);
    }
    eval 'sub va_start {
        my($ap, $last) = @_;
	    eval q( &__builtin_va_start(($ap), ($last)));
    }' unless defined(&va_start);
    eval 'sub va_arg {
        my($ap, $type) = @_;
	    eval q( &__builtin_va_arg(($ap), $type));
    }' unless defined(&va_arg);
    eval 'sub __va_copy {
        my($dest, $src) = @_;
	    eval q( &__builtin_va_copy(($dest), ($src)));
    }' unless defined(&__va_copy);
    if((defined(&__ISO_C_VISIBLE) ? &__ISO_C_VISIBLE : undef) >= 1999) {
	eval 'sub va_copy {
	    my($dest, $src) = @_;
    	    eval q( &__va_copy($dest, $src));
	}' unless defined(&va_copy);
    }
    eval 'sub va_end {
        my($ap) = @_;
	    eval q( &__builtin_va_end($ap));
    }' unless defined(&va_end);
}
1;

require '_h2ph_pre.ph';

no warnings qw(redefine misc);

unless(defined(&_SETJMP_H_)) {
    eval 'sub _SETJMP_H_ () {1;}' unless defined(&_SETJMP_H_);
    require 'sys/cdefs.ph';
    require 'machine/setjmp.ph';
    if((defined(&__XSI_VISIBLE) ? &__XSI_VISIBLE : undef) >= 600) {
    }
    if((defined(&__BSD_VISIBLE) ? &__BSD_VISIBLE : undef)) {
    }
    if((defined(&__POSIX_VISIBLE) ? &__POSIX_VISIBLE : undef) || (defined(&__XSI_VISIBLE) ? &__XSI_VISIBLE : undef)) {
    }
}
1;

require '_h2ph_pre.ph';

no warnings qw(redefine misc);

unless(defined(&_VARARGS_H_)) {
    eval 'sub _VARARGS_H_ () {1;}' unless defined(&_VARARGS_H_);
    die("<varargs.h> is obsolete.");
    die("Change your code to use <stdarg.h> instead.");
}
1;

require '_h2ph_pre.ph';

no warnings qw(redefine misc);

if(defined(&__cplusplus)) {
    die("<stdnoreturn.h> cannot be used in combination with C++11.");
}
unless(defined(&noreturn)) {
    require 'sys/cdefs.ph';
    eval 'sub noreturn () { &_Noreturn;}' unless defined(&noreturn);
}
1;

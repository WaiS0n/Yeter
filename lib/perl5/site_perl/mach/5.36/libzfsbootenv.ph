require '_h2ph_pre.ph';

no warnings qw(redefine misc);

unless(defined(&_LIBZFSBOOTENV_H)) {
    eval 'sub _LIBZFSBOOTENV_H () { &extern  &__attribute__(( &visibility("default")));}' unless defined(&_LIBZFSBOOTENV_H);
    if(defined(&__cplusplus)) {
    }
    eval("sub lzbe_add () { 0; }") unless defined(&lzbe_add);
    eval("sub lzbe_replace () { 1; }") unless defined(&lzbe_replace);
    if(defined(&__cplusplus)) {
    }
}
1;

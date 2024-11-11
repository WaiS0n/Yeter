require '_h2ph_pre.ph';

no warnings qw(redefine misc);

unless(defined(&_PRINTF_H_)) {
    eval 'sub _PRINTF_H_ () {1;}' unless defined(&_PRINTF_H_);
    require 'stdio.ph';
    require 'wchar.ph';
    eval 'sub __PRINTFMAXARG () {2;}' unless defined(&__PRINTFMAXARG);
    eval("sub PA_INT () { (1<<0); }") unless defined(&PA_INT);
    eval("sub PA_CHAR () { (1<<1); }") unless defined(&PA_CHAR);
    eval("sub PA_WCHAR () { (1<<2); }") unless defined(&PA_WCHAR);
    eval("sub PA_STRING () { (1<<3); }") unless defined(&PA_STRING);
    eval("sub PA_WSTRING () { (1<<4); }") unless defined(&PA_WSTRING);
    eval("sub PA_POINTER () { (1<<5); }") unless defined(&PA_POINTER);
    eval("sub PA_FLOAT () { (1<<6); }") unless defined(&PA_FLOAT);
    eval("sub PA_DOUBLE () { (1<<7); }") unless defined(&PA_DOUBLE);
    eval 'sub PA_FLAG_MASK () {0xff0000;}' unless defined(&PA_FLAG_MASK);
    eval 'sub PA_FLAG_LONG_LONG () {(1<< 16);}' unless defined(&PA_FLAG_LONG_LONG);
    eval 'sub PA_FLAG_LONG () {(1<< 17);}' unless defined(&PA_FLAG_LONG);
    eval 'sub PA_FLAG_SHORT () {(1<< 18);}' unless defined(&PA_FLAG_SHORT);
    eval 'sub PA_FLAG_PTR () {(1<< 19);}' unless defined(&PA_FLAG_PTR);
    eval 'sub PA_FLAG_QUAD () {(1<< 20);}' unless defined(&PA_FLAG_QUAD);
    eval 'sub PA_FLAG_INTMAX () {(1<< 21);}' unless defined(&PA_FLAG_INTMAX);
    eval 'sub PA_FLAG_SIZE () {(1<< 22);}' unless defined(&PA_FLAG_SIZE);
    eval 'sub PA_FLAG_PTRDIFF () {(1<< 23);}' unless defined(&PA_FLAG_PTRDIFF);
    eval 'sub PA_FLAG_LONG_DOUBLE () { &PA_FLAG_LONG_LONG;}' unless defined(&PA_FLAG_LONG_DOUBLE);
}
1;

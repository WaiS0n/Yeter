require '_h2ph_pre.ph';

no warnings qw(redefine misc);

unless(defined(&_SEARCH_H_)) {
    eval 'sub _SEARCH_H_ () {1;}' unless defined(&_SEARCH_H_);
    require 'sys/cdefs.ph';
    require 'sys/_types.ph';
    unless(defined(&_SIZE_T_DECLARED)) {
	eval 'sub _SIZE_T_DECLARED () {1;}' unless defined(&_SIZE_T_DECLARED);
    }
    eval("sub FIND () { 0; }") unless defined(&FIND);
    eval("sub ENTER () { 1; }") unless defined(&ENTER);
    eval("sub preorder () { 0; }") unless defined(&preorder);
    eval("sub postorder () { 1; }") unless defined(&postorder);
    eval("sub endorder () { 2; }") unless defined(&endorder);
    eval("sub leaf () { 3; }") unless defined(&leaf);
    if(defined(&_SEARCH_PRIVATE)) {
    } else {
    }
    if((defined(&__BSD_VISIBLE) ? &__BSD_VISIBLE : undef)) {
    }
    if((defined(&__BSD_VISIBLE) ? &__BSD_VISIBLE : undef)) {
    }
}
1;

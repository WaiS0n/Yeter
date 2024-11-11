require '_h2ph_pre.ph';

no warnings qw(redefine misc);

unless(defined(&_BLOCK_PRIVATE_H_)) {
    eval 'sub _BLOCK_PRIVATE_H_ () {1;}' unless defined(&_BLOCK_PRIVATE_H_);
    if(!defined(&BLOCK_EXPORT)) {
	if(defined(&__cplusplus)) {
	    eval 'sub BLOCK_EXPORT () { &extern "C";}' unless defined(&BLOCK_EXPORT);
	} else {
	    eval 'sub BLOCK_EXPORT () { &extern;}' unless defined(&BLOCK_EXPORT);
	}
    }
    unless(defined(&_MSC_VER)) {
	require 'stdbool.ph';
    } else {
	eval 'sub true () {( &bool)1;}' unless defined(&true);
	eval 'sub false () {( &bool)0;}' unless defined(&false);
    }
    if(defined(&__cplusplus)) {
    }
    eval("sub BLOCK_REFCOUNT_MASK () { (0xffff); }") unless defined(&BLOCK_REFCOUNT_MASK);
    eval("sub BLOCK_NEEDS_FREE () { (1<<24); }") unless defined(&BLOCK_NEEDS_FREE);
    eval("sub BLOCK_HAS_COPY_DISPOSE () { (1<<25); }") unless defined(&BLOCK_HAS_COPY_DISPOSE);
    eval("sub BLOCK_HAS_CTOR () { (1<<26); }") unless defined(&BLOCK_HAS_CTOR);
    eval("sub BLOCK_IS_GC () { (1<<27); }") unless defined(&BLOCK_IS_GC);
    eval("sub BLOCK_IS_GLOBAL () { (1<<28); }") unless defined(&BLOCK_IS_GLOBAL);
    eval("sub BLOCK_HAS_DESCRIPTOR () { (1<<29); }") unless defined(&BLOCK_HAS_DESCRIPTOR);
    eval("sub BLOCK_FIELD_IS_OBJECT () { 3; }") unless defined(&BLOCK_FIELD_IS_OBJECT);
    eval("sub BLOCK_FIELD_IS_BLOCK () { 7; }") unless defined(&BLOCK_FIELD_IS_BLOCK);
    eval("sub BLOCK_FIELD_IS_BYREF () { 8; }") unless defined(&BLOCK_FIELD_IS_BYREF);
    eval("sub BLOCK_FIELD_IS_WEAK () { 16; }") unless defined(&BLOCK_FIELD_IS_WEAK);
    eval("sub BLOCK_BYREF_CALLER () { 128; }") unless defined(&BLOCK_BYREF_CALLER);
    if(defined(&__cplusplus)) {
    }
}
1;

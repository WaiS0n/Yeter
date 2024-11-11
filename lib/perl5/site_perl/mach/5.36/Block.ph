require '_h2ph_pre.ph';

no warnings qw(redefine misc);

unless(defined(&_BLOCK_H_)) {
    eval 'sub _BLOCK_H_ () {1;}' unless defined(&_BLOCK_H_);
    if(!defined(&BLOCK_EXPORT)) {
	if(defined(&__cplusplus)) {
	    eval 'sub BLOCK_EXPORT () { &extern "C";}' unless defined(&BLOCK_EXPORT);
	} else {
	    eval 'sub BLOCK_EXPORT () { &extern;}' unless defined(&BLOCK_EXPORT);
	}
    }
    if(defined(&__cplusplus)) {
    }
    if(defined(&__cplusplus)) {
    }
    eval 'sub Block_copy () {(...) (( &__typeof( &__VA_ARGS__)) &_Block_copy(( &const  &void *)( &__VA_ARGS__)));}' unless defined(&Block_copy);
    eval 'sub Block_release () {(...)  &_Block_release(( &const  &void *)( &__VA_ARGS__));}' unless defined(&Block_release);
}
1;

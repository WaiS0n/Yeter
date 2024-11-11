require '_h2ph_pre.ph';

no warnings qw(redefine misc);

unless(defined(&_MALLOC_NP_H_)) {
    eval 'sub _MALLOC_NP_H_ () {1;}' unless defined(&_MALLOC_NP_H_);
    require 'sys/types.ph';
    if(defined(&__cplusplus)) {
	eval 'sub __MyBool () { &bool;}' unless defined(&__MyBool);
    } else {
	eval 'sub __MyBool () { &_Bool;}' unless defined(&__MyBool);
    }
    eval 'sub MALLCTL_ARENAS_ALL () {4096;}' unless defined(&MALLCTL_ARENAS_ALL);
    eval 'sub MALLCTL_ARENAS_DESTROYED () {4097;}' unless defined(&MALLCTL_ARENAS_DESTROYED);
    eval 'sub MALLOCX_LG_ALIGN {
        my($la) = @_;
	    eval q((($la)));
    }' unless defined(&MALLOCX_LG_ALIGN);
    eval 'sub MALLOCX_ALIGN {
        my($a) = @_;
	    eval q((( &ffsl(($a))-1)));
    }' unless defined(&MALLOCX_ALIGN);
    eval 'sub MALLOCX_ZERO () {(0x40);}' unless defined(&MALLOCX_ZERO);
    eval 'sub MALLOCX_TCACHE {
        my($tc) = @_;
	    eval q((((($tc)+2) << 8)));
    }' unless defined(&MALLOCX_TCACHE);
    eval 'sub MALLOCX_TCACHE_NONE () { &MALLOCX_TCACHE(-1);}' unless defined(&MALLOCX_TCACHE_NONE);
    eval 'sub MALLOCX_ARENA {
        my($a) = @_;
	    eval q((((($a))+1) << 20));
    }' unless defined(&MALLOCX_ARENA);
    undef(&__MyBool) if defined(&__MyBool);
}
1;

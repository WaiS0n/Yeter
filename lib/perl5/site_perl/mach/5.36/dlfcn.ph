require '_h2ph_pre.ph';

no warnings qw(redefine misc);

unless(defined(&_DLFCN_H_)) {
    eval 'sub _DLFCN_H_ () {1;}' unless defined(&_DLFCN_H_);
    require 'sys/_types.ph';
    eval 'sub RTLD_LAZY () {1;}' unless defined(&RTLD_LAZY);
    eval 'sub RTLD_NOW () {2;}' unless defined(&RTLD_NOW);
    eval 'sub RTLD_MODEMASK () {0x3;}' unless defined(&RTLD_MODEMASK);
    eval 'sub RTLD_GLOBAL () {0x100;}' unless defined(&RTLD_GLOBAL);
    eval 'sub RTLD_LOCAL () {0;}' unless defined(&RTLD_LOCAL);
    eval 'sub RTLD_TRACE () {0x200;}' unless defined(&RTLD_TRACE);
    eval 'sub RTLD_NODELETE () {0x1000;}' unless defined(&RTLD_NODELETE);
    eval 'sub RTLD_NOLOAD () {0x2000;}' unless defined(&RTLD_NOLOAD);
    eval 'sub RTLD_DEEPBIND () {0x4000;}' unless defined(&RTLD_DEEPBIND);
    eval 'sub RTLD_DI_LINKMAP () {2;}' unless defined(&RTLD_DI_LINKMAP);
    eval 'sub RTLD_DI_SERINFO () {4;}' unless defined(&RTLD_DI_SERINFO);
    eval 'sub RTLD_DI_SERINFOSIZE () {5;}' unless defined(&RTLD_DI_SERINFOSIZE);
    eval 'sub RTLD_DI_ORIGIN () {6;}' unless defined(&RTLD_DI_ORIGIN);
    eval 'sub RTLD_DI_MAX () { &RTLD_DI_ORIGIN;}' unless defined(&RTLD_DI_MAX);
    eval 'sub RTLD_NEXT () {(( &void *) -1);}' unless defined(&RTLD_NEXT);
    eval 'sub RTLD_DEFAULT () {(( &void *) -2);}' unless defined(&RTLD_DEFAULT);
    eval 'sub RTLD_SELF () {(( &void *) -3);}' unless defined(&RTLD_SELF);
    if((defined(&__BSD_VISIBLE) ? &__BSD_VISIBLE : undef)) {
	unless(defined(&_SIZE_T_DECLARED)) {
	    eval 'sub _SIZE_T_DECLARED () {1;}' unless defined(&_SIZE_T_DECLARED);
	}
    }
    if((defined(&__BSD_VISIBLE) ? &__BSD_VISIBLE : undef)) {
    }
}
1;

require '_h2ph_pre.ph';

no warnings qw(redefine misc);

unless(defined(&_SYS__PTHREADTYPES_H_)) {
    eval 'sub _SYS__PTHREADTYPES_H_ () {1;}' unless defined(&_SYS__PTHREADTYPES_H_);
    unless(defined(&_PTHREAD_T_DECLARED)) {
	eval 'sub _PTHREAD_T_DECLARED () {1;}' unless defined(&_PTHREAD_T_DECLARED);
    }
}
1;

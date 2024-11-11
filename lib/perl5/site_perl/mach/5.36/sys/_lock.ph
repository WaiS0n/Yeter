require '_h2ph_pre.ph';

no warnings qw(redefine misc);

unless(defined(&_SYS__LOCK_H_)) {
    eval 'sub _SYS__LOCK_H_ () {1;}' unless defined(&_SYS__LOCK_H_);
    if(defined(&_KERNEL)) {
	if((defined(&KLD_MODULE)  && !defined(&KLD_TIED)) || defined(&WITNESS) || defined(&INVARIANTS) || defined(&LOCK_PROFILING) || defined(&KTR)) {
	    eval 'sub LOCK_DEBUG () {1;}' unless defined(&LOCK_DEBUG);
	} else {
	    eval 'sub LOCK_DEBUG () {0;}' unless defined(&LOCK_DEBUG);
	}
	if((defined(&LOCK_DEBUG) ? &LOCK_DEBUG : undef) > 0) {
	    eval 'sub LOCK_FILE_LINE_ARG_DEF () {,  &const \'char\' * &file, \'int\'  &line;}' unless defined(&LOCK_FILE_LINE_ARG_DEF);
	    eval 'sub LOCK_FILE_LINE_ARG () {,  &file,  &line;}' unless defined(&LOCK_FILE_LINE_ARG);
	    eval 'sub LOCK_FILE () { &__FILE__;}' unless defined(&LOCK_FILE);
	    eval 'sub LOCK_LINE () { &__LINE__;}' unless defined(&LOCK_LINE);
	} else {
	    eval 'sub LOCK_FILE_LINE_ARG_DEF () {1;}' unless defined(&LOCK_FILE_LINE_ARG_DEF);
	    eval 'sub LOCK_FILE_LINE_ARG () {1;}' unless defined(&LOCK_FILE_LINE_ARG);
	    eval 'sub LOCK_FILE () { &NULL;}' unless defined(&LOCK_FILE);
	    eval 'sub LOCK_LINE () {0;}' unless defined(&LOCK_LINE);
	}
    }
}
1;

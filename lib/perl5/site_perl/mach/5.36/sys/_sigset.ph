require '_h2ph_pre.ph';

no warnings qw(redefine misc);

unless(defined(&_SYS__SIGSET_H_)) {
    eval 'sub _SYS__SIGSET_H_ () {1;}' unless defined(&_SYS__SIGSET_H_);
    eval 'sub _SIG_WORDS () {4;}' unless defined(&_SIG_WORDS);
    eval 'sub _SIG_MAXSIG () {128;}' unless defined(&_SIG_MAXSIG);
    eval 'sub _SIG_IDX {
        my($sig) = @_;
	    eval q((($sig) - 1));
    }' unless defined(&_SIG_IDX);
    eval 'sub _SIG_WORD {
        my($sig) = @_;
	    eval q(( &_SIG_IDX($sig) >> 5));
    }' unless defined(&_SIG_WORD);
    eval 'sub _SIG_BIT {
        my($sig) = @_;
	    eval q((1 << ( &_SIG_IDX($sig) & 31)));
    }' unless defined(&_SIG_BIT);
    eval 'sub _SIG_VALID {
        my($sig) = @_;
	    eval q((($sig) <=  &_SIG_MAXSIG  && ($sig) > 0));
    }' unless defined(&_SIG_VALID);
    if(defined(&_KERNEL)  && defined(&COMPAT_43)) {
    }
}
1;

require '_h2ph_pre.ph';

no warnings qw(redefine misc);

unless(defined(&_SYS__SMR_H_)) {
    eval 'sub _SYS__SMR_H_ () {1;}' unless defined(&_SYS__SMR_H_);
    eval 'sub SMR_ENTERED {
        my($smr) = @_;
	    eval q(( ($curthread->{td_critnest}) != 0 &&  &zpcpu_get(($smr))-> &c_seq !=  &SMR_SEQ_INVALID));
    }' unless defined(&SMR_ENTERED);
    eval 'sub SMR_ASSERT_ENTERED {
        my($smr) = @_;
	    eval q( &KASSERT( &SMR_ENTERED($smr), (\\"Not in smr section\\")));
    }' unless defined(&SMR_ASSERT_ENTERED);
    eval 'sub SMR_ASSERT_NOT_ENTERED {
        my($smr) = @_;
	    eval q( &KASSERT(! &SMR_ENTERED($smr), (\\"In smr section.\\")););
    }' unless defined(&SMR_ASSERT_NOT_ENTERED);
    eval 'sub SMR_ASSERT {
        my($ex, $fn) = @_;
	    eval q( &KASSERT(($ex), ($fn \\": Assertion \\" $ex \\" failed at %s:%d\\",  &__FILE__,  &__LINE__)));
    }' unless defined(&SMR_ASSERT);
}
1;

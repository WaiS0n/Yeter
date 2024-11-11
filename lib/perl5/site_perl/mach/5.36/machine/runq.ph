require '_h2ph_pre.ph';

no warnings qw(redefine misc);

unless(defined(&_MACHINE_RUNQ_H_)) {
    eval 'sub _MACHINE_RUNQ_H_ () {1;}' unless defined(&_MACHINE_RUNQ_H_);
    eval 'sub RQB_LEN () {(1);}' unless defined(&RQB_LEN);
    eval 'sub RQB_L2BPW () {(6);}' unless defined(&RQB_L2BPW);
    eval 'sub RQB_BPW () {(1<< &RQB_L2BPW);}' unless defined(&RQB_BPW);
    eval 'sub RQB_BIT {
        my($pri) = @_;
	    eval q((1 << (($pri) & ( &RQB_BPW - 1))));
    }' unless defined(&RQB_BIT);
    eval 'sub RQB_WORD {
        my($pri) = @_;
	    eval q((($pri) >>  &RQB_L2BPW));
    }' unless defined(&RQB_WORD);
    eval 'sub RQB_FFS {
        my($word) = @_;
	    eval q(( &bsfq($word)));
    }' unless defined(&RQB_FFS);
}
1;

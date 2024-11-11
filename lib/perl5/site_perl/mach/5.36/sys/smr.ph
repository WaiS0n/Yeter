require '_h2ph_pre.ph';

no warnings qw(redefine misc);

unless(defined(&_SYS_SMR_H_)) {
    eval 'sub _SYS_SMR_H_ () {1;}' unless defined(&_SYS_SMR_H_);
    require 'sys/_smr.ph';
    eval 'sub SMR_SEQ_LT {
        my($a, $b) = @_;
	    eval q((( &smr_delta_t)(($a)-($b)) < 0));
    }' unless defined(&SMR_SEQ_LT);
    eval 'sub SMR_SEQ_LEQ {
        my($a, $b) = @_;
	    eval q((( &smr_delta_t)(($a)-($b)) <= 0));
    }' unless defined(&SMR_SEQ_LEQ);
    eval 'sub SMR_SEQ_GT {
        my($a, $b) = @_;
	    eval q((( &smr_delta_t)(($a)-($b)) > 0));
    }' unless defined(&SMR_SEQ_GT);
    eval 'sub SMR_SEQ_GEQ {
        my($a, $b) = @_;
	    eval q((( &smr_delta_t)(($a)-($b)) >= 0));
    }' unless defined(&SMR_SEQ_GEQ);
    eval 'sub SMR_SEQ_DELTA {
        my($a, $b) = @_;
	    eval q((( &smr_delta_t)(($a)-($b))));
    }' unless defined(&SMR_SEQ_DELTA);
    eval 'sub SMR_SEQ_MIN {
        my($a, $b) = @_;
	    eval q(( &SMR_SEQ_LT(($a), ($b)) ? ($a) : ($b)));
    }' unless defined(&SMR_SEQ_MIN);
    eval 'sub SMR_SEQ_MAX {
        my($a, $b) = @_;
	    eval q(( &SMR_SEQ_GT(($a), ($b)) ? ($a) : ($b)));
    }' unless defined(&SMR_SEQ_MAX);
    eval 'sub SMR_SEQ_INVALID () {0;}' unless defined(&SMR_SEQ_INVALID);
    eval 'sub SMR_LAZY () {0x1;}' unless defined(&SMR_LAZY);
    eval 'sub SMR_DEFERRED () {0x2;}' unless defined(&SMR_DEFERRED);
    eval 'sub smr_current {
        my($smr) = @_;
	    eval q({ ( &smr_shared_current( &zpcpu_get($smr)-> &c_shared)); });
    }' unless defined(&smr_current);
    if(defined(&__amd64__) || defined(&__i386__)) {
    } else {
    }
}
1;

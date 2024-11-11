require '_h2ph_pre.ph';

no warnings qw(redefine misc);

unless(defined(&_SYS_COVERAGE_H_)) {
    eval 'sub _SYS_COVERAGE_H_ () {1;}' unless defined(&_SYS_COVERAGE_H_);
    if(!defined(&_KERNEL)  && !defined(&_SYS_KCOV_H_)) {
	die("Do\ not\ include\ this\ file\ directly\ in\ userspace\,\ use\ sys\/kcov\.h");
    }
    eval 'sub COV_CMP_CONST () {(1<< 0);}' unless defined(&COV_CMP_CONST);
    eval 'sub COV_CMP_SIZE {
        my($x) = @_;
	    eval q((($x) << 1));
    }' unless defined(&COV_CMP_SIZE);
    eval 'sub COV_CMP_MASK () {(3<< 1);}' unless defined(&COV_CMP_MASK);
    eval 'sub COV_CMP_GET_SIZE {
        my($x) = @_;
	    eval q(((($x) >> 1) & 3));
    }' unless defined(&COV_CMP_GET_SIZE);
    if(defined(&_KERNEL)) {
    }
}
1;

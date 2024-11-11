require '_h2ph_pre.ph';

no warnings qw(redefine misc);

unless(defined(&_MACHINE_IN_CKSUM_H_)) {
    eval 'sub _MACHINE_IN_CKSUM_H_ () {1;}' unless defined(&_MACHINE_IN_CKSUM_H_);
    eval 'sub in_cksum {
        my($m, $len) = @_;
	    eval q( &in_cksum_skip($m, $len, 0));
    }' unless defined(&in_cksum);
    if(defined(&_KERNEL)) {
	if(defined(&IPVERSION)  && ((defined(&IPVERSION) ? &IPVERSION : undef) == 4)) {
	}
    }
}
1;

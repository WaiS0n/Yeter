require '_h2ph_pre.ph';

no warnings qw(redefine misc);

unless(defined(&_SYS_ACCT_H_)) {
    eval 'sub _SYS_ACCT_H_ () {1;}' unless defined(&_SYS_ACCT_H_);
    if(defined(&_KERNEL)) {
	eval 'sub float () { &uint32_t;}' unless defined(&float);
    } else {
	require 'sys/types.ph';
    }
    eval 'sub AC_COMM_LEN () {16;}' unless defined(&AC_COMM_LEN);
    eval 'sub AFORK () {0x1;}' unless defined(&AFORK);
    eval 'sub ASU () {0x2;}' unless defined(&ASU);
    eval 'sub ACOMPAT () {0x4;}' unless defined(&ACOMPAT);
    eval 'sub ACORE () {0x8;}' unless defined(&ACORE);
    eval 'sub AXSIG () {0x10;}' unless defined(&AXSIG);
    eval 'sub ANVER () {0x20;}' unless defined(&ANVER);
    eval 'sub ac_flagx () { ($ac_trailer->{ac_flag});}' unless defined(&ac_flagx);
    eval 'sub AHZV1 () {64;}' unless defined(&AHZV1);
    if(defined(&_KERNEL)) {
	undef(&float) if defined(&float);
    }
}
1;

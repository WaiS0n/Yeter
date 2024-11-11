require '_h2ph_pre.ph';

no warnings qw(redefine misc);

unless(defined(&_SYS_TURNSTILE_H_)) {
    eval 'sub _SYS_TURNSTILE_H_ () {1;}' unless defined(&_SYS_TURNSTILE_H_);
    if(defined(&_KERNEL)) {
	eval 'sub TS_EXCLUSIVE_QUEUE () {0;}' unless defined(&TS_EXCLUSIVE_QUEUE);
	eval 'sub TS_SHARED_QUEUE () {1;}' unless defined(&TS_SHARED_QUEUE);
    }
}
1;

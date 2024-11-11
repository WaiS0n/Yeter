require '_h2ph_pre.ph';

no warnings qw(redefine misc);

unless(defined(&__SCHED_H__)) {
    eval 'sub __SCHED_H__ () {1;}' unless defined(&__SCHED_H__);
    require 'sys/cdefs.ph';
    require 'sys/types.ph';
    require 'sys/sched.ph';
    if((defined(&__BSD_VISIBLE) ? &__BSD_VISIBLE : undef)) {
	require 'sys/cpuset.ph';
    }
    if((defined(&__BSD_VISIBLE) ? &__BSD_VISIBLE : undef)) {
    }
}
1;

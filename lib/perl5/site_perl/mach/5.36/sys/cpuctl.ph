require '_h2ph_pre.ph';

no warnings qw(redefine misc);

unless(defined(&_CPUCTL_H_)) {
    eval 'sub _CPUCTL_H_ () {1;}' unless defined(&_CPUCTL_H_);
    eval 'sub CPUCTL_RDMSR () { &_IOWR(ord(\'c\'), 1,  &cpuctl_msr_args_t);}' unless defined(&CPUCTL_RDMSR);
    eval 'sub CPUCTL_WRMSR () { &_IOWR(ord(\'c\'), 2,  &cpuctl_msr_args_t);}' unless defined(&CPUCTL_WRMSR);
    eval 'sub CPUCTL_CPUID () { &_IOWR(ord(\'c\'), 3,  &cpuctl_cpuid_args_t);}' unless defined(&CPUCTL_CPUID);
    eval 'sub CPUCTL_UPDATE () { &_IOWR(ord(\'c\'), 4,  &cpuctl_update_args_t);}' unless defined(&CPUCTL_UPDATE);
    eval 'sub CPUCTL_MSRSBIT () { &_IOWR(ord(\'c\'), 5,  &cpuctl_msr_args_t);}' unless defined(&CPUCTL_MSRSBIT);
    eval 'sub CPUCTL_MSRCBIT () { &_IOWR(ord(\'c\'), 6,  &cpuctl_msr_args_t);}' unless defined(&CPUCTL_MSRCBIT);
    eval 'sub CPUCTL_CPUID_COUNT () { &_IOWR(ord(\'c\'), 7,  &cpuctl_cpuid_count_args_t);}' unless defined(&CPUCTL_CPUID_COUNT);
    eval 'sub CPUCTL_EVAL_CPU_FEATURES () { &_IO(ord(\'c\'), 8);}' unless defined(&CPUCTL_EVAL_CPU_FEATURES);
}
1;

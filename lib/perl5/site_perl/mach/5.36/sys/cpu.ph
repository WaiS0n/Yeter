require '_h2ph_pre.ph';

no warnings qw(redefine misc);

unless(defined(&_SYS_CPU_H_)) {
    eval 'sub _SYS_CPU_H_ () {1;}' unless defined(&_SYS_CPU_H_);
    require 'sys/_eventhandler.ph';
    eval 'sub CPU_IVAR_PCPU () {1;}' unless defined(&CPU_IVAR_PCPU);
    eval 'sub CPU_IVAR_NOMINAL_MHZ () {2;}' unless defined(&CPU_IVAR_NOMINAL_MHZ);
    eval 'sub CPU_IVAR_CPUID_SIZE () {3;}' unless defined(&CPU_IVAR_CPUID_SIZE);
    eval 'sub CPU_IVAR_CPUID () {4;}' unless defined(&CPU_IVAR_CPUID);
    eval 'sub pcpu () {
        eval q(* &cpu_get_pcpu( &device_t  &dev) {  &uintptr_t  &v = 0;  &BUS_READ_IVAR( &device_get_parent( &dev),  &dev,  &CPU_IVAR_PCPU,  &v); ( &v); });
    }' unless defined(&pcpu);
    eval 'sub cpu_get_nominal_mhz {
        my($dev) = @_;
	    eval q({  &uintptr_t  &v = 0;  &if ( &BUS_READ_IVAR( &device_get_parent($dev), $dev,  &CPU_IVAR_NOMINAL_MHZ,  &v) != 0) (-1); (( &int32_t) &v); });
    }' unless defined(&cpu_get_nominal_mhz);
    eval 'sub uint32_t () {
        eval q(* &cpu_get_cpuid( &device_t  &dev, \'size_t\' * &count) {  &uintptr_t  &v = 0;  &if ( &BUS_READ_IVAR( &device_get_parent,  &dev,  &CPU_IVAR_CPUID_SIZE,  &v) != 0) ; * &count =  &v;  &if ( &BUS_READ_IVAR( &device_get_parent( &dev),  &dev,  &CPU_IVAR_CPUID,  &v) != 0) ( &NULL); (( &const  &uint32_t *) &v); });
    }' unless defined(&uint32_t);
    eval 'sub MAX_SETTINGS () {256;}' unless defined(&MAX_SETTINGS);
    eval 'sub CPUFREQ_VAL_UNKNOWN () {(-1);}' unless defined(&CPUFREQ_VAL_UNKNOWN);
    eval 'sub CPUFREQ_TYPE_MASK () {0xffff;}' unless defined(&CPUFREQ_TYPE_MASK);
    eval 'sub CPUFREQ_TYPE_RELATIVE () {(1<<0);}' unless defined(&CPUFREQ_TYPE_RELATIVE);
    eval 'sub CPUFREQ_TYPE_ABSOLUTE () {(1<<1);}' unless defined(&CPUFREQ_TYPE_ABSOLUTE);
    eval 'sub CPUFREQ_FLAG_INFO_ONLY () {(1<<16);}' unless defined(&CPUFREQ_FLAG_INFO_ONLY);
    eval 'sub CPUFREQ_FLAG_UNCACHED () {(1<<17);}' unless defined(&CPUFREQ_FLAG_UNCACHED);
    eval 'sub CPUFREQ_PRIO_HIGHEST () {1000000;}' unless defined(&CPUFREQ_PRIO_HIGHEST);
    eval 'sub CPUFREQ_PRIO_KERN () {1000;}' unless defined(&CPUFREQ_PRIO_KERN);
    eval 'sub CPUFREQ_PRIO_USER () {100;}' unless defined(&CPUFREQ_PRIO_USER);
    eval 'sub CPUFREQ_PRIO_LOWEST () {0;}' unless defined(&CPUFREQ_PRIO_LOWEST);
    eval 'sub CPUFREQ_CMP {
        my($x, $y) = @_;
	    eval q(( &abs(($x) - ($y)) < 25));
    }' unless defined(&CPUFREQ_CMP);
}
1;

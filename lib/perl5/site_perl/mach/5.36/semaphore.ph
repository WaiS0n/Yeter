require '_h2ph_pre.ph';

no warnings qw(redefine misc);

unless(defined(&_SEMAPHORE_H_)) {
    eval 'sub _SEMAPHORE_H_ () {1;}' unless defined(&_SEMAPHORE_H_);
    require 'sys/cdefs.ph';
    require 'sys/_types.ph';
    require 'sys/_umtx.ph';
    require 'machine/_limits.ph';
    eval 'sub SEM_FAILED () {(( &sem_t *)0);}' unless defined(&SEM_FAILED);
    eval 'sub SEM_VALUE_MAX () { &__INT_MAX;}' unless defined(&SEM_VALUE_MAX);
    if((defined(&__BSD_VISIBLE) ? &__BSD_VISIBLE : undef)) {
    }
}
1;

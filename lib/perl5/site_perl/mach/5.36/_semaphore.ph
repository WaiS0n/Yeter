require '_h2ph_pre.ph';

no warnings qw(redefine misc);

unless(defined(&__SEMAPHORE_H_)) {
    eval 'sub __SEMAPHORE_H_ () {1;}' unless defined(&__SEMAPHORE_H_);
    eval 'sub SEM_VALUE_MAX () { &__INT_MAX;}' unless defined(&SEM_VALUE_MAX);
    unless(defined(&_KERNEL)) {
    }
}
1;

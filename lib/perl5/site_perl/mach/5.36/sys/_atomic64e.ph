require '_h2ph_pre.ph';

no warnings qw(redefine misc);

unless(defined(&_SYS_ATOMIC64E_H_)) {
    eval 'sub _SYS_ATOMIC64E_H_ () {1;}' unless defined(&_SYS_ATOMIC64E_H_);
    unless(defined(&_MACHINE_ATOMIC_H_)) {
	die("This should not be included directly.  Include <machine/atomic.h>");
    }
    if(defined(&_KERNEL)) {
	eval 'sub HAS_EMULATED_ATOMIC64 () {1;}' unless defined(&HAS_EMULATED_ATOMIC64);
	eval 'sub atomic_add_acq_64 () { &atomic_add_64;}' unless defined(&atomic_add_acq_64);
	eval 'sub atomic_add_rel_64 () { &atomic_add_64;}' unless defined(&atomic_add_rel_64);
	eval 'sub atomic_cmpset_acq_64 () { &atomic_cmpset_64;}' unless defined(&atomic_cmpset_acq_64);
	eval 'sub atomic_cmpset_rel_64 () { &atomic_cmpset_64;}' unless defined(&atomic_cmpset_rel_64);
	eval 'sub atomic_clear_acq_64 () { &atomic_clear_64;}' unless defined(&atomic_clear_acq_64);
	eval 'sub atomic_clear_rel_64 () { &atomic_clear_64;}' unless defined(&atomic_clear_rel_64);
	eval 'sub atomic_fcmpset_acq_64 () { &atomic_fcmpset_64;}' unless defined(&atomic_fcmpset_acq_64);
	eval 'sub atomic_fcmpset_rel_64 () { &atomic_fcmpset_64;}' unless defined(&atomic_fcmpset_rel_64);
	eval 'sub atomic_load_acq_64 () { &atomic_load_64;}' unless defined(&atomic_load_acq_64);
	eval 'sub atomic_set_acq_64 () { &atomic_set_64;}' unless defined(&atomic_set_acq_64);
	eval 'sub atomic_set_rel_64 () { &atomic_set_64;}' unless defined(&atomic_set_rel_64);
	eval 'sub atomic_subtract_acq_64 () { &atomic_subtract_64;}' unless defined(&atomic_subtract_acq_64);
	eval 'sub atomic_subtract_rel_64 () { &atomic_subtract_64;}' unless defined(&atomic_subtract_rel_64);
	eval 'sub atomic_store_rel_64 () { &atomic_store_64;}' unless defined(&atomic_store_rel_64);
    }
}
1;

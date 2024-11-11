require '_h2ph_pre.ph';

no warnings qw(redefine misc);

unless(defined(&_SYS__RMLOCK_H_)) {
    eval 'sub _SYS__RMLOCK_H_ () {1;}' unless defined(&_SYS__RMLOCK_H_);
    eval 'sub rm_wlock_object () { ($_rm_lock->{_rm_wlock_object});}' unless defined(&rm_wlock_object);
    eval 'sub rm_lock_mtx () { ($_rm_lock->{_rm_lock_mtx});}' unless defined(&rm_lock_mtx);
    eval 'sub rm_lock_sx () { ($_rm_lock->{_rm_lock_sx});}' unless defined(&rm_lock_sx);
    require 'sys/_mutex.ph';
}
1;

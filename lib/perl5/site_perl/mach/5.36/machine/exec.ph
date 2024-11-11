require '_h2ph_pre.ph';

no warnings qw(redefine misc);

unless(defined(&_MACHINE_EXEC_H_)) {
    eval 'sub _MACHINE_EXEC_H_ () {1;}' unless defined(&_MACHINE_EXEC_H_);
    eval 'sub __LDPGSZ () {4096;}' unless defined(&__LDPGSZ);
}
1;

require '_h2ph_pre.ph';

no warnings qw(redefine misc);

unless(defined(&_SYS_PROCFS_H_)) {
    eval 'sub _SYS_PROCFS_H_ () {1;}' unless defined(&_SYS_PROCFS_H_);
    require 'sys/param.ph';
    require 'machine/reg.ph';
    eval 'sub PRSTATUS_VERSION () {1;}' unless defined(&PRSTATUS_VERSION);
    eval 'sub PRFNAMESZ () {16;}' unless defined(&PRFNAMESZ);
    eval 'sub PRARGSZ () {80;}' unless defined(&PRARGSZ);
    eval 'sub PRPSINFO_VERSION () {1;}' unless defined(&PRPSINFO_VERSION);
    if(defined(&__HAVE_REG32)) {
    }
}
1;

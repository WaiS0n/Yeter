require '_h2ph_pre.ph';

no warnings qw(redefine misc);

unless(defined(&_SYS_KENV_H_)) {
    eval 'sub _SYS_KENV_H_ () {1;}' unless defined(&_SYS_KENV_H_);
    eval 'sub KENV_GET () {0;}' unless defined(&KENV_GET);
    eval 'sub KENV_SET () {1;}' unless defined(&KENV_SET);
    eval 'sub KENV_UNSET () {2;}' unless defined(&KENV_UNSET);
    eval 'sub KENV_DUMP () {3;}' unless defined(&KENV_DUMP);
    eval 'sub KENV_DUMP_LOADER () {4;}' unless defined(&KENV_DUMP_LOADER);
    eval 'sub KENV_DUMP_STATIC () {5;}' unless defined(&KENV_DUMP_STATIC);
    eval 'sub KENV_MNAMELEN () {128;}' unless defined(&KENV_MNAMELEN);
    eval 'sub KENV_MVALLEN () {128;}' unless defined(&KENV_MVALLEN);
    if(defined(&_KERNEL)) {
    }
}
1;

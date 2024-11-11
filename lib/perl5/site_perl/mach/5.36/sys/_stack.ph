require '_h2ph_pre.ph';

no warnings qw(redefine misc);

unless(defined(&_SYS__STACK_H_)) {
    eval 'sub _SYS__STACK_H_ () {1;}' unless defined(&_SYS__STACK_H_);
    eval 'sub STACK_MAX () {18;}' unless defined(&STACK_MAX);
}
1;

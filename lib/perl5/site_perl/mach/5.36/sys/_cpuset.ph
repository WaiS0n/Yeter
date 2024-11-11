require '_h2ph_pre.ph';

no warnings qw(redefine misc);

unless(defined(&_SYS__CPUSET_H_)) {
    eval 'sub _SYS__CPUSET_H_ () {1;}' unless defined(&_SYS__CPUSET_H_);
    require 'sys/_bitset.ph';
    if(defined(&_KERNEL)) {
	eval 'sub CPU_SETSIZE () { &MAXCPU;}' unless defined(&CPU_SETSIZE);
    }
    eval 'sub CPU_MAXSIZE () {1024;}' unless defined(&CPU_MAXSIZE);
    unless(defined(&CPU_SETSIZE)) {
	eval 'sub CPU_SETSIZE () { &CPU_MAXSIZE;}' unless defined(&CPU_SETSIZE);
    }
    unless(defined(&_KERNEL)) {
    }
}
1;

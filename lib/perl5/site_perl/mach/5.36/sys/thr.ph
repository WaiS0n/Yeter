require '_h2ph_pre.ph';

no warnings qw(redefine misc);

unless(defined(&_SYS_THR_H_)) {
    eval 'sub _SYS_THR_H_ () {1;}' unless defined(&_SYS_THR_H_);
    require 'sys/cdefs.ph';
    require 'sys/_types.ph';
    require 'sys/sched.ph';
    unless(defined(&_SIZE_T_DECLARED)) {
	eval 'sub _SIZE_T_DECLARED () {1;}' unless defined(&_SIZE_T_DECLARED);
    }
    eval 'sub THR_SUSPENDED () {0x1;}' unless defined(&THR_SUSPENDED);
    eval 'sub THR_SYSTEM_SCOPE () {0x2;}' unless defined(&THR_SYSTEM_SCOPE);
    unless(defined(&_KERNEL)) {
	require 'sys/ucontext.ph';
	unless(defined(&_PID_T_DECLARED)) {
	    eval 'sub _PID_T_DECLARED () {1;}' unless defined(&_PID_T_DECLARED);
	}
    }
}
1;

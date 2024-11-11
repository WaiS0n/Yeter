require '_h2ph_pre.ph';

no warnings qw(redefine misc);

unless(defined(&_SYS_EVENTVAR_H_)) {
    eval 'sub _SYS_EVENTVAR_H_ () {1;}' unless defined(&_SYS_EVENTVAR_H_);
    unless(defined(&_KERNEL)) {
	die("no user-serviceable parts inside");
    }
    require 'sys/_task.ph';
    eval 'sub KQ_NEVENTS () {8;}' unless defined(&KQ_NEVENTS);
    eval 'sub KQEXTENT () {256;}' unless defined(&KQEXTENT);
    eval 'sub KQ_SEL () {0x1;}' unless defined(&KQ_SEL);
    eval 'sub KQ_SLEEP () {0x2;}' unless defined(&KQ_SLEEP);
    eval 'sub KQ_FLUXWAIT () {0x4;}' unless defined(&KQ_FLUXWAIT);
    eval 'sub KQ_ASYNC () {0x8;}' unless defined(&KQ_ASYNC);
    eval 'sub KQ_CLOSING () {0x10;}' unless defined(&KQ_CLOSING);
    eval 'sub KQ_TASKSCHED () {0x20;}' unless defined(&KQ_TASKSCHED);
    eval 'sub KQ_TASKDRAIN () {0x40;}' unless defined(&KQ_TASKDRAIN);
}
1;

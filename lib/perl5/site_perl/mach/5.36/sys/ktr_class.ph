require '_h2ph_pre.ph';

no warnings qw(redefine misc);

unless(defined(&_SYS_KTR_CLASS_H_)) {
    eval 'sub _SYS_KTR_CLASS_H_ () {1;}' unless defined(&_SYS_KTR_CLASS_H_);
    eval 'sub KTR_GEN () {0x1;}' unless defined(&KTR_GEN);
    eval 'sub KTR_NET () {0x2;}' unless defined(&KTR_NET);
    eval 'sub KTR_DEV () {0x4;}' unless defined(&KTR_DEV);
    eval 'sub KTR_LOCK () {0x8;}' unless defined(&KTR_LOCK);
    eval 'sub KTR_SMP () {0x10;}' unless defined(&KTR_SMP);
    eval 'sub KTR_SUBSYS () {0x20;}' unless defined(&KTR_SUBSYS);
    eval 'sub KTR_PMAP () {0x40;}' unless defined(&KTR_PMAP);
    eval 'sub KTR_MALLOC () {0x80;}' unless defined(&KTR_MALLOC);
    eval 'sub KTR_TRAP () {0x100;}' unless defined(&KTR_TRAP);
    eval 'sub KTR_INTR () {0x200;}' unless defined(&KTR_INTR);
    eval 'sub KTR_SIG () {0x400;}' unless defined(&KTR_SIG);
    eval 'sub KTR_SPARE2 () {0x800;}' unless defined(&KTR_SPARE2);
    eval 'sub KTR_PROC () {0x1000;}' unless defined(&KTR_PROC);
    eval 'sub KTR_SYSC () {0x2000;}' unless defined(&KTR_SYSC);
    eval 'sub KTR_INIT () {0x4000;}' unless defined(&KTR_INIT);
    eval 'sub KTR_SPARE3 () {0x8000;}' unless defined(&KTR_SPARE3);
    eval 'sub KTR_SPARE4 () {0x10000;}' unless defined(&KTR_SPARE4);
    eval 'sub KTR_EVH () {0x20000;}' unless defined(&KTR_EVH);
    eval 'sub KTR_VFS () {0x40000;}' unless defined(&KTR_VFS);
    eval 'sub KTR_VOP () {0x80000;}' unless defined(&KTR_VOP);
    eval 'sub KTR_VM () {0x100000;}' unless defined(&KTR_VM);
    eval 'sub KTR_INET () {0x200000;}' unless defined(&KTR_INET);
    eval 'sub KTR_RUNQ () {0x400000;}' unless defined(&KTR_RUNQ);
    eval 'sub KTR_SPARE5 () {0x800000;}' unless defined(&KTR_SPARE5);
    eval 'sub KTR_UMA () {0x1000000;}' unless defined(&KTR_UMA);
    eval 'sub KTR_CALLOUT () {0x2000000;}' unless defined(&KTR_CALLOUT);
    eval 'sub KTR_GEOM () {0x4000000;}' unless defined(&KTR_GEOM);
    eval 'sub KTR_BUSDMA () {0x8000000;}' unless defined(&KTR_BUSDMA);
    eval 'sub KTR_INET6 () {0x10000000;}' unless defined(&KTR_INET6);
    eval 'sub KTR_SCHED () {0x20000000;}' unless defined(&KTR_SCHED);
    eval 'sub KTR_BUF () {0x40000000;}' unless defined(&KTR_BUF);
    eval 'sub KTR_PTRACE () {0x80000000;}' unless defined(&KTR_PTRACE);
    eval 'sub KTR_ALL () {0xffffffff;}' unless defined(&KTR_ALL);
    if(defined(&KTR)) {
	unless(defined(&KTR_COMPILE)) {
	    eval 'sub KTR_COMPILE () {( &KTR_ALL);}' unless defined(&KTR_COMPILE);
	}
    } else {
	undef(&KTR_COMPILE) if defined(&KTR_COMPILE);
	eval 'sub KTR_COMPILE () {0;}' unless defined(&KTR_COMPILE);
    }
}
1;

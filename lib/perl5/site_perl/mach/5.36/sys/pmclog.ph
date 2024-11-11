require '_h2ph_pre.ph';

no warnings qw(redefine misc);

unless(defined(&_SYS_PMCLOG_H_)) {
    eval 'sub _SYS_PMCLOG_H_ () {1;}' unless defined(&_SYS_PMCLOG_H_);
    require 'sys/pmc.ph';
    eval("sub PMCLOG_TYPE_CLOSELOG () { 1; }") unless defined(&PMCLOG_TYPE_CLOSELOG);
    eval("sub PMCLOG_TYPE_DROPNOTIFY () { 2; }") unless defined(&PMCLOG_TYPE_DROPNOTIFY);
    eval("sub PMCLOG_TYPE_INITIALIZE () { 3; }") unless defined(&PMCLOG_TYPE_INITIALIZE);
    eval("sub PMCLOG_TYPE_PMCALLOCATE () { 5; }") unless defined(&PMCLOG_TYPE_PMCALLOCATE);
    eval("sub PMCLOG_TYPE_PMCATTACH () { 6; }") unless defined(&PMCLOG_TYPE_PMCATTACH);
    eval("sub PMCLOG_TYPE_PMCDETACH () { 7; }") unless defined(&PMCLOG_TYPE_PMCDETACH);
    eval("sub PMCLOG_TYPE_PROCCSW () { 8; }") unless defined(&PMCLOG_TYPE_PROCCSW);
    eval("sub PMCLOG_TYPE_PROCEXEC () { 9; }") unless defined(&PMCLOG_TYPE_PROCEXEC);
    eval("sub PMCLOG_TYPE_PROCEXIT () { 10; }") unless defined(&PMCLOG_TYPE_PROCEXIT);
    eval("sub PMCLOG_TYPE_PROCFORK () { 11; }") unless defined(&PMCLOG_TYPE_PROCFORK);
    eval("sub PMCLOG_TYPE_SYSEXIT () { 12; }") unless defined(&PMCLOG_TYPE_SYSEXIT);
    eval("sub PMCLOG_TYPE_USERDATA () { 13; }") unless defined(&PMCLOG_TYPE_USERDATA);
    eval("sub PMCLOG_TYPE_MAP_IN () { 14; }") unless defined(&PMCLOG_TYPE_MAP_IN);
    eval("sub PMCLOG_TYPE_MAP_OUT () { 15; }") unless defined(&PMCLOG_TYPE_MAP_OUT);
    eval("sub PMCLOG_TYPE_CALLCHAIN () { 16; }") unless defined(&PMCLOG_TYPE_CALLCHAIN);
    eval("sub PMCLOG_TYPE_PMCALLOCATEDYN () { 17; }") unless defined(&PMCLOG_TYPE_PMCALLOCATEDYN);
    eval("sub PMCLOG_TYPE_THR_CREATE () { 18; }") unless defined(&PMCLOG_TYPE_THR_CREATE);
    eval("sub PMCLOG_TYPE_THR_EXIT () { 19; }") unless defined(&PMCLOG_TYPE_THR_EXIT);
    eval("sub PMCLOG_TYPE_PROC_CREATE () { 20; }") unless defined(&PMCLOG_TYPE_PROC_CREATE);
    eval 'sub PMCLOG_ENTRY_HEADER () { &uint32_t  &pl_header;  &uint32_t  &pl_spare;  &uint64_t  &pl_tsc;;}' unless defined(&PMCLOG_ENTRY_HEADER);
    eval 'sub PMC_CALLCHAIN_CPUFLAGS_TO_CPU {
        my($CF) = @_;
	    eval q(((($CF) >> 16) & 0xffff));
    }' unless defined(&PMC_CALLCHAIN_CPUFLAGS_TO_CPU);
    eval 'sub PMC_CALLCHAIN_CPUFLAGS_TO_USERMODE {
        my($CF) = @_;
	    eval q((($CF) &  &PMC_CC_F_USERSPACE));
    }' unless defined(&PMC_CALLCHAIN_CPUFLAGS_TO_USERMODE);
    eval 'sub PMC_CALLCHAIN_TO_CPUFLAGS {
        my($CPU,$FLAGS) = @_;
	    eval q(((($CPU) << 16) | (($FLAGS) & 0xffff)));
    }' unless defined(&PMC_CALLCHAIN_TO_CPUFLAGS);
    eval 'sub PMCLOG_HEADER_MAGIC () {0xee;}' unless defined(&PMCLOG_HEADER_MAGIC);
    eval 'sub PMCLOG_HEADER_TO_LENGTH {
        my($H) = @_;
	    eval q((($H) & 0xffff));
    }' unless defined(&PMCLOG_HEADER_TO_LENGTH);
    eval 'sub PMCLOG_HEADER_TO_TYPE {
        my($H) = @_;
	    eval q(((($H) & 0xff0000) >> 16));
    }' unless defined(&PMCLOG_HEADER_TO_TYPE);
    eval 'sub PMCLOG_HEADER_TO_MAGIC {
        my($H) = @_;
	    eval q(((($H) & 0xff000000) >> 24));
    }' unless defined(&PMCLOG_HEADER_TO_MAGIC);
    eval 'sub PMCLOG_HEADER_CHECK_MAGIC {
        my($H) = @_;
	    eval q(( &PMCLOG_HEADER_TO_MAGIC($H) ==  &PMCLOG_HEADER_MAGIC));
    }' unless defined(&PMCLOG_HEADER_CHECK_MAGIC);
    if(defined(&_KERNEL)) {
    }
}
1;

require '_h2ph_pre.ph';

no warnings qw(redefine misc);

unless(defined(&_MACHINE_DB_MACHDEP_H_)) {
    eval 'sub _MACHINE_DB_MACHDEP_H_ () {1;}' unless defined(&_MACHINE_DB_MACHDEP_H_);
    require 'machine/frame.ph';
    require 'machine/trap.ph';
    eval 'sub PC_REGS () {
        eval q((( &db_addr_t) ($kdb_thrctx->{pcb_rip})));
    }' unless defined(&PC_REGS);
    eval 'sub BKPT_INST () {0xcc;}' unless defined(&BKPT_INST);
    eval 'sub BKPT_SIZE () {(1);}' unless defined(&BKPT_SIZE);
    eval 'sub BKPT_SET {
        my($inst) = @_;
	    eval q(( &BKPT_INST));
    }' unless defined(&BKPT_SET);
    eval 'sub BKPT_SKIP () { &do {  ($kdb_frame->{tf_rip}) += 1;  ($kdb_thrctx->{pcb_rip}) += 1; }  &while(0);}' unless defined(&BKPT_SKIP);
    eval 'sub FIXUP_PC_AFTER_BREAK () { &do {  ($kdb_frame->{tf_rip}) -= 1;  ($kdb_thrctx->{pcb_rip}) -= 1; }  &while(0);;}' unless defined(&FIXUP_PC_AFTER_BREAK);
    eval 'sub db_clear_single_step () { &kdb_cpu_clear_singlestep;}' unless defined(&db_clear_single_step);
    eval 'sub db_set_single_step () { &kdb_cpu_set_singlestep;}' unless defined(&db_set_single_step);
    eval 'sub IS_BREAKPOINT_TRAP {
        my($type, $code) = @_;
	    eval q((($type) ==  &T_BPTFLT));
    }' unless defined(&IS_BREAKPOINT_TRAP);
    eval 'sub IS_SSTEP_TRAP {
        my($type, $code) = @_;
	    eval q((($type) ==  &T_TRCTRAP  && ($code) &  &DBREG_DR6_BS));
    }' unless defined(&IS_SSTEP_TRAP);
    eval 'sub IS_WATCHPOINT_TRAP {
        my($type, $code) = @_;
	    eval q(0);
    }' unless defined(&IS_WATCHPOINT_TRAP);
    eval 'sub I_CALL () {0xe8;}' unless defined(&I_CALL);
    eval 'sub I_CALLI () {0xff;}' unless defined(&I_CALLI);
    eval 'sub i_calli {
        my($ins) = @_;
	    eval q(((($ins)&0xff) ==  &I_CALLI  && (($ins)&0x3800) == 0x1000));
    }' unless defined(&i_calli);
    eval 'sub I_RET () {0xc3;}' unless defined(&I_RET);
    eval 'sub I_IRET () {0xcf;}' unless defined(&I_IRET);
    eval 'sub i_rex {
        my($ins) = @_;
	    eval q(((($ins) & 0xff) == 0x41 || (($ins) & 0xff) == 0x43));
    }' unless defined(&i_rex);
    eval 'sub inst_trap_return {
        my($ins) = @_;
	    eval q(((($ins)&0xff) ==  &I_IRET));
    }' unless defined(&inst_trap_return);
    eval 'sub inst_return {
        my($ins) = @_;
	    eval q(((($ins)&0xff) ==  &I_RET));
    }' unless defined(&inst_return);
    eval 'sub inst_call {
        my($ins) = @_;
	    eval q(((($ins)&0xff) ==  &I_CALL ||  &i_calli($ins) || ( &i_calli(($ins) >> 8)  &&  &i_rex($ins))));
    }' unless defined(&inst_call);
    eval 'sub inst_load {
        my($ins) = @_;
	    eval q(0);
    }' unless defined(&inst_load);
    eval 'sub inst_store {
        my($ins) = @_;
	    eval q(0);
    }' unless defined(&inst_store);
}
1;

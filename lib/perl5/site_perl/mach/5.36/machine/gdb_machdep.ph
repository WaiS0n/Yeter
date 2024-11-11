require '_h2ph_pre.ph';

no warnings qw(redefine misc);

unless(defined(&_MACHINE_GDB_MACHDEP_H_)) {
    eval 'sub _MACHINE_GDB_MACHDEP_H_ () {1;}' unless defined(&_MACHINE_GDB_MACHDEP_H_);
    eval 'sub GDB_BUFSZ () {4096;}' unless defined(&GDB_BUFSZ);
    eval 'sub GDB_NREGS () {56;}' unless defined(&GDB_NREGS);
    eval 'sub GDB_REG_RAX () {0;}' unless defined(&GDB_REG_RAX);
    eval 'sub GDB_REG_RBX () {1;}' unless defined(&GDB_REG_RBX);
    eval 'sub GDB_REG_RCX () {2;}' unless defined(&GDB_REG_RCX);
    eval 'sub GDB_REG_RDX () {3;}' unless defined(&GDB_REG_RDX);
    eval 'sub GDB_REG_RSI () {4;}' unless defined(&GDB_REG_RSI);
    eval 'sub GDB_REG_RDI () {5;}' unless defined(&GDB_REG_RDI);
    eval 'sub GDB_REG_RBP () {6;}' unless defined(&GDB_REG_RBP);
    eval 'sub GDB_REG_RSP () {7;}' unless defined(&GDB_REG_RSP);
    eval 'sub GDB_REG_R8 () {8;}' unless defined(&GDB_REG_R8);
    eval 'sub GDB_REG_R9 () {9;}' unless defined(&GDB_REG_R9);
    eval 'sub GDB_REG_R10 () {10;}' unless defined(&GDB_REG_R10);
    eval 'sub GDB_REG_R11 () {11;}' unless defined(&GDB_REG_R11);
    eval 'sub GDB_REG_R12 () {12;}' unless defined(&GDB_REG_R12);
    eval 'sub GDB_REG_R13 () {13;}' unless defined(&GDB_REG_R13);
    eval 'sub GDB_REG_R14 () {14;}' unless defined(&GDB_REG_R14);
    eval 'sub GDB_REG_R15 () {15;}' unless defined(&GDB_REG_R15);
    eval 'sub GDB_REG_PC () {16;}' unless defined(&GDB_REG_PC);
    eval 'sub GDB_REG_RFLAGS () {17;}' unless defined(&GDB_REG_RFLAGS);
    eval 'sub GDB_REG_CS () {18;}' unless defined(&GDB_REG_CS);
    eval 'sub GDB_REG_SS () {19;}' unless defined(&GDB_REG_SS);
    eval 'sub gdb_cpu_regsz {
        my($regnum) = @_;
	    eval q({ (($regnum > 16 && $regnum < 24) ? 4: 8); });
    }' unless defined(&gdb_cpu_regsz);
    eval 'sub gdb_cpu_query {
        my($void) = @_;
	    eval q({ (0); });
    }' unless defined(&gdb_cpu_query);
}
1;

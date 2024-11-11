require '_h2ph_pre.ph';

no warnings qw(redefine misc);

unless(defined(&_LIBPROC_H_)) {
    eval 'sub _LIBPROC_H_ () {1;}' unless defined(&_LIBPROC_H_);
    require 'gelf.ph';
    require 'rtld_db.ph';
    require 'limits.ph';
    eval 'sub PS_IDLE () {1;}' unless defined(&PS_IDLE);
    eval 'sub PS_STOP () {2;}' unless defined(&PS_STOP);
    eval 'sub PS_RUN () {3;}' unless defined(&PS_RUN);
    eval 'sub PS_UNDEAD () {4;}' unless defined(&PS_UNDEAD);
    eval 'sub PS_DEAD () {5;}' unless defined(&PS_DEAD);
    eval 'sub PS_LOST () {6;}' unless defined(&PS_LOST);
    eval 'sub PATTACH_FORCE () {0x1;}' unless defined(&PATTACH_FORCE);
    eval 'sub PATTACH_RDONLY () {0x2;}' unless defined(&PATTACH_RDONLY);
    eval 'sub PATTACH_NOSTOP () {0x4;}' unless defined(&PATTACH_NOSTOP);
    eval 'sub PRELEASE_HANG () {1;}' unless defined(&PRELEASE_HANG);
    eval 'sub PRELEASE_KILL () {2;}' unless defined(&PRELEASE_KILL);
    eval 'sub MA_READ () {0x1;}' unless defined(&MA_READ);
    eval 'sub MA_WRITE () {0x2;}' unless defined(&MA_WRITE);
    eval 'sub MA_EXEC () {0x4;}' unless defined(&MA_EXEC);
    eval 'sub MA_COW () {0x8;}' unless defined(&MA_COW);
    eval 'sub MA_NEEDS_COPY () {0x10;}' unless defined(&MA_NEEDS_COPY);
    eval 'sub MA_NOCOREDUMP () {0x20;}' unless defined(&MA_NOCOREDUMP);
    eval 'sub PR_SYMTAB () {1;}' unless defined(&PR_SYMTAB);
    eval 'sub PR_DYNSYM () {2;}' unless defined(&PR_DYNSYM);
    eval 'sub BIND_LOCAL () {0x1;}' unless defined(&BIND_LOCAL);
    eval 'sub BIND_GLOBAL () {0x2;}' unless defined(&BIND_GLOBAL);
    eval 'sub BIND_WEAK () {0x4;}' unless defined(&BIND_WEAK);
    eval 'sub BIND_ANY () {( &BIND_LOCAL| &BIND_GLOBAL| &BIND_WEAK);}' unless defined(&BIND_ANY);
    eval 'sub TYPE_NOTYPE () {0x100;}' unless defined(&TYPE_NOTYPE);
    eval 'sub TYPE_OBJECT () {0x200;}' unless defined(&TYPE_OBJECT);
    eval 'sub TYPE_FUNC () {0x400;}' unless defined(&TYPE_FUNC);
    eval 'sub TYPE_SECTION () {0x800;}' unless defined(&TYPE_SECTION);
    eval 'sub TYPE_FILE () {0x1000;}' unless defined(&TYPE_FILE);
    eval 'sub TYPE_ANY () {( &TYPE_NOTYPE| &TYPE_OBJECT| &TYPE_FUNC| &TYPE_SECTION|  &TYPE_FILE);}' unless defined(&TYPE_ANY);
    eval("sub REG_PC () { 0; }") unless defined(&REG_PC);
    eval("sub REG_SP () { 1; }") unless defined(&REG_SP);
    eval("sub REG_RVAL1 () { 2; }") unless defined(&REG_RVAL1);
    eval("sub REG_RVAL2 () { 3; }") unless defined(&REG_RVAL2);
    eval 'sub SIG2STR_MAX () {8;}' unless defined(&SIG2STR_MAX);
    eval 'sub PR_REQUESTED () {1;}' unless defined(&PR_REQUESTED);
    eval 'sub PR_FAULTED () {2;}' unless defined(&PR_FAULTED);
    eval 'sub PR_SYSENTRY () {3;}' unless defined(&PR_SYSENTRY);
    eval 'sub PR_SYSEXIT () {4;}' unless defined(&PR_SYSEXIT);
    eval 'sub PR_SIGNALLED () {5;}' unless defined(&PR_SIGNALLED);
    eval 'sub FLTBPT () {-1;}' unless defined(&FLTBPT);
    eval 'sub PR_MODEL_ILP32 () {1;}' unless defined(&PR_MODEL_ILP32);
    eval 'sub PR_MODEL_LP64 () {2;}' unless defined(&PR_MODEL_LP64);
    eval 'sub proc_getpid {
        my($phdl) = @_;
	    eval q(((($phdl))-> &pid));
    }' unless defined(&proc_getpid);
}
1;

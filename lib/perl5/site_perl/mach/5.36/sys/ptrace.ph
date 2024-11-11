require '_h2ph_pre.ph';

no warnings qw(redefine misc);

unless(defined(&_SYS_PTRACE_H_)) {
    eval 'sub _SYS_PTRACE_H_ () {1;}' unless defined(&_SYS_PTRACE_H_);
    require 'sys/signal.ph';
    require 'sys/param.ph';
    require 'machine/reg.ph';
    eval 'sub PT_TRACE_ME () {0;}' unless defined(&PT_TRACE_ME);
    eval 'sub PT_READ_I () {1;}' unless defined(&PT_READ_I);
    eval 'sub PT_READ_D () {2;}' unless defined(&PT_READ_D);
    eval 'sub PT_WRITE_I () {4;}' unless defined(&PT_WRITE_I);
    eval 'sub PT_WRITE_D () {5;}' unless defined(&PT_WRITE_D);
    eval 'sub PT_CONTINUE () {7;}' unless defined(&PT_CONTINUE);
    eval 'sub PT_KILL () {8;}' unless defined(&PT_KILL);
    eval 'sub PT_STEP () {9;}' unless defined(&PT_STEP);
    eval 'sub PT_ATTACH () {10;}' unless defined(&PT_ATTACH);
    eval 'sub PT_DETACH () {11;}' unless defined(&PT_DETACH);
    eval 'sub PT_IO () {12;}' unless defined(&PT_IO);
    eval 'sub PT_LWPINFO () {13;}' unless defined(&PT_LWPINFO);
    eval 'sub PT_GETNUMLWPS () {14;}' unless defined(&PT_GETNUMLWPS);
    eval 'sub PT_GETLWPLIST () {15;}' unless defined(&PT_GETLWPLIST);
    eval 'sub PT_CLEARSTEP () {16;}' unless defined(&PT_CLEARSTEP);
    eval 'sub PT_SETSTEP () {17;}' unless defined(&PT_SETSTEP);
    eval 'sub PT_SUSPEND () {18;}' unless defined(&PT_SUSPEND);
    eval 'sub PT_RESUME () {19;}' unless defined(&PT_RESUME);
    eval 'sub PT_TO_SCE () {20;}' unless defined(&PT_TO_SCE);
    eval 'sub PT_TO_SCX () {21;}' unless defined(&PT_TO_SCX);
    eval 'sub PT_SYSCALL () {22;}' unless defined(&PT_SYSCALL);
    eval 'sub PT_FOLLOW_FORK () {23;}' unless defined(&PT_FOLLOW_FORK);
    eval 'sub PT_LWP_EVENTS () {24;}' unless defined(&PT_LWP_EVENTS);
    eval 'sub PT_GET_EVENT_MASK () {25;}' unless defined(&PT_GET_EVENT_MASK);
    eval 'sub PT_SET_EVENT_MASK () {26;}' unless defined(&PT_SET_EVENT_MASK);
    eval 'sub PT_GET_SC_ARGS () {27;}' unless defined(&PT_GET_SC_ARGS);
    eval 'sub PT_GET_SC_RET () {28;}' unless defined(&PT_GET_SC_RET);
    eval 'sub PT_COREDUMP () {29;}' unless defined(&PT_COREDUMP);
    eval 'sub PT_GETREGS () {33;}' unless defined(&PT_GETREGS);
    eval 'sub PT_SETREGS () {34;}' unless defined(&PT_SETREGS);
    eval 'sub PT_GETFPREGS () {35;}' unless defined(&PT_GETFPREGS);
    eval 'sub PT_SETFPREGS () {36;}' unless defined(&PT_SETFPREGS);
    eval 'sub PT_GETDBREGS () {37;}' unless defined(&PT_GETDBREGS);
    eval 'sub PT_SETDBREGS () {38;}' unless defined(&PT_SETDBREGS);
    eval 'sub PT_VM_TIMESTAMP () {40;}' unless defined(&PT_VM_TIMESTAMP);
    eval 'sub PT_VM_ENTRY () {41;}' unless defined(&PT_VM_ENTRY);
    eval 'sub PT_GETREGSET () {42;}' unless defined(&PT_GETREGSET);
    eval 'sub PT_SETREGSET () {43;}' unless defined(&PT_SETREGSET);
    eval 'sub PT_SC_REMOTE () {44;}' unless defined(&PT_SC_REMOTE);
    eval 'sub PT_FIRSTMACH () {64;}' unless defined(&PT_FIRSTMACH);
    require 'machine/ptrace.ph';
    eval 'sub PTRACE_EXEC () {0x1;}' unless defined(&PTRACE_EXEC);
    eval 'sub PTRACE_SCE () {0x2;}' unless defined(&PTRACE_SCE);
    eval 'sub PTRACE_SCX () {0x4;}' unless defined(&PTRACE_SCX);
    eval 'sub PTRACE_SYSCALL () {( &PTRACE_SCE |  &PTRACE_SCX);}' unless defined(&PTRACE_SYSCALL);
    eval 'sub PTRACE_FORK () {0x8;}' unless defined(&PTRACE_FORK);
    eval 'sub PTRACE_LWP () {0x10;}' unless defined(&PTRACE_LWP);
    eval 'sub PTRACE_VFORK () {0x20;}' unless defined(&PTRACE_VFORK);
    eval 'sub PTRACE_DEFAULT () {( &PTRACE_EXEC);}' unless defined(&PTRACE_DEFAULT);
    eval 'sub PIOD_READ_D () {1;}' unless defined(&PIOD_READ_D);
    eval 'sub PIOD_WRITE_D () {2;}' unless defined(&PIOD_WRITE_D);
    eval 'sub PIOD_READ_I () {3;}' unless defined(&PIOD_READ_I);
    eval 'sub PIOD_WRITE_I () {4;}' unless defined(&PIOD_WRITE_I);
    eval 'sub PL_EVENT_NONE () {0;}' unless defined(&PL_EVENT_NONE);
    eval 'sub PL_EVENT_SIGNAL () {1;}' unless defined(&PL_EVENT_SIGNAL);
    eval 'sub PL_FLAG_SA () {0x1;}' unless defined(&PL_FLAG_SA);
    eval 'sub PL_FLAG_BOUND () {0x2;}' unless defined(&PL_FLAG_BOUND);
    eval 'sub PL_FLAG_SCE () {0x4;}' unless defined(&PL_FLAG_SCE);
    eval 'sub PL_FLAG_SCX () {0x8;}' unless defined(&PL_FLAG_SCX);
    eval 'sub PL_FLAG_EXEC () {0x10;}' unless defined(&PL_FLAG_EXEC);
    eval 'sub PL_FLAG_SI () {0x20;}' unless defined(&PL_FLAG_SI);
    eval 'sub PL_FLAG_FORKED () {0x40;}' unless defined(&PL_FLAG_FORKED);
    eval 'sub PL_FLAG_CHILD () {0x80;}' unless defined(&PL_FLAG_CHILD);
    eval 'sub PL_FLAG_BORN () {0x100;}' unless defined(&PL_FLAG_BORN);
    eval 'sub PL_FLAG_EXITED () {0x200;}' unless defined(&PL_FLAG_EXITED);
    eval 'sub PL_FLAG_VFORKED () {0x400;}' unless defined(&PL_FLAG_VFORKED);
    eval 'sub PL_FLAG_VFORK_DONE () {0x800;}' unless defined(&PL_FLAG_VFORK_DONE);
    if(defined(&_WANT_LWPINFO32) || (defined(&_KERNEL)  && defined(&__LP64__))) {
    }
    eval 'sub PC_COMPRESS () {0x1;}' unless defined(&PC_COMPRESS);
    eval 'sub PC_ALL () {0x2;}' unless defined(&PC_ALL);
    if(defined(&_KERNEL)) {
	require 'sys/proc.ph';
	if(defined(&__HAVE_PTRACE_MACHDEP)) {
	}
	if(defined(&COMPAT_FREEBSD32)) {
	}
    } else {
	require 'sys/cdefs.ph';
    }
}
1;

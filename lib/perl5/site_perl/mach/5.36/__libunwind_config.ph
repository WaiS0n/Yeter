require '_h2ph_pre.ph';

no warnings qw(redefine misc);

unless(defined(&____LIBUNWIND_CONFIG_H__)) {
    eval 'sub ____LIBUNWIND_CONFIG_H__ () {1;}' unless defined(&____LIBUNWIND_CONFIG_H__);
    eval 'sub _LIBUNWIND_VERSION () {15000;}' unless defined(&_LIBUNWIND_VERSION);
    if(defined(&__arm__)  && !defined(&__USING_SJLJ_EXCEPTIONS__)  && !defined(&__ARM_DWARF_EH__)  && !defined(&__SEH__)) {
	eval 'sub _LIBUNWIND_ARM_EHABI () {1;}' unless defined(&_LIBUNWIND_ARM_EHABI);
    }
    eval 'sub _LIBUNWIND_HIGHEST_DWARF_REGISTER_X86 () {8;}' unless defined(&_LIBUNWIND_HIGHEST_DWARF_REGISTER_X86);
    eval 'sub _LIBUNWIND_HIGHEST_DWARF_REGISTER_X86_64 () {32;}' unless defined(&_LIBUNWIND_HIGHEST_DWARF_REGISTER_X86_64);
    eval 'sub _LIBUNWIND_HIGHEST_DWARF_REGISTER_PPC () {112;}' unless defined(&_LIBUNWIND_HIGHEST_DWARF_REGISTER_PPC);
    eval 'sub _LIBUNWIND_HIGHEST_DWARF_REGISTER_PPC64 () {116;}' unless defined(&_LIBUNWIND_HIGHEST_DWARF_REGISTER_PPC64);
    eval 'sub _LIBUNWIND_HIGHEST_DWARF_REGISTER_ARM64 () {95;}' unless defined(&_LIBUNWIND_HIGHEST_DWARF_REGISTER_ARM64);
    eval 'sub _LIBUNWIND_HIGHEST_DWARF_REGISTER_ARM () {287;}' unless defined(&_LIBUNWIND_HIGHEST_DWARF_REGISTER_ARM);
    eval 'sub _LIBUNWIND_HIGHEST_DWARF_REGISTER_OR1K () {32;}' unless defined(&_LIBUNWIND_HIGHEST_DWARF_REGISTER_OR1K);
    eval 'sub _LIBUNWIND_HIGHEST_DWARF_REGISTER_MIPS () {65;}' unless defined(&_LIBUNWIND_HIGHEST_DWARF_REGISTER_MIPS);
    eval 'sub _LIBUNWIND_HIGHEST_DWARF_REGISTER_SPARC () {31;}' unless defined(&_LIBUNWIND_HIGHEST_DWARF_REGISTER_SPARC);
    eval 'sub _LIBUNWIND_HIGHEST_DWARF_REGISTER_SPARC64 () {31;}' unless defined(&_LIBUNWIND_HIGHEST_DWARF_REGISTER_SPARC64);
    eval 'sub _LIBUNWIND_HIGHEST_DWARF_REGISTER_HEXAGON () {34;}' unless defined(&_LIBUNWIND_HIGHEST_DWARF_REGISTER_HEXAGON);
    eval 'sub _LIBUNWIND_HIGHEST_DWARF_REGISTER_RISCV () {64;}' unless defined(&_LIBUNWIND_HIGHEST_DWARF_REGISTER_RISCV);
    eval 'sub _LIBUNWIND_HIGHEST_DWARF_REGISTER_VE () {143;}' unless defined(&_LIBUNWIND_HIGHEST_DWARF_REGISTER_VE);
    eval 'sub _LIBUNWIND_HIGHEST_DWARF_REGISTER_S390X () {83;}' unless defined(&_LIBUNWIND_HIGHEST_DWARF_REGISTER_S390X);
    eval 'sub _LIBUNWIND_HIGHEST_DWARF_REGISTER_LOONGARCH () {64;}' unless defined(&_LIBUNWIND_HIGHEST_DWARF_REGISTER_LOONGARCH);
    if(defined(&_LIBUNWIND_IS_NATIVE_ONLY)) {
	if(defined(&__linux__)) {
	    eval 'sub _LIBUNWIND_TARGET_LINUX () {1;}' unless defined(&_LIBUNWIND_TARGET_LINUX);
	}
	if(defined(&__HAIKU__)) {
	    eval 'sub _LIBUNWIND_TARGET_HAIKU () {1;}' unless defined(&_LIBUNWIND_TARGET_HAIKU);
	}
	if(defined(&__i386__)) {
	    eval 'sub _LIBUNWIND_TARGET_I386 () {1;}' unless defined(&_LIBUNWIND_TARGET_I386);
	    eval 'sub _LIBUNWIND_CONTEXT_SIZE () {8;}' unless defined(&_LIBUNWIND_CONTEXT_SIZE);
	    eval 'sub _LIBUNWIND_CURSOR_SIZE () {15;}' unless defined(&_LIBUNWIND_CURSOR_SIZE);
	    eval 'sub _LIBUNWIND_HIGHEST_DWARF_REGISTER () { &_LIBUNWIND_HIGHEST_DWARF_REGISTER_X86;}' unless defined(&_LIBUNWIND_HIGHEST_DWARF_REGISTER);
	}
 elsif(defined(&__x86_64__)) {
	    eval 'sub _LIBUNWIND_TARGET_X86_64 () {1;}' unless defined(&_LIBUNWIND_TARGET_X86_64);
	    if(defined(&_WIN64)) {
		eval 'sub _LIBUNWIND_CONTEXT_SIZE () {54;}' unless defined(&_LIBUNWIND_CONTEXT_SIZE);
		if(defined(&__SEH__)) {
		    eval 'sub _LIBUNWIND_CURSOR_SIZE () {204;}' unless defined(&_LIBUNWIND_CURSOR_SIZE);
		} else {
		    eval 'sub _LIBUNWIND_CURSOR_SIZE () {66;}' unless defined(&_LIBUNWIND_CURSOR_SIZE);
		}
	    } else {
		eval 'sub _LIBUNWIND_CONTEXT_SIZE () {21;}' unless defined(&_LIBUNWIND_CONTEXT_SIZE);
		eval 'sub _LIBUNWIND_CURSOR_SIZE () {33;}' unless defined(&_LIBUNWIND_CURSOR_SIZE);
	    }
	    eval 'sub _LIBUNWIND_HIGHEST_DWARF_REGISTER () { &_LIBUNWIND_HIGHEST_DWARF_REGISTER_X86_64;}' unless defined(&_LIBUNWIND_HIGHEST_DWARF_REGISTER);
	}
 elsif(defined(&__powerpc64__)) {
	    eval 'sub _LIBUNWIND_TARGET_PPC64 () {1;}' unless defined(&_LIBUNWIND_TARGET_PPC64);
	    eval 'sub _LIBUNWIND_CONTEXT_SIZE () {167;}' unless defined(&_LIBUNWIND_CONTEXT_SIZE);
	    eval 'sub _LIBUNWIND_CURSOR_SIZE () {179;}' unless defined(&_LIBUNWIND_CURSOR_SIZE);
	    eval 'sub _LIBUNWIND_HIGHEST_DWARF_REGISTER () { &_LIBUNWIND_HIGHEST_DWARF_REGISTER_PPC64;}' unless defined(&_LIBUNWIND_HIGHEST_DWARF_REGISTER);
	}
 elsif(defined(&__powerpc__)) {
	    eval 'sub _LIBUNWIND_TARGET_PPC () {1;}' unless defined(&_LIBUNWIND_TARGET_PPC);
	    eval 'sub _LIBUNWIND_CONTEXT_SIZE () {117;}' unless defined(&_LIBUNWIND_CONTEXT_SIZE);
	    eval 'sub _LIBUNWIND_CURSOR_SIZE () {124;}' unless defined(&_LIBUNWIND_CURSOR_SIZE);
	    eval 'sub _LIBUNWIND_HIGHEST_DWARF_REGISTER () { &_LIBUNWIND_HIGHEST_DWARF_REGISTER_PPC;}' unless defined(&_LIBUNWIND_HIGHEST_DWARF_REGISTER);
	}
 elsif(defined(&__aarch64__)) {
	    eval 'sub _LIBUNWIND_TARGET_AARCH64 () {1;}' unless defined(&_LIBUNWIND_TARGET_AARCH64);
	    eval 'sub _LIBUNWIND_CONTEXT_SIZE () {66;}' unless defined(&_LIBUNWIND_CONTEXT_SIZE);
	    if(defined(&__SEH__)) {
		eval 'sub _LIBUNWIND_CURSOR_SIZE () {164;}' unless defined(&_LIBUNWIND_CURSOR_SIZE);
	    } else {
		eval 'sub _LIBUNWIND_CURSOR_SIZE () {78;}' unless defined(&_LIBUNWIND_CURSOR_SIZE);
	    }
	    eval 'sub _LIBUNWIND_HIGHEST_DWARF_REGISTER () { &_LIBUNWIND_HIGHEST_DWARF_REGISTER_ARM64;}' unless defined(&_LIBUNWIND_HIGHEST_DWARF_REGISTER);
	}
 elsif(defined(&__arm__)) {
	    eval 'sub _LIBUNWIND_TARGET_ARM () {1;}' unless defined(&_LIBUNWIND_TARGET_ARM);
	    if(defined(&__SEH__)) {
		eval 'sub _LIBUNWIND_CONTEXT_SIZE () {42;}' unless defined(&_LIBUNWIND_CONTEXT_SIZE);
		eval 'sub _LIBUNWIND_CURSOR_SIZE () {80;}' unless defined(&_LIBUNWIND_CURSOR_SIZE);
	    }
 elsif(defined(&__ARM_WMMX)) {
		eval 'sub _LIBUNWIND_CONTEXT_SIZE () {61;}' unless defined(&_LIBUNWIND_CONTEXT_SIZE);
		eval 'sub _LIBUNWIND_CURSOR_SIZE () {68;}' unless defined(&_LIBUNWIND_CURSOR_SIZE);
	    } else {
		eval 'sub _LIBUNWIND_CONTEXT_SIZE () {42;}' unless defined(&_LIBUNWIND_CONTEXT_SIZE);
		eval 'sub _LIBUNWIND_CURSOR_SIZE () {49;}' unless defined(&_LIBUNWIND_CURSOR_SIZE);
	    }
	    eval 'sub _LIBUNWIND_HIGHEST_DWARF_REGISTER () { &_LIBUNWIND_HIGHEST_DWARF_REGISTER_ARM;}' unless defined(&_LIBUNWIND_HIGHEST_DWARF_REGISTER);
	}
 elsif(defined(&__or1k__)) {
	    eval 'sub _LIBUNWIND_TARGET_OR1K () {1;}' unless defined(&_LIBUNWIND_TARGET_OR1K);
	    eval 'sub _LIBUNWIND_CONTEXT_SIZE () {16;}' unless defined(&_LIBUNWIND_CONTEXT_SIZE);
	    eval 'sub _LIBUNWIND_CURSOR_SIZE () {24;}' unless defined(&_LIBUNWIND_CURSOR_SIZE);
	    eval 'sub _LIBUNWIND_HIGHEST_DWARF_REGISTER () { &_LIBUNWIND_HIGHEST_DWARF_REGISTER_OR1K;}' unless defined(&_LIBUNWIND_HIGHEST_DWARF_REGISTER);
	}
 elsif(defined(&__hexagon__)) {
	    eval 'sub _LIBUNWIND_TARGET_HEXAGON () {1;}' unless defined(&_LIBUNWIND_TARGET_HEXAGON);
	    eval 'sub _LIBUNWIND_CONTEXT_SIZE () {18;}' unless defined(&_LIBUNWIND_CONTEXT_SIZE);
	    eval 'sub _LIBUNWIND_CURSOR_SIZE () {24;}' unless defined(&_LIBUNWIND_CURSOR_SIZE);
	    eval 'sub _LIBUNWIND_HIGHEST_DWARF_REGISTER () { &_LIBUNWIND_HIGHEST_DWARF_REGISTER_HEXAGON;}' unless defined(&_LIBUNWIND_HIGHEST_DWARF_REGISTER);
	}
 elsif(defined(&__mips__)) {
	    if(defined(&_ABIO32)  && (defined(&_MIPS_SIM) ? &_MIPS_SIM : undef) == (defined(&_ABIO32) ? &_ABIO32 : undef)) {
		eval 'sub _LIBUNWIND_TARGET_MIPS_O32 () {1;}' unless defined(&_LIBUNWIND_TARGET_MIPS_O32);
		if(defined(&__mips_hard_float)) {
		    eval 'sub _LIBUNWIND_CONTEXT_SIZE () {50;}' unless defined(&_LIBUNWIND_CONTEXT_SIZE);
		    eval 'sub _LIBUNWIND_CURSOR_SIZE () {57;}' unless defined(&_LIBUNWIND_CURSOR_SIZE);
		} else {
		    eval 'sub _LIBUNWIND_CONTEXT_SIZE () {18;}' unless defined(&_LIBUNWIND_CONTEXT_SIZE);
		    eval 'sub _LIBUNWIND_CURSOR_SIZE () {24;}' unless defined(&_LIBUNWIND_CURSOR_SIZE);
		}
	    }
 elsif(defined(&_ABIN32)  && (defined(&_MIPS_SIM) ? &_MIPS_SIM : undef) == (defined(&_ABIN32) ? &_ABIN32 : undef)) {
		eval 'sub _LIBUNWIND_TARGET_MIPS_NEWABI () {1;}' unless defined(&_LIBUNWIND_TARGET_MIPS_NEWABI);
		if(defined(&__mips_hard_float)) {
		    eval 'sub _LIBUNWIND_CONTEXT_SIZE () {67;}' unless defined(&_LIBUNWIND_CONTEXT_SIZE);
		    eval 'sub _LIBUNWIND_CURSOR_SIZE () {74;}' unless defined(&_LIBUNWIND_CURSOR_SIZE);
		} else {
		    eval 'sub _LIBUNWIND_CONTEXT_SIZE () {35;}' unless defined(&_LIBUNWIND_CONTEXT_SIZE);
		    eval 'sub _LIBUNWIND_CURSOR_SIZE () {42;}' unless defined(&_LIBUNWIND_CURSOR_SIZE);
		}
	    }
 elsif(defined(&_ABI64)  && (defined(&_MIPS_SIM) ? &_MIPS_SIM : undef) == (defined(&_ABI64) ? &_ABI64 : undef)) {
		eval 'sub _LIBUNWIND_TARGET_MIPS_NEWABI () {1;}' unless defined(&_LIBUNWIND_TARGET_MIPS_NEWABI);
		if(defined(&__mips_hard_float)) {
		    eval 'sub _LIBUNWIND_CONTEXT_SIZE () {67;}' unless defined(&_LIBUNWIND_CONTEXT_SIZE);
		    eval 'sub _LIBUNWIND_CURSOR_SIZE () {79;}' unless defined(&_LIBUNWIND_CURSOR_SIZE);
		} else {
		    eval 'sub _LIBUNWIND_CONTEXT_SIZE () {35;}' unless defined(&_LIBUNWIND_CONTEXT_SIZE);
		    eval 'sub _LIBUNWIND_CURSOR_SIZE () {47;}' unless defined(&_LIBUNWIND_CURSOR_SIZE);
		}
	    } else {
		die("Unsupported MIPS ABI and/or environment");
	    }
	    eval 'sub _LIBUNWIND_HIGHEST_DWARF_REGISTER () { &_LIBUNWIND_HIGHEST_DWARF_REGISTER_MIPS;}' unless defined(&_LIBUNWIND_HIGHEST_DWARF_REGISTER);
	}
 elsif(defined(&__sparc__)  && defined(&__arch64__)) {
	    eval 'sub _LIBUNWIND_TARGET_SPARC64 () {1;}' unless defined(&_LIBUNWIND_TARGET_SPARC64);
	    eval 'sub _LIBUNWIND_HIGHEST_DWARF_REGISTER () { &_LIBUNWIND_HIGHEST_DWARF_REGISTER_SPARC64;}' unless defined(&_LIBUNWIND_HIGHEST_DWARF_REGISTER);
	    eval 'sub _LIBUNWIND_CONTEXT_SIZE () {33;}' unless defined(&_LIBUNWIND_CONTEXT_SIZE);
	    eval 'sub _LIBUNWIND_CURSOR_SIZE () {45;}' unless defined(&_LIBUNWIND_CURSOR_SIZE);
	}
 elsif(defined(&__sparc__)) {
	    eval 'sub _LIBUNWIND_TARGET_SPARC () {1;}' unless defined(&_LIBUNWIND_TARGET_SPARC);
	    eval 'sub _LIBUNWIND_HIGHEST_DWARF_REGISTER () { &_LIBUNWIND_HIGHEST_DWARF_REGISTER_SPARC;}' unless defined(&_LIBUNWIND_HIGHEST_DWARF_REGISTER);
	    eval 'sub _LIBUNWIND_CONTEXT_SIZE () {16;}' unless defined(&_LIBUNWIND_CONTEXT_SIZE);
	    eval 'sub _LIBUNWIND_CURSOR_SIZE () {23;}' unless defined(&_LIBUNWIND_CURSOR_SIZE);
	}
 elsif(defined(&__riscv)) {
	    eval 'sub _LIBUNWIND_TARGET_RISCV () {1;}' unless defined(&_LIBUNWIND_TARGET_RISCV);
	    if(defined(&__riscv_flen)) {
		eval 'sub RISCV_FLEN () { &__riscv_flen;}' unless defined(&RISCV_FLEN);
	    } else {
		eval 'sub RISCV_FLEN () {0;}' unless defined(&RISCV_FLEN);
	    }
	    eval 'sub _LIBUNWIND_CONTEXT_SIZE () {(32* ( &__riscv_xlen +  &RISCV_FLEN) / 64);}' unless defined(&_LIBUNWIND_CONTEXT_SIZE);
	    if((defined(&__riscv_xlen) ? &__riscv_xlen : undef) == 32) {
		eval 'sub _LIBUNWIND_CURSOR_SIZE () {( &_LIBUNWIND_CONTEXT_SIZE + 7);}' unless defined(&_LIBUNWIND_CURSOR_SIZE);
	    }
 elsif((defined(&__riscv_xlen) ? &__riscv_xlen : undef) == 64) {
		eval 'sub _LIBUNWIND_CURSOR_SIZE () {( &_LIBUNWIND_CONTEXT_SIZE + 12);}' unless defined(&_LIBUNWIND_CURSOR_SIZE);
	    } else {
		die("Unsupported RISC-V ABI");
	    }
	    eval 'sub _LIBUNWIND_HIGHEST_DWARF_REGISTER () { &_LIBUNWIND_HIGHEST_DWARF_REGISTER_RISCV;}' unless defined(&_LIBUNWIND_HIGHEST_DWARF_REGISTER);
	}
 elsif(defined(&__ve__)) {
	    eval 'sub _LIBUNWIND_TARGET_VE () {1;}' unless defined(&_LIBUNWIND_TARGET_VE);
	    eval 'sub _LIBUNWIND_CONTEXT_SIZE () {67;}' unless defined(&_LIBUNWIND_CONTEXT_SIZE);
	    eval 'sub _LIBUNWIND_CURSOR_SIZE () {79;}' unless defined(&_LIBUNWIND_CURSOR_SIZE);
	    eval 'sub _LIBUNWIND_HIGHEST_DWARF_REGISTER () { &_LIBUNWIND_HIGHEST_DWARF_REGISTER_VE;}' unless defined(&_LIBUNWIND_HIGHEST_DWARF_REGISTER);
	}
 elsif(defined(&__s390x__)) {
	    eval 'sub _LIBUNWIND_TARGET_S390X () {1;}' unless defined(&_LIBUNWIND_TARGET_S390X);
	    eval 'sub _LIBUNWIND_CONTEXT_SIZE () {34;}' unless defined(&_LIBUNWIND_CONTEXT_SIZE);
	    eval 'sub _LIBUNWIND_CURSOR_SIZE () {46;}' unless defined(&_LIBUNWIND_CURSOR_SIZE);
	    eval 'sub _LIBUNWIND_HIGHEST_DWARF_REGISTER () { &_LIBUNWIND_HIGHEST_DWARF_REGISTER_S390X;}' unless defined(&_LIBUNWIND_HIGHEST_DWARF_REGISTER);
	}
 elsif(defined(&__loongarch__)) {
	    eval 'sub _LIBUNWIND_TARGET_LOONGARCH () {1;}' unless defined(&_LIBUNWIND_TARGET_LOONGARCH);
	    if((defined(&__loongarch_grlen) ? &__loongarch_grlen : undef) == 64) {
		eval 'sub _LIBUNWIND_CONTEXT_SIZE () {65;}' unless defined(&_LIBUNWIND_CONTEXT_SIZE);
		eval 'sub _LIBUNWIND_CURSOR_SIZE () {77;}' unless defined(&_LIBUNWIND_CURSOR_SIZE);
	    } else {
		die("Unsupported LoongArch ABI");
	    }
	    eval 'sub _LIBUNWIND_HIGHEST_DWARF_REGISTER () { &_LIBUNWIND_HIGHEST_DWARF_REGISTER_LOONGARCH;}' unless defined(&_LIBUNWIND_HIGHEST_DWARF_REGISTER);
	} else {
	    die("Unsupported architecture.");
	}
    } else {
	eval 'sub _LIBUNWIND_TARGET_I386 () {1;}' unless defined(&_LIBUNWIND_TARGET_I386);
	eval 'sub _LIBUNWIND_TARGET_X86_64 () {1;}' unless defined(&_LIBUNWIND_TARGET_X86_64);
	eval 'sub _LIBUNWIND_TARGET_PPC () {1;}' unless defined(&_LIBUNWIND_TARGET_PPC);
	eval 'sub _LIBUNWIND_TARGET_PPC64 () {1;}' unless defined(&_LIBUNWIND_TARGET_PPC64);
	eval 'sub _LIBUNWIND_TARGET_AARCH64 () {1;}' unless defined(&_LIBUNWIND_TARGET_AARCH64);
	eval 'sub _LIBUNWIND_TARGET_ARM () {1;}' unless defined(&_LIBUNWIND_TARGET_ARM);
	eval 'sub _LIBUNWIND_TARGET_OR1K () {1;}' unless defined(&_LIBUNWIND_TARGET_OR1K);
	eval 'sub _LIBUNWIND_TARGET_MIPS_O32 () {1;}' unless defined(&_LIBUNWIND_TARGET_MIPS_O32);
	eval 'sub _LIBUNWIND_TARGET_MIPS_NEWABI () {1;}' unless defined(&_LIBUNWIND_TARGET_MIPS_NEWABI);
	eval 'sub _LIBUNWIND_TARGET_SPARC () {1;}' unless defined(&_LIBUNWIND_TARGET_SPARC);
	eval 'sub _LIBUNWIND_TARGET_SPARC64 () {1;}' unless defined(&_LIBUNWIND_TARGET_SPARC64);
	eval 'sub _LIBUNWIND_TARGET_HEXAGON () {1;}' unless defined(&_LIBUNWIND_TARGET_HEXAGON);
	eval 'sub _LIBUNWIND_TARGET_RISCV () {1;}' unless defined(&_LIBUNWIND_TARGET_RISCV);
	eval 'sub _LIBUNWIND_TARGET_VE () {1;}' unless defined(&_LIBUNWIND_TARGET_VE);
	eval 'sub _LIBUNWIND_TARGET_S390X () {1;}' unless defined(&_LIBUNWIND_TARGET_S390X);
	eval 'sub _LIBUNWIND_TARGET_LOONGARCH () {1;}' unless defined(&_LIBUNWIND_TARGET_LOONGARCH);
	eval 'sub _LIBUNWIND_CONTEXT_SIZE () {167;}' unless defined(&_LIBUNWIND_CONTEXT_SIZE);
	eval 'sub _LIBUNWIND_CURSOR_SIZE () {204;}' unless defined(&_LIBUNWIND_CURSOR_SIZE);
	eval 'sub _LIBUNWIND_HIGHEST_DWARF_REGISTER () {287;}' unless defined(&_LIBUNWIND_HIGHEST_DWARF_REGISTER);
    }
}
1;

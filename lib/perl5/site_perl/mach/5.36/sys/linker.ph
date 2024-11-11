require '_h2ph_pre.ph';

no warnings qw(redefine misc);

unless(defined(&_SYS_LINKER_H_)) {
    eval 'sub _SYS_LINKER_H_ () {1;}' unless defined(&_SYS_LINKER_H_);
    if(defined(&_KERNEL)) {
	require 'machine/elf.ph';
	require 'sys/kobj.ph';
	if(defined(&MALLOC_DECLARE)) {
	}
	eval 'sub LINKER_FILE_LINKED () {0x1;}' unless defined(&LINKER_FILE_LINKED);
	eval 'sub LINKER_FILE_MODULES () {0x2;}' unless defined(&LINKER_FILE_MODULES);
	eval("sub LF_NONE () { 0; }") unless defined(&LF_NONE);
	eval("sub LF_CTORS () { 1; }") unless defined(&LF_CTORS);
	eval("sub LF_DTORS () { 2; }") unless defined(&LF_DTORS);
	if(defined(&__arm__)) {
	}
	eval 'sub LINKER_UB_UNLOCK () {0x1;}' unless defined(&LINKER_UB_UNLOCK);
	eval 'sub LINKER_UB_LOCKED () {0x2;}' unless defined(&LINKER_UB_LOCKED);
	eval 'sub LINKER_UB_PCATCH () {0x4;}' unless defined(&LINKER_UB_PCATCH);
    }
    eval 'sub MODINFO_END () {0x;}' unless defined(&MODINFO_END);
    eval 'sub MODINFO_NAME () {0x1;}' unless defined(&MODINFO_NAME);
    eval 'sub MODINFO_TYPE () {0x2;}' unless defined(&MODINFO_TYPE);
    eval 'sub MODINFO_ADDR () {0x3;}' unless defined(&MODINFO_ADDR);
    eval 'sub MODINFO_SIZE () {0x4;}' unless defined(&MODINFO_SIZE);
    eval 'sub MODINFO_EMPTY () {0x5;}' unless defined(&MODINFO_EMPTY);
    eval 'sub MODINFO_ARGS () {0x6;}' unless defined(&MODINFO_ARGS);
    eval 'sub MODINFO_METADATA () {0x8000;}' unless defined(&MODINFO_METADATA);
    eval 'sub MODINFOMD_AOUTEXEC () {0x1;}' unless defined(&MODINFOMD_AOUTEXEC);
    eval 'sub MODINFOMD_ELFHDR () {0x2;}' unless defined(&MODINFOMD_ELFHDR);
    eval 'sub MODINFOMD_SSYM () {0x3;}' unless defined(&MODINFOMD_SSYM);
    eval 'sub MODINFOMD_ESYM () {0x4;}' unless defined(&MODINFOMD_ESYM);
    eval 'sub MODINFOMD_DYNAMIC () {0x5;}' unless defined(&MODINFOMD_DYNAMIC);
    eval 'sub MODINFOMD_MB2HDR () {0x6;}' unless defined(&MODINFOMD_MB2HDR);
    if(!defined(&__powerpc__)) {
	eval 'sub MODINFOMD_ENVP () {0x6;}' unless defined(&MODINFOMD_ENVP);
	eval 'sub MODINFOMD_HOWTO () {0x7;}' unless defined(&MODINFOMD_HOWTO);
	eval 'sub MODINFOMD_KERNEND () {0x8;}' unless defined(&MODINFOMD_KERNEND);
    }
    eval 'sub MODINFOMD_SHDR () {0x9;}' unless defined(&MODINFOMD_SHDR);
    eval 'sub MODINFOMD_CTORS_ADDR () {0xa;}' unless defined(&MODINFOMD_CTORS_ADDR);
    eval 'sub MODINFOMD_CTORS_SIZE () {0xb;}' unless defined(&MODINFOMD_CTORS_SIZE);
    eval 'sub MODINFOMD_FW_HANDLE () {0xc;}' unless defined(&MODINFOMD_FW_HANDLE);
    eval 'sub MODINFOMD_KEYBUF () {0xd;}' unless defined(&MODINFOMD_KEYBUF);
    eval 'sub MODINFOMD_FONT () {0xe;}' unless defined(&MODINFOMD_FONT);
    eval 'sub MODINFOMD_NOCOPY () {0x8000;}' unless defined(&MODINFOMD_NOCOPY);
    eval 'sub MODINFOMD_DEPLIST () {(0x4001 |  &MODINFOMD_NOCOPY);}' unless defined(&MODINFOMD_DEPLIST);
    if(defined(&_KERNEL)) {
	eval 'sub MD_FETCH {
	    my($mdp, $info, $type) = @_;
    	    eval q(({ $type * &__p;  &__p = ($type *) &preload_search_info(($mdp),  &MODINFO_METADATA | ($info));  &__p ? * &__p : 0; }));
	}' unless defined(&MD_FETCH);
    }
    eval 'sub LINKER_HINTS_VERSION () {1;}' unless defined(&LINKER_HINTS_VERSION);
    eval 'sub LINKER_HINTS_MAX () {(1<< 20);}' unless defined(&LINKER_HINTS_MAX);
    if(defined(&_KERNEL)) {
	if(defined(&KLD_DEBUG)) {
	    eval 'sub KLD_DEBUG_FILE () {1;}' unless defined(&KLD_DEBUG_FILE);
	    eval 'sub KLD_DEBUG_SYM () {2;}' unless defined(&KLD_DEBUG_SYM);
	    eval 'sub KLD_DPF {
	        my($cat, $args) = @_;
    		eval q( &do {  &if ( &kld_debug &  &KLD_DEBUG_$cat)  &printf $args; }  &while (0));
	    }' unless defined(&KLD_DPF);
	} else {
	    eval 'sub KLD_DPF {
	        my($cat, $args) = @_;
    		eval q();
	    }' unless defined(&KLD_DPF);
	}
	if(defined(&__aarch64__) || defined(&__amd64__)) {
	}
	eval 'sub ELF_RELOC_REL () {1;}' unless defined(&ELF_RELOC_REL);
	eval 'sub ELF_RELOC_RELA () {2;}' unless defined(&ELF_RELOC_RELA);
    }
    eval 'sub KLDSYM_LOOKUP () {1;}' unless defined(&KLDSYM_LOOKUP);
    eval 'sub LINKER_UNLOAD_NORMAL () {0;}' unless defined(&LINKER_UNLOAD_NORMAL);
    eval 'sub LINKER_UNLOAD_FORCE () {1;}' unless defined(&LINKER_UNLOAD_FORCE);
    unless(defined(&_KERNEL)) {
	require 'sys/cdefs.ph';
    }
}
1;

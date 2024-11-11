require '_h2ph_pre.ph';

no warnings qw(redefine misc);

unless(defined(&_LIBELF_H_)) {
    eval 'sub _LIBELF_H_ () {1;}' unless defined(&_LIBELF_H_);
    require 'sys/types.ph';
    require 'sys/elf32.ph';
    require 'sys/elf64.ph';
    eval("sub ELF_K_NONE () { 0; }") unless defined(&ELF_K_NONE);
    eval("sub ELF_K_AR () { 1; }") unless defined(&ELF_K_AR);
    eval("sub ELF_K_COFF () { 2; }") unless defined(&ELF_K_COFF);
    eval("sub ELF_K_ELF () { 3; }") unless defined(&ELF_K_ELF);
    eval("sub ELF_K_NUM () { 4; }") unless defined(&ELF_K_NUM);
    eval 'sub ELF_K_FIRST () { &ELF_K_NONE;}' unless defined(&ELF_K_FIRST);
    eval 'sub ELF_K_LAST () { &ELF_K_NUM;}' unless defined(&ELF_K_LAST);
    eval("sub ELF_T_ADDR () { 0; }") unless defined(&ELF_T_ADDR);
    eval("sub ELF_T_BYTE () { 1; }") unless defined(&ELF_T_BYTE);
    eval("sub ELF_T_CAP () { 2; }") unless defined(&ELF_T_CAP);
    eval("sub ELF_T_DYN () { 3; }") unless defined(&ELF_T_DYN);
    eval("sub ELF_T_EHDR () { 4; }") unless defined(&ELF_T_EHDR);
    eval("sub ELF_T_HALF () { 5; }") unless defined(&ELF_T_HALF);
    eval("sub ELF_T_LWORD () { 6; }") unless defined(&ELF_T_LWORD);
    eval("sub ELF_T_MOVE () { 7; }") unless defined(&ELF_T_MOVE);
    eval("sub ELF_T_MOVEP () { 8; }") unless defined(&ELF_T_MOVEP);
    eval("sub ELF_T_NOTE () { 9; }") unless defined(&ELF_T_NOTE);
    eval("sub ELF_T_OFF () { 10; }") unless defined(&ELF_T_OFF);
    eval("sub ELF_T_PHDR () { 11; }") unless defined(&ELF_T_PHDR);
    eval("sub ELF_T_REL () { 12; }") unless defined(&ELF_T_REL);
    eval("sub ELF_T_RELA () { 13; }") unless defined(&ELF_T_RELA);
    eval("sub ELF_T_SHDR () { 14; }") unless defined(&ELF_T_SHDR);
    eval("sub ELF_T_SWORD () { 15; }") unless defined(&ELF_T_SWORD);
    eval("sub ELF_T_SXWORD () { 16; }") unless defined(&ELF_T_SXWORD);
    eval("sub ELF_T_SYMINFO () { 17; }") unless defined(&ELF_T_SYMINFO);
    eval("sub ELF_T_SYM () { 18; }") unless defined(&ELF_T_SYM);
    eval("sub ELF_T_VDEF () { 19; }") unless defined(&ELF_T_VDEF);
    eval("sub ELF_T_VNEED () { 20; }") unless defined(&ELF_T_VNEED);
    eval("sub ELF_T_WORD () { 21; }") unless defined(&ELF_T_WORD);
    eval("sub ELF_T_XWORD () { 22; }") unless defined(&ELF_T_XWORD);
    eval("sub ELF_T_GNUHASH () { 23; }") unless defined(&ELF_T_GNUHASH);
    eval("sub ELF_T_NUM () { 24; }") unless defined(&ELF_T_NUM);
    eval 'sub ELF_T_FIRST () { &ELF_T_ADDR;}' unless defined(&ELF_T_FIRST);
    eval 'sub ELF_T_LAST () { &ELF_T_GNUHASH;}' unless defined(&ELF_T_LAST);
    eval("sub ELF_C_NULL () { 0; }") unless defined(&ELF_C_NULL);
    eval("sub ELF_C_CLR () { 1; }") unless defined(&ELF_C_CLR);
    eval("sub ELF_C_FDDONE () { 2; }") unless defined(&ELF_C_FDDONE);
    eval("sub ELF_C_FDREAD () { 3; }") unless defined(&ELF_C_FDREAD);
    eval("sub ELF_C_RDWR () { 4; }") unless defined(&ELF_C_RDWR);
    eval("sub ELF_C_READ () { 5; }") unless defined(&ELF_C_READ);
    eval("sub ELF_C_SET () { 6; }") unless defined(&ELF_C_SET);
    eval("sub ELF_C_WRITE () { 7; }") unless defined(&ELF_C_WRITE);
    eval("sub ELF_C_NUM () { 8; }") unless defined(&ELF_C_NUM);
    eval 'sub ELF_C_FIRST () { &ELF_C_NULL;}' unless defined(&ELF_C_FIRST);
    eval 'sub ELF_C_LAST () { &ELF_C_NUM;}' unless defined(&ELF_C_LAST);
    eval("sub ELF_E_NONE () { 0; }") unless defined(&ELF_E_NONE);
    eval("sub ELF_E_ARCHIVE () { 1; }") unless defined(&ELF_E_ARCHIVE);
    eval("sub ELF_E_ARGUMENT () { 2; }") unless defined(&ELF_E_ARGUMENT);
    eval("sub ELF_E_CLASS () { 3; }") unless defined(&ELF_E_CLASS);
    eval("sub ELF_E_DATA () { 4; }") unless defined(&ELF_E_DATA);
    eval("sub ELF_E_HEADER () { 5; }") unless defined(&ELF_E_HEADER);
    eval("sub ELF_E_IO () { 6; }") unless defined(&ELF_E_IO);
    eval("sub ELF_E_LAYOUT () { 7; }") unless defined(&ELF_E_LAYOUT);
    eval("sub ELF_E_MODE () { 8; }") unless defined(&ELF_E_MODE);
    eval("sub ELF_E_RANGE () { 9; }") unless defined(&ELF_E_RANGE);
    eval("sub ELF_E_RESOURCE () { 10; }") unless defined(&ELF_E_RESOURCE);
    eval("sub ELF_E_SECTION () { 11; }") unless defined(&ELF_E_SECTION);
    eval("sub ELF_E_SEQUENCE () { 12; }") unless defined(&ELF_E_SEQUENCE);
    eval("sub ELF_E_UNIMPL () { 13; }") unless defined(&ELF_E_UNIMPL);
    eval("sub ELF_E_VERSION () { 14; }") unless defined(&ELF_E_VERSION);
    eval("sub ELF_E_INVALID_SECTION_FLAGS () { 15; }") unless defined(&ELF_E_INVALID_SECTION_FLAGS);
    eval("sub ELF_E_INVALID_SECTION_TYPE () { 16; }") unless defined(&ELF_E_INVALID_SECTION_TYPE);
    eval("sub ELF_E_NOT_COMPRESSED () { 17; }") unless defined(&ELF_E_NOT_COMPRESSED);
    eval("sub ELF_E_NUM () { 18; }") unless defined(&ELF_E_NUM);
    eval 'sub ELF_F_LAYOUT () {0x1;}' unless defined(&ELF_F_LAYOUT);
    eval 'sub ELF_F_DIRTY () {0x2;}' unless defined(&ELF_F_DIRTY);
    eval 'sub ELF_F_ARCHIVE () {0x100;}' unless defined(&ELF_F_ARCHIVE);
    eval 'sub ELF_F_ARCHIVE_SYSV () {0x200;}' unless defined(&ELF_F_ARCHIVE_SYSV);
    if(defined(&__cplusplus)) {
    }
    if(defined(&__cplusplus)) {
    }
}
1;

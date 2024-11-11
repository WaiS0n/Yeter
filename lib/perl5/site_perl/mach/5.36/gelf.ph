require '_h2ph_pre.ph';

no warnings qw(redefine misc);

unless(defined(&_GELF_H_)) {
    eval 'sub _GELF_H_ () {1;}' unless defined(&_GELF_H_);
    require 'libelf.ph';
    eval 'sub GELF_M_INFO () { &ELF64_M_INFO;}' unless defined(&GELF_M_INFO);
    eval 'sub GELF_M_SIZE () { &ELF64_M_SIZE;}' unless defined(&GELF_M_SIZE);
    eval 'sub GELF_M_SYM () { &ELF64_M_SYM;}' unless defined(&GELF_M_SYM);
    eval 'sub GELF_R_INFO () { &ELF64_R_INFO;}' unless defined(&GELF_R_INFO);
    eval 'sub GELF_R_SYM () { &ELF64_R_SYM;}' unless defined(&GELF_R_SYM);
    eval 'sub GELF_R_TYPE () { &ELF64_R_TYPE;}' unless defined(&GELF_R_TYPE);
    eval 'sub GELF_R_TYPE_DATA () { &ELF64_R_TYPE_DATA;}' unless defined(&GELF_R_TYPE_DATA);
    eval 'sub GELF_R_TYPE_ID () { &ELF64_R_TYPE_ID;}' unless defined(&GELF_R_TYPE_ID);
    eval 'sub GELF_R_TYPE_INFO () { &ELF64_R_TYPE_INFO;}' unless defined(&GELF_R_TYPE_INFO);
    eval 'sub GELF_ST_BIND () { &ELF64_ST_BIND;}' unless defined(&GELF_ST_BIND);
    eval 'sub GELF_ST_INFO () { &ELF64_ST_INFO;}' unless defined(&GELF_ST_INFO);
    eval 'sub GELF_ST_TYPE () { &ELF64_ST_TYPE;}' unless defined(&GELF_ST_TYPE);
    eval 'sub GELF_ST_VISIBILITY () { &ELF64_ST_VISIBILITY;}' unless defined(&GELF_ST_VISIBILITY);
    if(defined(&__cplusplus)) {
    }
    if(defined(&__cplusplus)) {
    }
}
1;

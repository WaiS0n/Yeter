require '_h2ph_pre.ph';

no warnings qw(redefine misc);

unless(defined(&_SYS_ELF_GENERIC_H_)) {
    eval 'sub _SYS_ELF_GENERIC_H_ () {1;}' unless defined(&_SYS_ELF_GENERIC_H_);
    require 'sys/cdefs.ph';
    if((defined(&__ELF_WORD_SIZE) ? &__ELF_WORD_SIZE : undef) != 32 && (defined(&__ELF_WORD_SIZE) ? &__ELF_WORD_SIZE : undef) != 64) {
	die("__ELF_WORD_SIZE must be defined as 32 or 64");
    }
    eval 'sub ELF_CLASS () { &__CONCAT( &ELFCLASS, &__ELF_WORD_SIZE);}' unless defined(&ELF_CLASS);
    if((defined(&BYTE_ORDER) ? &BYTE_ORDER : undef) == (defined(&LITTLE_ENDIAN) ? &LITTLE_ENDIAN : undef)) {
	eval 'sub ELF_DATA () { &ELFDATA2LSB;}' unless defined(&ELF_DATA);
    }
 elsif((defined(&BYTE_ORDER) ? &BYTE_ORDER : undef) == (defined(&BIG_ENDIAN) ? &BIG_ENDIAN : undef)) {
	eval 'sub ELF_DATA () { &ELFDATA2MSB;}' unless defined(&ELF_DATA);
    } else {
	die("Unknown byte order");
    }
    eval 'sub __elfN {
        my($x) = @_;
	    eval q( &__CONCAT( &__CONCAT( &__CONCAT( &elf, &__ELF_WORD_SIZE), &_),$x));
    }' unless defined(&__elfN);
    eval 'sub __ElfN {
        my($x) = @_;
	    eval q( &__CONCAT( &__CONCAT( &__CONCAT( &Elf, &__ELF_WORD_SIZE), &_),$x));
    }' unless defined(&__ElfN);
    eval 'sub __ELFN {
        my($x) = @_;
	    eval q( &__CONCAT( &__CONCAT( &__CONCAT( &ELF, &__ELF_WORD_SIZE), &_),$x));
    }' unless defined(&__ELFN);
    eval 'sub __ElfType {
        my($x) = @_;
	    eval q( &typedef  &__ElfN($x)  &__CONCAT( &Elf_,$x));
    }' unless defined(&__ElfType);
    eval 'sub ElfW {
        my($x) = @_;
	    eval q( &__ElfN($x));
    }' unless defined(&ElfW);
    eval 'sub ELF_R_SYM () { &__ELFN( &R_SYM);}' unless defined(&ELF_R_SYM);
    eval 'sub ELF_R_TYPE () { &__ELFN( &R_TYPE);}' unless defined(&ELF_R_TYPE);
    eval 'sub ELF_R_INFO () { &__ELFN( &R_INFO);}' unless defined(&ELF_R_INFO);
    eval 'sub ELF_ST_BIND () { &__ELFN( &ST_BIND);}' unless defined(&ELF_ST_BIND);
    eval 'sub ELF_ST_TYPE () { &__ELFN( &ST_TYPE);}' unless defined(&ELF_ST_TYPE);
    eval 'sub ELF_ST_INFO () { &__ELFN( &ST_INFO);}' unless defined(&ELF_ST_INFO);
    eval 'sub ELF_ST_VISIBILITY () { &__ELFN( &ST_VISIBILITY);}' unless defined(&ELF_ST_VISIBILITY);
}
1;

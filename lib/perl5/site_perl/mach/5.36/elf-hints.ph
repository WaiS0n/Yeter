require '_h2ph_pre.ph';

no warnings qw(redefine misc);

unless(defined(&_ELF_HINTS_H_)) {
    eval 'sub _ELF_HINTS_H_ () {1;}' unless defined(&_ELF_HINTS_H_);
    eval 'sub ELFHINTS_MAGIC () {0x746e6845;}' unless defined(&ELFHINTS_MAGIC);
    unless(defined(&_PATH_ELF_HINTS)) {
	eval 'sub _PATH_ELF_HINTS () {"/var/run/ld-elf.so.hints";}' unless defined(&_PATH_ELF_HINTS);
    }
}
1;

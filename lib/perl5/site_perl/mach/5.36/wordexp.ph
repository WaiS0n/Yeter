require '_h2ph_pre.ph';

no warnings qw(redefine misc);

unless(defined(&_WORDEXP_H_)) {
    eval 'sub _WORDEXP_H_ () {1;}' unless defined(&_WORDEXP_H_);
    require 'sys/cdefs.ph';
    require 'sys/_types.ph';
    if((defined(&__XSI_VISIBLE) ? &__XSI_VISIBLE : undef)  && !defined(&_SIZE_T_DECLARED)) {
	eval 'sub _SIZE_T_DECLARED () {1;}' unless defined(&_SIZE_T_DECLARED);
    }
    eval 'sub WRDE_APPEND () {0x1;}' unless defined(&WRDE_APPEND);
    eval 'sub WRDE_DOOFFS () {0x2;}' unless defined(&WRDE_DOOFFS);
    eval 'sub WRDE_NOCMD () {0x4;}' unless defined(&WRDE_NOCMD);
    eval 'sub WRDE_REUSE () {0x8;}' unless defined(&WRDE_REUSE);
    eval 'sub WRDE_SHOWERR () {0x10;}' unless defined(&WRDE_SHOWERR);
    eval 'sub WRDE_UNDEF () {0x20;}' unless defined(&WRDE_UNDEF);
    eval 'sub WRDE_BADCHAR () {1;}' unless defined(&WRDE_BADCHAR);
    eval 'sub WRDE_BADVAL () {2;}' unless defined(&WRDE_BADVAL);
    eval 'sub WRDE_CMDSUB () {3;}' unless defined(&WRDE_CMDSUB);
    eval 'sub WRDE_NOSPACE () {4;}' unless defined(&WRDE_NOSPACE);
    if((defined(&__XSI_VISIBLE) ? &__XSI_VISIBLE : undef)) {
	eval 'sub WRDE_NOSYS () {5;}' unless defined(&WRDE_NOSYS);
    }
    eval 'sub WRDE_SYNTAX () {6;}' unless defined(&WRDE_SYNTAX);
}
1;

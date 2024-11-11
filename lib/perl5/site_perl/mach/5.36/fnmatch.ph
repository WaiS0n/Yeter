require '_h2ph_pre.ph';

no warnings qw(redefine misc);

unless(defined(&_FNMATCH_H_)) {
    eval 'sub _FNMATCH_H_ () {1;}' unless defined(&_FNMATCH_H_);
    require 'sys/cdefs.ph';
    eval 'sub FNM_NOMATCH () {1;}' unless defined(&FNM_NOMATCH);
    eval 'sub FNM_NOESCAPE () {0x1;}' unless defined(&FNM_NOESCAPE);
    eval 'sub FNM_PATHNAME () {0x2;}' unless defined(&FNM_PATHNAME);
    eval 'sub FNM_PERIOD () {0x4;}' unless defined(&FNM_PERIOD);
    if((defined(&__XSI_VISIBLE) ? &__XSI_VISIBLE : undef)) {
	eval 'sub FNM_NOSYS () {(-1);}' unless defined(&FNM_NOSYS);
    }
    if((defined(&__BSD_VISIBLE) ? &__BSD_VISIBLE : undef)) {
	eval 'sub FNM_LEADING_DIR () {0x8;}' unless defined(&FNM_LEADING_DIR);
	eval 'sub FNM_CASEFOLD () {0x10;}' unless defined(&FNM_CASEFOLD);
	eval 'sub FNM_IGNORECASE () { &FNM_CASEFOLD;}' unless defined(&FNM_IGNORECASE);
	eval 'sub FNM_FILE_NAME () { &FNM_PATHNAME;}' unless defined(&FNM_FILE_NAME);
    }
}
1;

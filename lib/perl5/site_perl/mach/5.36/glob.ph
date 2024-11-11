require '_h2ph_pre.ph';

no warnings qw(redefine misc);

unless(defined(&_GLOB_H_)) {
    eval 'sub _GLOB_H_ () {1;}' unless defined(&_GLOB_H_);
    require 'sys/cdefs.ph';
    require 'sys/_types.ph';
    unless(defined(&_SIZE_T_DECLARED)) {
	eval 'sub _SIZE_T_DECLARED () {1;}' unless defined(&_SIZE_T_DECLARED);
    }
    if((defined(&__POSIX_VISIBLE) ? &__POSIX_VISIBLE : undef) >= 199209) {
	eval 'sub GLOB_APPEND () {0x1;}' unless defined(&GLOB_APPEND);
	eval 'sub GLOB_DOOFFS () {0x2;}' unless defined(&GLOB_DOOFFS);
	eval 'sub GLOB_ERR () {0x4;}' unless defined(&GLOB_ERR);
	eval 'sub GLOB_MARK () {0x8;}' unless defined(&GLOB_MARK);
	eval 'sub GLOB_NOCHECK () {0x10;}' unless defined(&GLOB_NOCHECK);
	eval 'sub GLOB_NOSORT () {0x20;}' unless defined(&GLOB_NOSORT);
	eval 'sub GLOB_NOESCAPE () {0x2000;}' unless defined(&GLOB_NOESCAPE);
	eval 'sub GLOB_NOSPACE () {(-1);}' unless defined(&GLOB_NOSPACE);
	eval 'sub GLOB_ABORTED () {(-2);}' unless defined(&GLOB_ABORTED);
	eval 'sub GLOB_NOMATCH () {(-3);}' unless defined(&GLOB_NOMATCH);
	eval 'sub GLOB_NOSYS () {(-4);}' unless defined(&GLOB_NOSYS);
    }
    if((defined(&__BSD_VISIBLE) ? &__BSD_VISIBLE : undef)) {
	eval 'sub GLOB_ALTDIRFUNC () {0x40;}' unless defined(&GLOB_ALTDIRFUNC);
	eval 'sub GLOB_BRACE () {0x80;}' unless defined(&GLOB_BRACE);
	eval 'sub GLOB_MAGCHAR () {0x100;}' unless defined(&GLOB_MAGCHAR);
	eval 'sub GLOB_NOMAGIC () {0x200;}' unless defined(&GLOB_NOMAGIC);
	eval 'sub GLOB_QUOTE () {0x400;}' unless defined(&GLOB_QUOTE);
	eval 'sub GLOB_TILDE () {0x800;}' unless defined(&GLOB_TILDE);
	eval 'sub GLOB_LIMIT () {0x1000;}' unless defined(&GLOB_LIMIT);
	eval 'sub GLOB_MAXPATH () { &GLOB_LIMIT;}' unless defined(&GLOB_MAXPATH);
	eval 'sub GLOB_ABEND () { &GLOB_ABORTED;}' unless defined(&GLOB_ABEND);
    }
}
1;

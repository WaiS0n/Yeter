require '_h2ph_pre.ph';

no warnings qw(redefine misc);

unless(defined(&_VIS_H_)) {
    eval 'sub _VIS_H_ () {1;}' unless defined(&_VIS_H_);
    require 'sys/types.ph';
    eval 'sub VIS_OCTAL () {0x1;}' unless defined(&VIS_OCTAL);
    eval 'sub VIS_CSTYLE () {0x2;}' unless defined(&VIS_CSTYLE);
    eval 'sub VIS_SP () {0x4;}' unless defined(&VIS_SP);
    eval 'sub VIS_TAB () {0x8;}' unless defined(&VIS_TAB);
    eval 'sub VIS_NL () {0x10;}' unless defined(&VIS_NL);
    eval 'sub VIS_WHITE () {( &VIS_SP |  &VIS_TAB |  &VIS_NL);}' unless defined(&VIS_WHITE);
    eval 'sub VIS_SAFE () {0x20;}' unless defined(&VIS_SAFE);
    eval 'sub VIS_DQ () {0x8000;}' unless defined(&VIS_DQ);
    eval 'sub VIS_NOSLASH () {0x40;}' unless defined(&VIS_NOSLASH);
    eval 'sub VIS_HTTP1808 () {0x80;}' unless defined(&VIS_HTTP1808);
    eval 'sub VIS_HTTPSTYLE () {0x80;}' unless defined(&VIS_HTTPSTYLE);
    eval 'sub VIS_GLOB () {0x100;}' unless defined(&VIS_GLOB);
    eval 'sub VIS_MIMESTYLE () {0x200;}' unless defined(&VIS_MIMESTYLE);
    eval 'sub VIS_HTTP1866 () {0x400;}' unless defined(&VIS_HTTP1866);
    eval 'sub VIS_NOESCAPE () {0x800;}' unless defined(&VIS_NOESCAPE);
    eval 'sub _VIS_END () {0x1000;}' unless defined(&_VIS_END);
    eval 'sub VIS_SHELL () {0x2000;}' unless defined(&VIS_SHELL);
    eval 'sub VIS_META () {( &VIS_WHITE |  &VIS_GLOB |  &VIS_SHELL);}' unless defined(&VIS_META);
    eval 'sub VIS_NOLOCALE () {0x4000;}' unless defined(&VIS_NOLOCALE);
    eval 'sub UNVIS_VALID () {1;}' unless defined(&UNVIS_VALID);
    eval 'sub UNVIS_VALIDPUSH () {2;}' unless defined(&UNVIS_VALIDPUSH);
    eval 'sub UNVIS_NOCHAR () {3;}' unless defined(&UNVIS_NOCHAR);
    eval 'sub UNVIS_SYNBAD () {-1;}' unless defined(&UNVIS_SYNBAD);
    eval 'sub UNVIS_ERROR () {-2;}' unless defined(&UNVIS_ERROR);
    eval 'sub UNVIS_END () { &_VIS_END;}' unless defined(&UNVIS_END);
    require 'sys/cdefs.ph';
    unless(defined(&__LIBC12_SOURCE__)) {
    }
}
1;

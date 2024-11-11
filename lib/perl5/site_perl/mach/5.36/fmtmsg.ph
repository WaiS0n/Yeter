require '_h2ph_pre.ph';

no warnings qw(redefine misc);

unless(defined(&_FMTMSG_H_)) {
    eval 'sub _FMTMSG_H_ () {1;}' unless defined(&_FMTMSG_H_);
    eval 'sub MM_HARD () {0x1;}' unless defined(&MM_HARD);
    eval 'sub MM_SOFT () {0x2;}' unless defined(&MM_SOFT);
    eval 'sub MM_FIRM () {0x4;}' unless defined(&MM_FIRM);
    eval 'sub MM_APPL () {0x10;}' unless defined(&MM_APPL);
    eval 'sub MM_UTIL () {0x20;}' unless defined(&MM_UTIL);
    eval 'sub MM_OPSYS () {0x40;}' unless defined(&MM_OPSYS);
    eval 'sub MM_PRINT () {0x100;}' unless defined(&MM_PRINT);
    eval 'sub MM_CONSOLE () {0x200;}' unless defined(&MM_CONSOLE);
    eval 'sub MM_RECOVER () {0x1000;}' unless defined(&MM_RECOVER);
    eval 'sub MM_NRECOV () {0x2000;}' unless defined(&MM_NRECOV);
    eval 'sub MM_NOSEV () {0;}' unless defined(&MM_NOSEV);
    eval 'sub MM_HALT () {1;}' unless defined(&MM_HALT);
    eval 'sub MM_ERROR () {2;}' unless defined(&MM_ERROR);
    eval 'sub MM_WARNING () {3;}' unless defined(&MM_WARNING);
    eval 'sub MM_INFO () {4;}' unless defined(&MM_INFO);
    eval 'sub MM_NULLLBL () {0;}' unless defined(&MM_NULLLBL);
    eval 'sub MM_NULLSEV () {0;}' unless defined(&MM_NULLSEV);
    eval 'sub MM_NULLMC () {0;}' unless defined(&MM_NULLMC);
    eval 'sub MM_NULLTXT () {0;}' unless defined(&MM_NULLTXT);
    eval 'sub MM_NULLACT () {0;}' unless defined(&MM_NULLACT);
    eval 'sub MM_NULLTAG () {0;}' unless defined(&MM_NULLTAG);
    eval 'sub MM_OK () {0;}' unless defined(&MM_OK);
    eval 'sub MM_NOMSG () {1;}' unless defined(&MM_NOMSG);
    eval 'sub MM_NOCON () {2;}' unless defined(&MM_NOCON);
    eval 'sub MM_NOTOK () {3;}' unless defined(&MM_NOTOK);
}
1;

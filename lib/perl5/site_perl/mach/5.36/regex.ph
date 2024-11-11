require '_h2ph_pre.ph';

no warnings qw(redefine misc);

unless(defined(&_REGEX_H_)) {
    eval 'sub _REGEX_H_ () {1;}' unless defined(&_REGEX_H_);
    require 'sys/cdefs.ph';
    require 'sys/_types.ph';
    unless(defined(&_SIZE_T_DECLARED)) {
	eval 'sub _SIZE_T_DECLARED () {1;}' unless defined(&_SIZE_T_DECLARED);
    }
    eval 'sub REG_BASIC () {0000;}' unless defined(&REG_BASIC);
    eval 'sub REG_EXTENDED () {0001;}' unless defined(&REG_EXTENDED);
    eval 'sub REG_ICASE () {0002;}' unless defined(&REG_ICASE);
    eval 'sub REG_NOSUB () {0004;}' unless defined(&REG_NOSUB);
    eval 'sub REG_NEWLINE () {0010;}' unless defined(&REG_NEWLINE);
    eval 'sub REG_NOSPEC () {0020;}' unless defined(&REG_NOSPEC);
    eval 'sub REG_PEND () {0040;}' unless defined(&REG_PEND);
    eval 'sub REG_DUMP () {0200;}' unless defined(&REG_DUMP);
    eval 'sub REG_POSIX () {0400;}' unless defined(&REG_POSIX);
    eval 'sub REG_ENOSYS () {(-1);}' unless defined(&REG_ENOSYS);
    eval 'sub REG_NOMATCH () {1;}' unless defined(&REG_NOMATCH);
    eval 'sub REG_BADPAT () {2;}' unless defined(&REG_BADPAT);
    eval 'sub REG_ECOLLATE () {3;}' unless defined(&REG_ECOLLATE);
    eval 'sub REG_ECTYPE () {4;}' unless defined(&REG_ECTYPE);
    eval 'sub REG_EESCAPE () {5;}' unless defined(&REG_EESCAPE);
    eval 'sub REG_ESUBREG () {6;}' unless defined(&REG_ESUBREG);
    eval 'sub REG_EBRACK () {7;}' unless defined(&REG_EBRACK);
    eval 'sub REG_EPAREN () {8;}' unless defined(&REG_EPAREN);
    eval 'sub REG_EBRACE () {9;}' unless defined(&REG_EBRACE);
    eval 'sub REG_BADBR () {10;}' unless defined(&REG_BADBR);
    eval 'sub REG_ERANGE () {11;}' unless defined(&REG_ERANGE);
    eval 'sub REG_ESPACE () {12;}' unless defined(&REG_ESPACE);
    eval 'sub REG_BADRPT () {13;}' unless defined(&REG_BADRPT);
    eval 'sub REG_EMPTY () {14;}' unless defined(&REG_EMPTY);
    eval 'sub REG_ASSERT () {15;}' unless defined(&REG_ASSERT);
    eval 'sub REG_INVARG () {16;}' unless defined(&REG_INVARG);
    eval 'sub REG_ILLSEQ () {17;}' unless defined(&REG_ILLSEQ);
    eval 'sub REG_ATOI () {255;}' unless defined(&REG_ATOI);
    eval 'sub REG_ITOA () {0400;}' unless defined(&REG_ITOA);
    eval 'sub REG_NOTBOL () {00001;}' unless defined(&REG_NOTBOL);
    eval 'sub REG_NOTEOL () {00002;}' unless defined(&REG_NOTEOL);
    eval 'sub REG_STARTEND () {00004;}' unless defined(&REG_STARTEND);
    eval 'sub REG_TRACE () {00400;}' unless defined(&REG_TRACE);
    eval 'sub REG_LARGE () {01000;}' unless defined(&REG_LARGE);
    eval 'sub REG_BACKR () {02000;}' unless defined(&REG_BACKR);
}
1;

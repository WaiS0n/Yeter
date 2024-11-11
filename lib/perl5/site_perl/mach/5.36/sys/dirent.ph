require '_h2ph_pre.ph';

no warnings qw(redefine misc);

unless(defined(&_SYS_DIRENT_H_)) {
    eval 'sub _SYS_DIRENT_H_ () {1;}' unless defined(&_SYS_DIRENT_H_);
    require 'sys/cdefs.ph';
    require 'sys/_types.ph';
    unless(defined(&_INO_T_DECLARED)) {
	eval 'sub _INO_T_DECLARED () {1;}' unless defined(&_INO_T_DECLARED);
    }
    unless(defined(&_OFF_T_DECLARED)) {
	eval 'sub _OFF_T_DECLARED () {1;}' unless defined(&_OFF_T_DECLARED);
    }
    if((defined(&__BSD_VISIBLE) ? &__BSD_VISIBLE : undef)) {
	eval 'sub MAXNAMLEN () {255;}' unless defined(&MAXNAMLEN);
    } else {
    }
    if(defined(&_WANT_FREEBSD11_DIRENT) || defined(&_KERNEL)) {
    }
    if((defined(&__BSD_VISIBLE) ? &__BSD_VISIBLE : undef)) {
	eval 'sub DT_UNKNOWN () {0;}' unless defined(&DT_UNKNOWN);
	eval 'sub DT_FIFO () {1;}' unless defined(&DT_FIFO);
	eval 'sub DT_CHR () {2;}' unless defined(&DT_CHR);
	eval 'sub DT_DIR () {4;}' unless defined(&DT_DIR);
	eval 'sub DT_BLK () {6;}' unless defined(&DT_BLK);
	eval 'sub DT_REG () {8;}' unless defined(&DT_REG);
	eval 'sub DT_LNK () {10;}' unless defined(&DT_LNK);
	eval 'sub DT_SOCK () {12;}' unless defined(&DT_SOCK);
	eval 'sub DT_WHT () {14;}' unless defined(&DT_WHT);
	eval 'sub IFTODT {
	    my($mode) = @_;
    	    eval q(((($mode) & 0170000) >> 12));
	}' unless defined(&IFTODT);
	eval 'sub DTTOIF {
	    my($dirtype) = @_;
    	    eval q((($dirtype) << 12));
	}' unless defined(&DTTOIF);
	eval 'sub _GENERIC_DIRLEN {
	    my($namlen) = @_;
    	    eval q((( &__offsetof(\'struct dirent\',  &d_name) + ($namlen) + 1+ 7) & ~7));
	}' unless defined(&_GENERIC_DIRLEN);
	eval 'sub _GENERIC_DIRSIZ {
	    my($dp) = @_;
    	    eval q( &_GENERIC_DIRLEN(($dp)-> &d_namlen));
	}' unless defined(&_GENERIC_DIRSIZ);
	eval 'sub _GENERIC_MINDIRSIZ () { &_GENERIC_DIRLEN(1);}' unless defined(&_GENERIC_MINDIRSIZ);
	eval 'sub _GENERIC_MAXDIRSIZ () { &_GENERIC_DIRLEN( &MAXNAMLEN);}' unless defined(&_GENERIC_MAXDIRSIZ);
    }
    if(defined(&_KERNEL)) {
	eval 'sub GENERIC_DIRSIZ {
	    my($dp) = @_;
    	    eval q( &_GENERIC_DIRSIZ($dp));
	}' unless defined(&GENERIC_DIRSIZ);
	eval 'sub GENERIC_MINDIRSIZ () { &_GENERIC_MINDIRSIZ;}' unless defined(&GENERIC_MINDIRSIZ);
	eval 'sub GENERIC_MAXDIRSIZ () { &_GENERIC_MAXDIRSIZ;}' unless defined(&GENERIC_MAXDIRSIZ);
    }
}
1;

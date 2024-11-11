require '_h2ph_pre.ph';

no warnings qw(redefine misc);

unless(defined(&_SYS_TTYDEFAULTS_H_)) {
    eval 'sub _SYS_TTYDEFAULTS_H_ () {1;}' unless defined(&_SYS_TTYDEFAULTS_H_);
    eval 'sub TTYDEF_IFLAG () {( &BRKINT |  &ICRNL |  &IMAXBEL |  &IXON |  &IXANY |  &IUTF8);}' unless defined(&TTYDEF_IFLAG);
    eval 'sub TTYDEF_OFLAG () {( &OPOST |  &ONLCR);}' unless defined(&TTYDEF_OFLAG);
    eval 'sub TTYDEF_LFLAG_NOECHO () {( &ICANON |  &ISIG |  &IEXTEN);}' unless defined(&TTYDEF_LFLAG_NOECHO);
    eval 'sub TTYDEF_LFLAG_ECHO () {( &TTYDEF_LFLAG_NOECHO |  &ECHO |  &ECHOE |  &ECHOKE |  &ECHOCTL);}' unless defined(&TTYDEF_LFLAG_ECHO);
    eval 'sub TTYDEF_LFLAG () { &TTYDEF_LFLAG_ECHO;}' unless defined(&TTYDEF_LFLAG);
    eval 'sub TTYDEF_CFLAG () {( &CREAD |  &CS8 |  &HUPCL);}' unless defined(&TTYDEF_CFLAG);
    eval 'sub TTYDEF_SPEED () {( &B9600);}' unless defined(&TTYDEF_SPEED);
    eval 'sub CTRL {
        my($x) = @_;
	    eval q((($x) >= ord(\'a\' && (x) <= \'z\' ? 	((x) - \'a\' + 1) : (((x) - \'A\') + 1) & 0x7f)));
    }' unless defined(&CTRL);
    eval 'sub CEOF () { &CTRL(ord(\'D\'));}' unless defined(&CEOF);
    eval 'sub CEOL () {0xff;}' unless defined(&CEOL);
    eval 'sub CERASE () { &CTRL(ord(\'?\'));}' unless defined(&CERASE);
    eval 'sub CERASE2 () { &CTRL(ord(\'H\'));}' unless defined(&CERASE2);
    eval 'sub CINTR () { &CTRL(ord(\'C\'));}' unless defined(&CINTR);
    eval 'sub CSTATUS () { &CTRL(ord(\'T\'));}' unless defined(&CSTATUS);
    eval 'sub CKILL () { &CTRL(ord(\'U\'));}' unless defined(&CKILL);
    eval 'sub CMIN () {1;}' unless defined(&CMIN);
    eval 'sub CQUIT () { &CTRL(ord(\'\\\\\'));}' unless defined(&CQUIT);
    eval 'sub CSUSP () { &CTRL(ord(\'Z\'));}' unless defined(&CSUSP);
    eval 'sub CTIME () {0;}' unless defined(&CTIME);
    eval 'sub CDSUSP () { &CTRL(ord(\'Y\'));}' unless defined(&CDSUSP);
    eval 'sub CSTART () { &CTRL(ord(\'Q\'));}' unless defined(&CSTART);
    eval 'sub CSTOP () { &CTRL(ord(\'S\'));}' unless defined(&CSTOP);
    eval 'sub CLNEXT () { &CTRL(ord(\'V\'));}' unless defined(&CLNEXT);
    eval 'sub CDISCARD () { &CTRL(ord(\'O\'));}' unless defined(&CDISCARD);
    eval 'sub CWERASE () { &CTRL(ord(\'W\'));}' unless defined(&CWERASE);
    eval 'sub CREPRINT () { &CTRL(ord(\'R\'));}' unless defined(&CREPRINT);
    eval 'sub CEOT () { &CEOF;}' unless defined(&CEOT);
    eval 'sub CBRK () { &CEOL;}' unless defined(&CBRK);
    eval 'sub CRPRNT () { &CREPRINT;}' unless defined(&CRPRNT);
    eval 'sub CFLUSH () { &CDISCARD;}' unless defined(&CFLUSH);
}
if(defined(&TTYDEFCHARS)) {
    require 'sys/cdefs.ph';
    require 'sys/_termios.ph';
    undef(&TTYDEFCHARS) if defined(&TTYDEFCHARS);
}
1;

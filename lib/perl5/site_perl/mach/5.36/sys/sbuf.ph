require '_h2ph_pre.ph';

no warnings qw(redefine misc);

unless(defined(&_SYS_SBUF_H_)) {
    eval 'sub _SYS_SBUF_H_ () {1;}' unless defined(&_SYS_SBUF_H_);
    require 'sys/_types.ph';
    eval 'sub SBUF_FIXEDLEN () {0x;}' unless defined(&SBUF_FIXEDLEN);
    eval 'sub SBUF_AUTOEXTEND () {0x1;}' unless defined(&SBUF_AUTOEXTEND);
    eval 'sub SBUF_INCLUDENUL () {0x2;}' unless defined(&SBUF_INCLUDENUL);
    eval 'sub SBUF_DRAINTOEOR () {0x4;}' unless defined(&SBUF_DRAINTOEOR);
    eval 'sub SBUF_NOWAIT () {0x8;}' unless defined(&SBUF_NOWAIT);
    eval 'sub SBUF_USRFLAGMSK () {0xffff;}' unless defined(&SBUF_USRFLAGMSK);
    eval 'sub SBUF_DYNAMIC () {0x10000;}' unless defined(&SBUF_DYNAMIC);
    eval 'sub SBUF_FINISHED () {0x20000;}' unless defined(&SBUF_FINISHED);
    eval 'sub SBUF_DYNSTRUCT () {0x80000;}' unless defined(&SBUF_DYNSTRUCT);
    eval 'sub SBUF_INSECTION () {0x100000;}' unless defined(&SBUF_INSECTION);
    eval 'sub SBUF_DRAINATEOL () {0x200000;}' unless defined(&SBUF_DRAINATEOL);
    unless(defined(&HD_COLUMN_MASK)) {
	eval 'sub HD_COLUMN_MASK () {0xff;}' unless defined(&HD_COLUMN_MASK);
	eval 'sub HD_DELIM_MASK () {0xff00;}' unless defined(&HD_DELIM_MASK);
	eval 'sub HD_OMIT_COUNT () {(1<< 16);}' unless defined(&HD_OMIT_COUNT);
	eval 'sub HD_OMIT_HEX () {(1<< 17);}' unless defined(&HD_OMIT_HEX);
	eval 'sub HD_OMIT_CHARS () {(1<< 18);}' unless defined(&HD_OMIT_CHARS);
    }
    eval 'sub sbuf_new_auto () {
        eval q( &sbuf_new( &NULL,  &NULL, 0,  &SBUF_AUTOEXTEND));
    }' unless defined(&sbuf_new_auto);
    if(defined(&_KERNEL)) {
    }
}
1;

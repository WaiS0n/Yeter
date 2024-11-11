require '_h2ph_pre.ph';

no warnings qw(redefine misc);

unless(defined(&_IMGACT_AOUT_H_)) {
    eval 'sub _IMGACT_AOUT_H_ () {1;}' unless defined(&_IMGACT_AOUT_H_);
    eval 'sub N_GETMAGIC {
        my($ex) = @_;
	    eval q((  &le32toh(($ex). &a_midmag) & 0xffff ));
    }' unless defined(&N_GETMAGIC);
    eval 'sub N_GETMID {
        my($ex) = @_;
	    eval q(( ( &N_GETMAGIC_NET($ex) ==  &ZMAGIC) ?  &N_GETMID_NET($ex) : (($ex). &a_midmag >> 16) & 0x3ff ));
    }' unless defined(&N_GETMID);
    eval 'sub N_GETFLAG {
        my($ex) = @_;
	    eval q(( ( &N_GETMAGIC_NET($ex) ==  &ZMAGIC) ?  &N_GETFLAG_NET($ex) : (($ex). &a_midmag >> 26) & 0x3f ));
    }' unless defined(&N_GETFLAG);
    eval 'sub N_SETMAGIC {
        my($ex,$mag,$mid,$flag) = @_;
	    eval q(( ($ex). &a_midmag =  &htole32(((($flag) & 0x3f) <<26) | ((($mid) & 0x3ff) << 16) | (($mag) & 0xffff)) ));
    }' unless defined(&N_SETMAGIC);
    eval 'sub N_GETMAGIC_NET {
        my($ex) = @_;
	    eval q(( &ntohl(($ex). &a_midmag) & 0xffff));
    }' unless defined(&N_GETMAGIC_NET);
    eval 'sub N_GETMID_NET {
        my($ex) = @_;
	    eval q((( &ntohl(($ex). &a_midmag) >> 16) & 0x3ff));
    }' unless defined(&N_GETMID_NET);
    eval 'sub N_GETFLAG_NET {
        my($ex) = @_;
	    eval q((( &ntohl(($ex). &a_midmag) >> 26) & 0x3f));
    }' unless defined(&N_GETFLAG_NET);
    eval 'sub N_SETMAGIC_NET {
        my($ex,$mag,$mid,$flag) = @_;
	    eval q(( ($ex). &a_midmag =  &htonl( ((($flag)&0x3f)<<26) | ((($mid)&0x3ff)<<16) | ((($mag)&0xffff)) ) ));
    }' unless defined(&N_SETMAGIC_NET);
    eval 'sub N_ALIGN {
        my($ex,$x) = @_;
	    eval q(( &N_GETMAGIC($ex) ==  &ZMAGIC ||  &N_GETMAGIC($ex) ==  &QMAGIC ||  &N_GETMAGIC_NET($ex) ==  &ZMAGIC ||  &N_GETMAGIC_NET($ex) ==  &QMAGIC ? (($x) +  &__LDPGSZ - 1) & ~( &uint32_t)( &__LDPGSZ - 1) : ($x)));
    }' unless defined(&N_ALIGN);
    eval 'sub N_BADMAG {
        my($ex) = @_;
	    eval q(( &N_GETMAGIC($ex) !=  &OMAGIC  &&  &N_GETMAGIC($ex) !=  &NMAGIC  &&  &N_GETMAGIC($ex) !=  &ZMAGIC  &&  &N_GETMAGIC($ex) !=  &QMAGIC  &&  &N_GETMAGIC_NET($ex) !=  &OMAGIC  &&  &N_GETMAGIC_NET($ex) !=  &NMAGIC  &&  &N_GETMAGIC_NET($ex) !=  &ZMAGIC  &&  &N_GETMAGIC_NET($ex) !=  &QMAGIC));
    }' unless defined(&N_BADMAG);
    eval 'sub N_TXTADDR {
        my($ex) = @_;
	    eval q((( &N_GETMAGIC($ex) ==  &OMAGIC ||  &N_GETMAGIC($ex) ==  &NMAGIC ||  &N_GETMAGIC($ex) ==  &ZMAGIC) ? ( &le32toh(($ex). &a_entry) <  &le32toh(($ex). &a_text) ? 0:  &le32toh(($ex). &a_entry) & ~ &__LDPGSZ) :  &__LDPGSZ));
    }' unless defined(&N_TXTADDR);
    eval 'sub N_DATADDR {
        my($ex) = @_;
	    eval q( &N_ALIGN($ex,  &N_TXTADDR($ex) +  &le32toh(($ex). &a_text)));
    }' unless defined(&N_DATADDR);
    eval 'sub N_TXTOFF {
        my($ex) = @_;
	    eval q(( &N_GETMAGIC($ex) ==  &ZMAGIC ?  &__LDPGSZ : ( &N_GETMAGIC($ex) ==  &QMAGIC ||  &N_GETMAGIC_NET($ex) ==  &ZMAGIC) ? 0: $sizeof{\'struct exec\'}));
    }' unless defined(&N_TXTOFF);
    eval 'sub N_DATOFF {
        my($ex) = @_;
	    eval q( &N_ALIGN($ex,  &N_TXTOFF($ex) +  &le32toh(($ex). &a_text)));
    }' unless defined(&N_DATOFF);
    eval 'sub N_RELOFF {
        my($ex) = @_;
	    eval q( &N_ALIGN($ex,  &N_DATOFF($ex) +  &le32toh(($ex). &a_data)));
    }' unless defined(&N_RELOFF);
    eval 'sub N_SYMOFF {
        my($ex) = @_;
	    eval q(( &N_RELOFF($ex) +  &le32toh(($ex). &a_trsize) +  &le32toh(($ex). &a_drsize)));
    }' unless defined(&N_SYMOFF);
    eval 'sub N_STROFF {
        my($ex) = @_;
	    eval q(( &N_SYMOFF($ex) +  &le32toh(($ex). &a_syms)));
    }' unless defined(&N_STROFF);
    eval 'sub a_magic () { &a_midmag;}' unless defined(&a_magic);
    eval 'sub OMAGIC () {0407;}' unless defined(&OMAGIC);
    eval 'sub NMAGIC () {0410;}' unless defined(&NMAGIC);
    eval 'sub ZMAGIC () {0413;}' unless defined(&ZMAGIC);
    eval 'sub QMAGIC () {0314;}' unless defined(&QMAGIC);
    eval 'sub MID_ZERO () {0;}' unless defined(&MID_ZERO);
    eval 'sub MID_SUN010 () {1;}' unless defined(&MID_SUN010);
    eval 'sub MID_SUN020 () {2;}' unless defined(&MID_SUN020);
    eval 'sub MID_I386 () {134;}' unless defined(&MID_I386);
    eval 'sub MID_SPARC () {138;}' unless defined(&MID_SPARC);
    eval 'sub MID_ARM6 () {143;}' unless defined(&MID_ARM6);
    eval 'sub MID_HP200 () {200;}' unless defined(&MID_HP200);
    eval 'sub MID_HP300 () {300;}' unless defined(&MID_HP300);
    eval 'sub MID_HPUX () {0x20c;}' unless defined(&MID_HPUX);
    eval 'sub MID_HPUX800 () {0x20b;}' unless defined(&MID_HPUX800);
    eval 'sub EX_PIC () {0x10;}' unless defined(&EX_PIC);
    eval 'sub EX_DYNAMIC () {0x20;}' unless defined(&EX_DYNAMIC);
    eval 'sub EX_DPMASK () {0x30;}' unless defined(&EX_DPMASK);
    if(defined(&_KERNEL)) {
    }
}
1;

require '_h2ph_pre.ph';

no warnings qw(redefine misc);

unless(defined(&_SYS_NLIST_AOUT_H_)) {
    eval 'sub _SYS_NLIST_AOUT_H_ () {1;}' unless defined(&_SYS_NLIST_AOUT_H_);
    if(defined(&_AOUT_INCLUDE_)) {
    } else {
    }
    eval 'sub n_hash () { &n_desc;}' unless defined(&n_hash);
    eval 'sub N_UNDF () {0x;}' unless defined(&N_UNDF);
    eval 'sub N_ABS () {0x2;}' unless defined(&N_ABS);
    eval 'sub N_TEXT () {0x4;}' unless defined(&N_TEXT);
    eval 'sub N_DATA () {0x6;}' unless defined(&N_DATA);
    eval 'sub N_BSS () {0x8;}' unless defined(&N_BSS);
    eval 'sub N_INDR () {0xa;}' unless defined(&N_INDR);
    eval 'sub N_SIZE () {0xc;}' unless defined(&N_SIZE);
    eval 'sub N_COMM () {0x12;}' unless defined(&N_COMM);
    eval 'sub N_SETA () {0x14;}' unless defined(&N_SETA);
    eval 'sub N_SETT () {0x16;}' unless defined(&N_SETT);
    eval 'sub N_SETD () {0x18;}' unless defined(&N_SETD);
    eval 'sub N_SETB () {0x1a;}' unless defined(&N_SETB);
    eval 'sub N_SETV () {0x1c;}' unless defined(&N_SETV);
    eval 'sub N_FN () {0x1e;}' unless defined(&N_FN);
    eval 'sub N_WARN () {0x1e;}' unless defined(&N_WARN);
    eval 'sub N_EXT () {0x1;}' unless defined(&N_EXT);
    eval 'sub N_TYPE () {0x1e;}' unless defined(&N_TYPE);
    eval 'sub N_STAB () {0xe0;}' unless defined(&N_STAB);
    eval 'sub N_AUX {
        my($p) = @_;
	    eval q((($p)-> &n_other & 0xf));
    }' unless defined(&N_AUX);
    eval 'sub N_BIND {
        my($p) = @_;
	    eval q(((($p)-> &n_other >> 4) & 0xf));
    }' unless defined(&N_BIND);
    eval 'sub N_OTHER {
        my($r, $v) = @_;
	    eval q(((($r) << 4) | (($v) & 0xf)));
    }' unless defined(&N_OTHER);
    eval 'sub AUX_OBJECT () {1;}' unless defined(&AUX_OBJECT);
    eval 'sub AUX_FUNC () {2;}' unless defined(&AUX_FUNC);
    eval 'sub BIND_WEAK () {2;}' unless defined(&BIND_WEAK);
    eval 'sub N_FORMAT () {"%08x";}' unless defined(&N_FORMAT);
}
1;

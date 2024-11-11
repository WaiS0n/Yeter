require '_h2ph_pre.ph';

no warnings qw(redefine misc);

unless(defined(&__SYS__PV_ENTRY_H__)) {
    eval 'sub __SYS__PV_ENTRY_H__ () {1;}' unless defined(&__SYS__PV_ENTRY_H__);
    require 'sys/param.ph';
    if((defined(&PAGE_SIZE) ? &PAGE_SIZE : undef) == 4* 1024) {
	if(defined(&__LP64__)) {
	    eval 'sub _NPCPV () {168;}' unless defined(&_NPCPV);
	    eval 'sub _NPAD () {0;}' unless defined(&_NPAD);
	} else {
	    eval 'sub _NPCPV () {336;}' unless defined(&_NPCPV);
	    eval 'sub _NPAD () {0;}' unless defined(&_NPAD);
	}
    }
 elsif((defined(&PAGE_SIZE) ? &PAGE_SIZE : undef) == 16* 1024) {
	if(defined(&__LP64__)) {
	    eval 'sub _NPCPV () {677;}' unless defined(&_NPCPV);
	    eval 'sub _NPAD () {1;}' unless defined(&_NPAD);
	}
    }
    unless(defined(&_NPCPV)) {
	die("Unsupported\ page\ size");
    }
    unless(defined(&__LONG_WIDTH__)) {
	eval 'sub __LONG_WIDTH__ () {( &__CHAR_BIT__ *  &__SIZEOF_LONG__);}' unless defined(&__LONG_WIDTH__);
    }
    eval 'sub _NPCM () { &howmany( &_NPCPV,  &__LONG_WIDTH__);}' unless defined(&_NPCM);
    eval 'sub PC_FREEN () {~0;}' unless defined(&PC_FREEN);
    eval 'sub PC_FREEL () {((1 << ( &_NPCPV %  &__LONG_WIDTH__)) - 1);}' unless defined(&PC_FREEL);
    eval 'sub PV_CHUNK_HEADER () {\'struct pmap\' * &pc_pmap;  &TAILQ_ENTRY( &pv_chunk)  &pc_list; \'unsigned long pc_map\'[ &_NPCM];  &TAILQ_ENTRY( &pv_chunk)  &pc_lru;;}' unless defined(&PV_CHUNK_HEADER);
    if(defined(&_KERNEL)) {
	eval 'sub pc_is_full {
	    my($pc) = @_;
    	    eval q({  &for (\'u_int\'  &i = 0;  &i <  &_NPCM;  &i++) {  &if ( ($pc->{pc_map[&i]}) != 0) ( &false); } ( &true); });
	}' unless defined(&pc_is_full);
	eval 'sub pc_is_free {
	    my($pc) = @_;
    	    eval q({  &for (\'u_int\'  &i = 0;  &i <  &_NPCM - 1;  &i++) {  &if ( ($pc->{pc_map[&i]}) !=  &PC_FREEN) ( &false); } ( ($pc->{pc_map[_NPCM }- 1]) ==  &PC_FREEL); });
	}' unless defined(&pc_is_free);
	eval 'sub pv_to_chunk {
	    my($pv) = @_;
    	    eval q({ ((( &uintptr_t)$pv & ~( &uintptr_t) &PAGE_MASK)); });
	}' unless defined(&pv_to_chunk);
	eval 'sub PV_PMAP {
	    my($pv) = @_;
    	    eval q(( &pv_to_chunk($pv)-> &pc_pmap));
	}' unless defined(&PV_PMAP);
    }
}
1;

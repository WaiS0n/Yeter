require '_h2ph_pre.ph';

no warnings qw(redefine misc);

unless(defined(&_SYS_LINKER_SET_H_)) {
    eval 'sub _SYS_LINKER_SET_H_ () {1;}' unless defined(&_SYS_LINKER_SET_H_);
    if(defined(&__powerpc64__)  && (!defined(&_CALL_ELF) || (defined(&_CALL_ELF) ? &_CALL_ELF : undef) == 1)) {
	eval 'sub __MAKE_SET_CONST () {1;}' unless defined(&__MAKE_SET_CONST);
    } else {
	eval 'sub __MAKE_SET_CONST () { &const;}' unless defined(&__MAKE_SET_CONST);
    }
    if(defined(&_KERNEL)) {
	eval 'sub __NOASAN () {1;}' unless defined(&__NOASAN);
    } else {
	eval 'sub __NOASAN () { &__nosanitizeaddress;}' unless defined(&__NOASAN);
    }
    eval 'sub __MAKE_SET_QV {
        my($set, $sym, $qv) = @_;
	    eval q( &__WEAK( &__CONCAT( &__start_set_,$set));  &__WEAK( &__CONCAT( &__stop_set_,$set));  &static  &void  &const * $qv  &__NOASAN  &__set_$set &_sym_$sym  &__section(\\"set_\\" $set)  &__used = ($sym));
    }' unless defined(&__MAKE_SET_QV);
    eval 'sub __MAKE_SET {
        my($set, $sym) = @_;
	    eval q( &__MAKE_SET_QV($set, $sym,  &__MAKE_SET_CONST));
    }' unless defined(&__MAKE_SET);
    eval 'sub TEXT_SET {
        my($set, $sym) = @_;
	    eval q( &__MAKE_SET($set, $sym));
    }' unless defined(&TEXT_SET);
    eval 'sub DATA_SET {
        my($set, $sym) = @_;
	    eval q( &__MAKE_SET($set, $sym));
    }' unless defined(&DATA_SET);
    eval 'sub DATA_WSET {
        my($set, $sym) = @_;
	    eval q( &__MAKE_SET_QV($set, $sym, ));
    }' unless defined(&DATA_WSET);
    eval 'sub BSS_SET {
        my($set, $sym) = @_;
	    eval q( &__MAKE_SET($set, $sym));
    }' unless defined(&BSS_SET);
    eval 'sub ABS_SET {
        my($set, $sym) = @_;
	    eval q( &__MAKE_SET($set, $sym));
    }' unless defined(&ABS_SET);
    eval 'sub SET_ENTRY {
        my($set, $sym) = @_;
	    eval q( &__MAKE_SET($set, $sym));
    }' unless defined(&SET_ENTRY);
    eval 'sub SET_DECLARE {
        my($set, $ptype) = @_;
	    eval q( &extern $ptype  &__weak_symbol * &__CONCAT( &__start_set_,$set);  &extern $ptype  &__weak_symbol * &__CONCAT( &__stop_set_,$set));
    }' unless defined(&SET_DECLARE);
    eval 'sub SET_BEGIN {
        my($set) = @_;
	    eval q((& &__CONCAT( &__start_set_,$set)));
    }' unless defined(&SET_BEGIN);
    eval 'sub SET_LIMIT {
        my($set) = @_;
	    eval q((& &__CONCAT( &__stop_set_,$set)));
    }' unless defined(&SET_LIMIT);
    eval 'sub SET_FOREACH {
        my($pvar, $set) = @_;
	    eval q( &for ($pvar =  &SET_BEGIN($set); $pvar <  &SET_LIMIT($set); $pvar++));
    }' unless defined(&SET_FOREACH);
    eval 'sub SET_ITEM {
        my($set, $i) = @_;
	    eval q((( &SET_BEGIN($set))[$i]));
    }' unless defined(&SET_ITEM);
    eval 'sub SET_COUNT {
        my($set) = @_;
	    eval q(( &SET_LIMIT($set) -  &SET_BEGIN($set)));
    }' unless defined(&SET_COUNT);
}
1;

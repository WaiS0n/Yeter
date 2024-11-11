require '_h2ph_pre.ph';

no warnings qw(redefine misc);

unless(defined(&_SYS_PCTRIE_H_)) {
    eval 'sub _SYS_PCTRIE_H_ () {1;}' unless defined(&_SYS_PCTRIE_H_);
    require 'sys/_pctrie.ph';
    require 'sys/_smr.ph';
    if(defined(&_KERNEL)) {
	eval 'sub PCTRIE_DEFINE_SMR {
	    my($name, $type, $field, $allocfn, $freefn, $smr) = @_;
    	    eval q( &PCTRIE_DEFINE($name, $type, $field, $allocfn, $freefn)  &static  &__inline \'struct type\' * $name &_PCTRIE_LOOKUP_UNLOCKED(\'struct pctrie\' * &ptree,  &uint64_t  &key) {  &return $name &_PCTRIE_VAL2PTR( &pctrie_lookup_unlocked( &ptree,  &key, ($smr))); });
	}' unless defined(&PCTRIE_DEFINE_SMR);
	eval 'sub PCTRIE_DEFINE {
	    my($name, $type, $field, $allocfn, $freefn) = @_;
    	    eval q( &CTASSERT($sizeof{(0)->$field} == $sizeof{ &uint64_t});  &CTASSERT(( &__offsetof(\'struct type\', $field) & ($sizeof{ &uint32_t} - 1)) == 0);  &static  &__inline \'struct type\' * $name &_PCTRIE_VAL2PTR( &uint64_t * &val) {  &if ( &val ==  &NULL)  &return ( &NULL);  &return  (( &uintptr_t) &val -  &__offsetof(\'struct type\', $field)); }  &static  &__inline  &uint64_t * $name &_PCTRIE_PTR2VAL(\'struct type\' * &ptr) {  &return  ($ptr->{field}); }  &static  &__inline \'int\' $name &_PCTRIE_INSERT(\'struct pctrie\' * &ptree, \'struct type\' * &ptr) { \'struct pctrie_node\' * &parent;  &void * &parentp;  &uint64_t * &val = $name &_PCTRIE_PTR2VAL( &ptr);  &parentp =  &pctrie_insert_lookup( &ptree,  &val);  &if ( &parentp ==  &NULL)  &return (0);  &parent = $allocfn( &ptree);  &if ( &parent ==  &NULL)  &return ( &ENOMEM);  &pctrie_insert_node( &parentp,  &parent,  &val);  &return (0); }  &static  &__inline  &__unused \'struct type\' * $name &_PCTRIE_LOOKUP(\'struct pctrie\' * &ptree,  &uint64_t  &key) {  &return $name &_PCTRIE_VAL2PTR( &pctrie_lookup( &ptree,  &key)); }  &static  &__inline  &__unused \'struct type\' * $name &_PCTRIE_LOOKUP_LE(\'struct pctrie\' * &ptree,  &uint64_t  &key) {  &return $name &_PCTRIE_VAL2PTR( &pctrie_lookup_le( &ptree,  &key)); }  &static  &__inline  &__unused \'struct type\' * $name &_PCTRIE_LOOKUP_GE(\'struct pctrie\' * &ptree,  &uint64_t  &key) {  &return $name &_PCTRIE_VAL2PTR( &pctrie_lookup_ge( &ptree,  &key)); }  &static  &__inline  &__unused  &void $name &_PCTRIE_RECLAIM(\'struct pctrie\' * &ptree) { \'struct pctrie_node\' * &freenode, * &node;  &for ( &freenode =  &pctrie_reclaim_begin( &node,  &ptree);  &freenode !=  &NULL;  &freenode =  &pctrie_reclaim_resume( &node)) $freefn( &ptree,  &freenode); }  &static  &__inline  &__unused \'struct type\' * $name &_PCTRIE_REPLACE(\'struct pctrie\' * &ptree, \'struct type\' * &ptr) {  &return $name &_PCTRIE_VAL2PTR(  &pctrie_replace( &ptree, $name &_PCTRIE_PTR2VAL( &ptr))); }  &static  &__inline  &__unused  &void $name &_PCTRIE_REMOVE(\'struct pctrie\' * &ptree,  &uint64_t  &key) {  &uint64_t * &val; \'struct pctrie_node\' * &freenode;  &val =  &pctrie_remove_lookup( &ptree,  &key,  &freenode);  &if ( &val ==  &NULL)  &panic(\\"%s: key not found\\",  &__func__);  &if ( &freenode !=  &NULL) $freefn( &ptree,  &freenode); }  &static  &__inline  &__unused \'struct type\' * $name &_PCTRIE_REMOVE_LOOKUP(\'struct pctrie\' * &ptree,  &uint64_t  &key) {  &uint64_t * &val; \'struct pctrie_node\' * &freenode;  &val =  &pctrie_remove_lookup( &ptree,  &key,  &freenode);  &if ( &freenode !=  &NULL) $freefn( &ptree,  &freenode);  &return $name &_PCTRIE_VAL2PTR( &val); });
	}' unless defined(&PCTRIE_DEFINE);
	eval 'sub PCTRIE_ISLEAF () {0x1;}' unless defined(&PCTRIE_ISLEAF);
	eval 'sub PCTRIE_NULL () { &PCTRIE_ISLEAF;}' unless defined(&PCTRIE_NULL);
	eval 'sub pctrie_init {
	    my($ptree) = @_;
    	    eval q({  ($ptree->{pt_root}) =  &PCTRIE_NULL; });
	}' unless defined(&pctrie_init);
	eval 'sub pctrie_is_empty {
	    my($ptree) = @_;
    	    eval q({ ( ($ptree->{pt_root}) ==  &PCTRIE_NULL); });
	}' unless defined(&pctrie_is_empty);
	eval 'sub PCTRIE_FLAGS () {( &PCTRIE_ISLEAF);}' unless defined(&PCTRIE_FLAGS);
	eval 'sub PCTRIE_PAD () { &PCTRIE_FLAGS;}' unless defined(&PCTRIE_PAD);
	if(defined(&__LP64__)) {
	    eval 'sub PCTRIE_WIDTH () {4;}' unless defined(&PCTRIE_WIDTH);
	} else {
	    eval 'sub PCTRIE_WIDTH () {3;}' unless defined(&PCTRIE_WIDTH);
	}
	eval 'sub PCTRIE_COUNT () {(1<<  &PCTRIE_WIDTH);}' unless defined(&PCTRIE_COUNT);
    }
}
1;

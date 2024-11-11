require '_h2ph_pre.ph';

no warnings qw(redefine misc);

unless(defined(&_SYS_ARB_H_)) {
    eval 'sub _SYS_ARB_H_ () {1;}' unless defined(&_SYS_ARB_H_);
    require 'sys/cdefs.ph';
    eval 'sub ARB_NULLIDX () {-1;}' unless defined(&ARB_NULLIDX);
    eval 'sub ARB_NULLCOL () {-1;}' unless defined(&ARB_NULLCOL);
    eval 'sub ARB_BLACK () {0;}' unless defined(&ARB_BLACK);
    eval 'sub ARB_RED () {1;}' unless defined(&ARB_RED);
    eval 'sub ARB_NEGINF () {-1;}' unless defined(&ARB_NEGINF);
    eval 'sub ARB_INF () {1;}' unless defined(&ARB_INF);
    eval 'sub ARB_HEAD {
        my($name, $type, $idxbits) = @_;
	    eval q(\'struct name\' { \'int\'$idxbits &_t  &arb_curnodes; \'int\'$idxbits &_t  &arb_maxnodes; \'int\'$idxbits &_t  &arb_root_idx; \'int\'$idxbits &_t  &arb_free_idx; \'int\'$idxbits &_t  &arb_min_idx; \'int\'$idxbits &_t  &arb_max_idx; \'struct type\'  $arb_nodes[]; });
    }' unless defined(&ARB_HEAD);
    eval 'sub ARB8_HEAD {
        my($name, $type) = @_;
	    eval q( &ARB_HEAD($name, $type, 8));
    }' unless defined(&ARB8_HEAD);
    eval 'sub ARB16_HEAD {
        my($name, $type) = @_;
	    eval q( &ARB_HEAD($name, $type, 16));
    }' unless defined(&ARB16_HEAD);
    eval 'sub ARB32_HEAD {
        my($name, $type) = @_;
	    eval q( &ARB_HEAD($name, $type, 32));
    }' unless defined(&ARB32_HEAD);
    eval 'sub ARB_ALLOCSIZE {
        my($head, $maxn, $x) = @_;
	    eval q(($sizeof{$head} + ($maxn) * $sizeof{$x}));
    }' unless defined(&ARB_ALLOCSIZE);
    eval 'sub ARB_INITIALIZER {
        my($name, $maxn) = @_;
	    eval q(({ 0, $maxn,  &ARB_NULLIDX,  &ARB_NULLIDX,  &ARB_NULLIDX,  &ARB_NULLIDX }));
    }' unless defined(&ARB_INITIALIZER);
    eval 'sub ARB_INIT {
        my($x, $field, $head, $maxn) = @_;
	    eval q(($head)-> &arb_curnodes = 0; ($head)-> &arb_maxnodes = ($maxn); ($head)-> &arb_root_idx = ($head)-> &arb_free_idx = ($head)-> &arb_min_idx = ($head)-> &arb_max_idx =  &ARB_NULLIDX;  &ARB_ARRFOREACH_REVWCOND($x, $field, $head,  &ARB_RETURNFREE($head, $x, $field)));
    }' unless defined(&ARB_INIT);
    eval 'sub ARB_ENTRY {
        my($idxbits) = @_;
	    eval q(\'struct struct\' { \'int\'$idxbits &_t  &arbe_parent_idx; \'int\'$idxbits &_t  &arbe_left_idx; \'int\'$idxbits &_t  &arbe_right_idx;  &int8_t  &arbe_color; });
    }' unless defined(&ARB_ENTRY);
    eval 'sub ARB8_ENTRY () {
        eval q( &ARB_ENTRY(8));
    }' unless defined(&ARB8_ENTRY);
    eval 'sub ARB16_ENTRY () {
        eval q( &ARB_ENTRY(16));
    }' unless defined(&ARB16_ENTRY);
    eval 'sub ARB32_ENTRY () {
        eval q( &ARB_ENTRY(32));
    }' unless defined(&ARB32_ENTRY);
    eval 'sub ARB_ENTRYINIT {
        my($elm, $field) = @_;
	    eval q( &do { ($elm)-> ($field->{arbe_parent_idx}) = ($elm)-> ($field->{arbe_left_idx}) = ($elm)-> ($field->{arbe_right_idx}) =  &ARB_NULLIDX; ($elm)-> ($field->{arbe_color}) =  &ARB_NULLCOL; }  &while ( 0));
    }' unless defined(&ARB_ENTRYINIT);
    eval 'sub ARB_ELMTYPE {
        my($head) = @_;
	    eval q( &__typeof(($head)-> $arb_nodes[0]));
    }' unless defined(&ARB_ELMTYPE);
    eval 'sub ARB_NODES {
        my($head) = @_;
	    eval q(($head)-> &arb_nodes);
    }' unless defined(&ARB_NODES);
    eval 'sub ARB_MAXNODES {
        my($head) = @_;
	    eval q(($head)-> &arb_maxnodes);
    }' unless defined(&ARB_MAXNODES);
    eval 'sub ARB_CURNODES {
        my($head) = @_;
	    eval q(($head)-> &arb_curnodes);
    }' unless defined(&ARB_CURNODES);
    eval 'sub ARB_EMPTY {
        my($head) = @_;
	    eval q((($head)-> &arb_curnodes == 0));
    }' unless defined(&ARB_EMPTY);
    eval 'sub ARB_FULL {
        my($head) = @_;
	    eval q((($head)-> &arb_curnodes >= ($head)-> &arb_maxnodes));
    }' unless defined(&ARB_FULL);
    eval 'sub ARB_CNODE {
        my($head, $idx) = @_;
	    eval q((((( &intptr_t)($idx) <=  &ARB_NULLIDX) || (($idx) >=  &ARB_MAXNODES($head))) ?  &NULL : (( &const  &ARB_ELMTYPE($head))( &ARB_NODES($head) + ($idx)))));
    }' unless defined(&ARB_CNODE);
    eval 'sub ARB_NODE {
        my($head, $idx) = @_;
	    eval q(( &__DECONST( &ARB_ELMTYPE($head),  &ARB_CNODE($head, $idx))));
    }' unless defined(&ARB_NODE);
    eval 'sub ARB_ROOT {
        my($head) = @_;
	    eval q( &ARB_NODE($head,  &ARB_ROOTIDX($head)));
    }' unless defined(&ARB_ROOT);
    eval 'sub ARB_LEFT {
        my($head, $elm, $field) = @_;
	    eval q( &ARB_NODE($head,  &ARB_LEFTIDX($elm, $field)));
    }' unless defined(&ARB_LEFT);
    eval 'sub ARB_RIGHT {
        my($head, $elm, $field) = @_;
	    eval q( &ARB_NODE($head,  &ARB_RIGHTIDX($elm, $field)));
    }' unless defined(&ARB_RIGHT);
    eval 'sub ARB_PARENT {
        my($head, $elm, $field) = @_;
	    eval q( &ARB_NODE($head,  &ARB_PARENTIDX($elm, $field)));
    }' unless defined(&ARB_PARENT);
    eval 'sub ARB_FREEIDX {
        my($head) = @_;
	    eval q(($head)-> &arb_free_idx);
    }' unless defined(&ARB_FREEIDX);
    eval 'sub ARB_ROOTIDX {
        my($head) = @_;
	    eval q(($head)-> &arb_root_idx);
    }' unless defined(&ARB_ROOTIDX);
    eval 'sub ARB_MINIDX {
        my($head) = @_;
	    eval q(($head)-> &arb_min_idx);
    }' unless defined(&ARB_MINIDX);
    eval 'sub ARB_MAXIDX {
        my($head) = @_;
	    eval q(($head)-> &arb_max_idx);
    }' unless defined(&ARB_MAXIDX);
    eval 'sub ARB_SELFIDX {
        my($head, $elm) = @_;
	    eval q((($elm) ? (( &intptr_t)(((( &const  &uint8_t *)($elm)) - (( &const  &uint8_t *) &ARB_NODES($head))) / $sizeof{($elm)})) : ( &intptr_t) &ARB_NULLIDX));
    }' unless defined(&ARB_SELFIDX);
    eval 'sub ARB_LEFTIDX {
        my($elm, $field) = @_;
	    eval q(($elm)-> ($field->{arbe_left_idx}));
    }' unless defined(&ARB_LEFTIDX);
    eval 'sub ARB_RIGHTIDX {
        my($elm, $field) = @_;
	    eval q(($elm)-> ($field->{arbe_right_idx}));
    }' unless defined(&ARB_RIGHTIDX);
    eval 'sub ARB_PARENTIDX {
        my($elm, $field) = @_;
	    eval q(($elm)-> ($field->{arbe_parent_idx}));
    }' unless defined(&ARB_PARENTIDX);
    eval 'sub ARB_COLOR {
        my($elm, $field) = @_;
	    eval q(($elm)-> ($field->{arbe_color}));
    }' unless defined(&ARB_COLOR);
    eval 'sub ARB_PREVFREE {
        my($head, $elm, $field) = @_;
	    eval q( &ARB_NODE($head,  &ARB_PREVFREEIDX($elm, $field)));
    }' unless defined(&ARB_PREVFREE);
    eval 'sub ARB_PREVFREEIDX {
        my($elm, $field) = @_;
	    eval q( &ARB_LEFTIDX($elm, $field));
    }' unless defined(&ARB_PREVFREEIDX);
    eval 'sub ARB_NEXTFREE {
        my($head, $elm, $field) = @_;
	    eval q( &ARB_NODE($head,  &ARB_NEXTFREEIDX($elm, $field)));
    }' unless defined(&ARB_NEXTFREE);
    eval 'sub ARB_NEXTFREEIDX {
        my($elm, $field) = @_;
	    eval q( &ARB_RIGHTIDX($elm, $field));
    }' unless defined(&ARB_NEXTFREEIDX);
    eval 'sub ARB_ISFREE {
        my($elm, $field) = @_;
	    eval q(( &ARB_COLOR($elm, $field) ==  &ARB_NULLCOL));
    }' unless defined(&ARB_ISFREE);
    eval 'sub ARB_SET {
        my($head, $elm, $parent, $field) = @_;
	    eval q( &do {  &ARB_PARENTIDX($elm, $field) = $parent ?  &ARB_SELFIDX($head, $parent) :  &ARB_NULLIDX;  &ARB_LEFTIDX($elm, $field) =  &ARB_RIGHTIDX($elm, $field) =  &ARB_NULLIDX;  &ARB_COLOR($elm, $field) =  &ARB_RED; }  &while ( 0));
    }' unless defined(&ARB_SET);
    eval 'sub ARB_SET_BLACKRED {
        my($black, $red, $field) = @_;
	    eval q( &do {  &ARB_COLOR($black, $field) =  &ARB_BLACK;  &ARB_COLOR($red, $field) =  &ARB_RED; }  &while ( 0));
    }' unless defined(&ARB_SET_BLACKRED);
    unless(defined(&ARB_AUGMENT)) {
	eval 'sub ARB_AUGMENT {
	    my($x) = @_;
    	    eval q( &do {}  &while (0));
	}' unless defined(&ARB_AUGMENT);
    }
    eval 'sub ARB_ROTATE_LEFT {
        my($head, $elm, $tmp, $field) = @_;
	    eval q( &do {  &__typeof( &ARB_RIGHTIDX($elm, $field))  &_tmpidx; ($tmp) =  &ARB_RIGHT($head, $elm, $field);  &_tmpidx =  &ARB_RIGHTIDX($elm, $field);  &ARB_RIGHTIDX($elm, $field) =  &ARB_LEFTIDX($tmp, $field);  &if ( &ARB_RIGHTIDX($elm, $field) !=  &ARB_NULLIDX) {  &ARB_PARENTIDX( &ARB_LEFT($head, $tmp, $field), $field) =  &ARB_SELFIDX($head, $elm); }  &ARB_AUGMENT($elm);  &ARB_PARENTIDX($tmp, $field) =  &ARB_PARENTIDX($elm, $field);  &if ( &ARB_PARENTIDX($tmp, $field) !=  &ARB_NULLIDX) {  &if ( &ARB_SELFIDX($head, $elm) ==  &ARB_LEFTIDX( &ARB_PARENT($head, $elm, $field), $field))  &ARB_LEFTIDX( &ARB_PARENT($head, $elm, $field), $field) =  &_tmpidx;  &else  &ARB_RIGHTIDX( &ARB_PARENT($head, $elm, $field), $field) =  &_tmpidx; }  &else  &ARB_ROOTIDX($head) =  &_tmpidx;  &ARB_LEFTIDX($tmp, $field) =  &ARB_SELFIDX($head, $elm);  &ARB_PARENTIDX($elm, $field) =  &_tmpidx;  &ARB_AUGMENT($tmp);  &if ( &ARB_PARENTIDX($tmp, $field) !=  &ARB_NULLIDX)  &ARB_AUGMENT( &ARB_PARENT($head, $tmp, $field)); }  &while ( 0));
    }' unless defined(&ARB_ROTATE_LEFT);
    eval 'sub ARB_ROTATE_RIGHT {
        my($head, $elm, $tmp, $field) = @_;
	    eval q( &do {  &__typeof( &ARB_LEFTIDX($elm, $field))  &_tmpidx; ($tmp) =  &ARB_LEFT($head, $elm, $field);  &_tmpidx =  &ARB_LEFTIDX($elm, $field);  &ARB_LEFTIDX($elm, $field) =  &ARB_RIGHTIDX($tmp, $field);  &if ( &ARB_LEFTIDX($elm, $field) !=  &ARB_NULLIDX) {  &ARB_PARENTIDX( &ARB_RIGHT($head, $tmp, $field), $field) =  &ARB_SELFIDX($head, $elm); }  &ARB_AUGMENT($elm);  &ARB_PARENTIDX($tmp, $field) =  &ARB_PARENTIDX($elm, $field);  &if ( &ARB_PARENTIDX($tmp, $field) !=  &ARB_NULLIDX) {  &if ( &ARB_SELFIDX($head, $elm) ==  &ARB_LEFTIDX( &ARB_PARENT($head, $elm, $field), $field))  &ARB_LEFTIDX( &ARB_PARENT($head, $elm, $field), $field) =  &_tmpidx;  &else  &ARB_RIGHTIDX( &ARB_PARENT($head, $elm, $field), $field) =  &_tmpidx; }  &else  &ARB_ROOTIDX($head) =  &_tmpidx;  &ARB_RIGHTIDX($tmp, $field) =  &ARB_SELFIDX($head, $elm);  &ARB_PARENTIDX($elm, $field) =  &_tmpidx;  &ARB_AUGMENT($tmp);  &if ( &ARB_PARENTIDX($tmp, $field) !=  &ARB_NULLIDX)  &ARB_AUGMENT( &ARB_PARENT($head, $tmp, $field)); }  &while ( 0));
    }' unless defined(&ARB_ROTATE_RIGHT);
    eval 'sub ARB_RETURNFREE {
        my($head, $elm, $field) = @_;
	    eval q(({  &ARB_COLOR($elm, $field) =  &ARB_NULLCOL;  &ARB_NEXTFREEIDX($elm, $field) =  &ARB_FREEIDX($head);  &ARB_FREEIDX($head) =  &ARB_SELFIDX($head, $elm); $elm; }));
    }' unless defined(&ARB_RETURNFREE);
    eval 'sub ARB_GETFREEAT {
        my($head, $field, $fidx) = @_;
	    eval q(({  &__typeof( &ARB_NODE($head, 0))  &_elm,  &_prevelm; \'int\'  &_idx = $fidx;  &if ( &ARB_FREEIDX($head) ==  &ARB_NULLIDX  && ! &ARB_FULL($head)) {  &ARB_ARRFOREACH_REVERSE( &_elm, $field, $head) {  &if ( &ARB_ISFREE( &_elm, $field))  &ARB_RETURNFREE($head,  &_elm, $field); } }  &_elm =  &_prevelm =  &ARB_NODE($head,  &ARB_FREEIDX($head));  &for (;  &_idx > 0 &&  &_elm !=  &NULL;  &_idx--,  &_prevelm =  &_elm)  &_elm =  &ARB_NODE($head,  &ARB_NEXTFREEIDX( &_elm, $field));  &if ( &_elm) {  &if ($fidx == 0)  &ARB_FREEIDX($head) =  &ARB_NEXTFREEIDX( &_elm, $field);  &else  &ARB_NEXTFREEIDX( &_prevelm, $field) =  &ARB_NEXTFREEIDX( &_elm, $field); }  &_elm; }));
    }' unless defined(&ARB_GETFREEAT);
    eval 'sub ARB_GETFREE {
        my($head, $field) = @_;
	    eval q( &ARB_GETFREEAT($head, $field, 0));
    }' unless defined(&ARB_GETFREE);
    eval 'sub ARB_PROTOTYPE {
        my($name, $type, $field, $cmp) = @_;
	    eval q( &ARB_PROTOTYPE_INTERNAL($name, $type, $field, $cmp,));
    }' unless defined(&ARB_PROTOTYPE);
    eval 'sub ARB_PROTOTYPE_STATIC {
        my($name, $type, $field, $cmp) = @_;
	    eval q( &ARB_PROTOTYPE_INTERNAL($name, $type, $field, $cmp,  &__unused  &static));
    }' unless defined(&ARB_PROTOTYPE_STATIC);
    eval 'sub ARB_PROTOTYPE_INTERNAL {
        my($name, $type, $field, $cmp, $attr) = @_;
	    eval q( &ARB_PROTOTYPE_INSERT_COLOR($name, $type, $attr);  &ARB_PROTOTYPE_REMOVE_COLOR($name, $type, $attr);  &ARB_PROTOTYPE_INSERT($name, $type, $attr);  &ARB_PROTOTYPE_REMOVE($name, $type, $attr);  &ARB_PROTOTYPE_CFIND($name, $type, $attr);  &ARB_PROTOTYPE_FIND($name, $type, $attr);  &ARB_PROTOTYPE_NFIND($name, $type, $attr);  &ARB_PROTOTYPE_CNEXT($name, $type, $attr);  &ARB_PROTOTYPE_NEXT($name, $type, $attr);  &ARB_PROTOTYPE_CPREV($name, $type, $attr);  &ARB_PROTOTYPE_PREV($name, $type, $attr);  &ARB_PROTOTYPE_CMINMAX($name, $type, $attr);  &ARB_PROTOTYPE_MINMAX($name, $type, $attr);  &ARB_PROTOTYPE_REINSERT($name, $type, $attr););
    }' unless defined(&ARB_PROTOTYPE_INTERNAL);
    eval 'sub ARB_PROTOTYPE_INSERT_COLOR {
        my($name, $type, $attr) = @_;
	    eval q($attr  &void $name &_ARB_INSERT_COLOR(\'struct name\' *, \'struct type\' *));
    }' unless defined(&ARB_PROTOTYPE_INSERT_COLOR);
    eval 'sub ARB_PROTOTYPE_REMOVE_COLOR {
        my($name, $type, $attr) = @_;
	    eval q($attr  &void $name &_ARB_REMOVE_COLOR(\'struct name\' *, \'struct type\' *, \'struct type\' *));
    }' unless defined(&ARB_PROTOTYPE_REMOVE_COLOR);
    eval 'sub ARB_PROTOTYPE_REMOVE {
        my($name, $type, $attr) = @_;
	    eval q($attr \'struct type\' *$name &_ARB_REMOVE(\'struct name\' *, \'struct type\' *));
    }' unless defined(&ARB_PROTOTYPE_REMOVE);
    eval 'sub ARB_PROTOTYPE_INSERT {
        my($name, $type, $attr) = @_;
	    eval q($attr \'struct type\' *$name &_ARB_INSERT(\'struct name\' *, \'struct type\' *));
    }' unless defined(&ARB_PROTOTYPE_INSERT);
    eval 'sub ARB_PROTOTYPE_CFIND {
        my($name, $type, $attr) = @_;
	    eval q($attr  &const \'struct type\' *$name &_ARB_CFIND( &const \'struct name\' *,  &const \'struct type\' *));
    }' unless defined(&ARB_PROTOTYPE_CFIND);
    eval 'sub ARB_PROTOTYPE_FIND {
        my($name, $type, $attr) = @_;
	    eval q($attr \'struct type\' *$name &_ARB_FIND( &const \'struct name\' *,  &const \'struct type\' *));
    }' unless defined(&ARB_PROTOTYPE_FIND);
    eval 'sub ARB_PROTOTYPE_NFIND {
        my($name, $type, $attr) = @_;
	    eval q($attr \'struct type\' *$name &_ARB_NFIND(\'struct name\' *, \'struct type\' *));
    }' unless defined(&ARB_PROTOTYPE_NFIND);
    eval 'sub ARB_PROTOTYPE_CNFIND {
        my($name, $type, $attr) = @_;
	    eval q($attr  &const \'struct type\' *$name &_ARB_CNFIND( &const \'struct name\' *,  &const \'struct type\' *));
    }' unless defined(&ARB_PROTOTYPE_CNFIND);
    eval 'sub ARB_PROTOTYPE_CNEXT {
        my($name, $type, $attr) = @_;
	    eval q($attr  &const \'struct type\' *$name &_ARB_CNEXT( &const \'struct name\' * &head,  &const \'struct type\' *));
    }' unless defined(&ARB_PROTOTYPE_CNEXT);
    eval 'sub ARB_PROTOTYPE_NEXT {
        my($name, $type, $attr) = @_;
	    eval q($attr \'struct type\' *$name &_ARB_NEXT( &const \'struct name\' *,  &const \'struct type\' *));
    }' unless defined(&ARB_PROTOTYPE_NEXT);
    eval 'sub ARB_PROTOTYPE_CPREV {
        my($name, $type, $attr) = @_;
	    eval q($attr  &const \'struct type\' *$name &_ARB_CPREV( &const \'struct name\' *,  &const \'struct type\' *));
    }' unless defined(&ARB_PROTOTYPE_CPREV);
    eval 'sub ARB_PROTOTYPE_PREV {
        my($name, $type, $attr) = @_;
	    eval q($attr \'struct type\' *$name &_ARB_PREV( &const \'struct name\' *,  &const \'struct type\' *));
    }' unless defined(&ARB_PROTOTYPE_PREV);
    eval 'sub ARB_PROTOTYPE_CMINMAX {
        my($name, $type, $attr) = @_;
	    eval q($attr  &const \'struct type\' *$name &_ARB_CMINMAX( &const \'struct name\' *, \'int\'));
    }' unless defined(&ARB_PROTOTYPE_CMINMAX);
    eval 'sub ARB_PROTOTYPE_MINMAX {
        my($name, $type, $attr) = @_;
	    eval q($attr \'struct type\' *$name &_ARB_MINMAX( &const \'struct name\' *, \'int\'));
    }' unless defined(&ARB_PROTOTYPE_MINMAX);
    eval 'sub ARB_PROTOTYPE_REINSERT {
        my($name, $type, $attr) = @_;
	    eval q($attr \'struct type\' *$name &_ARB_REINSERT(\'struct name\' *, \'struct type\' *));
    }' unless defined(&ARB_PROTOTYPE_REINSERT);
    eval 'sub ARB_GENERATE {
        my($name, $type, $field, $cmp) = @_;
	    eval q( &ARB_GENERATE_INTERNAL($name, $type, $field, $cmp,));
    }' unless defined(&ARB_GENERATE);
    eval 'sub ARB_GENERATE_STATIC {
        my($name, $type, $field, $cmp) = @_;
	    eval q( &ARB_GENERATE_INTERNAL($name, $type, $field, $cmp,  &__unused  &static));
    }' unless defined(&ARB_GENERATE_STATIC);
    eval 'sub ARB_GENERATE_INTERNAL {
        my($name, $type, $field, $cmp, $attr) = @_;
	    eval q( &ARB_GENERATE_INSERT_COLOR($name, $type, $field, $attr)  &ARB_GENERATE_REMOVE_COLOR($name, $type, $field, $attr)  &ARB_GENERATE_INSERT($name, $type, $field, $cmp, $attr)  &ARB_GENERATE_REMOVE($name, $type, $field, $attr)  &ARB_GENERATE_CFIND($name, $type, $field, $cmp, $attr)  &ARB_GENERATE_FIND($name, $type, $field, $cmp, $attr)  &ARB_GENERATE_CNEXT($name, $type, $field, $attr)  &ARB_GENERATE_NEXT($name, $type, $field, $attr)  &ARB_GENERATE_CPREV($name, $type, $field, $attr)  &ARB_GENERATE_PREV($name, $type, $field, $attr)  &ARB_GENERATE_CMINMAX($name, $type, $field, $attr)  &ARB_GENERATE_MINMAX($name, $type, $field, $attr)  &ARB_GENERATE_REINSERT($name, $type, $field, $cmp, $attr));
    }' unless defined(&ARB_GENERATE_INTERNAL);
    eval 'sub ARB_GENERATE_INSERT_COLOR {
        my($name, $type, $field, $attr) = @_;
	    eval q($attr  &void $name &_ARB_INSERT_COLOR(\'struct name\' * &head, \'struct type\' * &elm) { \'struct type\' * &parent, * &gparent, * &tmp;  &while (( &parent =  &ARB_PARENT( &head,  &elm, $field)) !=  &NULL  &&  &ARB_COLOR( &parent, $field) ==  &ARB_RED) {  &gparent =  &ARB_PARENT( &head,  &parent, $field);  &if ( &parent ==  &ARB_LEFT( &head,  &gparent, $field)) {  &tmp =  &ARB_RIGHT( &head,  &gparent, $field);  &if ( &tmp  &&  &ARB_COLOR( &tmp, $field) ==  &ARB_RED) {  &ARB_COLOR( &tmp, $field) =  &ARB_BLACK;  &ARB_SET_BLACKRED( &parent,  &gparent, $field);  &elm =  &gparent;  &continue; }  &if ( &ARB_RIGHT( &head,  &parent, $field) ==  &elm) {  &ARB_ROTATE_LEFT( &head,  &parent,  &tmp, $field);  &tmp =  &parent;  &parent =  &elm;  &elm =  &tmp; }  &ARB_SET_BLACKRED( &parent,  &gparent, $field);  &ARB_ROTATE_RIGHT( &head,  &gparent,  &tmp, $field); }  &else {  &tmp =  &ARB_LEFT( &head,  &gparent, $field);  &if ( &tmp  &&  &ARB_COLOR( &tmp, $field) ==  &ARB_RED) {  &ARB_COLOR( &tmp, $field) =  &ARB_BLACK;  &ARB_SET_BLACKRED( &parent,  &gparent, $field);  &elm =  &gparent;  &continue; }  &if ( &ARB_LEFT( &head,  &parent, $field) ==  &elm) {  &ARB_ROTATE_RIGHT( &head,  &parent,  &tmp, $field);  &tmp =  &parent;  &parent =  &elm;  &elm =  &tmp; }  &ARB_SET_BLACKRED( &parent,  &gparent, $field);  &ARB_ROTATE_LEFT( &head,  &gparent,  &tmp, $field); } }  &ARB_COLOR( &ARB_ROOT( &head), $field) =  &ARB_BLACK; });
    }' unless defined(&ARB_GENERATE_INSERT_COLOR);
    eval 'sub ARB_GENERATE_REMOVE_COLOR {
        my($name, $type, $field, $attr) = @_;
	    eval q($attr  &void $name &_ARB_REMOVE_COLOR(\'struct name\' * &head, \'struct type\' * &parent, \'struct type\' * &elm) { \'struct type\' * &tmp;  &while (( &elm ==  &NULL ||  &ARB_COLOR( &elm, $field) ==  &ARB_BLACK)  &&  &elm !=  &ARB_ROOT( &head)) {  &if ( &ARB_LEFT( &head,  &parent, $field) ==  &elm) {  &tmp =  &ARB_RIGHT( &head,  &parent, $field);  &if ( &ARB_COLOR( &tmp, $field) ==  &ARB_RED) {  &ARB_SET_BLACKRED( &tmp,  &parent, $field);  &ARB_ROTATE_LEFT( &head,  &parent,  &tmp, $field);  &tmp =  &ARB_RIGHT( &head,  &parent, $field); }  &if (( &ARB_LEFT( &head,  &tmp, $field) ==  &NULL ||  &ARB_COLOR( &ARB_LEFT( &head,  &tmp, $field), $field) ==  &ARB_BLACK)  && ( &ARB_RIGHT( &head,  &tmp, $field) ==  &NULL ||  &ARB_COLOR( &ARB_RIGHT( &head,  &tmp, $field), $field) ==  &ARB_BLACK)) {  &ARB_COLOR( &tmp, $field) =  &ARB_RED;  &elm =  &parent;  &parent =  &ARB_PARENT( &head,  &elm, $field); }  &else {  &if ( &ARB_RIGHT( &head,  &tmp, $field) ==  &NULL ||  &ARB_COLOR( &ARB_RIGHT( &head,  &tmp, $field), $field) ==  &ARB_BLACK) { \'struct type\' * &oleft;  &if (( &oleft =  &ARB_LEFT( &head,  &tmp, $field)) !=  &NULL)  &ARB_COLOR( &oleft, $field) =  &ARB_BLACK;  &ARB_COLOR( &tmp, $field) =  &ARB_RED;  &ARB_ROTATE_RIGHT( &head,  &tmp,  &oleft, $field);  &tmp =  &ARB_RIGHT( &head,  &parent, $field); }  &ARB_COLOR( &tmp, $field) =  &ARB_COLOR( &parent, $field);  &ARB_COLOR( &parent, $field) =  &ARB_BLACK;  &if ( &ARB_RIGHT( &head,  &tmp, $field))  &ARB_COLOR( &ARB_RIGHT( &head,  &tmp, $field), $field) =  &ARB_BLACK;  &ARB_ROTATE_LEFT( &head,  &parent,  &tmp, $field);  &elm =  &ARB_ROOT( &head);  &break; } }  &else {  &tmp =  &ARB_LEFT( &head,  &parent, $field);  &if ( &ARB_COLOR( &tmp, $field) ==  &ARB_RED) {  &ARB_SET_BLACKRED( &tmp,  &parent, $field);  &ARB_ROTATE_RIGHT( &head,  &parent,  &tmp, $field);  &tmp =  &ARB_LEFT( &head,  &parent, $field); }  &if (( &ARB_LEFT( &head,  &tmp, $field) ==  &NULL ||  &ARB_COLOR( &ARB_LEFT( &head,  &tmp, $field), $field) ==  &ARB_BLACK)  && ( &ARB_RIGHT( &head,  &tmp, $field) ==  &NULL ||  &ARB_COLOR( &ARB_RIGHT( &head,  &tmp, $field), $field) ==  &ARB_BLACK)) {  &ARB_COLOR( &tmp, $field) =  &ARB_RED;  &elm =  &parent;  &parent =  &ARB_PARENT( &head,  &elm, $field); }  &else {  &if ( &ARB_LEFT( &head,  &tmp, $field) ==  &NULL ||  &ARB_COLOR( &ARB_LEFT( &head,  &tmp, $field), $field) ==  &ARB_BLACK) { \'struct type\' * &oright;  &if (( &oright =  &ARB_RIGHT( &head,  &tmp, $field)) !=  &NULL)  &ARB_COLOR( &oright, $field) =  &ARB_BLACK;  &ARB_COLOR( &tmp, $field) =  &ARB_RED;  &ARB_ROTATE_LEFT( &head,  &tmp,  &oright, $field);  &tmp =  &ARB_LEFT( &head,  &parent, $field); }  &ARB_COLOR( &tmp, $field) =  &ARB_COLOR( &parent, $field);  &ARB_COLOR( &parent, $field) =  &ARB_BLACK;  &if ( &ARB_LEFT( &head,  &tmp, $field))  &ARB_COLOR( &ARB_LEFT( &head,  &tmp, $field), $field) =  &ARB_BLACK;  &ARB_ROTATE_RIGHT( &head,  &parent,  &tmp, $field);  &elm =  &ARB_ROOT( &head);  &break; } } }  &if ( &elm)  &ARB_COLOR( &elm, $field) =  &ARB_BLACK; });
    }' unless defined(&ARB_GENERATE_REMOVE_COLOR);
    eval 'sub ARB_GENERATE_REMOVE {
        my($name, $type, $field, $attr) = @_;
	    eval q($attr \'struct type\' * $name &_ARB_REMOVE(\'struct name\' * &head, \'struct type\' * &elm) { \'struct type\' * &child, * &parent, * &old =  &elm; \'int\'  &color;  &if ( &ARB_LEFT( &head,  &elm, $field) ==  &NULL)  &child =  &ARB_RIGHT( &head,  &elm, $field);  &else  &if ( &ARB_RIGHT( &head,  &elm, $field) ==  &NULL)  &child =  &ARB_LEFT( &head,  &elm, $field);  &else { \'struct type\' * &left;  &elm =  &ARB_RIGHT( &head,  &elm, $field);  &while (( &left =  &ARB_LEFT( &head,  &elm, $field)) !=  &NULL)  &elm =  &left;  &child =  &ARB_RIGHT( &head,  &elm, $field);  &parent =  &ARB_PARENT( &head,  &elm, $field);  &color =  &ARB_COLOR( &elm, $field);  &if ( &child)  &ARB_PARENTIDX( &child, $field) =  &ARB_SELFIDX( &head,  &parent);  &if ( &parent) {  &if ( &ARB_LEFT( &head,  &parent, $field) ==  &elm)  &ARB_LEFTIDX( &parent, $field) =  &ARB_SELFIDX( &head,  &child);  &else  &ARB_RIGHTIDX( &parent, $field) =  &ARB_SELFIDX( &head,  &child);  &ARB_AUGMENT( &parent); }  &else  &ARB_ROOTIDX( &head) =  &ARB_SELFIDX( &head,  &child);  &if ( &ARB_PARENT( &head,  &elm, $field) ==  &old)  &parent =  &elm; ( &elm)->$field = ( &old)->$field;  &if ( &ARB_PARENT( &head,  &old, $field)) {  &if ( &ARB_LEFT( &head,  &ARB_PARENT( &head,  &old, $field), $field) ==  &old)  &ARB_LEFTIDX( &ARB_PARENT( &head,  &old, $field), $field) =  &ARB_SELFIDX( &head,  &elm);  &else  &ARB_RIGHTIDX( &ARB_PARENT( &head,  &old, $field), $field) =  &ARB_SELFIDX( &head,  &elm);  &ARB_AUGMENT( &ARB_PARENT( &head,  &old, $field)); }  &else  &ARB_ROOTIDX( &head) =  &ARB_SELFIDX( &head,  &elm);  &ARB_PARENTIDX( &ARB_LEFT( &head,  &old, $field), $field) =  &ARB_SELFIDX( &head,  &elm);  &if ( &ARB_RIGHT( &head,  &old, $field))  &ARB_PARENTIDX( &ARB_RIGHT( &head,  &old, $field), $field) =  &ARB_SELFIDX( &head,  &elm);  &if ( &parent) {  &left =  &parent;  &do {  &ARB_AUGMENT( &left); }  &while (( &left =  &ARB_PARENT( &head,  &left, $field)) !=  &NULL); }  &goto  &color; }  &parent =  &ARB_PARENT( &head,  &elm, $field);  &color =  &ARB_COLOR( &elm, $field);  &if ( &child)  &ARB_PARENTIDX( &child, $field) =  &ARB_SELFIDX( &head,  &parent);  &if ( &parent) {  &if ( &ARB_LEFT( &head,  &parent, $field) ==  &elm)  &ARB_LEFTIDX( &parent, $field) =  &ARB_SELFIDX( &head,  &child);  &else  &ARB_RIGHTIDX( &parent, $field) =  &ARB_SELFIDX( &head,  &child);  &ARB_AUGMENT( &parent); }  &else  &ARB_ROOTIDX( &head) =  &ARB_SELFIDX( &head,  &child);  &color:  &if ( &color ==  &ARB_BLACK) $name &_ARB_REMOVE_COLOR( &head,  &parent,  &child);  &ARB_CURNODES( &head) -= 1;  &if ( &ARB_MINIDX( &head) ==  &ARB_SELFIDX( &head,  &old))  &ARB_MINIDX( &head) =  &ARB_PARENTIDX( &old, $field);  &if ( &ARB_MAXIDX( &head) ==  &ARB_SELFIDX( &head,  &old))  &ARB_MAXIDX( &head) =  &ARB_PARENTIDX( &old, $field);  &ARB_RETURNFREE( &head,  &old, $field);  &return ( &old); });
    }' unless defined(&ARB_GENERATE_REMOVE);
    eval 'sub ARB_GENERATE_INSERT {
        my($name, $type, $field, $cmp, $attr) = @_;
	    eval q($attr \'struct type\' * $name &_ARB_INSERT(\'struct name\' * &head, \'struct type\' * &elm) { \'struct type\' * &tmp; \'struct type\' * &parent =  &NULL; \'int\'  &comp = 0;  &tmp =  &ARB_ROOT( &head);  &while ( &tmp) {  &parent =  &tmp;  &comp = ($cmp)( &elm,  &parent);  &if ( &comp < 0)  &tmp =  &ARB_LEFT( &head,  &tmp, $field);  &else  &if ( &comp > 0)  &tmp =  &ARB_RIGHT( &head,  &tmp, $field);  &else  &return ( &tmp); }  &ARB_SET( &head,  &elm,  &parent, $field);  &if ( &parent !=  &NULL) {  &if ( &comp < 0)  &ARB_LEFTIDX( &parent, $field) =  &ARB_SELFIDX( &head,  &elm);  &else  &ARB_RIGHTIDX( &parent, $field) =  &ARB_SELFIDX( &head,  &elm);  &ARB_AUGMENT( &parent); }  &else  &ARB_ROOTIDX( &head) =  &ARB_SELFIDX( &head,  &elm); $name &_ARB_INSERT_COLOR( &head,  &elm);  &ARB_CURNODES( &head) += 1;  &if ( &ARB_MINIDX( &head) ==  &ARB_NULLIDX || ( &ARB_PARENTIDX( &elm, $field) ==  &ARB_MINIDX( &head)  &&  &ARB_LEFTIDX( &parent, $field) ==  &ARB_SELFIDX( &head,  &elm)))  &ARB_MINIDX( &head) =  &ARB_SELFIDX( &head,  &elm);  &if ( &ARB_MAXIDX( &head) ==  &ARB_NULLIDX || ( &ARB_PARENTIDX( &elm, $field) ==  &ARB_MAXIDX( &head)  &&  &ARB_RIGHTIDX( &parent, $field) ==  &ARB_SELFIDX( &head,  &elm)))  &ARB_MAXIDX( &head) =  &ARB_SELFIDX( &head,  &elm);  &return ( &NULL); });
    }' unless defined(&ARB_GENERATE_INSERT);
    eval 'sub ARB_GENERATE_CFIND {
        my($name, $type, $field, $cmp, $attr) = @_;
	    eval q($attr  &const \'struct type\' * $name &_ARB_CFIND( &const \'struct name\' * &head,  &const \'struct type\' * &elm) {  &const \'struct type\' * &tmp =  &ARB_ROOT( &head); \'int\'  &comp;  &while ( &tmp) {  &comp = $cmp( &elm,  &tmp);  &if ( &comp < 0)  &tmp =  &ARB_LEFT( &head,  &tmp, $field);  &else  &if ( &comp > 0)  &tmp =  &ARB_RIGHT( &head,  &tmp, $field);  &else  &return ( &tmp); }  &return ( &NULL); });
    }' unless defined(&ARB_GENERATE_CFIND);
    eval 'sub ARB_GENERATE_FIND {
        my($name, $type, $field, $cmp, $attr) = @_;
	    eval q($attr \'struct type\' * $name &_ARB_FIND( &const \'struct name\' * &head,  &const \'struct type\' * &elm) {  &return ( &__DECONST(\'struct type\' *, $name &_ARB_CFIND( &head,  &elm))); });
    }' unless defined(&ARB_GENERATE_FIND);
    eval 'sub ARB_GENERATE_CNFIND {
        my($name, $type, $field, $cmp, $attr) = @_;
	    eval q($attr  &const \'struct type\' * $name &_ARB_CNFIND( &const \'struct name\' * &head,  &const \'struct type\' * &elm) {  &const \'struct type\' * &tmp =  &ARB_ROOT( &head);  &const \'struct type\' * &res =  &NULL; \'int\'  &comp;  &while ( &tmp) {  &comp = $cmp( &elm,  &tmp);  &if ( &comp < 0) {  &res =  &tmp;  &tmp =  &ARB_LEFT( &head,  &tmp, $field); }  &else  &if ( &comp > 0)  &tmp =  &ARB_RIGHT( &head,  &tmp, $field);  &else  &return ( &tmp); }  &return ( &res); });
    }' unless defined(&ARB_GENERATE_CNFIND);
    eval 'sub ARB_GENERATE_NFIND {
        my($name, $type, $field, $cmp, $attr) = @_;
	    eval q($attr \'struct type\' * $name &_ARB_NFIND( &const \'struct name\' * &head,  &const \'struct type\' * &elm) {  &return ( &__DECONST(\'struct type\' *, $name &_ARB_CNFIND( &head,  &elm))); });
    }' unless defined(&ARB_GENERATE_NFIND);
    eval 'sub ARB_GENERATE_CNEXT {
        my($name, $type, $field, $attr) = @_;
	    eval q($attr  &const \'struct type\' * $name &_ARB_CNEXT( &const \'struct name\' * &head,  &const \'struct type\' * &elm) {  &if ( &ARB_RIGHT( &head,  &elm, $field)) {  &elm =  &ARB_RIGHT( &head,  &elm, $field);  &while ( &ARB_LEFT( &head,  &elm, $field))  &elm =  &ARB_LEFT( &head,  &elm, $field); }  &else {  &if ( &ARB_PARENT( &head,  &elm, $field)  && ( &elm ==  &ARB_LEFT( &head,  &ARB_PARENT( &head,  &elm, $field), $field)))  &elm =  &ARB_PARENT( &head,  &elm, $field);  &else {  &while ( &ARB_PARENT( &head,  &elm, $field)  && ( &elm ==  &ARB_RIGHT( &head,  &ARB_PARENT( &head,  &elm, $field), $field)))  &elm =  &ARB_PARENT( &head,  &elm, $field);  &elm =  &ARB_PARENT( &head,  &elm, $field); } }  &return ( &elm); });
    }' unless defined(&ARB_GENERATE_CNEXT);
    eval 'sub ARB_GENERATE_NEXT {
        my($name, $type, $field, $attr) = @_;
	    eval q($attr \'struct type\' * $name &_ARB_NEXT( &const \'struct name\' * &head,  &const \'struct type\' * &elm) {  &return ( &__DECONST(\'struct type\' *, $name &_ARB_CNEXT( &head,  &elm))); });
    }' unless defined(&ARB_GENERATE_NEXT);
    eval 'sub ARB_GENERATE_CPREV {
        my($name, $type, $field, $attr) = @_;
	    eval q($attr  &const \'struct type\' * $name &_ARB_CPREV( &const \'struct name\' * &head,  &const \'struct type\' * &elm) {  &if ( &ARB_LEFT( &head,  &elm, $field)) {  &elm =  &ARB_LEFT( &head,  &elm, $field);  &while ( &ARB_RIGHT( &head,  &elm, $field))  &elm =  &ARB_RIGHT( &head,  &elm, $field); }  &else {  &if ( &ARB_PARENT( &head,  &elm, $field)  && ( &elm ==  &ARB_RIGHT( &head,  &ARB_PARENT( &head,  &elm, $field), $field)))  &elm =  &ARB_PARENT( &head,  &elm, $field);  &else {  &while ( &ARB_PARENT( &head,  &elm, $field)  && ( &elm ==  &ARB_LEFT( &head,  &ARB_PARENT( &head,  &elm, $field), $field)))  &elm =  &ARB_PARENT( &head,  &elm, $field);  &elm =  &ARB_PARENT( &head,  &elm, $field); } }  &return ( &elm); });
    }' unless defined(&ARB_GENERATE_CPREV);
    eval 'sub ARB_GENERATE_PREV {
        my($name, $type, $field, $attr) = @_;
	    eval q($attr \'struct type\' * $name &_ARB_PREV( &const \'struct name\' * &head,  &const \'struct type\' * &elm) {  &return ( &__DECONST(\'struct type\' *, $name &_ARB_CPREV( &head,  &elm))); });
    }' unless defined(&ARB_GENERATE_PREV);
    eval 'sub ARB_GENERATE_CMINMAX {
        my($name, $type, $field, $attr) = @_;
	    eval q($attr  &const \'struct type\' * $name &_ARB_CMINMAX( &const \'struct name\' * &head, \'int\'  &val) {  &const \'struct type\' * &tmp =  &ARB_EMPTY( &head) ?  &NULL :  &ARB_ROOT( &head);  &const \'struct type\' * &parent =  &NULL;  &while ( &tmp) {  &parent =  &tmp;  &if ( &val < 0)  &tmp =  &ARB_LEFT( &head,  &tmp, $field);  &else  &tmp =  &ARB_RIGHT( &head,  &tmp, $field); }  &return ( &__DECONST(\'struct type\' *,  &parent)); });
    }' unless defined(&ARB_GENERATE_CMINMAX);
    eval 'sub ARB_GENERATE_MINMAX {
        my($name, $type, $field, $attr) = @_;
	    eval q($attr \'struct type\' * $name &_ARB_MINMAX( &const \'struct name\' * &head, \'int\'  &val) {  &return ( &__DECONST(\'struct type\' *, $name &_ARB_CMINMAX( &head,  &val))); });
    }' unless defined(&ARB_GENERATE_MINMAX);
    eval 'sub ARB_GENERATE_REINSERT {
        my($name, $type, $field, $cmp, $attr) = @_;
	    eval q($attr \'struct type\' * $name &_ARB_REINSERT(\'struct name\' * &head, \'struct type\' * &elm) { \'struct type\' * &cmpelm;  &if ((( &cmpelm =  &ARB_PREV($name,  &head,  &elm)) !=  &NULL  && ($cmp)( &cmpelm,  &elm) >= 0) || (( &cmpelm =  &ARB_NEXT($name,  &head,  &elm)) !=  &NULL  && ($cmp)( &elm,  &cmpelm) >= 0)) {  &ARB_REMOVE($name,  &head,  &elm);  &elm =  &ARB_GETFREE( &head, $field);  &return ( &ARB_INSERT($name,  &head,  &elm)); }  &return ( &NULL); });
    }' unless defined(&ARB_GENERATE_REINSERT);
    eval 'sub ARB_INSERT {
        my($name, $x, $y) = @_;
	    eval q($name &_ARB_INSERT($x, $y));
    }' unless defined(&ARB_INSERT);
    eval 'sub ARB_REMOVE {
        my($name, $x, $y) = @_;
	    eval q($name &_ARB_REMOVE($x, $y));
    }' unless defined(&ARB_REMOVE);
    eval 'sub ARB_CFIND {
        my($name, $x, $y) = @_;
	    eval q($name &_ARB_CFIND($x, $y));
    }' unless defined(&ARB_CFIND);
    eval 'sub ARB_FIND {
        my($name, $x, $y) = @_;
	    eval q($name &_ARB_FIND($x, $y));
    }' unless defined(&ARB_FIND);
    eval 'sub ARB_CNFIND {
        my($name, $x, $y) = @_;
	    eval q($name &_ARB_CNFIND($x, $y));
    }' unless defined(&ARB_CNFIND);
    eval 'sub ARB_NFIND {
        my($name, $x, $y) = @_;
	    eval q($name &_ARB_NFIND($x, $y));
    }' unless defined(&ARB_NFIND);
    eval 'sub ARB_CNEXT {
        my($name, $x, $y) = @_;
	    eval q($name &_ARB_CNEXT($x, $y));
    }' unless defined(&ARB_CNEXT);
    eval 'sub ARB_NEXT {
        my($name, $x, $y) = @_;
	    eval q($name &_ARB_NEXT($x, $y));
    }' unless defined(&ARB_NEXT);
    eval 'sub ARB_CPREV {
        my($name, $x, $y) = @_;
	    eval q($name &_ARB_CPREV($x, $y));
    }' unless defined(&ARB_CPREV);
    eval 'sub ARB_PREV {
        my($name, $x, $y) = @_;
	    eval q($name &_ARB_PREV($x, $y));
    }' unless defined(&ARB_PREV);
    eval 'sub ARB_CMIN {
        my($name, $x) = @_;
	    eval q(( &ARB_MINIDX($x) ==  &ARB_NULLIDX ? $name &_ARB_CMINMAX($x,  &ARB_NEGINF) :  &ARB_CNODE($x,  &ARB_MINIDX($x))));
    }' unless defined(&ARB_CMIN);
    eval 'sub ARB_MIN {
        my($name, $x) = @_;
	    eval q(( &ARB_MINIDX($x) ==  &ARB_NULLIDX ? $name &_ARB_MINMAX($x,  &ARB_NEGINF) :  &ARB_NODE($x,  &ARB_MINIDX($x))));
    }' unless defined(&ARB_MIN);
    eval 'sub ARB_CMAX {
        my($name, $x) = @_;
	    eval q(( &ARB_MAXIDX($x) ==  &ARB_NULLIDX ? $name &_ARB_CMINMAX($x,  &ARB_INF) :  &ARB_CNODE($x,  &ARB_MAXIDX($x))));
    }' unless defined(&ARB_CMAX);
    eval 'sub ARB_MAX {
        my($name, $x) = @_;
	    eval q(( &ARB_MAXIDX($x) ==  &ARB_NULLIDX ? $name &_ARB_MINMAX($x,  &ARB_INF) :  &ARB_NODE($x,  &ARB_MAXIDX($x))));
    }' unless defined(&ARB_MAX);
    eval 'sub ARB_REINSERT {
        my($name, $x, $y) = @_;
	    eval q($name &_ARB_REINSERT($x, $y));
    }' unless defined(&ARB_REINSERT);
    eval 'sub ARB_FOREACH {
        my($x, $name, $head) = @_;
	    eval q( &for (($x) =  &ARB_MIN($name, $head); ($x) !=  &NULL; ($x) = $name &_ARB_NEXT($head, $x)));
    }' unless defined(&ARB_FOREACH);
    eval 'sub ARB_FOREACH_FROM {
        my($x, $name, $y) = @_;
	    eval q( &for (($x) = ($y); (($x) !=  &NULL)  && (($y) = $name &_ARB_NEXT($x), ($x) !=  &NULL); ($x) = ($y)));
    }' unless defined(&ARB_FOREACH_FROM);
    eval 'sub ARB_FOREACH_SAFE {
        my($x, $name, $head, $y) = @_;
	    eval q( &for (($x) =  &ARB_MIN($name, $head); (($x) !=  &NULL)  && (($y) = $name &_ARB_NEXT($x), ($x) !=  &NULL); ($x) = ($y)));
    }' unless defined(&ARB_FOREACH_SAFE);
    eval 'sub ARB_FOREACH_REVERSE {
        my($x, $name, $head) = @_;
	    eval q( &for (($x) =  &ARB_MAX($name, $head); ($x) !=  &NULL; ($x) = $name &_ARB_PREV($x)));
    }' unless defined(&ARB_FOREACH_REVERSE);
    eval 'sub ARB_FOREACH_REVERSE_FROM {
        my($x, $name, $y) = @_;
	    eval q( &for (($x) = ($y); (($x) !=  &NULL)  && (($y) = $name &_ARB_PREV($x), ($x) !=  &NULL); ($x) = ($y)));
    }' unless defined(&ARB_FOREACH_REVERSE_FROM);
    eval 'sub ARB_FOREACH_REVERSE_SAFE {
        my($x, $name, $head, $y) = @_;
	    eval q( &for (($x) =  &ARB_MAX($name, $head); (($x) !=  &NULL)  && (($y) = $name &_ARB_PREV($x), ($x) !=  &NULL); ($x) = ($y)));
    }' unless defined(&ARB_FOREACH_REVERSE_SAFE);
    eval 'sub ARB_ARRFOREACH {
        my($x, $field, $head) = @_;
	    eval q( &for (($x) =  &ARB_NODES($head);  &ARB_SELFIDX($head, $x) <  &ARB_MAXNODES($head); ($x)++));
    }' unless defined(&ARB_ARRFOREACH);
    eval 'sub ARB_ARRFOREACH_REVWCOND {
        my($x, $field, $head, $extracond) = @_;
	    eval q( &for (($x) =  &ARB_NODES($head) + ( &ARB_MAXNODES($head) - 1); ($x) >=  &ARB_NODES($head)  && ($extracond); ($x)--));
    }' unless defined(&ARB_ARRFOREACH_REVWCOND);
    eval 'sub ARB_ARRFOREACH_REVERSE {
        my($x, $field, $head) = @_;
	    eval q( &ARB_ARRFOREACH_REVWCOND($x, $field, $head, 1));
    }' unless defined(&ARB_ARRFOREACH_REVERSE);
    eval 'sub ARB_RESET_TREE {
        my($head, $name, $maxn) = @_;
	    eval q(*($head) =  &ARB_INITIALIZER($name, $maxn));
    }' unless defined(&ARB_RESET_TREE);
}
1;

require '_h2ph_pre.ph';

no warnings qw(redefine misc);

unless(defined(&_SYS_TREE_H_)) {
    eval 'sub _SYS_TREE_H_ () {1;}' unless defined(&_SYS_TREE_H_);
    require 'sys/cdefs.ph';
    eval 'sub SPLAY_HEAD {
        my($name, $type) = @_;
	    eval q(\'struct name\' { \'struct type\' * &sph_root; });
    }' unless defined(&SPLAY_HEAD);
    eval 'sub SPLAY_INITIALIZER {
        my($root) = @_;
	    eval q({  &NULL });
    }' unless defined(&SPLAY_INITIALIZER);
    eval 'sub SPLAY_INIT {
        my($root) = @_;
	    eval q( &do { ($root)-> &sph_root =  &NULL; }  &while ( 0));
    }' unless defined(&SPLAY_INIT);
    eval 'sub SPLAY_ENTRY {
        my($type) = @_;
	    eval q(\'struct struct\' { \'struct type\' * &spe_left; \'struct type\' * &spe_right; });
    }' unless defined(&SPLAY_ENTRY);
    eval 'sub SPLAY_LEFT {
        my($elm, $field) = @_;
	    eval q(($elm)-> ($field->{spe_left}));
    }' unless defined(&SPLAY_LEFT);
    eval 'sub SPLAY_RIGHT {
        my($elm, $field) = @_;
	    eval q(($elm)-> ($field->{spe_right}));
    }' unless defined(&SPLAY_RIGHT);
    eval 'sub SPLAY_ROOT {
        my($head) = @_;
	    eval q(($head)-> &sph_root);
    }' unless defined(&SPLAY_ROOT);
    eval 'sub SPLAY_EMPTY {
        my($head) = @_;
	    eval q(( &SPLAY_ROOT($head) ==  &NULL));
    }' unless defined(&SPLAY_EMPTY);
    eval 'sub SPLAY_ROTATE_RIGHT {
        my($head, $tmp, $field) = @_;
	    eval q( &do {  &SPLAY_LEFT(($head)-> &sph_root, $field) =  &SPLAY_RIGHT($tmp, $field);  &SPLAY_RIGHT($tmp, $field) = ($head)-> &sph_root; ($head)-> &sph_root = $tmp; }  &while ( 0));
    }' unless defined(&SPLAY_ROTATE_RIGHT);
    eval 'sub SPLAY_ROTATE_LEFT {
        my($head, $tmp, $field) = @_;
	    eval q( &do {  &SPLAY_RIGHT(($head)-> &sph_root, $field) =  &SPLAY_LEFT($tmp, $field);  &SPLAY_LEFT($tmp, $field) = ($head)-> &sph_root; ($head)-> &sph_root = $tmp; }  &while ( 0));
    }' unless defined(&SPLAY_ROTATE_LEFT);
    eval 'sub SPLAY_LINKLEFT {
        my($head, $tmp, $field) = @_;
	    eval q( &do {  &SPLAY_LEFT($tmp, $field) = ($head)-> &sph_root; $tmp = ($head)-> &sph_root; ($head)-> &sph_root =  &SPLAY_LEFT(($head)-> &sph_root, $field); }  &while ( 0));
    }' unless defined(&SPLAY_LINKLEFT);
    eval 'sub SPLAY_LINKRIGHT {
        my($head, $tmp, $field) = @_;
	    eval q( &do {  &SPLAY_RIGHT($tmp, $field) = ($head)-> &sph_root; $tmp = ($head)-> &sph_root; ($head)-> &sph_root =  &SPLAY_RIGHT(($head)-> &sph_root, $field); }  &while ( 0));
    }' unless defined(&SPLAY_LINKRIGHT);
    eval 'sub SPLAY_ASSEMBLE {
        my($head, $node, $left, $right, $field) = @_;
	    eval q( &do {  &SPLAY_RIGHT($left, $field) =  &SPLAY_LEFT(($head)-> &sph_root, $field);  &SPLAY_LEFT($right, $field) =  &SPLAY_RIGHT(($head)-> &sph_root, $field);  &SPLAY_LEFT(($head)-> &sph_root, $field) =  &SPLAY_RIGHT($node, $field);  &SPLAY_RIGHT(($head)-> &sph_root, $field) =  &SPLAY_LEFT($node, $field); }  &while ( 0));
    }' unless defined(&SPLAY_ASSEMBLE);
    eval 'sub SPLAY_PROTOTYPE {
        my($name, $type, $field, $cmp) = @_;
	    eval q( &void $name &_SPLAY(\'struct name\' *, \'struct type\' *);  &void $name &_SPLAY_MINMAX(\'struct name\' *, \'int\'); \'struct type\' *$name &_SPLAY_INSERT(\'struct name\' *, \'struct type\' *); \'struct type\' *$name &_SPLAY_REMOVE(\'struct name\' *, \'struct type\' *);  &static  &__unused  &__inline \'struct type\' * $name &_SPLAY_FIND(\'struct name\' * &head, \'struct type\' * &elm) {  &if ( &SPLAY_EMPTY( &head))  &return( &NULL); $name &_SPLAY( &head,  &elm);  &if (($cmp)( &elm, ( &head)-> &sph_root) == 0)  &return ( ($head->{sph_root}));  &return ( &NULL); }  &static  &__unused  &__inline \'struct type\' * $name &_SPLAY_NEXT(\'struct name\' * &head, \'struct type\' * &elm) { $name &_SPLAY( &head,  &elm);  &if ( &SPLAY_RIGHT( &elm, $field) !=  &NULL) {  &elm =  &SPLAY_RIGHT( &elm, $field);  &while ( &SPLAY_LEFT( &elm, $field) !=  &NULL) {  &elm =  &SPLAY_LEFT( &elm, $field); } }  &else  &elm =  &NULL;  &return ( &elm); }  &static  &__unused  &__inline \'struct type\' * $name &_SPLAY_MIN_MAX(\'struct name\' * &head, \'int\'  &val) { $name &_SPLAY_MINMAX( &head,  &val);  &return ( &SPLAY_ROOT( &head)); });
    }' unless defined(&SPLAY_PROTOTYPE);
    eval 'sub SPLAY_GENERATE {
        my($name, $type, $field, $cmp) = @_;
	    eval q(\'struct type\' * $name &_SPLAY_INSERT(\'struct name\' * &head, \'struct type\' * &elm) {  &if ( &SPLAY_EMPTY( &head)) {  &SPLAY_LEFT( &elm, $field) =  &SPLAY_RIGHT( &elm, $field) =  &NULL; }  &else {  &__typeof($cmp( &NULL,  &NULL))  &__comp; $name &_SPLAY( &head,  &elm);  &__comp = ($cmp)( &elm, ( &head)-> &sph_root);  &if ( &__comp < 0) {  &SPLAY_LEFT( &elm, $field) =  &SPLAY_LEFT(( &head)-> &sph_root, $field);  &SPLAY_RIGHT( &elm, $field) = ( &head)-> &sph_root;  &SPLAY_LEFT(( &head)-> &sph_root, $field) =  &NULL; }  &else  &if ( &__comp > 0) {  &SPLAY_RIGHT( &elm, $field) =  &SPLAY_RIGHT(( &head)-> &sph_root, $field);  &SPLAY_LEFT( &elm, $field) = ( &head)-> &sph_root;  &SPLAY_RIGHT(( &head)-> &sph_root, $field) =  &NULL; }  &else  &return (( &head)-> &sph_root); } ( &head)-> &sph_root = ( &elm);  &return ( &NULL); } \'struct type\' * $name &_SPLAY_REMOVE(\'struct name\' * &head, \'struct type\' * &elm) { \'struct type\' * &__tmp;  &if ( &SPLAY_EMPTY( &head))  &return ( &NULL); $name &_SPLAY( &head,  &elm);  &if (($cmp)( &elm, ( &head)-> &sph_root) == 0) {  &if ( &SPLAY_LEFT(( &head)-> &sph_root, $field) ==  &NULL) { ( &head)-> &sph_root =  &SPLAY_RIGHT(( &head)-> &sph_root, $field); }  &else {  &__tmp =  &SPLAY_RIGHT(( &head)-> &sph_root, $field); ( &head)-> &sph_root =  &SPLAY_LEFT(( &head)-> &sph_root, $field); $name &_SPLAY( &head,  &elm);  &SPLAY_RIGHT(( &head)-> &sph_root, $field) =  &__tmp; }  &return ( &elm); }  &return ( &NULL); }  &void $name &_SPLAY(\'struct name\' * &head, \'struct type\' * &elm) { \'struct type\'  &__node, * &__left, * &__right, * &__tmp;  &__typeof($cmp( &NULL,  &NULL))  &__comp;  &SPLAY_LEFT(& &__node, $field) =  &SPLAY_RIGHT(& &__node, $field) =  &NULL;  &__left =  &__right = & &__node;  &while (( &__comp = ($cmp)( &elm, ( &head)-> &sph_root)) != 0) {  &if ( &__comp < 0) {  &__tmp =  &SPLAY_LEFT(( &head)-> &sph_root, $field);  &if ( &__tmp ==  &NULL)  &break;  &if (($cmp)( &elm,  &__tmp) < 0){  &SPLAY_ROTATE_RIGHT( &head,  &__tmp, $field);  &if ( &SPLAY_LEFT(( &head)-> &sph_root, $field) ==  &NULL)  &break; }  &SPLAY_LINKLEFT( &head,  &__right, $field); }  &else  &if ( &__comp > 0) {  &__tmp =  &SPLAY_RIGHT(( &head)-> &sph_root, $field);  &if ( &__tmp ==  &NULL)  &break;  &if (($cmp)( &elm,  &__tmp) > 0){  &SPLAY_ROTATE_LEFT( &head,  &__tmp, $field);  &if ( &SPLAY_RIGHT(( &head)-> &sph_root, $field) ==  &NULL)  &break; }  &SPLAY_LINKRIGHT( &head,  &__left, $field); } }  &SPLAY_ASSEMBLE( &head, & &__node,  &__left,  &__right, $field); }  &void $name &_SPLAY_MINMAX(\'struct name\' * &head, \'int\'  &__comp) { \'struct type\'  &__node, * &__left, * &__right, * &__tmp;  &SPLAY_LEFT(& &__node, $field) =  &SPLAY_RIGHT(& &__node, $field) =  &NULL;  &__left =  &__right = & &__node;  &while (1) {  &if ( &__comp < 0) {  &__tmp =  &SPLAY_LEFT(( &head)-> &sph_root, $field);  &if ( &__tmp ==  &NULL)  &break;  &if ( &__comp < 0){  &SPLAY_ROTATE_RIGHT( &head,  &__tmp, $field);  &if ( &SPLAY_LEFT(( &head)-> &sph_root, $field) ==  &NULL)  &break; }  &SPLAY_LINKLEFT( &head,  &__right, $field); }  &else  &if ( &__comp > 0) {  &__tmp =  &SPLAY_RIGHT(( &head)-> &sph_root, $field);  &if ( &__tmp ==  &NULL)  &break;  &if ( &__comp > 0) {  &SPLAY_ROTATE_LEFT( &head,  &__tmp, $field);  &if ( &SPLAY_RIGHT(( &head)-> &sph_root, $field) ==  &NULL)  &break; }  &SPLAY_LINKRIGHT( &head,  &__left, $field); } }  &SPLAY_ASSEMBLE( &head, & &__node,  &__left,  &__right, $field); });
    }' unless defined(&SPLAY_GENERATE);
    eval 'sub SPLAY_NEGINF () {-1;}' unless defined(&SPLAY_NEGINF);
    eval 'sub SPLAY_INF () {1;}' unless defined(&SPLAY_INF);
    eval 'sub SPLAY_INSERT {
        my($name, $x, $y) = @_;
	    eval q($name &_SPLAY_INSERT($x, $y));
    }' unless defined(&SPLAY_INSERT);
    eval 'sub SPLAY_REMOVE {
        my($name, $x, $y) = @_;
	    eval q($name &_SPLAY_REMOVE($x, $y));
    }' unless defined(&SPLAY_REMOVE);
    eval 'sub SPLAY_FIND {
        my($name, $x, $y) = @_;
	    eval q($name &_SPLAY_FIND($x, $y));
    }' unless defined(&SPLAY_FIND);
    eval 'sub SPLAY_NEXT {
        my($name, $x, $y) = @_;
	    eval q($name &_SPLAY_NEXT($x, $y));
    }' unless defined(&SPLAY_NEXT);
    eval 'sub SPLAY_MIN {
        my($name, $x) = @_;
	    eval q(( &SPLAY_EMPTY($x) ?  &NULL : $name &_SPLAY_MIN_MAX($x,  &SPLAY_NEGINF)));
    }' unless defined(&SPLAY_MIN);
    eval 'sub SPLAY_MAX {
        my($name, $x) = @_;
	    eval q(( &SPLAY_EMPTY($x) ?  &NULL : $name &_SPLAY_MIN_MAX($x,  &SPLAY_INF)));
    }' unless defined(&SPLAY_MAX);
    eval 'sub SPLAY_FOREACH {
        my($x, $name, $head) = @_;
	    eval q( &for (($x) =  &SPLAY_MIN($name, $head); ($x) !=  &NULL; ($x) =  &SPLAY_NEXT($name, $head, $x)));
    }' unless defined(&SPLAY_FOREACH);
    eval 'sub RB_HEAD {
        my($name, $type) = @_;
	    eval q(\'struct name\' { \'struct type\' * &rbh_root; });
    }' unless defined(&RB_HEAD);
    eval 'sub RB_INITIALIZER {
        my($root) = @_;
	    eval q({  &NULL });
    }' unless defined(&RB_INITIALIZER);
    eval 'sub RB_INIT {
        my($root) = @_;
	    eval q( &do { ($root)-> &rbh_root =  &NULL; }  &while ( 0));
    }' unless defined(&RB_INIT);
    eval 'sub RB_ENTRY {
        my($type) = @_;
	    eval q(\'struct struct\' { \'struct type\' * $rbe_link[3]; });
    }' unless defined(&RB_ENTRY);
    eval 'sub _RB_LINK {
        my($elm, $dir, $field) = @_;
	    eval q(($elm)-> ($field->{rbe_link[$dir]}));
    }' unless defined(&_RB_LINK);
    eval 'sub _RB_UP {
        my($elm, $field) = @_;
	    eval q( &_RB_LINK($elm, 0, $field));
    }' unless defined(&_RB_UP);
    eval 'sub _RB_L () {(( &__uintptr_t)1);}' unless defined(&_RB_L);
    eval 'sub _RB_R () {(( &__uintptr_t)2);}' unless defined(&_RB_R);
    eval 'sub _RB_LR () {(( &__uintptr_t)3);}' unless defined(&_RB_LR);
    eval 'sub _RB_BITS {
        my($elm) = @_;
	    eval q((*( &__uintptr_t *)$elm));
    }' unless defined(&_RB_BITS);
    eval 'sub _RB_BITSUP {
        my($elm, $field) = @_;
	    eval q( &_RB_BITS( &_RB_UP($elm, $field)));
    }' unless defined(&_RB_BITSUP);
    eval 'sub _RB_PTR {
        my($elm) = @_;
	    eval q(( &__typeof($elm)) (( &__uintptr_t)$elm & ~ &_RB_LR));
    }' unless defined(&_RB_PTR);
    eval 'sub RB_PARENT {
        my($elm, $field) = @_;
	    eval q( &_RB_PTR( &_RB_UP($elm, $field)));
    }' unless defined(&RB_PARENT);
    eval 'sub RB_LEFT {
        my($elm, $field) = @_;
	    eval q( &_RB_LINK($elm,  &_RB_L, $field));
    }' unless defined(&RB_LEFT);
    eval 'sub RB_RIGHT {
        my($elm, $field) = @_;
	    eval q( &_RB_LINK($elm,  &_RB_R, $field));
    }' unless defined(&RB_RIGHT);
    eval 'sub RB_ROOT {
        my($head) = @_;
	    eval q(($head)-> &rbh_root);
    }' unless defined(&RB_ROOT);
    eval 'sub RB_EMPTY {
        my($head) = @_;
	    eval q(( &RB_ROOT($head) ==  &NULL));
    }' unless defined(&RB_EMPTY);
    eval 'sub RB_SET_PARENT {
        my($dst, $src, $field) = @_;
	    eval q( &do {  &_RB_BITSUP($dst, $field) = ( &__uintptr_t)$src | ( &_RB_BITSUP($dst, $field) &  &_RB_LR); }  &while ( 0));
    }' unless defined(&RB_SET_PARENT);
    eval 'sub RB_SET {
        my($elm, $parent, $field) = @_;
	    eval q( &do {  &_RB_UP($elm, $field) = $parent;  &RB_LEFT($elm, $field) =  &RB_RIGHT($elm, $field) =  &NULL; }  &while ( 0));
    }' unless defined(&RB_SET);
    unless(defined(&RB_AUGMENT_CHECK)) {
	unless(defined(&RB_AUGMENT)) {
	    eval 'sub RB_AUGMENT_CHECK {
	        my($x) = @_;
    		eval q(0);
	    }' unless defined(&RB_AUGMENT_CHECK);
	} else {
	    eval 'sub RB_AUGMENT_CHECK {
	        my($x) = @_;
    		eval q(( &RB_AUGMENT($x), 1));
	    }' unless defined(&RB_AUGMENT_CHECK);
	}
    }
    eval 'sub RB_UPDATE_AUGMENT {
        my($elm, $field) = @_;
	    eval q( &do {  &__typeof($elm)  &rb_update_tmp = ($elm);  &while ( &RB_AUGMENT_CHECK( &rb_update_tmp)  && ( &rb_update_tmp =  &RB_PARENT( &rb_update_tmp, $field)) !=  &NULL) ; }  &while (0));
    }' unless defined(&RB_UPDATE_AUGMENT);
    eval 'sub RB_SWAP_CHILD {
        my($head, $par, $out, $in, $field) = @_;
	    eval q( &do {  &if ($par ==  &NULL)  &RB_ROOT($head) = ($in);  &else  &if (($out) ==  &RB_LEFT($par, $field))  &RB_LEFT($par, $field) = ($in);  &else  &RB_RIGHT($par, $field) = ($in); }  &while ( 0));
    }' unless defined(&RB_SWAP_CHILD);
    eval 'sub RB_ROTATE {
        my($elm, $tmp, $dir, $field) = @_;
	    eval q( &do {  &if (( &_RB_LINK($elm, $dir ^  &_RB_LR, $field) =  &_RB_LINK($tmp, $dir, $field)) !=  &NULL)  &RB_SET_PARENT( &_RB_LINK($tmp, $dir, $field), $elm, $field);  &_RB_LINK($tmp, $dir, $field) = ($elm);  &RB_SET_PARENT($elm, $tmp, $field); }  &while ( 0));
    }' unless defined(&RB_ROTATE);
    eval 'sub RB_PROTOTYPE {
        my($name, $type, $field, $cmp) = @_;
	    eval q( &RB_PROTOTYPE_INTERNAL($name, $type, $field, $cmp,));
    }' unless defined(&RB_PROTOTYPE);
    eval 'sub RB_PROTOTYPE_STATIC {
        my($name, $type, $field, $cmp) = @_;
	    eval q( &RB_PROTOTYPE_INTERNAL($name, $type, $field, $cmp,  &__unused  &static));
    }' unless defined(&RB_PROTOTYPE_STATIC);
    eval 'sub RB_PROTOTYPE_INTERNAL {
        my($name, $type, $field, $cmp, $attr) = @_;
	    eval q( &RB_PROTOTYPE_RANK($name, $type, $attr)  &RB_PROTOTYPE_INSERT_COLOR($name, $type, $attr);  &RB_PROTOTYPE_REMOVE_COLOR($name, $type, $attr);  &RB_PROTOTYPE_INSERT_FINISH($name, $type, $attr);  &RB_PROTOTYPE_INSERT($name, $type, $attr);  &RB_PROTOTYPE_REMOVE($name, $type, $attr);  &RB_PROTOTYPE_FIND($name, $type, $attr);  &RB_PROTOTYPE_NFIND($name, $type, $attr);  &RB_PROTOTYPE_NEXT($name, $type, $attr);  &RB_PROTOTYPE_INSERT_NEXT($name, $type, $attr);  &RB_PROTOTYPE_PREV($name, $type, $attr);  &RB_PROTOTYPE_INSERT_PREV($name, $type, $attr);  &RB_PROTOTYPE_MINMAX($name, $type, $attr);  &RB_PROTOTYPE_REINSERT($name, $type, $attr););
    }' unless defined(&RB_PROTOTYPE_INTERNAL);
    if(defined(&_RB_DIAGNOSTIC)) {
	eval 'sub RB_PROTOTYPE_RANK {
	    my($name, $type, $attr) = @_;
    	    eval q($attr \'int\' $name &_RB_RANK;);
	}' unless defined(&RB_PROTOTYPE_RANK);
    } else {
	eval 'sub RB_PROTOTYPE_RANK {
	    my($name, $type, $attr) = @_;
    	    eval q();
	}' unless defined(&RB_PROTOTYPE_RANK);
    }
    eval 'sub RB_PROTOTYPE_INSERT_COLOR {
        my($name, $type, $attr) = @_;
	    eval q($attr \'struct type\' *$name &_RB_INSERT_COLOR(\'struct name\' *, \'struct type\' *, \'struct type\' *));
    }' unless defined(&RB_PROTOTYPE_INSERT_COLOR);
    eval 'sub RB_PROTOTYPE_REMOVE_COLOR {
        my($name, $type, $attr) = @_;
	    eval q($attr \'struct type\' *$name &_RB_REMOVE_COLOR(\'struct name\' *, \'struct type\' *, \'struct type\' *));
    }' unless defined(&RB_PROTOTYPE_REMOVE_COLOR);
    eval 'sub RB_PROTOTYPE_REMOVE {
        my($name, $type, $attr) = @_;
	    eval q($attr \'struct type\' *$name &_RB_REMOVE(\'struct name\' *, \'struct type\' *));
    }' unless defined(&RB_PROTOTYPE_REMOVE);
    eval 'sub RB_PROTOTYPE_INSERT_FINISH {
        my($name, $type, $attr) = @_;
	    eval q($attr \'struct type\' *$name &_RB_INSERT_FINISH(\'struct name\' *, \'struct type\' *, \'struct type\' **, \'struct type\' *));
    }' unless defined(&RB_PROTOTYPE_INSERT_FINISH);
    eval 'sub RB_PROTOTYPE_INSERT {
        my($name, $type, $attr) = @_;
	    eval q($attr \'struct type\' *$name &_RB_INSERT(\'struct name\' *, \'struct type\' *));
    }' unless defined(&RB_PROTOTYPE_INSERT);
    eval 'sub RB_PROTOTYPE_FIND {
        my($name, $type, $attr) = @_;
	    eval q($attr \'struct type\' *$name &_RB_FIND(\'struct name\' *, \'struct type\' *));
    }' unless defined(&RB_PROTOTYPE_FIND);
    eval 'sub RB_PROTOTYPE_NFIND {
        my($name, $type, $attr) = @_;
	    eval q($attr \'struct type\' *$name &_RB_NFIND(\'struct name\' *, \'struct type\' *));
    }' unless defined(&RB_PROTOTYPE_NFIND);
    eval 'sub RB_PROTOTYPE_NEXT {
        my($name, $type, $attr) = @_;
	    eval q($attr \'struct type\' *$name &_RB_NEXT);
    }' unless defined(&RB_PROTOTYPE_NEXT);
    eval 'sub RB_PROTOTYPE_INSERT_NEXT {
        my($name, $type, $attr) = @_;
	    eval q($attr \'struct type\' *$name &_RB_INSERT_NEXT(\'struct name\' *, \'struct type\' *, \'struct type\' *));
    }' unless defined(&RB_PROTOTYPE_INSERT_NEXT);
    eval 'sub RB_PROTOTYPE_PREV {
        my($name, $type, $attr) = @_;
	    eval q($attr \'struct type\' *$name &_RB_PREV);
    }' unless defined(&RB_PROTOTYPE_PREV);
    eval 'sub RB_PROTOTYPE_INSERT_PREV {
        my($name, $type, $attr) = @_;
	    eval q($attr \'struct type\' *$name &_RB_INSERT_PREV(\'struct name\' *, \'struct type\' *, \'struct type\' *));
    }' unless defined(&RB_PROTOTYPE_INSERT_PREV);
    eval 'sub RB_PROTOTYPE_MINMAX {
        my($name, $type, $attr) = @_;
	    eval q($attr \'struct type\' *$name &_RB_MINMAX(\'struct name\' *, \'int\'));
    }' unless defined(&RB_PROTOTYPE_MINMAX);
    eval 'sub RB_PROTOTYPE_REINSERT {
        my($name, $type, $attr) = @_;
	    eval q($attr \'struct type\' *$name &_RB_REINSERT(\'struct name\' *, \'struct type\' *));
    }' unless defined(&RB_PROTOTYPE_REINSERT);
    eval 'sub RB_GENERATE {
        my($name, $type, $field, $cmp) = @_;
	    eval q( &RB_GENERATE_INTERNAL($name, $type, $field, $cmp,));
    }' unless defined(&RB_GENERATE);
    eval 'sub RB_GENERATE_STATIC {
        my($name, $type, $field, $cmp) = @_;
	    eval q( &RB_GENERATE_INTERNAL($name, $type, $field, $cmp,  &__unused  &static));
    }' unless defined(&RB_GENERATE_STATIC);
    eval 'sub RB_GENERATE_INTERNAL {
        my($name, $type, $field, $cmp, $attr) = @_;
	    eval q( &RB_GENERATE_RANK($name, $type, $field, $attr)  &RB_GENERATE_INSERT_COLOR($name, $type, $field, $attr)  &RB_GENERATE_REMOVE_COLOR($name, $type, $field, $attr)  &RB_GENERATE_INSERT_FINISH($name, $type, $field, $attr)  &RB_GENERATE_INSERT($name, $type, $field, $cmp, $attr)  &RB_GENERATE_REMOVE($name, $type, $field, $attr)  &RB_GENERATE_FIND($name, $type, $field, $cmp, $attr)  &RB_GENERATE_NFIND($name, $type, $field, $cmp, $attr)  &RB_GENERATE_NEXT($name, $type, $field, $attr)  &RB_GENERATE_INSERT_NEXT($name, $type, $field, $cmp, $attr)  &RB_GENERATE_PREV($name, $type, $field, $attr)  &RB_GENERATE_INSERT_PREV($name, $type, $field, $cmp, $attr)  &RB_GENERATE_MINMAX($name, $type, $field, $attr)  &RB_GENERATE_REINSERT($name, $type, $field, $cmp, $attr));
    }' unless defined(&RB_GENERATE_INTERNAL);
    if(defined(&_RB_DIAGNOSTIC)) {
	unless(defined(&RB_AUGMENT)) {
	    eval 'sub _RB_AUGMENT_VERIFY {
	        my($x) = @_;
    		eval q( &RB_AUGMENT_CHECK($x));
	    }' unless defined(&_RB_AUGMENT_VERIFY);
	} else {
	    eval 'sub _RB_AUGMENT_VERIFY {
	        my($x) = @_;
    		eval q(0);
	    }' unless defined(&_RB_AUGMENT_VERIFY);
	}
	eval 'sub RB_GENERATE_RANK {
	    my($name, $type, $field, $attr) = @_;
    	    eval q($attr \'int\' $name &_RB_RANK(\'struct type\' * &elm) { \'struct type\' * &left, * &right, * &up; \'int\'  &left_rank,  &right_rank;  &if ( &elm ==  &NULL)  &return (0);  &up =  &_RB_UP( &elm, $field);  &left =  &RB_LEFT( &elm, $field);  &left_rank = (( &_RB_BITS( &up) &  &_RB_L) ? 2: 1) + $name &_RB_RANK( &left);  &right =  &RB_RIGHT( &elm, $field);  &right_rank = (( &_RB_BITS( &up) &  &_RB_R) ? 2: 1) + $name &_RB_RANK( &right);  &if ( &left_rank !=  &right_rank || ( &left_rank == 2 &&  &left ==  &NULL  &&  &right ==  &NULL) ||  &_RB_AUGMENT_VERIFY( &elm))  &return (-1);  &return ( &left_rank); });
	}' unless defined(&RB_GENERATE_RANK);
    } else {
	eval 'sub RB_GENERATE_RANK {
	    my($name, $type, $field, $attr) = @_;
    	    eval q();
	}' unless defined(&RB_GENERATE_RANK);
    }
    eval 'sub RB_GENERATE_INSERT_COLOR {
        my($name, $type, $field, $attr) = @_;
	    eval q($attr \'struct type\' * $name &_RB_INSERT_COLOR(\'struct name\' * &head, \'struct type\' * &parent, \'struct type\' * &elm) { \'struct type\' * &child, * &child_up, * &gpar;  &__uintptr_t  &elmdir,  &sibdir;  &do {  &gpar =  &_RB_UP( &parent, $field);  &elmdir =  &RB_RIGHT( &parent, $field) ==  &elm ?  &_RB_R :  &_RB_L;  &if ( &_RB_BITS( &gpar) &  &elmdir) {  &_RB_BITSUP( &parent, $field) ^=  &elmdir;  &return ( &NULL); }  &sibdir =  &elmdir ^  &_RB_LR;  &_RB_BITSUP( &parent, $field) ^=  &sibdir;  &if (( &_RB_BITS( &gpar) &  &_RB_LR) == 0) {  &child =  &elm;  &elm =  &parent;  &continue; }  &_RB_UP( &parent, $field) =  &gpar =  &_RB_PTR( &gpar);  &if ( &_RB_BITSUP( &elm, $field) &  &elmdir) {  &RB_ROTATE( &elm,  &child,  &elmdir, $field);  &child_up =  &_RB_UP( &child, $field);  &if ( &_RB_BITS( &child_up) &  &sibdir)  &_RB_BITSUP( &parent, $field) ^=  &elmdir;  &if ( &_RB_BITS( &child_up) &  &elmdir)  &_RB_BITSUP( &elm, $field) ^=  &_RB_LR;  &else  &_RB_BITSUP( &elm, $field) ^=  &elmdir;  &if (( &_RB_BITS( &child_up) &  &_RB_LR) == 0)  &elm =  &child; }  &else  &child =  &elm;  &RB_ROTATE( &parent,  &child,  &sibdir, $field);  &_RB_UP( &child, $field) =  &gpar;  &RB_SWAP_CHILD( &head,  &gpar,  &parent,  &child, $field);  &if ( &elm !=  &child) ( &void) &RB_AUGMENT_CHECK( &elm); ( &void) &RB_AUGMENT_CHECK( &parent);  &return ( &child); }  &while (( &parent =  &gpar) !=  &NULL);  &return ( &NULL); });
    }' unless defined(&RB_GENERATE_INSERT_COLOR);
    unless(defined(&RB_STRICT_HST)) {
	eval 'sub RB_STRICT_HST () {0;}' unless defined(&RB_STRICT_HST);
    }
    eval 'sub RB_GENERATE_REMOVE_COLOR {
        my($name, $type, $field, $attr) = @_;
	    eval q($attr \'struct type\' * $name &_RB_REMOVE_COLOR(\'struct name\' * &head, \'struct type\' * &parent, \'struct type\' * &elm) { \'struct type\' * &gpar, * &sib, * &up;  &__uintptr_t  &elmdir,  &sibdir;  &if ( &RB_RIGHT( &parent, $field) ==  &elm  &&  &RB_LEFT( &parent, $field) ==  &elm) {  &_RB_UP( &parent, $field) =  &_RB_PTR( &_RB_UP( &parent, $field));  &elm =  &parent;  &if (( &parent =  &_RB_UP( &elm, $field)) ==  &NULL)  &return ( &NULL); }  &do {  &gpar =  &_RB_UP( &parent, $field);  &elmdir =  &RB_RIGHT( &parent, $field) ==  &elm ?  &_RB_R :  &_RB_L;  &_RB_BITS( &gpar) ^=  &elmdir;  &if ( &_RB_BITS( &gpar) &  &elmdir) {  &_RB_UP( &parent, $field) =  &gpar;  &return ( &NULL); }  &if ( &_RB_BITS( &gpar) &  &_RB_LR) {  &_RB_BITS( &gpar) ^=  &_RB_LR;  &_RB_UP( &parent, $field) =  &gpar;  &gpar =  &_RB_PTR( &gpar);  &continue; }  &sibdir =  &elmdir ^  &_RB_LR;  &sib =  &_RB_LINK( &parent,  &sibdir, $field);  &up =  &_RB_UP( &sib, $field);  &_RB_BITS( &up) ^=  &_RB_LR;  &if (( &_RB_BITS( &up) &  &_RB_LR) == 0) {  &_RB_UP( &sib, $field) =  &up;  &continue; }  &if (( &_RB_BITS( &up) &  &sibdir) == 0) {  &elm =  &_RB_LINK( &sib,  &elmdir, $field);  &RB_ROTATE( &sib,  &elm,  &sibdir, $field);  &up =  &_RB_UP( &elm, $field);  &_RB_BITSUP( &parent, $field) ^= ( &_RB_BITS( &up) &  &elmdir) ?  &_RB_LR :  &elmdir;  &_RB_BITSUP( &sib, $field) ^= ( &_RB_BITS( &up) &  &sibdir) ?  &_RB_LR :  &sibdir;  &_RB_BITSUP( &elm, $field) |=  &_RB_LR; }  &else {  &if (( &_RB_BITS( &up) &  &elmdir) == 0 &&  &RB_STRICT_HST  &&  &elm !=  &NULL) {  &_RB_BITSUP( &parent, $field) ^=  &sibdir;  &_RB_BITSUP( &sib, $field) ^=  &_RB_LR; }  &else  &if (( &_RB_BITS( &up) &  &elmdir) == 0) {  &_RB_BITSUP( &parent, $field) ^=  &elmdir;  &_RB_BITSUP( &sib, $field) ^=  &sibdir; }  &else  &_RB_BITSUP( &sib, $field) ^=  &sibdir;  &elm =  &sib; }  &RB_ROTATE( &parent,  &elm,  &elmdir, $field);  &RB_SET_PARENT( &elm,  &gpar, $field);  &RB_SWAP_CHILD( &head,  &gpar,  &parent,  &elm, $field);  &if ( &sib !=  &elm) ( &void) &RB_AUGMENT_CHECK( &sib);  &return ( &parent); }  &while ( &elm =  &parent, ( &parent =  &gpar) !=  &NULL);  &return ( &NULL); });
    }' unless defined(&RB_GENERATE_REMOVE_COLOR);
    eval 'sub _RB_AUGMENT_WALK {
        my($elm, $match, $field) = @_;
	    eval q( &do {  &if ($match == $elm) $match =  &NULL; }  &while ( &RB_AUGMENT_CHECK($elm)  && ($elm =  &RB_PARENT($elm, $field)) !=  &NULL));
    }' unless defined(&_RB_AUGMENT_WALK);
    eval 'sub RB_GENERATE_REMOVE {
        my($name, $type, $field, $attr) = @_;
	    eval q($attr \'struct type\' * $name &_RB_REMOVE(\'struct name\' * &head, \'struct type\' * &out) { \'struct type\' * &child, * &in, * &opar, * &parent;  &child =  &RB_LEFT( &out, $field);  &in =  &RB_RIGHT( &out, $field);  &opar =  &_RB_UP( &out, $field);  &if ( &in ==  &NULL ||  &child ==  &NULL) {  &in =  &child = ( &in ==  &NULL ?  &child :  &in);  &parent =  &opar =  &_RB_PTR( &opar); }  &else {  &parent =  &in;  &while ( &RB_LEFT( &in, $field))  &in =  &RB_LEFT( &in, $field);  &RB_SET_PARENT( &child,  &in, $field);  &RB_LEFT( &in, $field) =  &child;  &child =  &RB_RIGHT( &in, $field);  &if ( &parent !=  &in) {  &RB_SET_PARENT( &parent,  &in, $field);  &RB_RIGHT( &in, $field) =  &parent;  &parent =  &RB_PARENT( &in, $field);  &RB_LEFT( &parent, $field) =  &child; }  &_RB_UP( &in, $field) =  &opar;  &opar =  &_RB_PTR( &opar); }  &RB_SWAP_CHILD( &head,  &opar,  &out,  &in, $field);  &if ( &child !=  &NULL)  &_RB_UP( &child, $field) =  &parent;  &if ( &parent !=  &NULL) {  &opar = $name &_RB_REMOVE_COLOR( &head,  &parent,  &child);  &if ( &parent ==  &in  &&  &RB_LEFT( &parent, $field) ==  &NULL) {  &opar =  &NULL;  &parent =  &RB_PARENT( &parent, $field); }  &_RB_AUGMENT_WALK( &parent,  &opar, $field);  &if ( &opar !=  &NULL) { ( &void) &RB_AUGMENT_CHECK( &opar); ( &void) &RB_AUGMENT_CHECK( &RB_PARENT( &opar, $field)); } }  &return ( &out); });
    }' unless defined(&RB_GENERATE_REMOVE);
    eval 'sub RB_GENERATE_INSERT_FINISH {
        my($name, $type, $field, $attr) = @_;
	    eval q($attr \'struct type\' * $name &_RB_INSERT_FINISH(\'struct name\' * &head, \'struct type\' * &parent, \'struct type\' ** &pptr, \'struct type\' * &elm) { \'struct type\' * &tmp =  &NULL;  &RB_SET( &elm,  &parent, $field); * &pptr =  &elm;  &if ( &parent !=  &NULL)  &tmp = $name &_RB_INSERT_COLOR( &head,  &parent,  &elm);  &_RB_AUGMENT_WALK( &elm,  &tmp, $field);  &if ( &tmp !=  &NULL) ( &void) &RB_AUGMENT_CHECK( &tmp);  &return ( &NULL); });
    }' unless defined(&RB_GENERATE_INSERT_FINISH);
    eval 'sub RB_GENERATE_INSERT {
        my($name, $type, $field, $cmp, $attr) = @_;
	    eval q($attr \'struct type\' * $name &_RB_INSERT(\'struct name\' * &head, \'struct type\' * &elm) { \'struct type\' * &tmp; \'struct type\' ** &tmpp =  &RB_ROOT( &head); \'struct type\' * &parent =  &NULL;  &while (( &tmp = * &tmpp) !=  &NULL) {  &parent =  &tmp;  &__typeof($cmp( &NULL,  &NULL))  &comp = ($cmp)( &elm,  &parent);  &if ( &comp < 0)  &tmpp =  &RB_LEFT( &parent, $field);  &else  &if ( &comp > 0)  &tmpp =  &RB_RIGHT( &parent, $field);  &else  &return ( &parent); }  &return ($name &_RB_INSERT_FINISH( &head,  &parent,  &tmpp,  &elm)); });
    }' unless defined(&RB_GENERATE_INSERT);
    eval 'sub RB_GENERATE_FIND {
        my($name, $type, $field, $cmp, $attr) = @_;
	    eval q($attr \'struct type\' * $name &_RB_FIND(\'struct name\' * &head, \'struct type\' * &elm) { \'struct type\' * &tmp =  &RB_ROOT( &head);  &__typeof($cmp( &NULL,  &NULL))  &comp;  &while ( &tmp) {  &comp = $cmp( &elm,  &tmp);  &if ( &comp < 0)  &tmp =  &RB_LEFT( &tmp, $field);  &else  &if ( &comp > 0)  &tmp =  &RB_RIGHT( &tmp, $field);  &else  &return ( &tmp); }  &return ( &NULL); });
    }' unless defined(&RB_GENERATE_FIND);
    eval 'sub RB_GENERATE_NFIND {
        my($name, $type, $field, $cmp, $attr) = @_;
	    eval q($attr \'struct type\' * $name &_RB_NFIND(\'struct name\' * &head, \'struct type\' * &elm) { \'struct type\' * &tmp =  &RB_ROOT( &head); \'struct type\' * &res =  &NULL;  &__typeof($cmp( &NULL,  &NULL))  &comp;  &while ( &tmp) {  &comp = $cmp( &elm,  &tmp);  &if ( &comp < 0) {  &res =  &tmp;  &tmp =  &RB_LEFT( &tmp, $field); }  &else  &if ( &comp > 0)  &tmp =  &RB_RIGHT( &tmp, $field);  &else  &return ( &tmp); }  &return ( &res); });
    }' unless defined(&RB_GENERATE_NFIND);
    eval 'sub RB_GENERATE_NEXT {
        my($name, $type, $field, $attr) = @_;
	    eval q($attr \'struct type\' * $name &_RB_NEXT(\'struct type\' * &elm) {  &if ( &RB_RIGHT( &elm, $field)) {  &elm =  &RB_RIGHT( &elm, $field);  &while ( &RB_LEFT( &elm, $field))  &elm =  &RB_LEFT( &elm, $field); }  &else {  &while ( &RB_PARENT( &elm, $field)  && ( &elm ==  &RB_RIGHT( &RB_PARENT( &elm, $field), $field)))  &elm =  &RB_PARENT( &elm, $field);  &elm =  &RB_PARENT( &elm, $field); }  &return ( &elm); });
    }' unless defined(&RB_GENERATE_NEXT);
    if(defined(&_KERNEL)  && defined(&DIAGNOSTIC)) {
	eval 'sub _RB_ORDER_CHECK {
	    my($cmp, $lo, $hi) = @_;
    	    eval q( &do {  &KASSERT(($cmp)($lo, $hi) < 0, (\\"out of order insertion\\")); }  &while (0));
	}' unless defined(&_RB_ORDER_CHECK);
    } else {
	eval 'sub _RB_ORDER_CHECK {
	    my($cmp, $lo, $hi) = @_;
    	    eval q( &do {}  &while (0));
	}' unless defined(&_RB_ORDER_CHECK);
    }
    eval 'sub RB_GENERATE_INSERT_NEXT {
        my($name, $type, $field, $cmp, $attr) = @_;
	    eval q($attr \'struct type\' * $name &_RB_INSERT_NEXT(\'struct name\' * &head, \'struct type\' * &elm, \'struct type\' * &next) { \'struct type\' * &tmp; \'struct type\' ** &tmpp =  &RB_RIGHT( &elm, $field);  &_RB_ORDER_CHECK($cmp,  &elm,  &next);  &if ($name &_RB_NEXT( &elm) !=  &NULL)  &_RB_ORDER_CHECK($cmp,  &next, $name &_RB_NEXT( &elm));  &while (( &tmp = * &tmpp) !=  &NULL) {  &elm =  &tmp;  &tmpp =  &RB_LEFT( &elm, $field); }  &return ($name &_RB_INSERT_FINISH( &head,  &elm,  &tmpp,  &next)); });
    }' unless defined(&RB_GENERATE_INSERT_NEXT);
    eval 'sub RB_GENERATE_PREV {
        my($name, $type, $field, $attr) = @_;
	    eval q($attr \'struct type\' * $name &_RB_PREV(\'struct type\' * &elm) {  &if ( &RB_LEFT( &elm, $field)) {  &elm =  &RB_LEFT( &elm, $field);  &while ( &RB_RIGHT( &elm, $field))  &elm =  &RB_RIGHT( &elm, $field); }  &else {  &while ( &RB_PARENT( &elm, $field)  && ( &elm ==  &RB_LEFT( &RB_PARENT( &elm, $field), $field)))  &elm =  &RB_PARENT( &elm, $field);  &elm =  &RB_PARENT( &elm, $field); }  &return ( &elm); });
    }' unless defined(&RB_GENERATE_PREV);
    eval 'sub RB_GENERATE_INSERT_PREV {
        my($name, $type, $field, $cmp, $attr) = @_;
	    eval q($attr \'struct type\' * $name &_RB_INSERT_PREV(\'struct name\' * &head, \'struct type\' * &elm, \'struct type\' * &prev) { \'struct type\' * &tmp; \'struct type\' ** &tmpp =  &RB_LEFT( &elm, $field);  &_RB_ORDER_CHECK($cmp,  &prev,  &elm);  &if ($name &_RB_PREV( &elm) !=  &NULL)  &_RB_ORDER_CHECK($cmp, $name &_RB_PREV( &elm),  &prev);  &while (( &tmp = * &tmpp) !=  &NULL) {  &elm =  &tmp;  &tmpp =  &RB_RIGHT( &elm, $field); }  &return ($name &_RB_INSERT_FINISH( &head,  &elm,  &tmpp,  &prev)); });
    }' unless defined(&RB_GENERATE_INSERT_PREV);
    eval 'sub RB_GENERATE_MINMAX {
        my($name, $type, $field, $attr) = @_;
	    eval q($attr \'struct type\' * $name &_RB_MINMAX(\'struct name\' * &head, \'int\'  &val) { \'struct type\' * &tmp =  &RB_ROOT( &head); \'struct type\' * &parent =  &NULL;  &while ( &tmp) {  &parent =  &tmp;  &if ( &val < 0)  &tmp =  &RB_LEFT( &tmp, $field);  &else  &tmp =  &RB_RIGHT( &tmp, $field); }  &return ( &parent); });
    }' unless defined(&RB_GENERATE_MINMAX);
    eval 'sub RB_GENERATE_REINSERT {
        my($name, $type, $field, $cmp, $attr) = @_;
	    eval q($attr \'struct type\' * $name &_RB_REINSERT(\'struct name\' * &head, \'struct type\' * &elm) { \'struct type\' * &cmpelm;  &if ((( &cmpelm =  &RB_PREV($name,  &head,  &elm)) !=  &NULL  && $cmp( &cmpelm,  &elm) >= 0) || (( &cmpelm =  &RB_NEXT($name,  &head,  &elm)) !=  &NULL  && $cmp( &elm,  &cmpelm) >= 0)) {  &RB_REMOVE($name,  &head,  &elm);  &return ( &RB_INSERT($name,  &head,  &elm)); }  &return ( &NULL); });
    }' unless defined(&RB_GENERATE_REINSERT);
    eval 'sub RB_NEGINF () {-1;}' unless defined(&RB_NEGINF);
    eval 'sub RB_INF () {1;}' unless defined(&RB_INF);
    eval 'sub RB_INSERT {
        my($name, $x, $y) = @_;
	    eval q($name &_RB_INSERT($x, $y));
    }' unless defined(&RB_INSERT);
    eval 'sub RB_INSERT_NEXT {
        my($name, $x, $y, $z) = @_;
	    eval q($name &_RB_INSERT_NEXT($x, $y, $z));
    }' unless defined(&RB_INSERT_NEXT);
    eval 'sub RB_INSERT_PREV {
        my($name, $x, $y, $z) = @_;
	    eval q($name &_RB_INSERT_PREV($x, $y, $z));
    }' unless defined(&RB_INSERT_PREV);
    eval 'sub RB_REMOVE {
        my($name, $x, $y) = @_;
	    eval q($name &_RB_REMOVE($x, $y));
    }' unless defined(&RB_REMOVE);
    eval 'sub RB_FIND {
        my($name, $x, $y) = @_;
	    eval q($name &_RB_FIND($x, $y));
    }' unless defined(&RB_FIND);
    eval 'sub RB_NFIND {
        my($name, $x, $y) = @_;
	    eval q($name &_RB_NFIND($x, $y));
    }' unless defined(&RB_NFIND);
    eval 'sub RB_NEXT {
        my($name, $x, $y) = @_;
	    eval q($name &_RB_NEXT($y));
    }' unless defined(&RB_NEXT);
    eval 'sub RB_PREV {
        my($name, $x, $y) = @_;
	    eval q($name &_RB_PREV($y));
    }' unless defined(&RB_PREV);
    eval 'sub RB_MIN {
        my($name, $x) = @_;
	    eval q($name &_RB_MINMAX($x,  &RB_NEGINF));
    }' unless defined(&RB_MIN);
    eval 'sub RB_MAX {
        my($name, $x) = @_;
	    eval q($name &_RB_MINMAX($x,  &RB_INF));
    }' unless defined(&RB_MAX);
    eval 'sub RB_REINSERT {
        my($name, $x, $y) = @_;
	    eval q($name &_RB_REINSERT($x, $y));
    }' unless defined(&RB_REINSERT);
    eval 'sub RB_FOREACH {
        my($x, $name, $head) = @_;
	    eval q( &for (($x) =  &RB_MIN($name, $head); ($x) !=  &NULL; ($x) = $name &_RB_NEXT($x)));
    }' unless defined(&RB_FOREACH);
    eval 'sub RB_FOREACH_FROM {
        my($x, $name, $y) = @_;
	    eval q( &for (($x) = ($y); (($x) !=  &NULL)  && (($y) = $name &_RB_NEXT($x), ($x) !=  &NULL); ($x) = ($y)));
    }' unless defined(&RB_FOREACH_FROM);
    eval 'sub RB_FOREACH_SAFE {
        my($x, $name, $head, $y) = @_;
	    eval q( &for (($x) =  &RB_MIN($name, $head); (($x) !=  &NULL)  && (($y) = $name &_RB_NEXT($x), ($x) !=  &NULL); ($x) = ($y)));
    }' unless defined(&RB_FOREACH_SAFE);
    eval 'sub RB_FOREACH_REVERSE {
        my($x, $name, $head) = @_;
	    eval q( &for (($x) =  &RB_MAX($name, $head); ($x) !=  &NULL; ($x) = $name &_RB_PREV($x)));
    }' unless defined(&RB_FOREACH_REVERSE);
    eval 'sub RB_FOREACH_REVERSE_FROM {
        my($x, $name, $y) = @_;
	    eval q( &for (($x) = ($y); (($x) !=  &NULL)  && (($y) = $name &_RB_PREV($x), ($x) !=  &NULL); ($x) = ($y)));
    }' unless defined(&RB_FOREACH_REVERSE_FROM);
    eval 'sub RB_FOREACH_REVERSE_SAFE {
        my($x, $name, $head, $y) = @_;
	    eval q( &for (($x) =  &RB_MAX($name, $head); (($x) !=  &NULL)  && (($y) = $name &_RB_PREV($x), ($x) !=  &NULL); ($x) = ($y)));
    }' unless defined(&RB_FOREACH_REVERSE_SAFE);
}
1;

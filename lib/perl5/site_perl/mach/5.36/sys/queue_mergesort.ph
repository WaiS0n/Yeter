require '_h2ph_pre.ph';

no warnings qw(redefine misc);

unless(defined(&_SYS_QUEUE_MERGESORT_H_)) {
    eval 'sub _SYS_QUEUE_MERGESORT_H_ () {1;}' unless defined(&_SYS_QUEUE_MERGESORT_H_);
    eval 'sub STAILQ_CONCAT_4 {
        my($head1, $head2, $type, $field) = @_;
	    eval q( &STAILQ_CONCAT($head1, $head2));
    }' unless defined(&STAILQ_CONCAT_4);
    eval 'sub TAILQ_CONCAT_4 {
        my($head1, $head2, $type, $field) = @_;
	    eval q( &TAILQ_CONCAT($head1, $head2, $field));
    }' unless defined(&TAILQ_CONCAT_4);
    eval 'sub SLIST_INSERT_AFTER_4 {
        my($head, $slistelm, $elm, $field) = @_;
	    eval q( &SLIST_INSERT_AFTER($slistelm, $elm, $field));
    }' unless defined(&SLIST_INSERT_AFTER_4);
    eval 'sub LIST_INSERT_AFTER_4 {
        my($head, $slistelm, $elm, $field) = @_;
	    eval q( &LIST_INSERT_AFTER($slistelm, $elm, $field));
    }' unless defined(&LIST_INSERT_AFTER_4);
    eval 'sub SYSQUEUE_MERGE {
        my($sqms_list1, $sqms_list2, $thunk, $sqms_cmp, $TYPE, $NAME,	    $M_FIRST, $M_INSERT_AFTER, $M_INSERT_HEAD, $M_NEXT, $M_REMOVE_HEAD) = @_;
	    eval q( &do { \'struct TYPE\' * &sqms_elm1; \'struct TYPE\' * &sqms_elm1_prev; \'struct TYPE\' * &sqms_elm2;  &sqms_elm1_prev =  &NULL;  &sqms_elm1 = $M_FIRST($sqms_list1);  &while (( &sqms_elm2 = $M_FIRST($sqms_list2)) !=  &NULL) { $M_REMOVE_HEAD($sqms_list2, $NAME);  &while (( &sqms_elm1 !=  &NULL)  && ($sqms_cmp)( &sqms_elm2,  &sqms_elm1, $thunk) >= 0) {  &sqms_elm1_prev =  &sqms_elm1;  &sqms_elm1 = $M_NEXT( &sqms_elm1, $NAME); }  &if ( &sqms_elm1_prev ==  &NULL) $M_INSERT_HEAD($sqms_list1,  &sqms_elm2, $NAME);  &else $M_INSERT_AFTER($sqms_list1,  &sqms_elm1_prev,  &sqms_elm2, $NAME);  &sqms_elm1_prev =  &sqms_elm2; } }  &while (0));
    }' unless defined(&SYSQUEUE_MERGE);
    eval 'sub SYSQUEUE_MERGE_SUBL {
        my($sqms_sorted, $sqms_len1, $sqms_len2, $sqms_melm,	    $sqms_mpos, $thunk, $sqms_cmp, $TYPE, $NAME,					    $M_FIRST, $M_NEXT, $M_REMOVE_HEAD, $M_INSERT_AFTER) = @_;
	    eval q( &do { \'struct TYPE\' * &sqms_curelm; \'size_t\'  &sqms_i;  &while (($sqms_mpos) < ($sqms_len1)) { ($sqms_melm) = $M_NEXT(($sqms_melm), $NAME); ($sqms_mpos)++; }  &for ( &sqms_i = 0;  &sqms_i < ($sqms_len1);  &sqms_i++) {  &sqms_curelm = $M_FIRST(($sqms_sorted));  &while ((($sqms_mpos) < ($sqms_len1) + ($sqms_len2))  && (($sqms_cmp)( &sqms_curelm, $M_NEXT(($sqms_melm), $NAME), $thunk) >= 0)) { ($sqms_melm) = $M_NEXT(($sqms_melm), $NAME); ($sqms_mpos)++; }  &if ( &sqms_curelm != ($sqms_melm)) { $M_REMOVE_HEAD(($sqms_sorted), $NAME); $M_INSERT_AFTER(($sqms_sorted), ($sqms_melm),  &sqms_curelm, $NAME); ($sqms_melm) =  &sqms_curelm; } } }  &while (0));
    }' unless defined(&SYSQUEUE_MERGE_SUBL);
    eval 'sub SYSQUEUE_MERGESORT {
        my($sqms_head, $thunk, $sqms_cmp, $TYPE, $NAME, $M_HEAD,	    $M_HEAD_INITIALIZER, $M_EMPTY, $M_FIRST, $M_NEXT, $M_INSERT_HEAD,		    $M_INSERT_AFTER, $M_CONCAT, $M_REMOVE_HEAD) = @_;
	    eval q( &do { $M_HEAD(, $TYPE)  &sqms_sorted = $M_HEAD_INITIALIZER( &sqms_sorted); \'struct TYPE\' * &sqms_elm; \'size_t\'  &sqms_slen = 0; \'size_t\'  &sqms_sortmask; \'size_t\'  &sqms_mpos;  &while (!$M_EMPTY($sqms_head)) {  &sqms_elm = $M_FIRST($sqms_head); $M_REMOVE_HEAD($sqms_head, $NAME); $M_INSERT_HEAD( &sqms_sorted,  &sqms_elm, $NAME);  &sqms_slen++;  &sqms_mpos = 1;  &for ( &sqms_sortmask = 1;  &sqms_sortmask & ~ &sqms_slen;  &sqms_sortmask <<= 1)  &SYSQUEUE_MERGE_SUBL( &sqms_sorted,  &sqms_sortmask,  &sqms_sortmask,  &sqms_elm,  &sqms_mpos, $thunk, $sqms_cmp, $TYPE, $NAME, $M_FIRST, $M_NEXT, $M_REMOVE_HEAD, $M_INSERT_AFTER); }  &sqms_elm = $M_FIRST( &sqms_sorted);  &sqms_mpos = 1;  &for ( &sqms_sortmask = 2;  &sqms_sortmask <  &sqms_slen;  &sqms_sortmask <<= 1)  &if ( &sqms_slen &  &sqms_sortmask)  &SYSQUEUE_MERGE_SUBL( &sqms_sorted,  &sqms_slen & ( &sqms_sortmask - 1),  &sqms_sortmask,  &sqms_elm,  &sqms_mpos, $thunk, $sqms_cmp, $TYPE, $NAME, $M_FIRST, $M_NEXT, $M_REMOVE_HEAD, $M_INSERT_AFTER); $M_CONCAT($sqms_head,  &sqms_sorted, $TYPE, $NAME); }  &while (0));
    }' unless defined(&SYSQUEUE_MERGESORT);
    eval 'sub SLIST_MERGESORT {
        my($head, $thunk, $cmp, $TYPE, $NAME) = @_;
	    eval q( &SYSQUEUE_MERGESORT(($head), ($thunk), ($cmp), $TYPE, $NAME,  &SLIST_HEAD,  &SLIST_HEAD_INITIALIZER,  &SLIST_EMPTY,  &SLIST_FIRST,  &SLIST_NEXT,  &SLIST_INSERT_HEAD,  &SLIST_INSERT_AFTER_4,  &SLIST_CONCAT,  &SLIST_REMOVE_HEAD));
    }' unless defined(&SLIST_MERGESORT);
    eval 'sub SLIST_MERGE {
        my($list1, $list2, $thunk, $cmp, $TYPE, $NAME) = @_;
	    eval q( &SYSQUEUE_MERGE(($list1), ($list2), ($thunk), ($cmp), $TYPE, $NAME,  &SLIST_FIRST,  &SLIST_INSERT_AFTER_4,  &SLIST_INSERT_HEAD,  &SLIST_NEXT,  &SLIST_REMOVE_HEAD));
    }' unless defined(&SLIST_MERGE);
    eval 'sub LIST_MERGESORT {
        my($head, $thunk, $cmp, $TYPE, $NAME) = @_;
	    eval q( &SYSQUEUE_MERGESORT(($head), ($thunk), ($cmp), $TYPE, $NAME,  &LIST_HEAD,  &LIST_HEAD_INITIALIZER,  &LIST_EMPTY,  &LIST_FIRST,  &LIST_NEXT,  &LIST_INSERT_HEAD,  &LIST_INSERT_AFTER_4,  &LIST_CONCAT,  &LIST_REMOVE_HEAD));
    }' unless defined(&LIST_MERGESORT);
    eval 'sub LIST_MERGE {
        my($list1, $list2, $thunk, $cmp, $TYPE, $NAME) = @_;
	    eval q( &SYSQUEUE_MERGE(($list1), ($list2), ($thunk), ($cmp), $TYPE, $NAME,  &LIST_FIRST,  &LIST_INSERT_AFTER_4,  &LIST_INSERT_HEAD,  &LIST_NEXT,  &LIST_REMOVE_HEAD));
    }' unless defined(&LIST_MERGE);
    eval 'sub STAILQ_MERGESORT {
        my($head, $thunk, $cmp, $TYPE, $NAME) = @_;
	    eval q( &SYSQUEUE_MERGESORT(($head), ($thunk), ($cmp), $TYPE, $NAME,  &STAILQ_HEAD,  &STAILQ_HEAD_INITIALIZER,  &STAILQ_EMPTY,  &STAILQ_FIRST,  &STAILQ_NEXT,  &STAILQ_INSERT_HEAD,  &STAILQ_INSERT_AFTER,  &STAILQ_CONCAT_4,  &STAILQ_REMOVE_HEAD));
    }' unless defined(&STAILQ_MERGESORT);
    eval 'sub STAILQ_MERGE {
        my($list1, $list2, $thunk, $cmp, $TYPE, $NAME) = @_;
	    eval q( &SYSQUEUE_MERGE(($list1), ($list2), ($thunk), ($cmp), $TYPE, $NAME,  &STAILQ_FIRST,  &STAILQ_INSERT_AFTER,  &STAILQ_INSERT_HEAD,  &STAILQ_NEXT,  &STAILQ_REMOVE_HEAD));
    }' unless defined(&STAILQ_MERGE);
    eval 'sub TAILQ_MERGESORT {
        my($head, $thunk, $cmp, $TYPE, $NAME) = @_;
	    eval q( &SYSQUEUE_MERGESORT(($head), ($thunk), ($cmp), $TYPE, $NAME,  &TAILQ_HEAD,  &TAILQ_HEAD_INITIALIZER,  &TAILQ_EMPTY,  &TAILQ_FIRST,  &TAILQ_NEXT,  &TAILQ_INSERT_HEAD,  &TAILQ_INSERT_AFTER,  &TAILQ_CONCAT_4,  &TAILQ_REMOVE_HEAD));
    }' unless defined(&TAILQ_MERGESORT);
    eval 'sub TAILQ_MERGE {
        my($list1, $list2, $thunk, $cmp, $TYPE, $NAME) = @_;
	    eval q( &SYSQUEUE_MERGE(($list1), ($list2), ($thunk), ($cmp), $TYPE, $NAME,  &TAILQ_FIRST,  &TAILQ_INSERT_AFTER,  &TAILQ_INSERT_HEAD,  &TAILQ_NEXT,  &TAILQ_REMOVE_HEAD));
    }' unless defined(&TAILQ_MERGE);
}
1;

require '_h2ph_pre.ph';

no warnings qw(redefine misc);

unless(defined(&_SYS_QUEUE_H_)) {
    eval 'sub _SYS_QUEUE_H_ () {1;}' unless defined(&_SYS_QUEUE_H_);
    require 'sys/cdefs.ph';
    if(defined(&QUEUE_MACRO_DEBUG)) {
	eval 'sub QUEUE_MACRO_DEBUG_TRACE () {1;}' unless defined(&QUEUE_MACRO_DEBUG_TRACE);
	eval 'sub QUEUE_MACRO_DEBUG_TRASH () {1;}' unless defined(&QUEUE_MACRO_DEBUG_TRASH);
    }
    if(defined(&QUEUE_MACRO_DEBUG_TRACE)) {
	eval 'sub TRACEBUF () {\'struct qm_trace\'  &trace;;}' unless defined(&TRACEBUF);
	eval 'sub TRACEBUF_INITIALIZER () {{  &__LINE__, 0,  &__FILE__,  &NULL } ,;}' unless defined(&TRACEBUF_INITIALIZER);
	eval 'sub QMD_TRACE_HEAD {
	    my($head) = @_;
    	    eval q( &do { ($head)-> ($trace->{prevline}) = ($head)-> ($trace->{lastline}); ($head)-> ($trace->{prevfile}) = ($head)-> ($trace->{lastfile}); ($head)-> ($trace->{lastline}) =  &__LINE__; ($head)-> ($trace->{lastfile}) =  &__FILE__; }  &while (0));
	}' unless defined(&QMD_TRACE_HEAD);
	eval 'sub QMD_TRACE_ELEM {
	    my($elem) = @_;
    	    eval q( &do { ($elem)-> ($trace->{prevline}) = ($elem)-> ($trace->{lastline}); ($elem)-> ($trace->{prevfile}) = ($elem)-> ($trace->{lastfile}); ($elem)-> ($trace->{lastline}) =  &__LINE__; ($elem)-> ($trace->{lastfile}) =  &__FILE__; }  &while (0));
	}' unless defined(&QMD_TRACE_ELEM);
    } else {
	eval 'sub QMD_TRACE_ELEM {
	    my($elem) = @_;
    	    eval q();
	}' unless defined(&QMD_TRACE_ELEM);
	eval 'sub QMD_TRACE_HEAD {
	    my($head) = @_;
    	    eval q();
	}' unless defined(&QMD_TRACE_HEAD);
	eval 'sub TRACEBUF () {1;}' unless defined(&TRACEBUF);
	eval 'sub TRACEBUF_INITIALIZER () {1;}' unless defined(&TRACEBUF_INITIALIZER);
    }
    if(defined(&QUEUE_MACRO_DEBUG_TRASH)) {
	eval 'sub QMD_SAVELINK {
	    my($name, $link) = @_;
    	    eval q( &void **$name = ( &void *)($link));
	}' unless defined(&QMD_SAVELINK);
	eval 'sub TRASHIT {
	    my($x) = @_;
    	    eval q( &do {($x) = ( &void *)-1;}  &while (0));
	}' unless defined(&TRASHIT);
	eval 'sub QMD_IS_TRASHED {
	    my($x) = @_;
    	    eval q((($x) == ( &void *)( &intptr_t)-1));
	}' unless defined(&QMD_IS_TRASHED);
    } else {
	eval 'sub QMD_SAVELINK {
	    my($name, $link) = @_;
    	    eval q();
	}' unless defined(&QMD_SAVELINK);
	eval 'sub TRASHIT {
	    my($x) = @_;
    	    eval q();
	}' unless defined(&TRASHIT);
	eval 'sub QMD_IS_TRASHED {
	    my($x) = @_;
    	    eval q(0);
	}' unless defined(&QMD_IS_TRASHED);
    }
    if(defined(&__cplusplus)) {
	eval 'sub QUEUE_TYPEOF {
	    my($type) = @_;
    	    eval q($type);
	}' unless defined(&QUEUE_TYPEOF);
    } else {
	eval 'sub QUEUE_TYPEOF {
	    my($type) = @_;
    	    eval q(\'struct type\');
	}' unless defined(&QUEUE_TYPEOF);
    }
    eval 'sub SLIST_HEAD {
        my($name, $type) = @_;
	    eval q(\'struct name\' { \'struct type\' * &slh_first; });
    }' unless defined(&SLIST_HEAD);
    eval 'sub SLIST_CLASS_HEAD {
        my($name, $type) = @_;
	    eval q(\'struct name\' {  &class $type * &slh_first; });
    }' unless defined(&SLIST_CLASS_HEAD);
    eval 'sub SLIST_HEAD_INITIALIZER {
        my($head) = @_;
	    eval q({  &NULL });
    }' unless defined(&SLIST_HEAD_INITIALIZER);
    eval 'sub SLIST_ENTRY {
        my($type) = @_;
	    eval q(\'struct struct\' { \'struct type\' * &sle_next; });
    }' unless defined(&SLIST_ENTRY);
    eval 'sub SLIST_CLASS_ENTRY {
        my($type) = @_;
	    eval q(\'struct struct\' {  &class $type * &sle_next; });
    }' unless defined(&SLIST_CLASS_ENTRY);
    if((defined(&_KERNEL)  && defined(&INVARIANTS))) {
	eval 'sub QMD_SLIST_CHECK_PREVPTR {
	    my($prevp, $elm) = @_;
    	    eval q( &do {  &if (*($prevp) != ($elm))  &panic(\\"Bad prevptr *(%p) == %p != %p\\", ($prevp), *($prevp), ($elm)); }  &while (0));
	}' unless defined(&QMD_SLIST_CHECK_PREVPTR);
    } else {
	eval 'sub QMD_SLIST_CHECK_PREVPTR {
	    my($prevp, $elm) = @_;
    	    eval q();
	}' unless defined(&QMD_SLIST_CHECK_PREVPTR);
    }
    eval 'sub SLIST_CONCAT {
        my($head1, $head2, $type, $field) = @_;
	    eval q( &do {  &QUEUE_TYPEOF($type) * &curelm =  &SLIST_FIRST($head1);  &if ( &curelm ==  &NULL) {  &if (( &SLIST_FIRST($head1) =  &SLIST_FIRST($head2)) !=  &NULL)  &SLIST_INIT($head2); }  &else  &if ( &SLIST_FIRST($head2) !=  &NULL) {  &while ( &SLIST_NEXT( &curelm, $field) !=  &NULL)  &curelm =  &SLIST_NEXT( &curelm, $field);  &SLIST_NEXT( &curelm, $field) =  &SLIST_FIRST($head2);  &SLIST_INIT($head2); } }  &while (0));
    }' unless defined(&SLIST_CONCAT);
    eval 'sub SLIST_EMPTY {
        my($head) = @_;
	    eval q((($head)-> &slh_first ==  &NULL));
    }' unless defined(&SLIST_EMPTY);
    eval 'sub SLIST_FIRST {
        my($head) = @_;
	    eval q((($head)-> &slh_first));
    }' unless defined(&SLIST_FIRST);
    eval 'sub SLIST_FOREACH {
        my($var, $head, $field) = @_;
	    eval q( &for (($var) =  &SLIST_FIRST(($head)); ($var); ($var) =  &SLIST_NEXT(($var), $field)));
    }' unless defined(&SLIST_FOREACH);
    eval 'sub SLIST_FOREACH_FROM {
        my($var, $head, $field) = @_;
	    eval q( &for (($var) = (($var) ? ($var) :  &SLIST_FIRST(($head))); ($var); ($var) =  &SLIST_NEXT(($var), $field)));
    }' unless defined(&SLIST_FOREACH_FROM);
    eval 'sub SLIST_FOREACH_SAFE {
        my($var, $head, $field, $tvar) = @_;
	    eval q( &for (($var) =  &SLIST_FIRST(($head)); ($var)  && (($tvar) =  &SLIST_NEXT(($var), $field), 1); ($var) = ($tvar)));
    }' unless defined(&SLIST_FOREACH_SAFE);
    eval 'sub SLIST_FOREACH_FROM_SAFE {
        my($var, $head, $field, $tvar) = @_;
	    eval q( &for (($var) = (($var) ? ($var) :  &SLIST_FIRST(($head))); ($var)  && (($tvar) =  &SLIST_NEXT(($var), $field), 1); ($var) = ($tvar)));
    }' unless defined(&SLIST_FOREACH_FROM_SAFE);
    eval 'sub SLIST_FOREACH_PREVPTR {
        my($var, $varp, $head, $field) = @_;
	    eval q( &for (($varp) =  &SLIST_FIRST(($head)); (($var) = *($varp)) !=  &NULL; ($varp) =  &SLIST_NEXT(($var), $field)));
    }' unless defined(&SLIST_FOREACH_PREVPTR);
    eval 'sub SLIST_INIT {
        my($head) = @_;
	    eval q( &do {  &SLIST_FIRST(($head)) =  &NULL; }  &while (0));
    }' unless defined(&SLIST_INIT);
    eval 'sub SLIST_INSERT_AFTER {
        my($slistelm, $elm, $field) = @_;
	    eval q( &do {  &SLIST_NEXT(($elm), $field) =  &SLIST_NEXT(($slistelm), $field);  &SLIST_NEXT(($slistelm), $field) = ($elm); }  &while (0));
    }' unless defined(&SLIST_INSERT_AFTER);
    eval 'sub SLIST_INSERT_HEAD {
        my($head, $elm, $field) = @_;
	    eval q( &do {  &SLIST_NEXT(($elm), $field) =  &SLIST_FIRST(($head));  &SLIST_FIRST(($head)) = ($elm); }  &while (0));
    }' unless defined(&SLIST_INSERT_HEAD);
    eval 'sub SLIST_NEXT {
        my($elm, $field) = @_;
	    eval q((($elm)-> ($field->{sle_next})));
    }' unless defined(&SLIST_NEXT);
    eval 'sub SLIST_REMOVE {
        my($head, $elm, $type, $field) = @_;
	    eval q( &do {  &if ( &SLIST_FIRST(($head)) == ($elm)) {  &SLIST_REMOVE_HEAD(($head), $field); }  &else {  &QUEUE_TYPEOF($type) * &curelm =  &SLIST_FIRST($head);  &while ( &SLIST_NEXT( &curelm, $field) != ($elm))  &curelm =  &SLIST_NEXT( &curelm, $field);  &SLIST_REMOVE_AFTER( &curelm, $field); } }  &while (0));
    }' unless defined(&SLIST_REMOVE);
    eval 'sub SLIST_REMOVE_AFTER {
        my($elm, $field) = @_;
	    eval q( &do {  &QMD_SAVELINK( &oldnext,  &SLIST_NEXT($elm, $field)-> ($field->{sle_next}));  &SLIST_NEXT($elm, $field) =  &SLIST_NEXT( &SLIST_NEXT($elm, $field), $field);  &TRASHIT(* &oldnext); }  &while (0));
    }' unless defined(&SLIST_REMOVE_AFTER);
    eval 'sub SLIST_REMOVE_HEAD {
        my($head, $field) = @_;
	    eval q( &do {  &QMD_SAVELINK( &oldnext,  &SLIST_FIRST($head)-> ($field->{sle_next}));  &SLIST_FIRST(($head)) =  &SLIST_NEXT( &SLIST_FIRST(($head)), $field);  &TRASHIT(* &oldnext); }  &while (0));
    }' unless defined(&SLIST_REMOVE_HEAD);
    eval 'sub SLIST_REMOVE_PREVPTR {
        my($prevp, $elm, $field) = @_;
	    eval q( &do {  &QMD_SLIST_CHECK_PREVPTR($prevp, $elm); *($prevp) =  &SLIST_NEXT($elm, $field);  &TRASHIT(($elm)-> ($field->{sle_next})); }  &while (0));
    }' unless defined(&SLIST_REMOVE_PREVPTR);
    eval 'sub SLIST_SWAP {
        my($head1, $head2, $type) = @_;
	    eval q( &do {  &QUEUE_TYPEOF($type) * &swap_first =  &SLIST_FIRST($head1);  &SLIST_FIRST($head1) =  &SLIST_FIRST($head2);  &SLIST_FIRST($head2) =  &swap_first; }  &while (0));
    }' unless defined(&SLIST_SWAP);
    eval 'sub SLIST_END {
        my($head) = @_;
	    eval q( &NULL);
    }' unless defined(&SLIST_END);
    eval 'sub STAILQ_HEAD {
        my($name, $type) = @_;
	    eval q(\'struct name\' { \'struct type\' * &stqh_first; \'struct type\' ** &stqh_last; });
    }' unless defined(&STAILQ_HEAD);
    eval 'sub STAILQ_CLASS_HEAD {
        my($name, $type) = @_;
	    eval q(\'struct name\' {  &class $type * &stqh_first;  &class $type ** &stqh_last; });
    }' unless defined(&STAILQ_CLASS_HEAD);
    eval 'sub STAILQ_HEAD_INITIALIZER {
        my($head) = @_;
	    eval q({  &NULL, ($head). &stqh_first });
    }' unless defined(&STAILQ_HEAD_INITIALIZER);
    eval 'sub STAILQ_ENTRY {
        my($type) = @_;
	    eval q(\'struct struct\' { \'struct type\' * &stqe_next; });
    }' unless defined(&STAILQ_ENTRY);
    eval 'sub STAILQ_CLASS_ENTRY {
        my($type) = @_;
	    eval q(\'struct struct\' {  &class $type * &stqe_next; });
    }' unless defined(&STAILQ_CLASS_ENTRY);
    eval 'sub STAILQ_CONCAT {
        my($head1, $head2) = @_;
	    eval q( &do {  &if (! &STAILQ_EMPTY(($head2))) { *($head1)-> &stqh_last = ($head2)-> &stqh_first; ($head1)-> &stqh_last = ($head2)-> &stqh_last;  &STAILQ_INIT(($head2)); } }  &while (0));
    }' unless defined(&STAILQ_CONCAT);
    eval 'sub STAILQ_EMPTY {
        my($head) = @_;
	    eval q((($head)-> &stqh_first ==  &NULL));
    }' unless defined(&STAILQ_EMPTY);
    eval 'sub STAILQ_FIRST {
        my($head) = @_;
	    eval q((($head)-> &stqh_first));
    }' unless defined(&STAILQ_FIRST);
    eval 'sub STAILQ_FOREACH {
        my($var, $head, $field) = @_;
	    eval q( &for(($var) =  &STAILQ_FIRST(($head)); ($var); ($var) =  &STAILQ_NEXT(($var), $field)));
    }' unless defined(&STAILQ_FOREACH);
    eval 'sub STAILQ_FOREACH_FROM {
        my($var, $head, $field) = @_;
	    eval q( &for (($var) = (($var) ? ($var) :  &STAILQ_FIRST(($head))); ($var); ($var) =  &STAILQ_NEXT(($var), $field)));
    }' unless defined(&STAILQ_FOREACH_FROM);
    eval 'sub STAILQ_FOREACH_SAFE {
        my($var, $head, $field, $tvar) = @_;
	    eval q( &for (($var) =  &STAILQ_FIRST(($head)); ($var)  && (($tvar) =  &STAILQ_NEXT(($var), $field), 1); ($var) = ($tvar)));
    }' unless defined(&STAILQ_FOREACH_SAFE);
    eval 'sub STAILQ_FOREACH_FROM_SAFE {
        my($var, $head, $field, $tvar) = @_;
	    eval q( &for (($var) = (($var) ? ($var) :  &STAILQ_FIRST(($head))); ($var)  && (($tvar) =  &STAILQ_NEXT(($var), $field), 1); ($var) = ($tvar)));
    }' unless defined(&STAILQ_FOREACH_FROM_SAFE);
    eval 'sub STAILQ_INIT {
        my($head) = @_;
	    eval q( &do {  &STAILQ_FIRST(($head)) =  &NULL; ($head)-> &stqh_last =  &STAILQ_FIRST(($head)); }  &while (0));
    }' unless defined(&STAILQ_INIT);
    eval 'sub STAILQ_INSERT_AFTER {
        my($head, $tqelm, $elm, $field) = @_;
	    eval q( &do {  &if (( &STAILQ_NEXT(($elm), $field) =  &STAILQ_NEXT(($tqelm), $field)) ==  &NULL) ($head)-> &stqh_last =  &STAILQ_NEXT(($elm), $field);  &STAILQ_NEXT(($tqelm), $field) = ($elm); }  &while (0));
    }' unless defined(&STAILQ_INSERT_AFTER);
    eval 'sub STAILQ_INSERT_HEAD {
        my($head, $elm, $field) = @_;
	    eval q( &do {  &if (( &STAILQ_NEXT(($elm), $field) =  &STAILQ_FIRST(($head))) ==  &NULL) ($head)-> &stqh_last =  &STAILQ_NEXT(($elm), $field);  &STAILQ_FIRST(($head)) = ($elm); }  &while (0));
    }' unless defined(&STAILQ_INSERT_HEAD);
    eval 'sub STAILQ_INSERT_TAIL {
        my($head, $elm, $field) = @_;
	    eval q( &do {  &STAILQ_NEXT(($elm), $field) =  &NULL; *($head)-> &stqh_last = ($elm); ($head)-> &stqh_last =  &STAILQ_NEXT(($elm), $field); }  &while (0));
    }' unless defined(&STAILQ_INSERT_TAIL);
    eval 'sub STAILQ_LAST {
        my($head, $type, $field) = @_;
	    eval q(( &STAILQ_EMPTY(($head)) ?  &NULL :  &__containerof(($head)-> &stqh_last,  &QUEUE_TYPEOF($type),  ($field->{stqe_next}))));
    }' unless defined(&STAILQ_LAST);
    eval 'sub STAILQ_NEXT {
        my($elm, $field) = @_;
	    eval q((($elm)-> ($field->{stqe_next})));
    }' unless defined(&STAILQ_NEXT);
    eval 'sub STAILQ_REMOVE {
        my($head, $elm, $type, $field) = @_;
	    eval q( &do {  &QMD_SAVELINK( &oldnext, ($elm)-> ($field->{stqe_next}));  &if ( &STAILQ_FIRST(($head)) == ($elm)) {  &STAILQ_REMOVE_HEAD(($head), $field); }  &else {  &QUEUE_TYPEOF($type) * &curelm =  &STAILQ_FIRST($head);  &while ( &STAILQ_NEXT( &curelm, $field) != ($elm))  &curelm =  &STAILQ_NEXT( &curelm, $field);  &STAILQ_REMOVE_AFTER($head,  &curelm, $field); }  &TRASHIT(* &oldnext); }  &while (0));
    }' unless defined(&STAILQ_REMOVE);
    eval 'sub STAILQ_REMOVE_AFTER {
        my($head, $elm, $field) = @_;
	    eval q( &do {  &if (( &STAILQ_NEXT($elm, $field) =  &STAILQ_NEXT( &STAILQ_NEXT($elm, $field), $field)) ==  &NULL) ($head)-> &stqh_last =  &STAILQ_NEXT(($elm), $field); }  &while (0));
    }' unless defined(&STAILQ_REMOVE_AFTER);
    eval 'sub STAILQ_REMOVE_HEAD {
        my($head, $field) = @_;
	    eval q( &do {  &if (( &STAILQ_FIRST(($head)) =  &STAILQ_NEXT( &STAILQ_FIRST(($head)), $field)) ==  &NULL) ($head)-> &stqh_last =  &STAILQ_FIRST(($head)); }  &while (0));
    }' unless defined(&STAILQ_REMOVE_HEAD);
    eval 'sub STAILQ_SWAP {
        my($head1, $head2, $type) = @_;
	    eval q( &do {  &QUEUE_TYPEOF($type) * &swap_first =  &STAILQ_FIRST($head1);  &QUEUE_TYPEOF($type) ** &swap_last = ($head1)-> &stqh_last;  &STAILQ_FIRST($head1) =  &STAILQ_FIRST($head2); ($head1)-> &stqh_last = ($head2)-> &stqh_last;  &STAILQ_FIRST($head2) =  &swap_first; ($head2)-> &stqh_last =  &swap_last;  &if ( &STAILQ_EMPTY($head1)) ($head1)-> &stqh_last =  &STAILQ_FIRST($head1);  &if ( &STAILQ_EMPTY($head2)) ($head2)-> &stqh_last =  &STAILQ_FIRST($head2); }  &while (0));
    }' unless defined(&STAILQ_SWAP);
    eval 'sub STAILQ_END {
        my($head) = @_;
	    eval q( &NULL);
    }' unless defined(&STAILQ_END);
    eval 'sub LIST_HEAD {
        my($name, $type) = @_;
	    eval q(\'struct name\' { \'struct type\' * &lh_first; });
    }' unless defined(&LIST_HEAD);
    eval 'sub LIST_CLASS_HEAD {
        my($name, $type) = @_;
	    eval q(\'struct name\' {  &class $type * &lh_first; });
    }' unless defined(&LIST_CLASS_HEAD);
    eval 'sub LIST_HEAD_INITIALIZER {
        my($head) = @_;
	    eval q({  &NULL });
    }' unless defined(&LIST_HEAD_INITIALIZER);
    eval 'sub LIST_ENTRY {
        my($type) = @_;
	    eval q(\'struct struct\' { \'struct type\' * &le_next; \'struct type\' ** &le_prev; });
    }' unless defined(&LIST_ENTRY);
    eval 'sub LIST_CLASS_ENTRY {
        my($type) = @_;
	    eval q(\'struct struct\' {  &class $type * &le_next;  &class $type ** &le_prev; });
    }' unless defined(&LIST_CLASS_ENTRY);
    if((defined(&_KERNEL)  && defined(&INVARIANTS))) {
	eval 'sub QMD_LIST_CHECK_HEAD {
	    my($head, $field) = @_;
    	    eval q( &do {  &if ( &LIST_FIRST(($head)) !=  &NULL  &&  &LIST_FIRST(($head))-> ($field->{le_prev}) !=  &LIST_FIRST(($head)))  &panic(\\"Bad list head %p first->prev != head\\", ($head)); }  &while (0));
	}' unless defined(&QMD_LIST_CHECK_HEAD);
	eval 'sub QMD_LIST_CHECK_NEXT {
	    my($elm, $field) = @_;
    	    eval q( &do {  &if ( &LIST_NEXT(($elm), $field) !=  &NULL  &&  &LIST_NEXT(($elm), $field)-> ($field->{le_prev}) != (($elm)-> ($field->{le_next})))  &panic(\\"Bad link elm %p next->prev != elm\\", ($elm)); }  &while (0));
	}' unless defined(&QMD_LIST_CHECK_NEXT);
	eval 'sub QMD_LIST_CHECK_PREV {
	    my($elm, $field) = @_;
    	    eval q( &do {  &if (*($elm)-> ($field->{le_prev}) != ($elm))  &panic(\\"Bad link elm %p prev->next != elm\\", ($elm)); }  &while (0));
	}' unless defined(&QMD_LIST_CHECK_PREV);
    } else {
	eval 'sub QMD_LIST_CHECK_HEAD {
	    my($head, $field) = @_;
    	    eval q();
	}' unless defined(&QMD_LIST_CHECK_HEAD);
	eval 'sub QMD_LIST_CHECK_NEXT {
	    my($elm, $field) = @_;
    	    eval q();
	}' unless defined(&QMD_LIST_CHECK_NEXT);
	eval 'sub QMD_LIST_CHECK_PREV {
	    my($elm, $field) = @_;
    	    eval q();
	}' unless defined(&QMD_LIST_CHECK_PREV);
    }
    eval 'sub LIST_CONCAT {
        my($head1, $head2, $type, $field) = @_;
	    eval q( &do {  &QUEUE_TYPEOF($type) * &curelm =  &LIST_FIRST($head1);  &if ( &curelm ==  &NULL) {  &if (( &LIST_FIRST($head1) =  &LIST_FIRST($head2)) !=  &NULL) {  &LIST_FIRST($head2)-> ($field->{le_prev}) =  &LIST_FIRST(($head1));  &LIST_INIT($head2); } }  &else  &if ( &LIST_FIRST($head2) !=  &NULL) {  &while ( &LIST_NEXT( &curelm, $field) !=  &NULL)  &curelm =  &LIST_NEXT( &curelm, $field);  &LIST_NEXT( &curelm, $field) =  &LIST_FIRST($head2);  &LIST_FIRST($head2)-> ($field->{le_prev}) =  &LIST_NEXT( &curelm, $field);  &LIST_INIT($head2); } }  &while (0));
    }' unless defined(&LIST_CONCAT);
    eval 'sub LIST_EMPTY {
        my($head) = @_;
	    eval q((($head)-> &lh_first ==  &NULL));
    }' unless defined(&LIST_EMPTY);
    eval 'sub LIST_FIRST {
        my($head) = @_;
	    eval q((($head)-> &lh_first));
    }' unless defined(&LIST_FIRST);
    eval 'sub LIST_FOREACH {
        my($var, $head, $field) = @_;
	    eval q( &for (($var) =  &LIST_FIRST(($head)); ($var); ($var) =  &LIST_NEXT(($var), $field)));
    }' unless defined(&LIST_FOREACH);
    eval 'sub LIST_FOREACH_FROM {
        my($var, $head, $field) = @_;
	    eval q( &for (($var) = (($var) ? ($var) :  &LIST_FIRST(($head))); ($var); ($var) =  &LIST_NEXT(($var), $field)));
    }' unless defined(&LIST_FOREACH_FROM);
    eval 'sub LIST_FOREACH_SAFE {
        my($var, $head, $field, $tvar) = @_;
	    eval q( &for (($var) =  &LIST_FIRST(($head)); ($var)  && (($tvar) =  &LIST_NEXT(($var), $field), 1); ($var) = ($tvar)));
    }' unless defined(&LIST_FOREACH_SAFE);
    eval 'sub LIST_FOREACH_FROM_SAFE {
        my($var, $head, $field, $tvar) = @_;
	    eval q( &for (($var) = (($var) ? ($var) :  &LIST_FIRST(($head))); ($var)  && (($tvar) =  &LIST_NEXT(($var), $field), 1); ($var) = ($tvar)));
    }' unless defined(&LIST_FOREACH_FROM_SAFE);
    eval 'sub LIST_INIT {
        my($head) = @_;
	    eval q( &do {  &LIST_FIRST(($head)) =  &NULL; }  &while (0));
    }' unless defined(&LIST_INIT);
    eval 'sub LIST_INSERT_AFTER {
        my($listelm, $elm, $field) = @_;
	    eval q( &do {  &QMD_LIST_CHECK_NEXT($listelm, $field);  &if (( &LIST_NEXT(($elm), $field) =  &LIST_NEXT(($listelm), $field)) !=  &NULL)  &LIST_NEXT(($listelm), $field)-> ($field->{le_prev}) =  &LIST_NEXT(($elm), $field);  &LIST_NEXT(($listelm), $field) = ($elm); ($elm)-> ($field->{le_prev}) =  &LIST_NEXT(($listelm), $field); }  &while (0));
    }' unless defined(&LIST_INSERT_AFTER);
    eval 'sub LIST_INSERT_BEFORE {
        my($listelm, $elm, $field) = @_;
	    eval q( &do {  &QMD_LIST_CHECK_PREV($listelm, $field); ($elm)-> ($field->{le_prev}) = ($listelm)-> ($field->{le_prev});  &LIST_NEXT(($elm), $field) = ($listelm); *($listelm)-> ($field->{le_prev}) = ($elm); ($listelm)-> ($field->{le_prev}) =  &LIST_NEXT(($elm), $field); }  &while (0));
    }' unless defined(&LIST_INSERT_BEFORE);
    eval 'sub LIST_INSERT_HEAD {
        my($head, $elm, $field) = @_;
	    eval q( &do {  &QMD_LIST_CHECK_HEAD(($head), $field);  &if (( &LIST_NEXT(($elm), $field) =  &LIST_FIRST(($head))) !=  &NULL)  &LIST_FIRST(($head))-> ($field->{le_prev}) =  &LIST_NEXT(($elm), $field);  &LIST_FIRST(($head)) = ($elm); ($elm)-> ($field->{le_prev}) =  &LIST_FIRST(($head)); }  &while (0));
    }' unless defined(&LIST_INSERT_HEAD);
    eval 'sub LIST_NEXT {
        my($elm, $field) = @_;
	    eval q((($elm)-> ($field->{le_next})));
    }' unless defined(&LIST_NEXT);
    eval 'sub LIST_PREV {
        my($elm, $head, $type, $field) = @_;
	    eval q((($elm)-> ($field->{le_prev}) ==  &LIST_FIRST(($head)) ?  &NULL :  &__containerof(($elm)-> ($field->{le_prev}),  &QUEUE_TYPEOF($type),  ($field->{le_next}))));
    }' unless defined(&LIST_PREV);
    eval 'sub LIST_REMOVE_HEAD {
        my($head, $field) = @_;
	    eval q( &LIST_REMOVE( &LIST_FIRST($head), $field));
    }' unless defined(&LIST_REMOVE_HEAD);
    eval 'sub LIST_REMOVE {
        my($elm, $field) = @_;
	    eval q( &do {  &QMD_SAVELINK( &oldnext, ($elm)-> ($field->{le_next}));  &QMD_SAVELINK( &oldprev, ($elm)-> ($field->{le_prev}));  &QMD_LIST_CHECK_NEXT($elm, $field);  &QMD_LIST_CHECK_PREV($elm, $field);  &if ( &LIST_NEXT(($elm), $field) !=  &NULL)  &LIST_NEXT(($elm), $field)-> ($field->{le_prev}) = ($elm)-> ($field->{le_prev}); *($elm)-> ($field->{le_prev}) =  &LIST_NEXT(($elm), $field);  &TRASHIT(* &oldnext);  &TRASHIT(* &oldprev); }  &while (0));
    }' unless defined(&LIST_REMOVE);
    eval 'sub LIST_REPLACE {
        my($elm, $elm2, $field) = @_;
	    eval q( &do {  &QMD_SAVELINK( &oldnext, ($elm)-> ($field->{le_next}));  &QMD_SAVELINK( &oldprev, ($elm)-> ($field->{le_prev}));  &QMD_LIST_CHECK_NEXT($elm, $field);  &QMD_LIST_CHECK_PREV($elm, $field);  &LIST_NEXT(($elm2), $field) =  &LIST_NEXT(($elm), $field);  &if ( &LIST_NEXT(($elm2), $field) !=  &NULL)  &LIST_NEXT(($elm2), $field)-> ($field->{le_prev}) = ($elm2)-> ($field->{le_next}); ($elm2)-> ($field->{le_prev}) = ($elm)-> ($field->{le_prev}); *($elm2)-> ($field->{le_prev}) = ($elm2);  &TRASHIT(* &oldnext);  &TRASHIT(* &oldprev); }  &while (0));
    }' unless defined(&LIST_REPLACE);
    eval 'sub LIST_SWAP {
        my($head1, $head2, $type, $field) = @_;
	    eval q( &do {  &QUEUE_TYPEOF($type) * &swap_tmp =  &LIST_FIRST($head1);  &LIST_FIRST(($head1)) =  &LIST_FIRST(($head2));  &LIST_FIRST(($head2)) =  &swap_tmp;  &if (( &swap_tmp =  &LIST_FIRST(($head1))) !=  &NULL)  ($swap_tmp->{field}->{le_prev}) =  &LIST_FIRST(($head1));  &if (( &swap_tmp =  &LIST_FIRST(($head2))) !=  &NULL)  ($swap_tmp->{field}->{le_prev}) =  &LIST_FIRST(($head2)); }  &while (0));
    }' unless defined(&LIST_SWAP);
    eval 'sub LIST_END {
        my($head) = @_;
	    eval q( &NULL);
    }' unless defined(&LIST_END);
    eval 'sub TAILQ_HEAD {
        my($name, $type) = @_;
	    eval q(\'struct name\' { \'struct type\' * &tqh_first; \'struct type\' ** &tqh_last;  &TRACEBUF });
    }' unless defined(&TAILQ_HEAD);
    eval 'sub TAILQ_CLASS_HEAD {
        my($name, $type) = @_;
	    eval q(\'struct name\' {  &class $type * &tqh_first;  &class $type ** &tqh_last;  &TRACEBUF });
    }' unless defined(&TAILQ_CLASS_HEAD);
    eval 'sub TAILQ_HEAD_INITIALIZER {
        my($head) = @_;
	    eval q({  &NULL, ($head). &tqh_first,  &TRACEBUF_INITIALIZER });
    }' unless defined(&TAILQ_HEAD_INITIALIZER);
    eval 'sub TAILQ_ENTRY {
        my($type) = @_;
	    eval q(\'struct struct\' { \'struct type\' * &tqe_next; \'struct type\' ** &tqe_prev;  &TRACEBUF });
    }' unless defined(&TAILQ_ENTRY);
    eval 'sub TAILQ_CLASS_ENTRY {
        my($type) = @_;
	    eval q(\'struct struct\' {  &class $type * &tqe_next;  &class $type ** &tqe_prev;  &TRACEBUF });
    }' unless defined(&TAILQ_CLASS_ENTRY);
    if((defined(&_KERNEL)  && defined(&INVARIANTS))) {
	eval 'sub QMD_TAILQ_CHECK_HEAD {
	    my($head, $field) = @_;
    	    eval q( &do {  &if (! &TAILQ_EMPTY($head)  &&  &TAILQ_FIRST(($head))-> ($field->{tqe_prev}) !=  &TAILQ_FIRST(($head)))  &panic(\\"Bad tailq head %p first->prev != head\\", ($head)); }  &while (0));
	}' unless defined(&QMD_TAILQ_CHECK_HEAD);
	eval 'sub QMD_TAILQ_CHECK_TAIL {
	    my($head, $field) = @_;
    	    eval q( &do {  &if (*($head)-> &tqh_last !=  &NULL)  &panic(\\"Bad tailq NEXT(%p->tqh_last) != NULL\\", ($head)); }  &while (0));
	}' unless defined(&QMD_TAILQ_CHECK_TAIL);
	eval 'sub QMD_TAILQ_CHECK_NEXT {
	    my($elm, $field) = @_;
    	    eval q( &do {  &if ( &TAILQ_NEXT(($elm), $field) !=  &NULL  &&  &TAILQ_NEXT(($elm), $field)-> ($field->{tqe_prev}) != (($elm)-> ($field->{tqe_next})))  &panic(\\"Bad link elm %p next->prev != elm\\", ($elm)); }  &while (0));
	}' unless defined(&QMD_TAILQ_CHECK_NEXT);
	eval 'sub QMD_TAILQ_CHECK_PREV {
	    my($elm, $field) = @_;
    	    eval q( &do {  &if (*($elm)-> ($field->{tqe_prev}) != ($elm))  &panic(\\"Bad link elm %p prev->next != elm\\", ($elm)); }  &while (0));
	}' unless defined(&QMD_TAILQ_CHECK_PREV);
    } else {
	eval 'sub QMD_TAILQ_CHECK_HEAD {
	    my($head, $field) = @_;
    	    eval q();
	}' unless defined(&QMD_TAILQ_CHECK_HEAD);
	eval 'sub QMD_TAILQ_CHECK_TAIL {
	    my($head, $headname) = @_;
    	    eval q();
	}' unless defined(&QMD_TAILQ_CHECK_TAIL);
	eval 'sub QMD_TAILQ_CHECK_NEXT {
	    my($elm, $field) = @_;
    	    eval q();
	}' unless defined(&QMD_TAILQ_CHECK_NEXT);
	eval 'sub QMD_TAILQ_CHECK_PREV {
	    my($elm, $field) = @_;
    	    eval q();
	}' unless defined(&QMD_TAILQ_CHECK_PREV);
    }
    eval 'sub TAILQ_CONCAT {
        my($head1, $head2, $field) = @_;
	    eval q( &do {  &if (! &TAILQ_EMPTY($head2)) { *($head1)-> &tqh_last = ($head2)-> &tqh_first; ($head2)-> ($tqh_first->{field}->{tqe_prev}) = ($head1)-> &tqh_last; ($head1)-> &tqh_last = ($head2)-> &tqh_last;  &TAILQ_INIT(($head2));  &QMD_TRACE_HEAD($head1);  &QMD_TRACE_HEAD($head2); } }  &while (0));
    }' unless defined(&TAILQ_CONCAT);
    eval 'sub TAILQ_EMPTY {
        my($head) = @_;
	    eval q((($head)-> &tqh_first ==  &NULL));
    }' unless defined(&TAILQ_EMPTY);
    eval 'sub TAILQ_FIRST {
        my($head) = @_;
	    eval q((($head)-> &tqh_first));
    }' unless defined(&TAILQ_FIRST);
    eval 'sub TAILQ_FOREACH {
        my($var, $head, $field) = @_;
	    eval q( &for (($var) =  &TAILQ_FIRST(($head)); ($var); ($var) =  &TAILQ_NEXT(($var), $field)));
    }' unless defined(&TAILQ_FOREACH);
    eval 'sub TAILQ_FOREACH_FROM {
        my($var, $head, $field) = @_;
	    eval q( &for (($var) = (($var) ? ($var) :  &TAILQ_FIRST(($head))); ($var); ($var) =  &TAILQ_NEXT(($var), $field)));
    }' unless defined(&TAILQ_FOREACH_FROM);
    eval 'sub TAILQ_FOREACH_SAFE {
        my($var, $head, $field, $tvar) = @_;
	    eval q( &for (($var) =  &TAILQ_FIRST(($head)); ($var)  && (($tvar) =  &TAILQ_NEXT(($var), $field), 1); ($var) = ($tvar)));
    }' unless defined(&TAILQ_FOREACH_SAFE);
    eval 'sub TAILQ_FOREACH_FROM_SAFE {
        my($var, $head, $field, $tvar) = @_;
	    eval q( &for (($var) = (($var) ? ($var) :  &TAILQ_FIRST(($head))); ($var)  && (($tvar) =  &TAILQ_NEXT(($var), $field), 1); ($var) = ($tvar)));
    }' unless defined(&TAILQ_FOREACH_FROM_SAFE);
    eval 'sub TAILQ_FOREACH_REVERSE {
        my($var, $head, $headname, $field) = @_;
	    eval q( &for (($var) =  &TAILQ_LAST(($head), $headname); ($var); ($var) =  &TAILQ_PREV(($var), $headname, $field)));
    }' unless defined(&TAILQ_FOREACH_REVERSE);
    eval 'sub TAILQ_FOREACH_REVERSE_FROM {
        my($var, $head, $headname, $field) = @_;
	    eval q( &for (($var) = (($var) ? ($var) :  &TAILQ_LAST(($head), $headname)); ($var); ($var) =  &TAILQ_PREV(($var), $headname, $field)));
    }' unless defined(&TAILQ_FOREACH_REVERSE_FROM);
    eval 'sub TAILQ_FOREACH_REVERSE_SAFE {
        my($var, $head, $headname, $field, $tvar) = @_;
	    eval q( &for (($var) =  &TAILQ_LAST(($head), $headname); ($var)  && (($tvar) =  &TAILQ_PREV(($var), $headname, $field), 1); ($var) = ($tvar)));
    }' unless defined(&TAILQ_FOREACH_REVERSE_SAFE);
    eval 'sub TAILQ_FOREACH_REVERSE_FROM_SAFE {
        my($var, $head, $headname, $field, $tvar) = @_;
	    eval q( &for (($var) = (($var) ? ($var) :  &TAILQ_LAST(($head), $headname)); ($var)  && (($tvar) =  &TAILQ_PREV(($var), $headname, $field), 1); ($var) = ($tvar)));
    }' unless defined(&TAILQ_FOREACH_REVERSE_FROM_SAFE);
    eval 'sub TAILQ_INIT {
        my($head) = @_;
	    eval q( &do {  &TAILQ_FIRST(($head)) =  &NULL; ($head)-> &tqh_last =  &TAILQ_FIRST(($head));  &QMD_TRACE_HEAD($head); }  &while (0));
    }' unless defined(&TAILQ_INIT);
    eval 'sub TAILQ_INSERT_AFTER {
        my($head, $listelm, $elm, $field) = @_;
	    eval q( &do {  &QMD_TAILQ_CHECK_NEXT($listelm, $field);  &if (( &TAILQ_NEXT(($elm), $field) =  &TAILQ_NEXT(($listelm), $field)) !=  &NULL)  &TAILQ_NEXT(($elm), $field)-> ($field->{tqe_prev}) =  &TAILQ_NEXT(($elm), $field);  &else { ($head)-> &tqh_last =  &TAILQ_NEXT(($elm), $field);  &QMD_TRACE_HEAD($head); }  &TAILQ_NEXT(($listelm), $field) = ($elm); ($elm)-> ($field->{tqe_prev}) =  &TAILQ_NEXT(($listelm), $field);  &QMD_TRACE_ELEM(($elm)->$field);  &QMD_TRACE_ELEM(($listelm)->$field); }  &while (0));
    }' unless defined(&TAILQ_INSERT_AFTER);
    eval 'sub TAILQ_INSERT_BEFORE {
        my($listelm, $elm, $field) = @_;
	    eval q( &do {  &QMD_TAILQ_CHECK_PREV($listelm, $field); ($elm)-> ($field->{tqe_prev}) = ($listelm)-> ($field->{tqe_prev});  &TAILQ_NEXT(($elm), $field) = ($listelm); *($listelm)-> ($field->{tqe_prev}) = ($elm); ($listelm)-> ($field->{tqe_prev}) =  &TAILQ_NEXT(($elm), $field);  &QMD_TRACE_ELEM(($elm)->$field);  &QMD_TRACE_ELEM(($listelm)->$field); }  &while (0));
    }' unless defined(&TAILQ_INSERT_BEFORE);
    eval 'sub TAILQ_INSERT_HEAD {
        my($head, $elm, $field) = @_;
	    eval q( &do {  &QMD_TAILQ_CHECK_HEAD($head, $field);  &if (( &TAILQ_NEXT(($elm), $field) =  &TAILQ_FIRST(($head))) !=  &NULL)  &TAILQ_FIRST(($head))-> ($field->{tqe_prev}) =  &TAILQ_NEXT(($elm), $field);  &else ($head)-> &tqh_last =  &TAILQ_NEXT(($elm), $field);  &TAILQ_FIRST(($head)) = ($elm); ($elm)-> ($field->{tqe_prev}) =  &TAILQ_FIRST(($head));  &QMD_TRACE_HEAD($head);  &QMD_TRACE_ELEM(($elm)->$field); }  &while (0));
    }' unless defined(&TAILQ_INSERT_HEAD);
    eval 'sub TAILQ_INSERT_TAIL {
        my($head, $elm, $field) = @_;
	    eval q( &do {  &QMD_TAILQ_CHECK_TAIL($head, $field);  &TAILQ_NEXT(($elm), $field) =  &NULL; ($elm)-> ($field->{tqe_prev}) = ($head)-> &tqh_last; *($head)-> &tqh_last = ($elm); ($head)-> &tqh_last =  &TAILQ_NEXT(($elm), $field);  &QMD_TRACE_HEAD($head);  &QMD_TRACE_ELEM(($elm)->$field); }  &while (0));
    }' unless defined(&TAILQ_INSERT_TAIL);
    eval 'sub TAILQ_LAST {
        my($head, $headname) = @_;
	    eval q((*(((($head)-> &tqh_last))-> &tqh_last)));
    }' unless defined(&TAILQ_LAST);
    eval 'sub TAILQ_LAST_FAST {
        my($head, $type, $field) = @_;
	    eval q(( &TAILQ_EMPTY($head) ?  &NULL :  &__containerof(($head)-> &tqh_last,  &QUEUE_TYPEOF($type),  ($field->{tqe_next}))));
    }' unless defined(&TAILQ_LAST_FAST);
    eval 'sub TAILQ_NEXT {
        my($elm, $field) = @_;
	    eval q((($elm)-> ($field->{tqe_next})));
    }' unless defined(&TAILQ_NEXT);
    eval 'sub TAILQ_PREV {
        my($elm, $headname, $field) = @_;
	    eval q((*(((($elm)-> ($field->{tqe_prev})))-> &tqh_last)));
    }' unless defined(&TAILQ_PREV);
    eval 'sub TAILQ_PREV_FAST {
        my($elm, $head, $type, $field) = @_;
	    eval q((($elm)-> ($field->{tqe_prev}) == ($head)-> &tqh_first ?  &NULL :  &__containerof(($elm)-> ($field->{tqe_prev}),  &QUEUE_TYPEOF($type),  ($field->{tqe_next}))));
    }' unless defined(&TAILQ_PREV_FAST);
    eval 'sub TAILQ_REMOVE_HEAD {
        my($head, $field) = @_;
	    eval q( &TAILQ_REMOVE($head,  &TAILQ_FIRST($head), $field));
    }' unless defined(&TAILQ_REMOVE_HEAD);
    eval 'sub TAILQ_REMOVE {
        my($head, $elm, $field) = @_;
	    eval q( &do {  &QMD_SAVELINK( &oldnext, ($elm)-> ($field->{tqe_next}));  &QMD_SAVELINK( &oldprev, ($elm)-> ($field->{tqe_prev}));  &QMD_TAILQ_CHECK_NEXT($elm, $field);  &QMD_TAILQ_CHECK_PREV($elm, $field);  &if (( &TAILQ_NEXT(($elm), $field)) !=  &NULL)  &TAILQ_NEXT(($elm), $field)-> ($field->{tqe_prev}) = ($elm)-> ($field->{tqe_prev});  &else { ($head)-> &tqh_last = ($elm)-> ($field->{tqe_prev});  &QMD_TRACE_HEAD($head); } *($elm)-> ($field->{tqe_prev}) =  &TAILQ_NEXT(($elm), $field);  &TRASHIT(* &oldnext);  &TRASHIT(* &oldprev);  &QMD_TRACE_ELEM(($elm)->$field); }  &while (0));
    }' unless defined(&TAILQ_REMOVE);
    eval 'sub TAILQ_REPLACE {
        my($head, $elm, $elm2, $field) = @_;
	    eval q( &do {  &QMD_SAVELINK( &oldnext, ($elm)-> ($field->{tqe_next}));  &QMD_SAVELINK( &oldprev, ($elm)-> ($field->{tqe_prev}));  &QMD_TAILQ_CHECK_NEXT($elm, $field);  &QMD_TAILQ_CHECK_PREV($elm, $field);  &TAILQ_NEXT(($elm2), $field) =  &TAILQ_NEXT(($elm), $field);  &if ( &TAILQ_NEXT(($elm2), $field) !=  &TAILQ_END($head))  &TAILQ_NEXT(($elm2), $field)-> ($field->{tqe_prev}) = ($elm2)-> ($field->{tqe_next});  &else ($head)-> &tqh_last = ($elm2)-> ($field->{tqe_next}); ($elm2)-> ($field->{tqe_prev}) = ($elm)-> ($field->{tqe_prev}); *($elm2)-> ($field->{tqe_prev}) = ($elm2);  &TRASHIT(* &oldnext);  &TRASHIT(* &oldprev);  &QMD_TRACE_ELEM(($elm)->$field); }  &while (0));
    }' unless defined(&TAILQ_REPLACE);
    eval 'sub TAILQ_SWAP {
        my($head1, $head2, $type, $field) = @_;
	    eval q( &do {  &QUEUE_TYPEOF($type) * &swap_first = ($head1)-> &tqh_first;  &QUEUE_TYPEOF($type) ** &swap_last = ($head1)-> &tqh_last; ($head1)-> &tqh_first = ($head2)-> &tqh_first; ($head1)-> &tqh_last = ($head2)-> &tqh_last; ($head2)-> &tqh_first =  &swap_first; ($head2)-> &tqh_last =  &swap_last;  &if (( &swap_first = ($head1)-> &tqh_first) !=  &NULL)  ($swap_first->{field}->{tqe_prev}) = ($head1)-> &tqh_first;  &else ($head1)-> &tqh_last = ($head1)-> &tqh_first;  &if (( &swap_first = ($head2)-> &tqh_first) !=  &NULL)  ($swap_first->{field}->{tqe_prev}) = ($head2)-> &tqh_first;  &else ($head2)-> &tqh_last = ($head2)-> &tqh_first; }  &while (0));
    }' unless defined(&TAILQ_SWAP);
    eval 'sub TAILQ_END {
        my($head) = @_;
	    eval q( &NULL);
    }' unless defined(&TAILQ_END);
}
1;

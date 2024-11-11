require '_h2ph_pre.ph';

no warnings qw(redefine misc);

unless(defined(&__SYS_COUNTER_H__)) {
    eval 'sub __SYS_COUNTER_H__ () {1;}' unless defined(&__SYS_COUNTER_H__);
    if(defined(&_KERNEL)) {
	require 'machine/counter.ph';
	eval 'sub COUNTER_ARRAY_ALLOC {
	    my($a, $n, $wait) = @_;
    	    eval q( &do {  &for (\'int\'  &_i = 0;  &_i < ($n);  &_i++) ($a)[ &_i] =  &counter_u64_alloc($wait); }  &while (0));
	}' unless defined(&COUNTER_ARRAY_ALLOC);
	eval 'sub COUNTER_ARRAY_FREE {
	    my($a, $n) = @_;
    	    eval q( &do {  &for (\'int\'  &_i = 0;  &_i < ($n);  &_i++)  &counter_u64_free(($a)[ &_i]); }  &while (0));
	}' unless defined(&COUNTER_ARRAY_FREE);
	eval 'sub COUNTER_ARRAY_COPY {
	    my($a, $dstp, $n) = @_;
    	    eval q( &do {  &for (\'int\'  &_i = 0;  &_i < ($n);  &_i++) (( &uint64_t *)($dstp))[ &_i] =  &counter_u64_fetch(($a)[ &_i]);}  &while (0));
	}' unless defined(&COUNTER_ARRAY_COPY);
	eval 'sub COUNTER_ARRAY_ZERO {
	    my($a, $n) = @_;
    	    eval q( &do {  &for (\'int\'  &_i = 0;  &_i < ($n);  &_i++)  &counter_u64_zero(($a)[ &_i]); }  &while (0));
	}' unless defined(&COUNTER_ARRAY_ZERO);
	eval 'sub COUNTER_U64_SYSINIT {
	    my($c) = @_;
    	    eval q( &SYSINIT($c &_counter_sysinit,  &SI_SUB_COUNTER,  &SI_ORDER_ANY,  &counter_u64_sysinit, $c);  &SYSUNINIT($c &_counter_sysuninit,  &SI_SUB_COUNTER,  &SI_ORDER_ANY,  &counter_u64_sysuninit, $c));
	}' unless defined(&COUNTER_U64_SYSINIT);
	eval 'sub COUNTER_U64_DEFINE_EARLY {
	    my($c) = @_;
    	    eval q( &counter_u64_t  &__read_mostly $c =  &EARLY_COUNTER;  &COUNTER_U64_SYSINIT($c));
	}' unless defined(&COUNTER_U64_DEFINE_EARLY);
    }
}
1;

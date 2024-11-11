require '_h2ph_pre.ph';

no warnings qw(redefine misc);

if(defined(&__i386__)) {
    require 'i386/counter.ph';
} else {
    unless(defined(&__MACHINE_COUNTER_H__)) {
	eval 'sub __MACHINE_COUNTER_H__ () {1;}' unless defined(&__MACHINE_COUNTER_H__);
	require 'sys/pcpu.ph';
	require 'sys/kassert.ph';
	eval 'sub EARLY_COUNTER () {( &void *) &__offsetof(\'struct pcpu\',  &pc_early_dummy_counter);}' unless defined(&EARLY_COUNTER);
	eval 'sub counter_enter () {
	    eval q( &do {}  &while (0));
	}' unless defined(&counter_enter);
	eval 'sub counter_exit () {
	    eval q( &do {}  &while (0));
	}' unless defined(&counter_exit);
	if(defined(&IN_SUBR_COUNTER_C)) {
	    eval 'sub counter_u64_read_one {
	        my($c,$cpu) = @_;
    		eval q({  &MPASS($c !=  &EARLY_COUNTER); (* &zpcpu_get_cpu($c, $cpu)); });
	    }' unless defined(&counter_u64_read_one);
	    eval 'sub counter_u64_fetch_inline {
	        my($c) = @_;
    		eval q({  &uint64_t  &r; \'int\'  &cpu;  &r = 0;  &CPU_FOREACH( &cpu)  &r +=  &counter_u64_read_one($c,  &cpu); ( &r); });
	    }' unless defined(&counter_u64_fetch_inline);
	    eval 'sub counter_u64_zero_inline {
	        my($c) = @_;
    		eval q({  &smp_rendezvous( &smp_no_rendezvous_barrier,  &counter_u64_zero_one_cpu,  &smp_no_rendezvous_barrier, $c); });
	    }' unless defined(&counter_u64_zero_inline);
	}
	eval 'sub counter_u64_add_protected {
	    my($c, $i) = @_;
    	    eval q( &counter_u64_add($c, $i));
	}' unless defined(&counter_u64_add_protected);
	eval 'sub counter_u64_add {
	    my($c,$inc) = @_;
    	    eval q({  &KASSERT( &IS_BSP() || $c !=  &EARLY_COUNTER, (\\"EARLY_COUNTER used on AP\\"));  &zpcpu_add($c, $inc); });
	}' unless defined(&counter_u64_add);
    }
}
1;

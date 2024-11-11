require '_h2ph_pre.ph';

no warnings qw(redefine misc);

unless(defined(&_SYS_VMMETER_H_)) {
    eval 'sub _SYS_VMMETER_H_ () {1;}' unless defined(&_SYS_VMMETER_H_);
    eval 'sub MAXSLP () {20;}' unless defined(&MAXSLP);
    if(defined(&_KERNEL) || defined(&_WANT_VMMETER)) {
	require 'sys/counter.ph';
	if(defined(&_KERNEL)) {
	    eval 'sub VMMETER_ALIGNED () { &__aligned( &CACHE_LINE_SIZE);}' unless defined(&VMMETER_ALIGNED);
	} else {
	    eval 'sub VMMETER_ALIGNED () {1;}' unless defined(&VMMETER_ALIGNED);
	}
	eval 'sub VM_METER_NCOUNTERS () {( &offsetof(\'struct vmmeter\',  &v_page_size) / $sizeof{ &counter_u64_t});}' unless defined(&VM_METER_NCOUNTERS);
    }
    if(defined(&_KERNEL)) {
	require 'sys/domainset.ph';
	eval 'sub VM_CNT_ADD {
	    my($var, $x) = @_;
    	    eval q( &counter_u64_add( ($vm_cnt->{var}), $x));
	}' unless defined(&VM_CNT_ADD);
	eval 'sub VM_CNT_INC {
	    my($var) = @_;
    	    eval q( &VM_CNT_ADD($var, 1));
	}' unless defined(&VM_CNT_INC);
	eval 'sub VM_CNT_FETCH {
	    my($var) = @_;
    	    eval q( &counter_u64_fetch( ($vm_cnt->{var})));
	}' unless defined(&VM_CNT_FETCH);
	eval 'sub vm_wire_add {
	    my($cnt) = @_;
    	    eval q({  &VM_CNT_ADD( &v_wire_count, $cnt); });
	}' unless defined(&vm_wire_add);
	eval 'sub vm_wire_sub {
	    my($cnt) = @_;
    	    eval q({  &VM_CNT_ADD( &v_wire_count, -$cnt); });
	}' unless defined(&vm_wire_sub);
	eval 'sub vm_wire_count {
	    my($void) = @_;
    	    eval q({ ( &VM_CNT_FETCH( &v_wire_count)); });
	}' unless defined(&vm_wire_count);
	eval 'sub vm_page_count_severe_domain {
	    my($domain) = @_;
    	    eval q({ ( &DOMAINSET_ISSET($domain,  &vm_severe_domains)); });
	}' unless defined(&vm_page_count_severe_domain);
	eval 'sub vm_page_count_severe_set {
	    my($mask) = @_;
    	    eval q({ ( &DOMAINSET_SUBSET( &vm_severe_domains, $mask)); });
	}' unless defined(&vm_page_count_severe_set);
	eval 'sub vm_page_count_min_domain {
	    my($domain) = @_;
    	    eval q({ ( &DOMAINSET_ISSET($domain,  &vm_min_domains)); });
	}' unless defined(&vm_page_count_min_domain);
	eval 'sub vm_page_count_min_set {
	    my($mask) = @_;
    	    eval q({ ( &DOMAINSET_SUBSET( &vm_min_domains, $mask)); });
	}' unless defined(&vm_page_count_min_set);
    }
}
1;

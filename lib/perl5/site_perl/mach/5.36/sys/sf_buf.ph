require '_h2ph_pre.ph';

no warnings qw(redefine misc);

unless(defined(&_SYS_SF_BUF_H_)) {
    eval 'sub _SYS_SF_BUF_H_ () {1;}' unless defined(&_SYS_SF_BUF_H_);
    if(defined(&_KERNEL)) {
	require 'sys/types.ph';
	require 'sys/systm.ph';
	require 'sys/counter.ph';
	require 'vm/vm.ph';
	require 'vm/vm_param.ph';
	require 'vm/vm_page.ph';
	if(defined(&SFBUF)) {
	    if(defined(&SMP)  && defined(&SFBUF_CPUSET)) {
		require 'sys/_cpuset.ph';
	    }
	    require 'sys/queue.ph';
	    if(defined(&SMP)  && defined(&SFBUF_CPUSET)) {
	    }
	} else {
	}
	unless(defined(&SFBUF_NOMD)) {
	    require 'machine/sf_buf.ph';
	}
	if(defined(&SFBUF)) {
	    eval 'sub sf_buf_kva {
	        my($sf) = @_;
    		eval q({  &if ( &PMAP_HAS_DMAP) ( &PHYS_TO_DMAP( &VM_PAGE_TO_PHYS(( &vm_page_t)$sf))); ( ($sf->{kva})); });
	    }' unless defined(&sf_buf_kva);
	    eval 'sub sf_buf_page {
	        my($sf) = @_;
    		eval q({  &if ( &PMAP_HAS_DMAP) (( &vm_page_t)$sf); ( ($sf->{m})); });
	    }' unless defined(&sf_buf_page);
	    unless(defined(&SFBUF_MAP)) {
		require 'vm/pmap.ph';
		eval 'sub sf_buf_map {
		    my($sf,$flags) = @_;
    		    eval q({  &pmap_qenter( ($sf->{kva}),  ($sf->{m}), 1); });
		}' unless defined(&sf_buf_map);
		eval 'sub sf_buf_unmap {
		    my($sf) = @_;
    		    eval q({ (0); });
		}' unless defined(&sf_buf_unmap);
	    }
	    if(defined(&SMP)  && defined(&SFBUF_CPUSET)) {
	    }
	    if(defined(&SFBUF_PROCESS_PAGE)) {
	    }
	} else {
	    eval 'sub sf_buf_alloc {
	        my($m,$pri) = @_;
    		eval q({ ($m); });
	    }' unless defined(&sf_buf_alloc);
	    eval 'sub sf_buf_free {
	        my($sf) = @_;
    		eval q({ });
	    }' unless defined(&sf_buf_free);
	    eval 'sub sf_buf_ref {
	        my($sf) = @_;
    		eval q({ });
	    }' unless defined(&sf_buf_ref);
	}
	eval 'sub SFB_CATCH () {1;}' unless defined(&SFB_CATCH);
	eval 'sub SFB_CPUPRIVATE () {2;}' unless defined(&SFB_CPUPRIVATE);
	eval 'sub SFB_DEFAULT () {0;}' unless defined(&SFB_DEFAULT);
	eval 'sub SFB_NOWAIT () {4;}' unless defined(&SFB_NOWAIT);
	eval 'sub SFSTAT_ADD {
	    my($name, $val) = @_;
    	    eval q( &counter_u64_add( $sfstat[ &offsetof(\'struct sfstat\', $name) / $sizeof{ &uint64_t}], ($val)));
	}' unless defined(&SFSTAT_ADD);
	eval 'sub SFSTAT_INC {
	    my($name) = @_;
    	    eval q( &SFSTAT_ADD($name, 1));
	}' unless defined(&SFSTAT_INC);
    }
}
1;

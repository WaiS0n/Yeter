require '_h2ph_pre.ph';

no warnings qw(redefine misc);

unless(defined(&_SYS_MSAN_H_)) {
    eval 'sub _SYS_MSAN_H_ () {1;}' unless defined(&_SYS_MSAN_H_);
    if(defined(&KMSAN)) {
	require 'sys/_bus_dma.ph';
	require 'sys/types.ph';
	eval 'sub KMSAN_STATE_UNINIT () {0xff;}' unless defined(&KMSAN_STATE_UNINIT);
	eval 'sub KMSAN_STATE_INITED () {0x;}' unless defined(&KMSAN_STATE_INITED);
	eval 'sub KMSAN_TYPE_STACK () {0;}' unless defined(&KMSAN_TYPE_STACK);
	eval 'sub KMSAN_TYPE_KMEM () {1;}' unless defined(&KMSAN_TYPE_KMEM);
	eval 'sub KMSAN_TYPE_MALLOC () {2;}' unless defined(&KMSAN_TYPE_MALLOC);
	eval 'sub KMSAN_TYPE_UMA () {3;}' unless defined(&KMSAN_TYPE_UMA);
	eval 'sub KMSAN_TYPE_MAX () {3;}' unless defined(&KMSAN_TYPE_MAX);
	eval 'sub KMSAN_RET_ADDR () {( &uintptr_t) &__builtin_return_address(0);}' unless defined(&KMSAN_RET_ADDR);
    } else {
	eval 'sub kmsan_init {
	    my($u) = @_;
    	    eval q();
	}' unless defined(&kmsan_init);
	eval 'sub kmsan_shadow_map {
	    my($a, $s) = @_;
    	    eval q();
	}' unless defined(&kmsan_shadow_map);
	eval 'sub kmsan_thread_alloc {
	    my($td) = @_;
    	    eval q();
	}' unless defined(&kmsan_thread_alloc);
	eval 'sub kmsan_thread_free {
	    my($l) = @_;
    	    eval q();
	}' unless defined(&kmsan_thread_free);
	eval 'sub kmsan_dma_sync {
	    my($m, $a, $s, $o) = @_;
    	    eval q();
	}' unless defined(&kmsan_dma_sync);
	eval 'sub kmsan_dma_load {
	    my($m, $b, $s, $o) = @_;
    	    eval q();
	}' unless defined(&kmsan_dma_load);
	eval 'sub kmsan_orig {
	    my($p, $l, $c, $a) = @_;
    	    eval q();
	}' unless defined(&kmsan_orig);
	eval 'sub kmsan_mark {
	    my($p, $l, $c) = @_;
    	    eval q();
	}' unless defined(&kmsan_mark);
	eval 'sub kmsan_mark_bio {
	    my($b, $c) = @_;
    	    eval q();
	}' unless defined(&kmsan_mark_bio);
	eval 'sub kmsan_mark_mbuf {
	    my($m, $c) = @_;
    	    eval q();
	}' unless defined(&kmsan_mark_mbuf);
	eval 'sub kmsan_check {
	    my($b, $s, $d) = @_;
    	    eval q();
	}' unless defined(&kmsan_check);
	eval 'sub kmsan_check_bio {
	    my($b, $d) = @_;
    	    eval q();
	}' unless defined(&kmsan_check_bio);
	eval 'sub kmsan_check_ccb {
	    my($c, $d) = @_;
    	    eval q();
	}' unless defined(&kmsan_check_ccb);
	eval 'sub kmsan_check_mbuf {
	    my($m, $d) = @_;
    	    eval q();
	}' unless defined(&kmsan_check_mbuf);
	eval 'sub kmsan_check_uio {
	    my($u, $d) = @_;
    	    eval q();
	}' unless defined(&kmsan_check_uio);
	eval 'sub kmsan_bus_dmamap_sync {
	    my($d, $op) = @_;
    	    eval q();
	}' unless defined(&kmsan_bus_dmamap_sync);
    }
}
1;

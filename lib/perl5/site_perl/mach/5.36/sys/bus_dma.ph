require '_h2ph_pre.ph';

no warnings qw(redefine misc);

unless(defined(&_BUS_DMA_H_)) {
    eval 'sub _BUS_DMA_H_ () {1;}' unless defined(&_BUS_DMA_H_);
    if(defined(&_KERNEL)) {
	require 'sys/_bus_dma.ph';
    }
    eval 'sub BUS_DMA_WAITOK () {0x;}' unless defined(&BUS_DMA_WAITOK);
    eval 'sub BUS_DMA_NOWAIT () {0x1;}' unless defined(&BUS_DMA_NOWAIT);
    eval 'sub BUS_DMA_ALLOCNOW () {0x2;}' unless defined(&BUS_DMA_ALLOCNOW);
    eval 'sub BUS_DMA_COHERENT () {0x4;}' unless defined(&BUS_DMA_COHERENT);
    eval 'sub BUS_DMA_ZERO () {0x8;}' unless defined(&BUS_DMA_ZERO);
    eval 'sub BUS_DMA_BUS1 () {0x10;}' unless defined(&BUS_DMA_BUS1);
    eval 'sub BUS_DMA_BUS2 () {0x20;}' unless defined(&BUS_DMA_BUS2);
    eval 'sub BUS_DMA_BUS3 () {0x40;}' unless defined(&BUS_DMA_BUS3);
    eval 'sub BUS_DMA_BUS4 () {0x80;}' unless defined(&BUS_DMA_BUS4);
    eval 'sub BUS_DMA_NOWRITE () {0x100;}' unless defined(&BUS_DMA_NOWRITE);
    eval 'sub BUS_DMA_NOCACHE () {0x200;}' unless defined(&BUS_DMA_NOCACHE);
    eval 'sub BUS_DMA_KEEP_PG_OFFSET () {0x400;}' unless defined(&BUS_DMA_KEEP_PG_OFFSET);
    eval 'sub BUS_DMA_LOAD_MBUF () {0x800;}' unless defined(&BUS_DMA_LOAD_MBUF);
    eval 'sub BUS_DMASYNC_PREREAD () {1;}' unless defined(&BUS_DMASYNC_PREREAD);
    eval 'sub BUS_DMASYNC_POSTREAD () {2;}' unless defined(&BUS_DMASYNC_POSTREAD);
    eval 'sub BUS_DMASYNC_PREWRITE () {4;}' unless defined(&BUS_DMASYNC_PREWRITE);
    eval 'sub BUS_DMASYNC_POSTWRITE () {8;}' unless defined(&BUS_DMASYNC_POSTWRITE);
    if(defined(&_KERNEL)) {
	eval("sub BD_PARAM_INVALID () { 0; }") unless defined(&BD_PARAM_INVALID);
	eval("sub BD_PARAM_PARENT () { 1; }") unless defined(&BD_PARAM_PARENT);
	eval("sub BD_PARAM_ALIGNMENT () { 2; }") unless defined(&BD_PARAM_ALIGNMENT);
	eval("sub BD_PARAM_BOUNDARY () { 3; }") unless defined(&BD_PARAM_BOUNDARY);
	eval("sub BD_PARAM_LOWADDR () { 4; }") unless defined(&BD_PARAM_LOWADDR);
	eval("sub BD_PARAM_HIGHADDR () { 5; }") unless defined(&BD_PARAM_HIGHADDR);
	eval("sub BD_PARAM_MAXSIZE () { 6; }") unless defined(&BD_PARAM_MAXSIZE);
	eval("sub BD_PARAM_NSEGMENTS () { 7; }") unless defined(&BD_PARAM_NSEGMENTS);
	eval("sub BD_PARAM_MAXSEGSIZE () { 8; }") unless defined(&BD_PARAM_MAXSEGSIZE);
	eval("sub BD_PARAM_FLAGS () { 9; }") unless defined(&BD_PARAM_FLAGS);
	eval("sub BD_PARAM_LOCKFUNC () { 10; }") unless defined(&BD_PARAM_LOCKFUNC);
	eval("sub BD_PARAM_LOCKFUNCARG () { 11; }") unless defined(&BD_PARAM_LOCKFUNCARG);
	eval("sub BD_PARAM_NAME () { 12; }") unless defined(&BD_PARAM_NAME);
	eval 'sub BD_PARENT {
	    my($val) = @_;
    	    eval q({  &BD_PARAM_PARENT, . &ptr = $val });
	}' unless defined(&BD_PARENT);
	eval 'sub BD_ALIGNMENT {
	    my($val) = @_;
    	    eval q({  &BD_PARAM_ALIGNMENT, . &num = $val });
	}' unless defined(&BD_ALIGNMENT);
	eval 'sub BD_BOUNDARY {
	    my($val) = @_;
    	    eval q({  &BD_PARAM_BOUNDARY, . &num = $val });
	}' unless defined(&BD_BOUNDARY);
	eval 'sub BD_LOWADDR {
	    my($val) = @_;
    	    eval q({  &BD_PARAM_LOWADDR, . &pa = $val });
	}' unless defined(&BD_LOWADDR);
	eval 'sub BD_HIGHADDR {
	    my($val) = @_;
    	    eval q({  &BD_PARAM_HIGHADDR, . &pa = $val });
	}' unless defined(&BD_HIGHADDR);
	eval 'sub BD_MAXSIZE {
	    my($val) = @_;
    	    eval q({  &BD_PARAM_MAXSIZE, . &num = $val });
	}' unless defined(&BD_MAXSIZE);
	eval 'sub BD_NSEGMENTS {
	    my($val) = @_;
    	    eval q({  &BD_PARAM_NSEGMENTS, . &num = $val });
	}' unless defined(&BD_NSEGMENTS);
	eval 'sub BD_MAXSEGSIZE {
	    my($val) = @_;
    	    eval q({  &BD_PARAM_MAXSEGSIZE, . &num = $val });
	}' unless defined(&BD_MAXSEGSIZE);
	eval 'sub BD_FLAGS {
	    my($val) = @_;
    	    eval q({  &BD_PARAM_FLAGS, . &num = $val });
	}' unless defined(&BD_FLAGS);
	eval 'sub BD_LOCKFUNC {
	    my($val) = @_;
    	    eval q({  &BD_PARAM_LOCKFUNC, . &ptr = $val });
	}' unless defined(&BD_LOCKFUNC);
	eval 'sub BD_LOCKFUNCARG {
	    my($val) = @_;
    	    eval q({  &BD_PARAM_LOCKFUNCARG, . &ptr = $val });
	}' unless defined(&BD_LOCKFUNCARG);
	eval 'sub BD_NAME {
	    my($val) = @_;
    	    eval q({  &BD_PARAM_NAME, . &ptr = $val });
	}' unless defined(&BD_NAME);
	eval 'sub BUS_DMA_TEMPLATE_FILL () {( &t,  &kv...)  &do {  &bus_dma_param_t  $pm[] = {  &kv };  &bus_dma_template_fill( &t,  &pm,  &howmany($sizeof{ &pm}, $sizeof{ $pm[0]})); }  &while (0);}' unless defined(&BUS_DMA_TEMPLATE_FILL);
	if(defined(&WANT_INLINE_DMAMAP)) {
	    eval 'sub BUS_DMAMAP_OP () { &static  &inline;}' unless defined(&BUS_DMAMAP_OP);
	} else {
	    eval 'sub BUS_DMAMAP_OP () {1;}' unless defined(&BUS_DMAMAP_OP);
	}
	undef(&BUS_DMAMAP_OP) if defined(&BUS_DMAMAP_OP);
    }
}
1;

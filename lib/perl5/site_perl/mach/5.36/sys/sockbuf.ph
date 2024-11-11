require '_h2ph_pre.ph';

no warnings qw(redefine misc);

unless(defined(&_SYS_SOCKBUF_H_)) {
    eval 'sub _SYS_SOCKBUF_H_ () {1;}' unless defined(&_SYS_SOCKBUF_H_);
    eval 'sub SB_TLS_RX () {0x1;}' unless defined(&SB_TLS_RX);
    eval 'sub SB_TLS_RX_RUNNING () {0x2;}' unless defined(&SB_TLS_RX_RUNNING);
    eval 'sub SB_WAIT () {0x4;}' unless defined(&SB_WAIT);
    eval 'sub SB_SEL () {0x8;}' unless defined(&SB_SEL);
    eval 'sub SB_ASYNC () {0x10;}' unless defined(&SB_ASYNC);
    eval 'sub SB_UPCALL () {0x20;}' unless defined(&SB_UPCALL);
    eval 'sub SB_NOINTR () {0x40;}' unless defined(&SB_NOINTR);
    eval 'sub SB_AIO () {0x80;}' unless defined(&SB_AIO);
    eval 'sub SB_KNOTE () {0x100;}' unless defined(&SB_KNOTE);
    eval 'sub SB_NOCOALESCE () {0x200;}' unless defined(&SB_NOCOALESCE);
    eval 'sub SB_IN_TOE () {0x400;}' unless defined(&SB_IN_TOE);
    eval 'sub SB_AUTOSIZE () {0x800;}' unless defined(&SB_AUTOSIZE);
    eval 'sub SB_STOP () {0x1000;}' unless defined(&SB_STOP);
    eval 'sub SB_AIO_RUNNING () {0x2000;}' unless defined(&SB_AIO_RUNNING);
    eval 'sub SB_UNUSED () {0x4000;}' unless defined(&SB_UNUSED);
    eval 'sub SB_TLS_RX_RESYNC () {0x8000;}' unless defined(&SB_TLS_RX_RESYNC);
    eval 'sub SBS_CANTSENDMORE () {0x10;}' unless defined(&SBS_CANTSENDMORE);
    eval 'sub SBS_CANTRCVMORE () {0x20;}' unless defined(&SBS_CANTRCVMORE);
    eval 'sub SBS_RCVATMARK () {0x40;}' unless defined(&SBS_RCVATMARK);
    if(defined(&_KERNEL) || defined(&_WANT_SOCKET)) {
	require 'sys/_lock.ph';
	require 'sys/_mutex.ph';
	require 'sys/_sx.ph';
	require 'sys/_task.ph';
	eval 'sub SB_MAX () {(2*1024*1024);}' unless defined(&SB_MAX);
    }
    if(defined(&_KERNEL)) {
	eval("sub SO_RCV () { 0; }") unless defined(&SO_RCV);
	eval("sub SO_SND () { 1; }") unless defined(&SO_SND);
	eval 'sub SOCKBUF_MTX {
	    my($_sb) = @_;
    	    eval q((($_sb)-> &sb_mtx));
	}' unless defined(&SOCKBUF_MTX);
	eval 'sub SOCKBUF_LOCK {
	    my($_sb) = @_;
    	    eval q( &mtx_lock( &SOCKBUF_MTX($_sb)));
	}' unless defined(&SOCKBUF_LOCK);
	eval 'sub SOCKBUF_OWNED {
	    my($_sb) = @_;
    	    eval q( &mtx_owned( &SOCKBUF_MTX($_sb)));
	}' unless defined(&SOCKBUF_OWNED);
	eval 'sub SOCKBUF_UNLOCK {
	    my($_sb) = @_;
    	    eval q( &mtx_unlock( &SOCKBUF_MTX($_sb)));
	}' unless defined(&SOCKBUF_UNLOCK);
	eval 'sub SOCKBUF_LOCK_ASSERT {
	    my($_sb) = @_;
    	    eval q( &mtx_assert( &SOCKBUF_MTX($_sb),  &MA_OWNED));
	}' unless defined(&SOCKBUF_LOCK_ASSERT);
	eval 'sub SOCKBUF_UNLOCK_ASSERT {
	    my($_sb) = @_;
    	    eval q( &mtx_assert( &SOCKBUF_MTX($_sb),  &MA_NOTOWNED));
	}' unless defined(&SOCKBUF_UNLOCK_ASSERT);
	eval 'sub M_NOTREADY () { &M_PROTO1;}' unless defined(&M_NOTREADY);
	eval 'sub M_BLOCKED () { &M_PROTO2;}' unless defined(&M_BLOCKED);
	eval 'sub M_NOTAVAIL () {( &M_NOTREADY |  &M_BLOCKED);}' unless defined(&M_NOTAVAIL);
	if(0) {
	}
	if(0) {
	}
	if(0) {
	}
	eval 'sub SB_EMPTY_FIXUP {
	    my($sb) = @_;
    	    eval q( &do {  &if (($sb)-> &sb_mb ==  &NULL) { ($sb)-> &sb_mbtail =  &NULL; ($sb)-> &sb_lastrecord =  &NULL; } }  &while ( 0));
	}' unless defined(&SB_EMPTY_FIXUP);
	if(defined(&SOCKBUF_DEBUG)) {
	    eval 'sub SBLASTRECORDCHK {
	        my($sb) = @_;
    		eval q( &sblastrecordchk(($sb),  &__FILE__,  &__LINE__));
	    }' unless defined(&SBLASTRECORDCHK);
	    eval 'sub SBLASTMBUFCHK {
	        my($sb) = @_;
    		eval q( &sblastmbufchk(($sb),  &__FILE__,  &__LINE__));
	    }' unless defined(&SBLASTMBUFCHK);
	    eval 'sub SBCHECK {
	        my($sb) = @_;
    		eval q( &sbcheck(($sb),  &__FILE__,  &__LINE__));
	    }' unless defined(&SBCHECK);
	} else {
	    eval 'sub SBLASTRECORDCHK {
	        my($sb) = @_;
    		eval q( &do {}  &while (0));
	    }' unless defined(&SBLASTRECORDCHK);
	    eval 'sub SBLASTMBUFCHK {
	        my($sb) = @_;
    		eval q( &do {}  &while (0));
	    }' unless defined(&SBLASTMBUFCHK);
	    eval 'sub SBCHECK {
	        my($sb) = @_;
    		eval q( &do {}  &while (0));
	    }' unless defined(&SBCHECK);
	}
    }
}
1;

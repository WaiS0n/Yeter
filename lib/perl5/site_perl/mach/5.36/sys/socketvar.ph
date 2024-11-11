require '_h2ph_pre.ph';

no warnings qw(redefine misc);

unless(defined(&_SYS_SOCKETVAR_H_)) {
    eval 'sub _SYS_SOCKETVAR_H_ () {1;}' unless defined(&_SYS_SOCKETVAR_H_);
    if(defined(&_KERNEL) || defined(&_WANT_SOCKET)) {
	require 'sys/queue.ph';
	require 'sys/selinfo.ph';
	require 'sys/_lock.ph';
	require 'sys/_mutex.ph';
	require 'sys/osd.ph';
	require 'sys/_sx.ph';
	require 'sys/sockbuf.ph';
	if(defined(&_KERNEL)) {
	    require 'sys/caprights.ph';
	    require 'sys/sockopt.ph';
	}
	eval("sub SQ_NONE () { 0; }") unless defined(&SQ_NONE);
	eval("sub SQ_INCOMP () { 0x0800; }") unless defined(&SQ_INCOMP);
	eval("sub SQ_COMP () { 0x1000; }") unless defined(&SQ_COMP);
    }
    eval 'sub SS_ISCONNECTED () {0x2;}' unless defined(&SS_ISCONNECTED);
    eval 'sub SS_ISCONNECTING () {0x4;}' unless defined(&SS_ISCONNECTING);
    eval 'sub SS_ISDISCONNECTING () {0x8;}' unless defined(&SS_ISDISCONNECTING);
    eval 'sub SS_NBIO () {0x100;}' unless defined(&SS_NBIO);
    eval 'sub SS_ASYNC () {0x200;}' unless defined(&SS_ASYNC);
    eval 'sub SS_ISCONFIRMING () {0x400;}' unless defined(&SS_ISCONFIRMING);
    eval 'sub SS_ISDISCONNECTED () {0x2000;}' unless defined(&SS_ISDISCONNECTED);
    if(defined(&_KERNEL)) {
	eval 'sub SOCK_MTX {
	    my($so) = @_;
    	    eval q((($so)-> &so_lock));
	}' unless defined(&SOCK_MTX);
	eval 'sub SOCK_LOCK {
	    my($so) = @_;
    	    eval q( &mtx_lock(($so)-> &so_lock));
	}' unless defined(&SOCK_LOCK);
	eval 'sub SOCK_OWNED {
	    my($so) = @_;
    	    eval q( &mtx_owned(($so)-> &so_lock));
	}' unless defined(&SOCK_OWNED);
	eval 'sub SOCK_UNLOCK {
	    my($so) = @_;
    	    eval q( &mtx_unlock(($so)-> &so_lock));
	}' unless defined(&SOCK_UNLOCK);
	eval 'sub SOCK_LOCK_ASSERT {
	    my($so) = @_;
    	    eval q( &mtx_assert(($so)-> &so_lock,  &MA_OWNED));
	}' unless defined(&SOCK_LOCK_ASSERT);
	eval 'sub SOCK_UNLOCK_ASSERT {
	    my($so) = @_;
    	    eval q( &mtx_assert(($so)-> &so_lock,  &MA_NOTOWNED));
	}' unless defined(&SOCK_UNLOCK_ASSERT);
	eval 'sub SOLISTENING {
	    my($sol) = @_;
    	    eval q(((($sol)-> &so_options &  &SO_ACCEPTCONN) != 0));
	}' unless defined(&SOLISTENING);
	eval 'sub SOLISTEN_LOCK {
	    my($sol) = @_;
    	    eval q( &do {  &mtx_lock(($sol)-> &so_lock);  &KASSERT( &SOLISTENING($sol), (\\"%s: %p not listening\\",  &__func__, ($sol))); }  &while (0));
	}' unless defined(&SOLISTEN_LOCK);
	eval 'sub SOLISTEN_TRYLOCK {
	    my($sol) = @_;
    	    eval q( &mtx_trylock(($sol)-> &so_lock));
	}' unless defined(&SOLISTEN_TRYLOCK);
	eval 'sub SOLISTEN_UNLOCK {
	    my($sol) = @_;
    	    eval q( &do {  &KASSERT( &SOLISTENING($sol), (\\"%s: %p not listening\\",  &__func__, ($sol)));  &mtx_unlock(($sol)-> &so_lock); }  &while (0));
	}' unless defined(&SOLISTEN_UNLOCK);
	eval 'sub SOLISTEN_LOCK_ASSERT {
	    my($sol) = @_;
    	    eval q( &do {  &mtx_assert(($sol)-> &so_lock,  &MA_OWNED);  &KASSERT( &SOLISTENING($sol), (\\"%s: %p not listening\\",  &__func__, ($sol))); }  &while (0));
	}' unless defined(&SOLISTEN_LOCK_ASSERT);
	eval 'sub SOLISTEN_UNLOCK_ASSERT {
	    my($sol) = @_;
    	    eval q( &do {  &mtx_assert(($sol)-> &so_lock,  &MA_NOTOWNED);  &KASSERT( &SOLISTENING($sol), (\\"%s: %p not listening\\",  &__func__, ($sol))); }  &while (0));
	}' unless defined(&SOLISTEN_UNLOCK_ASSERT);
	eval 'sub SOCK_RECVBUF_MTX {
	    my($so) = @_;
    	    eval q((($so)-> &so_rcv_mtx));
	}' unless defined(&SOCK_RECVBUF_MTX);
	eval 'sub SOCK_RECVBUF_LOCK {
	    my($so) = @_;
    	    eval q( &mtx_lock( &SOCK_RECVBUF_MTX($so)));
	}' unless defined(&SOCK_RECVBUF_LOCK);
	eval 'sub SOCK_RECVBUF_UNLOCK {
	    my($so) = @_;
    	    eval q( &mtx_unlock( &SOCK_RECVBUF_MTX($so)));
	}' unless defined(&SOCK_RECVBUF_UNLOCK);
	eval 'sub SOCK_RECVBUF_LOCK_ASSERT {
	    my($so) = @_;
    	    eval q( &mtx_assert( &SOCK_RECVBUF_MTX($so),  &MA_OWNED));
	}' unless defined(&SOCK_RECVBUF_LOCK_ASSERT);
	eval 'sub SOCK_RECVBUF_UNLOCK_ASSERT {
	    my($so) = @_;
    	    eval q( &mtx_assert( &SOCK_RECVBUF_MTX($so),  &MA_NOTOWNED));
	}' unless defined(&SOCK_RECVBUF_UNLOCK_ASSERT);
	eval 'sub SOCK_SENDBUF_MTX {
	    my($so) = @_;
    	    eval q((($so)-> &so_snd_mtx));
	}' unless defined(&SOCK_SENDBUF_MTX);
	eval 'sub SOCK_SENDBUF_LOCK {
	    my($so) = @_;
    	    eval q( &mtx_lock( &SOCK_SENDBUF_MTX($so)));
	}' unless defined(&SOCK_SENDBUF_LOCK);
	eval 'sub SOCK_SENDBUF_UNLOCK {
	    my($so) = @_;
    	    eval q( &mtx_unlock( &SOCK_SENDBUF_MTX($so)));
	}' unless defined(&SOCK_SENDBUF_UNLOCK);
	eval 'sub SOCK_SENDBUF_LOCK_ASSERT {
	    my($so) = @_;
    	    eval q( &mtx_assert( &SOCK_SENDBUF_MTX($so),  &MA_OWNED));
	}' unless defined(&SOCK_SENDBUF_LOCK_ASSERT);
	eval 'sub SOCK_SENDBUF_UNLOCK_ASSERT {
	    my($so) = @_;
    	    eval q( &mtx_assert( &SOCK_SENDBUF_MTX($so),  &MA_NOTOWNED));
	}' unless defined(&SOCK_SENDBUF_UNLOCK_ASSERT);
	eval 'sub SOCK_BUF_LOCK {
	    my($so, $which) = @_;
    	    eval q( &mtx_lock( &soeventmtx($so, $which)));
	}' unless defined(&SOCK_BUF_LOCK);
	eval 'sub SOCK_BUF_UNLOCK {
	    my($so, $which) = @_;
    	    eval q( &mtx_unlock( &soeventmtx($so, $which)));
	}' unless defined(&SOCK_BUF_UNLOCK);
	eval 'sub SOCK_BUF_LOCK_ASSERT {
	    my($so, $which) = @_;
    	    eval q( &mtx_assert( &soeventmtx($so, $which),  &MA_OWNED));
	}' unless defined(&SOCK_BUF_LOCK_ASSERT);
	eval 'sub SOCK_BUF_UNLOCK_ASSERT {
	    my($so, $which) = @_;
    	    eval q( &mtx_assert( &soeventmtx($so, $which),  &MA_NOTOWNED));
	}' unless defined(&SOCK_BUF_UNLOCK_ASSERT);
	eval 'sub sobuf {
	    my($so,$which) = @_;
    	    eval q({ ($which ==  &SO_RCV ?  ($so->{so_rcv}) :  ($so->{so_snd})); });
	}' unless defined(&sobuf);
	eval 'sub soeventmtx {
	    my($so,$which) = @_;
    	    eval q({ ($which ==  &SO_RCV ?  &SOCK_RECVBUF_MTX($so) :  &SOCK_SENDBUF_MTX($so)); });
	}' unless defined(&soeventmtx);
	eval 'sub SBL_WAIT () {0x1;}' unless defined(&SBL_WAIT);
	eval 'sub SBL_NOINTR () {0x2;}' unless defined(&SBL_NOINTR);
	eval 'sub SBL_VALID () {( &SBL_WAIT |  &SBL_NOINTR);}' unless defined(&SBL_VALID);
	eval 'sub SBLOCKWAIT {
	    my($f) = @_;
    	    eval q(((($f) &  &MSG_DONTWAIT) ? 0:  &SBL_WAIT));
	}' unless defined(&SBLOCKWAIT);
	eval 'sub SOCK_IO_SEND_LOCK {
	    my($so, $flags) = @_;
    	    eval q( &soiolock(($so), ($so)-> &so_snd_sx, ($flags)));
	}' unless defined(&SOCK_IO_SEND_LOCK);
	eval 'sub SOCK_IO_SEND_UNLOCK {
	    my($so) = @_;
    	    eval q( &soiounlock(($so)-> &so_snd_sx));
	}' unless defined(&SOCK_IO_SEND_UNLOCK);
	eval 'sub SOCK_IO_SEND_OWNED {
	    my($so) = @_;
    	    eval q( &sx_xlocked(($so)-> &so_snd_sx));
	}' unless defined(&SOCK_IO_SEND_OWNED);
	eval 'sub SOCK_IO_RECV_LOCK {
	    my($so, $flags) = @_;
    	    eval q( &soiolock(($so), ($so)-> &so_rcv_sx, ($flags)));
	}' unless defined(&SOCK_IO_RECV_LOCK);
	eval 'sub SOCK_IO_RECV_UNLOCK {
	    my($so) = @_;
    	    eval q( &soiounlock(($so)-> &so_rcv_sx));
	}' unless defined(&SOCK_IO_RECV_UNLOCK);
	eval 'sub SOCK_IO_RECV_OWNED {
	    my($so) = @_;
    	    eval q( &sx_xlocked(($so)-> &so_rcv_sx));
	}' unless defined(&SOCK_IO_RECV_OWNED);
	eval 'sub sosendallatonce {
	    my($so) = @_;
    	    eval q((($so)-> ($so_proto->{pr_flags}) &  &PR_ATOMIC));
	}' unless defined(&sosendallatonce);
	eval 'sub soreadabledata {
	    my($so) = @_;
    	    eval q(( &sbavail(($so)-> &so_rcv) >= ($so)-> ($so_rcv->{sb_lowat}) || ($so)-> &so_error || ($so)-> &so_rerror));
	}' unless defined(&soreadabledata);
	eval 'sub soreadable {
	    my($so) = @_;
    	    eval q(( &soreadabledata($so) || (($so)-> ($so_rcv->{sb_state}) &  &SBS_CANTRCVMORE)));
	}' unless defined(&soreadable);
	eval 'sub sowriteable {
	    my($so) = @_;
    	    eval q((( &sbspace(($so)-> &so_snd) >= ($so)-> ($so_snd->{sb_lowat})  && ((($so)-> &so_state &SS_ISCONNECTED) || (($so)-> ($so_proto->{pr_flags})& &PR_CONNREQUIRED)==0)) || (($so)-> ($so_snd->{sb_state}) &  &SBS_CANTSENDMORE) || ($so)-> &so_error));
	}' unless defined(&sowriteable);
	eval 'sub soref {
	    my($so) = @_;
    	    eval q( &refcount_acquire(($so)-> &so_count));
	}' unless defined(&soref);
	eval 'sub sorele {
	    my($so) = @_;
    	    eval q( &do {  &SOCK_UNLOCK_ASSERT($so);  &if (! &refcount_release_if_not_last(($so)-> &so_count)) {  &SOCK_LOCK($so);  &sorele_locked($so); } }  &while (0));
	}' unless defined(&sorele);
	eval 'sub sorwakeup {
	    my($so) = @_;
    	    eval q( &do {  &SOCK_RECVBUF_LOCK($so);  &sorwakeup_locked($so); }  &while (0));
	}' unless defined(&sorwakeup);
	eval 'sub sowwakeup {
	    my($so) = @_;
    	    eval q( &do {  &SOCK_SENDBUF_LOCK($so);  &sowwakeup_locked($so); }  &while (0));
	}' unless defined(&sowwakeup);
	eval 'sub ACCEPT_FILTER_DEFINE {
	    my($modname, $filtname, $cb, $create, $destroy, $ver) = @_;
    	    eval q( &static \'struct accept_filter\' $modname &_filter = { . &accf_name = $filtname, . &accf_callback = $cb, . &accf_create = $create, . &accf_destroy = $destroy, };  &static  &moduledata_t $modname &_mod = { . &name =  &__XSTRING($modname), . &evhand =  &accept_filt_generic_mod_event, . &priv = $modname &_filter, };  &DECLARE_MODULE($modname, $modname &_mod,  &SI_SUB_DRIVERS,  &SI_ORDER_MIDDLE);  &MODULE_VERSION($modname, $ver));
	}' unless defined(&ACCEPT_FILTER_DEFINE);
	if(defined(&MALLOC_DECLARE)) {
	}
	eval 'sub HHOOK_SOCKET_OPT () {0;}' unless defined(&HHOOK_SOCKET_OPT);
	eval 'sub HHOOK_SOCKET_CREATE () {1;}' unless defined(&HHOOK_SOCKET_CREATE);
	eval 'sub HHOOK_SOCKET_RCV () {2;}' unless defined(&HHOOK_SOCKET_RCV);
	eval 'sub HHOOK_SOCKET_SND () {3;}' unless defined(&HHOOK_SOCKET_SND);
	eval 'sub HHOOK_FILT_SOREAD () {4;}' unless defined(&HHOOK_FILT_SOREAD);
	eval 'sub HHOOK_FILT_SOWRITE () {5;}' unless defined(&HHOOK_FILT_SOWRITE);
	eval 'sub HHOOK_SOCKET_CLOSE () {6;}' unless defined(&HHOOK_SOCKET_CLOSE);
	eval 'sub HHOOK_SOCKET_LAST () { &HHOOK_SOCKET_CLOSE;}' unless defined(&HHOOK_SOCKET_LAST);
	eval 'sub SU_OK () {0;}' unless defined(&SU_OK);
	eval 'sub SU_ISCONNECTED () {1;}' unless defined(&SU_ISCONNECTED);
	if(defined(&ACCEPT_FILTER_MOD)) {
	    if(defined(&SYSCTL_DECL)) {
	    }
	}
    }
    if(defined(&_KERNEL)) {
    }
    eval 'sub SBS_CANTSENDMORE () {0x10;}' unless defined(&SBS_CANTSENDMORE);
    eval 'sub SBS_CANTRCVMORE () {0x20;}' unless defined(&SBS_CANTRCVMORE);
    eval 'sub SBS_RCVATMARK () {0x40;}' unless defined(&SBS_RCVATMARK);
}
1;

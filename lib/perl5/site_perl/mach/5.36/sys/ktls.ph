require '_h2ph_pre.ph';

no warnings qw(redefine misc);

unless(defined(&_SYS_KTLS_H_)) {
    eval 'sub _SYS_KTLS_H_ () {1;}' unless defined(&_SYS_KTLS_H_);
    if(defined(&_KERNEL)) {
	require 'sys/refcount.ph';
	require 'sys/_task.ph';
    }
    eval 'sub TLS_MAX_MSG_SIZE_V10_2 () {16384;}' unless defined(&TLS_MAX_MSG_SIZE_V10_2);
    eval 'sub TLS_MAX_PARAM_SIZE () {1024;}' unless defined(&TLS_MAX_PARAM_SIZE);
    eval 'sub TLS_AEAD_GCM_LEN () {4;}' unless defined(&TLS_AEAD_GCM_LEN);
    eval 'sub TLS_1_3_GCM_IV_LEN () {12;}' unless defined(&TLS_1_3_GCM_IV_LEN);
    eval 'sub TLS_CHACHA20_IV_LEN () {12;}' unless defined(&TLS_CHACHA20_IV_LEN);
    eval 'sub TLS_CBC_IMPLICIT_IV_LEN () {16;}' unless defined(&TLS_CBC_IMPLICIT_IV_LEN);
    eval 'sub TLS_RLTYPE_ALERT () {21;}' unless defined(&TLS_RLTYPE_ALERT);
    eval 'sub TLS_RLTYPE_HANDSHAKE () {22;}' unless defined(&TLS_RLTYPE_HANDSHAKE);
    eval 'sub TLS_RLTYPE_APP () {23;}' unless defined(&TLS_RLTYPE_APP);
    eval 'sub TLS_MAJOR_VER_ONE () {3;}' unless defined(&TLS_MAJOR_VER_ONE);
    eval 'sub TLS_MINOR_VER_ZERO () {1;}' unless defined(&TLS_MINOR_VER_ZERO);
    eval 'sub TLS_MINOR_VER_ONE () {2;}' unless defined(&TLS_MINOR_VER_ONE);
    eval 'sub TLS_MINOR_VER_TWO () {3;}' unless defined(&TLS_MINOR_VER_TWO);
    eval 'sub TLS_MINOR_VER_THREE () {4;}' unless defined(&TLS_MINOR_VER_THREE);
    if(defined(&_KERNEL)) {
    }
    if(defined(&_KERNEL)) {
	eval 'sub KTLS_TX () {1;}' unless defined(&KTLS_TX);
	eval 'sub KTLS_RX () {2;}' unless defined(&KTLS_RX);
	eval("sub KTLS_MBUF_CRYPTO_ST_MIXED () { 0; }") unless defined(&KTLS_MBUF_CRYPTO_ST_MIXED);
	eval("sub KTLS_MBUF_CRYPTO_ST_ENCRYPTED () { 1; }") unless defined(&KTLS_MBUF_CRYPTO_ST_ENCRYPTED);
	eval("sub KTLS_MBUF_CRYPTO_ST_DECRYPTED () { -1; }") unless defined(&KTLS_MBUF_CRYPTO_ST_DECRYPTED);
	if(defined(&RATELIMIT)) {
	}
	eval 'sub ktls_hold {
	    my($tls) = @_;
    	    eval q({  &if ($tls !=  &NULL)  &refcount_acquire( ($tls->{refcount})); ($tls); });
	}' unless defined(&ktls_hold);
	eval 'sub ktls_free {
	    my($tls) = @_;
    	    eval q({  &if ( &refcount_release( ($tls->{refcount})))  &ktls_destroy($tls); });
	}' unless defined(&ktls_free);
    }
}
1;

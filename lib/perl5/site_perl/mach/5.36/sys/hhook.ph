require '_h2ph_pre.ph';

no warnings qw(redefine misc);

unless(defined(&_SYS_HHOOK_H_)) {
    eval 'sub _SYS_HHOOK_H_ () {1;}' unless defined(&_SYS_HHOOK_H_);
    require 'sys/lock.ph';
    require 'sys/rmlock.ph';
    eval 'sub HHH_ISINVNET () {0x1;}' unless defined(&HHH_ISINVNET);
    eval 'sub HHOOK_WAITOK () {0x1;}' unless defined(&HHOOK_WAITOK);
    eval 'sub HHOOK_NOWAIT () {0x2;}' unless defined(&HHOOK_NOWAIT);
    eval 'sub HHOOK_HEADISINVNET () {0x100;}' unless defined(&HHOOK_HEADISINVNET);
    eval 'sub HHOOK_TYPE_TCP () {1;}' unless defined(&HHOOK_TYPE_TCP);
    eval 'sub HHOOK_TYPE_SOCKET () {2;}' unless defined(&HHOOK_TYPE_SOCKET);
    eval 'sub HHOOK_TYPE_IPSEC_IN () {3;}' unless defined(&HHOOK_TYPE_IPSEC_IN);
    eval 'sub HHOOK_TYPE_IPSEC_OUT () {4;}' unless defined(&HHOOK_TYPE_IPSEC_OUT);
    eval 'sub HHOOKS_RUN_IF {
        my($hhh, $ctx_data, $hosd) = @_;
	    eval q( &do {  &if ($hhh !=  &NULL  &&  ($hhh->{hhh_nhooks}) > 0)  &hhook_run_hooks($hhh, $ctx_data, $hosd); }  &while (0));
    }' unless defined(&HHOOKS_RUN_IF);
    eval 'sub HHOOKS_RUN_LOOKUP_IF {
        my($hhook_type, $hhook_id, $ctx_data, $hosd) = @_;
	    eval q( &do { \'struct hhook_head\' * &_hhh;  &_hhh =  &hhook_head_get($hhook_type, $hhook_id);  &if ( &_hhh !=  &NULL) {  &if ( ($_hhh->{hhh_nhooks}) > 0)  &hhook_run_hooks( &_hhh, $ctx_data, $hosd);  &hhook_head_release( &_hhh); } }  &while (0));
    }' unless defined(&HHOOKS_RUN_LOOKUP_IF);
}
1;

require '_h2ph_pre.ph';

no warnings qw(redefine misc);

unless(defined(&_SYS_UNPCB_H_)) {
    eval 'sub _SYS_UNPCB_H_ () {1;}' unless defined(&_SYS_UNPCB_H_);
    if(defined(&_KERNEL) || defined(&_WANT_UNPCB)) {
	require 'sys/queue.ph';
	require 'sys/ucred.ph';
	eval 'sub UNP_HAVEPC () {0x1;}' unless defined(&UNP_HAVEPC);
	eval 'sub UNP_WANTCRED_ALWAYS () {0x2;}' unless defined(&UNP_WANTCRED_ALWAYS);
	eval 'sub UNP_WANTCRED_ONESHOT () {0x4;}' unless defined(&UNP_WANTCRED_ONESHOT);
	eval 'sub UNP_CONNWAIT () {0x8;}' unless defined(&UNP_CONNWAIT);
	eval 'sub UNP_WANTCRED_MASK () {( &UNP_WANTCRED_ONESHOT |  &UNP_WANTCRED_ALWAYS);}' unless defined(&UNP_WANTCRED_MASK);
	eval 'sub UNP_CONNECTING () {0x10;}' unless defined(&UNP_CONNECTING);
	eval 'sub UNP_BINDING () {0x20;}' unless defined(&UNP_BINDING);
	eval 'sub UNP_WAITING () {0x40;}' unless defined(&UNP_WAITING);
	eval 'sub UNPGC_DEAD () {0x1;}' unless defined(&UNPGC_DEAD);
	eval 'sub UNPGC_IGNORE_RIGHTS () {0x2;}' unless defined(&UNPGC_IGNORE_RIGHTS);
	eval 'sub sotounpcb {
	    my($so) = @_;
    	    eval q(((($so)-> &so_pcb)));
	}' unless defined(&sotounpcb);
    }
    if(defined(&_SYS_SOCKETVAR_H_)) {
    }
    if(defined(&_KERNEL)) {
    }
}
1;

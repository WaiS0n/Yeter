require '_h2ph_pre.ph';

no warnings qw(redefine misc);

unless(defined(&_SYS_UCRED_H_)) {
    eval 'sub _SYS_UCRED_H_ () {1;}' unless defined(&_SYS_UCRED_H_);
    if(defined(&_KERNEL) || defined(&_WANT_UCRED)) {
	require 'sys/_lock.ph';
	require 'sys/_mutex.ph';
    }
    require 'bsm/audit.ph';
    eval 'sub XU_NGROUPS () {16;}' unless defined(&XU_NGROUPS);
    if(defined(&_KERNEL) || defined(&_WANT_UCRED)) {
	eval 'sub cr_startcopy () { &cr_uid;}' unless defined(&cr_startcopy);
	eval 'sub cr_endcopy () { &cr_label;}' unless defined(&cr_endcopy);
	eval 'sub NOCRED () {(0);}' unless defined(&NOCRED);
	eval 'sub FSCRED () {(-1);}' unless defined(&FSCRED);
    }
    eval 'sub CRED_FLAG_CAPMODE () {0x1;}' unless defined(&CRED_FLAG_CAPMODE);
    eval 'sub XUCRED_VERSION () {0;}' unless defined(&XUCRED_VERSION);
    eval 'sub cr_gid () { $cr_groups[0];}' unless defined(&cr_gid);
    if(defined(&_KERNEL)) {
	eval 'sub credbatch_prep {
	    my($crb) = @_;
    	    eval q({  ($crb->{cred}) =  &NULL;  ($crb->{users}) = 0;  ($crb->{ref}) = 0; });
	}' unless defined(&credbatch_prep);
	eval 'sub credbatch_process {
	    my($__unused) = @_;
    	    eval q({ });
	}' unless defined(&credbatch_process);
    }
}
1;

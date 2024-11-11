require '_h2ph_pre.ph';

no warnings qw(redefine misc);

unless(defined(&_SYS_RESOURCEVAR_H_)) {
    eval 'sub _SYS_RESOURCEVAR_H_ () {1;}' unless defined(&_SYS_RESOURCEVAR_H_);
    require 'sys/resource.ph';
    require 'sys/queue.ph';
    if(defined(&_KERNEL)) {
	require 'sys/_lock.ph';
	require 'sys/_mutex.ph';
    }
    eval 'sub pstat_startzero () { &p_cru;}' unless defined(&pstat_startzero);
    eval 'sub pstat_endzero () { &pstat_startcopy;}' unless defined(&pstat_endzero);
    eval 'sub pstat_startcopy () { &p_prof;}' unless defined(&pstat_startcopy);
    eval 'sub pstat_endcopy () { &p_start;}' unless defined(&pstat_endcopy);
    if(defined(&_KERNEL)) {
	eval 'sub limbatch_prep {
	    my($lb) = @_;
    	    eval q({  ($lb->{limp}) =  &NULL;  ($lb->{count}) = 0; });
	}' unless defined(&limbatch_prep);
	eval 'sub limbatch_process {
	    my($__unused) = @_;
    	    eval q({ });
	}' unless defined(&limbatch_process);
	if(defined(&RACCT)) {
	}
	eval 'sub lim_cur {
	    my($td, $which) = @_;
    	    eval q(({  &rlim_t  &_rlim; \'struct thread\' * &_td = ($td); \'int\'  &_which = ($which);  &if ( &__builtin_constant_p($which)  && $which !=  &RLIMIT_DATA  && $which !=  &RLIMIT_STACK  && $which !=  &RLIMIT_VMEM) {  &_rlim =  ($_$td->{td_limit}->{pl_rlimit[_$which]}->{rlim_cur}); }  &else {  &_rlim =  &lim_cur( &_td,  &_which); }  &_rlim; }));
	}' unless defined(&lim_cur);
	if(defined(&RACCT)) {
	}
    }
}
1;

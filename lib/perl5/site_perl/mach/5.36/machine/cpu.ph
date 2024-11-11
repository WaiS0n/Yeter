require '_h2ph_pre.ph';

no warnings qw(redefine misc);

unless(defined(&_MACHINE_CPU_H_)) {
    eval 'sub _MACHINE_CPU_H_ () {1;}' unless defined(&_MACHINE_CPU_H_);
    require 'machine/psl.ph';
    require 'machine/frame.ph';
    require 'machine/segments.ph';
    eval 'sub cpu_exec {
        my($p) = @_;
	    eval q();
    }' unless defined(&cpu_exec);
    eval 'sub cpu_swapin {
        my($p) = @_;
	    eval q();
    }' unless defined(&cpu_swapin);
    eval 'sub cpu_getstack {
        my($td) = @_;
	    eval q((($td)-> ($td_frame->{tf_rsp})));
    }' unless defined(&cpu_getstack);
    eval 'sub cpu_setstack {
        my($td, $ap) = @_;
	    eval q((($td)-> ($td_frame->{tf_rsp}) = ($ap)));
    }' unless defined(&cpu_setstack);
    eval 'sub cpu_spinwait () {
        eval q( &ia32_pause());
    }' unless defined(&cpu_spinwait);
    eval 'sub TRAPF_USERMODE {
        my($framep) = @_;
	    eval q(( &ISPL(($framep)-> &tf_cs) ==  &SEL_UPL));
    }' unless defined(&TRAPF_USERMODE);
    eval 'sub TRAPF_PC {
        my($framep) = @_;
	    eval q((($framep)-> &tf_rip));
    }' unless defined(&TRAPF_PC);
    if(defined(&_KERNEL)) {
	eval 'sub MEMSET_EARLY_FUNC () { &memset_std;}' unless defined(&MEMSET_EARLY_FUNC);
	eval 'sub MEMCPY_EARLY_FUNC () { &memcpy_std;}' unless defined(&MEMCPY_EARLY_FUNC);
	eval 'sub MEMMOVE_EARLY_FUNC () { &memmove_std;}' unless defined(&MEMMOVE_EARLY_FUNC);
    }
}
1;

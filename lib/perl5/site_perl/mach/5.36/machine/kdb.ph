require '_h2ph_pre.ph';

no warnings qw(redefine misc);

unless(defined(&_MACHINE_KDB_H_)) {
    eval 'sub _MACHINE_KDB_H_ () {1;}' unless defined(&_MACHINE_KDB_H_);
    require 'machine/frame.ph';
    require 'machine/psl.ph';
    eval 'sub kdb_cpu_clear_singlestep {
        my($void) = @_;
	    eval q({  ($kdb_frame->{tf_rflags}) &= ~ &PSL_T; });
    }' unless defined(&kdb_cpu_clear_singlestep);
    eval 'sub kdb_cpu_set_singlestep {
        my($void) = @_;
	    eval q({  ($kdb_frame->{tf_rflags}) |=  &PSL_T; });
    }' unless defined(&kdb_cpu_set_singlestep);
    eval 'sub kdb_cpu_sync_icache {
        my($addr,$size) = @_;
	    eval q({ });
    }' unless defined(&kdb_cpu_sync_icache);
    eval 'sub kdb_cpu_trap {
        my($type,$code) = @_;
	    eval q({ });
    }' unless defined(&kdb_cpu_trap);
}
1;

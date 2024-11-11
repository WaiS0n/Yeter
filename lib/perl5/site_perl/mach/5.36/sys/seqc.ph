require '_h2ph_pre.ph';

no warnings qw(redefine misc);

unless(defined(&_SYS_SEQC_H_)) {
    eval 'sub _SYS_SEQC_H_ () {1;}' unless defined(&_SYS_SEQC_H_);
    if(defined(&_KERNEL)) {
	require 'sys/systm.ph';
    }
    require 'sys/types.ph';
    require 'sys/_seqc.ph';
    if(defined(&_KERNEL)) {
	require 'sys/lock.ph';
	require 'machine/cpu.ph';
	eval 'sub SEQC_MOD () {1;}' unless defined(&SEQC_MOD);
	eval 'sub seqc_in_modify {
	    my($seqc) = @_;
    	    eval q(({  &seqc_t  &__seqc = ($seqc);  &__predict_false( &__seqc &  &SEQC_MOD); }));
	}' unless defined(&seqc_in_modify);
	eval 'sub seqc_write_begin {
	    my($seqcp) = @_;
    	    eval q({  &critical_enter();  &MPASS(! &seqc_in_modify(*$seqcp)); *$seqcp +=  &SEQC_MOD;  &atomic_thread_fence_rel(); });
	}' unless defined(&seqc_write_begin);
	eval 'sub seqc_write_end {
	    my($seqcp) = @_;
    	    eval q({  &atomic_thread_fence_rel(); *$seqcp +=  &SEQC_MOD;  &MPASS(! &seqc_in_modify(*$seqcp));  &critical_exit(); });
	}' unless defined(&seqc_write_end);
	eval 'sub seqc_read_any {
	    my($seqcp) = @_;
    	    eval q({ ( &atomic_load_acq_int( &__DECONST( &seqc_t *, $seqcp))); });
	}' unless defined(&seqc_read_any);
	eval 'sub seqc_read_notmodify {
	    my($seqcp) = @_;
    	    eval q({ ( &atomic_load_acq_int( &__DECONST( &seqc_t *, $seqcp)) & ~ &SEQC_MOD); });
	}' unless defined(&seqc_read_notmodify);
	eval 'sub seqc_read {
	    my($seqcp) = @_;
    	    eval q({  &seqc_t  &ret;  &for (;;) {  &ret =  &seqc_read_any($seqcp);  &if ( &seqc_in_modify( &ret)) {  &cpu_spinwait();  &continue; }  &break; } ( &ret); });
	}' unless defined(&seqc_read);
	eval 'sub seqc_consistent_no_fence {
	    my($seqcp, $oldseqc) = @_;
    	    eval q(({  &const  &seqc_t * &__seqcp = ($seqcp);  &seqc_t  &__oldseqc = ($oldseqc);  &MPASS(!( &seqc_in_modify( &__oldseqc)));  &__predict_true(* &__seqcp ==  &__oldseqc); }));
	}' unless defined(&seqc_consistent_no_fence);
	eval 'sub seqc_consistent {
	    my($seqcp, $oldseqc) = @_;
    	    eval q(({  &atomic_thread_fence_acq();  &seqc_consistent_no_fence($seqcp, $oldseqc); }));
	}' unless defined(&seqc_consistent);
	eval 'sub seqc_sleepable_write_end {
	    my($seqcp) = @_;
    	    eval q({  &atomic_thread_fence_rel(); *$seqcp +=  &SEQC_MOD;  &MPASS(! &seqc_in_modify(*$seqcp)); });
	}' unless defined(&seqc_sleepable_write_end);
    }
}
1;

require '_h2ph_pre.ph';

no warnings qw(redefine misc);

unless(defined(&_SYS_TTYQUEUE_H_)) {
    eval 'sub _SYS_TTYQUEUE_H_ () {1;}' unless defined(&_SYS_TTYQUEUE_H_);
    unless(defined(&_SYS_TTY_H_)) {
	die("can only be included through <sys/tty.h>");
    }
    eval 'sub TTYINQ_DATASIZE () {128;}' unless defined(&TTYINQ_DATASIZE);
    eval 'sub TTYOUTQ_DATASIZE () {(256- $sizeof{\'struct ttyoutq_block\' });}' unless defined(&TTYOUTQ_DATASIZE);
    if(defined(&_KERNEL)) {
	eval 'sub ttyinq_getsize {
	    my($ti) = @_;
    	    eval q({ ( ($ti->{ti_nblocks}) *  &TTYINQ_DATASIZE); });
	}' unless defined(&ttyinq_getsize);
	eval 'sub ttyinq_getallocatedsize {
	    my($ti) = @_;
    	    eval q({ ( ($ti->{ti_quota}) *  &TTYINQ_DATASIZE); });
	}' unless defined(&ttyinq_getallocatedsize);
	eval 'sub ttyinq_bytesleft {
	    my($ti) = @_;
    	    eval q({ \'size_t\'  &len;  &len =  ($ti->{ti_nblocks}) *  &TTYINQ_DATASIZE;  &MPASS( &len >=  ($ti->{ti_end})); ( &len -  ($ti->{ti_end})); });
	}' unless defined(&ttyinq_bytesleft);
	eval 'sub ttyinq_bytescanonicalized {
	    my($ti) = @_;
    	    eval q({  &MPASS( ($ti->{ti_begin}) <=  ($ti->{ti_linestart})); ( ($ti->{ti_linestart}) -  ($ti->{ti_begin})); });
	}' unless defined(&ttyinq_bytescanonicalized);
	eval 'sub ttyinq_bytesline {
	    my($ti) = @_;
    	    eval q({  &MPASS( ($ti->{ti_linestart}) <=  ($ti->{ti_end})); ( ($ti->{ti_end}) -  ($ti->{ti_linestart})); });
	}' unless defined(&ttyinq_bytesline);
	eval 'sub ttyoutq_getsize {
	    my($to) = @_;
    	    eval q({ ( ($to->{to_nblocks}) *  &TTYOUTQ_DATASIZE); });
	}' unless defined(&ttyoutq_getsize);
	eval 'sub ttyoutq_getallocatedsize {
	    my($to) = @_;
    	    eval q({ ( ($to->{to_quota}) *  &TTYOUTQ_DATASIZE); });
	}' unless defined(&ttyoutq_getallocatedsize);
	eval 'sub ttyoutq_bytesleft {
	    my($to) = @_;
    	    eval q({ \'size_t\'  &len;  &len =  ($to->{to_nblocks}) *  &TTYOUTQ_DATASIZE;  &MPASS( &len >=  ($to->{to_end})); ( &len -  ($to->{to_end})); });
	}' unless defined(&ttyoutq_bytesleft);
	eval 'sub ttyoutq_bytesused {
	    my($to) = @_;
    	    eval q({ ( ($to->{to_end}) -  ($to->{to_begin})); });
	}' unless defined(&ttyoutq_bytesused);
    }
}
1;

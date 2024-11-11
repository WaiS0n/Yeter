require '_h2ph_pre.ph';

no warnings qw(redefine misc);

unless(defined(&_MACHINE_SF_BUF_H_)) {
    eval 'sub _MACHINE_SF_BUF_H_ () {1;}' unless defined(&_MACHINE_SF_BUF_H_);
    if(defined(&__amd64__)) {
	eval 'sub sf_buf_page {
	    my($sf) = @_;
    	    eval q({ (( &vm_page_t)$sf); });
	}' unless defined(&sf_buf_page);
    }
}
1;

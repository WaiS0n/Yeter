require '_h2ph_pre.ph';

no warnings qw(redefine misc);

unless(defined(&__kern_prefetch_h__)) {
    eval 'sub __kern_prefetch_h__ () {1;}' unless defined(&__kern_prefetch_h__);
    if(defined(&_KERNEL)) {
# some #ifdef were dropped here -- fill in the blanks
	eval 'sub kern_prefetch {
	    my($addr,$before) = @_;
    	    eval q({ });
	}' unless defined(&kern_prefetch);
    }
}
1;

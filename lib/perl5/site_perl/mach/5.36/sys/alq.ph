require '_h2ph_pre.ph';

no warnings qw(redefine misc);

unless(defined(&_SYS_ALQ_H_)) {
    eval 'sub _SYS_ALQ_H_ () {1;}' unless defined(&_SYS_ALQ_H_);
    if(defined(&_KERNEL)) {
	eval 'sub ALQ_NOWAIT () {0x1;}' unless defined(&ALQ_NOWAIT);
	eval 'sub ALQ_WAITOK () {0x2;}' unless defined(&ALQ_WAITOK);
	eval 'sub ALQ_NOACTIVATE () {0x4;}' unless defined(&ALQ_NOACTIVATE);
	eval 'sub ALQ_ORDERED () {0x10;}' unless defined(&ALQ_ORDERED);
	eval 'sub ALQ_DEFAULT_CMODE () {0600;}' unless defined(&ALQ_DEFAULT_CMODE);
	eval 'sub alq_post {
	    my($alq,$ale) = @_;
    	    eval q({  &alq_post_flags($alq, $ale, 0); });
	}' unless defined(&alq_post);
    }
}
1;

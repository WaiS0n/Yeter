require '_h2ph_pre.ph';

no warnings qw(redefine misc);

unless(defined(&_SYS_STACK_H_)) {
    eval 'sub _SYS_STACK_H_ () {1;}' unless defined(&_SYS_STACK_H_);
    require 'sys/_stack.ph';
    if(defined(&_SYS_MALLOC_H_)) {
    }
    eval("sub STACK_SBUF_FMT_NONE () { 0; }") unless defined(&STACK_SBUF_FMT_NONE);
    eval("sub STACK_SBUF_FMT_LONG () { 1; }") unless defined(&STACK_SBUF_FMT_LONG);
    eval("sub STACK_SBUF_FMT_COMPACT () { 2; }") unless defined(&STACK_SBUF_FMT_COMPACT);
    if(defined(&KTR)) {
	eval 'sub CTRSTACK {
	    my($m, $st, $depth) = @_;
    	    eval q( &do {  &if ( &KTR_COMPILE & ($m))  &stack_ktr(($m),  &__FILE__,  &__LINE__, $st, $depth); }  &while (0));
	}' unless defined(&CTRSTACK);
    } else {
	eval 'sub CTRSTACK {
	    my($m, $st, $depth) = @_;
    	    eval q();
	}' unless defined(&CTRSTACK);
    }
}
1;

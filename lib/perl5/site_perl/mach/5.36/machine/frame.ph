require '_h2ph_pre.ph';

no warnings qw(redefine misc);

unless(defined(&_AMD64_FRAME_H)) {
    eval 'sub _AMD64_FRAME_H () {1;}' unless defined(&_AMD64_FRAME_H);
    require 'x86/frame.ph';
    if(defined(&_KERNEL)) {
	eval 'sub CS_SECURE {
	    my($cs) = @_;
    	    eval q(( &ISPL($cs) ==  &SEL_UPL));
	}' unless defined(&CS_SECURE);
	eval 'sub EFL_SECURE {
	    my($ef, $oef) = @_;
    	    eval q((((($ef) ^ ($oef)) & ~ &PSL_USERCHANGE) == 0));
	}' unless defined(&EFL_SECURE);
    }
}
1;

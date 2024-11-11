require '_h2ph_pre.ph';

no warnings qw(redefine misc);

unless(defined(&NULL)) {
    if(!defined(&__cplusplus)) {
	eval 'sub NULL () {(( &void *)0);}' unless defined(&NULL);
    } else {
	if((defined(&__cplusplus) ? &__cplusplus : undef) >= 201103) {
	    eval 'sub NULL () { &nullptr;}' unless defined(&NULL);
	}
 elsif(defined(&__GNUG__)  && defined(&__GNUC__)  && (defined(&__GNUC__) ? &__GNUC__ : undef) >= 4) {
	    eval 'sub NULL () { &__null;}' unless defined(&NULL);
	} else {
	    if(defined(&__LP64__)) {
		eval 'sub NULL () {(0);}' unless defined(&NULL);
	    } else {
		eval 'sub NULL () {0;}' unless defined(&NULL);
	    }
	}
    }
}
1;

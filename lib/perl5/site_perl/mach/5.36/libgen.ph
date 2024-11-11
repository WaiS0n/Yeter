require '_h2ph_pre.ph';

no warnings qw(redefine misc);

unless(defined(&_LIBGEN_H_)) {
    eval 'sub _LIBGEN_H_ () {1;}' unless defined(&_LIBGEN_H_);
    require 'sys/cdefs.ph';
    if(defined(&__generic)  && !defined(&__cplusplus)) {
	eval 'sub basename {
	    my($x) = @_;
    	    eval q( &__generic($x,  &const \'char\' *,  &__old_basename,  &basename)($x));
	}' unless defined(&basename);
	eval 'sub dirname {
	    my($x) = @_;
    	    eval q( &__generic($x,  &const \'char\' *,  &__old_dirname,  &dirname)($x));
	}' unless defined(&dirname);
    }
}
1;

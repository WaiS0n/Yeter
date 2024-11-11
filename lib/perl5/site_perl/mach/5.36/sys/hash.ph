require '_h2ph_pre.ph';

no warnings qw(redefine misc);

unless(defined(&_SYS_HASH_H_)) {
    eval 'sub _SYS_HASH_H_ () {1;}' unless defined(&_SYS_HASH_H_);
    require 'sys/types.ph';
    unless(defined(&HASHINIT)) {
	eval 'sub HASHINIT () {5381;}' unless defined(&HASHINIT);
	eval 'sub HASHSTEP {
	    my($x,$c) = @_;
    	    eval q(((($x << 5) + $x) + ($c)));
	}' unless defined(&HASHSTEP);
    }
    if(defined(&_KERNEL)) {
    }
}
1;

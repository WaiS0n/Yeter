require '_h2ph_pre.ph';

no warnings qw(redefine misc);

unless(defined(&_ISO646_H_)) {
    eval 'sub _ISO646_H_ () {1;}' unless defined(&_ISO646_H_);
    unless(defined(&__cplusplus)) {
	eval 'sub and () { &&;}' unless defined(&and);
	eval 'sub and_eq () {&=;}' unless defined(&and_eq);
	eval 'sub bitand () {&;}' unless defined(&bitand);
	eval 'sub bitor () {|;}' unless defined(&bitor);
	eval 'sub compl () {~;}' unless defined(&compl);
	eval 'sub not () {!;}' unless defined(&not);
	eval 'sub not_eq () {!=;}' unless defined(&not_eq);
	eval 'sub or () {||;}' unless defined(&or);
	eval 'sub or_eq () {|=;}' unless defined(&or_eq);
	eval 'sub xor () {^;}' unless defined(&xor);
	eval 'sub xor_eq () {^=;}' unless defined(&xor_eq);
    }
}
1;

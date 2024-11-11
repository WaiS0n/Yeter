require '_h2ph_pre.ph';

no warnings qw(redefine misc);

unless(defined(&__alignas_is_defined)) {
    eval 'sub __alignas_is_defined () {1;}' unless defined(&__alignas_is_defined);
    if(!defined(&__cplusplus) || (defined(&__cplusplus) ? &__cplusplus : undef) < 201103) {
	require 'sys/cdefs.ph';
	eval 'sub alignas () { &_Alignas;}' unless defined(&alignas);
    }
}
unless(defined(&__alignof_is_defined)) {
    eval 'sub __alignof_is_defined () {1;}' unless defined(&__alignof_is_defined);
    if(!defined(&__cplusplus) || (defined(&__cplusplus) ? &__cplusplus : undef) < 201103) {
	require 'sys/cdefs.ph';
	eval 'sub alignof () { &_Alignof;}' unless defined(&alignof);
    }
}
1;

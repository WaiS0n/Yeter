require '_h2ph_pre.ph';

no warnings qw(redefine misc);

unless(defined(&_INTTYPES_H_)) {
    eval 'sub _INTTYPES_H_ () {1;}' unless defined(&_INTTYPES_H_);
    require 'machine/_inttypes.ph';
    require 'sys/stdint.ph';
    unless(defined(&__cplusplus)) {
	unless(defined(&_WCHAR_T_DECLARED)) {
	    eval 'sub _WCHAR_T_DECLARED () {1;}' unless defined(&_WCHAR_T_DECLARED);
	}
    }
    if(defined(&_XLOCALE_H_)) {
	require 'xlocale/_inttypes.ph';
    }
}
1;

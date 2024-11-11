require '_h2ph_pre.ph';

no warnings qw(redefine misc);

unless(defined(&_SYS__STDINT_H_)) {
    eval 'sub _SYS__STDINT_H_ () {1;}' unless defined(&_SYS__STDINT_H_);
    unless(defined(&_INT8_T_DECLARED)) {
	eval 'sub _INT8_T_DECLARED () {1;}' unless defined(&_INT8_T_DECLARED);
    }
    unless(defined(&_INT16_T_DECLARED)) {
	eval 'sub _INT16_T_DECLARED () {1;}' unless defined(&_INT16_T_DECLARED);
    }
    unless(defined(&_INT32_T_DECLARED)) {
	eval 'sub _INT32_T_DECLARED () {1;}' unless defined(&_INT32_T_DECLARED);
    }
    unless(defined(&_INT64_T_DECLARED)) {
	eval 'sub _INT64_T_DECLARED () {1;}' unless defined(&_INT64_T_DECLARED);
    }
    unless(defined(&_UINT8_T_DECLARED)) {
	eval 'sub _UINT8_T_DECLARED () {1;}' unless defined(&_UINT8_T_DECLARED);
    }
    unless(defined(&_UINT16_T_DECLARED)) {
	eval 'sub _UINT16_T_DECLARED () {1;}' unless defined(&_UINT16_T_DECLARED);
    }
    unless(defined(&_UINT32_T_DECLARED)) {
	eval 'sub _UINT32_T_DECLARED () {1;}' unless defined(&_UINT32_T_DECLARED);
    }
    unless(defined(&_UINT64_T_DECLARED)) {
	eval 'sub _UINT64_T_DECLARED () {1;}' unless defined(&_UINT64_T_DECLARED);
    }
    unless(defined(&_INTPTR_T_DECLARED)) {
	eval 'sub _INTPTR_T_DECLARED () {1;}' unless defined(&_INTPTR_T_DECLARED);
    }
    unless(defined(&_UINTPTR_T_DECLARED)) {
	eval 'sub _UINTPTR_T_DECLARED () {1;}' unless defined(&_UINTPTR_T_DECLARED);
    }
    unless(defined(&_INTMAX_T_DECLARED)) {
	eval 'sub _INTMAX_T_DECLARED () {1;}' unless defined(&_INTMAX_T_DECLARED);
    }
    unless(defined(&_UINTMAX_T_DECLARED)) {
	eval 'sub _UINTMAX_T_DECLARED () {1;}' unless defined(&_UINTMAX_T_DECLARED);
    }
}
1;

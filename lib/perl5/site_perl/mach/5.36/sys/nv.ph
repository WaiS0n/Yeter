require '_h2ph_pre.ph';

no warnings qw(redefine misc);

unless(defined(&_NV_H_)) {
    eval 'sub _NV_H_ () {1;}' unless defined(&_NV_H_);
    require 'sys/cdefs.ph';
    unless(defined(&_KERNEL)) {
	require 'stdarg.ph';
	require 'stdbool.ph';
	require 'stdint.ph';
	require 'stdio.ph';
	require 'sys/nv_namespace.ph';
    }
    unless(defined(&_NVLIST_T_DECLARED)) {
	eval 'sub _NVLIST_T_DECLARED () {1;}' unless defined(&_NVLIST_T_DECLARED);
    }
    eval 'sub NV_NAME_MAX () {2048;}' unless defined(&NV_NAME_MAX);
    eval 'sub NV_TYPE_NONE () {0;}' unless defined(&NV_TYPE_NONE);
    eval 'sub NV_TYPE_NULL () {1;}' unless defined(&NV_TYPE_NULL);
    eval 'sub NV_TYPE_BOOL () {2;}' unless defined(&NV_TYPE_BOOL);
    eval 'sub NV_TYPE_NUMBER () {3;}' unless defined(&NV_TYPE_NUMBER);
    eval 'sub NV_TYPE_STRING () {4;}' unless defined(&NV_TYPE_STRING);
    eval 'sub NV_TYPE_NVLIST () {5;}' unless defined(&NV_TYPE_NVLIST);
    eval 'sub NV_TYPE_DESCRIPTOR () {6;}' unless defined(&NV_TYPE_DESCRIPTOR);
    eval 'sub NV_TYPE_BINARY () {7;}' unless defined(&NV_TYPE_BINARY);
    eval 'sub NV_TYPE_BOOL_ARRAY () {8;}' unless defined(&NV_TYPE_BOOL_ARRAY);
    eval 'sub NV_TYPE_NUMBER_ARRAY () {9;}' unless defined(&NV_TYPE_NUMBER_ARRAY);
    eval 'sub NV_TYPE_STRING_ARRAY () {10;}' unless defined(&NV_TYPE_STRING_ARRAY);
    eval 'sub NV_TYPE_NVLIST_ARRAY () {11;}' unless defined(&NV_TYPE_NVLIST_ARRAY);
    eval 'sub NV_TYPE_DESCRIPTOR_ARRAY () {12;}' unless defined(&NV_TYPE_DESCRIPTOR_ARRAY);
    eval 'sub NV_FLAG_IGNORE_CASE () {0x1;}' unless defined(&NV_FLAG_IGNORE_CASE);
    eval 'sub NV_FLAG_NO_UNIQUE () {0x2;}' unless defined(&NV_FLAG_NO_UNIQUE);
    if(defined(&_KERNEL)  && defined(&MALLOC_DECLARE)) {
    }
    unless(defined(&_KERNEL)) {
    }
    unless(defined(&_KERNEL)) {
    }
    if(!defined(&_KERNEL) || defined(&_VA_LIST_DECLARED)) {
    }
    unless(defined(&_KERNEL)) {
    }
    unless(defined(&_KERNEL)) {
    }
    unless(defined(&_KERNEL)) {
    }
    unless(defined(&_KERNEL)) {
    }
    unless(defined(&_KERNEL)) {
    }
    unless(defined(&_KERNEL)) {
    }
}
1;

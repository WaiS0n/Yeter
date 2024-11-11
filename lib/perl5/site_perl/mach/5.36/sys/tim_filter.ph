require '_h2ph_pre.ph';

no warnings qw(redefine misc);

unless(defined(&__tim_filter_h__)) {
    eval 'sub __tim_filter_h__ () {1;}' unless defined(&__tim_filter_h__);
    require 'sys/types.ph';
    require 'machine/param.ph';
    eval 'sub NUM_FILTER_ENTRIES () {3;}' unless defined(&NUM_FILTER_ENTRIES);
    if(defined(&_KERNEL)) {
    } else {
    }
    eval 'sub FILTER_TYPE_MIN () {1;}' unless defined(&FILTER_TYPE_MIN);
    eval 'sub FILTER_TYPE_MAX () {2;}' unless defined(&FILTER_TYPE_MAX);
    if(defined(&_KERNEL)) {
    }
}
1;

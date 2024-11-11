require '_h2ph_pre.ph';

no warnings qw(redefine misc);

require 'stdint.ph';
eval("sub hid_input () { 0; }") unless defined(&hid_input);
eval("sub hid_output () { 1; }") unless defined(&hid_output);
eval("sub hid_feature () { 2; }") unless defined(&hid_feature);
eval("sub hid_collection () { 3; }") unless defined(&hid_collection);
eval("sub hid_endcollection () { 4; }") unless defined(&hid_endcollection);
eval 'sub NO_REPORT_ID () {0;}' unless defined(&NO_REPORT_ID);
unless(defined(&HID_PAGE)) {
    sub HID_PAGE {
	my($u) = @_;
	eval q(((($u) >> 16) & 0xffff));
    }
}
unless(defined(&HID_USAGE)) {
    sub HID_USAGE {
	my($u) = @_;
	eval q((($u) & 0xffff));
    }
}
eval 'sub HID_HAS_GET_SET_REPORT () {1;}' unless defined(&HID_HAS_GET_SET_REPORT);
1;

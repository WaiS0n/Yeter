require '_h2ph_pre.ph';

no warnings qw(redefine misc);

unless(defined(&_DPV_H_)) {
    eval 'sub _DPV_H_ () {1;}' unless defined(&_DPV_H_);
    require 'sys/types.ph';
    unless(defined(&TRUE)) {
	eval 'sub TRUE () {1;}' unless defined(&TRUE);
    }
    unless(defined(&FALSE)) {
	eval 'sub FALSE () {0;}' unless defined(&FALSE);
    }
    eval 'sub LC_NUMERIC_DEFAULT () {"en_US.ISO8859-1";}' unless defined(&LC_NUMERIC_DEFAULT);
    eval("sub DPV_DISPLAY_LIBDIALOG () { 0; }") unless defined(&DPV_DISPLAY_LIBDIALOG);
    eval("sub DPV_DISPLAY_STDOUT () { 1; }") unless defined(&DPV_DISPLAY_STDOUT);
    eval("sub DPV_DISPLAY_DIALOG () { 2; }") unless defined(&DPV_DISPLAY_DIALOG);
    eval("sub DPV_DISPLAY_XDIALOG () { 3; }") unless defined(&DPV_DISPLAY_XDIALOG);
    eval("sub DPV_OUTPUT_NONE () { 0; }") unless defined(&DPV_OUTPUT_NONE);
    eval("sub DPV_OUTPUT_FILE () { 1; }") unless defined(&DPV_OUTPUT_FILE);
    eval("sub DPV_OUTPUT_SHELL () { 2; }") unless defined(&DPV_OUTPUT_SHELL);
    eval("sub DPV_STATUS_RUNNING () { 0; }") unless defined(&DPV_STATUS_RUNNING);
    eval("sub DPV_STATUS_DONE () { 1; }") unless defined(&DPV_STATUS_DONE);
    eval("sub DPV_STATUS_FAILED () { 2; }") unless defined(&DPV_STATUS_FAILED);
    eval 'sub DPV_TEST_MODE () {0x1;}' unless defined(&DPV_TEST_MODE);
    eval 'sub DPV_WIDE_MODE () {0x2;}' unless defined(&DPV_WIDE_MODE);
    eval 'sub DPV_NO_LABELS () {0x4;}' unless defined(&DPV_NO_LABELS);
    eval 'sub DPV_USE_COLOR () {0x8;}' unless defined(&DPV_USE_COLOR);
    eval 'sub DPV_NO_OVERRUN () {0x10;}' unless defined(&DPV_NO_OVERRUN);
    eval 'sub DPV_APROMPT_MAX () {4096;}' unless defined(&DPV_APROMPT_MAX);
    eval 'sub DPV_DISPLAY_LIMIT () {10;}' unless defined(&DPV_DISPLAY_LIMIT);
    eval 'sub DPV_PPROMPT_MAX () {4096;}' unless defined(&DPV_PPROMPT_MAX);
    eval 'sub DPV_STATUS_FORMAT_MAX () {80;}' unless defined(&DPV_STATUS_FORMAT_MAX);
    eval 'sub DPV_STATUS_SOLO () {"%\'10lli bytes read @ %\'9.1f bytes/sec.";}' unless defined(&DPV_STATUS_SOLO);
    eval 'sub DPV_STATUS_MANY () {( &DPV_STATUS_SOLO " [%i/%i busy/wait]");}' unless defined(&DPV_STATUS_MANY);
    eval 'sub DPV_DONE_DEFAULT () {"Done";}' unless defined(&DPV_DONE_DEFAULT);
    eval 'sub DPV_FAIL_DEFAULT () {"Fail";}' unless defined(&DPV_FAIL_DEFAULT);
    eval 'sub DPV_PENDING_DEFAULT () {"Pending";}' unless defined(&DPV_PENDING_DEFAULT);
}
1;

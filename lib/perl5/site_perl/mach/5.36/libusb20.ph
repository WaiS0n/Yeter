require '_h2ph_pre.ph';

no warnings qw(redefine misc);

unless(defined(&_LIBUSB20_H_)) {
    eval 'sub _LIBUSB20_H_ () {1;}' unless defined(&_LIBUSB20_H_);
    unless(defined(&LIBUSB_GLOBAL_INCLUDE_FILE)) {
	require 'stdint.ph';
    }
    if(defined(&__cplusplus)) {
    }
    if(0) {
    }
    eval("sub LIBUSB20_SUCCESS () { 0; }") unless defined(&LIBUSB20_SUCCESS);
    eval("sub LIBUSB20_ERROR_IO () { -1; }") unless defined(&LIBUSB20_ERROR_IO);
    eval("sub LIBUSB20_ERROR_INVALID_PARAM () { -2; }") unless defined(&LIBUSB20_ERROR_INVALID_PARAM);
    eval("sub LIBUSB20_ERROR_ACCESS () { -3; }") unless defined(&LIBUSB20_ERROR_ACCESS);
    eval("sub LIBUSB20_ERROR_NO_DEVICE () { -4; }") unless defined(&LIBUSB20_ERROR_NO_DEVICE);
    eval("sub LIBUSB20_ERROR_NOT_FOUND () { -5; }") unless defined(&LIBUSB20_ERROR_NOT_FOUND);
    eval("sub LIBUSB20_ERROR_BUSY () { -6; }") unless defined(&LIBUSB20_ERROR_BUSY);
    eval("sub LIBUSB20_ERROR_TIMEOUT () { -7; }") unless defined(&LIBUSB20_ERROR_TIMEOUT);
    eval("sub LIBUSB20_ERROR_OVERFLOW () { -8; }") unless defined(&LIBUSB20_ERROR_OVERFLOW);
    eval("sub LIBUSB20_ERROR_PIPE () { -9; }") unless defined(&LIBUSB20_ERROR_PIPE);
    eval("sub LIBUSB20_ERROR_INTERRUPTED () { -10; }") unless defined(&LIBUSB20_ERROR_INTERRUPTED);
    eval("sub LIBUSB20_ERROR_NO_MEM () { -11; }") unless defined(&LIBUSB20_ERROR_NO_MEM);
    eval("sub LIBUSB20_ERROR_NOT_SUPPORTED () { -12; }") unless defined(&LIBUSB20_ERROR_NOT_SUPPORTED);
    eval("sub LIBUSB20_ERROR_OTHER () { -99; }") unless defined(&LIBUSB20_ERROR_OTHER);
    eval("sub LIBUSB20_TRANSFER_COMPLETED () { 0; }") unless defined(&LIBUSB20_TRANSFER_COMPLETED);
    eval("sub LIBUSB20_TRANSFER_START () { 1; }") unless defined(&LIBUSB20_TRANSFER_START);
    eval("sub LIBUSB20_TRANSFER_DRAINED () { 2; }") unless defined(&LIBUSB20_TRANSFER_DRAINED);
    eval("sub LIBUSB20_TRANSFER_ERROR () { 3; }") unless defined(&LIBUSB20_TRANSFER_ERROR);
    eval("sub LIBUSB20_TRANSFER_TIMED_OUT () { 4; }") unless defined(&LIBUSB20_TRANSFER_TIMED_OUT);
    eval("sub LIBUSB20_TRANSFER_CANCELLED () { 5; }") unless defined(&LIBUSB20_TRANSFER_CANCELLED);
    eval("sub LIBUSB20_TRANSFER_STALL () { 6; }") unless defined(&LIBUSB20_TRANSFER_STALL);
    eval("sub LIBUSB20_TRANSFER_NO_DEVICE () { 7; }") unless defined(&LIBUSB20_TRANSFER_NO_DEVICE);
    eval("sub LIBUSB20_TRANSFER_OVERFLOW () { 8; }") unless defined(&LIBUSB20_TRANSFER_OVERFLOW);
    eval("sub LIBUSB20_TRANSFER_SINGLE_SHORT_NOT_OK () { 0x0001; }") unless defined(&LIBUSB20_TRANSFER_SINGLE_SHORT_NOT_OK);
    eval("sub LIBUSB20_TRANSFER_MULTI_SHORT_NOT_OK () { 0x0002; }") unless defined(&LIBUSB20_TRANSFER_MULTI_SHORT_NOT_OK);
    eval("sub LIBUSB20_TRANSFER_FORCE_SHORT () { 0x0004; }") unless defined(&LIBUSB20_TRANSFER_FORCE_SHORT);
    eval("sub LIBUSB20_TRANSFER_DO_CLEAR_STALL () { 0x0008; }") unless defined(&LIBUSB20_TRANSFER_DO_CLEAR_STALL);
    eval("sub LIBUSB20_MODE_HOST () { 0; }") unless defined(&LIBUSB20_MODE_HOST);
    eval("sub LIBUSB20_MODE_DEVICE () { 1; }") unless defined(&LIBUSB20_MODE_DEVICE);
    eval("sub LIBUSB20_SPEED_UNKNOWN () { 0; }") unless defined(&LIBUSB20_SPEED_UNKNOWN);
    eval("sub LIBUSB20_SPEED_LOW () { 1; }") unless defined(&LIBUSB20_SPEED_LOW);
    eval("sub LIBUSB20_SPEED_FULL () { 2; }") unless defined(&LIBUSB20_SPEED_FULL);
    eval("sub LIBUSB20_SPEED_HIGH () { 3; }") unless defined(&LIBUSB20_SPEED_HIGH);
    eval("sub LIBUSB20_SPEED_VARIABLE () { 4; }") unless defined(&LIBUSB20_SPEED_VARIABLE);
    eval("sub LIBUSB20_SPEED_SUPER () { 5; }") unless defined(&LIBUSB20_SPEED_SUPER);
    eval("sub LIBUSB20_POWER_OFF () { 0; }") unless defined(&LIBUSB20_POWER_OFF);
    eval("sub LIBUSB20_POWER_ON () { 1; }") unless defined(&LIBUSB20_POWER_ON);
    eval("sub LIBUSB20_POWER_SAVE () { 2; }") unless defined(&LIBUSB20_POWER_SAVE);
    eval("sub LIBUSB20_POWER_SUSPEND () { 3; }") unless defined(&LIBUSB20_POWER_SUSPEND);
    eval("sub LIBUSB20_POWER_RESUME () { 4; }") unless defined(&LIBUSB20_POWER_RESUME);
    eval 'sub LIBUSB20_MAX_FRAME_PRE_SCALE () {(1 << 31);}' unless defined(&LIBUSB20_MAX_FRAME_PRE_SCALE);
    if(0) {
    }
    if(defined(&__cplusplus)) {
    }
}
1;

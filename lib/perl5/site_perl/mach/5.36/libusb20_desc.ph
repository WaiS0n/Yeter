require '_h2ph_pre.ph';

no warnings qw(redefine misc);

unless(defined(&_LIBUSB20_DESC_H_)) {
    eval 'sub _LIBUSB20_DESC_H_ () {1;}' unless defined(&_LIBUSB20_DESC_H_);
    unless(defined(&LIBUSB_GLOBAL_INCLUDE_FILE)) {
	require 'stdint.ph';
    }
    if(defined(&__cplusplus)) {
    }
    if(0) {
    }
    eval 'sub LIBUSB20__NOT () {(...)  &__VA_ARGS__;}' unless defined(&LIBUSB20__NOT);
    eval 'sub LIBUSB20_NOT {
        my($arg) = @_;
	    eval q( &LIBUSB20__NOT( &LIBUSB20_YES $arg(()  &LIBUSB20_NO)));
    }' unless defined(&LIBUSB20_NOT);
    eval 'sub LIBUSB20_YES () {(...)  &__VA_ARGS__;}' unless defined(&LIBUSB20_YES);
    eval 'sub LIBUSB20_NO () {(...);}' unless defined(&LIBUSB20_NO);
    eval 'sub LIBUSB20_END () {(...)  &__VA_ARGS__;}' unless defined(&LIBUSB20_END);
    eval 'sub LIBUSB20_MAX {
        my($a,$b) = @_;
	    eval q(((($a) > ($b)) ? ($a) : ($b)));
    }' unless defined(&LIBUSB20_MAX);
    eval 'sub LIBUSB20_MIN {
        my($a,$b) = @_;
	    eval q(((($a) < ($b)) ? ($a) : ($b)));
    }' unless defined(&LIBUSB20_MIN);
    eval 'sub LIBUSB20_ADD_BYTES {
        my($ptr,$off) = @_;
	    eval q((( &void *)((( &const  &uint8_t *)($ptr)) + ($off) - (( &const  &uint8_t *)0))));
    }' unless defined(&LIBUSB20_ADD_BYTES);
    eval("sub LIBUSB20_ME_INT8 () { 0; }") unless defined(&LIBUSB20_ME_INT8);
    eval("sub LIBUSB20_ME_INT16 () { 1; }") unless defined(&LIBUSB20_ME_INT16);
    eval("sub LIBUSB20_ME_INT32 () { 2; }") unless defined(&LIBUSB20_ME_INT32);
    eval("sub LIBUSB20_ME_INT64 () { 3; }") unless defined(&LIBUSB20_ME_INT64);
    eval("sub LIBUSB20_ME_STRUCT () { 4; }") unless defined(&LIBUSB20_ME_STRUCT);
    eval("sub LIBUSB20_ME_MAX () { 5; }") unless defined(&LIBUSB20_ME_MAX);
    eval("sub LIBUSB20_ME_IS_UNSIGNED () { 0x00; }") unless defined(&LIBUSB20_ME_IS_UNSIGNED);
    eval("sub LIBUSB20_ME_IS_SIGNED () { 0x80; }") unless defined(&LIBUSB20_ME_IS_SIGNED);
    eval("sub LIBUSB20_ME_MASK () { 0x7F; }") unless defined(&LIBUSB20_ME_MASK);
    eval("sub LIBUSB20_ME_IS_RAW () { 0; }") unless defined(&LIBUSB20_ME_IS_RAW);
    eval("sub LIBUSB20_ME_IS_ENCODED () { 1; }") unless defined(&LIBUSB20_ME_IS_ENCODED);
    eval("sub LIBUSB20_ME_IS_EMPTY () { 2; }") unless defined(&LIBUSB20_ME_IS_EMPTY);
    eval("sub LIBUSB20_ME_IS_DECODED () { 3; }") unless defined(&LIBUSB20_ME_IS_DECODED);
    eval 'sub LIBUSB20_ME_STRUCT_ALIGN () {$sizeof{ &void };}' unless defined(&LIBUSB20_ME_STRUCT_ALIGN);
    eval 'sub LIBUSB20_ME_STRUCT {
        my($n, $field, $arg, $ismeta) = @_;
	    eval q($ismeta (  &LIBUSB20_ME_STRUCT, 1, 0, )  &LIBUSB20_NOT($ismeta) ( \'struct libusb20_me_struct\' $field; ));
    }' unless defined(&LIBUSB20_ME_STRUCT);
    eval 'sub LIBUSB20_ME_STRUCT_ARRAY {
        my($n, $field, $arg, $ismeta) = @_;
	    eval q($ismeta (  &LIBUSB20_ME_STRUCT , ($arg) & 0xff, (($arg) / 0x100) & 0xff, )  &LIBUSB20_NOT($ismeta) ( \'struct libusb20_me_struct\' $field [$arg]; ));
    }' unless defined(&LIBUSB20_ME_STRUCT_ARRAY);
    eval 'sub LIBUSB20_ME_INTEGER {
        my($n, $field, $ismeta, $un, $u, $bits, $a, $size) = @_;
	    eval q($ismeta (  &LIBUSB20_ME_INT$bits |  &LIBUSB20_ME_IS_$un &SIGNED , ($size) & 0xff, (($size) / 0x100) & 0xff, )  &LIBUSB20_NOT($ismeta) ( $u\'int\'$bits &_t  &__aligned(($bits) / 8) $field $a; ));
    }' unless defined(&LIBUSB20_ME_INTEGER);
    eval 'sub LIBUSB20_ME_UINT8_T {
        my($n, $field, $arg, $ismeta) = @_;
	    eval q( &LIBUSB20_ME_INTEGER($n, $field, $ismeta,  &UN,  &u, 8, , 1));
    }' unless defined(&LIBUSB20_ME_UINT8_T);
    eval 'sub LIBUSB20_ME_UINT8_ARRAY_T {
        my($n, $field, $arg, $ismeta) = @_;
	    eval q( &LIBUSB20_ME_INTEGER($n, $field, $ismeta,  &UN,  &u, 8, [$arg], $arg));
    }' unless defined(&LIBUSB20_ME_UINT8_ARRAY_T);
    eval 'sub LIBUSB20_ME_SINT8_T {
        my($n, $field, $arg, $ismeta) = @_;
	    eval q( &LIBUSB20_ME_INTEGER($n, $field, $ismeta,,, 8, , 1));
    }' unless defined(&LIBUSB20_ME_SINT8_T);
    eval 'sub LIBUSB20_ME_SINT8_ARRAY_T {
        my($n, $field, $arg, $ismeta) = @_;
	    eval q( &LIBUSB20_ME_INTEGER($n, $field, $ismeta,,, 8, [$arg], $arg));
    }' unless defined(&LIBUSB20_ME_SINT8_ARRAY_T);
    eval 'sub LIBUSB20_ME_UINT16_T {
        my($n, $field, $arg, $ismeta) = @_;
	    eval q( &LIBUSB20_ME_INTEGER($n, $field, $ismeta,  &UN,  &u, 16, , 1));
    }' unless defined(&LIBUSB20_ME_UINT16_T);
    eval 'sub LIBUSB20_ME_UINT16_ARRAY_T {
        my($n, $field, $arg, $ismeta) = @_;
	    eval q( &LIBUSB20_ME_INTEGER($n, $field, $ismeta,  &UN,  &u, 16, [$arg], $arg));
    }' unless defined(&LIBUSB20_ME_UINT16_ARRAY_T);
    eval 'sub LIBUSB20_ME_SINT16_T {
        my($n, $field, $arg, $ismeta) = @_;
	    eval q( &LIBUSB20_ME_INTEGER($n, $field, $ismeta,,, 16, , 1));
    }' unless defined(&LIBUSB20_ME_SINT16_T);
    eval 'sub LIBUSB20_ME_SINT16_ARRAY_T {
        my($n, $field, $arg, $ismeta) = @_;
	    eval q( &LIBUSB20_ME_INTEGER($n, $field, $ismeta,,, 16, [$arg], $arg));
    }' unless defined(&LIBUSB20_ME_SINT16_ARRAY_T);
    eval 'sub LIBUSB20_ME_UINT32_T {
        my($n, $field, $arg, $ismeta) = @_;
	    eval q( &LIBUSB20_ME_INTEGER($n, $field, $ismeta,  &UN,  &u, 32, , 1));
    }' unless defined(&LIBUSB20_ME_UINT32_T);
    eval 'sub LIBUSB20_ME_UINT32_ARRAY_T {
        my($n, $field, $arg, $ismeta) = @_;
	    eval q( &LIBUSB20_ME_INTEGER($n, $field, $ismeta,  &UN,  &u, 32, [$arg], $arg));
    }' unless defined(&LIBUSB20_ME_UINT32_ARRAY_T);
    eval 'sub LIBUSB20_ME_SINT32_T {
        my($n, $field, $arg, $ismeta) = @_;
	    eval q( &LIBUSB20_ME_INTEGER($n, $field, $ismeta,,, 32, , 1));
    }' unless defined(&LIBUSB20_ME_SINT32_T);
    eval 'sub LIBUSB20_ME_SINT32_ARRAY_T {
        my($n, $field, $arg, $ismeta) = @_;
	    eval q( &LIBUSB20_ME_INTEGER($n, $field, $ismeta,,, 32, [$arg], $arg));
    }' unless defined(&LIBUSB20_ME_SINT32_ARRAY_T);
    eval 'sub LIBUSB20_ME_UINT64_T {
        my($n, $field, $arg, $ismeta) = @_;
	    eval q( &LIBUSB20_ME_INTEGER($n, $field, $ismeta,  &UN,  &u, 64, , 1));
    }' unless defined(&LIBUSB20_ME_UINT64_T);
    eval 'sub LIBUSB20_ME_UINT64_ARRAY_T {
        my($n, $field, $arg, $ismeta) = @_;
	    eval q( &LIBUSB20_ME_INTEGER($n, $field, $ismeta,  &UN,  &u, 64, [$arg], $arg));
    }' unless defined(&LIBUSB20_ME_UINT64_ARRAY_T);
    eval 'sub LIBUSB20_ME_SINT64_T {
        my($n, $field, $arg, $ismeta) = @_;
	    eval q( &LIBUSB20_ME_INTEGER($n, $field, $ismeta,,, 64, , 1));
    }' unless defined(&LIBUSB20_ME_SINT64_T);
    eval 'sub LIBUSB20_ME_SINT64_ARRAY_T {
        my($n, $field, $arg, $ismeta) = @_;
	    eval q( &LIBUSB20_ME_INTEGER($n, $field, $ismeta,,, 64, [$arg], $arg));
    }' unless defined(&LIBUSB20_ME_SINT64_ARRAY_T);
    eval 'sub LIBUSB20_MAKE_DECODED_FIELD {
        my($n, $type, $field, $arg) = @_;
	    eval q( &LIBUSB20_ME_$type ($n, $field, $arg,  &LIBUSB20_NO));
    }' unless defined(&LIBUSB20_MAKE_DECODED_FIELD);
    eval 'sub LIBUSB20_MAKE_STRUCT {
        my($name) = @_;
	    eval q( &extern  &const \'struct libusb20_me_format\' $name $_FORMAT[1]; \'struct name\' &_DECODED {  &const \'struct libusb20_me_format\' *$name &_FORMAT; $name ( &LIBUSB20_MAKE_DECODED_FIELD,) });
    }' unless defined(&LIBUSB20_MAKE_STRUCT);
    eval 'sub LIBUSB20_MAKE_STRUCT_FORMAT {
        my($name) = @_;
	    eval q( &const \'struct libusb20_me_format\' $name $_FORMAT[1] = {{ . &format =  &LIBUSB20_MAKE_FORMAT($name), . &desc = $name, . &fields =  &NULL, }});
    }' unless defined(&LIBUSB20_MAKE_STRUCT_FORMAT);
    eval 'sub LIBUSB20_MAKE_FORMAT_SUB {
        my($n, $type, $field, $arg) = @_;
	    eval q( &LIBUSB20_ME_$type ($n, $field, $arg,  &LIBUSB20_YES));
    }' unless defined(&LIBUSB20_MAKE_FORMAT_SUB);
    eval 'sub LIBUSB20_MAKE_FORMAT {
        my($what) = @_;
	    eval q(( &const  &uint8_t []) { $what ( &LIBUSB20_MAKE_FORMAT_SUB, )  &LIBUSB20_ME_MAX, 0, 0});
    }' unless defined(&LIBUSB20_MAKE_FORMAT);
    eval 'sub LIBUSB20_INIT {
        my($what, $ptr) = @_;
	    eval q( &do {  &memset($ptr, 0, $sizeof{($ptr)}); ($ptr)->$what &_FORMAT = $what &_FORMAT; }  &while (0));
    }' unless defined(&LIBUSB20_INIT);
    eval 'sub LIBUSB20_DEVICE_DESC {
        my($m,$n) = @_;
	    eval q($m($n,  &UINT8_T,  &bLength, ) $m($n,  &UINT8_T,  &bDescriptorType, ) $m($n,  &UINT16_T,  &bcdUSB, ) $m($n,  &UINT8_T,  &bDeviceClass, ) $m($n,  &UINT8_T,  &bDeviceSubClass, ) $m($n,  &UINT8_T,  &bDeviceProtocol, ) $m($n,  &UINT8_T,  &bMaxPacketSize0, ) $m($n,  &UINT16_T,  &idVendor, ) $m($n,  &UINT16_T,  &idProduct, ) $m($n,  &UINT16_T,  &bcdDevice, ) $m($n,  &UINT8_T,  &iManufacturer, ) $m($n,  &UINT8_T,  &iProduct, ) $m($n,  &UINT8_T,  &iSerialNumber, ) $m($n,  &UINT8_T,  &bNumConfigurations, ));
    }' unless defined(&LIBUSB20_DEVICE_DESC);
    eval 'sub LIBUSB20_ENDPOINT_DESC {
        my($m,$n) = @_;
	    eval q($m($n,  &UINT8_T,  &bLength, ) $m($n,  &UINT8_T,  &bDescriptorType, ) $m($n,  &UINT8_T,  &bEndpointAddress, ) $m($n,  &UINT8_T,  &bmAttributes, ) $m($n,  &UINT16_T,  &wMaxPacketSize, ) $m($n,  &UINT8_T,  &bInterval, ) $m($n,  &UINT8_T,  &bRefresh, ) $m($n,  &UINT8_T,  &bSynchAddress, ));
    }' unless defined(&LIBUSB20_ENDPOINT_DESC);
    eval 'sub LIBUSB20_INTERFACE_DESC {
        my($m,$n) = @_;
	    eval q($m($n,  &UINT8_T,  &bLength, ) $m($n,  &UINT8_T,  &bDescriptorType, ) $m($n,  &UINT8_T,  &bInterfaceNumber, ) $m($n,  &UINT8_T,  &bAlternateSetting, ) $m($n,  &UINT8_T,  &bNumEndpoints, ) $m($n,  &UINT8_T,  &bInterfaceClass, ) $m($n,  &UINT8_T,  &bInterfaceSubClass, ) $m($n,  &UINT8_T,  &bInterfaceProtocol, ) $m($n,  &UINT8_T,  &iInterface, ));
    }' unless defined(&LIBUSB20_INTERFACE_DESC);
    eval 'sub LIBUSB20_CONFIG_DESC {
        my($m,$n) = @_;
	    eval q($m($n,  &UINT8_T,  &bLength, ) $m($n,  &UINT8_T,  &bDescriptorType, ) $m($n,  &UINT16_T,  &wTotalLength, ) $m($n,  &UINT8_T,  &bNumInterfaces, ) $m($n,  &UINT8_T,  &bConfigurationValue, ) $m($n,  &UINT8_T,  &iConfiguration, ) $m($n,  &UINT8_T,  &bmAttributes, ) $m($n,  &UINT8_T,  &bMaxPower, ));
    }' unless defined(&LIBUSB20_CONFIG_DESC);
    eval 'sub LIBUSB20_CONTROL_SETUP {
        my($m,$n) = @_;
	    eval q($m($n,  &UINT8_T,  &bmRequestType, ) $m($n,  &UINT8_T,  &bRequest, ) $m($n,  &UINT16_T,  &wValue, ) $m($n,  &UINT16_T,  &wIndex, ) $m($n,  &UINT16_T,  &wLength, ));
    }' unless defined(&LIBUSB20_CONTROL_SETUP);
    eval 'sub LIBUSB20_SS_ENDPT_COMP_DESC {
        my($m,$n) = @_;
	    eval q($m($n,  &UINT8_T,  &bLength, ) $m($n,  &UINT8_T,  &bDescriptorType, ) $m($n,  &UINT8_T,  &bMaxBurst, ) $m($n,  &UINT8_T,  &bmAttributes, ) $m($n,  &UINT16_T,  &wBytesPerInterval, ));
    }' unless defined(&LIBUSB20_SS_ENDPT_COMP_DESC);
    eval 'sub LIBUSB20_USB_20_DEVCAP_DESC {
        my($m,$n) = @_;
	    eval q($m($n,  &UINT8_T,  &bLength, ) $m($n,  &UINT8_T,  &bDescriptorType, ) $m($n,  &UINT8_T,  &bDevCapabilityType, ) $m($n,  &UINT32_T,  &bmAttributes, ));
    }' unless defined(&LIBUSB20_USB_20_DEVCAP_DESC);
    eval 'sub LIBUSB20_SS_USB_DEVCAP_DESC {
        my($m,$n) = @_;
	    eval q($m($n,  &UINT8_T,  &bLength, ) $m($n,  &UINT8_T,  &bDescriptorType, ) $m($n,  &UINT8_T,  &bDevCapabilityType, ) $m($n,  &UINT8_T,  &bmAttributes, ) $m($n,  &UINT16_T,  &wSpeedSupported, ) $m($n,  &UINT8_T,  &bFunctionalitySupport, ) $m($n,  &UINT8_T,  &bU1DevExitLat, ) $m($n,  &UINT16_T,  &wU2DevExitLat, ));
    }' unless defined(&LIBUSB20_SS_USB_DEVCAP_DESC);
    eval 'sub LIBUSB20_BOS_DESCRIPTOR {
        my($m,$n) = @_;
	    eval q($m($n,  &UINT8_T,  &bLength, ) $m($n,  &UINT8_T,  &bDescriptorType, ) $m($n,  &UINT16_T,  &wTotalLength, ) $m($n,  &UINT8_T,  &bNumDeviceCapabilities, ));
    }' unless defined(&LIBUSB20_BOS_DESCRIPTOR);
    eval("sub LIBUSB20_CLASS_PER_INTERFACE () { 0; }") unless defined(&LIBUSB20_CLASS_PER_INTERFACE);
    eval("sub LIBUSB20_CLASS_AUDIO () { 1; }") unless defined(&LIBUSB20_CLASS_AUDIO);
    eval("sub LIBUSB20_CLASS_COMM () { 2; }") unless defined(&LIBUSB20_CLASS_COMM);
    eval("sub LIBUSB20_CLASS_HID () { 3; }") unless defined(&LIBUSB20_CLASS_HID);
    eval("sub LIBUSB20_CLASS_PRINTER () { 7; }") unless defined(&LIBUSB20_CLASS_PRINTER);
    eval("sub LIBUSB20_CLASS_PTP () { 6; }") unless defined(&LIBUSB20_CLASS_PTP);
    eval("sub LIBUSB20_CLASS_MASS_STORAGE () { 8; }") unless defined(&LIBUSB20_CLASS_MASS_STORAGE);
    eval("sub LIBUSB20_CLASS_HUB () { 9; }") unless defined(&LIBUSB20_CLASS_HUB);
    eval("sub LIBUSB20_CLASS_DATA () { 10; }") unless defined(&LIBUSB20_CLASS_DATA);
    eval("sub LIBUSB20_CLASS_VENDOR_SPEC () { 0xff; }") unless defined(&LIBUSB20_CLASS_VENDOR_SPEC);
    eval("sub LIBUSB20_DT_DEVICE () { 0x01; }") unless defined(&LIBUSB20_DT_DEVICE);
    eval("sub LIBUSB20_DT_CONFIG () { 0x02; }") unless defined(&LIBUSB20_DT_CONFIG);
    eval("sub LIBUSB20_DT_STRING () { 0x03; }") unless defined(&LIBUSB20_DT_STRING);
    eval("sub LIBUSB20_DT_INTERFACE () { 0x04; }") unless defined(&LIBUSB20_DT_INTERFACE);
    eval("sub LIBUSB20_DT_ENDPOINT () { 0x05; }") unless defined(&LIBUSB20_DT_ENDPOINT);
    eval("sub LIBUSB20_DT_HID () { 0x21; }") unless defined(&LIBUSB20_DT_HID);
    eval("sub LIBUSB20_DT_REPORT () { 0x22; }") unless defined(&LIBUSB20_DT_REPORT);
    eval("sub LIBUSB20_DT_PHYSICAL () { 0x23; }") unless defined(&LIBUSB20_DT_PHYSICAL);
    eval("sub LIBUSB20_DT_HUB () { 0x29; }") unless defined(&LIBUSB20_DT_HUB);
    eval("sub LIBUSB20_DT_BOS () { 0x0f; }") unless defined(&LIBUSB20_DT_BOS);
    eval("sub LIBUSB20_DT_DEVICE_CAPABILITY () { 0x10; }") unless defined(&LIBUSB20_DT_DEVICE_CAPABILITY);
    eval("sub LIBUSB20_DT_SS_ENDPOINT_COMPANION () { 0x30; }") unless defined(&LIBUSB20_DT_SS_ENDPOINT_COMPANION);
    eval("sub LIBUSB20_WIRELESS_USB_DEVICE_CAPABILITY () { 0x1; }") unless defined(&LIBUSB20_WIRELESS_USB_DEVICE_CAPABILITY);
    eval("sub LIBUSB20_USB_2_0_EXTENSION_DEVICE_CAPABILITY () { 0x2; }") unless defined(&LIBUSB20_USB_2_0_EXTENSION_DEVICE_CAPABILITY);
    eval("sub LIBUSB20_SS_USB_DEVICE_CAPABILITY () { 0x3; }") unless defined(&LIBUSB20_SS_USB_DEVICE_CAPABILITY);
    eval("sub LIBUSB20_CONTAINER_ID_DEVICE_CAPABILITY () { 0x4; }") unless defined(&LIBUSB20_CONTAINER_ID_DEVICE_CAPABILITY);
    eval 'sub LIBUSB20_DT_DEVICE_SIZE () {18;}' unless defined(&LIBUSB20_DT_DEVICE_SIZE);
    eval 'sub LIBUSB20_DT_CONFIG_SIZE () {9;}' unless defined(&LIBUSB20_DT_CONFIG_SIZE);
    eval 'sub LIBUSB20_DT_INTERFACE_SIZE () {9;}' unless defined(&LIBUSB20_DT_INTERFACE_SIZE);
    eval 'sub LIBUSB20_DT_ENDPOINT_SIZE () {7;}' unless defined(&LIBUSB20_DT_ENDPOINT_SIZE);
    eval 'sub LIBUSB20_DT_ENDPOINT_AUDIO_SIZE () {9;}' unless defined(&LIBUSB20_DT_ENDPOINT_AUDIO_SIZE);
    eval 'sub LIBUSB20_DT_HUB_NONVAR_SIZE () {7;}' unless defined(&LIBUSB20_DT_HUB_NONVAR_SIZE);
    eval 'sub LIBUSB20_DT_SS_ENDPOINT_COMPANION_SIZE () {6;}' unless defined(&LIBUSB20_DT_SS_ENDPOINT_COMPANION_SIZE);
    eval 'sub LIBUSB20_DT_BOS_SIZE () {5;}' unless defined(&LIBUSB20_DT_BOS_SIZE);
    eval 'sub LIBUSB20_USB_2_0_EXTENSION_DEVICE_CAPABILITY_SIZE () {7;}' unless defined(&LIBUSB20_USB_2_0_EXTENSION_DEVICE_CAPABILITY_SIZE);
    eval 'sub LIBUSB20_SS_USB_DEVICE_CAPABILITY_SIZE () {10;}' unless defined(&LIBUSB20_SS_USB_DEVICE_CAPABILITY_SIZE);
    eval 'sub LIBUSB20_ENDPOINT_ADDRESS_MASK () {0xf;}' unless defined(&LIBUSB20_ENDPOINT_ADDRESS_MASK);
    eval 'sub LIBUSB20_ENDPOINT_DIR_MASK () {0x80;}' unless defined(&LIBUSB20_ENDPOINT_DIR_MASK);
    eval("sub LIBUSB20_ENDPOINT_IN () { 0x80; }") unless defined(&LIBUSB20_ENDPOINT_IN);
    eval("sub LIBUSB20_ENDPOINT_OUT () { 0x00; }") unless defined(&LIBUSB20_ENDPOINT_OUT);
    eval 'sub LIBUSB20_TRANSFER_TYPE_MASK () {0x3;}' unless defined(&LIBUSB20_TRANSFER_TYPE_MASK);
    eval("sub LIBUSB20_TRANSFER_TYPE_CONTROL () { 0; }") unless defined(&LIBUSB20_TRANSFER_TYPE_CONTROL);
    eval("sub LIBUSB20_TRANSFER_TYPE_ISOCHRONOUS () { 1; }") unless defined(&LIBUSB20_TRANSFER_TYPE_ISOCHRONOUS);
    eval("sub LIBUSB20_TRANSFER_TYPE_BULK () { 2; }") unless defined(&LIBUSB20_TRANSFER_TYPE_BULK);
    eval("sub LIBUSB20_TRANSFER_TYPE_INTERRUPT () { 3; }") unless defined(&LIBUSB20_TRANSFER_TYPE_INTERRUPT);
    eval("sub LIBUSB20_REQUEST_GET_STATUS () { 0x00; }") unless defined(&LIBUSB20_REQUEST_GET_STATUS);
    eval("sub LIBUSB20_REQUEST_CLEAR_FEATURE () { 0x01; }") unless defined(&LIBUSB20_REQUEST_CLEAR_FEATURE);
    eval("sub LIBUSB20_REQUEST_SET_FEATURE () { 0x03; }") unless defined(&LIBUSB20_REQUEST_SET_FEATURE);
    eval("sub LIBUSB20_REQUEST_SET_ADDRESS () { 0x05; }") unless defined(&LIBUSB20_REQUEST_SET_ADDRESS);
    eval("sub LIBUSB20_REQUEST_GET_DESCRIPTOR () { 0x06; }") unless defined(&LIBUSB20_REQUEST_GET_DESCRIPTOR);
    eval("sub LIBUSB20_REQUEST_SET_DESCRIPTOR () { 0x07; }") unless defined(&LIBUSB20_REQUEST_SET_DESCRIPTOR);
    eval("sub LIBUSB20_REQUEST_GET_CONFIGURATION () { 0x08; }") unless defined(&LIBUSB20_REQUEST_GET_CONFIGURATION);
    eval("sub LIBUSB20_REQUEST_SET_CONFIGURATION () { 0x09; }") unless defined(&LIBUSB20_REQUEST_SET_CONFIGURATION);
    eval("sub LIBUSB20_REQUEST_GET_INTERFACE () { 0x0A; }") unless defined(&LIBUSB20_REQUEST_GET_INTERFACE);
    eval("sub LIBUSB20_REQUEST_SET_INTERFACE () { 0x0B; }") unless defined(&LIBUSB20_REQUEST_SET_INTERFACE);
    eval("sub LIBUSB20_REQUEST_SYNCH_FRAME () { 0x0C; }") unless defined(&LIBUSB20_REQUEST_SYNCH_FRAME);
    eval("sub LIBUSB20_REQUEST_SET_SEL () { 0x30; }") unless defined(&LIBUSB20_REQUEST_SET_SEL);
    eval("sub LIBUSB20_REQUEST_SET_ISOCH_DELAY () { 0x31; }") unless defined(&LIBUSB20_REQUEST_SET_ISOCH_DELAY);
    eval("sub LIBUSB20_REQUEST_TYPE_STANDARD () { (0x00<<5); }") unless defined(&LIBUSB20_REQUEST_TYPE_STANDARD);
    eval("sub LIBUSB20_REQUEST_TYPE_CLASS () { (0x01<<5); }") unless defined(&LIBUSB20_REQUEST_TYPE_CLASS);
    eval("sub LIBUSB20_REQUEST_TYPE_VENDOR () { (0x02<<5); }") unless defined(&LIBUSB20_REQUEST_TYPE_VENDOR);
    eval("sub LIBUSB20_REQUEST_TYPE_RESERVED () { (0x03<<5); }") unless defined(&LIBUSB20_REQUEST_TYPE_RESERVED);
    eval("sub LIBUSB20_RECIPIENT_DEVICE () { 0x00; }") unless defined(&LIBUSB20_RECIPIENT_DEVICE);
    eval("sub LIBUSB20_RECIPIENT_INTERFACE () { 0x01; }") unless defined(&LIBUSB20_RECIPIENT_INTERFACE);
    eval("sub LIBUSB20_RECIPIENT_ENDPOINT () { 0x02; }") unless defined(&LIBUSB20_RECIPIENT_ENDPOINT);
    eval("sub LIBUSB20_RECIPIENT_OTHER () { 0x03; }") unless defined(&LIBUSB20_RECIPIENT_OTHER);
    eval 'sub LIBUSB20_ISO_SYNC_TYPE_MASK () {0xc;}' unless defined(&LIBUSB20_ISO_SYNC_TYPE_MASK);
    eval("sub LIBUSB20_ISO_SYNC_TYPE_NONE () { 0; }") unless defined(&LIBUSB20_ISO_SYNC_TYPE_NONE);
    eval("sub LIBUSB20_ISO_SYNC_TYPE_ASYNC () { 1; }") unless defined(&LIBUSB20_ISO_SYNC_TYPE_ASYNC);
    eval("sub LIBUSB20_ISO_SYNC_TYPE_ADAPTIVE () { 2; }") unless defined(&LIBUSB20_ISO_SYNC_TYPE_ADAPTIVE);
    eval("sub LIBUSB20_ISO_SYNC_TYPE_SYNC () { 3; }") unless defined(&LIBUSB20_ISO_SYNC_TYPE_SYNC);
    eval 'sub LIBUSB20_ISO_USAGE_TYPE_MASK () {0x30;}' unless defined(&LIBUSB20_ISO_USAGE_TYPE_MASK);
    eval("sub LIBUSB20_ISO_USAGE_TYPE_DATA () { 0; }") unless defined(&LIBUSB20_ISO_USAGE_TYPE_DATA);
    eval("sub LIBUSB20_ISO_USAGE_TYPE_FEEDBACK () { 1; }") unless defined(&LIBUSB20_ISO_USAGE_TYPE_FEEDBACK);
    eval("sub LIBUSB20_ISO_USAGE_TYPE_IMPLICIT () { 2; }") unless defined(&LIBUSB20_ISO_USAGE_TYPE_IMPLICIT);
    if(0) {
    }
    if(defined(&__cplusplus)) {
    }
}
1;

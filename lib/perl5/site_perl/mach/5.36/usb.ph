require '_h2ph_pre.ph';

no warnings qw(redefine misc);

unless(defined(&_LIBUSB20_COMPAT_01_H_)) {
    eval 'sub _LIBUSB20_COMPAT_01_H_ () {1;}' unless defined(&_LIBUSB20_COMPAT_01_H_);
    unless(defined(&LIBUSB_GLOBAL_INCLUDE_FILE)) {
	require 'stdint.ph';
	require 'sys/param.ph';
	require 'sys/endian.ph';
    }
    eval 'sub USB_CLASS_PER_INTERFACE () {0;}' unless defined(&USB_CLASS_PER_INTERFACE);
    eval 'sub USB_CLASS_AUDIO () {1;}' unless defined(&USB_CLASS_AUDIO);
    eval 'sub USB_CLASS_COMM () {2;}' unless defined(&USB_CLASS_COMM);
    eval 'sub USB_CLASS_HID () {3;}' unless defined(&USB_CLASS_HID);
    eval 'sub USB_CLASS_PRINTER () {7;}' unless defined(&USB_CLASS_PRINTER);
    eval 'sub USB_CLASS_PTP () {6;}' unless defined(&USB_CLASS_PTP);
    eval 'sub USB_CLASS_MASS_STORAGE () {8;}' unless defined(&USB_CLASS_MASS_STORAGE);
    eval 'sub USB_CLASS_HUB () {9;}' unless defined(&USB_CLASS_HUB);
    eval 'sub USB_CLASS_DATA () {10;}' unless defined(&USB_CLASS_DATA);
    eval 'sub USB_CLASS_VENDOR_SPEC () {0xff;}' unless defined(&USB_CLASS_VENDOR_SPEC);
    eval 'sub USB_DT_DEVICE () {0x1;}' unless defined(&USB_DT_DEVICE);
    eval 'sub USB_DT_CONFIG () {0x2;}' unless defined(&USB_DT_CONFIG);
    eval 'sub USB_DT_STRING () {0x3;}' unless defined(&USB_DT_STRING);
    eval 'sub USB_DT_INTERFACE () {0x4;}' unless defined(&USB_DT_INTERFACE);
    eval 'sub USB_DT_ENDPOINT () {0x5;}' unless defined(&USB_DT_ENDPOINT);
    eval 'sub USB_DT_HID () {0x21;}' unless defined(&USB_DT_HID);
    eval 'sub USB_DT_REPORT () {0x22;}' unless defined(&USB_DT_REPORT);
    eval 'sub USB_DT_PHYSICAL () {0x23;}' unless defined(&USB_DT_PHYSICAL);
    eval 'sub USB_DT_HUB () {0x29;}' unless defined(&USB_DT_HUB);
    eval 'sub USB_DT_DEVICE_SIZE () {18;}' unless defined(&USB_DT_DEVICE_SIZE);
    eval 'sub USB_DT_CONFIG_SIZE () {9;}' unless defined(&USB_DT_CONFIG_SIZE);
    eval 'sub USB_DT_INTERFACE_SIZE () {9;}' unless defined(&USB_DT_INTERFACE_SIZE);
    eval 'sub USB_DT_ENDPOINT_SIZE () {7;}' unless defined(&USB_DT_ENDPOINT_SIZE);
    eval 'sub USB_DT_ENDPOINT_AUDIO_SIZE () {9;}' unless defined(&USB_DT_ENDPOINT_AUDIO_SIZE);
    eval 'sub USB_DT_HUB_NONVAR_SIZE () {7;}' unless defined(&USB_DT_HUB_NONVAR_SIZE);
    eval 'sub USB_MAXENDPOINTS () {32;}' unless defined(&USB_MAXENDPOINTS);
    eval 'sub USB_ENDPOINT_ADDRESS_MASK () {0xf;}' unless defined(&USB_ENDPOINT_ADDRESS_MASK);
    eval 'sub USB_ENDPOINT_DIR_MASK () {0x80;}' unless defined(&USB_ENDPOINT_DIR_MASK);
    eval 'sub USB_ENDPOINT_TYPE_MASK () {0x3;}' unless defined(&USB_ENDPOINT_TYPE_MASK);
    eval 'sub USB_ENDPOINT_TYPE_CONTROL () {0;}' unless defined(&USB_ENDPOINT_TYPE_CONTROL);
    eval 'sub USB_ENDPOINT_TYPE_ISOCHRONOUS () {1;}' unless defined(&USB_ENDPOINT_TYPE_ISOCHRONOUS);
    eval 'sub USB_ENDPOINT_TYPE_BULK () {2;}' unless defined(&USB_ENDPOINT_TYPE_BULK);
    eval 'sub USB_ENDPOINT_TYPE_INTERRUPT () {3;}' unless defined(&USB_ENDPOINT_TYPE_INTERRUPT);
    eval 'sub USB_MAXINTERFACES () {32;}' unless defined(&USB_MAXINTERFACES);
    eval 'sub USB_MAXALTSETTING () {128;}' unless defined(&USB_MAXALTSETTING);
    eval 'sub USB_MAXCONFIG () {8;}' unless defined(&USB_MAXCONFIG);
    eval 'sub USB_RECIP_DEVICE () {0x;}' unless defined(&USB_RECIP_DEVICE);
    eval 'sub USB_RECIP_INTERFACE () {0x1;}' unless defined(&USB_RECIP_INTERFACE);
    eval 'sub USB_RECIP_ENDPOINT () {0x2;}' unless defined(&USB_RECIP_ENDPOINT);
    eval 'sub USB_RECIP_OTHER () {0x3;}' unless defined(&USB_RECIP_OTHER);
    eval 'sub USB_TYPE_STANDARD () {(0x << 5);}' unless defined(&USB_TYPE_STANDARD);
    eval 'sub USB_TYPE_CLASS () {(0x1 << 5);}' unless defined(&USB_TYPE_CLASS);
    eval 'sub USB_TYPE_VENDOR () {(0x2 << 5);}' unless defined(&USB_TYPE_VENDOR);
    eval 'sub USB_TYPE_RESERVED () {(0x3 << 5);}' unless defined(&USB_TYPE_RESERVED);
    eval 'sub USB_ENDPOINT_IN () {0x80;}' unless defined(&USB_ENDPOINT_IN);
    eval 'sub USB_ENDPOINT_OUT () {0x;}' unless defined(&USB_ENDPOINT_OUT);
    eval 'sub USB_REQ_GET_STATUS () {0x;}' unless defined(&USB_REQ_GET_STATUS);
    eval 'sub USB_REQ_CLEAR_FEATURE () {0x1;}' unless defined(&USB_REQ_CLEAR_FEATURE);
    eval 'sub USB_REQ_SET_FEATURE () {0x3;}' unless defined(&USB_REQ_SET_FEATURE);
    eval 'sub USB_REQ_SET_ADDRESS () {0x5;}' unless defined(&USB_REQ_SET_ADDRESS);
    eval 'sub USB_REQ_GET_DESCRIPTOR () {0x6;}' unless defined(&USB_REQ_GET_DESCRIPTOR);
    eval 'sub USB_REQ_SET_DESCRIPTOR () {0x7;}' unless defined(&USB_REQ_SET_DESCRIPTOR);
    eval 'sub USB_REQ_GET_CONFIGURATION () {0x8;}' unless defined(&USB_REQ_GET_CONFIGURATION);
    eval 'sub USB_REQ_SET_CONFIGURATION () {0x9;}' unless defined(&USB_REQ_SET_CONFIGURATION);
    eval 'sub USB_REQ_GET_INTERFACE () {0xa;}' unless defined(&USB_REQ_GET_INTERFACE);
    eval 'sub USB_REQ_SET_INTERFACE () {0xb;}' unless defined(&USB_REQ_SET_INTERFACE);
    eval 'sub USB_REQ_SYNCH_FRAME () {0xc;}' unless defined(&USB_REQ_SYNCH_FRAME);
    eval 'sub USB_ERROR_BEGIN () {500000;}' unless defined(&USB_ERROR_BEGIN);
    eval 'sub USB_LE16_TO_CPU {
        my($x) = @_;
	    eval q( &le16toh($x));
    }' unless defined(&USB_LE16_TO_CPU);
    if(defined(&__cplusplus)) {
    }
    if(0) {
    }
    if(0) {
    }
    if(defined(&__cplusplus)) {
    }
}
1;

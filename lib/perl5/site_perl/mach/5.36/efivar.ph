require '_h2ph_pre.ph';

no warnings qw(redefine misc);

unless(defined(&_EFIVAR_H_)) {
    eval 'sub _EFIVAR_H_ () {1;}' unless defined(&_EFIVAR_H_);
    require 'uuid.ph';
    require 'sys/efi.ph';
    require 'sys/endian.ph';
    require 'stdint.ph';
    eval 'sub EFI_VARIABLE_NON_VOLATILE () {0x1;}' unless defined(&EFI_VARIABLE_NON_VOLATILE);
    eval 'sub EFI_VARIABLE_BOOTSERVICE_ACCESS () {0x2;}' unless defined(&EFI_VARIABLE_BOOTSERVICE_ACCESS);
    eval 'sub EFI_VARIABLE_RUNTIME_ACCESS () {0x4;}' unless defined(&EFI_VARIABLE_RUNTIME_ACCESS);
    eval 'sub EFI_VARIABLE_HARDWARE_ERROR_RECORD () {0x8;}' unless defined(&EFI_VARIABLE_HARDWARE_ERROR_RECORD);
    eval 'sub EFI_VARIABLE_AUTHENTICATED_WRITE_ACCESS () {0x10;}' unless defined(&EFI_VARIABLE_AUTHENTICATED_WRITE_ACCESS);
    eval 'sub EFI_VARIABLE_TIME_BASED_AUTHENTICATED_WRITE_ACCESS () {0x20;}' unless defined(&EFI_VARIABLE_TIME_BASED_AUTHENTICATED_WRITE_ACCESS);
    eval 'sub EFI_VARIABLE_APPEND_WRITE () {0x40;}' unless defined(&EFI_VARIABLE_APPEND_WRITE);
    if(0) {
	eval 'sub EFI_VARIABLE_HAS_AUTH_HEADER () {1;}' unless defined(&EFI_VARIABLE_HAS_AUTH_HEADER);
	eval 'sub EFI_VARIABLE_HAS_SIGNATURE () {1;}' unless defined(&EFI_VARIABLE_HAS_SIGNATURE);
    }
    unless(defined(&_EFIVAR_EFI_GUID_T_DEF)) {
	eval 'sub _EFIVAR_EFI_GUID_T_DEF () {1;}' unless defined(&_EFIVAR_EFI_GUID_T_DEF);
    }
    if((defined(&BYTE_ORDER) ? &BYTE_ORDER : undef) == (defined(&LITTLE_ENDIAN) ? &LITTLE_ENDIAN : undef)) {
	eval 'sub EFI_GUID {
	    my($a, $b, $c, $d, $e0, $e1, $e2, $e3, $e4, $e5) = @_;
    	    eval q((( &efi_guid_t) {($a), ($b), ($c), ($d) >> 8, ($d) & 0xff, { ($e0), ($e1), ($e2), ($e3), ($e4), ($e5) }}));
	}' unless defined(&EFI_GUID);
    } else {
	eval 'sub EFI_GUID {
	    my($a, $b, $c, $d, $e0, $e1, $e2, $e3, $e4, $e5) = @_;
    	    eval q((( &efi_guid_t) {($a), ($b), ($c), ($d) & 0xff, ($d) >> 8, { ($e0), ($e1), ($e2), ($e3), ($e4), ($e5) }}));
	}' unless defined(&EFI_GUID);
    }
    eval 'sub EFI_GLOBAL_GUID () { &EFI_GUID(0x8be4df61, 0x93ca, 0x11d2, 0xaa0d, 0x, 0xe0, 0x98, 0x3, 0x2b, 0x8c);}' unless defined(&EFI_GLOBAL_GUID);
}
1;

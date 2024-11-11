require '_h2ph_pre.ph';

no warnings qw(redefine misc);

unless(defined(&_SYS_EFI_H_)) {
    eval 'sub _SYS_EFI_H_ () {1;}' unless defined(&_SYS_EFI_H_);
    require 'sys/uuid.ph';
    require 'machine/efi.ph';
    eval 'sub EFI_PAGE_SHIFT () {12;}' unless defined(&EFI_PAGE_SHIFT);
    eval 'sub EFI_PAGE_SIZE () {(1<<  &EFI_PAGE_SHIFT);}' unless defined(&EFI_PAGE_SIZE);
    eval 'sub EFI_PAGE_MASK () {( &EFI_PAGE_SIZE - 1);}' unless defined(&EFI_PAGE_MASK);
    eval 'sub EFI_TABLE_SMBIOS () {{0xeb9d2d31,0x2d88,0x11d3,0x9a,0x16,{0x,0x90,0x27,0x3f,0xc1,0x4d}};}' unless defined(&EFI_TABLE_SMBIOS);
    eval 'sub EFI_TABLE_SMBIOS3 () {{0xf2fd1544,0x9794,0x4a2c,0x99,0x2e,{0xe5,0xbb,0xcf,0x20,0xe3,0x94}};}' unless defined(&EFI_TABLE_SMBIOS3);
    eval 'sub EFI_TABLE_ESRT () {{0xb122a263,0x3661,0x4f68,0x99,0x29,{0x78,0xf8,0xb0,0xd6,0x21,0x80}};}' unless defined(&EFI_TABLE_ESRT);
    eval 'sub EFI_PROPERTIES_TABLE () {{0x880aaca3,0x4adc,0x4a04,0x90,0x79,{0xb7,0x47,0x34,0x8,0x25,0xe5}};}' unless defined(&EFI_PROPERTIES_TABLE);
    eval 'sub LINUX_EFI_MEMRESERVE_TABLE () {{0x888eb0c6,0x8ede,0x4ff5,0xa8,0xf0,{0x9a,0xee,0x5c,0xb9,0x77,0xc2}};}' unless defined(&LINUX_EFI_MEMRESERVE_TABLE);
    eval("sub EFI_RESET_COLD () { 0; }") unless defined(&EFI_RESET_COLD);
    eval("sub EFI_RESET_WARM () { 1; }") unless defined(&EFI_RESET_WARM);
    eval("sub EFI_RESET_SHUTDOWN () { 2; }") unless defined(&EFI_RESET_SHUTDOWN);
    eval 'sub EFI_MEMORY_DESCRIPTOR_VERSION () {1;}' unless defined(&EFI_MEMORY_DESCRIPTOR_VERSION);
    eval 'sub EFI_MD_TYPE_NULL () {0;}' unless defined(&EFI_MD_TYPE_NULL);
    eval 'sub EFI_MD_TYPE_CODE () {1;}' unless defined(&EFI_MD_TYPE_CODE);
    eval 'sub EFI_MD_TYPE_DATA () {2;}' unless defined(&EFI_MD_TYPE_DATA);
    eval 'sub EFI_MD_TYPE_BS_CODE () {3;}' unless defined(&EFI_MD_TYPE_BS_CODE);
    eval 'sub EFI_MD_TYPE_BS_DATA () {4;}' unless defined(&EFI_MD_TYPE_BS_DATA);
    eval 'sub EFI_MD_TYPE_RT_CODE () {5;}' unless defined(&EFI_MD_TYPE_RT_CODE);
    eval 'sub EFI_MD_TYPE_RT_DATA () {6;}' unless defined(&EFI_MD_TYPE_RT_DATA);
    eval 'sub EFI_MD_TYPE_FREE () {7;}' unless defined(&EFI_MD_TYPE_FREE);
    eval 'sub EFI_MD_TYPE_BAD () {8;}' unless defined(&EFI_MD_TYPE_BAD);
    eval 'sub EFI_MD_TYPE_RECLAIM () {9;}' unless defined(&EFI_MD_TYPE_RECLAIM);
    eval 'sub EFI_MD_TYPE_FIRMWARE () {10;}' unless defined(&EFI_MD_TYPE_FIRMWARE);
    eval 'sub EFI_MD_TYPE_IOMEM () {11;}' unless defined(&EFI_MD_TYPE_IOMEM);
    eval 'sub EFI_MD_TYPE_IOPORT () {12;}' unless defined(&EFI_MD_TYPE_IOPORT);
    eval 'sub EFI_MD_TYPE_PALCODE () {13;}' unless defined(&EFI_MD_TYPE_PALCODE);
    eval 'sub EFI_MD_TYPE_PERSISTENT () {14;}' unless defined(&EFI_MD_TYPE_PERSISTENT);
    eval 'sub EFI_MD_ATTR_UC () {0x1;}' unless defined(&EFI_MD_ATTR_UC);
    eval 'sub EFI_MD_ATTR_WC () {0x2;}' unless defined(&EFI_MD_ATTR_WC);
    eval 'sub EFI_MD_ATTR_WT () {0x4;}' unless defined(&EFI_MD_ATTR_WT);
    eval 'sub EFI_MD_ATTR_WB () {0x8;}' unless defined(&EFI_MD_ATTR_WB);
    eval 'sub EFI_MD_ATTR_UCE () {0x10;}' unless defined(&EFI_MD_ATTR_UCE);
    eval 'sub EFI_MD_ATTR_WP () {0x1000;}' unless defined(&EFI_MD_ATTR_WP);
    eval 'sub EFI_MD_ATTR_RP () {0x2000;}' unless defined(&EFI_MD_ATTR_RP);
    eval 'sub EFI_MD_ATTR_XP () {0x4000;}' unless defined(&EFI_MD_ATTR_XP);
    eval 'sub EFI_MD_ATTR_NV () {0x8000;}' unless defined(&EFI_MD_ATTR_NV);
    eval 'sub EFI_MD_ATTR_MORE_RELIABLE () {0x10000;}' unless defined(&EFI_MD_ATTR_MORE_RELIABLE);
    eval 'sub EFI_MD_ATTR_RO () {0x20000;}' unless defined(&EFI_MD_ATTR_RO);
    eval 'sub EFI_MD_ATTR_RT () {0x8000000000000000;}' unless defined(&EFI_MD_ATTR_RT);
    eval 'sub efi_next_descriptor {
        my($ptr, $size) = @_;
	    eval q((((( &uint8_t *)($ptr)) + ($size))));
    }' unless defined(&efi_next_descriptor);
    eval 'sub ESRT_FIRMWARE_RESOURCE_VERSION () {1;}' unless defined(&ESRT_FIRMWARE_RESOURCE_VERSION);
    if(defined(&_KERNEL)) {
	if(defined(&EFIABI_ATTR)) {
	}
	eval 'sub EFI_SYSTBL_SIG () {0x5453595320494249;}' unless defined(&EFI_SYSTBL_SIG);
	eval 'sub efi_get_table {
	    my($uuid,$ptr) = @_;
    	    eval q({  &if ( ($active_efi_ops->{get_table}) ==  &NULL) ( &ENXIO); ( ($active_efi_ops->{get_table})($uuid, $ptr)); });
	}' unless defined(&efi_get_table);
	eval 'sub efi_copy_table {
	    my($uuid,$buf,$buf_len,$table_len) = @_;
    	    eval q({  &if ( ($active_efi_ops->{copy_table}) ==  &NULL) ( &ENXIO); ( ($active_efi_ops->{copy_table})($uuid, $buf, $buf_len, $table_len)); });
	}' unless defined(&efi_copy_table);
	eval 'sub efi_get_time {
	    my($tm) = @_;
    	    eval q({  &if ( ($active_efi_ops->{get_time}) ==  &NULL) ( &ENXIO); ( ($active_efi_ops->{get_time})($tm)); });
	}' unless defined(&efi_get_time);
	eval 'sub efi_get_time_capabilities {
	    my($tmcap) = @_;
    	    eval q({  &if ( ($active_efi_ops->{get_time_capabilities}) ==  &NULL) ( &ENXIO); ( ($active_efi_ops->{get_time_capabilities})($tmcap)); });
	}' unless defined(&efi_get_time_capabilities);
	eval 'sub efi_reset_system {
	    my($type) = @_;
    	    eval q({  &if ( ($active_efi_ops->{reset_system}) ==  &NULL) ( &ENXIO); ( ($active_efi_ops->{reset_system})($type)); });
	}' unless defined(&efi_reset_system);
	eval 'sub efi_set_time {
	    my($tm) = @_;
    	    eval q({  &if ( ($active_efi_ops->{set_time}) ==  &NULL) ( &ENXIO); ( ($active_efi_ops->{set_time})($tm)); });
	}' unless defined(&efi_set_time);
	eval 'sub efi_get_waketime {
	    my($enabled,$pending,$tm) = @_;
    	    eval q({  &if ( ($active_efi_ops->{get_waketime}) ==  &NULL) ( &ENXIO); ( ($active_efi_ops->{get_waketime})($enabled, $pending, $tm)); });
	}' unless defined(&efi_get_waketime);
	eval 'sub efi_set_waketime {
	    my($enable,$tm) = @_;
    	    eval q({  &if ( ($active_efi_ops->{set_waketime}) ==  &NULL) ( &ENXIO); ( ($active_efi_ops->{set_waketime})($enable, $tm)); });
	}' unless defined(&efi_set_waketime);
	eval 'sub efi_var_get {
	    my($name,$vendor,$attrib,$datasize,$data) = @_;
    	    eval q({  &if ( ($active_efi_ops->{var_get}) ==  &NULL) ( &ENXIO); ( ($active_efi_ops->{var_get})($name, $vendor, $attrib, $datasize, $data)); });
	}' unless defined(&efi_var_get);
	eval 'sub efi_var_nextname {
	    my($namesize,$name,$vendor) = @_;
    	    eval q({  &if ( ($active_efi_ops->{var_nextname}) ==  &NULL) ( &ENXIO); ( ($active_efi_ops->{var_nextname})($namesize, $name, $vendor)); });
	}' unless defined(&efi_var_nextname);
	eval 'sub efi_var_set {
	    my($name,$vendor,$attrib,$datasize,$data) = @_;
    	    eval q({  &if ( ($active_efi_ops->{var_set}) ==  &NULL) ( &ENXIO); ( ($active_efi_ops->{var_set})($name, $vendor, $attrib, $datasize, $data)); });
	}' unless defined(&efi_var_set);
    }
}
1;

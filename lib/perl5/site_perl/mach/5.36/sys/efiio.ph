require '_h2ph_pre.ph';

no warnings qw(redefine misc);

unless(defined(&_SYS_EFIIO_H_)) {
    eval 'sub _SYS_EFIIO_H_ () {1;}' unless defined(&_SYS_EFIIO_H_);
    require 'sys/ioccom.ph';
    require 'sys/uuid.ph';
    require 'sys/efi.ph';
    eval 'sub EFIIOC_GET_TABLE () { &_IOWR(ord(\'E\'), 1, \'struct efi_get_table_ioc\');}' unless defined(&EFIIOC_GET_TABLE);
    eval 'sub EFIIOC_GET_TIME () { &_IOR(ord(\'E\'), 2, \'struct efi_tm\');}' unless defined(&EFIIOC_GET_TIME);
    eval 'sub EFIIOC_SET_TIME () { &_IOW(ord(\'E\'), 3, \'struct efi_tm\');}' unless defined(&EFIIOC_SET_TIME);
    eval 'sub EFIIOC_VAR_GET () { &_IOWR(ord(\'E\'), 4, \'struct efi_var_ioc\');}' unless defined(&EFIIOC_VAR_GET);
    eval 'sub EFIIOC_VAR_NEXT () { &_IOWR(ord(\'E\'), 5, \'struct efi_var_ioc\');}' unless defined(&EFIIOC_VAR_NEXT);
    eval 'sub EFIIOC_VAR_SET () { &_IOWR(ord(\'E\'), 6, \'struct efi_var_ioc\');}' unless defined(&EFIIOC_VAR_SET);
    eval 'sub EFIIOC_GET_WAKETIME () { &_IOR(ord(\'E\'), 7, \'struct efi_waketime_ioc\');}' unless defined(&EFIIOC_GET_WAKETIME);
    eval 'sub EFIIOC_SET_WAKETIME () { &_IOW(ord(\'E\'), 8, \'struct efi_waketime_ioc\');}' unless defined(&EFIIOC_SET_WAKETIME);
}
1;

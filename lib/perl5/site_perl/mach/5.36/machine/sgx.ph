require '_h2ph_pre.ph';

no warnings qw(redefine misc);

unless(defined(&_MACHINE_SGX_H_)) {
    eval 'sub _MACHINE_SGX_H_ () {1;}' unless defined(&_MACHINE_SGX_H_);
    eval 'sub SGX_MAGIC () {0xa4;}' unless defined(&SGX_MAGIC);
    eval 'sub SGX_IOC_ENCLAVE_CREATE () { &_IOW( &SGX_MAGIC, 0x, \'struct sgx_enclave_create\');}' unless defined(&SGX_IOC_ENCLAVE_CREATE);
    eval 'sub SGX_IOC_ENCLAVE_ADD_PAGE () { &_IOW( &SGX_MAGIC, 0x1, \'struct sgx_enclave_add_page\');}' unless defined(&SGX_IOC_ENCLAVE_ADD_PAGE);
    eval 'sub SGX_IOC_ENCLAVE_INIT () { &_IOW( &SGX_MAGIC, 0x2, \'struct sgx_enclave_init\');}' unless defined(&SGX_IOC_ENCLAVE_INIT);
}
1;

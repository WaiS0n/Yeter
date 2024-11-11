require '_h2ph_pre.ph';

no warnings qw(redefine misc);

unless(defined(&_SYS_IOV_H_)) {
    eval 'sub _SYS_IOV_H_ () {1;}' unless defined(&_SYS_IOV_H_);
    require 'sys/ioccom.ph';
    eval 'sub PF_CONFIG_NAME () {"PF";}' unless defined(&PF_CONFIG_NAME);
    eval 'sub VF_SCHEMA_NAME () {"VF";}' unless defined(&VF_SCHEMA_NAME);
    eval 'sub VF_PREFIX () {"VF-";}' unless defined(&VF_PREFIX);
    eval 'sub VF_PREFIX_LEN () {3;}' unless defined(&VF_PREFIX_LEN);
    eval 'sub VF_NUM_LEN () {5;}' unless defined(&VF_NUM_LEN);
    eval 'sub VF_MAX_NAME () {( &VF_PREFIX_LEN +  &VF_NUM_LEN + 1);}' unless defined(&VF_MAX_NAME);
    eval 'sub DRIVER_CONFIG_NAME () {"DRIVER";}' unless defined(&DRIVER_CONFIG_NAME);
    eval 'sub IOV_CONFIG_NAME () {"IOV";}' unless defined(&IOV_CONFIG_NAME);
    eval 'sub TYPE_SCHEMA_NAME () {"TYPE";}' unless defined(&TYPE_SCHEMA_NAME);
    eval 'sub DEFAULT_SCHEMA_NAME () {"DEFAULT";}' unless defined(&DEFAULT_SCHEMA_NAME);
    eval 'sub REQUIRED_SCHEMA_NAME () {"REQUIRED";}' unless defined(&REQUIRED_SCHEMA_NAME);
    eval 'sub IOV_CONFIG () { &_IOW(ord(\'p\'), 10, \'struct pci_iov_arg\');}' unless defined(&IOV_CONFIG);
    eval 'sub IOV_DELETE () { &_IO(ord(\'p\'), 11);}' unless defined(&IOV_DELETE);
    eval 'sub IOV_GET_SCHEMA () { &_IOWR(ord(\'p\'), 12, \'struct pci_iov_schema\');}' unless defined(&IOV_GET_SCHEMA);
}
1;

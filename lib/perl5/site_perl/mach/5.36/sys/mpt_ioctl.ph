require '_h2ph_pre.ph';

no warnings qw(redefine misc);

unless(defined(&_MPT_IOCTL_H_)) {
    eval 'sub _MPT_IOCTL_H_ () {1;}' unless defined(&_MPT_IOCTL_H_);
    require 'dev/mpt/mpilib/mpi_type.ph';
    require 'dev/mpt/mpilib/mpi.ph';
    require 'dev/mpt/mpilib/mpi_cnfg.ph';
    eval 'sub MPTIO_READ_CFG_HEADER () { &_IOWR(ord(\'M\'), 100, \'struct mpt_cfg_page_req\');}' unless defined(&MPTIO_READ_CFG_HEADER);
    eval 'sub MPTIO_READ_CFG_PAGE () { &_IOWR(ord(\'M\'), 101, \'struct mpt_cfg_page_req\');}' unless defined(&MPTIO_READ_CFG_PAGE);
    eval 'sub MPTIO_READ_EXT_CFG_HEADER () { &_IOWR(ord(\'M\'), 102, \'struct mpt_ext_cfg_page_req\');}' unless defined(&MPTIO_READ_EXT_CFG_HEADER);
    eval 'sub MPTIO_READ_EXT_CFG_PAGE () { &_IOWR(ord(\'M\'), 103, \'struct mpt_ext_cfg_page_req\');}' unless defined(&MPTIO_READ_EXT_CFG_PAGE);
    eval 'sub MPTIO_WRITE_CFG_PAGE () { &_IOWR(ord(\'M\'), 104, \'struct mpt_cfg_page_req\');}' unless defined(&MPTIO_WRITE_CFG_PAGE);
    eval 'sub MPTIO_RAID_ACTION () { &_IOWR(ord(\'M\'), 105, \'struct mpt_raid_action\');}' unless defined(&MPTIO_RAID_ACTION);
    if(defined(&__amd64__)) {
	eval 'sub MPTIO_READ_CFG_HEADER32 () { &_IOWR(ord(\'M\'), 100, \'struct mpt_cfg_page_req32\');}' unless defined(&MPTIO_READ_CFG_HEADER32);
	eval 'sub MPTIO_READ_CFG_PAGE32 () { &_IOWR(ord(\'M\'), 101, \'struct mpt_cfg_page_req32\');}' unless defined(&MPTIO_READ_CFG_PAGE32);
	eval 'sub MPTIO_READ_EXT_CFG_HEADER32 () { &_IOWR(ord(\'M\'), 102, \'struct mpt_ext_cfg_page_req32\');}' unless defined(&MPTIO_READ_EXT_CFG_HEADER32);
	eval 'sub MPTIO_READ_EXT_CFG_PAGE32 () { &_IOWR(ord(\'M\'), 103, \'struct mpt_ext_cfg_page_req32\');}' unless defined(&MPTIO_READ_EXT_CFG_PAGE32);
	eval 'sub MPTIO_WRITE_CFG_PAGE32 () { &_IOWR(ord(\'M\'), 104, \'struct mpt_cfg_page_req32\');}' unless defined(&MPTIO_WRITE_CFG_PAGE32);
	eval 'sub MPTIO_RAID_ACTION32 () { &_IOWR(ord(\'M\'), 105, \'struct mpt_raid_action32\');}' unless defined(&MPTIO_RAID_ACTION32);
    }
}
1;

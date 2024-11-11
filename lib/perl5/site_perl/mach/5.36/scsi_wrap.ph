require '_h2ph_pre.ph';

no warnings qw(redefine misc);

unless(defined(&_CAM_SCSI_WRAP_H)) {
    eval 'sub _CAM_SCSI_WRAP_H () {1;}' unless defined(&_CAM_SCSI_WRAP_H);
}
1;

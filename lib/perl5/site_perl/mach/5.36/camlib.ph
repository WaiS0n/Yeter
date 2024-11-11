require '_h2ph_pre.ph';

no warnings qw(redefine misc);

unless(defined(&_CAMLIB_H)) {
    eval 'sub _CAMLIB_H () {1;}' unless defined(&_CAMLIB_H);
    require 'sys/cdefs.ph';
    require 'sys/param.ph';
    require 'cam/cam.ph';
    require 'cam/cam_ccb.ph';
    eval 'sub CAM_ERRBUF_SIZE () {2048;}' unless defined(&CAM_ERRBUF_SIZE);
    eval 'sub XPT_DEVICE () {"/dev/xpt0";}' unless defined(&XPT_DEVICE);
}
1;

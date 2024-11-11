require '_h2ph_pre.ph';

no warnings qw(redefine misc);

unless(defined(&_SYS_DISKMBR_H_)) {
    eval 'sub _SYS_DISKMBR_H_ () {1;}' unless defined(&_SYS_DISKMBR_H_);
    require 'sys/disk/mbr.ph';
    require 'sys/ioccom.ph';
    eval 'sub DIOCSMBR () { &_IOW(ord(\'M\'), 129, \'u_char\'[512]);}' unless defined(&DIOCSMBR);
}
1;

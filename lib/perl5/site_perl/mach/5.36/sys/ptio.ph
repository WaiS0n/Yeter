require '_h2ph_pre.ph';

no warnings qw(redefine misc);

unless(defined(&_SYS_PTIO_H_)) {
    eval 'sub _SYS_PTIO_H_ () {1;}' unless defined(&_SYS_PTIO_H_);
    require 'sys/ioccom.ph';
    eval 'sub PTIOCGETTIMEOUT () { &_IOR(ord(\'T\'), 1, \'int\');}' unless defined(&PTIOCGETTIMEOUT);
    eval 'sub PTIOCSETTIMEOUT () { &_IOW(ord(\'T\'), 2, \'int\');}' unless defined(&PTIOCSETTIMEOUT);
}
1;

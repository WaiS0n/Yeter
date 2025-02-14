require '_h2ph_pre.ph';

no warnings qw(redefine misc);

unless(defined(&_SYS_SOCKIO_H_)) {
    eval 'sub _SYS_SOCKIO_H_ () {1;}' unless defined(&_SYS_SOCKIO_H_);
    require 'sys/ioccom.ph';
    eval 'sub SIOCSHIWAT () { &_IOW(ord(\'s\'), 0, \'int\');}' unless defined(&SIOCSHIWAT);
    eval 'sub SIOCGHIWAT () { &_IOR(ord(\'s\'), 1, \'int\');}' unless defined(&SIOCGHIWAT);
    eval 'sub SIOCSLOWAT () { &_IOW(ord(\'s\'), 2, \'int\');}' unless defined(&SIOCSLOWAT);
    eval 'sub SIOCGLOWAT () { &_IOR(ord(\'s\'), 3, \'int\');}' unless defined(&SIOCGLOWAT);
    eval 'sub SIOCATMARK () { &_IOR(ord(\'s\'), 7, \'int\');}' unless defined(&SIOCATMARK);
    eval 'sub SIOCSPGRP () { &_IOW(ord(\'s\'), 8, \'int\');}' unless defined(&SIOCSPGRP);
    eval 'sub SIOCGPGRP () { &_IOR(ord(\'s\'), 9, \'int\');}' unless defined(&SIOCGPGRP);
    eval 'sub SIOCGETVIFCNT () { &_IOWR(ord(\'r\'), 15, \'struct sioc_vif_req\');}' unless defined(&SIOCGETVIFCNT);
    eval 'sub SIOCGETSGCNT () { &_IOWR(ord(\'r\'), 16, \'struct sioc_sg_req\');}' unless defined(&SIOCGETSGCNT);
    eval 'sub SIOCSIFADDR () { &_IOW(ord(\'i\'), 12, \'struct ifreq\');}' unless defined(&SIOCSIFADDR);
    eval 'sub SIOCGIFADDR () { &_IOWR(ord(\'i\'), 33, \'struct ifreq\');}' unless defined(&SIOCGIFADDR);
    eval 'sub SIOCSIFDSTADDR () { &_IOW(ord(\'i\'), 14, \'struct ifreq\');}' unless defined(&SIOCSIFDSTADDR);
    eval 'sub SIOCGIFDSTADDR () { &_IOWR(ord(\'i\'), 34, \'struct ifreq\');}' unless defined(&SIOCGIFDSTADDR);
    eval 'sub SIOCSIFFLAGS () { &_IOW(ord(\'i\'), 16, \'struct ifreq\');}' unless defined(&SIOCSIFFLAGS);
    eval 'sub SIOCGIFFLAGS () { &_IOWR(ord(\'i\'), 17, \'struct ifreq\');}' unless defined(&SIOCGIFFLAGS);
    eval 'sub SIOCGIFBRDADDR () { &_IOWR(ord(\'i\'), 35, \'struct ifreq\');}' unless defined(&SIOCGIFBRDADDR);
    eval 'sub SIOCSIFBRDADDR () { &_IOW(ord(\'i\'), 19, \'struct ifreq\');}' unless defined(&SIOCSIFBRDADDR);
    eval 'sub SIOCGIFCONF () { &_IOWR(ord(\'i\'), 36, \'struct ifconf\');}' unless defined(&SIOCGIFCONF);
    eval 'sub SIOCGIFNETMASK () { &_IOWR(ord(\'i\'), 37, \'struct ifreq\');}' unless defined(&SIOCGIFNETMASK);
    eval 'sub SIOCSIFNETMASK () { &_IOW(ord(\'i\'), 22, \'struct ifreq\');}' unless defined(&SIOCSIFNETMASK);
    eval 'sub SIOCGIFMETRIC () { &_IOWR(ord(\'i\'), 23, \'struct ifreq\');}' unless defined(&SIOCGIFMETRIC);
    eval 'sub SIOCSIFMETRIC () { &_IOW(ord(\'i\'), 24, \'struct ifreq\');}' unless defined(&SIOCSIFMETRIC);
    eval 'sub SIOCDIFADDR () { &_IOW(ord(\'i\'), 25, \'struct ifreq\');}' unless defined(&SIOCDIFADDR);
    eval 'sub OSIOCAIFADDR () { &_IOW(ord(\'i\'), 26, \'struct oifaliasreq\');}' unless defined(&OSIOCAIFADDR);
    eval 'sub SIOCSIFCAP () { &_IOW(ord(\'i\'), 30, \'struct ifreq\');}' unless defined(&SIOCSIFCAP);
    eval 'sub SIOCGIFCAP () { &_IOWR(ord(\'i\'), 31, \'struct ifreq\');}' unless defined(&SIOCGIFCAP);
    eval 'sub SIOCGIFINDEX () { &_IOWR(ord(\'i\'), 32, \'struct ifreq\');}' unless defined(&SIOCGIFINDEX);
    eval 'sub SIOCGIFMAC () { &_IOWR(ord(\'i\'), 38, \'struct ifreq\');}' unless defined(&SIOCGIFMAC);
    eval 'sub SIOCSIFMAC () { &_IOW(ord(\'i\'), 39, \'struct ifreq\');}' unless defined(&SIOCSIFMAC);
    eval 'sub SIOCSIFNAME () { &_IOW(ord(\'i\'), 40, \'struct ifreq\');}' unless defined(&SIOCSIFNAME);
    eval 'sub SIOCSIFDESCR () { &_IOW(ord(\'i\'), 41, \'struct ifreq\');}' unless defined(&SIOCSIFDESCR);
    eval 'sub SIOCGIFDESCR () { &_IOWR(ord(\'i\'), 42, \'struct ifreq\');}' unless defined(&SIOCGIFDESCR);
    eval 'sub SIOCAIFADDR () { &_IOW(ord(\'i\'), 43, \'struct ifaliasreq\');}' unless defined(&SIOCAIFADDR);
    eval 'sub SIOCGIFDATA () { &_IOW(ord(\'i\'), 44, \'struct ifreq\');}' unless defined(&SIOCGIFDATA);
    eval 'sub SIOCGIFALIAS () { &_IOWR(ord(\'i\'), 45, \'struct ifaliasreq\');}' unless defined(&SIOCGIFALIAS);
    eval 'sub SIOCADDMULTI () { &_IOW(ord(\'i\'), 49, \'struct ifreq\');}' unless defined(&SIOCADDMULTI);
    eval 'sub SIOCDELMULTI () { &_IOW(ord(\'i\'), 50, \'struct ifreq\');}' unless defined(&SIOCDELMULTI);
    eval 'sub SIOCGIFMTU () { &_IOWR(ord(\'i\'), 51, \'struct ifreq\');}' unless defined(&SIOCGIFMTU);
    eval 'sub SIOCSIFMTU () { &_IOW(ord(\'i\'), 52, \'struct ifreq\');}' unless defined(&SIOCSIFMTU);
    eval 'sub SIOCGIFPHYS () { &_IOWR(ord(\'i\'), 53, \'struct ifreq\');}' unless defined(&SIOCGIFPHYS);
    eval 'sub SIOCSIFPHYS () { &_IOW(ord(\'i\'), 54, \'struct ifreq\');}' unless defined(&SIOCSIFPHYS);
    eval 'sub SIOCSIFMEDIA () { &_IOWR(ord(\'i\'), 55, \'struct ifreq\');}' unless defined(&SIOCSIFMEDIA);
    eval 'sub SIOCGIFMEDIA () { &_IOWR(ord(\'i\'), 56, \'struct ifmediareq\');}' unless defined(&SIOCGIFMEDIA);
    eval 'sub SIOCSIFGENERIC () { &_IOW(ord(\'i\'), 57, \'struct ifreq\');}' unless defined(&SIOCSIFGENERIC);
    eval 'sub SIOCGIFGENERIC () { &_IOWR(ord(\'i\'), 58, \'struct ifreq\');}' unless defined(&SIOCGIFGENERIC);
    eval 'sub SIOCGIFSTATUS () { &_IOWR(ord(\'i\'), 59, \'struct ifstat\');}' unless defined(&SIOCGIFSTATUS);
    eval 'sub SIOCSIFLLADDR () { &_IOW(ord(\'i\'), 60, \'struct ifreq\');}' unless defined(&SIOCSIFLLADDR);
    eval 'sub SIOCGI2C () { &_IOWR(ord(\'i\'), 61, \'struct ifreq\');}' unless defined(&SIOCGI2C);
    eval 'sub SIOCGHWADDR () { &_IOWR(ord(\'i\'), 62, \'struct ifreq\');}' unless defined(&SIOCGHWADDR);
    eval 'sub SIOCSIFPHYADDR () { &_IOW(ord(\'i\'), 70, \'struct ifaliasreq\');}' unless defined(&SIOCSIFPHYADDR);
    eval 'sub SIOCGIFPSRCADDR () { &_IOWR(ord(\'i\'), 71, \'struct ifreq\');}' unless defined(&SIOCGIFPSRCADDR);
    eval 'sub SIOCGIFPDSTADDR () { &_IOWR(ord(\'i\'), 72, \'struct ifreq\');}' unless defined(&SIOCGIFPDSTADDR);
    eval 'sub SIOCDIFPHYADDR () { &_IOW(ord(\'i\'), 73, \'struct ifreq\');}' unless defined(&SIOCDIFPHYADDR);
    eval 'sub SIOCGPRIVATE_0 () { &_IOWR(ord(\'i\'), 80, \'struct ifreq\');}' unless defined(&SIOCGPRIVATE_0);
    eval 'sub SIOCGPRIVATE_1 () { &_IOWR(ord(\'i\'), 81, \'struct ifreq\');}' unless defined(&SIOCGPRIVATE_1);
    eval 'sub SIOCSIFVNET () { &_IOWR(ord(\'i\'), 90, \'struct ifreq\');}' unless defined(&SIOCSIFVNET);
    eval 'sub SIOCSIFRVNET () { &_IOWR(ord(\'i\'), 91, \'struct ifreq\');}' unless defined(&SIOCSIFRVNET);
    eval 'sub SIOCGIFFIB () { &_IOWR(ord(\'i\'), 92, \'struct ifreq\');}' unless defined(&SIOCGIFFIB);
    eval 'sub SIOCSIFFIB () { &_IOW(ord(\'i\'), 93, \'struct ifreq\');}' unless defined(&SIOCSIFFIB);
    eval 'sub SIOCGTUNFIB () { &_IOWR(ord(\'i\'), 94, \'struct ifreq\');}' unless defined(&SIOCGTUNFIB);
    eval 'sub SIOCSTUNFIB () { &_IOW(ord(\'i\'), 95, \'struct ifreq\');}' unless defined(&SIOCSTUNFIB);
    eval 'sub SIOCSDRVSPEC () { &_IOW(ord(\'i\'), 123, \'struct ifdrv\');}' unless defined(&SIOCSDRVSPEC);
    eval 'sub SIOCGDRVSPEC () { &_IOWR(ord(\'i\'), 123, \'struct ifdrv\');}' unless defined(&SIOCGDRVSPEC);
    eval 'sub SIOCIFCREATE () { &_IOWR(ord(\'i\'), 122, \'struct ifreq\');}' unless defined(&SIOCIFCREATE);
    eval 'sub SIOCIFCREATE2 () { &_IOWR(ord(\'i\'), 124, \'struct ifreq\');}' unless defined(&SIOCIFCREATE2);
    eval 'sub SIOCIFDESTROY () { &_IOW(ord(\'i\'), 121, \'struct ifreq\');}' unless defined(&SIOCIFDESTROY);
    eval 'sub SIOCIFGCLONERS () { &_IOWR(ord(\'i\'), 120, \'struct if_clonereq\');}' unless defined(&SIOCIFGCLONERS);
    eval 'sub SIOCAIFGROUP () { &_IOW(ord(\'i\'), 135, \'struct ifgroupreq\');}' unless defined(&SIOCAIFGROUP);
    eval 'sub SIOCGIFGROUP () { &_IOWR(ord(\'i\'), 136, \'struct ifgroupreq\');}' unless defined(&SIOCGIFGROUP);
    eval 'sub SIOCDIFGROUP () { &_IOW(ord(\'i\'), 137, \'struct ifgroupreq\');}' unless defined(&SIOCDIFGROUP);
    eval 'sub SIOCGIFGMEMB () { &_IOWR(ord(\'i\'), 138, \'struct ifgroupreq\');}' unless defined(&SIOCGIFGMEMB);
    eval 'sub SIOCGIFXMEDIA () { &_IOWR(ord(\'i\'), 139, \'struct ifmediareq\');}' unless defined(&SIOCGIFXMEDIA);
    eval 'sub SIOCGIFRSSKEY () { &_IOWR(ord(\'i\'), 150, \'struct ifrsskey\');}' unless defined(&SIOCGIFRSSKEY);
    eval 'sub SIOCGIFRSSHASH () { &_IOWR(ord(\'i\'), 151, \'struct ifrsshash\');}' unless defined(&SIOCGIFRSSHASH);
    eval 'sub SIOCGLANPCP () { &_IOWR(ord(\'i\'), 152, \'struct ifreq\');}' unless defined(&SIOCGLANPCP);
    eval 'sub SIOCSLANPCP () { &_IOW(ord(\'i\'), 153, \'struct ifreq\');}' unless defined(&SIOCSLANPCP);
    eval 'sub SIOCGIFDOWNREASON () { &_IOWR(ord(\'i\'), 154, \'struct ifdownreason\');}' unless defined(&SIOCGIFDOWNREASON);
    eval 'sub SIOCSIFCAPNV () { &_IOW(ord(\'i\'), 155, \'struct ifreq\');}' unless defined(&SIOCSIFCAPNV);
    eval 'sub SIOCGIFCAPNV () { &_IOWR(ord(\'i\'), 156, \'struct ifreq\');}' unless defined(&SIOCGIFCAPNV);
}
1;

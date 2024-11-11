require '_h2ph_pre.ph';

no warnings qw(redefine misc);

unless(defined(&_SYS_DVDIO_H_)) {
    eval 'sub _SYS_DVDIO_H_ () {1;}' unless defined(&_SYS_DVDIO_H_);
    eval 'sub DVD_STRUCT_PHYSICAL () {0x;}' unless defined(&DVD_STRUCT_PHYSICAL);
    eval 'sub DVD_STRUCT_COPYRIGHT () {0x1;}' unless defined(&DVD_STRUCT_COPYRIGHT);
    eval 'sub DVD_STRUCT_DISCKEY () {0x2;}' unless defined(&DVD_STRUCT_DISCKEY);
    eval 'sub DVD_STRUCT_BCA () {0x3;}' unless defined(&DVD_STRUCT_BCA);
    eval 'sub DVD_STRUCT_MANUFACT () {0x4;}' unless defined(&DVD_STRUCT_MANUFACT);
    eval 'sub DVD_STRUCT_CMI () {0x5;}' unless defined(&DVD_STRUCT_CMI);
    eval 'sub DVD_STRUCT_PROTDISCID () {0x6;}' unless defined(&DVD_STRUCT_PROTDISCID);
    eval 'sub DVD_STRUCT_DISCKEYBLOCK () {0x7;}' unless defined(&DVD_STRUCT_DISCKEYBLOCK);
    eval 'sub DVD_STRUCT_DDS () {0x8;}' unless defined(&DVD_STRUCT_DDS);
    eval 'sub DVD_STRUCT_MEDIUM_STAT () {0x9;}' unless defined(&DVD_STRUCT_MEDIUM_STAT);
    eval 'sub DVD_STRUCT_SPARE_AREA () {0xa;}' unless defined(&DVD_STRUCT_SPARE_AREA);
    eval 'sub DVD_STRUCT_RMD_LAST () {0xc;}' unless defined(&DVD_STRUCT_RMD_LAST);
    eval 'sub DVD_STRUCT_RMD_RMA () {0xd;}' unless defined(&DVD_STRUCT_RMD_RMA);
    eval 'sub DVD_STRUCT_PRERECORDED () {0xe;}' unless defined(&DVD_STRUCT_PRERECORDED);
    eval 'sub DVD_STRUCT_UNIQUEID () {0xf;}' unless defined(&DVD_STRUCT_UNIQUEID);
    eval 'sub DVD_STRUCT_DCB () {0x30;}' unless defined(&DVD_STRUCT_DCB);
    eval 'sub DVD_STRUCT_LIST () {0xff;}' unless defined(&DVD_STRUCT_LIST);
    eval 'sub DVD_REPORT_AGID () {0;}' unless defined(&DVD_REPORT_AGID);
    eval 'sub DVD_REPORT_CHALLENGE () {1;}' unless defined(&DVD_REPORT_CHALLENGE);
    eval 'sub DVD_REPORT_KEY1 () {2;}' unless defined(&DVD_REPORT_KEY1);
    eval 'sub DVD_REPORT_TITLE_KEY () {4;}' unless defined(&DVD_REPORT_TITLE_KEY);
    eval 'sub DVD_REPORT_ASF () {5;}' unless defined(&DVD_REPORT_ASF);
    eval 'sub DVD_REPORT_RPC () {8;}' unless defined(&DVD_REPORT_RPC);
    eval 'sub DVD_INVALIDATE_AGID () {0x3f;}' unless defined(&DVD_INVALIDATE_AGID);
    eval 'sub DVD_SEND_CHALLENGE () {1;}' unless defined(&DVD_SEND_CHALLENGE);
    eval 'sub DVD_SEND_KEY2 () {3;}' unless defined(&DVD_SEND_KEY2);
    eval 'sub DVD_SEND_RPC () {6;}' unless defined(&DVD_SEND_RPC);
    eval 'sub DVDIOCREPORTKEY () { &_IOWR(ord(\'c\'), 200, \'struct dvd_authinfo\');}' unless defined(&DVDIOCREPORTKEY);
    eval 'sub DVDIOCSENDKEY () { &_IOWR(ord(\'c\'), 201, \'struct dvd_authinfo\');}' unless defined(&DVDIOCSENDKEY);
    eval 'sub DVDIOCREADSTRUCTURE () { &_IOWR(ord(\'c\'), 202, \'struct dvd_struct\');}' unless defined(&DVDIOCREADSTRUCTURE);
}
1;

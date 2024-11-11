require '_h2ph_pre.ph';

no warnings qw(redefine misc);

unless(defined(&_DEVICESTAT_H)) {
    eval 'sub _DEVICESTAT_H () {1;}' unless defined(&_DEVICESTAT_H);
    require 'sys/queue.ph';
    require 'sys/time.ph';
    eval 'sub DEVSTAT_NAME_LEN () {16;}' unless defined(&DEVSTAT_NAME_LEN);
    eval 'sub DEVSTAT_DEVICE_NAME () {"devstat";}' unless defined(&DEVSTAT_DEVICE_NAME);
    eval 'sub DEVSTAT_VERSION () {6;}' unless defined(&DEVSTAT_VERSION);
    eval("sub DEVSTAT_ALL_SUPPORTED () { 0x00; }") unless defined(&DEVSTAT_ALL_SUPPORTED);
    eval("sub DEVSTAT_NO_BLOCKSIZE () { 0x01; }") unless defined(&DEVSTAT_NO_BLOCKSIZE);
    eval("sub DEVSTAT_NO_ORDERED_TAGS () { 0x02; }") unless defined(&DEVSTAT_NO_ORDERED_TAGS);
    eval("sub DEVSTAT_BS_UNAVAILABLE () { 0x04; }") unless defined(&DEVSTAT_BS_UNAVAILABLE);
    eval("sub DEVSTAT_NO_DATA () { 0x00; }") unless defined(&DEVSTAT_NO_DATA);
    eval("sub DEVSTAT_READ () { 0x01; }") unless defined(&DEVSTAT_READ);
    eval("sub DEVSTAT_WRITE () { 0x02; }") unless defined(&DEVSTAT_WRITE);
    eval("sub DEVSTAT_FREE () { 0x03; }") unless defined(&DEVSTAT_FREE);
    eval 'sub DEVSTAT_N_TRANS_FLAGS () {4;}' unless defined(&DEVSTAT_N_TRANS_FLAGS);
    eval("sub DEVSTAT_TAG_SIMPLE () { 0x00; }") unless defined(&DEVSTAT_TAG_SIMPLE);
    eval("sub DEVSTAT_TAG_HEAD () { 0x01; }") unless defined(&DEVSTAT_TAG_HEAD);
    eval("sub DEVSTAT_TAG_ORDERED () { 0x02; }") unless defined(&DEVSTAT_TAG_ORDERED);
    eval("sub DEVSTAT_TAG_NONE () { 0x03; }") unless defined(&DEVSTAT_TAG_NONE);
    eval("sub DEVSTAT_PRIORITY_MIN () { 0x000; }") unless defined(&DEVSTAT_PRIORITY_MIN);
    eval("sub DEVSTAT_PRIORITY_OTHER () { 0x020; }") unless defined(&DEVSTAT_PRIORITY_OTHER);
    eval("sub DEVSTAT_PRIORITY_PASS () { 0x030; }") unless defined(&DEVSTAT_PRIORITY_PASS);
    eval("sub DEVSTAT_PRIORITY_FD () { 0x040; }") unless defined(&DEVSTAT_PRIORITY_FD);
    eval("sub DEVSTAT_PRIORITY_WFD () { 0x050; }") unless defined(&DEVSTAT_PRIORITY_WFD);
    eval("sub DEVSTAT_PRIORITY_TAPE () { 0x060; }") unless defined(&DEVSTAT_PRIORITY_TAPE);
    eval("sub DEVSTAT_PRIORITY_CD () { 0x090; }") unless defined(&DEVSTAT_PRIORITY_CD);
    eval("sub DEVSTAT_PRIORITY_DISK () { 0x110; }") unless defined(&DEVSTAT_PRIORITY_DISK);
    eval("sub DEVSTAT_PRIORITY_ARRAY () { 0x120; }") unless defined(&DEVSTAT_PRIORITY_ARRAY);
    eval("sub DEVSTAT_PRIORITY_MAX () { 0xfff; }") unless defined(&DEVSTAT_PRIORITY_MAX);
    eval("sub DEVSTAT_TYPE_DIRECT () { 0x000; }") unless defined(&DEVSTAT_TYPE_DIRECT);
    eval("sub DEVSTAT_TYPE_SEQUENTIAL () { 0x001; }") unless defined(&DEVSTAT_TYPE_SEQUENTIAL);
    eval("sub DEVSTAT_TYPE_PRINTER () { 0x002; }") unless defined(&DEVSTAT_TYPE_PRINTER);
    eval("sub DEVSTAT_TYPE_PROCESSOR () { 0x003; }") unless defined(&DEVSTAT_TYPE_PROCESSOR);
    eval("sub DEVSTAT_TYPE_WORM () { 0x004; }") unless defined(&DEVSTAT_TYPE_WORM);
    eval("sub DEVSTAT_TYPE_CDROM () { 0x005; }") unless defined(&DEVSTAT_TYPE_CDROM);
    eval("sub DEVSTAT_TYPE_SCANNER () { 0x006; }") unless defined(&DEVSTAT_TYPE_SCANNER);
    eval("sub DEVSTAT_TYPE_OPTICAL () { 0x007; }") unless defined(&DEVSTAT_TYPE_OPTICAL);
    eval("sub DEVSTAT_TYPE_CHANGER () { 0x008; }") unless defined(&DEVSTAT_TYPE_CHANGER);
    eval("sub DEVSTAT_TYPE_COMM () { 0x009; }") unless defined(&DEVSTAT_TYPE_COMM);
    eval("sub DEVSTAT_TYPE_ASC0 () { 0x00a; }") unless defined(&DEVSTAT_TYPE_ASC0);
    eval("sub DEVSTAT_TYPE_ASC1 () { 0x00b; }") unless defined(&DEVSTAT_TYPE_ASC1);
    eval("sub DEVSTAT_TYPE_STORARRAY () { 0x00c; }") unless defined(&DEVSTAT_TYPE_STORARRAY);
    eval("sub DEVSTAT_TYPE_ENCLOSURE () { 0x00d; }") unless defined(&DEVSTAT_TYPE_ENCLOSURE);
    eval("sub DEVSTAT_TYPE_FLOPPY () { 0x00e; }") unless defined(&DEVSTAT_TYPE_FLOPPY);
    eval("sub DEVSTAT_TYPE_MASK () { 0x00f; }") unless defined(&DEVSTAT_TYPE_MASK);
    eval("sub DEVSTAT_TYPE_IF_SCSI () { 0x010; }") unless defined(&DEVSTAT_TYPE_IF_SCSI);
    eval("sub DEVSTAT_TYPE_IF_IDE () { 0x020; }") unless defined(&DEVSTAT_TYPE_IF_IDE);
    eval("sub DEVSTAT_TYPE_IF_OTHER () { 0x030; }") unless defined(&DEVSTAT_TYPE_IF_OTHER);
    eval("sub DEVSTAT_TYPE_IF_MASK () { 0x0f0; }") unless defined(&DEVSTAT_TYPE_IF_MASK);
    eval("sub DEVSTAT_TYPE_PASS () { 0x100; }") unless defined(&DEVSTAT_TYPE_PASS);
    if(defined(&_KERNEL)) {
    }
}
1;

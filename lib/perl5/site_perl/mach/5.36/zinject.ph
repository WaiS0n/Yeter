require '_h2ph_pre.ph';

no warnings qw(redefine misc);

unless(defined(&_ZINJECT_H)) {
    eval 'sub _ZINJECT_H () {1;}' unless defined(&_ZINJECT_H);
    require 'sys/zfs_ioctl.ph';
    if(defined(&__cplusplus)) {
    }
    eval("sub TYPE_DATA () { 0; }") unless defined(&TYPE_DATA);
    eval("sub TYPE_DNODE () { 1; }") unless defined(&TYPE_DNODE);
    eval("sub TYPE_MOS () { 2; }") unless defined(&TYPE_MOS);
    eval("sub TYPE_MOSDIR () { 3; }") unless defined(&TYPE_MOSDIR);
    eval("sub TYPE_METASLAB () { 4; }") unless defined(&TYPE_METASLAB);
    eval("sub TYPE_CONFIG () { 5; }") unless defined(&TYPE_CONFIG);
    eval("sub TYPE_BPOBJ () { 6; }") unless defined(&TYPE_BPOBJ);
    eval("sub TYPE_SPACEMAP () { 7; }") unless defined(&TYPE_SPACEMAP);
    eval("sub TYPE_ERRLOG () { 8; }") unless defined(&TYPE_ERRLOG);
    eval("sub TYPE_LABEL_UBERBLOCK () { 9; }") unless defined(&TYPE_LABEL_UBERBLOCK);
    eval("sub TYPE_LABEL_NVLIST () { 10; }") unless defined(&TYPE_LABEL_NVLIST);
    eval("sub TYPE_LABEL_PAD1 () { 11; }") unless defined(&TYPE_LABEL_PAD1);
    eval("sub TYPE_LABEL_PAD2 () { 12; }") unless defined(&TYPE_LABEL_PAD2);
    eval("sub TYPE_INVAL () { 13; }") unless defined(&TYPE_INVAL);
    eval 'sub MOS_TYPE {
        my($t) = @_;
	    eval q((($t) >=  &TYPE_MOS  && ($t) <  &TYPE_LABEL_UBERBLOCK));
    }' unless defined(&MOS_TYPE);
    eval 'sub LABEL_TYPE {
        my($t) = @_;
	    eval q((($t) >=  &TYPE_LABEL_UBERBLOCK  && ($t) <  &TYPE_INVAL));
    }' unless defined(&LABEL_TYPE);
    if(defined(&__cplusplus)) {
    }
}
1;

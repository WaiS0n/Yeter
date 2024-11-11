require '_h2ph_pre.ph';

no warnings qw(redefine misc);

unless(defined(&_SYS_DISKLABEL_H_)) {
    eval 'sub _SYS_DISKLABEL_H_ () {1;}' unless defined(&_SYS_DISKLABEL_H_);
    unless(defined(&_KERNEL)) {
	require 'sys/types.ph';
    }
    require 'sys/ioccom.ph';
    require 'sys/disk/bsd.ph';
    eval 'sub _PATH_DISKTAB () {"/etc/disktab";}' unless defined(&_PATH_DISKTAB);
    eval 'sub LABELSECTOR () {1;}' unless defined(&LABELSECTOR);
    eval 'sub LABELOFFSET () {0;}' unless defined(&LABELOFFSET);
    eval 'sub DISKMAGIC () { &BSD_MAGIC;}' unless defined(&DISKMAGIC);
    unless(defined(&MAXPARTITIONS)) {
	eval 'sub MAXPARTITIONS () { &BSD_NPARTS_MIN;}' unless defined(&MAXPARTITIONS);
    }
    eval 'sub BBSIZE () { &BSD_BOOTBLOCK_SIZE;}' unless defined(&BBSIZE);
    eval 'sub LABEL_PART () { &BSD_PART_RAW;}' unless defined(&LABEL_PART);
    eval 'sub RAW_PART () { &BSD_PART_RAW;}' unless defined(&RAW_PART);
    eval 'sub SWAP_PART () { &BSD_PART_SWAP;}' unless defined(&SWAP_PART);
    eval 'sub NDDATA () { &BSD_NDRIVEDATA;}' unless defined(&NDDATA);
    eval 'sub NSPARE () { &BSD_NSPARE;}' unless defined(&NSPARE);
    eval 'sub dkcksum {
        my($lp) = @_;
	    eval q({  &u_int16_t * &start, * &end;  &u_int16_t  &sum = 0;  &start = ( &u_int16_t *)$lp;  &end = ( &u_int16_t *) ($lp->{d_partitions[$lp}->{d_npartitions]});  &while ( &start <  &end)  &sum ^= * &start++; ( &sum); });
    }' unless defined(&dkcksum);
    if(defined(&DKTYPENAMES)) {
	eval 'sub DKMAXTYPES () {($sizeof{ &dktypenames} / $sizeof{ $dktypenames[0]} - 1);}' unless defined(&DKMAXTYPES);
    }
    if(defined(&FSTYPENAMES)) {
	eval 'sub FSMAXTYPES () {($sizeof{ &fstypenames} / $sizeof{ $fstypenames[0]} - 1);}' unless defined(&FSMAXTYPES);
    }
    unless(defined(&_KERNEL)) {
    }
}
1;

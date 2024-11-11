require '_h2ph_pre.ph';

no warnings qw(redefine misc);

unless(defined(&_SYS_AGPIO_H_)) {
    eval 'sub _SYS_AGPIO_H_ () {1;}' unless defined(&_SYS_AGPIO_H_);
    eval 'sub AGP_PAGE_SIZE () {4096;}' unless defined(&AGP_PAGE_SIZE);
    eval 'sub AGP_PAGE_SHIFT () {12;}' unless defined(&AGP_PAGE_SHIFT);
    eval 'sub AGP_MODE_GET_RQ {
        my($x) = @_;
	    eval q(((($x) & 0xff000000) >> 24));
    }' unless defined(&AGP_MODE_GET_RQ);
    eval 'sub AGP_MODE_GET_ARQSZ {
        my($x) = @_;
	    eval q(((($x) & 0xe000) >> 13));
    }' unless defined(&AGP_MODE_GET_ARQSZ);
    eval 'sub AGP_MODE_GET_CAL {
        my($x) = @_;
	    eval q(((($x) & 0x1c00) >> 10));
    }' unless defined(&AGP_MODE_GET_CAL);
    eval 'sub AGP_MODE_GET_SBA {
        my($x) = @_;
	    eval q(((($x) & 0x200) >> 9));
    }' unless defined(&AGP_MODE_GET_SBA);
    eval 'sub AGP_MODE_GET_AGP {
        my($x) = @_;
	    eval q(((($x) & 0x100) >> 8));
    }' unless defined(&AGP_MODE_GET_AGP);
    eval 'sub AGP_MODE_GET_GART_64 {
        my($x) = @_;
	    eval q(((($x) & 0x80) >> 7));
    }' unless defined(&AGP_MODE_GET_GART_64);
    eval 'sub AGP_MODE_GET_OVER_4G {
        my($x) = @_;
	    eval q(((($x) & 0x20) >> 5));
    }' unless defined(&AGP_MODE_GET_OVER_4G);
    eval 'sub AGP_MODE_GET_FW {
        my($x) = @_;
	    eval q(((($x) & 0x10) >> 4));
    }' unless defined(&AGP_MODE_GET_FW);
    eval 'sub AGP_MODE_GET_MODE_3 {
        my($x) = @_;
	    eval q(((($x) & 0x8) >> 3));
    }' unless defined(&AGP_MODE_GET_MODE_3);
    eval 'sub AGP_MODE_GET_RATE {
        my($x) = @_;
	    eval q((($x) & 0x7));
    }' unless defined(&AGP_MODE_GET_RATE);
    eval 'sub AGP_MODE_SET_RQ {
        my($x,$v) = @_;
	    eval q(((($x) & ~0xff000000) | (($v) << 24)));
    }' unless defined(&AGP_MODE_SET_RQ);
    eval 'sub AGP_MODE_SET_ARQSZ {
        my($x,$v) = @_;
	    eval q(((($x) & ~0xe000) | (($v) << 13)));
    }' unless defined(&AGP_MODE_SET_ARQSZ);
    eval 'sub AGP_MODE_SET_CAL {
        my($x,$v) = @_;
	    eval q(((($x) & ~0x1c00) | (($v) << 10)));
    }' unless defined(&AGP_MODE_SET_CAL);
    eval 'sub AGP_MODE_SET_SBA {
        my($x,$v) = @_;
	    eval q(((($x) & ~0x200) | (($v) << 9)));
    }' unless defined(&AGP_MODE_SET_SBA);
    eval 'sub AGP_MODE_SET_AGP {
        my($x,$v) = @_;
	    eval q(((($x) & ~0x100) | (($v) << 8)));
    }' unless defined(&AGP_MODE_SET_AGP);
    eval 'sub AGP_MODE_SET_GART_64 {
        my($x,$v) = @_;
	    eval q(((($x) & ~0x80) | (($v) << 7)));
    }' unless defined(&AGP_MODE_SET_GART_64);
    eval 'sub AGP_MODE_SET_OVER_4G {
        my($x,$v) = @_;
	    eval q(((($x) & ~0x20) | (($v) << 5)));
    }' unless defined(&AGP_MODE_SET_OVER_4G);
    eval 'sub AGP_MODE_SET_FW {
        my($x,$v) = @_;
	    eval q(((($x) & ~0x10) | (($v) << 4)));
    }' unless defined(&AGP_MODE_SET_FW);
    eval 'sub AGP_MODE_SET_MODE_3 {
        my($x,$v) = @_;
	    eval q(((($x) & ~0x8) | (($v) << 3)));
    }' unless defined(&AGP_MODE_SET_MODE_3);
    eval 'sub AGP_MODE_SET_RATE {
        my($x,$v) = @_;
	    eval q(((($x) & ~0x7) | ($v)));
    }' unless defined(&AGP_MODE_SET_RATE);
    eval 'sub AGP_MODE_V2_RATE_1x () {0x1;}' unless defined(&AGP_MODE_V2_RATE_1x);
    eval 'sub AGP_MODE_V2_RATE_2x () {0x2;}' unless defined(&AGP_MODE_V2_RATE_2x);
    eval 'sub AGP_MODE_V2_RATE_4x () {0x4;}' unless defined(&AGP_MODE_V2_RATE_4x);
    eval 'sub AGP_MODE_V3_RATE_4x () {0x1;}' unless defined(&AGP_MODE_V3_RATE_4x);
    eval 'sub AGP_MODE_V3_RATE_8x () {0x2;}' unless defined(&AGP_MODE_V3_RATE_8x);
    eval 'sub AGP_MODE_V3_RATE_RSVD () {0x4;}' unless defined(&AGP_MODE_V3_RATE_RSVD);
    eval 'sub AGP_MODE_GET_4G {
        my($x) = @_;
	    eval q( &AGP_MODE_GET_OVER_4G($x));
    }' unless defined(&AGP_MODE_GET_4G);
    eval 'sub AGP_MODE_SET_4G {
        my($x) = @_;
	    eval q( &AGP_MODE_SET_OVER_4G($x));
    }' unless defined(&AGP_MODE_SET_4G);
    eval 'sub AGP_MODE_RATE_1x () { &AGP_MODE_V2_RATE_1x;}' unless defined(&AGP_MODE_RATE_1x);
    eval 'sub AGP_MODE_RATE_2x () { &AGP_MODE_V2_RATE_2x;}' unless defined(&AGP_MODE_RATE_2x);
    eval 'sub AGP_MODE_RATE_4x () { &AGP_MODE_V2_RATE_4x;}' unless defined(&AGP_MODE_RATE_4x);
    eval 'sub AGPIOC_BASE () {ord(\'A\');}' unless defined(&AGPIOC_BASE);
    eval 'sub AGPIOC_INFO () { &_IOR ( &AGPIOC_BASE, 0,  &agp_info);}' unless defined(&AGPIOC_INFO);
    eval 'sub AGPIOC_ACQUIRE () { &_IO ( &AGPIOC_BASE, 1);}' unless defined(&AGPIOC_ACQUIRE);
    eval 'sub AGPIOC_RELEASE () { &_IO ( &AGPIOC_BASE, 2);}' unless defined(&AGPIOC_RELEASE);
    eval 'sub AGPIOC_SETUP () { &_IOW ( &AGPIOC_BASE, 3,  &agp_setup);}' unless defined(&AGPIOC_SETUP);
    if(0) {
	eval 'sub AGPIOC_RESERVE () { &_IOW ( &AGPIOC_BASE, 4,  &agp_region);}' unless defined(&AGPIOC_RESERVE);
	eval 'sub AGPIOC_PROTECT () { &_IOW ( &AGPIOC_BASE, 5,  &agp_region);}' unless defined(&AGPIOC_PROTECT);
    }
    eval 'sub AGPIOC_ALLOCATE () { &_IOWR( &AGPIOC_BASE, 6,  &agp_allocate);}' unless defined(&AGPIOC_ALLOCATE);
    eval 'sub AGPIOC_DEALLOCATE () { &_IOW ( &AGPIOC_BASE, 7, \'int\');}' unless defined(&AGPIOC_DEALLOCATE);
    eval 'sub AGPIOC_BIND () { &_IOW ( &AGPIOC_BASE, 8,  &agp_bind);}' unless defined(&AGPIOC_BIND);
    eval 'sub AGPIOC_UNBIND () { &_IOW ( &AGPIOC_BASE, 9,  &agp_unbind);}' unless defined(&AGPIOC_UNBIND);
    eval 'sub AGPIOC_CHIPSET_FLUSH () { &_IO ( &AGPIOC_BASE, 10);}' unless defined(&AGPIOC_CHIPSET_FLUSH);
    if(0) {
    }
}
1;

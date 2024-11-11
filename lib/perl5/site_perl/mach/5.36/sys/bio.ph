require '_h2ph_pre.ph';

no warnings qw(redefine misc);

unless(defined(&_SYS_BIO_H_)) {
    eval 'sub _SYS_BIO_H_ () {1;}' unless defined(&_SYS_BIO_H_);
    require 'sys/queue.ph';
    require 'sys/disk_zone.ph';
    eval 'sub BIO_READ () {0x1;}' unless defined(&BIO_READ);
    eval 'sub BIO_WRITE () {0x2;}' unless defined(&BIO_WRITE);
    eval 'sub BIO_DELETE () {0x3;}' unless defined(&BIO_DELETE);
    eval 'sub BIO_GETATTR () {0x4;}' unless defined(&BIO_GETATTR);
    eval 'sub BIO_FLUSH () {0x5;}' unless defined(&BIO_FLUSH);
    eval 'sub BIO_CMD0 () {0x6;}' unless defined(&BIO_CMD0);
    eval 'sub BIO_CMD1 () {0x7;}' unless defined(&BIO_CMD1);
    eval 'sub BIO_CMD2 () {0x8;}' unless defined(&BIO_CMD2);
    eval 'sub BIO_ZONE () {0x9;}' unless defined(&BIO_ZONE);
    eval 'sub BIO_SPEEDUP () {0xa;}' unless defined(&BIO_SPEEDUP);
    eval 'sub BIO_ERROR () {0x1;}' unless defined(&BIO_ERROR);
    eval 'sub BIO_DONE () {0x2;}' unless defined(&BIO_DONE);
    eval 'sub BIO_ONQUEUE () {0x4;}' unless defined(&BIO_ONQUEUE);
    eval 'sub BIO_ORDERED () {0x8;}' unless defined(&BIO_ORDERED);
    eval 'sub BIO_UNMAPPED () {0x10;}' unless defined(&BIO_UNMAPPED);
    eval 'sub BIO_TRANSIENT_MAPPING () {0x20;}' unless defined(&BIO_TRANSIENT_MAPPING);
    eval 'sub BIO_VLIST () {0x40;}' unless defined(&BIO_VLIST);
    eval 'sub BIO_SWAP () {0x200;}' unless defined(&BIO_SWAP);
    eval 'sub BIO_SPEEDUP_WRITE () {0x4000;}' unless defined(&BIO_SPEEDUP_WRITE);
    eval 'sub BIO_SPEEDUP_TRIM () {0x8000;}' unless defined(&BIO_SPEEDUP_TRIM);
    eval 'sub PRINT_BIO_FLAGS () {"\\20\\20speedup_trim\\17speedup_write\\12swap\\7vlist\\6transient_mapping\\5unmapped" "\\4ordered\\3onqueue\\2done\\1error";}' unless defined(&PRINT_BIO_FLAGS);
    if(defined(&_KERNEL)) {
	if(defined(&DIAGNOSTIC)) {
	}
	if(defined(&BUF_TRACKING) || defined(&FULL_BUF_TRACKING)) {
	}
	if(defined(&BUF_TRACKING) || defined(&FULL_BUF_TRACKING)) {
	    eval 'sub biotrack {
	        my($bp,$location) = @_;
    		eval q({  &if ( ($bp->{bio_track_bp}) !=  &NULL)  &biotrack_buf($bp, $location); });
	    }' unless defined(&biotrack);
	} else {
	    eval 'sub biotrack {
	        my($__unused,$__unused) = @_;
    		eval q({ });
	    }' unless defined(&biotrack);
	}
	eval 'sub physread () { &physio;}' unless defined(&physread);
	eval 'sub physwrite () { &physio;}' unless defined(&physwrite);
    }
}
1;

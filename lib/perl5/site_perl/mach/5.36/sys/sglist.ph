require '_h2ph_pre.ph';

no warnings qw(redefine misc);

unless(defined(&__SGLIST_H__)) {
    eval 'sub __SGLIST_H__ () {1;}' unless defined(&__SGLIST_H__);
    require 'sys/refcount.ph';
    eval 'sub sglist_init {
        my($sg,$maxsegs,$segs) = @_;
	    eval q({  ($sg->{sg_segs}) = $segs;  ($sg->{sg_nseg}) = 0;  ($sg->{sg_maxseg}) = $maxsegs;  &refcount_init( ($sg->{sg_refs}), 1); });
    }' unless defined(&sglist_init);
    eval 'sub sglist_reset {
        my($sg) = @_;
	    eval q({  ($sg->{sg_nseg}) = 0; });
    }' unless defined(&sglist_reset);
    eval 'sub sglist_hold {
        my($sg) = @_;
	    eval q({  &refcount_acquire( ($sg->{sg_refs})); ($sg); });
    }' unless defined(&sglist_hold);
}
1;

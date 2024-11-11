require '_h2ph_pre.ph';

no warnings qw(redefine misc);

unless(defined(&_SYS_RMAN_H_)) {
    eval 'sub _SYS_RMAN_H_ () {1;}' unless defined(&_SYS_RMAN_H_);
    unless(defined(&_KERNEL)) {
	require 'sys/queue.ph';
    } else {
	require 'machine/_bus.ph';
	require 'machine/resource.ph';
    }
    eval 'sub RF_ALLOCATED () {0x1;}' unless defined(&RF_ALLOCATED);
    eval 'sub RF_ACTIVE () {0x2;}' unless defined(&RF_ACTIVE);
    eval 'sub RF_SHAREABLE () {0x4;}' unless defined(&RF_SHAREABLE);
    eval 'sub RF_SPARE1 () {0x8;}' unless defined(&RF_SPARE1);
    eval 'sub RF_SPARE2 () {0x10;}' unless defined(&RF_SPARE2);
    eval 'sub RF_FIRSTSHARE () {0x20;}' unless defined(&RF_FIRSTSHARE);
    eval 'sub RF_PREFETCHABLE () {0x40;}' unless defined(&RF_PREFETCHABLE);
    eval 'sub RF_OPTIONAL () {0x80;}' unless defined(&RF_OPTIONAL);
    eval 'sub RF_UNMAPPED () {0x100;}' unless defined(&RF_UNMAPPED);
    eval 'sub RF_ALIGNMENT_SHIFT () {10;}' unless defined(&RF_ALIGNMENT_SHIFT);
    eval 'sub RF_ALIGNMENT_MASK () {(0x3f <<  &RF_ALIGNMENT_SHIFT);}' unless defined(&RF_ALIGNMENT_MASK);
    eval 'sub RF_ALIGNMENT_LOG2 {
        my($x) = @_;
	    eval q((($x) <<  &RF_ALIGNMENT_SHIFT));
    }' unless defined(&RF_ALIGNMENT_LOG2);
    eval 'sub RF_ALIGNMENT {
        my($x) = @_;
	    eval q(((($x) &  &RF_ALIGNMENT_MASK) >>  &RF_ALIGNMENT_SHIFT));
    }' unless defined(&RF_ALIGNMENT);
    eval("sub RMAN_UNINIT () { 0; }") unless defined(&RMAN_UNINIT);
    eval("sub RMAN_GAUGE () { 1; }") unless defined(&RMAN_GAUGE);
    eval("sub RMAN_ARRAY () { 2; }") unless defined(&RMAN_ARRAY);
    eval 'sub RM_TEXTLEN () {32;}' unless defined(&RM_TEXTLEN);
    eval 'sub RM_MAX_END () {(~( &rman_res_t)0);}' unless defined(&RM_MAX_END);
    eval 'sub RMAN_IS_DEFAULT_RANGE {
        my($s,$e) = @_;
	    eval q((($s) == 0 && ($e) ==  &RM_MAX_END));
    }' unless defined(&RMAN_IS_DEFAULT_RANGE);
    if(defined(&_KERNEL)) {
    }
}
1;

require '_h2ph_pre.ph';

no warnings qw(redefine misc);

unless(defined(&_COMPAT_H_)) {
    eval 'sub _COMPAT_H_ () {1;}' unless defined(&_COMPAT_H_);
    eval 'sub PTRIN {
        my($v) = @_;
	    eval q(( &void *)( &uintptr_t)($v));
    }' unless defined(&PTRIN);
    eval 'sub PTROUT {
        my($v) = @_;
	    eval q(( &uintptr_t)($v));
    }' unless defined(&PTROUT);
    eval 'sub CP {
        my($src, $dst, $fld) = @_;
	    eval q( &do { ($dst).$fld = ($src).$fld; }  &while (0));
    }' unless defined(&CP);
    eval 'sub CP2 {
        my($src, $dst, $sfld, $dfld) = @_;
	    eval q( &do { ($dst).$dfld = ($src).$sfld; }  &while (0));
    }' unless defined(&CP2);
    eval 'sub PTRIN_CP {
        my($src, $dst, $fld) = @_;
	    eval q( &do { ($dst).$fld =  &PTRIN(($src).$fld); }  &while (0));
    }' unless defined(&PTRIN_CP);
    eval 'sub PTROUT_CP {
        my($src, $dst, $fld) = @_;
	    eval q( &do { ($dst).$fld =  &PTROUT(($src).$fld); }  &while (0));
    }' unless defined(&PTROUT_CP);
    eval 'sub TV_CP {
        my($src, $dst, $fld) = @_;
	    eval q( &do {  &CP(($src).$fld, ($dst).$fld,  &tv_sec);  &CP(($src).$fld, ($dst).$fld,  &tv_usec); }  &while (0));
    }' unless defined(&TV_CP);
    eval 'sub TS_CP {
        my($src, $dst, $fld) = @_;
	    eval q( &do {  &CP(($src).$fld, ($dst).$fld,  &tv_sec);  &CP(($src).$fld, ($dst).$fld,  &tv_nsec); }  &while (0));
    }' unless defined(&TS_CP);
    eval 'sub ITS_CP {
        my($src, $dst) = @_;
	    eval q( &do {  &TS_CP(($src), ($dst),  &it_interval);  &TS_CP(($src), ($dst),  &it_value); }  &while (0));
    }' unless defined(&ITS_CP);
    eval 'sub BT_CP {
        my($src, $dst, $fld) = @_;
	    eval q( &do {  &CP(($src).$fld, ($dst).$fld,  &sec); *( &uint64_t *)($dst). ($fld->{frac[0]}) = ($src). ($fld->{frac}); }  &while (0));
    }' unless defined(&BT_CP);
}
1;

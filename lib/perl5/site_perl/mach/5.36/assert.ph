require '_h2ph_pre.ph';

no warnings qw(redefine misc);

require 'sys/cdefs.ph';
undef(&assert) if defined(&assert);
undef(&_assert) if defined(&_assert);
if(defined(&NDEBUG)) {
    eval 'sub assert {
        my($e) = @_;
	    eval q((( &void)0));
    }' unless defined(&assert);
    eval 'sub _assert {
        my($e) = @_;
	    eval q((( &void)0));
    }' unless defined(&_assert);
} else {
    eval 'sub _assert {
        my($e) = @_;
	    eval q( &assert($e));
    }' unless defined(&_assert);
    eval 'sub assert {
        my($e) = @_;
	    eval q((($e) ? ( &void)0:  &__assert( &__func__,  &__FILE__,  &__LINE__, $e)));
    }' unless defined(&assert);
}
unless(defined(&_ASSERT_H_)) {
    eval 'sub _ASSERT_H_ () {1;}' unless defined(&_ASSERT_H_);
    if((defined(&__ISO_C_VISIBLE) ? &__ISO_C_VISIBLE : undef) >= 2011 && !defined(&__cplusplus)) {
	eval 'sub static_assert () { &_Static_assert;}' unless defined(&static_assert);
    }
}
1;

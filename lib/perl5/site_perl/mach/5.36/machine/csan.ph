require '_h2ph_pre.ph';

no warnings qw(redefine misc);

require 'sys/timetc.ph';
require 'machine/clock.ph';
require 'machine/cpufunc.ph';
require 'machine/stack.ph';
require 'machine/vmparam.ph';
unless(defined(&kcsan_md_unsupported)) {
    sub kcsan_md_unsupported {
	my($addr) = @_;
	eval q({  &false; });
    }
}
unless(defined(&kcsan_md_is_avail)) {
    sub kcsan_md_is_avail {
	my($void) = @_;
	eval q({  &true; });
    }
}
unless(defined(&kcsan_md_disable_intrs)) {
    sub kcsan_md_disable_intrs {
	my($state) = @_;
	eval q({ *$state =  &intr_disable(); });
    }
}
unless(defined(&kcsan_md_enable_intrs)) {
    sub kcsan_md_enable_intrs {
	my($state) = @_;
	eval q({  &intr_restore(*$state); });
    }
}
unless(defined(&kcsan_md_delay)) {
    sub kcsan_md_delay {
	my($us) = @_;
	eval q({  &if (( &tsc_is_invariant  &&  &tsc_freq != 0) ||  ($timecounter->{tc_quality}) > 0)  &DELAY($us); });
    }
}
1;

require '_h2ph_pre.ph';

no warnings qw(redefine misc);

unless(defined(&_SYS_SELINFO_H_)) {
    eval 'sub _SYS_SELINFO_H_ () {1;}' unless defined(&_SYS_SELINFO_H_);
    require 'sys/event.ph';
    eval 'sub SEL_WAITING {
        my($si) = @_;
	    eval q((! &TAILQ_EMPTY(($si)-> &si_tdlist)));
    }' unless defined(&SEL_WAITING);
    if(defined(&_KERNEL)) {
    }
}
1;

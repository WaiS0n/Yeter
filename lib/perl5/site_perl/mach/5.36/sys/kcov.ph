require '_h2ph_pre.ph';

no warnings qw(redefine misc);

unless(defined(&_SYS_KCOV_H_)) {
    eval 'sub _SYS_KCOV_H_ () {1;}' unless defined(&_SYS_KCOV_H_);
    require 'sys/coverage.ph';
    require 'sys/ioccom.ph';
    eval 'sub KCOV_MAXENTRIES () {(1<< 24);}' unless defined(&KCOV_MAXENTRIES);
    eval 'sub KCOV_ENTRY_SIZE () {8;}' unless defined(&KCOV_ENTRY_SIZE);
    eval 'sub KCOV_MODE_TRACE_PC () {0;}' unless defined(&KCOV_MODE_TRACE_PC);
    eval 'sub KCOV_MODE_TRACE_CMP () {1;}' unless defined(&KCOV_MODE_TRACE_CMP);
    eval 'sub KIOENABLE () { &_IOWINT(ord(\'c\'), 2);}' unless defined(&KIOENABLE);
    eval 'sub KIODISABLE () { &_IO(ord(\'c\'), 3);}' unless defined(&KIODISABLE);
    eval 'sub KIOSETBUFSIZE () { &_IOWINT(ord(\'c\'), 4);}' unless defined(&KIOSETBUFSIZE);
    eval 'sub KCOV_CMP_CONST () { &COV_CMP_CONST;}' unless defined(&KCOV_CMP_CONST);
    eval 'sub KCOV_CMP_SIZE {
        my($x) = @_;
	    eval q( &COV_CMP_SIZE($x));
    }' unless defined(&KCOV_CMP_SIZE);
    eval 'sub KCOV_CMP_MASK () { &COV_CMP_MASK;}' unless defined(&KCOV_CMP_MASK);
    eval 'sub KCOV_CMP_GET_SIZE {
        my($x) = @_;
	    eval q( &COV_CMP_GET_SIZE($x));
    }' unless defined(&KCOV_CMP_GET_SIZE);
}
1;

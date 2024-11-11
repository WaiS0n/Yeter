require '_h2ph_pre.ph';

no warnings qw(redefine misc);

unless(defined(&_SYS_DTRACE_BSD_H)) {
    eval 'sub _SYS_DTRACE_BSD_H () {1;}' unless defined(&_SYS_DTRACE_BSD_H);
}
1;

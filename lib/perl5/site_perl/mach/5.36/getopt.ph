require '_h2ph_pre.ph';

no warnings qw(redefine misc);

unless(defined(&_GETOPT_H_)) {
    eval 'sub _GETOPT_H_ () {1;}' unless defined(&_GETOPT_H_);
    require 'sys/cdefs.ph';
    eval 'sub no_argument () {0;}' unless defined(&no_argument);
    eval 'sub required_argument () {1;}' unless defined(&required_argument);
    eval 'sub optional_argument () {2;}' unless defined(&optional_argument);
    unless(defined(&_GETOPT_DECLARED)) {
	eval 'sub _GETOPT_DECLARED () {1;}' unless defined(&_GETOPT_DECLARED);
    }
    unless(defined(&_OPTRESET_DECLARED)) {
	eval 'sub _OPTRESET_DECLARED () {1;}' unless defined(&_OPTRESET_DECLARED);
    }
}
1;

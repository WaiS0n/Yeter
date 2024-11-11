require '_h2ph_pre.ph';

no warnings qw(redefine misc);

unless(defined(&_ULIMIT_H_)) {
    eval 'sub _ULIMIT_H_ () {1;}' unless defined(&_ULIMIT_H_);
    require 'sys/cdefs.ph';
    eval 'sub UL_GETFSIZE () {1;}' unless defined(&UL_GETFSIZE);
    eval 'sub UL_SETFSIZE () {2;}' unless defined(&UL_SETFSIZE);
}
1;

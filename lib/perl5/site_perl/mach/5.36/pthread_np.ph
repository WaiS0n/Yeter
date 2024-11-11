require '_h2ph_pre.ph';

no warnings qw(redefine misc);

unless(defined(&_PTHREAD_NP_H_)) {
    eval 'sub _PTHREAD_NP_H_ () {1;}' unless defined(&_PTHREAD_NP_H_);
    require 'sys/param.ph';
    require 'sys/cpuset.ph';
}
1;

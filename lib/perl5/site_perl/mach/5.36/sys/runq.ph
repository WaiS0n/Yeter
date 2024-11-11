require '_h2ph_pre.ph';

no warnings qw(redefine misc);

unless(defined(&_RUNQ_H_)) {
    eval 'sub _RUNQ_H_ () {1;}' unless defined(&_RUNQ_H_);
    require 'machine/runq.ph';
    eval 'sub RQ_NQS () {(64);}' unless defined(&RQ_NQS);
    eval 'sub RQ_PPQ () {(4);}' unless defined(&RQ_PPQ);
}
1;

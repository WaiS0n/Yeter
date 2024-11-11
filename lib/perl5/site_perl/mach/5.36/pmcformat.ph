require '_h2ph_pre.ph';

no warnings qw(redefine misc);

unless(defined(&__PMCFORMAT_H_)) {
    eval 'sub __PMCFORMAT_H_ () {1;}' unless defined(&__PMCFORMAT_H_);
}
1;

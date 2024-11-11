require '_h2ph_pre.ph';

no warnings qw(redefine misc);

unless(defined(&__SYS_PCTRIE_H_)) {
    eval 'sub __SYS_PCTRIE_H_ () {1;}' unless defined(&__SYS_PCTRIE_H_);
}
1;

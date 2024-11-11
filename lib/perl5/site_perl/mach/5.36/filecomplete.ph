require '_h2ph_pre.ph';

no warnings qw(redefine misc);

unless(defined(&_FILECOMPLETE_H_)) {
    eval 'sub _FILECOMPLETE_H_ () {1;}' unless defined(&_FILECOMPLETE_H_);
    eval 'sub FN_QUOTE_MATCH () {1;}' unless defined(&FN_QUOTE_MATCH);
}
1;

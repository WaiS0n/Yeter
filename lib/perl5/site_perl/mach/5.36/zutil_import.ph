require '_h2ph_pre.ph';

no warnings qw(redefine misc);

unless(defined(&_LIBZUTIL_ZUTIL_IMPORT_H_)) {
    eval 'sub _LIBZUTIL_ZUTIL_IMPORT_H_ () {1;}' unless defined(&_LIBZUTIL_ZUTIL_IMPORT_H_);
    eval 'sub IMPORT_ORDER_PREFERRED_1 () {1;}' unless defined(&IMPORT_ORDER_PREFERRED_1);
    eval 'sub IMPORT_ORDER_PREFERRED_2 () {2;}' unless defined(&IMPORT_ORDER_PREFERRED_2);
    eval 'sub IMPORT_ORDER_SCAN_OFFSET () {10;}' unless defined(&IMPORT_ORDER_SCAN_OFFSET);
    eval 'sub IMPORT_ORDER_DEFAULT () {100;}' unless defined(&IMPORT_ORDER_DEFAULT);
}
1;

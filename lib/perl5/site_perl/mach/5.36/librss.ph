require '_h2ph_pre.ph';

no warnings qw(redefine misc);

unless(defined(&__LIBRSS_H__)) {
    eval 'sub __LIBRSS_H__ () {1;}' unless defined(&__LIBRSS_H__);
    eval("sub RSS_BUCKET_TYPE_NONE () { 0; }") unless defined(&RSS_BUCKET_TYPE_NONE);
    eval("sub RSS_BUCKET_TYPE_KERNEL_ALL () { 1; }") unless defined(&RSS_BUCKET_TYPE_KERNEL_ALL);
    eval("sub RSS_BUCKET_TYPE_KERNEL_TX () { 2; }") unless defined(&RSS_BUCKET_TYPE_KERNEL_TX);
    eval("sub RSS_BUCKET_TYPE_KERNEL_RX () { 3; }") unless defined(&RSS_BUCKET_TYPE_KERNEL_RX);
    eval("sub RSS_BUCKET_TYPE_MAX () { 3; }") unless defined(&RSS_BUCKET_TYPE_MAX);
}
1;

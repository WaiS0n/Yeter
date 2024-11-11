require '_h2ph_pre.ph';

no warnings qw(redefine misc);

unless(defined(&_THREAD_POOL_IMPL_H)) {
    eval 'sub _THREAD_POOL_IMPL_H () {1;}' unless defined(&_THREAD_POOL_IMPL_H);
    require 'thread_pool.ph';
    if(defined(&__cplusplus)) {
    }
    eval 'sub TP_WAIT () {0x1;}' unless defined(&TP_WAIT);
    eval 'sub TP_SUSPEND () {0x2;}' unless defined(&TP_SUSPEND);
    eval 'sub TP_DESTROY () {0x4;}' unless defined(&TP_DESTROY);
    eval 'sub TP_ABANDON () {0x8;}' unless defined(&TP_ABANDON);
    if(defined(&__cplusplus)) {
    }
}
1;

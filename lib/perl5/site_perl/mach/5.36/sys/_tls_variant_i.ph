require '_h2ph_pre.ph';

no warnings qw(redefine misc);

unless(defined(&_SYS_TLS_VARIANT_I_H_)) {
    eval 'sub _SYS_TLS_VARIANT_I_H_ () {1;}' unless defined(&_SYS_TLS_VARIANT_I_H_);
    eval 'sub TLS_VARIANT_I () {1;}' unless defined(&TLS_VARIANT_I);
    eval 'sub TLS_TCB_SIZE () {$sizeof{\'struct tcb\'};}' unless defined(&TLS_TCB_SIZE);
}
1;

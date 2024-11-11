require '_h2ph_pre.ph';

no warnings qw(redefine misc);

unless(defined(&_SYS_IOV_SCHEMA_H_)) {
    eval 'sub _SYS_IOV_SCHEMA_H_ () {1;}' unless defined(&_SYS_IOV_SCHEMA_H_);
    eval 'sub IOV_SCHEMA_HASDEFAULT () {(1<< 0);}' unless defined(&IOV_SCHEMA_HASDEFAULT);
    eval 'sub IOV_SCHEMA_REQUIRED () {(1<< 1);}' unless defined(&IOV_SCHEMA_REQUIRED);
}
1;

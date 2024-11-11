require '_h2ph_pre.ph';

no warnings qw(redefine misc);

unless(defined(&_SYS__SOCKADDR_STORAGE_H_)) {
    eval 'sub _SYS__SOCKADDR_STORAGE_H_ () {1;}' unless defined(&_SYS__SOCKADDR_STORAGE_H_);
    eval 'sub _SS_MAXSIZE () {128;}' unless defined(&_SS_MAXSIZE);
    eval 'sub _SS_ALIGNSIZE () {($sizeof{ &__int64_t});}' unless defined(&_SS_ALIGNSIZE);
    eval 'sub _SS_PAD1SIZE () {( &_SS_ALIGNSIZE - $sizeof{\'unsigned char\'} - $sizeof{ &sa_family_t});}' unless defined(&_SS_PAD1SIZE);
    eval 'sub _SS_PAD2SIZE () {( &_SS_MAXSIZE - $sizeof{\'unsigned char\'} - $sizeof{ &sa_family_t} -  &_SS_PAD1SIZE -  &_SS_ALIGNSIZE);}' unless defined(&_SS_PAD2SIZE);
}
1;

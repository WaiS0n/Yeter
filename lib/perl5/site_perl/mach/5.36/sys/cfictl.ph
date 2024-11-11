require '_h2ph_pre.ph';

no warnings qw(redefine misc);

unless(defined(&_SYS_CFICTL_H_)) {
    eval 'sub _SYS_CFICTL_H_ () {1;}' unless defined(&_SYS_CFICTL_H_);
    eval 'sub CFIOCQRY () { &_IOWR(ord(\'q\'), 0, \'struct cfiocqry\');}' unless defined(&CFIOCQRY);
    eval 'sub CFIOCGFACTORYPR () { &_IOR(ord(\'q\'), 1,  &uint64_t);}' unless defined(&CFIOCGFACTORYPR);
    eval 'sub CFIOCGOEMPR () { &_IOR(ord(\'q\'), 2,  &uint64_t);}' unless defined(&CFIOCGOEMPR);
    eval 'sub CFIOCSOEMPR () { &_IOW(ord(\'q\'), 3,  &uint64_t);}' unless defined(&CFIOCSOEMPR);
    eval 'sub CFIOCGPLR () { &_IOR(ord(\'q\'), 4,  &uint32_t);}' unless defined(&CFIOCGPLR);
    eval 'sub CFIOCSPLR () { &_IO(ord(\'q\'), 5);}' unless defined(&CFIOCSPLR);
}
1;

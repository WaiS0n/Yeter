require '_h2ph_pre.ph';

no warnings qw(redefine misc);

unless(defined(&_SYS_SIGIO_H_)) {
    eval 'sub _SYS_SIGIO_H_ () {1;}' unless defined(&_SYS_SIGIO_H_);
    eval 'sub sio_proc () { ($sio_u->{siu_proc});}' unless defined(&sio_proc);
    eval 'sub sio_pgrp () { ($sio_u->{siu_pgrp});}' unless defined(&sio_pgrp);
}
1;

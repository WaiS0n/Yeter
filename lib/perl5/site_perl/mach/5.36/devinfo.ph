require '_h2ph_pre.ph';

no warnings qw(redefine misc);

unless(defined(&_DEVINFO_H_INCLUDED)) {
    eval 'sub _DEVINFO_H_INCLUDED () {1;}' unless defined(&_DEVINFO_H_INCLUDED);
    require 'sys/cdefs.ph';
    require 'sys/types.ph';
    require 'sys/bus.ph';
    eval 'sub DEVINFO_ROOT_DEVICE () {(( &devinfo_handle_t)0);}' unless defined(&DEVINFO_ROOT_DEVICE);
}
1;

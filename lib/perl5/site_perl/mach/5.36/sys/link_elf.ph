require '_h2ph_pre.ph';

no warnings qw(redefine misc);

unless(defined(&_SYS_LINK_ELF_H_)) {
    eval 'sub _SYS_LINK_ELF_H_ () {1;}' unless defined(&_SYS_LINK_ELF_H_);
    require 'sys/elf.ph';
    eval 'sub LA_SER_ORIG () {0x1;}' unless defined(&LA_SER_ORIG);
    eval 'sub LA_SER_LIBPATH () {0x2;}' unless defined(&LA_SER_LIBPATH);
    eval 'sub LA_SER_RUNPATH () {0x4;}' unless defined(&LA_SER_RUNPATH);
    eval 'sub LA_SER_CONFIG () {0x8;}' unless defined(&LA_SER_CONFIG);
    eval 'sub LA_SER_DEFAULT () {0x40;}' unless defined(&LA_SER_DEFAULT);
    eval 'sub LA_SER_SECURE () {0x80;}' unless defined(&LA_SER_SECURE);
    eval("sub RT_CONSISTENT () { 0; }") unless defined(&RT_CONSISTENT);
    eval("sub RT_ADD () { 1; }") unless defined(&RT_ADD);
    eval("sub RT_DELETE () { 2; }") unless defined(&RT_DELETE);
    eval 'sub R_DEBUG_VERSION () {1;}' unless defined(&R_DEBUG_VERSION);
    if(defined(&__ARM_EABI__)) {
    }
}
1;

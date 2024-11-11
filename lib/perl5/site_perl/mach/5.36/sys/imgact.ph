require '_h2ph_pre.ph';

no warnings qw(redefine misc);

unless(defined(&_SYS_IMGACT_H_)) {
    eval 'sub _SYS_IMGACT_H_ () {1;}' unless defined(&_SYS_IMGACT_H_);
    require 'sys/_uio.ph';
    require 'vm/vm.ph';
    eval 'sub MAXSHELLCMDLEN () { &PAGE_SIZE;}' unless defined(&MAXSHELLCMDLEN);
    eval 'sub IMGACT_SHELL () {0x1;}' unless defined(&IMGACT_SHELL);
    eval 'sub IMGACT_BINMISC () {0x2;}' unless defined(&IMGACT_BINMISC);
    eval 'sub IMGP_ASLR_SHARED_PAGE () {0x1;}' unless defined(&IMGP_ASLR_SHARED_PAGE);
    if(defined(&_KERNEL)) {
    }
}
1;

require '_h2ph_pre.ph';

no warnings qw(redefine misc);

unless(defined(&_PROC_SERVICE_H_)) {
    eval 'sub _PROC_SERVICE_H_ () {1;}' unless defined(&_PROC_SERVICE_H_);
    require 'sys/types.ph';
    require 'sys/procfs.ph';
    eval("sub PS_OK () { 0; }") unless defined(&PS_OK);
    eval("sub PS_ERR () { 1; }") unless defined(&PS_ERR);
    eval("sub PS_BADADDR () { 2; }") unless defined(&PS_BADADDR);
    eval("sub PS_BADLID () { 3; }") unless defined(&PS_BADLID);
    eval("sub PS_BADPID () { 4; }") unless defined(&PS_BADPID);
    eval("sub PS_NOFREGS () { 5; }") unless defined(&PS_NOFREGS);
    eval("sub PS_NOSYM () { 6; }") unless defined(&PS_NOSYM);
    if(defined(&__i386__)) {
    }
}
1;

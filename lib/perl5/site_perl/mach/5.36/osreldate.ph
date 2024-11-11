require '_h2ph_pre.ph';

no warnings qw(redefine misc);

if(defined(&_KERNEL)) {
    die("<osreldate.h> cannot be used in the kernel, use <sys/param.h>");
} else {
    undef(&__FreeBSD_version) if defined(&__FreeBSD_version);
    eval 'sub __FreeBSD_version () {1401000;}' unless defined(&__FreeBSD_version);
}
1;

require '_h2ph_pre.ph';

no warnings qw(redefine misc);

unless(defined(&_LIBGEOM_H_)) {
    eval 'sub _LIBGEOM_H_ () {1;}' unless defined(&_LIBGEOM_H_);
    require 'sys/cdefs.ph';
    require 'sys/queue.ph';
    require 'sys/time.ph';
    require 'geom/geom_ctl.ph';
    unless(defined(&DEBUG_LIBGEOM)) {
	eval 'sub DEBUG_LIBGEOM () {0;}' unless defined(&DEBUG_LIBGEOM);
    }
    eval("sub ISCLASS () { 0; }") unless defined(&ISCLASS);
    eval("sub ISGEOM () { 1; }") unless defined(&ISGEOM);
    eval("sub ISPROVIDER () { 2; }") unless defined(&ISPROVIDER);
    eval("sub ISCONSUMER () { 3; }") unless defined(&ISCONSUMER);
    if(defined(&_STDIO_H_)) {
    }
}
1;

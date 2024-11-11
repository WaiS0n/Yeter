require '_h2ph_pre.ph';

no warnings qw(redefine misc);

unless(defined(&__LIBUFS_H__)) {
    eval 'sub __LIBUFS_H__ () {1;}' unless defined(&__LIBUFS_H__);
    eval 'sub d_fs () { ($d_sbunion->{d_fs});}' unless defined(&d_fs);
    eval 'sub d_sb () { ($d_sbunion->{d_sb});}' unless defined(&d_sb);
    eval 'sub d_cg () { ($d_cgunion->{d_cg});}' unless defined(&d_cg);
    if(defined(&_LIBUFS)) {
	if(defined(&_LIBUFS_DEBUGGING)) {
	}
    }
}
1;

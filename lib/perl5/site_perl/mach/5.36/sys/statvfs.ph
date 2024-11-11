require '_h2ph_pre.ph';

no warnings qw(redefine misc);

unless(defined(&_SYS_STATVFS_H_)) {
    eval 'sub _SYS_STATVFS_H_ () {1;}' unless defined(&_SYS_STATVFS_H_);
    require 'sys/cdefs.ph';
    require 'sys/_types.ph';
    unless(defined(&_FSBLKCNT_T_DECLARED)) {
	eval 'sub _FSBLKCNT_T_DECLARED () {1;}' unless defined(&_FSBLKCNT_T_DECLARED);
    }
    eval 'sub ST_RDONLY () {0x1;}' unless defined(&ST_RDONLY);
    eval 'sub ST_NOSUID () {0x2;}' unless defined(&ST_NOSUID);
}
1;

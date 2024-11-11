require '_h2ph_pre.ph';

no warnings qw(redefine misc);

unless(defined(&_SYS_SYSCALLSUBR_H_)) {
    eval 'sub _SYS_SYSCALLSUBR_H_ () {1;}' unless defined(&_SYS_SYSCALLSUBR_H_);
    require 'sys/signal.ph';
    require 'sys/socket.ph';
    require 'sys/mac.ph';
    require 'sys/mount.ph';
    require 'sys/_cpuset.ph';
    require 'sys/_domainset.ph';
    require 'sys/_uio.ph';
    eval 'sub KSA_OSIGSET () {0x1;}' unless defined(&KSA_OSIGSET);
    eval 'sub KSA_FREEBSD4 () {0x2;}' unless defined(&KSA_FREEBSD4);
}
1;

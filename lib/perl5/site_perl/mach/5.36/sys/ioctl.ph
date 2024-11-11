require '_h2ph_pre.ph';

no warnings qw(redefine misc);

unless(defined(&_SYS_IOCTL_H_)) {
    eval 'sub _SYS_IOCTL_H_ () {1;}' unless defined(&_SYS_IOCTL_H_);
    if(defined(&_KERNEL)) {
	die("Don't #include ioctl.h in the kernel.  Include xxxio.h instead.");
    }
    require 'sys/ioccom.ph';
    require 'sys/filio.ph';
    require 'sys/sockio.ph';
    require 'sys/ttycom.ph';
}
1;

require '_h2ph_pre.ph';

no warnings qw(redefine misc);

unless(defined(&_SYS_IOCCOM_H_)) {
    eval 'sub _SYS_IOCCOM_H_ () {1;}' unless defined(&_SYS_IOCCOM_H_);
    eval 'sub IOCPARM_SHIFT () {13;}' unless defined(&IOCPARM_SHIFT);
    eval 'sub IOCPARM_MASK () {((1<<  &IOCPARM_SHIFT) - 1);}' unless defined(&IOCPARM_MASK);
    eval 'sub IOCPARM_LEN {
        my($x) = @_;
	    eval q(((($x) >> 16) &  &IOCPARM_MASK));
    }' unless defined(&IOCPARM_LEN);
    eval 'sub IOCBASECMD {
        my($x) = @_;
	    eval q((($x) & ~( &IOCPARM_MASK << 16)));
    }' unless defined(&IOCBASECMD);
    eval 'sub IOCGROUP {
        my($x) = @_;
	    eval q(((($x) >> 8) & 0xff));
    }' unless defined(&IOCGROUP);
    eval 'sub IOCPARM_MAX () {(1<<  &IOCPARM_SHIFT);}' unless defined(&IOCPARM_MAX);
    eval 'sub IOC_VOID () {0x20000000;}' unless defined(&IOC_VOID);
    eval 'sub IOC_OUT () {0x40000000;}' unless defined(&IOC_OUT);
    eval 'sub IOC_IN () {0x80000000;}' unless defined(&IOC_IN);
    eval 'sub IOC_INOUT () {( &IOC_IN| &IOC_OUT);}' unless defined(&IOC_INOUT);
    eval 'sub IOC_DIRMASK () {( &IOC_VOID| &IOC_OUT| &IOC_IN);}' unless defined(&IOC_DIRMASK);
    eval 'sub _IOC {
        my($inout,$group,$num,$len) = @_;
	    eval q(( (($inout) | ((($len) &  &IOCPARM_MASK) << 16) | (($group) << 8) | ($num))));
    }' unless defined(&_IOC);
    eval 'sub _IO {
        my($g,$n) = @_;
	    eval q( &_IOC( &IOC_VOID, ($g), ($n), 0));
    }' unless defined(&_IO);
    eval 'sub _IOWINT {
        my($g,$n) = @_;
	    eval q( &_IOC( &IOC_VOID, ($g), ($n), $sizeof{\'int\'}));
    }' unless defined(&_IOWINT);
    eval 'sub _IOR {
        my($g,$n,$t) = @_;
	    eval q( &_IOC( &IOC_OUT, ($g), ($n), $sizeof{$t}));
    }' unless defined(&_IOR);
    eval 'sub _IOW {
        my($g,$n,$t) = @_;
	    eval q( &_IOC( &IOC_IN, ($g), ($n), $sizeof{$t}));
    }' unless defined(&_IOW);
    eval 'sub _IOWR {
        my($g,$n,$t) = @_;
	    eval q( &_IOC( &IOC_INOUT, ($g), ($n), $sizeof{$t}));
    }' unless defined(&_IOWR);
    eval 'sub _IOC_NEWLEN {
        my($ioc, $len) = @_;
	    eval q((((~( &IOCPARM_MASK << 16)) & ($ioc)) | ((($len) &  &IOCPARM_MASK) << 16)));
    }' unless defined(&_IOC_NEWLEN);
    eval 'sub _IOC_NEWTYPE {
        my($ioc, $type) = @_;
	    eval q( &_IOC_NEWLEN(($ioc), $sizeof{$type}));
    }' unless defined(&_IOC_NEWTYPE);
    if(defined(&_KERNEL)) {
	if(defined(&COMPAT_FREEBSD6) || defined(&COMPAT_FREEBSD5) || defined(&COMPAT_FREEBSD4) || defined(&COMPAT_43)) {
	    eval 'sub IOCPARM_IVAL {
	        my($x) = @_;
    		eval q((( &intptr_t)*( &void *)($x)));
	    }' unless defined(&IOCPARM_IVAL);
	}
	eval 'sub _IOC_INVALID () {( &_IOC_VOID| &_IOC_INOUT);}' unless defined(&_IOC_INVALID);
    }
 elsif(!defined(&_STANDALONE)) {
	require 'sys/cdefs.ph';
    }
}
1;

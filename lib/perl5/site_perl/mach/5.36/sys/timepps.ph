require '_h2ph_pre.ph';

no warnings qw(redefine misc);

unless(defined(&_SYS_TIMEPPS_H_)) {
    eval 'sub _SYS_TIMEPPS_H_ () {1;}' unless defined(&_SYS_TIMEPPS_H_);
    require 'sys/_ffcounter.ph';
    require 'sys/ioccom.ph';
    require 'sys/time.ph';
    eval 'sub PPS_API_VERS_1 () {1;}' unless defined(&PPS_API_VERS_1);
    eval 'sub assert_timestamp () { ($assert_tu->{tspec});}' unless defined(&assert_timestamp);
    eval 'sub clear_timestamp () { ($clear_tu->{tspec});}' unless defined(&clear_timestamp);
    eval 'sub assert_timestamp_ntpfp () { ($assert_tu->{ntpfp});}' unless defined(&assert_timestamp_ntpfp);
    eval 'sub clear_timestamp_ntpfp () { ($clear_tu->{ntpfp});}' unless defined(&clear_timestamp_ntpfp);
    eval 'sub assert_offset () { ($assert_off_tu->{tspec});}' unless defined(&assert_offset);
    eval 'sub clear_offset () { ($clear_off_tu->{tspec});}' unless defined(&clear_offset);
    eval 'sub assert_offset_ntpfp () { ($assert_off_tu->{ntpfp});}' unless defined(&assert_offset_ntpfp);
    eval 'sub clear_offset_ntpfp () { ($clear_off_tu->{ntpfp});}' unless defined(&clear_offset_ntpfp);
    eval 'sub PPS_CAPTUREASSERT () {0x1;}' unless defined(&PPS_CAPTUREASSERT);
    eval 'sub PPS_CAPTURECLEAR () {0x2;}' unless defined(&PPS_CAPTURECLEAR);
    eval 'sub PPS_CAPTUREBOTH () {0x3;}' unless defined(&PPS_CAPTUREBOTH);
    eval 'sub PPS_OFFSETASSERT () {0x10;}' unless defined(&PPS_OFFSETASSERT);
    eval 'sub PPS_OFFSETCLEAR () {0x20;}' unless defined(&PPS_OFFSETCLEAR);
    eval 'sub PPS_ECHOASSERT () {0x40;}' unless defined(&PPS_ECHOASSERT);
    eval 'sub PPS_ECHOCLEAR () {0x80;}' unless defined(&PPS_ECHOCLEAR);
    eval 'sub PPS_CANWAIT () {0x100;}' unless defined(&PPS_CANWAIT);
    eval 'sub PPS_CANPOLL () {0x200;}' unless defined(&PPS_CANPOLL);
    eval 'sub PPS_TSFMT_TSPEC () {0x1000;}' unless defined(&PPS_TSFMT_TSPEC);
    eval 'sub PPS_TSFMT_NTPFP () {0x2000;}' unless defined(&PPS_TSFMT_NTPFP);
    eval 'sub PPS_TSCLK_FBCK () {0x10000;}' unless defined(&PPS_TSCLK_FBCK);
    eval 'sub PPS_TSCLK_FFWD () {0x20000;}' unless defined(&PPS_TSCLK_FFWD);
    eval 'sub PPS_TSCLK_MASK () {0x30000;}' unless defined(&PPS_TSCLK_MASK);
    eval 'sub PPS_KC_HARDPPS () {0;}' unless defined(&PPS_KC_HARDPPS);
    eval 'sub PPS_KC_HARDPPS_PLL () {1;}' unless defined(&PPS_KC_HARDPPS_PLL);
    eval 'sub PPS_KC_HARDPPS_FLL () {2;}' unless defined(&PPS_KC_HARDPPS_FLL);
    eval 'sub PPS_IOC_CREATE () { &_IO(ord(\'1\'), 1);}' unless defined(&PPS_IOC_CREATE);
    eval 'sub PPS_IOC_DESTROY () { &_IO(ord(\'1\'), 2);}' unless defined(&PPS_IOC_DESTROY);
    eval 'sub PPS_IOC_SETPARAMS () { &_IOW(ord(\'1\'), 3,  &pps_params_t);}' unless defined(&PPS_IOC_SETPARAMS);
    eval 'sub PPS_IOC_GETPARAMS () { &_IOR(ord(\'1\'), 4,  &pps_params_t);}' unless defined(&PPS_IOC_GETPARAMS);
    eval 'sub PPS_IOC_GETCAP () { &_IOR(ord(\'1\'), 5, \'int\');}' unless defined(&PPS_IOC_GETCAP);
    eval 'sub PPS_IOC_FETCH () { &_IOWR(ord(\'1\'), 6, \'struct pps_fetch_args\');}' unless defined(&PPS_IOC_FETCH);
    eval 'sub PPS_IOC_KCBIND () { &_IOW(ord(\'1\'), 7, \'struct pps_kcbind_args\');}' unless defined(&PPS_IOC_KCBIND);
    eval 'sub PPS_IOC_FETCH_FFCOUNTER () { &_IOWR(ord(\'1\'), 8, \'struct pps_fetch_ffc_args\');}' unless defined(&PPS_IOC_FETCH_FFCOUNTER);
    if(defined(&_KERNEL)) {
	eval 'sub KCMODE_EDGEMASK () {0x3;}' unless defined(&KCMODE_EDGEMASK);
	eval 'sub KCMODE_ABIFLAG () {0x80000000;}' unless defined(&KCMODE_ABIFLAG);
	eval 'sub PPS_ABI_VERSION () {1;}' unless defined(&PPS_ABI_VERSION);
	eval 'sub PPSFLAG_MTX_SPIN () {0x1;}' unless defined(&PPSFLAG_MTX_SPIN);
    } else {
	eval 'sub time_pps_create {
	    my($filedes,$handle) = @_;
    	    eval q({ \'int\'  &error; *$handle = -1;  &error =  &ioctl($filedes,  &PPS_IOC_CREATE, 0);  &if ( &error < 0) (-1); *$handle = $filedes; (0); });
	}' unless defined(&time_pps_create);
	eval 'sub time_pps_destroy {
	    my($handle) = @_;
    	    eval q({ ( &ioctl($handle,  &PPS_IOC_DESTROY, 0)); });
	}' unless defined(&time_pps_destroy);
	eval 'sub time_pps_setparams {
	    my($handle,$ppsparams) = @_;
    	    eval q({ ( &ioctl($handle,  &PPS_IOC_SETPARAMS, $ppsparams)); });
	}' unless defined(&time_pps_setparams);
	eval 'sub time_pps_getparams {
	    my($handle,$ppsparams) = @_;
    	    eval q({ ( &ioctl($handle,  &PPS_IOC_GETPARAMS, $ppsparams)); });
	}' unless defined(&time_pps_getparams);
	eval 'sub time_pps_getcap {
	    my($handle,$mode) = @_;
    	    eval q({ ( &ioctl($handle,  &PPS_IOC_GETCAP, $mode)); });
	}' unless defined(&time_pps_getcap);
	eval 'sub time_pps_fetch {
	    my($handle,$tsformat,$ppsinfobuf,$timeout) = @_;
    	    eval q({ \'int\'  &error; \'struct pps_fetch_args\'  &arg;  ($arg->{tsformat}) = $tsformat;  &if ($timeout ==  &NULL) {  ($arg->{timeout}->{tv_sec}) = -1;  ($arg->{timeout}->{tv_nsec}) = -1; }  &else  ($arg->{timeout}) = *$timeout;  &error =  &ioctl($handle,  &PPS_IOC_FETCH,  &arg); *$ppsinfobuf =  ($arg->{pps_info_buf}); ( &error); });
	}' unless defined(&time_pps_fetch);
	eval 'sub time_pps_fetch_ffc {
	    my($handle,$tsformat,$ppsinfobuf,$timeout) = @_;
    	    eval q({ \'struct pps_fetch_ffc_args\'  &arg; \'int\'  &error;  ($arg->{tsformat}) = $tsformat;  &if ($timeout ==  &NULL) {  ($arg->{timeout}->{tv_sec}) = -1;  ($arg->{timeout}->{tv_nsec}) = -1; }  &else {  ($arg->{timeout}) = *$timeout; }  &error =  &ioctl($handle,  &PPS_IOC_FETCH_FFCOUNTER,  &arg); *$ppsinfobuf =  ($arg->{pps_info_buf_ffc}); ( &error); });
	}' unless defined(&time_pps_fetch_ffc);
	eval 'sub time_pps_kcbind {
	    my($handle,$kernel_consumer,$edge,$tsformat) = @_;
    	    eval q({ \'struct pps_kcbind_args\'  &arg;  ($arg->{kernel_consumer}) = $kernel_consumer;  ($arg->{edge}) = $edge;  ($arg->{tsformat}) = $tsformat; ( &ioctl($handle,  &PPS_IOC_KCBIND,  &arg)); });
	}' unless defined(&time_pps_kcbind);
    }
}
1;

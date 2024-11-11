require '_h2ph_pre.ph';

no warnings qw(redefine misc);

unless(defined(&_SYS_SNDSTAT_H_)) {
    eval 'sub _SYS_SNDSTAT_H_ () {1;}' unless defined(&_SYS_SNDSTAT_H_);
    require 'sys/types.ph';
    unless(defined(&_IOWR)) {
	require 'sys/ioccom.ph';
    }
    eval 'sub SNDST_DSPS () {"dsps";}' unless defined(&SNDST_DSPS);
    eval 'sub SNDST_DSPS_FROM_USER () {"from_user";}' unless defined(&SNDST_DSPS_FROM_USER);
    eval 'sub SNDST_DSPS_PCHAN () {"pchan";}' unless defined(&SNDST_DSPS_PCHAN);
    eval 'sub SNDST_DSPS_RCHAN () {"rchan";}' unless defined(&SNDST_DSPS_RCHAN);
    eval 'sub SNDST_DSPS_NAMEUNIT () {"nameunit";}' unless defined(&SNDST_DSPS_NAMEUNIT);
    eval 'sub SNDST_DSPS_DEVNODE () {"devnode";}' unless defined(&SNDST_DSPS_DEVNODE);
    eval 'sub SNDST_DSPS_DESC () {"desc";}' unless defined(&SNDST_DSPS_DESC);
    eval 'sub SNDST_DSPS_PROVIDER () {"provider";}' unless defined(&SNDST_DSPS_PROVIDER);
    eval 'sub SNDST_DSPS_PROVIDER_INFO () {"provider_info";}' unless defined(&SNDST_DSPS_PROVIDER_INFO);
    eval 'sub SNDST_DSPS_INFO_PLAY () {"info_play";}' unless defined(&SNDST_DSPS_INFO_PLAY);
    eval 'sub SNDST_DSPS_INFO_REC () {"info_rec";}' unless defined(&SNDST_DSPS_INFO_REC);
    eval 'sub SNDST_DSPS_INFO_MIN_RATE () {"min_rate";}' unless defined(&SNDST_DSPS_INFO_MIN_RATE);
    eval 'sub SNDST_DSPS_INFO_MAX_RATE () {"max_rate";}' unless defined(&SNDST_DSPS_INFO_MAX_RATE);
    eval 'sub SNDST_DSPS_INFO_FORMATS () {"formats";}' unless defined(&SNDST_DSPS_INFO_FORMATS);
    eval 'sub SNDST_DSPS_INFO_MIN_CHN () {"min_chn";}' unless defined(&SNDST_DSPS_INFO_MIN_CHN);
    eval 'sub SNDST_DSPS_INFO_MAX_CHN () {"max_chn";}' unless defined(&SNDST_DSPS_INFO_MAX_CHN);
    eval 'sub SNDST_DSPS_SOUND4_PROVIDER () {"sound(4)";}' unless defined(&SNDST_DSPS_SOUND4_PROVIDER);
    eval 'sub SNDST_DSPS_SOUND4_UNIT () {"unit";}' unless defined(&SNDST_DSPS_SOUND4_UNIT);
    eval 'sub SNDST_DSPS_SOUND4_BITPERFECT () {"bitperfect";}' unless defined(&SNDST_DSPS_SOUND4_BITPERFECT);
    eval 'sub SNDST_DSPS_SOUND4_PVCHAN () {"pvchan";}' unless defined(&SNDST_DSPS_SOUND4_PVCHAN);
    eval 'sub SNDST_DSPS_SOUND4_RVCHAN () {"rvchan";}' unless defined(&SNDST_DSPS_SOUND4_RVCHAN);
    eval 'sub SNDST_UNVLBUF_MAX () {65536;}' unless defined(&SNDST_UNVLBUF_MAX);
    eval 'sub SNDSTIOC_REFRESH_DEVS () { &_IO(ord(\'D\'), 100);}' unless defined(&SNDSTIOC_REFRESH_DEVS);
    eval 'sub SNDSTIOC_GET_DEVS () { &_IOWR(ord(\'D\'), 101, \'struct sndstioc_nv_arg\');}' unless defined(&SNDSTIOC_GET_DEVS);
    eval 'sub SNDSTIOC_ADD_USER_DEVS () { &_IOWR(ord(\'D\'), 102, \'struct sndstioc_nv_arg\');}' unless defined(&SNDSTIOC_ADD_USER_DEVS);
    eval 'sub SNDSTIOC_FLUSH_USER_DEVS () { &_IO(ord(\'D\'), 103);}' unless defined(&SNDSTIOC_FLUSH_USER_DEVS);
    if(defined(&_KERNEL)) {
	if(defined(&COMPAT_FREEBSD32)) {
	    eval 'sub SNDSTIOC_GET_DEVS32 () { &_IOC_NEWTYPE( &SNDSTIOC_GET_DEVS, \'struct sndstioc_nv_arg32\');}' unless defined(&SNDSTIOC_GET_DEVS32);
	    eval 'sub SNDSTIOC_ADD_USER_DEVS32 () { &_IOC_NEWTYPE( &SNDSTIOC_ADD_USER_DEVS, \'struct sndstioc_nv_arg32\');}' unless defined(&SNDSTIOC_ADD_USER_DEVS32);
	}
    }
}
1;

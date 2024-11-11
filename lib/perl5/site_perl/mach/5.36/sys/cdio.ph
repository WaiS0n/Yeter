require '_h2ph_pre.ph';

no warnings qw(redefine misc);

unless(defined(&_SYS_CDIO_H_)) {
    eval 'sub _SYS_CDIO_H_ () {1;}' unless defined(&_SYS_CDIO_H_);
    unless(defined(&_KERNEL)) {
	require 'sys/types.ph';
    }
    require 'sys/ioccom.ph';
    if((defined(&BYTE_ORDER) ? &BYTE_ORDER : undef) == (defined(&LITTLE_ENDIAN) ? &LITTLE_ENDIAN : undef)) {
    } else {
    }
    eval 'sub CD_AS_AUDIO_INVALID () {0x;}' unless defined(&CD_AS_AUDIO_INVALID);
    eval 'sub CD_AS_PLAY_IN_PROGRESS () {0x11;}' unless defined(&CD_AS_PLAY_IN_PROGRESS);
    eval 'sub CD_AS_PLAY_PAUSED () {0x12;}' unless defined(&CD_AS_PLAY_PAUSED);
    eval 'sub CD_AS_PLAY_COMPLETED () {0x13;}' unless defined(&CD_AS_PLAY_COMPLETED);
    eval 'sub CD_AS_PLAY_ERROR () {0x14;}' unless defined(&CD_AS_PLAY_ERROR);
    eval 'sub CD_AS_NO_STATUS () {0x15;}' unless defined(&CD_AS_NO_STATUS);
    eval 'sub CDIOCPLAYTRACKS () { &_IOW(ord(\'c\'),1,\'struct ioc_play_track\');}' unless defined(&CDIOCPLAYTRACKS);
    eval 'sub CDIOCPLAYBLOCKS () { &_IOW(ord(\'c\'),2,\'struct ioc_play_blocks\');}' unless defined(&CDIOCPLAYBLOCKS);
    eval 'sub CD_LBA_FORMAT () {1;}' unless defined(&CD_LBA_FORMAT);
    eval 'sub CD_MSF_FORMAT () {2;}' unless defined(&CD_MSF_FORMAT);
    eval 'sub CD_SUBQ_DATA () {0;}' unless defined(&CD_SUBQ_DATA);
    eval 'sub CD_CURRENT_POSITION () {1;}' unless defined(&CD_CURRENT_POSITION);
    eval 'sub CD_MEDIA_CATALOG () {2;}' unless defined(&CD_MEDIA_CATALOG);
    eval 'sub CD_TRACK_INFO () {3;}' unless defined(&CD_TRACK_INFO);
    eval 'sub CDIOCREADSUBCHANNEL () { &_IOWR(ord(\'c\'), 3, \'struct ioc_read_subchannel\' );}' unless defined(&CDIOCREADSUBCHANNEL);
    eval 'sub CDIOREADTOCHEADER () { &_IOR(ord(\'c\'),4,\'struct ioc_toc_header\');}' unless defined(&CDIOREADTOCHEADER);
    eval 'sub CDIOREADTOCENTRYS () { &_IOWR(ord(\'c\'),5,\'struct ioc_read_toc_entry\');}' unless defined(&CDIOREADTOCENTRYS);
    eval 'sub CDIOREADTOCENTRY () { &_IOWR(ord(\'c\'),6,\'struct ioc_read_toc_single_entry\');}' unless defined(&CDIOREADTOCENTRY);
    eval 'sub CDIOCSETPATCH () { &_IOW(ord(\'c\'),9,\'struct ioc_patch\');}' unless defined(&CDIOCSETPATCH);
    eval 'sub CDIOCGETVOL () { &_IOR(ord(\'c\'),10,\'struct ioc_vol\');}' unless defined(&CDIOCGETVOL);
    eval 'sub CDIOCSETVOL () { &_IOW(ord(\'c\'),11,\'struct ioc_vol\');}' unless defined(&CDIOCSETVOL);
    eval 'sub CDIOCSETMONO () { &_IO(ord(\'c\'),12);}' unless defined(&CDIOCSETMONO);
    eval 'sub CDIOCSETSTERIO () { &_IO(ord(\'c\'),13);}' unless defined(&CDIOCSETSTERIO);
    eval 'sub CDIOCSETSTEREO () { &_IO(ord(\'c\'),13);}' unless defined(&CDIOCSETSTEREO);
    eval 'sub CDIOCSETMUTE () { &_IO(ord(\'c\'),14);}' unless defined(&CDIOCSETMUTE);
    eval 'sub CDIOCSETLEFT () { &_IO(ord(\'c\'),15);}' unless defined(&CDIOCSETLEFT);
    eval 'sub CDIOCSETRIGHT () { &_IO(ord(\'c\'),16);}' unless defined(&CDIOCSETRIGHT);
    eval 'sub CDIOCSETDEBUG () { &_IO(ord(\'c\'),17);}' unless defined(&CDIOCSETDEBUG);
    eval 'sub CDIOCCLRDEBUG () { &_IO(ord(\'c\'),18);}' unless defined(&CDIOCCLRDEBUG);
    eval 'sub CDIOCPAUSE () { &_IO(ord(\'c\'),19);}' unless defined(&CDIOCPAUSE);
    eval 'sub CDIOCRESUME () { &_IO(ord(\'c\'),20);}' unless defined(&CDIOCRESUME);
    eval 'sub CDIOCRESET () { &_IO(ord(\'c\'),21);}' unless defined(&CDIOCRESET);
    eval 'sub CDIOCSTART () { &_IO(ord(\'c\'),22);}' unless defined(&CDIOCSTART);
    eval 'sub CDIOCSTOP () { &_IO(ord(\'c\'),23);}' unless defined(&CDIOCSTOP);
    eval 'sub CDIOCEJECT () { &_IO(ord(\'c\'),24);}' unless defined(&CDIOCEJECT);
    eval 'sub CDIOCPLAYMSF () { &_IOW(ord(\'c\'),25,\'struct ioc_play_msf\');}' unless defined(&CDIOCPLAYMSF);
    eval 'sub CDIOCALLOW () { &_IO(ord(\'c\'),26);}' unless defined(&CDIOCALLOW);
    eval 'sub CDIOCPREVENT () { &_IO(ord(\'c\'),27);}' unless defined(&CDIOCPREVENT);
    eval 'sub CDIOCCLOSE () { &_IO(ord(\'c\'),28);}' unless defined(&CDIOCCLOSE);
    eval 'sub CDIOCPITCH () { &_IOW(ord(\'c\'),29,\'struct ioc_pitch\');}' unless defined(&CDIOCPITCH);
    eval 'sub CDDOPLAYTRK () {0x1;}' unless defined(&CDDOPLAYTRK);
    eval 'sub CDDOPLAYMSF () {0x2;}' unless defined(&CDDOPLAYMSF);
    eval 'sub CDDOPLAYBLOCKS () {0x4;}' unless defined(&CDDOPLAYBLOCKS);
    eval 'sub CDDOPAUSE () {0x100;}' unless defined(&CDDOPAUSE);
    eval 'sub CDDORESUME () {0x200;}' unless defined(&CDDORESUME);
    eval 'sub CDDORESET () {0x400;}' unless defined(&CDDORESET);
    eval 'sub CDDOSTART () {0x800;}' unless defined(&CDDOSTART);
    eval 'sub CDDOSTOP () {0x1000;}' unless defined(&CDDOSTOP);
    eval 'sub CDDOPITCH () {0x2000;}' unless defined(&CDDOPITCH);
    eval 'sub CDREADVOLUME () {0x1;}' unless defined(&CDREADVOLUME);
    eval 'sub CDSETVOLUME () {0x2;}' unless defined(&CDSETVOLUME);
    eval 'sub CDSETMONO () {0x100;}' unless defined(&CDSETMONO);
    eval 'sub CDSETSTEREO () {0x200;}' unless defined(&CDSETSTEREO);
    eval 'sub CDSETLEFT () {0x400;}' unless defined(&CDSETLEFT);
    eval 'sub CDSETRIGHT () {0x800;}' unless defined(&CDSETRIGHT);
    eval 'sub CDSETMUTE () {0x1000;}' unless defined(&CDSETMUTE);
    eval 'sub CDSETPATCH () {0x8000;}' unless defined(&CDSETPATCH);
    eval 'sub CDDOEJECT () {0x1;}' unless defined(&CDDOEJECT);
    eval 'sub CDDOCLOSE () {0x2;}' unless defined(&CDDOCLOSE);
    eval 'sub CDDOLOCK () {0x4;}' unless defined(&CDDOLOCK);
    eval 'sub CDREADHEADER () {0x100;}' unless defined(&CDREADHEADER);
    eval 'sub CDREADENTRIES () {0x200;}' unless defined(&CDREADENTRIES);
    eval 'sub CDREADSUBQ () {0x200;}' unless defined(&CDREADSUBQ);
    eval 'sub CDREADRW () {0x400;}' unless defined(&CDREADRW);
    eval 'sub CDHASDEBUG () {0x4000;}' unless defined(&CDHASDEBUG);
    eval 'sub CDIOCCAPABILITY () { &_IOR(ord(\'c\'),30,\'struct ioc_capability\');}' unless defined(&CDIOCCAPABILITY);
}
1;

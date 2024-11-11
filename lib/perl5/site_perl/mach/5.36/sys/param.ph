require '_h2ph_pre.ph';

no warnings qw(redefine misc);

unless(defined(&_SYS_PARAM_H_)) {
    eval 'sub _SYS_PARAM_H_ () {1;}' unless defined(&_SYS_PARAM_H_);
    require 'sys/_null.ph';
    eval 'sub BSD () {199506;}' unless defined(&BSD);
    eval 'sub BSD4_3 () {1;}' unless defined(&BSD4_3);
    eval 'sub BSD4_4 () {1;}' unless defined(&BSD4_4);
    undef(&__FreeBSD_version) if defined(&__FreeBSD_version);
    eval 'sub __FreeBSD_version () {1401000;}' unless defined(&__FreeBSD_version);
    undef(&__FreeBSD_kernel__) if defined(&__FreeBSD_kernel__);
    eval 'sub __FreeBSD_kernel__ () {1;}' unless defined(&__FreeBSD_kernel__);
    if(defined(&_KERNEL) || defined(&_WANT_P_OSREL)) {
	eval 'sub P_OSREL_SIGWAIT () {700000;}' unless defined(&P_OSREL_SIGWAIT);
	eval 'sub P_OSREL_SIGSEGV () {700004;}' unless defined(&P_OSREL_SIGSEGV);
	eval 'sub P_OSREL_MAP_ANON () {800104;}' unless defined(&P_OSREL_MAP_ANON);
	eval 'sub P_OSREL_MAP_FSTRICT () {1100036;}' unless defined(&P_OSREL_MAP_FSTRICT);
	eval 'sub P_OSREL_SHUTDOWN_ENOTCONN () {1100077;}' unless defined(&P_OSREL_SHUTDOWN_ENOTCONN);
	eval 'sub P_OSREL_MAP_GUARD () {1200035;}' unless defined(&P_OSREL_MAP_GUARD);
	eval 'sub P_OSREL_WRFSBASE () {1200041;}' unless defined(&P_OSREL_WRFSBASE);
	eval 'sub P_OSREL_CK_CYLGRP () {1200046;}' unless defined(&P_OSREL_CK_CYLGRP);
	eval 'sub P_OSREL_VMTOTAL64 () {1200054;}' unless defined(&P_OSREL_VMTOTAL64);
	eval 'sub P_OSREL_CK_SUPERBLOCK () {1300000;}' unless defined(&P_OSREL_CK_SUPERBLOCK);
	eval 'sub P_OSREL_CK_INODE () {1300005;}' unless defined(&P_OSREL_CK_INODE);
	eval 'sub P_OSREL_POWERPC_NEW_AUX_ARGS () {1300070;}' unless defined(&P_OSREL_POWERPC_NEW_AUX_ARGS);
	eval 'sub P_OSREL_TIDPID () {1400079;}' unless defined(&P_OSREL_TIDPID);
	eval 'sub P_OSREL_ARM64_SPSR () {1400084;}' unless defined(&P_OSREL_ARM64_SPSR);
	eval 'sub P_OSREL_MAJOR {
	    my($x) = @_;
    	    eval q((($x) / 100000));
	}' unless defined(&P_OSREL_MAJOR);
    }
    unless(defined(&LOCORE)) {
	require 'sys/types.ph';
    }
    require 'sys/syslimits.ph';
    eval 'sub MAXCOMLEN () {19;}' unless defined(&MAXCOMLEN);
    eval 'sub MAXINTERP () { &PATH_MAX;}' unless defined(&MAXINTERP);
    eval 'sub MAXLOGNAME () {33;}' unless defined(&MAXLOGNAME);
    eval 'sub MAXUPRC () { &CHILD_MAX;}' unless defined(&MAXUPRC);
    eval 'sub NCARGS () { &ARG_MAX;}' unless defined(&NCARGS);
    eval 'sub NGROUPS () {( &NGROUPS_MAX+1);}' unless defined(&NGROUPS);
    eval 'sub NOFILE () { &OPEN_MAX;}' unless defined(&NOFILE);
    eval 'sub NOGROUP () {65535;}' unless defined(&NOGROUP);
    eval 'sub MAXHOSTNAMELEN () {256;}' unless defined(&MAXHOSTNAMELEN);
    eval 'sub SPECNAMELEN () {255;}' unless defined(&SPECNAMELEN);
    if(defined(&_KERNEL)) {
	require 'sys/cdefs.ph';
	require 'sys/errno.ph';
	unless(defined(&LOCORE)) {
	    require 'sys/time.ph';
	    require 'sys/priority.ph';
	}
	unless(defined(&FALSE)) {
	    eval 'sub FALSE () {0;}' unless defined(&FALSE);
	}
	unless(defined(&TRUE)) {
	    eval 'sub TRUE () {1;}' unless defined(&TRUE);
	}
    }
    unless(defined(&_KERNEL)) {
	unless(defined(&LOCORE)) {
	    require 'sys/signal.ph';
	}
    }
    require 'machine/param.ph';
    unless(defined(&_KERNEL)) {
	require 'sys/limits.ph';
    }
    unless(defined(&DEV_BSHIFT)) {
	eval 'sub DEV_BSHIFT () {9;}' unless defined(&DEV_BSHIFT);
    }
    eval 'sub DEV_BSIZE () {(1<< &DEV_BSHIFT);}' unless defined(&DEV_BSIZE);
    unless(defined(&BLKDEV_IOSIZE)) {
	eval 'sub BLKDEV_IOSIZE () { &PAGE_SIZE;}' unless defined(&BLKDEV_IOSIZE);
    }
    unless(defined(&DFLTPHYS)) {
	eval 'sub DFLTPHYS () {(64* 1024);}' unless defined(&DFLTPHYS);
    }
    unless(defined(&MAXPHYS)) {
	if(defined(&__ILP32__)) {
	    eval 'sub MAXPHYS () {(128* 1024);}' unless defined(&MAXPHYS);
	} else {
	    eval 'sub MAXPHYS () {(1024* 1024);}' unless defined(&MAXPHYS);
	}
    }
    unless(defined(&MAXDUMPPGS)) {
	eval 'sub MAXDUMPPGS () {( &DFLTPHYS/ &PAGE_SIZE);}' unless defined(&MAXDUMPPGS);
    }
    unless(defined(&MSIZE)) {
	eval 'sub MSIZE () {256;}' unless defined(&MSIZE);
    }
    unless(defined(&MCLSHIFT)) {
	eval 'sub MCLSHIFT () {11;}' unless defined(&MCLSHIFT);
    }
    eval 'sub MCLBYTES () {(1<<  &MCLSHIFT);}' unless defined(&MCLBYTES);
    if((defined(&PAGE_SIZE) ? &PAGE_SIZE : undef) <= 8192) {
	eval 'sub MJUMPAGESIZE () { &PAGE_SIZE;}' unless defined(&MJUMPAGESIZE);
    } else {
	eval 'sub MJUMPAGESIZE () {(8* 1024);}' unless defined(&MJUMPAGESIZE);
    }
    eval 'sub MJUM9BYTES () {(9* 1024);}' unless defined(&MJUM9BYTES);
    eval 'sub MJUM16BYTES () {(16* 1024);}' unless defined(&MJUM16BYTES);
    unless(defined(&ctob)) {
	eval 'sub ctob {
	    my($x) = @_;
    	    eval q((($x)<< &PAGE_SHIFT));
	}' unless defined(&ctob);
    }
    unless(defined(&btoc)) {
	eval 'sub btoc {
	    my($x) = @_;
    	    eval q(((( &vm_offset_t)($x)+ &PAGE_MASK)>> &PAGE_SHIFT));
	}' unless defined(&btoc);
    }
    unless(defined(&btodb)) {
	eval 'sub btodb {
	    my($bytes) = @_;
    	    eval q(($sizeof{$bytes} > $sizeof{\'long\'} ? ( &daddr_t)(($bytes) >>  &DEV_BSHIFT) : ( &daddr_t)(($bytes) >>  &DEV_BSHIFT)));
	}' unless defined(&btodb);
    }
    unless(defined(&dbtob)) {
	eval 'sub dbtob {
	    my($db) = @_;
    	    eval q((( &off_t)($db) <<  &DEV_BSHIFT));
	}' unless defined(&dbtob);
    }
    eval 'sub PRIMASK () {0xff;}' unless defined(&PRIMASK);
    eval 'sub PCATCH () {0x100;}' unless defined(&PCATCH);
    eval 'sub PDROP () {0x200;}' unless defined(&PDROP);
    eval 'sub PNOLOCK () {0x400;}' unless defined(&PNOLOCK);
    eval 'sub PRILASTFLAG () {0x400;}' unless defined(&PRILASTFLAG);
    eval 'sub NZERO () {0;}' unless defined(&NZERO);
    eval 'sub NBBY () {8;}' unless defined(&NBBY);
    eval 'sub NBPW () {$sizeof{\'int\'};}' unless defined(&NBPW);
    eval 'sub CMASK () {022;}' unless defined(&CMASK);
    eval 'sub NODEV () {( &dev_t)(-1);}' unless defined(&NODEV);
    eval 'sub MAXBSIZE () {65536;}' unless defined(&MAXBSIZE);
    unless(defined(&MAXBCACHEBUF)) {
	eval 'sub MAXBCACHEBUF () { &MAXBSIZE;}' unless defined(&MAXBCACHEBUF);
    }
    unless(defined(&BKVASIZE)) {
	eval 'sub BKVASIZE () {16384;}' unless defined(&BKVASIZE);
    }
    eval 'sub BKVAMASK () {( &BKVASIZE-1);}' unless defined(&BKVAMASK);
    eval 'sub MAXPATHLEN () { &PATH_MAX;}' unless defined(&MAXPATHLEN);
    eval 'sub MAXSYMLINKS () {32;}' unless defined(&MAXSYMLINKS);
    eval 'sub setbit {
        my($a,$i) = @_;
	    eval q(((($a))[($i)/ &NBBY] |= 1<<(($i)% &NBBY)));
    }' unless defined(&setbit);
    eval 'sub clrbit {
        my($a,$i) = @_;
	    eval q(((($a))[($i)/ &NBBY] &= ~(1<<(($i)% &NBBY))));
    }' unless defined(&clrbit);
    eval 'sub isset {
        my($a,$i) = @_;
	    eval q(((( &const \'unsigned char\' *)($a))[($i)/ &NBBY] & (1<<(($i)% &NBBY))));
    }' unless defined(&isset);
    eval 'sub isclr {
        my($a,$i) = @_;
	    eval q((((( &const \'unsigned char\' *)($a))[($i)/ &NBBY] & (1<<(($i)% &NBBY))) == 0));
    }' unless defined(&isclr);
    unless(defined(&howmany)) {
	eval 'sub howmany {
	    my($x, $y) = @_;
    	    eval q(((($x)+(($y)-1))/($y)));
	}' unless defined(&howmany);
    }
    eval 'sub nitems {
        my($x) = @_;
	    eval q(($sizeof{($x)} / $sizeof{($x)[0]}));
    }' unless defined(&nitems);
    eval 'sub rounddown {
        my($x, $y) = @_;
	    eval q(((($x)/($y))*($y)));
    }' unless defined(&rounddown);
    eval 'sub rounddown2 {
        my($x, $y) = @_;
	    eval q( &__align_down($x, $y));
    }' unless defined(&rounddown2);
    eval 'sub roundup {
        my($x, $y) = @_;
	    eval q((((($x)+(($y)-1))/($y))*($y)));
    }' unless defined(&roundup);
    eval 'sub roundup2 {
        my($x, $y) = @_;
	    eval q( &__align_up($x, $y));
    }' unless defined(&roundup2);
    eval 'sub powerof2 {
        my($x) = @_;
	    eval q((((($x)-1)($x))==0));
    }' unless defined(&powerof2);
    eval 'sub MIN {
        my($a,$b) = @_;
	    eval q(((($a)<($b))?($a):($b)));
    }' unless defined(&MIN);
    eval 'sub MAX {
        my($a,$b) = @_;
	    eval q(((($a)>($b))?($a):($b)));
    }' unless defined(&MAX);
    if(defined(&_KERNEL)) {
	unless(defined(&LOCORE)) {
	    unless(defined(&_BYTEORDER_PROTOTYPED)) {
		eval 'sub _BYTEORDER_PROTOTYPED () {1;}' unless defined(&_BYTEORDER_PROTOTYPED);
	    }
	}
	unless(defined(&_BYTEORDER_FUNC_DEFINED)) {
	    eval 'sub _BYTEORDER_FUNC_DEFINED () {1;}' unless defined(&_BYTEORDER_FUNC_DEFINED);
	    eval 'sub htonl {
	        my($x) = @_;
    		eval q( &__htonl($x));
	    }' unless defined(&htonl);
	    eval 'sub htons {
	        my($x) = @_;
    		eval q( &__htons($x));
	    }' unless defined(&htons);
	    eval 'sub ntohl {
	        my($x) = @_;
    		eval q( &__ntohl($x));
	    }' unless defined(&ntohl);
	    eval 'sub ntohs {
	        my($x) = @_;
    		eval q( &__ntohs($x));
	    }' unless defined(&ntohs);
	}
    }
    eval 'sub FSHIFT () {11;}' unless defined(&FSHIFT);
    eval 'sub FSCALE () {(1<< &FSHIFT);}' unless defined(&FSCALE);
    eval 'sub dbtoc {
        my($db) = @_;
	    eval q((($db + ( &ctodb(1) - 1)) >> ( &PAGE_SHIFT -  &DEV_BSHIFT)));
    }' unless defined(&dbtoc);
    eval 'sub ctodb {
        my($db) = @_;
	    eval q((($db) << ( &PAGE_SHIFT -  &DEV_BSHIFT)));
    }' unless defined(&ctodb);
    eval 'sub member2struct {
        my($s, $m, $x) = @_;
	    eval q((( &void *)(($x) -  &offsetof(\'struct s\', $m))));
    }' unless defined(&member2struct);
    eval 'sub __PAST_END {
        my($array, $offset) = @_;
	    eval q(((( &__typeof__(*($array)) *)($array))[$offset]));
    }' unless defined(&__PAST_END);
}
1;

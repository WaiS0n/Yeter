require '_h2ph_pre.ph';

no warnings qw(redefine misc);

unless(defined(&_SYS_KBIO_H_)) {
    eval 'sub _SYS_KBIO_H_ () {1;}' unless defined(&_SYS_KBIO_H_);
    unless(defined(&_KERNEL)) {
	require 'sys/types.ph';
    }
    require 'sys/ioccom.ph';
    eval 'sub K_RAW () {0;}' unless defined(&K_RAW);
    eval 'sub K_XLATE () {1;}' unless defined(&K_XLATE);
    eval 'sub K_CODE () {2;}' unless defined(&K_CODE);
    eval 'sub KDGKBMODE () { &_IOR(ord(\'K\'), 6, \'int\');}' unless defined(&KDGKBMODE);
    eval 'sub KDSKBMODE () { &_IOWINT(ord(\'K\'), 7);}' unless defined(&KDSKBMODE);
    eval 'sub KDMKTONE () { &_IOWINT(ord(\'K\'), 8);}' unless defined(&KDMKTONE);
    if(defined(&notdef)) {
	eval 'sub KDGETMODE () { &_IOR(ord(\'K\'), 9, \'int\');}' unless defined(&KDGETMODE);
	eval 'sub KDSETMODE () { &_IOWINT(ord(\'K\'), 10);}' unless defined(&KDSETMODE);
	eval 'sub KDSBORDER () { &_IOWINT(ord(\'K\'), 13);}' unless defined(&KDSBORDER);
    }
    eval 'sub CLKED () {1;}' unless defined(&CLKED);
    eval 'sub NLKED () {2;}' unless defined(&NLKED);
    eval 'sub SLKED () {4;}' unless defined(&SLKED);
    eval 'sub ALKED () {8;}' unless defined(&ALKED);
    eval 'sub LOCK_MASK () {( &CLKED |  &NLKED |  &SLKED |  &ALKED);}' unless defined(&LOCK_MASK);
    eval 'sub KDGKBSTATE () { &_IOR(ord(\'K\'), 19, \'int\');}' unless defined(&KDGKBSTATE);
    eval 'sub KDSKBSTATE () { &_IOWINT(ord(\'K\'), 20);}' unless defined(&KDSKBSTATE);
    eval 'sub KDENABIO () { &_IO(ord(\'K\'), 60);}' unless defined(&KDENABIO);
    eval 'sub KDDISABIO () { &_IO(ord(\'K\'), 61);}' unless defined(&KDDISABIO);
    eval 'sub KIOCSOUND () { &_IOWINT(ord(\'K\'), 63);}' unless defined(&KIOCSOUND);
    eval 'sub KB_OTHER () {0;}' unless defined(&KB_OTHER);
    eval 'sub KB_84 () {1;}' unless defined(&KB_84);
    eval 'sub KB_101 () {2;}' unless defined(&KB_101);
    eval 'sub KDGKBTYPE () { &_IOR(ord(\'K\'), 64, \'int\');}' unless defined(&KDGKBTYPE);
    eval 'sub LED_CAP () {1;}' unless defined(&LED_CAP);
    eval 'sub LED_NUM () {2;}' unless defined(&LED_NUM);
    eval 'sub LED_SCR () {4;}' unless defined(&LED_SCR);
    eval 'sub LED_MASK () {( &LED_CAP |  &LED_NUM |  &LED_SCR);}' unless defined(&LED_MASK);
    eval 'sub KDGETLED () { &_IOR(ord(\'K\'), 65, \'int\');}' unless defined(&KDGETLED);
    eval 'sub KDSETLED () { &_IOWINT(ord(\'K\'), 66);}' unless defined(&KDSETLED);
    eval 'sub KDSETRAD () { &_IOWINT(ord(\'K\'), 67);}' unless defined(&KDSETRAD);
    eval 'sub KBADDKBD () { &_IOW(ord(\'K\'), 68,  &keyboard_info_t);}' unless defined(&KBADDKBD);
    eval 'sub KBRELKBD () { &_IOW(ord(\'K\'), 69,  &keyboard_info_t);}' unless defined(&KBRELKBD);
    if(defined(&notdef)) {
	eval 'sub KDRASTER () { &_IOW(ord(\'K\'), 100,  &scr_size_t);}' unless defined(&KDRASTER);
    }
    eval 'sub KDGKBINFO () { &_IOR(ord(\'K\'), 101,  &keyboard_info_t);}' unless defined(&KDGKBINFO);
    eval 'sub KDSETREPEAT () { &_IOW(ord(\'K\'), 102,  &keyboard_repeat_t);}' unless defined(&KDSETREPEAT);
    eval 'sub KDGETREPEAT () { &_IOR(ord(\'K\'), 103,  &keyboard_repeat_t);}' unless defined(&KDGETREPEAT);
    eval 'sub NUM_KEYS () {256;}' unless defined(&NUM_KEYS);
    eval 'sub NUM_STATES () {8;}' unless defined(&NUM_STATES);
    eval 'sub ALTGR_OFFSET () {128;}' unless defined(&ALTGR_OFFSET);
    eval 'sub NUM_DEADKEYS () {15;}' unless defined(&NUM_DEADKEYS);
    eval 'sub NUM_ACCENTCHARS () {52;}' unless defined(&NUM_ACCENTCHARS);
    eval 'sub NUM_FKEYS () {96;}' unless defined(&NUM_FKEYS);
    eval 'sub MAXFK () {16;}' unless defined(&MAXFK);
    unless(defined(&_KEYMAP_DECLARED)) {
	eval 'sub _KEYMAP_DECLARED () {1;}' unless defined(&_KEYMAP_DECLARED);
	eval 'sub FLAG_LOCK_O () {0;}' unless defined(&FLAG_LOCK_O);
	eval 'sub FLAG_LOCK_C () {1;}' unless defined(&FLAG_LOCK_C);
	eval 'sub FLAG_LOCK_N () {2;}' unless defined(&FLAG_LOCK_N);
	if(defined(&COMPAT_FREEBSD13)) {
	}
    }
    eval 'sub NOP () {0x;}' unless defined(&NOP);
    eval 'sub LSH () {0x2;}' unless defined(&LSH);
    eval 'sub RSH () {0x3;}' unless defined(&RSH);
    eval 'sub CLK () {0x4;}' unless defined(&CLK);
    eval 'sub NLK () {0x5;}' unless defined(&NLK);
    eval 'sub SLK () {0x6;}' unless defined(&SLK);
    eval 'sub LALT () {0x7;}' unless defined(&LALT);
    eval 'sub BTAB () {0x8;}' unless defined(&BTAB);
    eval 'sub LCTR () {0x9;}' unless defined(&LCTR);
    eval 'sub NEXT () {0xa;}' unless defined(&NEXT);
    eval 'sub F_SCR () {0xb;}' unless defined(&F_SCR);
    eval 'sub L_SCR () {0x1a;}' unless defined(&L_SCR);
    eval 'sub F_FN () {0x1b;}' unless defined(&F_FN);
    eval 'sub L_FN () {0x7a;}' unless defined(&L_FN);
    eval 'sub RCTR () {0x80;}' unless defined(&RCTR);
    eval 'sub RALT () {0x81;}' unless defined(&RALT);
    eval 'sub ALK () {0x82;}' unless defined(&ALK);
    eval 'sub ASH () {0x83;}' unless defined(&ASH);
    eval 'sub META () {0x84;}' unless defined(&META);
    eval 'sub RBT () {0x85;}' unless defined(&RBT);
    eval 'sub DBG () {0x86;}' unless defined(&DBG);
    eval 'sub SUSP () {0x87;}' unless defined(&SUSP);
    eval 'sub SPSC () {0x88;}' unless defined(&SPSC);
    eval 'sub F_ACC () { &DGRA;}' unless defined(&F_ACC);
    eval 'sub DGRA () {0x89;}' unless defined(&DGRA);
    eval 'sub DACU () {0x8a;}' unless defined(&DACU);
    eval 'sub DCIR () {0x8b;}' unless defined(&DCIR);
    eval 'sub DTIL () {0x8c;}' unless defined(&DTIL);
    eval 'sub DMAC () {0x8d;}' unless defined(&DMAC);
    eval 'sub DBRE () {0x8e;}' unless defined(&DBRE);
    eval 'sub DDOT () {0x8f;}' unless defined(&DDOT);
    eval 'sub DUML () {0x90;}' unless defined(&DUML);
    eval 'sub DDIA () {0x90;}' unless defined(&DDIA);
    eval 'sub DSLA () {0x91;}' unless defined(&DSLA);
    eval 'sub DRIN () {0x92;}' unless defined(&DRIN);
    eval 'sub DCED () {0x93;}' unless defined(&DCED);
    eval 'sub DAPO () {0x94;}' unless defined(&DAPO);
    eval 'sub DDAC () {0x95;}' unless defined(&DDAC);
    eval 'sub DOGO () {0x96;}' unless defined(&DOGO);
    eval 'sub DCAR () {0x97;}' unless defined(&DCAR);
    eval 'sub L_ACC () { &DCAR;}' unless defined(&L_ACC);
    eval 'sub STBY () {0x98;}' unless defined(&STBY);
    eval 'sub PREV () {0x99;}' unless defined(&PREV);
    eval 'sub PNC () {0x9a;}' unless defined(&PNC);
    eval 'sub LSHA () {0x9b;}' unless defined(&LSHA);
    eval 'sub RSHA () {0x9c;}' unless defined(&RSHA);
    eval 'sub LCTRA () {0x9d;}' unless defined(&LCTRA);
    eval 'sub RCTRA () {0x9e;}' unless defined(&RCTRA);
    eval 'sub LALTA () {0x9f;}' unless defined(&LALTA);
    eval 'sub RALTA () {0xa0;}' unless defined(&RALTA);
    eval 'sub HALT () {0xa1;}' unless defined(&HALT);
    eval 'sub PDWN () {0xa2;}' unless defined(&PDWN);
    eval 'sub PASTE () {0xa3;}' unless defined(&PASTE);
    eval 'sub F {
        my($x) = @_;
	    eval q((($x)+ &F_FN-1));
    }' unless defined(&F);
    eval 'sub S {
        my($x) = @_;
	    eval q((($x)+ &F_SCR-1));
    }' unless defined(&S);
    eval 'sub ACC {
        my($x) = @_;
	    eval q((($x)+ &F_ACC));
    }' unless defined(&ACC);
    if(defined(&COMPAT_FREEBSD13)) {
    }
    eval 'sub GETFKEY () { &_IOWR(ord(\'k\'), 0,  &fkeyarg_t);}' unless defined(&GETFKEY);
    eval 'sub SETFKEY () { &_IOWR(ord(\'k\'), 1,  &fkeyarg_t);}' unless defined(&SETFKEY);
    if(defined(&notdef)) {
	eval 'sub GIO_SCRNMAP () { &_IOR(ord(\'k\'), 2,  &scrmap_t);}' unless defined(&GIO_SCRNMAP);
	eval 'sub PIO_SCRNMAP () { &_IOW(ord(\'k\'), 3,  &scrmap_t);}' unless defined(&PIO_SCRNMAP);
    }
    eval 'sub GIO_KEYMAP () { &_IO(ord(\'k\'), 6);}' unless defined(&GIO_KEYMAP);
    eval 'sub PIO_KEYMAP () { &_IO(ord(\'k\'), 7);}' unless defined(&PIO_KEYMAP);
    if(defined(&COMPAT_FREEBSD13)) {
	eval 'sub OGIO_KEYMAP () { &_IOR(ord(\'k\'), 6,  &okeymap_t);}' unless defined(&OGIO_KEYMAP);
	eval 'sub OPIO_KEYMAP () { &_IOW(ord(\'k\'), 7,  &okeymap_t);}' unless defined(&OPIO_KEYMAP);
    }
    eval 'sub GIO_DEADKEYMAP () { &_IO(ord(\'k\'), 8);}' unless defined(&GIO_DEADKEYMAP);
    eval 'sub PIO_DEADKEYMAP () { &_IO(ord(\'k\'), 9);}' unless defined(&PIO_DEADKEYMAP);
    if(defined(&COMPAT_FREEBSD13)) {
	eval 'sub OGIO_DEADKEYMAP () { &_IOR(ord(\'k\'), 8,  &oaccentmap_t);}' unless defined(&OGIO_DEADKEYMAP);
	eval 'sub OPIO_DEADKEYMAP () { &_IOW(ord(\'k\'), 9,  &oaccentmap_t);}' unless defined(&OPIO_DEADKEYMAP);
    }
    eval 'sub GIO_KEYMAPENT () { &_IOWR(ord(\'k\'), 10,  &keyarg_t);}' unless defined(&GIO_KEYMAPENT);
    eval 'sub PIO_KEYMAPENT () { &_IOW(ord(\'k\'), 11,  &keyarg_t);}' unless defined(&PIO_KEYMAPENT);
    eval 'sub NOKEY () {0x1000000;}' unless defined(&NOKEY);
    eval 'sub FKEY () {0x2000000;}' unless defined(&FKEY);
    eval 'sub MKEY () {0x4000000;}' unless defined(&MKEY);
    eval 'sub BKEY () {0x8000000;}' unless defined(&BKEY);
    eval 'sub SPCLKEY () {0x80000000;}' unless defined(&SPCLKEY);
    eval 'sub RELKEY () {0x40000000;}' unless defined(&RELKEY);
    eval 'sub ERRKEY () {0x20000000;}' unless defined(&ERRKEY);
    eval 'sub KEYCHAR {
        my($c) = @_;
	    eval q((($c) & 0xffffff));
    }' unless defined(&KEYCHAR);
    eval 'sub KEYFLAGS {
        my($c) = @_;
	    eval q((($c) & ~0xffffff));
    }' unless defined(&KEYFLAGS);
}
1;

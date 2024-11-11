require '_h2ph_pre.ph';

no warnings qw(redefine misc);

unless(defined(&_SYS__TERMIOS_H_)) {
    eval 'sub _SYS__TERMIOS_H_ () {1;}' unless defined(&_SYS__TERMIOS_H_);
    eval 'sub VEOF () {0;}' unless defined(&VEOF);
    eval 'sub VEOL () {1;}' unless defined(&VEOL);
    if((defined(&__BSD_VISIBLE) ? &__BSD_VISIBLE : undef)) {
	eval 'sub VEOL2 () {2;}' unless defined(&VEOL2);
    }
    eval 'sub VERASE () {3;}' unless defined(&VERASE);
    if((defined(&__BSD_VISIBLE) ? &__BSD_VISIBLE : undef)) {
	eval 'sub VWERASE () {4;}' unless defined(&VWERASE);
    }
    eval 'sub VKILL () {5;}' unless defined(&VKILL);
    if((defined(&__BSD_VISIBLE) ? &__BSD_VISIBLE : undef)) {
	eval 'sub VREPRINT () {6;}' unless defined(&VREPRINT);
	eval 'sub VERASE2 () {7;}' unless defined(&VERASE2);
    }
    eval 'sub VINTR () {8;}' unless defined(&VINTR);
    eval 'sub VQUIT () {9;}' unless defined(&VQUIT);
    eval 'sub VSUSP () {10;}' unless defined(&VSUSP);
    if((defined(&__BSD_VISIBLE) ? &__BSD_VISIBLE : undef)) {
	eval 'sub VDSUSP () {11;}' unless defined(&VDSUSP);
    }
    eval 'sub VSTART () {12;}' unless defined(&VSTART);
    eval 'sub VSTOP () {13;}' unless defined(&VSTOP);
    if((defined(&__BSD_VISIBLE) ? &__BSD_VISIBLE : undef)) {
	eval 'sub VLNEXT () {14;}' unless defined(&VLNEXT);
	eval 'sub VDISCARD () {15;}' unless defined(&VDISCARD);
    }
    eval 'sub VMIN () {16;}' unless defined(&VMIN);
    eval 'sub VTIME () {17;}' unless defined(&VTIME);
    if((defined(&__BSD_VISIBLE) ? &__BSD_VISIBLE : undef)) {
	eval 'sub VSTATUS () {18;}' unless defined(&VSTATUS);
    }
    eval 'sub NCCS () {20;}' unless defined(&NCCS);
    eval 'sub _POSIX_VDISABLE () {0xff;}' unless defined(&_POSIX_VDISABLE);
    eval 'sub IGNBRK () {0x1;}' unless defined(&IGNBRK);
    eval 'sub BRKINT () {0x2;}' unless defined(&BRKINT);
    eval 'sub IGNPAR () {0x4;}' unless defined(&IGNPAR);
    eval 'sub PARMRK () {0x8;}' unless defined(&PARMRK);
    eval 'sub INPCK () {0x10;}' unless defined(&INPCK);
    eval 'sub ISTRIP () {0x20;}' unless defined(&ISTRIP);
    eval 'sub INLCR () {0x40;}' unless defined(&INLCR);
    eval 'sub IGNCR () {0x80;}' unless defined(&IGNCR);
    eval 'sub ICRNL () {0x100;}' unless defined(&ICRNL);
    eval 'sub IXON () {0x200;}' unless defined(&IXON);
    eval 'sub IXOFF () {0x400;}' unless defined(&IXOFF);
    if((defined(&__XSI_VISIBLE) ? &__XSI_VISIBLE : undef) || (defined(&__POSIX_VISIBLE) ? &__POSIX_VISIBLE : undef) >= 200809) {
	eval 'sub IXANY () {0x800;}' unless defined(&IXANY);
    }
    if((defined(&__BSD_VISIBLE) ? &__BSD_VISIBLE : undef)) {
	eval 'sub IMAXBEL () {0x2000;}' unless defined(&IMAXBEL);
	eval 'sub IUTF8 () {0x4000;}' unless defined(&IUTF8);
    }
    eval 'sub OPOST () {0x1;}' unless defined(&OPOST);
    if((defined(&__XSI_VISIBLE) ? &__XSI_VISIBLE : undef)) {
	eval 'sub ONLCR () {0x2;}' unless defined(&ONLCR);
    }
    if((defined(&__BSD_VISIBLE) ? &__BSD_VISIBLE : undef)) {
	eval 'sub TABDLY () {0x4;}' unless defined(&TABDLY);
	eval 'sub TAB0 () {0x;}' unless defined(&TAB0);
	eval 'sub TAB3 () {0x4;}' unless defined(&TAB3);
	eval 'sub ONOEOT () {0x8;}' unless defined(&ONOEOT);
    }
    if((defined(&__XSI_VISIBLE) ? &__XSI_VISIBLE : undef)) {
	eval 'sub OCRNL () {0x10;}' unless defined(&OCRNL);
	eval 'sub ONOCR () {0x20;}' unless defined(&ONOCR);
	eval 'sub ONLRET () {0x40;}' unless defined(&ONLRET);
    }
    if((defined(&__BSD_VISIBLE) ? &__BSD_VISIBLE : undef)) {
	eval 'sub CIGNORE () {0x1;}' unless defined(&CIGNORE);
    }
    eval 'sub CSIZE () {0x300;}' unless defined(&CSIZE);
    eval 'sub CS5 () {0x;}' unless defined(&CS5);
    eval 'sub CS6 () {0x100;}' unless defined(&CS6);
    eval 'sub CS7 () {0x200;}' unless defined(&CS7);
    eval 'sub CS8 () {0x300;}' unless defined(&CS8);
    eval 'sub CSTOPB () {0x400;}' unless defined(&CSTOPB);
    eval 'sub CREAD () {0x800;}' unless defined(&CREAD);
    eval 'sub PARENB () {0x1000;}' unless defined(&PARENB);
    eval 'sub PARODD () {0x2000;}' unless defined(&PARODD);
    eval 'sub HUPCL () {0x4000;}' unless defined(&HUPCL);
    eval 'sub CLOCAL () {0x8000;}' unless defined(&CLOCAL);
    if((defined(&__BSD_VISIBLE) ? &__BSD_VISIBLE : undef)) {
	eval 'sub CCTS_OFLOW () {0x10000;}' unless defined(&CCTS_OFLOW);
	eval 'sub CRTSCTS () {( &CCTS_OFLOW |  &CRTS_IFLOW);}' unless defined(&CRTSCTS);
	eval 'sub CRTS_IFLOW () {0x20000;}' unless defined(&CRTS_IFLOW);
	eval 'sub CDTR_IFLOW () {0x40000;}' unless defined(&CDTR_IFLOW);
	eval 'sub CDSR_OFLOW () {0x80000;}' unless defined(&CDSR_OFLOW);
	eval 'sub CCAR_OFLOW () {0x100000;}' unless defined(&CCAR_OFLOW);
	eval 'sub CNO_RTSDTR () {0x200000;}' unless defined(&CNO_RTSDTR);
    }
    if((defined(&__BSD_VISIBLE) ? &__BSD_VISIBLE : undef)) {
	eval 'sub ECHOKE () {0x1;}' unless defined(&ECHOKE);
    }
    eval 'sub ECHOE () {0x2;}' unless defined(&ECHOE);
    eval 'sub ECHOK () {0x4;}' unless defined(&ECHOK);
    eval 'sub ECHO () {0x8;}' unless defined(&ECHO);
    eval 'sub ECHONL () {0x10;}' unless defined(&ECHONL);
    if((defined(&__BSD_VISIBLE) ? &__BSD_VISIBLE : undef)) {
	eval 'sub ECHOPRT () {0x20;}' unless defined(&ECHOPRT);
	eval 'sub ECHOCTL () {0x40;}' unless defined(&ECHOCTL);
    }
    eval 'sub ISIG () {0x80;}' unless defined(&ISIG);
    eval 'sub ICANON () {0x100;}' unless defined(&ICANON);
    if((defined(&__BSD_VISIBLE) ? &__BSD_VISIBLE : undef)) {
	eval 'sub ALTWERASE () {0x200;}' unless defined(&ALTWERASE);
    }
    eval 'sub IEXTEN () {0x400;}' unless defined(&IEXTEN);
    eval 'sub EXTPROC () {0x800;}' unless defined(&EXTPROC);
    eval 'sub TOSTOP () {0x400000;}' unless defined(&TOSTOP);
    if((defined(&__BSD_VISIBLE) ? &__BSD_VISIBLE : undef)) {
	eval 'sub FLUSHO () {0x800000;}' unless defined(&FLUSHO);
	eval 'sub NOKERNINFO () {0x2000000;}' unless defined(&NOKERNINFO);
	eval 'sub PENDIN () {0x20000000;}' unless defined(&PENDIN);
    }
    eval 'sub NOFLSH () {0x80000000;}' unless defined(&NOFLSH);
    eval 'sub B0 () {0;}' unless defined(&B0);
    eval 'sub B50 () {50;}' unless defined(&B50);
    eval 'sub B75 () {75;}' unless defined(&B75);
    eval 'sub B110 () {110;}' unless defined(&B110);
    eval 'sub B134 () {134;}' unless defined(&B134);
    eval 'sub B150 () {150;}' unless defined(&B150);
    eval 'sub B200 () {200;}' unless defined(&B200);
    eval 'sub B300 () {300;}' unless defined(&B300);
    eval 'sub B600 () {600;}' unless defined(&B600);
    eval 'sub B1200 () {1200;}' unless defined(&B1200);
    eval 'sub B1800 () {1800;}' unless defined(&B1800);
    eval 'sub B2400 () {2400;}' unless defined(&B2400);
    eval 'sub B4800 () {4800;}' unless defined(&B4800);
    eval 'sub B9600 () {9600;}' unless defined(&B9600);
    eval 'sub B19200 () {19200;}' unless defined(&B19200);
    eval 'sub B38400 () {38400;}' unless defined(&B38400);
    if((defined(&__BSD_VISIBLE) ? &__BSD_VISIBLE : undef)) {
	eval 'sub B7200 () {7200;}' unless defined(&B7200);
	eval 'sub B14400 () {14400;}' unless defined(&B14400);
	eval 'sub B28800 () {28800;}' unless defined(&B28800);
	eval 'sub B57600 () {57600;}' unless defined(&B57600);
	eval 'sub B76800 () {76800;}' unless defined(&B76800);
	eval 'sub B115200 () {115200;}' unless defined(&B115200);
	eval 'sub B230400 () {230400;}' unless defined(&B230400);
	eval 'sub B460800 () {460800;}' unless defined(&B460800);
	eval 'sub B500000 () {500000;}' unless defined(&B500000);
	eval 'sub B921600 () {921600;}' unless defined(&B921600);
	eval 'sub B1000000 () {1000000;}' unless defined(&B1000000);
	eval 'sub B1500000 () {1500000;}' unless defined(&B1500000);
	eval 'sub B2000000 () {2000000;}' unless defined(&B2000000);
	eval 'sub B2500000 () {2500000;}' unless defined(&B2500000);
	eval 'sub B3000000 () {3000000;}' unless defined(&B3000000);
	eval 'sub B3500000 () {3500000;}' unless defined(&B3500000);
	eval 'sub B4000000 () {4000000;}' unless defined(&B4000000);
	eval 'sub EXTA () {19200;}' unless defined(&EXTA);
	eval 'sub EXTB () {38400;}' unless defined(&EXTB);
    }
}
1;

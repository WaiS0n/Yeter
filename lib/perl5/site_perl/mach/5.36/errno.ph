require '_h2ph_pre.ph';

no warnings qw(redefine misc);

unless(defined(&_SYS_ERRNO_H_)) {
    eval 'sub _SYS_ERRNO_H_ () {1;}' unless defined(&_SYS_ERRNO_H_);
    if(!defined(&_KERNEL)  && !defined(&_STANDALONE)) {
	require 'sys/cdefs.ph';
	eval 'sub errno () {(*  &__error());}' unless defined(&errno);
    }
    eval 'sub EPERM () {1;}' unless defined(&EPERM);
    eval 'sub ENOENT () {2;}' unless defined(&ENOENT);
    eval 'sub ESRCH () {3;}' unless defined(&ESRCH);
    eval 'sub EINTR () {4;}' unless defined(&EINTR);
    eval 'sub EIO () {5;}' unless defined(&EIO);
    eval 'sub ENXIO () {6;}' unless defined(&ENXIO);
    eval 'sub E2BIG () {7;}' unless defined(&E2BIG);
    eval 'sub ENOEXEC () {8;}' unless defined(&ENOEXEC);
    eval 'sub EBADF () {9;}' unless defined(&EBADF);
    eval 'sub ECHILD () {10;}' unless defined(&ECHILD);
    eval 'sub EDEADLK () {11;}' unless defined(&EDEADLK);
    eval 'sub ENOMEM () {12;}' unless defined(&ENOMEM);
    eval 'sub EACCES () {13;}' unless defined(&EACCES);
    eval 'sub EFAULT () {14;}' unless defined(&EFAULT);
    unless(defined(&_POSIX_SOURCE)) {
	eval 'sub ENOTBLK () {15;}' unless defined(&ENOTBLK);
    }
    eval 'sub EBUSY () {16;}' unless defined(&EBUSY);
    eval 'sub EEXIST () {17;}' unless defined(&EEXIST);
    eval 'sub EXDEV () {18;}' unless defined(&EXDEV);
    eval 'sub ENODEV () {19;}' unless defined(&ENODEV);
    eval 'sub ENOTDIR () {20;}' unless defined(&ENOTDIR);
    eval 'sub EISDIR () {21;}' unless defined(&EISDIR);
    eval 'sub EINVAL () {22;}' unless defined(&EINVAL);
    eval 'sub ENFILE () {23;}' unless defined(&ENFILE);
    eval 'sub EMFILE () {24;}' unless defined(&EMFILE);
    eval 'sub ENOTTY () {25;}' unless defined(&ENOTTY);
    unless(defined(&_POSIX_SOURCE)) {
	eval 'sub ETXTBSY () {26;}' unless defined(&ETXTBSY);
    }
    eval 'sub EFBIG () {27;}' unless defined(&EFBIG);
    eval 'sub ENOSPC () {28;}' unless defined(&ENOSPC);
    eval 'sub ESPIPE () {29;}' unless defined(&ESPIPE);
    eval 'sub EROFS () {30;}' unless defined(&EROFS);
    eval 'sub EMLINK () {31;}' unless defined(&EMLINK);
    eval 'sub EPIPE () {32;}' unless defined(&EPIPE);
    eval 'sub EDOM () {33;}' unless defined(&EDOM);
    eval 'sub ERANGE () {34;}' unless defined(&ERANGE);
    eval 'sub EAGAIN () {35;}' unless defined(&EAGAIN);
    unless(defined(&_POSIX_SOURCE)) {
	eval 'sub EWOULDBLOCK () { &EAGAIN;}' unless defined(&EWOULDBLOCK);
	eval 'sub EINPROGRESS () {36;}' unless defined(&EINPROGRESS);
	eval 'sub EALREADY () {37;}' unless defined(&EALREADY);
	eval 'sub ENOTSOCK () {38;}' unless defined(&ENOTSOCK);
	eval 'sub EDESTADDRREQ () {39;}' unless defined(&EDESTADDRREQ);
	eval 'sub EMSGSIZE () {40;}' unless defined(&EMSGSIZE);
	eval 'sub EPROTOTYPE () {41;}' unless defined(&EPROTOTYPE);
	eval 'sub ENOPROTOOPT () {42;}' unless defined(&ENOPROTOOPT);
	eval 'sub EPROTONOSUPPORT () {43;}' unless defined(&EPROTONOSUPPORT);
	eval 'sub ESOCKTNOSUPPORT () {44;}' unless defined(&ESOCKTNOSUPPORT);
	eval 'sub EOPNOTSUPP () {45;}' unless defined(&EOPNOTSUPP);
	eval 'sub ENOTSUP () { &EOPNOTSUPP;}' unless defined(&ENOTSUP);
	eval 'sub EPFNOSUPPORT () {46;}' unless defined(&EPFNOSUPPORT);
	eval 'sub EAFNOSUPPORT () {47;}' unless defined(&EAFNOSUPPORT);
	eval 'sub EADDRINUSE () {48;}' unless defined(&EADDRINUSE);
	eval 'sub EADDRNOTAVAIL () {49;}' unless defined(&EADDRNOTAVAIL);
	eval 'sub ENETDOWN () {50;}' unless defined(&ENETDOWN);
	eval 'sub ENETUNREACH () {51;}' unless defined(&ENETUNREACH);
	eval 'sub ENETRESET () {52;}' unless defined(&ENETRESET);
	eval 'sub ECONNABORTED () {53;}' unless defined(&ECONNABORTED);
	eval 'sub ECONNRESET () {54;}' unless defined(&ECONNRESET);
	eval 'sub ENOBUFS () {55;}' unless defined(&ENOBUFS);
	eval 'sub EISCONN () {56;}' unless defined(&EISCONN);
	eval 'sub ENOTCONN () {57;}' unless defined(&ENOTCONN);
	eval 'sub ESHUTDOWN () {58;}' unless defined(&ESHUTDOWN);
	eval 'sub ETOOMANYREFS () {59;}' unless defined(&ETOOMANYREFS);
	eval 'sub ETIMEDOUT () {60;}' unless defined(&ETIMEDOUT);
	eval 'sub ECONNREFUSED () {61;}' unless defined(&ECONNREFUSED);
	eval 'sub ELOOP () {62;}' unless defined(&ELOOP);
    }
    eval 'sub ENAMETOOLONG () {63;}' unless defined(&ENAMETOOLONG);
    unless(defined(&_POSIX_SOURCE)) {
	eval 'sub EHOSTDOWN () {64;}' unless defined(&EHOSTDOWN);
	eval 'sub EHOSTUNREACH () {65;}' unless defined(&EHOSTUNREACH);
    }
    eval 'sub ENOTEMPTY () {66;}' unless defined(&ENOTEMPTY);
    unless(defined(&_POSIX_SOURCE)) {
	eval 'sub EPROCLIM () {67;}' unless defined(&EPROCLIM);
	eval 'sub EUSERS () {68;}' unless defined(&EUSERS);
	eval 'sub EDQUOT () {69;}' unless defined(&EDQUOT);
	eval 'sub ESTALE () {70;}' unless defined(&ESTALE);
	eval 'sub EREMOTE () {71;}' unless defined(&EREMOTE);
	eval 'sub EBADRPC () {72;}' unless defined(&EBADRPC);
	eval 'sub ERPCMISMATCH () {73;}' unless defined(&ERPCMISMATCH);
	eval 'sub EPROGUNAVAIL () {74;}' unless defined(&EPROGUNAVAIL);
	eval 'sub EPROGMISMATCH () {75;}' unless defined(&EPROGMISMATCH);
	eval 'sub EPROCUNAVAIL () {76;}' unless defined(&EPROCUNAVAIL);
    }
    eval 'sub ENOLCK () {77;}' unless defined(&ENOLCK);
    eval 'sub ENOSYS () {78;}' unless defined(&ENOSYS);
    unless(defined(&_POSIX_SOURCE)) {
	eval 'sub EFTYPE () {79;}' unless defined(&EFTYPE);
	eval 'sub EAUTH () {80;}' unless defined(&EAUTH);
	eval 'sub ENEEDAUTH () {81;}' unless defined(&ENEEDAUTH);
	eval 'sub EIDRM () {82;}' unless defined(&EIDRM);
	eval 'sub ENOMSG () {83;}' unless defined(&ENOMSG);
	eval 'sub EOVERFLOW () {84;}' unless defined(&EOVERFLOW);
	eval 'sub ECANCELED () {85;}' unless defined(&ECANCELED);
	eval 'sub EILSEQ () {86;}' unless defined(&EILSEQ);
	eval 'sub ENOATTR () {87;}' unless defined(&ENOATTR);
	eval 'sub EDOOFUS () {88;}' unless defined(&EDOOFUS);
    }
    eval 'sub EBADMSG () {89;}' unless defined(&EBADMSG);
    eval 'sub EMULTIHOP () {90;}' unless defined(&EMULTIHOP);
    eval 'sub ENOLINK () {91;}' unless defined(&ENOLINK);
    eval 'sub EPROTO () {92;}' unless defined(&EPROTO);
    unless(defined(&_POSIX_SOURCE)) {
	eval 'sub ENOTCAPABLE () {93;}' unless defined(&ENOTCAPABLE);
	eval 'sub ECAPMODE () {94;}' unless defined(&ECAPMODE);
	eval 'sub ENOTRECOVERABLE () {95;}' unless defined(&ENOTRECOVERABLE);
	eval 'sub EOWNERDEAD () {96;}' unless defined(&EOWNERDEAD);
	eval 'sub EINTEGRITY () {97;}' unless defined(&EINTEGRITY);
    }
    unless(defined(&_POSIX_SOURCE)) {
	eval 'sub ELAST () {97;}' unless defined(&ELAST);
    }
    if(defined(&_KERNEL) || defined(&_WANT_KERNEL_ERRNO) || defined(&_STANDALONE)) {
	eval 'sub ERESTART () {(-1);}' unless defined(&ERESTART);
	eval 'sub EJUSTRETURN () {(-2);}' unless defined(&EJUSTRETURN);
	eval 'sub ENOIOCTL () {(-3);}' unless defined(&ENOIOCTL);
	eval 'sub EDIRIOCTL () {(-4);}' unless defined(&EDIRIOCTL);
	eval 'sub ERELOOKUP () {(-5);}' unless defined(&ERELOOKUP);
    }
    unless(defined(&_KERNEL)) {
	if((defined(&__EXT1_VISIBLE) ? &__EXT1_VISIBLE : undef)) {
	    unless(defined(&_ERRNO_T_DEFINED)) {
		eval 'sub _ERRNO_T_DEFINED () {1;}' unless defined(&_ERRNO_T_DEFINED);
	    }
	}
    }
}
1;

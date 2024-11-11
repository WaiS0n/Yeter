require '_h2ph_pre.ph';

no warnings qw(redefine misc);

unless(defined(&_SYS_WATCHDOG_H)) {
    eval 'sub _SYS_WATCHDOG_H () {1;}' unless defined(&_SYS_WATCHDOG_H);
    require 'sys/ioccom.ph';
    eval 'sub _PATH_WATCHDOG () {"fido";}' unless defined(&_PATH_WATCHDOG);
    eval 'sub WDIOCPATPAT () { &_IOW(ord(\'W\'), 42, \'u_int\');}' unless defined(&WDIOCPATPAT);
    eval 'sub WDIOC_SETTIMEOUT () { &_IOW(ord(\'W\'), 43, \'int\');}' unless defined(&WDIOC_SETTIMEOUT);
    eval 'sub WDIOC_GETTIMEOUT () { &_IOR(ord(\'W\'), 44, \'int\');}' unless defined(&WDIOC_GETTIMEOUT);
    eval 'sub WDIOC_GETTIMELEFT () { &_IOR(ord(\'W\'), 45, \'int\');}' unless defined(&WDIOC_GETTIMELEFT);
    eval 'sub WDIOC_GETPRETIMEOUT () { &_IOR(ord(\'W\'), 46, \'int\');}' unless defined(&WDIOC_GETPRETIMEOUT);
    eval 'sub WDIOC_SETPRETIMEOUT () { &_IOW(ord(\'W\'), 47, \'int\');}' unless defined(&WDIOC_SETPRETIMEOUT);
    eval 'sub WDIOC_SETPRETIMEOUTACT () { &_IOW(ord(\'W\'), 48, \'int\');}' unless defined(&WDIOC_SETPRETIMEOUTACT);
    eval 'sub WDIOC_SETSOFT () { &_IOW(ord(\'W\'), 49, \'int\');}' unless defined(&WDIOC_SETSOFT);
    eval 'sub WDIOC_SETSOFTTIMEOUTACT () { &_IOW(ord(\'W\'), 50, \'int\');}' unless defined(&WDIOC_SETSOFTTIMEOUTACT);
    eval 'sub WD_ACTIVE () {0x8000000;}' unless defined(&WD_ACTIVE);
    eval 'sub WD_PASSIVE () {0x400000;}' unless defined(&WD_PASSIVE);
    eval 'sub WD_LASTVAL () {0x200000;}' unless defined(&WD_LASTVAL);
    eval 'sub WD_INTERVAL () {0xff;}' unless defined(&WD_INTERVAL);
    eval 'sub WD_TO_NEVER () {0;}' unless defined(&WD_TO_NEVER);
    eval 'sub WD_TO_1MS () {20;}' unless defined(&WD_TO_1MS);
    eval 'sub WD_TO_125MS () {27;}' unless defined(&WD_TO_125MS);
    eval 'sub WD_TO_250MS () {28;}' unless defined(&WD_TO_250MS);
    eval 'sub WD_TO_500MS () {29;}' unless defined(&WD_TO_500MS);
    eval 'sub WD_TO_1SEC () {30;}' unless defined(&WD_TO_1SEC);
    eval 'sub WD_TO_2SEC () {31;}' unless defined(&WD_TO_2SEC);
    eval 'sub WD_TO_4SEC () {32;}' unless defined(&WD_TO_4SEC);
    eval 'sub WD_TO_8SEC () {33;}' unless defined(&WD_TO_8SEC);
    eval 'sub WD_TO_16SEC () {34;}' unless defined(&WD_TO_16SEC);
    eval 'sub WD_TO_32SEC () {35;}' unless defined(&WD_TO_32SEC);
    eval 'sub WD_TO_64SEC () {36;}' unless defined(&WD_TO_64SEC);
    eval 'sub WD_TO_128SEC () {37;}' unless defined(&WD_TO_128SEC);
    eval 'sub WD_SOFT_PANIC () {0x1;}' unless defined(&WD_SOFT_PANIC);
    eval 'sub WD_SOFT_DDB () {0x2;}' unless defined(&WD_SOFT_DDB);
    eval 'sub WD_SOFT_LOG () {0x4;}' unless defined(&WD_SOFT_LOG);
    eval 'sub WD_SOFT_PRINTF () {0x8;}' unless defined(&WD_SOFT_PRINTF);
    eval 'sub WD_SOFT_MASK () {0xf;}' unless defined(&WD_SOFT_MASK);
    if(defined(&_KERNEL)) {
	require 'sys/_eventhandler.ph';
    }
}
1;

require '_h2ph_pre.ph';

no warnings qw(redefine misc);

unless(defined(&_MACHINE_CONS_H_)) {
    eval 'sub _MACHINE_CONS_H_ () {1;}' unless defined(&_MACHINE_CONS_H_);
    eval 'sub CN_DEAD () {0;}' unless defined(&CN_DEAD);
    eval 'sub CN_LOW () {1;}' unless defined(&CN_LOW);
    eval 'sub CN_NORMAL () {2;}' unless defined(&CN_NORMAL);
    eval 'sub CN_INTERNAL () {3;}' unless defined(&CN_INTERNAL);
    eval 'sub CN_REMOTE () {4;}' unless defined(&CN_REMOTE);
    eval 'sub CN_FLAG_NODEBUG () {0x1;}' unless defined(&CN_FLAG_NODEBUG);
    eval 'sub CN_FLAG_NOAVAIL () {0x2;}' unless defined(&CN_FLAG_NOAVAIL);
    eval 'sub GETS_NOECHO () {0;}' unless defined(&GETS_NOECHO);
    eval 'sub GETS_ECHO () {1;}' unless defined(&GETS_ECHO);
    eval 'sub GETS_ECHOPASS () {2;}' unless defined(&GETS_ECHOPASS);
    if(defined(&_KERNEL)) {
	eval 'sub CONSOLE_DEVICE {
	    my($name, $ops, $arg) = @_;
    	    eval q( &static \'struct consdev\' $name = { . &cn_ops = $ops, . &cn_arg = ($arg), };  &DATA_SET( &cons_set, $name));
	}' unless defined(&CONSOLE_DEVICE);
	eval 'sub CONSOLE_DRIVER () {( &name, ...)  &static  &const \'struct consdev_ops\'  &name &_consdev_ops = { . &cn_probe =  &name &_cnprobe, . &cn_init =  &name &_cninit, . &cn_term =  &name &_cnterm, . &cn_getc =  &name &_cngetc, . &cn_putc =  &name &_cnputc, . &cn_grab =  &name &_cngrab, . &cn_ungrab =  &name &_cnungrab,  &__VA_ARGS__ };  &CONSOLE_DEVICE( &name &_consdev,  &name &_consdev_ops,  &NULL);}' unless defined(&CONSOLE_DRIVER);
	eval 'sub VTY_SC () {0x1;}' unless defined(&VTY_SC);
	eval 'sub VTY_VT () {0x2;}' unless defined(&VTY_VT);
    }
}
1;

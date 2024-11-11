require '_h2ph_pre.ph';

no warnings qw(redefine misc);

unless(defined(&__GPIO_H__)) {
    eval 'sub __GPIO_H__ () {1;}' unless defined(&__GPIO_H__);
    require 'sys/ioccom.ph';
    if(!defined(&_KERNEL)  && !defined(&_STANDALONE)) {
	require 'stdbool.ph';
    }
    eval 'sub GPIO_PIN_LOW () {0x;}' unless defined(&GPIO_PIN_LOW);
    eval 'sub GPIO_PIN_HIGH () {0x1;}' unless defined(&GPIO_PIN_HIGH);
    eval 'sub GPIOMAXNAME () {64;}' unless defined(&GPIOMAXNAME);
    eval 'sub GPIO_PIN_INPUT () {0x1;}' unless defined(&GPIO_PIN_INPUT);
    eval 'sub GPIO_PIN_OUTPUT () {0x2;}' unless defined(&GPIO_PIN_OUTPUT);
    eval 'sub GPIO_PIN_OPENDRAIN () {0x4;}' unless defined(&GPIO_PIN_OPENDRAIN);
    eval 'sub GPIO_PIN_PUSHPULL () {0x8;}' unless defined(&GPIO_PIN_PUSHPULL);
    eval 'sub GPIO_PIN_TRISTATE () {0x10;}' unless defined(&GPIO_PIN_TRISTATE);
    eval 'sub GPIO_PIN_PULLUP () {0x20;}' unless defined(&GPIO_PIN_PULLUP);
    eval 'sub GPIO_PIN_PULLDOWN () {0x40;}' unless defined(&GPIO_PIN_PULLDOWN);
    eval 'sub GPIO_PIN_INVIN () {0x80;}' unless defined(&GPIO_PIN_INVIN);
    eval 'sub GPIO_PIN_INVOUT () {0x100;}' unless defined(&GPIO_PIN_INVOUT);
    eval 'sub GPIO_PIN_PULSATE () {0x200;}' unless defined(&GPIO_PIN_PULSATE);
    eval 'sub GPIO_PIN_PRESET_LOW () {0x400;}' unless defined(&GPIO_PIN_PRESET_LOW);
    eval 'sub GPIO_PIN_PRESET_HIGH () {0x800;}' unless defined(&GPIO_PIN_PRESET_HIGH);
    eval 'sub GPIO_INTR_NONE () {0x;}' unless defined(&GPIO_INTR_NONE);
    eval 'sub GPIO_INTR_LEVEL_LOW () {0x10000;}' unless defined(&GPIO_INTR_LEVEL_LOW);
    eval 'sub GPIO_INTR_LEVEL_HIGH () {0x20000;}' unless defined(&GPIO_INTR_LEVEL_HIGH);
    eval 'sub GPIO_INTR_EDGE_RISING () {0x40000;}' unless defined(&GPIO_INTR_EDGE_RISING);
    eval 'sub GPIO_INTR_EDGE_FALLING () {0x80000;}' unless defined(&GPIO_INTR_EDGE_FALLING);
    eval 'sub GPIO_INTR_EDGE_BOTH () {0x100000;}' unless defined(&GPIO_INTR_EDGE_BOTH);
    eval 'sub GPIO_INTR_ATTACHED () {0x200000;}' unless defined(&GPIO_INTR_ATTACHED);
    eval 'sub GPIO_INTR_MASK () {( &GPIO_INTR_LEVEL_LOW |  &GPIO_INTR_LEVEL_HIGH |  &GPIO_INTR_EDGE_RISING |  &GPIO_INTR_EDGE_FALLING |  &GPIO_INTR_EDGE_BOTH |  &GPIO_INTR_ATTACHED);}' unless defined(&GPIO_INTR_MASK);
    eval("sub GPIO_EVENT_REPORT_DETAIL () { 0; }") unless defined(&GPIO_EVENT_REPORT_DETAIL);
    eval("sub GPIO_EVENT_REPORT_SUMMARY () { 1; }") unless defined(&GPIO_EVENT_REPORT_SUMMARY);
    eval 'sub GPIOMAXPIN () { &_IOR(ord(\'G\'), 0, \'int\');}' unless defined(&GPIOMAXPIN);
    eval 'sub GPIOGETCONFIG () { &_IOWR(ord(\'G\'), 1, \'struct gpio_pin\');}' unless defined(&GPIOGETCONFIG);
    eval 'sub GPIOSETCONFIG () { &_IOW(ord(\'G\'), 2, \'struct gpio_pin\');}' unless defined(&GPIOSETCONFIG);
    eval 'sub GPIOGET () { &_IOWR(ord(\'G\'), 3, \'struct gpio_req\');}' unless defined(&GPIOGET);
    eval 'sub GPIOSET () { &_IOW(ord(\'G\'), 4, \'struct gpio_req\');}' unless defined(&GPIOSET);
    eval 'sub GPIOTOGGLE () { &_IOWR(ord(\'G\'), 5, \'struct gpio_req\');}' unless defined(&GPIOTOGGLE);
    eval 'sub GPIOSETNAME () { &_IOW(ord(\'G\'), 6, \'struct gpio_pin\');}' unless defined(&GPIOSETNAME);
    eval 'sub GPIOACCESS32 () { &_IOWR(ord(\'G\'), 7, \'struct gpio_access_32\');}' unless defined(&GPIOACCESS32);
    eval 'sub GPIOCONFIG32 () { &_IOW(ord(\'G\'), 8, \'struct gpio_config_32\');}' unless defined(&GPIOCONFIG32);
    eval 'sub GPIOCONFIGEVENTS () { &_IOW(ord(\'G\'), 9, \'struct gpio_event_config\');}' unless defined(&GPIOCONFIGEVENTS);
}
1;

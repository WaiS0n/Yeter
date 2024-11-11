require '_h2ph_pre.ph';

no warnings qw(redefine misc);

unless(defined(&_LIBGPIO_H_)) {
    eval 'sub _LIBGPIO_H_ () {1;}' unless defined(&_LIBGPIO_H_);
    require 'sys/gpio.ph';
    eval 'sub GPIO_INVALID_HANDLE () {-1;}' unless defined(&GPIO_INVALID_HANDLE);
    eval("sub GPIO_VALUE_INVALID () { -1; }") unless defined(&GPIO_VALUE_INVALID);
    eval("sub GPIO_VALUE_LOW () { GPIO_PIN_LOW; }") unless defined(&GPIO_VALUE_LOW);
    eval("sub GPIO_VALUE_HIGH () { GPIO_PIN_HIGH; }") unless defined(&GPIO_VALUE_HIGH);
}
1;

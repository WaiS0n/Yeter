require '_h2ph_pre.ph';

no warnings qw(redefine misc);

unless(defined(&_READPASSPHRASE_H_)) {
    eval 'sub _READPASSPHRASE_H_ () {1;}' unless defined(&_READPASSPHRASE_H_);
    eval 'sub RPP_ECHO_OFF () {0x;}' unless defined(&RPP_ECHO_OFF);
    eval 'sub RPP_ECHO_ON () {0x1;}' unless defined(&RPP_ECHO_ON);
    eval 'sub RPP_REQUIRE_TTY () {0x2;}' unless defined(&RPP_REQUIRE_TTY);
    eval 'sub RPP_FORCELOWER () {0x4;}' unless defined(&RPP_FORCELOWER);
    eval 'sub RPP_FORCEUPPER () {0x8;}' unless defined(&RPP_FORCEUPPER);
    eval 'sub RPP_SEVENBIT () {0x10;}' unless defined(&RPP_SEVENBIT);
    eval 'sub RPP_STDIN () {0x20;}' unless defined(&RPP_STDIN);
    require 'sys/cdefs.ph';
    require 'sys/_types.ph';
    unless(defined(&_SIZE_T_DECLARED)) {
	eval 'sub _SIZE_T_DECLARED () {1;}' unless defined(&_SIZE_T_DECLARED);
    }
}
1;

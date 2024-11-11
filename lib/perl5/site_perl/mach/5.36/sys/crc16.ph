require '_h2ph_pre.ph';

no warnings qw(redefine misc);

require 'sys/types.ph';
unless(defined(&_SYS_CRC16_H_)) {
    eval 'sub _SYS_CRC16_H_ () {1;}' unless defined(&_SYS_CRC16_H_);
    eval 'sub crc16 {
        my($crc,$buffer,$len) = @_;
	    eval q({  &const my $char * &cp = $buffer;  &while ($len--) $crc = ((($crc >> 8) & 0xff) ^  $crc16_table[($crc ^ * &cp++) & 0xff]) & 0xffff; $crc; });
    }' unless defined(&crc16);
}
1;

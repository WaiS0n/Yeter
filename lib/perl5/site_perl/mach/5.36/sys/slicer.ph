require '_h2ph_pre.ph';

no warnings qw(redefine misc);

unless(defined(&_FLASH_SLICER_H_)) {
    eval 'sub _FLASH_SLICER_H_ () {1;}' unless defined(&_FLASH_SLICER_H_);
    require 'sys/types.ph';
    eval 'sub FLASH_SLICES_MAX_NUM () {8;}' unless defined(&FLASH_SLICES_MAX_NUM);
    eval 'sub FLASH_SLICES_MAX_NAME_LEN () {(32+ 1);}' unless defined(&FLASH_SLICES_MAX_NAME_LEN);
    eval 'sub FLASH_SLICES_FLAG_NONE () {0;}' unless defined(&FLASH_SLICES_FLAG_NONE);
    eval 'sub FLASH_SLICES_FLAG_RO () {1;}' unless defined(&FLASH_SLICES_FLAG_RO);
    eval 'sub FLASH_SLICES_FMT () {"%ss.%s";}' unless defined(&FLASH_SLICES_FMT);
    if(defined(&_KERNEL)) {
	eval 'sub FLASH_SLICES_TYPE_NAND () {0;}' unless defined(&FLASH_SLICES_TYPE_NAND);
	eval 'sub FLASH_SLICES_TYPE_CFI () {1;}' unless defined(&FLASH_SLICES_TYPE_CFI);
	eval 'sub FLASH_SLICES_TYPE_SPI () {2;}' unless defined(&FLASH_SLICES_TYPE_SPI);
	eval 'sub FLASH_SLICES_TYPE_MMC () {3;}' unless defined(&FLASH_SLICES_TYPE_MMC);
    }
}
1;

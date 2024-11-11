require '_h2ph_pre.ph';

no warnings qw(redefine misc);

unless(defined(&_SYS__COMPRESSOR_H_)) {
    eval 'sub _SYS__COMPRESSOR_H_ () {1;}' unless defined(&_SYS__COMPRESSOR_H_);
    if(defined(&_KERNEL)) {
	eval 'sub COMPRESS_GZIP () {1;}' unless defined(&COMPRESS_GZIP);
	eval 'sub COMPRESS_ZSTD () {2;}' unless defined(&COMPRESS_ZSTD);
    }
}
1;

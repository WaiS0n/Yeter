require '_h2ph_pre.ph';

no warnings qw(redefine misc);

unless(defined(&_SYS_ICONV_H_)) {
    eval 'sub _SYS_ICONV_H_ () {1;}' unless defined(&_SYS_ICONV_H_);
    eval 'sub ICONV_CSNMAXLEN () {31;}' unless defined(&ICONV_CSNMAXLEN);
    eval 'sub ICONV_CNVNMAXLEN () {31;}' unless defined(&ICONV_CNVNMAXLEN);
    eval 'sub ICONV_CSMAXDATALEN () {($sizeof{\'caddr_t\'} * 0x200 + $sizeof{ &uint32_t} * 0x200 * 0x80);}' unless defined(&ICONV_CSMAXDATALEN);
    eval 'sub XLAT16_ACCEPT_NULL_OUT () {0x1000000;}' unless defined(&XLAT16_ACCEPT_NULL_OUT);
    eval 'sub XLAT16_ACCEPT_NULL_IN () {0x2000000;}' unless defined(&XLAT16_ACCEPT_NULL_IN);
    eval 'sub XLAT16_HAS_LOWER_CASE () {0x4000000;}' unless defined(&XLAT16_HAS_LOWER_CASE);
    eval 'sub XLAT16_HAS_UPPER_CASE () {0x8000000;}' unless defined(&XLAT16_HAS_UPPER_CASE);
    eval 'sub XLAT16_HAS_FROM_LOWER_CASE () {0x10000000;}' unless defined(&XLAT16_HAS_FROM_LOWER_CASE);
    eval 'sub XLAT16_HAS_FROM_UPPER_CASE () {0x20000000;}' unless defined(&XLAT16_HAS_FROM_UPPER_CASE);
    eval 'sub XLAT16_IS_3BYTE_CHR () {0x40000000;}' unless defined(&XLAT16_IS_3BYTE_CHR);
    eval 'sub KICONV_LOWER () {1;}' unless defined(&KICONV_LOWER);
    eval 'sub KICONV_UPPER () {2;}' unless defined(&KICONV_UPPER);
    eval 'sub KICONV_FROM_LOWER () {4;}' unless defined(&KICONV_FROM_LOWER);
    eval 'sub KICONV_FROM_UPPER () {8;}' unless defined(&KICONV_FROM_UPPER);
    eval 'sub KICONV_WCTYPE () {16;}' unless defined(&KICONV_WCTYPE);
    eval 'sub ENCODING_UNICODE () {"UTF-16BE";}' unless defined(&ENCODING_UNICODE);
    eval 'sub KICONV_WCTYPE_NAME () {"_wctype";}' unless defined(&KICONV_WCTYPE_NAME);
    eval 'sub ICONV_CSPAIR_INFO_VER () {1;}' unless defined(&ICONV_CSPAIR_INFO_VER);
    eval 'sub ICONV_ADD_VER () {1;}' unless defined(&ICONV_ADD_VER);
    unless(defined(&_KERNEL)) {
	eval 'sub KICONV_VENDOR_MICSFT () {1;}' unless defined(&KICONV_VENDOR_MICSFT);
    } else {
	require 'sys/kobj.ph';
	require 'sys/module.ph';
	require 'sys/queue.ph';
	require 'sys/sysctl.ph';
	eval 'sub KICONV_CONVERTER {
	    my($name,$size) = @_;
    	    eval q( &static \'struct iconv_converter_class\'  &iconv_  $name   &_class = { \\"iconv_\\"$name,  &iconv_  $name   &_methods, $size,  &NULL };  &static  &moduledata_t  &iconv_  $name   &_mod = { \\"iconv_\\"$name,  &iconv_converter_handler, ( &void*) &iconv_  $name   &_class };  &DECLARE_MODULE( &iconv_  $name,  &iconv_  $name   &_mod,  &SI_SUB_DRIVERS,  &SI_ORDER_ANY););
	}' unless defined(&KICONV_CONVERTER);
	eval 'sub KICONV_CES {
	    my($name,$size) = @_;
    	    eval q( &static  &DEFINE_CLASS( &iconv_ces_  $name,  &iconv_ces_  $name   &_methods, ($size));  &static  &moduledata_t  &iconv_ces_  $name   &_mod = { \\"iconv_ces_\\"$name,  &iconv_cesmod_handler, ( &void*) &iconv_ces_  $name   &_class };  &DECLARE_MODULE( &iconv_ces_  $name,  &iconv_ces_  $name   &_mod,  &SI_SUB_DRIVERS,  &SI_ORDER_ANY););
	}' unless defined(&KICONV_CES);
	if(defined(&MALLOC_DECLARE)) {
	}
	eval 'sub VFS_DECLARE_ICONV {
	    my($fsname) = @_;
    	    eval q( &static \'struct iconv_functions\' $fsname   &_iconv_core = {  &iconv_open,  &iconv_close,  &iconv_conv,  &iconv_conv_case,  &iconv_convchr,  &iconv_convchr_case };  &extern \'struct iconv_functions\' *$fsname   &_iconv;  &static \'int\' $fsname   &_iconv_mod_handler( &module_t  &mod, \'int\'  &type,  &void * &d);  &static \'int\' $fsname   &_iconv_mod_handler( &module_t  &mod, \'int\'  &type,  &void * &d) { \'int\'  &error = 0;  &switch( &type) {  &case  &MOD_LOAD: $fsname   &_iconv = & $fsname   &_iconv_core;  &break;  &case  &MOD_UNLOAD:  &error =  &iconv_vfs_refcount($fsname);  &if ( &error)  &return ( &EBUSY); $fsname   &_iconv =  &NULL;  &break;  &default:  &error =  &EINVAL;  &break; }  &return ( &error); }  &static  &moduledata_t $fsname   &_iconv_mod = { $fsname\\"_iconv\\", $fsname   &_iconv_mod_handler,  &NULL };  &DECLARE_MODULE($fsname   &_iconv, $fsname   &_iconv_mod,  &SI_SUB_DRIVERS,  &SI_ORDER_ANY);  &MODULE_DEPEND($fsname   &_iconv, $fsname, 1, 1, 1);  &MODULE_DEPEND($fsname   &_iconv,  &libiconv, 2, 2, 2);  &MODULE_VERSION($fsname   &_iconv, 1));
	}' unless defined(&VFS_DECLARE_ICONV);
	if(defined(&ICONV_DEBUG)) {
	    eval 'sub ICDEBUG () {( &format, ...)  &printf("%s: " &format,  &__func__ ,   &__VA_ARGS__);}' unless defined(&ICDEBUG);
	} else {
	    eval 'sub ICDEBUG () {( &format, ...);}' unless defined(&ICDEBUG);
	}
    }
}
1;

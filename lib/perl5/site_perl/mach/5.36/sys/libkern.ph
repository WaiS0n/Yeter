require '_h2ph_pre.ph';

no warnings qw(redefine misc);

unless(defined(&_SYS_LIBKERN_H_)) {
    eval 'sub _SYS_LIBKERN_H_ () {1;}' unless defined(&_SYS_LIBKERN_H_);
    require 'sys/cdefs.ph';
    require 'sys/types.ph';
    if(defined(&_KERNEL)) {
	require 'sys/systm.ph';
    }
    unless(defined(&LIBKERN_INLINE)) {
	eval 'sub LIBKERN_INLINE () { &static  &__inline;}' unless defined(&LIBKERN_INLINE);
	eval 'sub LIBKERN_BODY () {1;}' unless defined(&LIBKERN_BODY);
    }
    eval 'sub LIBKERN_LEN_BCD2BIN () {154;}' unless defined(&LIBKERN_LEN_BCD2BIN);
    eval 'sub LIBKERN_LEN_BIN2BCD () {100;}' unless defined(&LIBKERN_LEN_BIN2BCD);
    eval 'sub LIBKERN_LEN_HEX2ASCII () {36;}' unless defined(&LIBKERN_LEN_HEX2ASCII);
    eval 'sub bcd2bin {
        my($bcd) = @_;
	    eval q({  &KASSERT($bcd >= 0 && $bcd <  &LIBKERN_LEN_BCD2BIN, (\\"invalid bcd %d\\", $bcd)); ( $bcd2bin_data[$bcd]); });
    }' unless defined(&bcd2bin);
    eval 'sub bin2bcd {
        my($bin) = @_;
	    eval q({  &KASSERT($bin >= 0 && $bin <  &LIBKERN_LEN_BIN2BCD, (\\"invalid bin %d\\", $bin)); ( $bin2bcd_data[$bin]); });
    }' unless defined(&bin2bcd);
    eval 'sub hex2ascii {
        my($hex) = @_;
	    eval q({  &KASSERT($hex >= 0 && $hex <  &LIBKERN_LEN_HEX2ASCII, (\\"invalid hex %d\\", $hex)); ( $hex2ascii_data[$hex]); });
    }' unless defined(&hex2ascii);
    eval 'sub validbcd {
        my($bcd) = @_;
	    eval q({ ($bcd == 0|| ($bcd > 0 && $bcd <= 0x99  &&  $bcd2bin_data[$bcd] != 0)); });
    }' unless defined(&validbcd);
    eval 'sub ummax {
        my($a,$b) = @_;
	    eval q({ ($a > $b ? $a : $b); });
    }' unless defined(&ummax);
    eval 'sub ummin {
        my($a,$b) = @_;
	    eval q({ ($a < $b ? $a : $b); });
    }' unless defined(&ummin);
    unless(defined(&RANDOM_FENESTRASX)) {
	eval 'sub ARC4_ENTR_NONE () {0;}' unless defined(&ARC4_ENTR_NONE);
	eval 'sub ARC4_ENTR_HAVE () {1;}' unless defined(&ARC4_ENTR_HAVE);
	eval 'sub ARC4_ENTR_SEED () {2;}' unless defined(&ARC4_ENTR_SEED);
    }
    eval 'sub HAVE_INLINE_FFS () {1;}' unless defined(&HAVE_INLINE_FFS);
    eval 'sub HAVE_INLINE_FFSL () {1;}' unless defined(&HAVE_INLINE_FFSL);
    eval 'sub HAVE_INLINE_FFSLL () {1;}' unless defined(&HAVE_INLINE_FFSLL);
    eval 'sub HAVE_INLINE_FLS () {1;}' unless defined(&HAVE_INLINE_FLS);
    eval 'sub HAVE_INLINE_FLSL () {1;}' unless defined(&HAVE_INLINE_FLSL);
    eval 'sub HAVE_INLINE_FLSLL () {1;}' unless defined(&HAVE_INLINE_FLSLL);
    eval 'sub ffs {
        my($mask) = @_;
	    eval q({ ( &__builtin_ffs($mask)); });
    }' unless defined(&ffs);
    eval 'sub ffsl {
        my($mask) = @_;
	    eval q({ ( &__builtin_ffsl($mask)); });
    }' unless defined(&ffsl);
    eval 'sub ffsll {
        my($mask) = @_;
	    eval q({ ( &__builtin_ffsll($mask)); });
    }' unless defined(&ffsll);
    eval 'sub fls {
        my($mask) = @_;
	    eval q({ ($mask == 0? 0: 8*  &sizeof -  &__builtin_clz($mask)); });
    }' unless defined(&fls);
    eval 'sub flsl {
        my($mask) = @_;
	    eval q({ ($mask == 0? 0: 8*  &sizeof -  &__builtin_clzl($mask)); });
    }' unless defined(&flsl);
    eval 'sub flsll {
        my($mask) = @_;
	    eval q({ ($mask == 0? 0: 8*  &sizeof -  &__builtin_clzll($mask)); });
    }' unless defined(&flsll);
    eval 'sub bitcount64 {
        my($x) = @_;
	    eval q( &__bitcount64(( &uint64_t)($x)));
    }' unless defined(&bitcount64);
    eval 'sub bitcount32 {
        my($x) = @_;
	    eval q( &__bitcount32(( &uint32_t)($x)));
    }' unless defined(&bitcount32);
    eval 'sub bitcount16 {
        my($x) = @_;
	    eval q( &__bitcount16(( &uint16_t)($x)));
    }' unless defined(&bitcount16);
    eval 'sub bitcountl {
        my($x) = @_;
	    eval q( &__bitcountl(($x)));
    }' unless defined(&bitcountl);
    eval 'sub bitcount {
        my($x) = @_;
	    eval q( &__bitcount(($x)));
    }' unless defined(&bitcount);
    if(defined(&SAN_NEEDS_INTERCEPTORS)) {
	unless(defined(&SAN_INTERCEPTOR)) {
	    eval 'sub SAN_INTERCEPTOR {
	        my($func) = @_;
    		eval q( &__CONCAT( &SAN_INTERCEPTOR_PREFIX,  &__CONCAT( &_, $func)));
	    }' unless defined(&SAN_INTERCEPTOR);
	}
	unless(defined(&SAN_RUNTIME)) {
	    eval 'sub strcpy {
	        my($d, $s) = @_;
    		eval q( &SAN_INTERCEPTOR( &strcpy)(($d), ($s)));
	    }' unless defined(&strcpy);
	    eval 'sub strcmp {
	        my($s1, $s2) = @_;
    		eval q( &SAN_INTERCEPTOR( &strcmp)(($s1), ($s2)));
	    }' unless defined(&strcmp);
	    eval 'sub strlen {
	        my($s) = @_;
    		eval q( &SAN_INTERCEPTOR( &strlen)($s));
	    }' unless defined(&strlen);
	}
    } else {
	eval 'sub strcpy {
	    my($d, $s) = @_;
    	    eval q( &__builtin_strcpy(($d), ($s)));
	}' unless defined(&strcpy);
	eval 'sub strcmp {
	    my($s1, $s2) = @_;
    	    eval q( &__builtin_strcmp(($s1), ($s2)));
	}' unless defined(&strcmp);
	eval 'sub strlen {
	    my($s) = @_;
    	    eval q( &__builtin_strlen(($s)));
	}' unless defined(&strlen);
    }
    eval 'sub index {
        my($p,$ch) = @_;
	    eval q({ ( &strchr($p, $ch)); });
    }' unless defined(&index);
    eval 'sub rindex {
        my($p,$ch) = @_;
	    eval q({ ( &strrchr($p, $ch)); });
    }' unless defined(&rindex);
    eval 'sub signed_extend64 {
        my($bitmap,$lsb,$width) = @_;
	    eval q({ (( &int64_t)($bitmap << (63- $lsb - ($width - 1)))) >> (63- ($width - 1)); });
    }' unless defined(&signed_extend64);
    eval 'sub signed_extend32 {
        my($bitmap,$lsb,$width) = @_;
	    eval q({ (( &int32_t)($bitmap << (31- $lsb - ($width - 1)))) >> (31- ($width - 1)); });
    }' unless defined(&signed_extend32);
    eval 'sub FNM_NOMATCH () {1;}' unless defined(&FNM_NOMATCH);
    eval 'sub FNM_NOESCAPE () {0x1;}' unless defined(&FNM_NOESCAPE);
    eval 'sub FNM_PATHNAME () {0x2;}' unless defined(&FNM_PATHNAME);
    eval 'sub FNM_PERIOD () {0x4;}' unless defined(&FNM_PERIOD);
    eval 'sub FNM_LEADING_DIR () {0x8;}' unless defined(&FNM_LEADING_DIR);
    eval 'sub FNM_CASEFOLD () {0x10;}' unless defined(&FNM_CASEFOLD);
    eval 'sub FNM_IGNORECASE () { &FNM_CASEFOLD;}' unless defined(&FNM_IGNORECASE);
    eval 'sub FNM_FILE_NAME () { &FNM_PATHNAME;}' unless defined(&FNM_FILE_NAME);
}
1;

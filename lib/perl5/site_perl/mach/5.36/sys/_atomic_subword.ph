require '_h2ph_pre.ph';

no warnings qw(redefine misc);

unless(defined(&_SYS__ATOMIC_SUBWORD_H_)) {
    eval 'sub _SYS__ATOMIC_SUBWORD_H_ () {1;}' unless defined(&_SYS__ATOMIC_SUBWORD_H_);
    unless(defined(&_MACHINE_ATOMIC_H_)) {
	die("do\ not\ include\ this\ header\,\ use\ machine\/atomic\.h");
    }
    require 'machine/endian.ph';
    unless(defined(&_KERNEL)) {
	require 'stdbool.ph';
    }
    unless(defined(&NBBY)) {
	eval 'sub NBBY () {8;}' unless defined(&NBBY);
    }
    eval 'sub _ATOMIC_WORD_ALIGNED {
        my($p) = @_;
	    eval q(( &uint32_t *)(( &__uintptr_t)($p) - (( &__uintptr_t)($p) % 4)));
    }' unless defined(&_ATOMIC_WORD_ALIGNED);
    if((defined(&_BYTE_ORDER) ? &_BYTE_ORDER : undef) == (defined(&_BIG_ENDIAN) ? &_BIG_ENDIAN : undef)) {
	eval 'sub _ATOMIC_BYTE_SHIFT {
	    my($p) = @_;
    	    eval q(((3- (( &__uintptr_t)($p) % 4)) *  &NBBY));
	}' unless defined(&_ATOMIC_BYTE_SHIFT);
	eval 'sub _ATOMIC_HWORD_SHIFT {
	    my($p) = @_;
    	    eval q(((2- (( &__uintptr_t)($p) % 4)) *  &NBBY));
	}' unless defined(&_ATOMIC_HWORD_SHIFT);
    } else {
	eval 'sub _ATOMIC_BYTE_SHIFT {
	    my($p) = @_;
    	    eval q((((( &__uintptr_t)($p) % 4)) *  &NBBY));
	}' unless defined(&_ATOMIC_BYTE_SHIFT);
	eval 'sub _ATOMIC_HWORD_SHIFT {
	    my($p) = @_;
    	    eval q((((( &__uintptr_t)($p) % 4)) *  &NBBY));
	}' unless defined(&_ATOMIC_HWORD_SHIFT);
    }
    unless(defined(&_atomic_cmpset_masked_word)) {
    }
    unless(defined(&_atomic_fcmpset_masked_word)) {
	eval 'sub _atomic_fcmpset_masked_word {
	    my($addr,$old,$val,$mask) = @_;
    	    eval q({ *$old = (*$addr & ~$mask) | *$old; ( &atomic_fcmpset_32($addr, $old, (*$old & ~$mask) | $val)); });
	}' unless defined(&_atomic_fcmpset_masked_word);
    }
    unless(defined(&atomic_cmpset_8)) {
	eval 'sub atomic_cmpset_8 {
	    my($addr,$old,$val) = @_;
    	    eval q({ \'int\'  &shift;  &shift =  &_ATOMIC_BYTE_SHIFT($addr); ( &_atomic_cmpset_masked_word( &_ATOMIC_WORD_ALIGNED($addr), $old <<  &shift, $val <<  &shift, 0xff <<  &shift)); });
	}' unless defined(&atomic_cmpset_8);
    }
    unless(defined(&atomic_fcmpset_8)) {
	eval 'sub atomic_fcmpset_8 {
	    my($addr,$old,$val) = @_;
    	    eval q({ \'int\'  &ret,  &shift;  &uint32_t  &wold;  &shift =  &_ATOMIC_BYTE_SHIFT($addr);  &wold = *$old <<  &shift;  &ret =  &_atomic_fcmpset_masked_word( &_ATOMIC_WORD_ALIGNED($addr),  &wold, $val <<  &shift, 0xff <<  &shift);  &if ( &ret == 0) *$old = ( &wold >>  &shift) & 0xff; ( &ret); });
	}' unless defined(&atomic_fcmpset_8);
    }
    unless(defined(&atomic_cmpset_16)) {
	eval 'sub atomic_cmpset_16 {
	    my($addr,$old,$val) = @_;
    	    eval q({ \'int\'  &shift;  &shift =  &_ATOMIC_HWORD_SHIFT($addr); ( &_atomic_cmpset_masked_word( &_ATOMIC_WORD_ALIGNED($addr), $old <<  &shift, $val <<  &shift, 0xffff <<  &shift)); });
	}' unless defined(&atomic_cmpset_16);
    }
    unless(defined(&atomic_fcmpset_16)) {
	eval 'sub atomic_fcmpset_16 {
	    my($addr,$old,$val) = @_;
    	    eval q({ \'int\'  &ret,  &shift;  &uint32_t  &wold;  &shift =  &_ATOMIC_HWORD_SHIFT($addr);  &wold = *$old <<  &shift;  &ret =  &_atomic_fcmpset_masked_word( &_ATOMIC_WORD_ALIGNED($addr),  &wold, $val <<  &shift, 0xffff <<  &shift);  &if ( &ret == 0) *$old = ( &wold >>  &shift) & 0xffff; ( &ret); });
	}' unless defined(&atomic_fcmpset_16);
    }
    unless(defined(&atomic_load_acq_8)) {
	eval 'sub atomic_load_acq_8 {
	    my($p) = @_;
    	    eval q({ \'int\'  &shift;  &uint8_t  &ret;  &shift =  &_ATOMIC_BYTE_SHIFT($p);  &ret = ( &atomic_load_acq_32( &_ATOMIC_WORD_ALIGNED($p)) >>  &shift) & 0xff; ( &ret); });
	}' unless defined(&atomic_load_acq_8);
    }
    unless(defined(&atomic_load_acq_16)) {
	eval 'sub atomic_load_acq_16 {
	    my($p) = @_;
    	    eval q({ \'int\'  &shift;  &uint16_t  &ret;  &shift =  &_ATOMIC_HWORD_SHIFT($p);  &ret = ( &atomic_load_acq_32( &_ATOMIC_WORD_ALIGNED($p)) >>  &shift) & 0xffff; ( &ret); });
	}' unless defined(&atomic_load_acq_16);
    }
    undef(&_ATOMIC_WORD_ALIGNED) if defined(&_ATOMIC_WORD_ALIGNED);
    undef(&_ATOMIC_BYTE_SHIFT) if defined(&_ATOMIC_BYTE_SHIFT);
    undef(&_ATOMIC_HWORD_SHIFT) if defined(&_ATOMIC_HWORD_SHIFT);
    unless(defined(&atomic_testandset_acq_long)) {
	eval 'sub atomic_testandset_acq_long {
	    my($p,$v) = @_;
    	    eval q({ my $bit,  &old;  &bool  &ret;  $bit = (1 << ($v % ($sizeof{$p} *  &NBBY)));  &old =  &atomic_load_acq_long($p);  &ret =  &false;  &while (! &ret  && ( &old &  $bit) == 0)  &ret =  &atomic_fcmpset_acq_long($p,  &old,  &old |  $bit); (! &ret); });
	}' unless defined(&atomic_testandset_acq_long);
    }
    unless(defined(&atomic_testandset_long)) {
	eval 'sub atomic_testandset_long {
	    my($p,$v) = @_;
    	    eval q({ my $bit,  &old;  &bool  &ret;  $bit = (1 << ($v % ($sizeof{$p} *  &NBBY)));  &old =  &atomic_load_long($p);  &ret =  &false;  &while (! &ret  && ( &old &  $bit) == 0)  &ret =  &atomic_fcmpset_long($p,  &old,  &old |  $bit); (! &ret); });
	}' unless defined(&atomic_testandset_long);
    }
    unless(defined(&atomic_testandclear_long)) {
	eval 'sub atomic_testandclear_long {
	    my($p,$v) = @_;
    	    eval q({ my $bit,  &old;  &bool  &ret;  $bit = (1 << ($v % ($sizeof{$p} *  &NBBY)));  &old =  &atomic_load_long($p);  &ret =  &false;  &while (! &ret  && ( &old &  $bit) != 0)  &ret =  &atomic_fcmpset_long($p,  &old,  &old & ~ $bit); ( &ret); });
	}' unless defined(&atomic_testandclear_long);
    }
}
1;

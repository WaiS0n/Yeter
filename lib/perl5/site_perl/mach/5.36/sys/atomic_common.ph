require '_h2ph_pre.ph';

no warnings qw(redefine misc);

unless(defined(&_SYS_ATOMIC_COMMON_H_)) {
    eval 'sub _SYS_ATOMIC_COMMON_H_ () {1;}' unless defined(&_SYS_ATOMIC_COMMON_H_);
    unless(defined(&_MACHINE_ATOMIC_H_)) {
	die("do\ not\ include\ this\ header\,\ use\ machine\/atomic\.h");
    }
    require 'sys/types.ph';
    eval 'sub __atomic_load_bool_relaxed {
        my($p) = @_;
	    eval q((*( &volatile  &_Bool *)($p)));
    }' unless defined(&__atomic_load_bool_relaxed);
    eval 'sub __atomic_store_bool_relaxed {
        my($p, $v) = @_;
	    eval q((*( &volatile  &_Bool *)($p) = ( &_Bool)($v)));
    }' unless defined(&__atomic_store_bool_relaxed);
    eval 'sub __atomic_load_char_relaxed {
        my($p) = @_;
	    eval q((*( &volatile \'u_char\' *)($p)));
    }' unless defined(&__atomic_load_char_relaxed);
    eval 'sub __atomic_load_short_relaxed {
        my($p) = @_;
	    eval q((*( &volatile \'u_short\' *)($p)));
    }' unless defined(&__atomic_load_short_relaxed);
    eval 'sub __atomic_load_int_relaxed {
        my($p) = @_;
	    eval q((*( &volatile \'u_int\' *)($p)));
    }' unless defined(&__atomic_load_int_relaxed);
    eval 'sub __atomic_load_long_relaxed {
        my($p) = @_;
	    eval q((*( &volatile \'u_long\' *)($p)));
    }' unless defined(&__atomic_load_long_relaxed);
    eval 'sub __atomic_load_8_relaxed {
        my($p) = @_;
	    eval q((*( &volatile  &uint8_t *)($p)));
    }' unless defined(&__atomic_load_8_relaxed);
    eval 'sub __atomic_load_16_relaxed {
        my($p) = @_;
	    eval q((*( &volatile  &uint16_t *)($p)));
    }' unless defined(&__atomic_load_16_relaxed);
    eval 'sub __atomic_load_32_relaxed {
        my($p) = @_;
	    eval q((*( &volatile  &uint32_t *)($p)));
    }' unless defined(&__atomic_load_32_relaxed);
    eval 'sub __atomic_load_64_relaxed {
        my($p) = @_;
	    eval q((*( &volatile  &uint64_t *)($p)));
    }' unless defined(&__atomic_load_64_relaxed);
    eval 'sub __atomic_store_char_relaxed {
        my($p, $v) = @_;
	    eval q((*( &volatile \'u_char\' *) = ($v)));
    }' unless defined(&__atomic_store_char_relaxed);
    eval 'sub __atomic_store_short_relaxed {
        my($p, $v) = @_;
	    eval q((*( &volatile \'u_short\' *) = ($v)));
    }' unless defined(&__atomic_store_short_relaxed);
    eval 'sub __atomic_store_int_relaxed {
        my($p, $v) = @_;
	    eval q((*( &volatile \'u_int\' *) = ($v)));
    }' unless defined(&__atomic_store_int_relaxed);
    eval 'sub __atomic_store_long_relaxed {
        my($p, $v) = @_;
	    eval q((*( &volatile \'u_long\' *) = ($v)));
    }' unless defined(&__atomic_store_long_relaxed);
    eval 'sub __atomic_store_8_relaxed {
        my($p, $v) = @_;
	    eval q((*( &volatile  &uint8_t *)($p) = ( &uint8_t)($v)));
    }' unless defined(&__atomic_store_8_relaxed);
    eval 'sub __atomic_store_16_relaxed {
        my($p, $v) = @_;
	    eval q((*( &volatile  &uint16_t *)($p) = ( &uint16_t)($v)));
    }' unless defined(&__atomic_store_16_relaxed);
    eval 'sub __atomic_store_32_relaxed {
        my($p, $v) = @_;
	    eval q((*( &volatile  &uint32_t *)($p) = ( &uint32_t)($v)));
    }' unless defined(&__atomic_store_32_relaxed);
    eval 'sub __atomic_store_64_relaxed {
        my($p, $v) = @_;
	    eval q((*( &volatile  &uint64_t *)($p) = ( &uint64_t)($v)));
    }' unless defined(&__atomic_store_64_relaxed);
    if((defined(&__STDC_VERSION__)  && (defined(&__STDC_VERSION__) ? &__STDC_VERSION__ : undef) >= 201112) ||  &__has_extension((defined(&c_generic_selections) ? &c_generic_selections : undef))) {
	eval 'sub atomic_load_bool {
	    my($p) = @_;
    	    eval q( &_Generic(*($p),  &_Bool:  &__atomic_load_bool_relaxed($p)));
	}' unless defined(&atomic_load_bool);
	eval 'sub atomic_store_bool {
	    my($p, $v) = @_;
    	    eval q( &_Generic(*($p),  &_Bool:  &__atomic_store_bool_relaxed($p, $v)));
	}' unless defined(&atomic_store_bool);
	eval 'sub __atomic_load_generic {
	    my($p, $t, $ut, $n) = @_;
    	    eval q( &_Generic(*($p), $t:  &__atomic_load_  $n   &_relaxed($p), $ut:  &__atomic_load_  $n   &_relaxed($p)));
	}' unless defined(&__atomic_load_generic);
	eval 'sub __atomic_store_generic {
	    my($p, $v, $t, $ut, $n) = @_;
    	    eval q( &_Generic(*($p), $t:  &__atomic_store_  $n   &_relaxed($p, $v), $ut:  &__atomic_store_  $n   &_relaxed($p, $v)));
	}' unless defined(&__atomic_store_generic);
    } else {
	eval 'sub atomic_load_bool {
	    my($p) = @_;
    	    eval q( &__atomic_load_bool_relaxed($p));
	}' unless defined(&atomic_load_bool);
	eval 'sub atomic_store_bool {
	    my($p, $v) = @_;
    	    eval q( &__atomic_store_bool_relaxed($p, $v));
	}' unless defined(&atomic_store_bool);
	eval 'sub __atomic_load_generic {
	    my($p, $t, $ut, $n) = @_;
    	    eval q( &__atomic_load_  $n   &_relaxed($p));
	}' unless defined(&__atomic_load_generic);
	eval 'sub __atomic_store_generic {
	    my($p, $v, $t, $ut, $n) = @_;
    	    eval q( &__atomic_store_  $n   &_relaxed($p, $v));
	}' unless defined(&__atomic_store_generic);
    }
    eval 'sub atomic_load_char {
        my($p) = @_;
	    eval q( &__atomic_load_generic($p, \'char\', \'u_char\', \'char\'));
    }' unless defined(&atomic_load_char);
    eval 'sub atomic_load_short {
        my($p) = @_;
	    eval q( &__atomic_load_generic($p, \'short\', \'u_short\', \'short\'));
    }' unless defined(&atomic_load_short);
    eval 'sub atomic_load_int {
        my($p) = @_;
	    eval q( &__atomic_load_generic($p, \'int\', \'u_int\', \'int\'));
    }' unless defined(&atomic_load_int);
    eval 'sub atomic_load_long {
        my($p) = @_;
	    eval q( &__atomic_load_generic($p, \'long\', \'u_long\', \'long\'));
    }' unless defined(&atomic_load_long);
    eval 'sub atomic_load_8 {
        my($p) = @_;
	    eval q( &__atomic_load_generic($p,  &int8_t,  &uint8_t, 8));
    }' unless defined(&atomic_load_8);
    eval 'sub atomic_load_16 {
        my($p) = @_;
	    eval q( &__atomic_load_generic($p,  &int16_t,  &uint16_t, 16));
    }' unless defined(&atomic_load_16);
    eval 'sub atomic_load_32 {
        my($p) = @_;
	    eval q( &__atomic_load_generic($p,  &int32_t,  &uint32_t, 32));
    }' unless defined(&atomic_load_32);
    if(defined(&__LP64__)) {
	eval 'sub atomic_load_64 {
	    my($p) = @_;
    	    eval q( &__atomic_load_generic($p,  &int64_t,  &uint64_t, 64));
	}' unless defined(&atomic_load_64);
    }
    eval 'sub atomic_store_char {
        my($p, $v) = @_;
	    eval q( &__atomic_store_generic($p, $v, \'char\', \'u_char\', \'char\'));
    }' unless defined(&atomic_store_char);
    eval 'sub atomic_store_short {
        my($p, $v) = @_;
	    eval q( &__atomic_store_generic($p, $v, \'short\', \'u_short\', \'short\'));
    }' unless defined(&atomic_store_short);
    eval 'sub atomic_store_int {
        my($p, $v) = @_;
	    eval q( &__atomic_store_generic($p, $v, \'int\', \'u_int\', \'int\'));
    }' unless defined(&atomic_store_int);
    eval 'sub atomic_store_long {
        my($p, $v) = @_;
	    eval q( &__atomic_store_generic($p, $v, \'long\', \'u_long\', \'long\'));
    }' unless defined(&atomic_store_long);
    eval 'sub atomic_store_8 {
        my($p, $v) = @_;
	    eval q( &__atomic_store_generic($p, $v,  &int8_t,  &uint8_t, 8));
    }' unless defined(&atomic_store_8);
    eval 'sub atomic_store_16 {
        my($p, $v) = @_;
	    eval q( &__atomic_store_generic($p, $v,  &int16_t,  &uint16_t, 16));
    }' unless defined(&atomic_store_16);
    eval 'sub atomic_store_32 {
        my($p, $v) = @_;
	    eval q( &__atomic_store_generic($p, $v,  &int32_t,  &uint32_t, 32));
    }' unless defined(&atomic_store_32);
    if(defined(&__LP64__)) {
	eval 'sub atomic_store_64 {
	    my($p, $v) = @_;
    	    eval q( &__atomic_store_generic($p, $v,  &int64_t,  &uint64_t, 64));
	}' unless defined(&atomic_store_64);
    }
    eval 'sub atomic_load_ptr {
        my($p) = @_;
	    eval q((*( &volatile  &__typeof(*$p) *)($p)));
    }' unless defined(&atomic_load_ptr);
    eval 'sub atomic_store_ptr {
        my($p, $v) = @_;
	    eval q((*( &volatile  &__typeof(*$p) *)($p) = ($v)));
    }' unless defined(&atomic_store_ptr);
    eval 'sub atomic_load_consume_ptr {
        my($p) = @_;
	    eval q((( &__typeof(*$p))  &atomic_load_acq_ptr(( &uintptr_t *)$p)));
    }' unless defined(&atomic_load_consume_ptr);
    eval 'sub atomic_interrupt_fence () {
        eval q( &__compiler_membar());
    }' unless defined(&atomic_interrupt_fence);
}
1;

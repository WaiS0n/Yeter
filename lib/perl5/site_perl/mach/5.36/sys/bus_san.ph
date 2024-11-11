require '_h2ph_pre.ph';

no warnings qw(redefine misc);

unless(defined(&_SYS_BUS_SAN_H_)) {
    eval 'sub _SYS_BUS_SAN_H_ () {1;}' unless defined(&_SYS_BUS_SAN_H_);
    unless(defined(&_MACHINE_BUS_H_)) {
	die("do\ not\ include\ this\ header\,\ use\ machine\/bus\.h");
    }
    eval 'sub BUS_SAN_MULTI {
        my($sp, $rw, $width, $type) = @_;
	    eval q( &void $sp &_bus_space_$rw &_multi_$width( &bus_space_tag_t,  &bus_space_handle_t,  &bus_size_t, $type *,  &bus_size_t);  &void $sp &_bus_space_$rw &_multi_stream_$width( &bus_space_tag_t,  &bus_space_handle_t,  &bus_size_t, $type *,  &bus_size_t);  &void $sp &_bus_space_$rw &_region_$width( &bus_space_tag_t,  &bus_space_handle_t,  &bus_size_t, $type *,  &bus_size_t);  &void $sp &_bus_space_$rw &_region_stream_$width( &bus_space_tag_t,  &bus_space_handle_t,  &bus_size_t, $type *,  &bus_size_t));
    }' unless defined(&BUS_SAN_MULTI);
    eval 'sub BUS_SAN_READ {
        my($sp, $width, $type) = @_;
	    eval q($type $sp &_bus_space_read_$width( &bus_space_tag_t,  &bus_space_handle_t,  &bus_size_t); $type $sp &_bus_space_read_stream_$width( &bus_space_tag_t,  &bus_space_handle_t,  &bus_size_t);  &BUS_SAN_MULTI($sp,  &read, $width, $type));
    }' unless defined(&BUS_SAN_READ);
    eval 'sub BUS_SAN_WRITE {
        my($sp, $width, $type) = @_;
	    eval q( &void $sp &_bus_space_write_$width( &bus_space_tag_t,  &bus_space_handle_t,  &bus_size_t, $type);  &void $sp &_bus_space_write_stream_$width( &bus_space_tag_t,  &bus_space_handle_t,  &bus_size_t, $type);  &BUS_SAN_MULTI($sp,  &write, $width,  &const $type));
    }' unless defined(&BUS_SAN_WRITE);
    eval 'sub BUS_SAN_SET {
        my($sp, $width, $type) = @_;
	    eval q( &void $sp &_bus_space_set_multi_$width( &bus_space_tag_t,  &bus_space_handle_t,  &bus_size_t, $type,  &bus_size_t);  &void $sp &_bus_space_set_multi_stream_$width( &bus_space_tag_t,  &bus_space_handle_t,  &bus_size_t, $type,  &bus_size_t);  &void $sp &_bus_space_set_region_$width( &bus_space_tag_t,  &bus_space_handle_t,  &bus_size_t, $type,  &bus_size_t);  &void $sp &_bus_space_set_region_stream_$width( &bus_space_tag_t,  &bus_space_handle_t,  &bus_size_t, $type,  &bus_size_t));
    }' unless defined(&BUS_SAN_SET);
    eval 'sub BUS_SAN_COPY {
        my($sp, $width, $type) = @_;
	    eval q( &void $sp &_bus_space_copy_region_$width( &bus_space_tag_t,  &bus_space_handle_t,  &bus_size_t,  &bus_space_handle_t,  &bus_size_t,  &bus_size_t);  &void $sp &_bus_space_copy_region_stream_$width( &bus_space_tag_t,  &bus_space_handle_t,  &bus_size_t,  &bus_space_handle_t,  &bus_size_t,  &bus_size_t););
    }' unless defined(&BUS_SAN_COPY);
    eval 'sub BUS_SAN_PEEK {
        my($sp, $width, $type) = @_;
	    eval q(\'int\' $sp &_bus_space_peek_$width( &bus_space_tag_t,  &bus_space_handle_t,  &bus_size_t, $type *););
    }' unless defined(&BUS_SAN_PEEK);
    eval 'sub BUS_SAN_POKE {
        my($sp, $width, $type) = @_;
	    eval q(\'int\' $sp &_bus_space_poke_$width( &bus_space_tag_t,  &bus_space_handle_t,  &bus_size_t, $type););
    }' unless defined(&BUS_SAN_POKE);
    eval 'sub _BUS_SAN_MISC {
        my($sp) = @_;
	    eval q(\'int\' $sp &_bus_space_map( &bus_space_tag_t,  &bus_addr_t,  &bus_size_t, \'int\',  &bus_space_handle_t *);  &void $sp &_bus_space_unmap( &bus_space_tag_t,  &bus_space_handle_t,  &bus_size_t); \'int\' $sp &_bus_space_subregion( &bus_space_tag_t,  &bus_space_handle_t,  &bus_size_t,  &bus_size_t,  &bus_space_handle_t *); \'int\' $sp &_bus_space_alloc( &bus_space_tag_t,  &bus_addr_t,  &bus_addr_t,  &bus_size_t,  &bus_size_t,  &bus_size_t, \'int\',  &bus_addr_t *,  &bus_space_handle_t *);  &void $sp &_bus_space_free( &bus_space_tag_t,  &bus_space_handle_t,  &bus_size_t);  &void $sp &_bus_space_barrier( &bus_space_tag_t,  &bus_space_handle_t,  &bus_size_t,  &bus_size_t, \'int\'););
    }' unless defined(&_BUS_SAN_MISC);
    eval 'sub BUS_SAN_MISC {
        my($sp) = @_;
	    eval q( &_BUS_SAN_MISC($sp));
    }' unless defined(&BUS_SAN_MISC);
    eval 'sub _BUS_SAN_FUNCS {
        my($sp, $width, $type) = @_;
	    eval q( &BUS_SAN_READ($sp, $width, $type);  &BUS_SAN_WRITE($sp, $width, $type);  &BUS_SAN_SET($sp, $width, $type);  &BUS_SAN_COPY($sp, $width, $type)  &BUS_SAN_PEEK($sp, $width, $type);  &BUS_SAN_POKE($sp, $width, $type));
    }' unless defined(&_BUS_SAN_FUNCS);
    eval 'sub BUS_SAN_FUNCS {
        my($width, $type) = @_;
	    eval q( &_BUS_SAN_FUNCS( &SAN_INTERCEPTOR_PREFIX, $width, $type));
    }' unless defined(&BUS_SAN_FUNCS);
    unless(defined(&SAN_RUNTIME)) {
	eval 'sub BUS_SAN {
	    my($func) = @_;
    	    eval q( &__CONCAT( &SAN_INTERCEPTOR_PREFIX,  &__CONCAT( &_bus_space_, $func)));
	}' unless defined(&BUS_SAN);
	eval 'sub bus_space_map () { &BUS_SAN( &map);}' unless defined(&bus_space_map);
	eval 'sub bus_space_unmap () { &BUS_SAN( &unmap);}' unless defined(&bus_space_unmap);
	eval 'sub bus_space_subregion () { &BUS_SAN( &subregion);}' unless defined(&bus_space_subregion);
	eval 'sub bus_space_alloc () { &BUS_SAN( &alloc);}' unless defined(&bus_space_alloc);
	eval 'sub bus_space_free () { &BUS_SAN( &free);}' unless defined(&bus_space_free);
	eval 'sub bus_space_barrier () { &BUS_SAN( &barrier);}' unless defined(&bus_space_barrier);
	eval 'sub bus_space_read_1 () { &BUS_SAN( &read_1);}' unless defined(&bus_space_read_1);
	eval 'sub bus_space_read_stream_1 () { &BUS_SAN( &read_stream_1);}' unless defined(&bus_space_read_stream_1);
	eval 'sub bus_space_read_multi_1 () { &BUS_SAN( &read_multi_1);}' unless defined(&bus_space_read_multi_1);
	eval 'sub bus_space_read_multi_stream_1 () { &BUS_SAN( &read_multi_stream_1);}' unless defined(&bus_space_read_multi_stream_1);
	eval 'sub bus_space_read_region_1 () { &BUS_SAN( &read_region_1);}' unless defined(&bus_space_read_region_1);
	eval 'sub bus_space_read_region_stream_1 () { &BUS_SAN( &read_region_stream_1);}' unless defined(&bus_space_read_region_stream_1);
	eval 'sub bus_space_write_1 () { &BUS_SAN( &write_1);}' unless defined(&bus_space_write_1);
	eval 'sub bus_space_write_stream_1 () { &BUS_SAN( &write_stream_1);}' unless defined(&bus_space_write_stream_1);
	eval 'sub bus_space_write_multi_1 () { &BUS_SAN( &write_multi_1);}' unless defined(&bus_space_write_multi_1);
	eval 'sub bus_space_write_multi_stream_1 () { &BUS_SAN( &write_multi_stream_1);}' unless defined(&bus_space_write_multi_stream_1);
	eval 'sub bus_space_write_region_1 () { &BUS_SAN( &write_region_1);}' unless defined(&bus_space_write_region_1);
	eval 'sub bus_space_write_region_stream_1 () { &BUS_SAN( &write_region_stream_1);}' unless defined(&bus_space_write_region_stream_1);
	eval 'sub bus_space_set_multi_1 () { &BUS_SAN( &set_multi_1);}' unless defined(&bus_space_set_multi_1);
	eval 'sub bus_space_set_multi_stream_1 () { &BUS_SAN( &set_multi_stream_1);}' unless defined(&bus_space_set_multi_stream_1);
	eval 'sub bus_space_set_region_1 () { &BUS_SAN( &set_region_1);}' unless defined(&bus_space_set_region_1);
	eval 'sub bus_space_set_region_stream_1 () { &BUS_SAN( &set_region_stream_1);}' unless defined(&bus_space_set_region_stream_1);
	eval 'sub bus_space_copy_multi_1 () { &BUS_SAN( &copy_multi_1);}' unless defined(&bus_space_copy_multi_1);
	eval 'sub bus_space_copy_multi_stream_1 () { &BUS_SAN( &copy_multi_stream_1);}' unless defined(&bus_space_copy_multi_stream_1);
	eval 'sub bus_space_poke_1 () { &BUS_SAN( &poke_1);}' unless defined(&bus_space_poke_1);
	eval 'sub bus_space_peek_1 () { &BUS_SAN( &peek_1);}' unless defined(&bus_space_peek_1);
	eval 'sub bus_space_read_2 () { &BUS_SAN( &read_2);}' unless defined(&bus_space_read_2);
	eval 'sub bus_space_read_stream_2 () { &BUS_SAN( &read_stream_2);}' unless defined(&bus_space_read_stream_2);
	eval 'sub bus_space_read_multi_2 () { &BUS_SAN( &read_multi_2);}' unless defined(&bus_space_read_multi_2);
	eval 'sub bus_space_read_multi_stream_2 () { &BUS_SAN( &read_multi_stream_2);}' unless defined(&bus_space_read_multi_stream_2);
	eval 'sub bus_space_read_region_2 () { &BUS_SAN( &read_region_2);}' unless defined(&bus_space_read_region_2);
	eval 'sub bus_space_read_region_stream_2 () { &BUS_SAN( &read_region_stream_2);}' unless defined(&bus_space_read_region_stream_2);
	eval 'sub bus_space_write_2 () { &BUS_SAN( &write_2);}' unless defined(&bus_space_write_2);
	eval 'sub bus_space_write_stream_2 () { &BUS_SAN( &write_stream_2);}' unless defined(&bus_space_write_stream_2);
	eval 'sub bus_space_write_multi_2 () { &BUS_SAN( &write_multi_2);}' unless defined(&bus_space_write_multi_2);
	eval 'sub bus_space_write_multi_stream_2 () { &BUS_SAN( &write_multi_stream_2);}' unless defined(&bus_space_write_multi_stream_2);
	eval 'sub bus_space_write_region_2 () { &BUS_SAN( &write_region_2);}' unless defined(&bus_space_write_region_2);
	eval 'sub bus_space_write_region_stream_2 () { &BUS_SAN( &write_region_stream_2);}' unless defined(&bus_space_write_region_stream_2);
	eval 'sub bus_space_set_multi_2 () { &BUS_SAN( &set_multi_2);}' unless defined(&bus_space_set_multi_2);
	eval 'sub bus_space_set_multi_stream_2 () { &BUS_SAN( &set_multi_stream_2);}' unless defined(&bus_space_set_multi_stream_2);
	eval 'sub bus_space_set_region_2 () { &BUS_SAN( &set_region_2);}' unless defined(&bus_space_set_region_2);
	eval 'sub bus_space_set_region_stream_2 () { &BUS_SAN( &set_region_stream_2);}' unless defined(&bus_space_set_region_stream_2);
	eval 'sub bus_space_copy_multi_2 () { &BUS_SAN( &copy_multi_2);}' unless defined(&bus_space_copy_multi_2);
	eval 'sub bus_space_copy_multi_stream_2 () { &BUS_SAN( &copy_multi_stream_2);}' unless defined(&bus_space_copy_multi_stream_2);
	eval 'sub bus_space_poke_2 () { &BUS_SAN( &poke_2);}' unless defined(&bus_space_poke_2);
	eval 'sub bus_space_peek_2 () { &BUS_SAN( &peek_2);}' unless defined(&bus_space_peek_2);
	eval 'sub bus_space_read_4 () { &BUS_SAN( &read_4);}' unless defined(&bus_space_read_4);
	eval 'sub bus_space_read_stream_4 () { &BUS_SAN( &read_stream_4);}' unless defined(&bus_space_read_stream_4);
	eval 'sub bus_space_read_multi_4 () { &BUS_SAN( &read_multi_4);}' unless defined(&bus_space_read_multi_4);
	eval 'sub bus_space_read_multi_stream_4 () { &BUS_SAN( &read_multi_stream_4);}' unless defined(&bus_space_read_multi_stream_4);
	eval 'sub bus_space_read_region_4 () { &BUS_SAN( &read_region_4);}' unless defined(&bus_space_read_region_4);
	eval 'sub bus_space_read_region_stream_4 () { &BUS_SAN( &read_region_stream_4);}' unless defined(&bus_space_read_region_stream_4);
	eval 'sub bus_space_write_4 () { &BUS_SAN( &write_4);}' unless defined(&bus_space_write_4);
	eval 'sub bus_space_write_stream_4 () { &BUS_SAN( &write_stream_4);}' unless defined(&bus_space_write_stream_4);
	eval 'sub bus_space_write_multi_4 () { &BUS_SAN( &write_multi_4);}' unless defined(&bus_space_write_multi_4);
	eval 'sub bus_space_write_multi_stream_4 () { &BUS_SAN( &write_multi_stream_4);}' unless defined(&bus_space_write_multi_stream_4);
	eval 'sub bus_space_write_region_4 () { &BUS_SAN( &write_region_4);}' unless defined(&bus_space_write_region_4);
	eval 'sub bus_space_write_region_stream_4 () { &BUS_SAN( &write_region_stream_4);}' unless defined(&bus_space_write_region_stream_4);
	eval 'sub bus_space_set_multi_4 () { &BUS_SAN( &set_multi_4);}' unless defined(&bus_space_set_multi_4);
	eval 'sub bus_space_set_multi_stream_4 () { &BUS_SAN( &set_multi_stream_4);}' unless defined(&bus_space_set_multi_stream_4);
	eval 'sub bus_space_set_region_4 () { &BUS_SAN( &set_region_4);}' unless defined(&bus_space_set_region_4);
	eval 'sub bus_space_set_region_stream_4 () { &BUS_SAN( &set_region_stream_4);}' unless defined(&bus_space_set_region_stream_4);
	eval 'sub bus_space_copy_multi_4 () { &BUS_SAN( &copy_multi_4);}' unless defined(&bus_space_copy_multi_4);
	eval 'sub bus_space_copy_multi_stream_4 () { &BUS_SAN( &copy_multi_stream_4);}' unless defined(&bus_space_copy_multi_stream_4);
	eval 'sub bus_space_poke_4 () { &BUS_SAN( &poke_4);}' unless defined(&bus_space_poke_4);
	eval 'sub bus_space_peek_4 () { &BUS_SAN( &peek_4);}' unless defined(&bus_space_peek_4);
	eval 'sub bus_space_read_8 () { &BUS_SAN( &read_8);}' unless defined(&bus_space_read_8);
	eval 'sub bus_space_read_stream_8 () { &BUS_SAN( &read_stream_8);}' unless defined(&bus_space_read_stream_8);
	eval 'sub bus_space_read_multi_8 () { &BUS_SAN( &read_multi_8);}' unless defined(&bus_space_read_multi_8);
	eval 'sub bus_space_read_multi_stream_8 () { &BUS_SAN( &read_multi_stream_8);}' unless defined(&bus_space_read_multi_stream_8);
	eval 'sub bus_space_read_region_8 () { &BUS_SAN( &read_region_8);}' unless defined(&bus_space_read_region_8);
	eval 'sub bus_space_read_region_stream_8 () { &BUS_SAN( &read_region_stream_8);}' unless defined(&bus_space_read_region_stream_8);
	eval 'sub bus_space_write_8 () { &BUS_SAN( &write_8);}' unless defined(&bus_space_write_8);
	eval 'sub bus_space_write_stream_8 () { &BUS_SAN( &write_stream_8);}' unless defined(&bus_space_write_stream_8);
	eval 'sub bus_space_write_multi_8 () { &BUS_SAN( &write_multi_8);}' unless defined(&bus_space_write_multi_8);
	eval 'sub bus_space_write_multi_stream_8 () { &BUS_SAN( &write_multi_stream_8);}' unless defined(&bus_space_write_multi_stream_8);
	eval 'sub bus_space_write_region_8 () { &BUS_SAN( &write_region_8);}' unless defined(&bus_space_write_region_8);
	eval 'sub bus_space_write_region_stream_8 () { &BUS_SAN( &write_region_stream_8);}' unless defined(&bus_space_write_region_stream_8);
	eval 'sub bus_space_set_multi_8 () { &BUS_SAN( &set_multi_8);}' unless defined(&bus_space_set_multi_8);
	eval 'sub bus_space_set_multi_stream_8 () { &BUS_SAN( &set_multi_stream_8);}' unless defined(&bus_space_set_multi_stream_8);
	eval 'sub bus_space_set_region_8 () { &BUS_SAN( &set_region_8);}' unless defined(&bus_space_set_region_8);
	eval 'sub bus_space_set_region_stream_8 () { &BUS_SAN( &set_region_stream_8);}' unless defined(&bus_space_set_region_stream_8);
	eval 'sub bus_space_copy_multi_8 () { &BUS_SAN( &copy_multi_8);}' unless defined(&bus_space_copy_multi_8);
	eval 'sub bus_space_copy_multi_stream_8 () { &BUS_SAN( &copy_multi_stream_8);}' unless defined(&bus_space_copy_multi_stream_8);
	eval 'sub bus_space_poke_8 () { &BUS_SAN( &poke_8);}' unless defined(&bus_space_poke_8);
	eval 'sub bus_space_peek_8 () { &BUS_SAN( &peek_8);}' unless defined(&bus_space_peek_8);
    }
}
1;

require '_h2ph_pre.ph';

no warnings qw(redefine misc);

unless(defined(&_SYS_BITSTRING_H_)) {
    eval 'sub _SYS_BITSTRING_H_ () {1;}' unless defined(&_SYS_BITSTRING_H_);
    if(defined(&_KERNEL)) {
	require 'sys/libkern.ph';
	require 'sys/malloc.ph';
    }
    require 'sys/types.ph';
    eval 'sub _BITSTR_MASK () {(~0);}' unless defined(&_BITSTR_MASK);
    eval 'sub _BITSTR_BITS () {($sizeof{ &bitstr_t} * 8);}' unless defined(&_BITSTR_BITS);
    eval 'sub _bit_roundup2 {
        my($x, $y) = @_;
	    eval q((( + - 1) & ~(($y) - 1)));
    }' unless defined(&_bit_roundup2);
    eval 'sub _bit_make_mask {
        my($_start,$_stop) = @_;
	    eval q({ (( &_BITSTR_MASK <<  &_bit_offset($_start)) & ( &_BITSTR_MASK >> ( &_BITSTR_BITS -  &_bit_offset($_stop) - 1))); });
    }' unless defined(&_bit_make_mask);
    eval 'sub bitstr_size {
        my($_nbits) = @_;
	    eval q(( &_bit_roundup2(($_nbits),  &_BITSTR_BITS) / 8));
    }' unless defined(&bitstr_size);
    if(defined(&_KERNEL)) {
	eval 'sub bit_alloc {
	    my($_nbits,$type,$flags) = @_;
    	    eval q({ (( &bitstr_t *) &malloc( &bitstr_size($_nbits), $type, $flags |  &M_ZERO)); });
	}' unless defined(&bit_alloc);
    } else {
	eval 'sub bit_alloc {
	    my($_nbits) = @_;
    	    eval q({ (( &bitstr_t *) &calloc( &bitstr_size($_nbits), 1)); });
	}' unless defined(&bit_alloc);
    }
    eval 'sub bit_decl {
        my($name, $nbits) = @_;
	    eval q((($name)[ &bitstr_size($nbits) / $sizeof{ &bitstr_t}]));
    }' unless defined(&bit_decl);
    eval 'sub bit_ff_at {
        my($_bitstr, $_start, $_nbits, $_match, $_resultp) = @_;
	    eval q(*($_resultp) =  &bit_ff_at_(($_bitstr), ($_start), ($_nbits), ($_match)));
    }' unless defined(&bit_ff_at);
    eval 'sub bit_ffs_at {
        my($_bitstr, $_start, $_nbits, $_resultp) = @_;
	    eval q(*($_resultp) =  &bit_ff_at_(($_bitstr), ($_start), ($_nbits), 1));
    }' unless defined(&bit_ffs_at);
    eval 'sub bit_ffc_at {
        my($_bitstr, $_start, $_nbits, $_resultp) = @_;
	    eval q(*($_resultp) =  &bit_ff_at_(($_bitstr), ($_start), ($_nbits), 0));
    }' unless defined(&bit_ffc_at);
    eval 'sub bit_ffs {
        my($_bitstr, $_nbits, $_resultp) = @_;
	    eval q(*($_resultp) =  &bit_ff_at_(($_bitstr), 0, ($_nbits), 1));
    }' unless defined(&bit_ffs);
    eval 'sub bit_ffc {
        my($_bitstr, $_nbits, $_resultp) = @_;
	    eval q(*($_resultp) =  &bit_ff_at_(($_bitstr), 0, ($_nbits), 0));
    }' unless defined(&bit_ffc);
    eval 'sub bit_ff_area_at {
        my($_bitstr, $_start, $_nbits, $_size, $_match, $_resultp) = @_;
	    eval q(*($_resultp) =  &bit_ff_area_at_($_bitstr, $_start, $_nbits, $_size, $_match););
    }' unless defined(&bit_ff_area_at);
    eval 'sub bit_ffs_area_at {
        my($_bitstr, $_start, $_nbits, $_size, $_resultp) = @_;
	    eval q(*($_resultp) =  &bit_ff_area_at_(($_bitstr), ($_start), ($_nbits), ($_size), 1));
    }' unless defined(&bit_ffs_area_at);
    eval 'sub bit_ffc_area_at {
        my($_bitstr, $_start, $_nbits, $_size, $_resultp) = @_;
	    eval q(*($_resultp) =  &bit_ff_area_at_(($_bitstr), ($_start), ($_nbits), ($_size), 0));
    }' unless defined(&bit_ffc_area_at);
    eval 'sub bit_ffs_area {
        my($_bitstr, $_nbits, $_size, $_resultp) = @_;
	    eval q(*($_resultp) =  &bit_ff_area_at_(($_bitstr), 0, ($_nbits), ($_size), 1));
    }' unless defined(&bit_ffs_area);
    eval 'sub bit_ffc_area {
        my($_bitstr, $_nbits, $_size, $_resultp) = @_;
	    eval q(*($_resultp) =  &bit_ff_area_at_(($_bitstr), 0, ($_nbits), ($_size), 0));
    }' unless defined(&bit_ffc_area);
    eval 'sub bit_count {
        my($_bitstr, $_start, $_nbits, $_resultp) = @_;
	    eval q(*($_resultp) =  &bit_count_(($_bitstr), ($_start), ($_nbits)));
    }' unless defined(&bit_count);
    eval 'sub bit_foreach_at {
        my($_bitstr, $_start, $_nbits, $_iter) = @_;
	    eval q( &for (($_iter) =  &bit_ff_at_(($_bitstr), ($_start), ($_nbits), 1); ($_iter) != -1; ($_iter) =  &bit_ff_at_(($_bitstr), ($_iter) + 1, ($_nbits), 1)));
    }' unless defined(&bit_foreach_at);
    eval 'sub bit_foreach {
        my($_bitstr, $_nbits, $_iter) = @_;
	    eval q( &bit_foreach_at($_bitstr, 0, $_nbits, $_iter));
    }' unless defined(&bit_foreach);
    eval 'sub bit_foreach_unset_at {
        my($_bitstr, $_start, $_nbits, $_iter) = @_;
	    eval q( &for (($_iter) =  &bit_ff_at_(($_bitstr), ($_start), ($_nbits), 0); ($_iter) != -1; ($_iter) =  &bit_ff_at_(($_bitstr), ($_iter) + 1, ($_nbits), 0)));
    }' unless defined(&bit_foreach_unset_at);
    eval 'sub bit_foreach_unset {
        my($_bitstr, $_nbits, $_iter) = @_;
	    eval q( &bit_foreach_unset_at($_bitstr, 0, $_nbits, $_iter));
    }' unless defined(&bit_foreach_unset);
}
1;

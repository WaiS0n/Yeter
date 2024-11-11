require '_h2ph_pre.ph';

no warnings qw(redefine misc);

unless(defined(&_SYS_REG_H_)) {
    eval 'sub _SYS_REG_H_ () {1;}' unless defined(&_SYS_REG_H_);
    require 'machine/reg.ph';
    if(defined(&_KERNEL)) {
	require 'sys/linker_set.ph';
	if(defined(&__ELF_WORD_SIZE)) {
	    eval 'sub ELF_REGSET {
	        my($_regset) = @_;
    		eval q( &DATA_SET( &__elfN( &regset), $_regset));
	    }' unless defined(&ELF_REGSET);
	}
	if(defined(&COMPAT_FREEBSD32)) {
	    eval 'sub ELF32_REGSET {
	        my($_regset) = @_;
    		eval q( &DATA_SET( &elf32_regset, $_regset));
	    }' unless defined(&ELF32_REGSET);
	}
	if(defined(&COMPAT_FREEBSD32)) {
	    unless(defined(&fill_fpregs32)) {
	    }
	    unless(defined(&set_fpregs32)) {
	    }
	    unless(defined(&fill_dbregs32)) {
	    }
	    unless(defined(&set_dbregs32)) {
	    }
	}
    }
}
1;

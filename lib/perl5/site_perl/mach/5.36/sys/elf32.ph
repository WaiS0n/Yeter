require '_h2ph_pre.ph';

no warnings qw(redefine misc);

unless(defined(&_SYS_ELF32_H_)) {
    eval 'sub _SYS_ELF32_H_ () {1;}' unless defined(&_SYS_ELF32_H_);
    require 'sys/elf_common.ph';
    eval 'sub ELF32_R_SYM {
        my($info) = @_;
	    eval q((($info) >> 8));
    }' unless defined(&ELF32_R_SYM);
    eval 'sub ELF32_R_TYPE {
        my($info) = @_;
	    eval q((($info)));
    }' unless defined(&ELF32_R_TYPE);
    eval 'sub ELF32_R_INFO {
        my($sym, $type) = @_;
	    eval q((( << 8) + ($type)));
    }' unless defined(&ELF32_R_INFO);
    eval 'sub ELF32_M_SYM {
        my($info) = @_;
	    eval q((($info)>>8));
    }' unless defined(&ELF32_M_SYM);
    eval 'sub ELF32_M_SIZE {
        my($info) = @_;
	    eval q((($info)));
    }' unless defined(&ELF32_M_SIZE);
    eval 'sub ELF32_M_INFO {
        my($sym, $size) = @_;
	    eval q(((<<8)+($size)));
    }' unless defined(&ELF32_M_INFO);
    eval 'sub ELF32_ST_BIND {
        my($info) = @_;
	    eval q((($info) >> 4));
    }' unless defined(&ELF32_ST_BIND);
    eval 'sub ELF32_ST_TYPE {
        my($info) = @_;
	    eval q((($info) & 0xf));
    }' unless defined(&ELF32_ST_TYPE);
    eval 'sub ELF32_ST_INFO {
        my($bind, $type) = @_;
	    eval q(((($bind) << 4) + (($type) & 0xf)));
    }' unless defined(&ELF32_ST_INFO);
    eval 'sub ELF32_ST_VISIBILITY {
        my($oth) = @_;
	    eval q((($oth) & 0x3));
    }' unless defined(&ELF32_ST_VISIBILITY);
}
1;

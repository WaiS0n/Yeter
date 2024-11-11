require '_h2ph_pre.ph';

no warnings qw(redefine misc);

unless(defined(&_SYS_ELF64_H_)) {
    eval 'sub _SYS_ELF64_H_ () {1;}' unless defined(&_SYS_ELF64_H_);
    require 'sys/elf_common.ph';
    eval 'sub ELF64_R_SYM {
        my($info) = @_;
	    eval q((($info) >> 32));
    }' unless defined(&ELF64_R_SYM);
    eval 'sub ELF64_R_TYPE {
        my($info) = @_;
	    eval q((($info) & 0xffffffff));
    }' unless defined(&ELF64_R_TYPE);
    eval 'sub ELF64_R_INFO {
        my($sym, $type) = @_;
	    eval q(((($sym) << 32) + (($type) & 0xffffffff)));
    }' unless defined(&ELF64_R_INFO);
    eval 'sub ELF64_R_TYPE_DATA {
        my($info) = @_;
	    eval q(((( &Elf64_Xword)($info)<<32)>>40));
    }' unless defined(&ELF64_R_TYPE_DATA);
    eval 'sub ELF64_R_TYPE_ID {
        my($info) = @_;
	    eval q(((( &Elf64_Xword)($info)<<56)>>56));
    }' unless defined(&ELF64_R_TYPE_ID);
    eval 'sub ELF64_R_TYPE_INFO {
        my($data, $type) = @_;
	    eval q(((( &Elf64_Xword)($data)<<8)+( &Elf64_Xword)($type)));
    }' unless defined(&ELF64_R_TYPE_INFO);
    eval 'sub ELF64_M_SYM {
        my($info) = @_;
	    eval q((($info)>>8));
    }' unless defined(&ELF64_M_SYM);
    eval 'sub ELF64_M_SIZE {
        my($info) = @_;
	    eval q((($info)));
    }' unless defined(&ELF64_M_SIZE);
    eval 'sub ELF64_M_INFO {
        my($sym, $size) = @_;
	    eval q(((<<8)+($size)));
    }' unless defined(&ELF64_M_INFO);
    eval 'sub ELF64_ST_BIND {
        my($info) = @_;
	    eval q((($info) >> 4));
    }' unless defined(&ELF64_ST_BIND);
    eval 'sub ELF64_ST_TYPE {
        my($info) = @_;
	    eval q((($info) & 0xf));
    }' unless defined(&ELF64_ST_TYPE);
    eval 'sub ELF64_ST_INFO {
        my($bind, $type) = @_;
	    eval q(((($bind) << 4) + (($type) & 0xf)));
    }' unless defined(&ELF64_ST_INFO);
    eval 'sub ELF64_ST_VISIBILITY {
        my($oth) = @_;
	    eval q((($oth) & 0x3));
    }' unless defined(&ELF64_ST_VISIBILITY);
}
1;

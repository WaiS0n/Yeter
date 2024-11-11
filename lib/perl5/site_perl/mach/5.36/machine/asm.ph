require '_h2ph_pre.ph';

no warnings qw(redefine misc);

if(defined(&__i386__)) {
    require 'i386/asm.ph';
} else {
    unless(defined(&_MACHINE_ASM_H_)) {
	eval 'sub _MACHINE_ASM_H_ () {1;}' unless defined(&_MACHINE_ASM_H_);
	require 'sys/cdefs.ph';
	if(defined(&PIC)) {
	    eval 'sub PIC_PLT {
	        my($x) = @_;
    		eval q($x@ &PLT);
	    }' unless defined(&PIC_PLT);
	    eval 'sub PIC_GOT {
	        my($x) = @_;
    		eval q($x@ &GOTPCREL(% &rip));
	    }' unless defined(&PIC_GOT);
	} else {
	    eval 'sub PIC_PLT {
	        my($x) = @_;
    		eval q($x);
	    }' unless defined(&PIC_PLT);
	}
	eval 'sub CNAME {
	    my($csym) = @_;
    	    eval q($csym);
	}' unless defined(&CNAME);
	eval 'sub HIDENAME {
	    my($asmsym) = @_;
    	    eval q(.$asmsym);
	}' unless defined(&HIDENAME);
	eval 'sub _START_ENTRY () {. &text; . &p2align 4,0x90;}' unless defined(&_START_ENTRY);
	eval 'sub _ENTRY {
	    my($x) = @_;
    	    eval q( &_START_ENTRY; . &globl  &CNAME($x); . &type  &CNAME($x),@ &function;  &CNAME($x):; . &cfi_startproc);
	}' unless defined(&_ENTRY);
	if(defined(&PROF)) {
	    eval 'sub ALTENTRY {
	        my($x) = @_;
    		eval q( &_ENTRY($x);  &pushq % &rbp; . &cfi_def_cfa_offset 16; . &cfi_offset % &rbp, -16;  &movq % &rsp,% &rbp;  &call  &PIC_PLT( &HIDENAME( &mcount));  &popq % &rbp; . &cfi_restore % &rbp; . &cfi_def_cfa_offset 8;  &jmp 9 &f);
	    }' unless defined(&ALTENTRY);
	    eval 'sub ENTRY {
	        my($x) = @_;
    		eval q( &_ENTRY($x);  &pushq % &rbp; . &cfi_def_cfa_offset 16; . &cfi_offset % &rbp, -16;  &movq % &rsp,% &rbp;  &call  &PIC_PLT( &HIDENAME( &mcount));  &popq % &rbp; . &cfi_restore % &rbp; . &cfi_def_cfa_offset 8; 9:);
	    }' unless defined(&ENTRY);
	} else {
	    eval 'sub ALTENTRY {
	        my($x) = @_;
    		eval q( &_ENTRY($x));
	    }' unless defined(&ALTENTRY);
	    eval 'sub ENTRY {
	        my($x) = @_;
    		eval q( &_ENTRY($x));
	    }' unless defined(&ENTRY);
	}
	eval 'sub END {
	    my($x) = @_;
    	    eval q(. &size $x, . - $x; . &cfi_endproc);
	}' unless defined(&END);
	eval 'sub WEAK_REFERENCE {
	    my($sym, $alias) = @_;
    	    eval q(. &weak  &CNAME($alias); . &equ  &CNAME($alias), &CNAME($sym));
	}' unless defined(&WEAK_REFERENCE);
	eval 'sub RCSID {
	    my($x) = @_;
    	    eval q(. &text; . &asciz $x);
	}' unless defined(&RCSID);
	undef(&__FBSDID) if defined(&__FBSDID);
	if(!defined(&STRIP_FBSDID)) {
	    eval 'sub __FBSDID {
	        my($s) = @_;
    		eval q(. &ident $s);
	    }' unless defined(&__FBSDID);
	} else {
	    eval 'sub __FBSDID {
	        my($s) = @_;
    		eval q();
	    }' unless defined(&__FBSDID);
	}
    }
}
1;

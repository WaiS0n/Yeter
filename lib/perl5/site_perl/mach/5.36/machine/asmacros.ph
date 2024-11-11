require '_h2ph_pre.ph';

no warnings qw(redefine misc);

if(defined(&__i386__)) {
    require 'i386/asmacros.ph';
} else {
    unless(defined(&_MACHINE_ASMACROS_H_)) {
	eval 'sub _MACHINE_ASMACROS_H_ () {1;}' unless defined(&_MACHINE_ASMACROS_H_);
	require 'sys/cdefs.ph';
	eval 'sub CNAME {
	    my($csym) = @_;
    	    eval q($csym);
	}' unless defined(&CNAME);
	eval 'sub ALIGN_DATA () {. &p2align 3;}' unless defined(&ALIGN_DATA);
	eval 'sub ALIGN_TEXT () {. &p2align 4,0x90;}' unless defined(&ALIGN_TEXT);
	eval 'sub SUPERALIGN_TEXT () {. &p2align 4,0x90;}' unless defined(&SUPERALIGN_TEXT);
	eval 'sub GEN_ENTRY {
	    my($name) = @_;
    	    eval q( &ALIGN_TEXT; . &globl  &CNAME($name); . &type  &CNAME($name),@ &function;  &CNAME($name):);
	}' unless defined(&GEN_ENTRY);
	eval 'sub ENTRY {
	    my($name) = @_;
    	    eval q( &GEN_ENTRY($name));
	}' unless defined(&ENTRY);
	eval 'sub ALTENTRY {
	    my($name) = @_;
    	    eval q( &GEN_ENTRY($name));
	}' unless defined(&ALTENTRY);
	eval 'sub END {
	    my($name) = @_;
    	    eval q(. &size $name, . - $name);
	}' unless defined(&END);
	eval 'sub PUSH_FRAME_POINTER () { &pushq % &rbp ;  &movq % &rsp, % &rbp ;;}' unless defined(&PUSH_FRAME_POINTER);
	eval 'sub POP_FRAME_POINTER () { &popq % &rbp;}' unless defined(&POP_FRAME_POINTER);
	if(defined(&LOCORE)) {
	    eval 'sub PCPU {
	        my($member) = @_;
    		eval q(% &gs: &PC_  $member);
	    }' unless defined(&PCPU);
	    eval 'sub PCPU_ADDR {
	        my($member, $reg) = @_;
    		eval q( &movq % &gs: &PC_PRVSPACE, $reg ;  &addq $ &PC_  $member, $reg);
	    }' unless defined(&PCPU_ADDR);
	    eval 'sub IDTVEC {
	        my($name) = @_;
    		eval q( &ALIGN_TEXT; . &globl  &__CONCAT( &X,$name); . &type  &__CONCAT( &X,$name),@ &function;  &__CONCAT( &X,$name):);
	    }' unless defined(&IDTVEC);
	    if(defined(&KMSAN)) {
		eval 'sub KMSAN_ENTER () { &callq  &kmsan_intr_enter;}' unless defined(&KMSAN_ENTER);
		eval 'sub KMSAN_LEAVE () { &callq  &kmsan_intr_leave;}' unless defined(&KMSAN_LEAVE);
	    } else {
		eval 'sub KMSAN_ENTER () {1;}' unless defined(&KMSAN_ENTER);
		eval 'sub KMSAN_LEAVE () {1;}' unless defined(&KMSAN_LEAVE);
	    }
	}
	if(defined(&__STDC__)) {
	    eval 'sub ELFNOTE () {( &name,  &type,  &desctype,  &descdata...) . &pushsection . ($note->{name}), "a", @ &note ; . &align 4; .\'long 2f\' - 1 &f ; .\'long 4f\' - 3 &f ; .\'long type\' ; 1:. &asciz  &name ; 2:. &align 4; 3: &desctype  &descdata ; 4:. &align 4; . &popsection;}' unless defined(&ELFNOTE);
	} else {
	    eval 'sub ELFNOTE {
	        my($name, $type, $desctype, $descdata) = @_;
    		eval q(. &pushsection . ($note->{name}), \\"a\\", @ &note ; . &align 4; .\'long 2f\' - 1 &f ; .\'long 4f\' - 3 &f ; .\'long type\' ; 1:. &asciz \\"name\\" ; 2:. &align 4; 3:$desctype $descdata ; 4:. &align 4; . &popsection);
	    }' unless defined(&ELFNOTE);
	}
    }
}
1;

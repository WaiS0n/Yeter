require '_h2ph_pre.ph';

no warnings qw(redefine misc);

unless(defined(&_SYS_IMGACT_ELF_H_)) {
    eval 'sub _SYS_IMGACT_ELF_H_ () {1;}' unless defined(&_SYS_IMGACT_ELF_H_);
    require 'machine/elf.ph';
    if(defined(&_KERNEL)) {
	eval 'sub AUXARGS_ENTRY {
	    my($pos, $id, $val) = @_;
    	    eval q({($pos)-> &a_type = ($id); ($pos)-> ($a_un->{a_val}) = ($val); ($pos)++;});
	}' unless defined(&AUXARGS_ENTRY);
	if((defined(&__LP64__)  && (defined(&__ELF_WORD_SIZE) ? &__ELF_WORD_SIZE : undef) == 32)) {
	    eval 'sub AUXARGS_ENTRY_PTR {
	        my($pos, $id, $ptr) = @_;
    		eval q({($pos)-> &a_type = ($id); ($pos)-> ($a_un->{a_val}) = ( &uintptr_t)($ptr); ($pos)++;});
	    }' unless defined(&AUXARGS_ENTRY_PTR);
	} else {
	    eval 'sub AUXARGS_ENTRY_PTR {
	        my($pos, $id, $ptr) = @_;
    		eval q({($pos)-> &a_type = ($id); ($pos)-> ($a_un->{a_ptr}) = ($ptr); ($pos)++;});
	    }' unless defined(&AUXARGS_ENTRY_PTR);
	}
	eval 'sub BN_CAN_FETCH_OSREL () {0x1;}' unless defined(&BN_CAN_FETCH_OSREL);
	eval 'sub BN_TRANSLATE_OSREL () {0x2;}' unless defined(&BN_TRANSLATE_OSREL);
	eval 'sub BI_CAN_EXEC_DYN () {0x1;}' unless defined(&BI_CAN_EXEC_DYN);
	eval 'sub BI_BRAND_NOTE () {0x2;}' unless defined(&BI_BRAND_NOTE);
	eval 'sub BI_BRAND_NOTE_MANDATORY () {0x4;}' unless defined(&BI_BRAND_NOTE_MANDATORY);
	eval 'sub BI_BRAND_ONLY_STATIC () {0x8;}' unless defined(&BI_BRAND_ONLY_STATIC);
	eval 'sub MAX_BRANDS () {8;}' unless defined(&MAX_BRANDS);
	eval 'sub FREEBSD_ABI_VENDOR () {"FreeBSD";}' unless defined(&FREEBSD_ABI_VENDOR);
	eval 'sub GNU_ABI_VENDOR () {"GNU";}' unless defined(&GNU_ABI_VENDOR);
    }
}
1;

require '_h2ph_pre.ph';

no warnings qw(redefine misc);

unless(defined(&_VMM_SNAPSHOT_)) {
    eval 'sub _VMM_SNAPSHOT_ () {1;}' unless defined(&_VMM_SNAPSHOT_);
    require 'sys/errno.ph';
    require 'sys/types.ph';
    unless(defined(&_KERNEL)) {
	require 'stdbool.ph';
    }
    eval("sub STRUCT_VIOAPIC () { 1; }") unless defined(&STRUCT_VIOAPIC);
    eval("sub STRUCT_VM () { 2; }") unless defined(&STRUCT_VM);
    eval("sub STRUCT_VLAPIC () { 3; }") unless defined(&STRUCT_VLAPIC);
    eval("sub VM_MEM () { 4; }") unless defined(&VM_MEM);
    eval("sub STRUCT_VHPET () { 5; }") unless defined(&STRUCT_VHPET);
    eval("sub STRUCT_VMCX () { 6; }") unless defined(&STRUCT_VMCX);
    eval("sub STRUCT_VATPIC () { 7; }") unless defined(&STRUCT_VATPIC);
    eval("sub STRUCT_VATPIT () { 8; }") unless defined(&STRUCT_VATPIT);
    eval("sub STRUCT_VPMTMR () { 9; }") unless defined(&STRUCT_VPMTMR);
    eval("sub STRUCT_VRTC () { 10; }") unless defined(&STRUCT_VRTC);
    eval("sub VM_SNAPSHOT_SAVE () { 0; }") unless defined(&VM_SNAPSHOT_SAVE);
    eval("sub VM_SNAPSHOT_RESTORE () { 1; }") unless defined(&VM_SNAPSHOT_RESTORE);
    eval 'sub SNAPSHOT_BUF_OR_LEAVE {
        my($DATA, $LEN, $META, $RES, $LABEL) = @_;
	    eval q( &do { ($RES) =  &vm_snapshot_buf(($DATA), ($LEN), ($META));  &if (($RES) != 0) {  &vm_snapshot_buf_err($DATA, ($META)-> &op);  &goto $LABEL; } }  &while (0));
    }' unless defined(&SNAPSHOT_BUF_OR_LEAVE);
    eval 'sub SNAPSHOT_VAR_OR_LEAVE {
        my($DATA, $META, $RES, $LABEL) = @_;
	    eval q( &SNAPSHOT_BUF_OR_LEAVE(($DATA), $sizeof{$DATA}, ($META), ($RES), $LABEL));
    }' unless defined(&SNAPSHOT_VAR_OR_LEAVE);
    unless(defined(&_KERNEL)) {
	eval 'sub SNAPSHOT_BUF_CMP_OR_LEAVE {
	    my($DATA, $LEN, $META, $RES, $LABEL) = @_;
    	    eval q( &do { ($RES) =  &vm_snapshot_buf_cmp(($DATA), ($LEN), ($META));  &if (($RES) != 0) {  &vm_snapshot_buf_err($DATA, ($META)-> &op);  &goto $LABEL; } }  &while (0));
	}' unless defined(&SNAPSHOT_BUF_CMP_OR_LEAVE);
	eval 'sub SNAPSHOT_VAR_CMP_OR_LEAVE {
	    my($DATA, $META, $RES, $LABEL) = @_;
    	    eval q( &SNAPSHOT_BUF_CMP_OR_LEAVE(($DATA), $sizeof{$DATA}, ($META), ($RES), $LABEL));
	}' unless defined(&SNAPSHOT_VAR_CMP_OR_LEAVE);
    }
}
1;

require '_h2ph_pre.ph';

no warnings qw(redefine misc);

unless(defined(&__MACHINE_INTR_MACHDEP_H__)) {
    eval 'sub __MACHINE_INTR_MACHDEP_H__ () {1;}' unless defined(&__MACHINE_INTR_MACHDEP_H__);
    require 'x86/intr_machdep.ph';
    eval 'sub DBLFAULT_STACK_SIZE () { &PAGE_SIZE;}' unless defined(&DBLFAULT_STACK_SIZE);
    eval 'sub NMI_STACK_SIZE () { &PAGE_SIZE;}' unless defined(&NMI_STACK_SIZE);
    eval 'sub MCE_STACK_SIZE () { &PAGE_SIZE;}' unless defined(&MCE_STACK_SIZE);
    eval 'sub DBG_STACK_SIZE () { &PAGE_SIZE;}' unless defined(&DBG_STACK_SIZE);
}
1;

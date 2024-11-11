require '_h2ph_pre.ph';

no warnings qw(redefine misc);

if(defined(&__i386__)) {
    require 'i386/profile.ph';
} else {
    unless(defined(&_MACHINE_PROFILE_H_)) {
	eval 'sub _MACHINE_PROFILE_H_ () {1;}' unless defined(&_MACHINE_PROFILE_H_);
	unless(defined(&_KERNEL)) {
	    require 'sys/cdefs.ph';
	    eval 'sub FUNCTION_ALIGNMENT () {4;}' unless defined(&FUNCTION_ALIGNMENT);
	    eval 'sub _MCOUNT_DECL () { &static  &void  &_mcount( &uintfptr_t  &frompc,  &uintfptr_t  &selfpc)  &__used;  &static  &void  &_mcount;}' unless defined(&_MCOUNT_DECL);
	    eval 'sub MCOUNT () { &__asm("			\\n	.text				\\n	.p2align 4,0x90			\\n	.globl	.mcount			\\n	.type	.mcount,@function	\\n.mcount:				\\n	pushq	%rdi			\\n	pushq	%rsi			\\n	pushq	%rdx			\\n	pushq	%rcx			\\n	pushq	%r8			\\n	pushq	%r9			\\n	pushq	%rax			\\n	movq	8(%rbp),%rdi		\\n	movq	7*8(%rsp),%rsi		\\n	call	_mcount			\\n	popq	%rax			\\n	popq	%r9			\\n	popq	%r8			\\n	popq	%rcx			\\n	popq	%rdx			\\n	popq	%rsi			\\n	popq	%rdi			\\n	ret				\\n	.size	.mcount, . - .mcount");;}' unless defined(&MCOUNT);
	    if(0) {
		eval 'sub MCOUNT () { &void  &mcount() {  &uintfptr_t  &selfpc,  &frompc;  &__asm("movq 8(%%rbp),%0" : "=r" ( &selfpc));  &__asm("movq (%%rbp),%0" : "=r" ( &frompc));  &frompc = (( &uintfptr_t *) &frompc)[1];  &_mcount( &frompc,  &selfpc); };}' unless defined(&MCOUNT);
	    }
	}
    }
}
1;

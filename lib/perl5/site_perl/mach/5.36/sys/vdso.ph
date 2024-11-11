require '_h2ph_pre.ph';

no warnings qw(redefine misc);

unless(defined(&_SYS_VDSO_H)) {
    eval 'sub _SYS_VDSO_H () {1;}' unless defined(&_SYS_VDSO_H);
    require 'sys/types.ph';
    require 'machine/vdso.ph';
    eval 'sub VDSO_TK_CURRENT_BUSY () {0xffffffff;}' unless defined(&VDSO_TK_CURRENT_BUSY);
    eval 'sub VDSO_TK_VER_1 () {0x1;}' unless defined(&VDSO_TK_VER_1);
    eval 'sub VDSO_TK_VER_CURR () { &VDSO_TK_VER_1;}' unless defined(&VDSO_TK_VER_CURR);
    eval 'sub VDSO_TH_ALGO_1 () {0x1;}' unless defined(&VDSO_TH_ALGO_1);
    eval 'sub VDSO_TH_ALGO_2 () {0x2;}' unless defined(&VDSO_TH_ALGO_2);
    eval 'sub VDSO_TH_ALGO_3 () {0x3;}' unless defined(&VDSO_TH_ALGO_3);
    eval 'sub VDSO_TH_ALGO_4 () {0x4;}' unless defined(&VDSO_TH_ALGO_4);
    eval 'sub vdso_fxrng_generation () { &vdso_fxrng_generation_1;}' unless defined(&vdso_fxrng_generation);
    eval 'sub VDSO_FXRNG_VER_1 () {0x1;}' unless defined(&VDSO_FXRNG_VER_1);
    eval 'sub VDSO_FXRNG_VER_CURR () { &VDSO_FXRNG_VER_1;}' unless defined(&VDSO_FXRNG_VER_CURR);
    unless(defined(&_KERNEL)) {
    }
    if(defined(&_KERNEL)) {
	if(defined(&RANDOM_FENESTRASX)) {
	}
	eval 'sub VDSO_TH_NUM () {4;}' unless defined(&VDSO_TH_NUM);
	if(defined(&COMPAT_FREEBSD32)) {
	    if(defined(&__amd64__)) {
	    } else {
	    }
	}
    }
}
1;

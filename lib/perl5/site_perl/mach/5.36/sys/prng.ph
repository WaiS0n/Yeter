require '_h2ph_pre.ph';

no warnings qw(redefine misc);

unless(defined(&_SYS_PRNG_H_)) {
    eval 'sub _SYS_PRNG_H_ () {1;}' unless defined(&_SYS_PRNG_H_);
    eval 'sub PCG_USE_INLINE_ASM () {1;}' unless defined(&PCG_USE_INLINE_ASM);
    require 'contrib/pcg-c/include/pcg_variants.ph';
    if(defined(&_KERNEL)) {
    }
}
1;

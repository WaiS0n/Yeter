require '_h2ph_pre.ph';

no warnings qw(redefine misc);

unless(defined(&_CTF_API_H)) {
    eval 'sub _CTF_API_H () {1;}' unless defined(&_CTF_API_H);
    require 'sys/types.ph';
    require 'sys/param.ph';
    require 'sys/elf.ph';
    require 'sys/ctf.ph';
    if(defined(&__cplusplus)) {
    }
    if(defined(&illumos)) {
    } else {
    }
    eval 'sub CTF_FUNC_VARARG () {0x1;}' unless defined(&CTF_FUNC_VARARG);
    eval 'sub CTF_ERR () {(-1);}' unless defined(&CTF_ERR);
    eval 'sub CTF_MODEL_ILP32 () {1;}' unless defined(&CTF_MODEL_ILP32);
    eval 'sub CTF_MODEL_LP64 () {2;}' unless defined(&CTF_MODEL_LP64);
    if(defined(&_LP64)) {
	eval 'sub CTF_MODEL_NATIVE () { &CTF_MODEL_LP64;}' unless defined(&CTF_MODEL_NATIVE);
    } else {
	eval 'sub CTF_MODEL_NATIVE () { &CTF_MODEL_ILP32;}' unless defined(&CTF_MODEL_NATIVE);
    }
    eval 'sub CTF_ADD_NONROOT () {0;}' unless defined(&CTF_ADD_NONROOT);
    eval 'sub CTF_ADD_ROOT () {1;}' unless defined(&CTF_ADD_ROOT);
    if(defined(&_KERNEL)) {
    }
    if(defined(&__cplusplus)) {
    }
}
1;

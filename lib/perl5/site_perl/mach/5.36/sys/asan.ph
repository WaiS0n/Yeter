require '_h2ph_pre.ph';

no warnings qw(redefine misc);

unless(defined(&_SYS_ASAN_H_)) {
    eval 'sub _SYS_ASAN_H_ () {1;}' unless defined(&_SYS_ASAN_H_);
    if(defined(&KASAN)) {
	require 'sys/types.ph';
	eval 'sub KASAN_SHADOW_SCALE () {8;}' unless defined(&KASAN_SHADOW_SCALE);
	eval 'sub KASAN_SHADOW_SCALE_SHIFT () {3;}' unless defined(&KASAN_SHADOW_SCALE_SHIFT);
	eval 'sub KASAN_STACK_LEFT () {0xf1;}' unless defined(&KASAN_STACK_LEFT);
	eval 'sub KASAN_STACK_MID () {0xf2;}' unless defined(&KASAN_STACK_MID);
	eval 'sub KASAN_STACK_RIGHT () {0xf3;}' unless defined(&KASAN_STACK_RIGHT);
	eval 'sub KASAN_USE_AFTER_RET () {0xf5;}' unless defined(&KASAN_USE_AFTER_RET);
	eval 'sub KASAN_USE_AFTER_SCOPE () {0xf8;}' unless defined(&KASAN_USE_AFTER_SCOPE);
	eval 'sub KASAN_GENERIC_REDZONE () {0xfa;}' unless defined(&KASAN_GENERIC_REDZONE);
	eval 'sub KASAN_MALLOC_REDZONE () {0xfb;}' unless defined(&KASAN_MALLOC_REDZONE);
	eval 'sub KASAN_KMEM_REDZONE () {0xfc;}' unless defined(&KASAN_KMEM_REDZONE);
	eval 'sub KASAN_UMA_FREED () {0xfd;}' unless defined(&KASAN_UMA_FREED);
	eval 'sub KASAN_KSTACK_FREED () {0xfe;}' unless defined(&KASAN_KSTACK_FREED);
	eval 'sub KASAN_EXEC_ARGS_FREED () {0xff;}' unless defined(&KASAN_EXEC_ARGS_FREED);
    } else {
	eval 'sub kasan_init () {
	    eval q();
	}' unless defined(&kasan_init);
	eval 'sub kasan_shadow_map {
	    my($a, $s) = @_;
    	    eval q();
	}' unless defined(&kasan_shadow_map);
	eval 'sub kasan_mark {
	    my($p, $s, $l, $c) = @_;
    	    eval q();
	}' unless defined(&kasan_mark);
    }
}
1;

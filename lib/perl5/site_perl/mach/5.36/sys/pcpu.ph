require '_h2ph_pre.ph';

no warnings qw(redefine misc);

unless(defined(&_SYS_PCPU_H_)) {
    eval 'sub _SYS_PCPU_H_ () {1;}' unless defined(&_SYS_PCPU_H_);
    if(defined(&LOCORE)) {
	die("no assembler-serviceable parts inside");
    }
    require 'sys/param.ph';
    require 'sys/_cpuset.ph';
    require 'sys/_lock.ph';
    require 'sys/_mutex.ph';
    require 'sys/_sx.ph';
    require 'sys/queue.ph';
    require 'sys/_rmlock.ph';
    require 'sys/resource.ph';
    require 'machine/pcpu.ph';
    eval 'sub DPCPU_SETNAME () {"set_pcpu";}' unless defined(&DPCPU_SETNAME);
    eval 'sub DPCPU_SYMPREFIX () {"pcpu_entry_";}' unless defined(&DPCPU_SYMPREFIX);
    if(defined(&_KERNEL)) {
	eval 'sub DPCPU_START () {(( &uintptr_t)& &__start_set_pcpu);}' unless defined(&DPCPU_START);
	eval 'sub DPCPU_STOP () {(( &uintptr_t)& &__stop_set_pcpu);}' unless defined(&DPCPU_STOP);
	eval 'sub DPCPU_BYTES () {( &DPCPU_STOP -  &DPCPU_START);}' unless defined(&DPCPU_BYTES);
	eval 'sub DPCPU_MODMIN () {2048;}' unless defined(&DPCPU_MODMIN);
	eval 'sub DPCPU_SIZE () { &roundup2( &DPCPU_BYTES,  &PAGE_SIZE);}' unless defined(&DPCPU_SIZE);
	eval 'sub DPCPU_MODSIZE () {( &DPCPU_SIZE - ( &DPCPU_BYTES -  &DPCPU_MODMIN));}' unless defined(&DPCPU_MODSIZE);
	eval 'sub DPCPU_NAME {
	    my($n) = @_;
    	    eval q( &pcpu_entry_$n);
	}' unless defined(&DPCPU_NAME);
	eval 'sub DPCPU_DECLARE {
	    my($t, $n) = @_;
    	    eval q( &extern $t  &DPCPU_NAME($n));
	}' unless defined(&DPCPU_DECLARE);
	eval 'sub DPCPU_DEFINE {
	    my($t, $n) = @_;
    	    eval q(\'struct _hack\'; $t  &DPCPU_NAME($n)  &__section( &DPCPU_SETNAME)  &__used);
	}' unless defined(&DPCPU_DEFINE);
	if(defined(&KLD_MODULE)  && (defined(&__aarch64__) || defined(&__riscv) || defined(&__powerpc64__) || defined(&__i386__))) {
	    eval 'sub DPCPU_DEFINE_STATIC {
	        my($t, $n) = @_;
    		eval q($t  &DPCPU_NAME($n)  &__section( &DPCPU_SETNAME)  &__used);
	    }' unless defined(&DPCPU_DEFINE_STATIC);
	} else {
	    eval 'sub DPCPU_DEFINE_STATIC {
	        my($t, $n) = @_;
    		eval q( &static $t  &DPCPU_NAME($n)  &__section( &DPCPU_SETNAME)  &__used);
	    }' unless defined(&DPCPU_DEFINE_STATIC);
	}
	eval 'sub _DPCPU_PTR {
	    my($b, $n) = @_;
    	    eval q(( &__typeof( &DPCPU_NAME($n))*)(($b) + ( &uintptr_t) &DPCPU_NAME($n)));
	}' unless defined(&_DPCPU_PTR);
	eval 'sub _DPCPU_GET {
	    my($b, $n) = @_;
    	    eval q((* &_DPCPU_PTR($b, $n)));
	}' unless defined(&_DPCPU_GET);
	eval 'sub _DPCPU_SET {
	    my($b, $n, $v) = @_;
    	    eval q((* &_DPCPU_PTR($b, $n) = $v));
	}' unless defined(&_DPCPU_SET);
	eval 'sub DPCPU_PTR {
	    my($n) = @_;
    	    eval q( &_DPCPU_PTR( &PCPU_GET( &dynamic), $n));
	}' unless defined(&DPCPU_PTR);
	eval 'sub DPCPU_GET {
	    my($n) = @_;
    	    eval q((* &DPCPU_PTR($n)));
	}' unless defined(&DPCPU_GET);
	eval 'sub DPCPU_SET {
	    my($n, $v) = @_;
    	    eval q((* &DPCPU_PTR($n) = $v));
	}' unless defined(&DPCPU_SET);
	eval 'sub DPCPU_ID_PTR {
	    my($i, $n) = @_;
    	    eval q( &_DPCPU_PTR( $dpcpu_off[($i)], $n));
	}' unless defined(&DPCPU_ID_PTR);
	eval 'sub DPCPU_ID_GET {
	    my($i, $n) = @_;
    	    eval q((* &DPCPU_ID_PTR($i, $n)));
	}' unless defined(&DPCPU_ID_GET);
	eval 'sub DPCPU_ID_SET {
	    my($i, $n, $v) = @_;
    	    eval q((* &DPCPU_ID_PTR($i, $n) = $v));
	}' unless defined(&DPCPU_ID_SET);
	eval 'sub DPCPU_SUM {
	    my($n) = @_;
    	    eval q( &__extension__ ({ \'u_int\'  &_i;  &__typeof(* &DPCPU_PTR($n))  &sum;  &sum = 0;  &CPU_FOREACH( &_i) {  &sum += * &DPCPU_ID_PTR( &_i, $n); }  &sum; }));
	}' unless defined(&DPCPU_SUM);
	eval 'sub DPCPU_VARSUM {
	    my($n, $var) = @_;
    	    eval q( &__extension__ ({ \'u_int\'  &_i;  &__typeof(( &DPCPU_PTR($n))->$var)  &sum;  &sum = 0;  &CPU_FOREACH( &_i) {  &sum += ( &DPCPU_ID_PTR( &_i, $n))->$var; }  &sum; }));
	}' unless defined(&DPCPU_VARSUM);
	eval 'sub DPCPU_ZERO {
	    my($n) = @_;
    	    eval q( &do { \'u_int\'  &_i;  &CPU_FOREACH( &_i) {  &bzero( &DPCPU_ID_PTR( &_i, $n), $sizeof{ &DPCPU_PTR($n)}); } }  &while (0));
	}' unless defined(&DPCPU_ZERO);
    }
    if(defined(&_KERNEL)) {
	eval 'sub curcpu () { &PCPU_GET( &cpuid);}' unless defined(&curcpu);
	eval 'sub curvidata () { &PCPU_GET( &vidata);}' unless defined(&curvidata);
	eval 'sub UMA_PCPU_ALLOC_SIZE () { &PAGE_SIZE;}' unless defined(&UMA_PCPU_ALLOC_SIZE);
	require 'machine/pcpu_aux.ph';
	unless(defined(&curthread)) {
	    eval 'sub curthread () { &PCPU_GET( &curthread);}' unless defined(&curthread);
	}
	eval 'sub curproc () {( ($curthread->{td_proc}));}' unless defined(&curproc);
	unless(defined(&ZPCPU_ASSERT_PROTECTED)) {
	    eval 'sub ZPCPU_ASSERT_PROTECTED () {
	        eval q( &MPASS( ($curthread->{td_critnest}) > 0));
	    }' unless defined(&ZPCPU_ASSERT_PROTECTED);
	}
	unless(defined(&zpcpu_offset_cpu)) {
	    eval 'sub zpcpu_offset_cpu {
	        my($cpu) = @_;
    		eval q(( &UMA_PCPU_ALLOC_SIZE * $cpu));
	    }' unless defined(&zpcpu_offset_cpu);
	}
	unless(defined(&zpcpu_offset)) {
	    eval 'sub zpcpu_offset () {
	        eval q(( &PCPU_GET( &zpcpu_offset)));
	    }' unless defined(&zpcpu_offset);
	}
	unless(defined(&zpcpu_base_to_offset)) {
	    eval 'sub zpcpu_base_to_offset {
	        my($base) = @_;
    		eval q(($base));
	    }' unless defined(&zpcpu_base_to_offset);
	}
	unless(defined(&zpcpu_offset_to_base)) {
	    eval 'sub zpcpu_offset_to_base {
	        my($base) = @_;
    		eval q(($base));
	    }' unless defined(&zpcpu_offset_to_base);
	}
	eval 'sub zpcpu_get {
	    my($base) = @_;
    	    eval q(({  &__typeof($base)  &_ptr = ( &void *)(($base) +  &zpcpu_offset());  &_ptr; }));
	}' unless defined(&zpcpu_get);
	eval 'sub zpcpu_get_cpu {
	    my($base, $cpu) = @_;
    	    eval q(({  &__typeof($base)  &_ptr = ( &void *)(($base) +  &zpcpu_offset_cpu($cpu));  &_ptr; }));
	}' unless defined(&zpcpu_get_cpu);
	eval 'sub zpcpu_replace {
	    my($base, $val) = @_;
    	    eval q(({  &__typeof($val) * &_ptr =  &zpcpu_get($base);  &__typeof($val)  &_old;  &_old = * &_ptr; * &_ptr = $val;  &_old; }));
	}' unless defined(&zpcpu_replace);
	eval 'sub zpcpu_replace_cpu {
	    my($base, $val, $cpu) = @_;
    	    eval q(({  &__typeof($val) * &_ptr =  &zpcpu_get_cpu($base, $cpu);  &__typeof($val)  &_old;  &_old = * &_ptr; * &_ptr = $val;  &_old; }));
	}' unless defined(&zpcpu_replace_cpu);
	unless(defined(&zpcpu_set_protected)) {
	    eval 'sub zpcpu_set_protected {
	        my($base, $val) = @_;
    		eval q(({  &ZPCPU_ASSERT_PROTECTED();  &__typeof($val) * &_ptr =  &zpcpu_get($base); * &_ptr = ($val); }));
	    }' unless defined(&zpcpu_set_protected);
	}
	unless(defined(&zpcpu_add_protected)) {
	    eval 'sub zpcpu_add_protected {
	        my($base, $val) = @_;
    		eval q(({  &ZPCPU_ASSERT_PROTECTED();  &__typeof($val) * &_ptr =  &zpcpu_get($base); * &_ptr += ($val); }));
	    }' unless defined(&zpcpu_add_protected);
	}
	unless(defined(&zpcpu_sub_protected)) {
	    eval 'sub zpcpu_sub_protected {
	        my($base, $val) = @_;
    		eval q(({  &ZPCPU_ASSERT_PROTECTED();  &__typeof($val) * &_ptr =  &zpcpu_get($base); * &_ptr -= ($val); }));
	    }' unless defined(&zpcpu_sub_protected);
	}
    }
}
1;

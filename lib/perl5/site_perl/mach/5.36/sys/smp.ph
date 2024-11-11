require '_h2ph_pre.ph';

no warnings qw(redefine misc);

unless(defined(&_SYS_SMP_H_)) {
    eval 'sub _SYS_SMP_H_ () {1;}' unless defined(&_SYS_SMP_H_);
    if(defined(&_KERNEL)) {
	unless(defined(&LOCORE)) {
	    require 'sys/cpuset.ph';
	    require 'sys/queue.ph';
	    eval("sub TOPO_TYPE_DUMMY () { 0; }") unless defined(&TOPO_TYPE_DUMMY);
	    eval("sub TOPO_TYPE_PU () { 1; }") unless defined(&TOPO_TYPE_PU);
	    eval("sub TOPO_TYPE_CORE () { 2; }") unless defined(&TOPO_TYPE_CORE);
	    eval("sub TOPO_TYPE_CACHE () { 3; }") unless defined(&TOPO_TYPE_CACHE);
	    eval("sub TOPO_TYPE_PKG () { 4; }") unless defined(&TOPO_TYPE_PKG);
	    eval("sub TOPO_TYPE_NODE () { 5; }") unless defined(&TOPO_TYPE_NODE);
	    eval("sub TOPO_TYPE_GROUP () { 6; }") unless defined(&TOPO_TYPE_GROUP);
	    eval("sub TOPO_TYPE_SYSTEM () { 7; }") unless defined(&TOPO_TYPE_SYSTEM);
	    eval 'sub CG_SHARE_NONE () {0;}' unless defined(&CG_SHARE_NONE);
	    eval 'sub CG_SHARE_L1 () {1;}' unless defined(&CG_SHARE_L1);
	    eval 'sub CG_SHARE_L2 () {2;}' unless defined(&CG_SHARE_L2);
	    eval 'sub CG_SHARE_L3 () {3;}' unless defined(&CG_SHARE_L3);
	    eval 'sub MAX_CACHE_LEVELS () { &CG_SHARE_L3;}' unless defined(&MAX_CACHE_LEVELS);
	    eval 'sub CG_FLAG_HTT () {0x1;}' unless defined(&CG_FLAG_HTT);
	    eval 'sub CG_FLAG_SMT () {0x2;}' unless defined(&CG_FLAG_SMT);
	    eval 'sub CG_FLAG_THREAD () {( &CG_FLAG_HTT |  &CG_FLAG_SMT);}' unless defined(&CG_FLAG_THREAD);
	    eval 'sub CG_FLAG_NODE () {0x4;}' unless defined(&CG_FLAG_NODE);
	    if(defined(&SMP)) {
		eval("sub TOPO_LEVEL_PKG () { 0; }") unless defined(&TOPO_LEVEL_PKG);
		eval("sub TOPO_LEVEL_GROUP () { 1; }") unless defined(&TOPO_LEVEL_GROUP);
		eval("sub TOPO_LEVEL_CACHEGROUP () { 2; }") unless defined(&TOPO_LEVEL_CACHEGROUP);
		eval("sub TOPO_LEVEL_CORE () { 3; }") unless defined(&TOPO_LEVEL_CORE);
		eval("sub TOPO_LEVEL_THREAD () { 4; }") unless defined(&TOPO_LEVEL_THREAD);
		eval("sub TOPO_LEVEL_COUNT () { 5; }") unless defined(&TOPO_LEVEL_COUNT);
		eval 'sub TOPO_FOREACH {
		    my($i, $root) = @_;
    		    eval q( &for ($i = $root; $i !=  &NULL; $i =  &topo_next_node($root, $i)));
		}' unless defined(&TOPO_FOREACH);
	    }
	    eval 'sub CPU_ABSENT {
	        my($x_cpu) = @_;
    		eval q((! &CPU_ISSET($x_cpu,  &all_cpus)));
	    }' unless defined(&CPU_ABSENT);
	    eval 'sub CPU_FOREACH {
	        my($i) = @_;
    		eval q( &for (($i) = 0; ($i) <=  &mp_maxid; ($i)++)  &if (! &CPU_ABSENT(($i))));
	    }' unless defined(&CPU_FOREACH);
	    eval 'sub cpu_first {
	        my($void) = @_;
    		eval q({ \'int\'  &i;  &for ( &i = 0;;  &i++)  &if (! &CPU_ABSENT( &i)) ( &i); });
	    }' unless defined(&cpu_first);
	    eval 'sub cpu_next {
	        my($i) = @_;
    		eval q({  &for (;;) { $i++;  &if ($i >  &mp_maxid) $i = 0;  &if (! &CPU_ABSENT($i)) ($i); } });
	    }' unless defined(&cpu_next);
	    eval 'sub CPU_FIRST () {
	        eval q( &cpu_first());
	    }' unless defined(&CPU_FIRST);
	    eval 'sub CPU_NEXT {
	        my($i) = @_;
    		eval q( &cpu_next(($i)));
	    }' unless defined(&CPU_NEXT);
	    if(defined(&SMP)) {
		if(defined(&__amd64__) || defined(&__i386__)) {
		}
	    }
	}
    }
}
1;

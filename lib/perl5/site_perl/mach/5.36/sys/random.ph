require '_h2ph_pre.ph';

no warnings qw(redefine misc);

unless(defined(&_SYS_RANDOM_H_)) {
    eval 'sub _SYS_RANDOM_H_ () {1;}' unless defined(&_SYS_RANDOM_H_);
    require 'sys/types.ph';
    if(defined(&_KERNEL)) {
	if(defined(&RANDOM_LOADABLE)) {
	    eval 'sub read_random {
	        my($a, $b) = @_;
    		eval q((* &_read_random)($a, $b));
	    }' unless defined(&read_random);
	    eval 'sub read_random_uio {
	        my($a, $b) = @_;
    		eval q((* &_read_random_uio)($a, $b));
	    }' unless defined(&read_random_uio);
	    eval 'sub is_random_seeded () {
	        eval q((* &_is_random_seeded)());
	    }' unless defined(&is_random_seeded);
	} else {
	}
	eval("sub RANDOM_START () { 0; }") unless defined(&RANDOM_START);
	eval("sub RANDOM_CACHED () { 0; }") unless defined(&RANDOM_CACHED);
	eval("sub RANDOM_ATTACH () { 1; }") unless defined(&RANDOM_ATTACH);
	eval("sub RANDOM_KEYBOARD () { 2; }") unless defined(&RANDOM_KEYBOARD);
	eval("sub RANDOM_MOUSE () { 3; }") unless defined(&RANDOM_MOUSE);
	eval("sub RANDOM_NET_TUN () { 4; }") unless defined(&RANDOM_NET_TUN);
	eval("sub RANDOM_NET_ETHER () { 5; }") unless defined(&RANDOM_NET_ETHER);
	eval("sub RANDOM_NET_NG () { 6; }") unless defined(&RANDOM_NET_NG);
	eval("sub RANDOM_INTERRUPT () { 7; }") unless defined(&RANDOM_INTERRUPT);
	eval("sub RANDOM_SWI () { 8; }") unless defined(&RANDOM_SWI);
	eval("sub RANDOM_FS_ATIME () { 9; }") unless defined(&RANDOM_FS_ATIME);
	eval("sub RANDOM_UMA () { 10; }") unless defined(&RANDOM_UMA);
	eval("sub RANDOM_CALLOUT () { 11; }") unless defined(&RANDOM_CALLOUT);
	eval("sub RANDOM_ENVIRONMENTAL_END () { RANDOM_CALLOUT; }") unless defined(&RANDOM_ENVIRONMENTAL_END);
	eval("sub RANDOM_PURE_START () { 1; }") unless defined(&RANDOM_PURE_START);
	eval("sub RANDOM_PURE_OCTEON () { RANDOM_PURE_START; }") unless defined(&RANDOM_PURE_OCTEON);
	eval("sub RANDOM_PURE_SAFE () { 1; }") unless defined(&RANDOM_PURE_SAFE);
	eval("sub RANDOM_PURE_GLXSB () { 2; }") unless defined(&RANDOM_PURE_GLXSB);
	eval("sub RANDOM_PURE_HIFN () { 3; }") unless defined(&RANDOM_PURE_HIFN);
	eval("sub RANDOM_PURE_RDRAND () { 4; }") unless defined(&RANDOM_PURE_RDRAND);
	eval("sub RANDOM_PURE_NEHEMIAH () { 5; }") unless defined(&RANDOM_PURE_NEHEMIAH);
	eval("sub RANDOM_PURE_RNDTEST () { 6; }") unless defined(&RANDOM_PURE_RNDTEST);
	eval("sub RANDOM_PURE_VIRTIO () { 7; }") unless defined(&RANDOM_PURE_VIRTIO);
	eval("sub RANDOM_PURE_BROADCOM () { 8; }") unless defined(&RANDOM_PURE_BROADCOM);
	eval("sub RANDOM_PURE_CCP () { 9; }") unless defined(&RANDOM_PURE_CCP);
	eval("sub RANDOM_PURE_DARN () { 10; }") unless defined(&RANDOM_PURE_DARN);
	eval("sub RANDOM_PURE_TPM () { 11; }") unless defined(&RANDOM_PURE_TPM);
	eval("sub RANDOM_PURE_VMGENID () { 12; }") unless defined(&RANDOM_PURE_VMGENID);
	eval("sub RANDOM_PURE_QUALCOMM () { 13; }") unless defined(&RANDOM_PURE_QUALCOMM);
	eval("sub ENTROPYSOURCE () { 14; }") unless defined(&ENTROPYSOURCE);
	eval 'sub RANDOM_CACHED_BOOT_ENTROPY_MODULE () {"boot_entropy_cache";}' unless defined(&RANDOM_CACHED_BOOT_ENTROPY_MODULE);
	eval 'sub RANDOM_PLATFORM_BOOT_ENTROPY_MODULE () {"boot_entropy_platform";}' unless defined(&RANDOM_PLATFORM_BOOT_ENTROPY_MODULE);
	eval 'sub random_harvest_queue {
	    my($entropy,$size,$origin) = @_;
    	    eval q({  &if ( &hc_source_mask & (1<< $origin))  &random_harvest_queue_($entropy, $size, $origin); });
	}' unless defined(&random_harvest_queue);
	eval 'sub random_harvest_fast {
	    my($entropy,$size,$origin) = @_;
    	    eval q({  &if ( &hc_source_mask & (1<< $origin))  &random_harvest_fast_($entropy, $size); });
	}' unless defined(&random_harvest_fast);
	eval 'sub random_harvest_direct {
	    my($entropy,$size,$origin) = @_;
    	    eval q({  &if ( &hc_source_mask & (1<< $origin))  &random_harvest_direct_($entropy, $size, $origin); });
	}' unless defined(&random_harvest_direct);
	if(defined(&RANDOM_ENABLE_UMA)) {
	    eval 'sub random_harvest_fast_uma {
	        my($a, $b, $c) = @_;
    		eval q( &random_harvest_fast($a, $b, $c));
	    }' unless defined(&random_harvest_fast_uma);
	} else {
	    eval 'sub random_harvest_fast_uma {
	        my($a, $b, $c) = @_;
    		eval q( &do {}  &while (0));
	    }' unless defined(&random_harvest_fast_uma);
	}
	if(defined(&RANDOM_ENABLE_ETHER)) {
	    eval 'sub random_harvest_queue_ether {
	        my($a, $b) = @_;
    		eval q( &random_harvest_queue($a, $b,  &RANDOM_NET_ETHER));
	    }' unless defined(&random_harvest_queue_ether);
	} else {
	    eval 'sub random_harvest_queue_ether {
	        my($a, $b) = @_;
    		eval q( &do {}  &while (0));
	    }' unless defined(&random_harvest_queue_ether);
	}
    }
    eval 'sub GRND_NONBLOCK () {0x1;}' unless defined(&GRND_NONBLOCK);
    eval 'sub GRND_RANDOM () {0x2;}' unless defined(&GRND_RANDOM);
    eval 'sub GRND_INSECURE () {0x4;}' unless defined(&GRND_INSECURE);
}
1;

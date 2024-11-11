require '_h2ph_pre.ph';

no warnings qw(redefine misc);

unless(defined(&_SYS_KTR_H_)) {
    eval 'sub _SYS_KTR_H_ () {1;}' unless defined(&_SYS_KTR_H_);
    require 'sys/ktr_class.ph';
    eval 'sub KTR_VERSION () {2;}' unless defined(&KTR_VERSION);
    eval 'sub KTR_PARMS () {6;}' unless defined(&KTR_PARMS);
    unless(defined(&LOCORE)) {
	require 'sys/param.ph';
	require 'sys/_cpuset.ph';
	if(defined(&KTR)) {
	    eval 'sub CTR6 {
	        my($m, $format, $p1, $p2, $p3, $p4, $p5, $p6) = @_;
    		eval q( &do {  &if ( &KTR_COMPILE & )  &ktr_tracepoint(,  &__FILE__,  &__LINE__, $format, , , , , , ($p6)); }  &while (0));
	    }' unless defined(&CTR6);
	    eval 'sub CTR0 {
	        my($m, $format) = @_;
    		eval q( &CTR6($m, $format, 0, 0, 0, 0, 0, 0));
	    }' unless defined(&CTR0);
	    eval 'sub CTR1 {
	        my($m, $format, $p1) = @_;
    		eval q( &CTR6($m, $format, $p1, 0, 0, 0, 0, 0));
	    }' unless defined(&CTR1);
	    eval 'sub CTR2 {
	        my($m, $format, $p1, $p2) = @_;
    		eval q( &CTR6($m, $format, $p1, $p2, 0, 0, 0, 0));
	    }' unless defined(&CTR2);
	    eval 'sub CTR3 {
	        my($m, $format, $p1, $p2, $p3) = @_;
    		eval q( &CTR6($m, $format, $p1, $p2, $p3, 0, 0, 0));
	    }' unless defined(&CTR3);
	    eval 'sub CTR4 {
	        my($m, $format, $p1, $p2, $p3, $p4) = @_;
    		eval q( &CTR6($m, $format, $p1, $p2, $p3, $p4, 0, 0));
	    }' unless defined(&CTR4);
	    eval 'sub CTR5 {
	        my($m, $format, $p1, $p2, $p3, $p4, $p5) = @_;
    		eval q( &CTR6($m, $format, $p1, $p2, $p3, $p4, $p5, 0));
	    }' unless defined(&CTR5);
	} else {
	    eval 'sub CTR0 {
	        my($m, $d) = @_;
    		eval q(( &void)0);
	    }' unless defined(&CTR0);
	    eval 'sub CTR1 {
	        my($m, $d, $p1) = @_;
    		eval q(( &void)0);
	    }' unless defined(&CTR1);
	    eval 'sub CTR2 {
	        my($m, $d, $p1, $p2) = @_;
    		eval q(( &void)0);
	    }' unless defined(&CTR2);
	    eval 'sub CTR3 {
	        my($m, $d, $p1, $p2, $p3) = @_;
    		eval q(( &void)0);
	    }' unless defined(&CTR3);
	    eval 'sub CTR4 {
	        my($m, $d, $p1, $p2, $p3, $p4) = @_;
    		eval q(( &void)0);
	    }' unless defined(&CTR4);
	    eval 'sub CTR5 {
	        my($m, $d, $p1, $p2, $p3, $p4, $p5) = @_;
    		eval q(( &void)0);
	    }' unless defined(&CTR5);
	    eval 'sub CTR6 {
	        my($m, $d, $p1, $p2, $p3, $p4, $p5, $p6) = @_;
    		eval q(( &void)0);
	    }' unless defined(&CTR6);
	}
	eval 'sub TR0 {
	    my($d) = @_;
    	    eval q( &CTR0( &KTR_GEN, $d));
	}' unless defined(&TR0);
	eval 'sub TR1 {
	    my($d, $p1) = @_;
    	    eval q( &CTR1( &KTR_GEN, $d, $p1));
	}' unless defined(&TR1);
	eval 'sub TR2 {
	    my($d, $p1, $p2) = @_;
    	    eval q( &CTR2( &KTR_GEN, $d, $p1, $p2));
	}' unless defined(&TR2);
	eval 'sub TR3 {
	    my($d, $p1, $p2, $p3) = @_;
    	    eval q( &CTR3( &KTR_GEN, $d, $p1, $p2, $p3));
	}' unless defined(&TR3);
	eval 'sub TR4 {
	    my($d, $p1, $p2, $p3, $p4) = @_;
    	    eval q( &CTR4( &KTR_GEN, $d, $p1, $p2, $p3, $p4));
	}' unless defined(&TR4);
	eval 'sub TR5 {
	    my($d, $p1, $p2, $p3, $p4, $p5) = @_;
    	    eval q( &CTR5( &KTR_GEN, $d, $p1, $p2, $p3, $p4, $p5));
	}' unless defined(&TR5);
	eval 'sub TR6 {
	    my($d, $p1, $p2, $p3, $p4, $p5, $p6) = @_;
    	    eval q( &CTR6( &KTR_GEN, $d, $p1, $p2, $p3, $p4, $p5, $p6));
	}' unless defined(&TR6);
	eval 'sub _KTR_MACRO () {( &m,  &format,  &_1,  &_2,  &_3,  &_4,  &_5,  &_6,  &NAME, ...)  &NAME;}' unless defined(&_KTR_MACRO);
	eval 'sub CTR () {(...)  &_KTR_MACRO( &__VA_ARGS__,  &CTR6,  &CTR5,  &CTR4,  &CTR3,  &CTR2,  &CTR1,  &CTR0)( &__VA_ARGS__);}' unless defined(&CTR);
	eval 'sub TR () {(...)  &CTR( &KTR_GEN,  &__VA_ARGS__);}' unless defined(&TR);
	eval 'sub KTR_ATTR_LINKED () {"linkedto:\\"%s\\"";}' unless defined(&KTR_ATTR_LINKED);
	eval 'sub KTR_EFMT {
	    my($egroup, $ident, $etype) = @_;
    	    eval q(\\"KTRGRAPH group:\\\\\\"\\" $egroup \\"\\\\\\", id:\\\\\\"%s\\\\\\", \\" $etype \\", attributes: \\");
	}' unless defined(&KTR_EFMT);
	eval 'sub KTR_EVENT0 {
	    my($m, $egroup, $ident, $etype, $edat) = @_;
    	    eval q( &CTR2($m,  &KTR_EFMT($egroup, $ident, $etype) \\"none\\", $ident, $edat));
	}' unless defined(&KTR_EVENT0);
	eval 'sub KTR_EVENT1 {
	    my($m, $egroup, $ident, $etype, $edat, $a0, $v0) = @_;
    	    eval q( &CTR3($m,  &KTR_EFMT($egroup, $ident, $etype) $a0, $ident, $edat, ($v0)));
	}' unless defined(&KTR_EVENT1);
	eval 'sub KTR_EVENT2 {
	    my($m, $egroup, $ident, $etype, $edat, $a0, $v0, $a1, $v1) = @_;
    	    eval q( &CTR4($m,  &KTR_EFMT($egroup, $ident, $etype) $a0 \\", \\" $a1, $ident, $edat, ($v0), ($v1)));
	}' unless defined(&KTR_EVENT2);
	eval 'sub KTR_EVENT3 {
	    my($m, $egroup, $ident, $etype, $edat, $a0, $v0, $a1, $v1, $a2, $v2) = @_;
    	    eval q( &CTR5($m, &KTR_EFMT($egroup, $ident, $etype) $a0 \\", \\" $a1 \\", \\" $a2, $ident, $edat, ($v0), ($v1), ($v2)));
	}' unless defined(&KTR_EVENT3);
	eval 'sub KTR_EVENT4 {
	    my($m, $egroup, $ident, $etype, $edat,				    $a0, $v0, $a1, $v1, $a2, $v2, $a3, $v3) = @_;
    	    eval q( &CTR6($m, &KTR_EFMT($egroup, $ident, $etype) $a0 \\", \\" $a1 \\", \\" $a2 \\", \\" $a3, $ident, $edat, ($v0), ($v1), ($v2), ($v3)));
	}' unless defined(&KTR_EVENT4);
	eval 'sub KTR_STATE0 {
	    my($m, $egroup, $ident, $state) = @_;
    	    eval q( &KTR_EVENT0($m, $egroup, $ident, \\"state:\\\\\\"%s\\\\\\"\\", $state));
	}' unless defined(&KTR_STATE0);
	eval 'sub KTR_STATE1 {
	    my($m, $egroup, $ident, $state, $a0, $v0) = @_;
    	    eval q( &KTR_EVENT1($m, $egroup, $ident, \\"state:\\\\\\"%s\\\\\\"\\", $state, $a0, ($v0)));
	}' unless defined(&KTR_STATE1);
	eval 'sub KTR_STATE2 {
	    my($m, $egroup, $ident, $state, $a0, $v0, $a1, $v1) = @_;
    	    eval q( &KTR_EVENT2($m, $egroup, $ident, \\"state:\\\\\\"%s\\\\\\"\\", $state, $a0, ($v0), $a1, ($v1)));
	}' unless defined(&KTR_STATE2);
	eval 'sub KTR_STATE3 {
	    my($m, $egroup, $ident, $state, $a0, $v0, $a1, $v1, $a2, $v2) = @_;
    	    eval q( &KTR_EVENT3($m, $egroup, $ident, \\"state:\\\\\\"%s\\\\\\"\\", $state, $a0, ($v0), $a1, ($v1), $a2, ($v2)));
	}' unless defined(&KTR_STATE3);
	eval 'sub KTR_STATE4 {
	    my($m, $egroup, $ident, $state, $a0, $v0, $a1, $v1, $a2, $v2, $a3, $v3) = @_;
    	    eval q( &KTR_EVENT4($m, $egroup, $ident, \\"state:\\\\\\"%s\\\\\\"\\", $state, $a0, ($v0), $a1, ($v1), $a2, ($v2), $a3, ($v3)));
	}' unless defined(&KTR_STATE4);
	eval 'sub KTR_COUNTER0 {
	    my($m, $egroup, $ident, $counter) = @_;
    	    eval q( &KTR_EVENT0($m, $egroup, $ident, \\"counter:%d\\", $counter));
	}' unless defined(&KTR_COUNTER0);
	eval 'sub KTR_COUNTER1 {
	    my($m, $egroup, $ident, $edat, $a0, $v0) = @_;
    	    eval q( &KTR_EVENT1($m, $egroup, $ident, \\"counter:%d\\",  &counter, $a0, ($v0)));
	}' unless defined(&KTR_COUNTER1);
	eval 'sub KTR_COUNTER2 {
	    my($m, $egroup, $ident, $counter, $a0, $v0, $a1, $v1) = @_;
    	    eval q( &KTR_EVENT2($m, $egroup, $ident, \\"counter:%d\\", $counter, $a0, ($v0), $a1, ($v1)));
	}' unless defined(&KTR_COUNTER2);
	eval 'sub KTR_COUNTER3 {
	    my($m, $egroup, $ident, $counter, $a0, $v0, $a1, $v1, $a2, $v2) = @_;
    	    eval q( &KTR_EVENT3($m, $egroup, $ident, \\"counter:%d\\", $counter, $a0, ($v0), $a1, ($v1), $a2, ($v2)));
	}' unless defined(&KTR_COUNTER3);
	eval 'sub KTR_COUNTER4 {
	    my($m, $egroup, $ident, $counter, $a0, $v0, $a1, $v1, $a2, $v2, $a3, $v3) = @_;
    	    eval q( &KTR_EVENT4($m, $egroup, $ident, \\"counter:%d\\", $counter, $a0, ($v0), $a1, ($v1), $a2, ($v2), $a3, ($v3)));
	}' unless defined(&KTR_COUNTER4);
	eval 'sub KTR_POINT0 {
	    my($m, $egroup, $ident, $point) = @_;
    	    eval q( &KTR_EVENT0($m, $egroup, $ident, \\"point:\\\\\\"%s\\\\\\"\\", $point));
	}' unless defined(&KTR_POINT0);
	eval 'sub KTR_POINT1 {
	    my($m, $egroup, $ident, $point, $a0, $v0) = @_;
    	    eval q( &KTR_EVENT1($m, $egroup, $ident, \\"point:\\\\\\"%s\\\\\\"\\", $point, $a0, ($v0)));
	}' unless defined(&KTR_POINT1);
	eval 'sub KTR_POINT2 {
	    my($m, $egroup, $ident, $point, $a0, $v0, $a1, $v1) = @_;
    	    eval q( &KTR_EVENT2($m, $egroup, $ident, \\"point:\\\\\\"%s\\\\\\"\\", $point, $a0, ($v0), $a1, ($v1)));
	}' unless defined(&KTR_POINT2);
	eval 'sub KTR_POINT3 {
	    my($m, $egroup, $ident, $point, $a0, $v0, $a1, $v1, $a2, $v2) = @_;
    	    eval q( &KTR_EVENT3($m, $egroup, $ident, \\"point:\\\\\\"%s\\\\\\"\\", $point, $a0, ($v0), $a1, ($v1), $a2, ($v2)));
	}' unless defined(&KTR_POINT3);
	eval 'sub KTR_POINT4 {
	    my($m, $egroup, $ident, $point, $a0, $v0, $a1, $v1, $a2, $v2, $a3, $v3) = @_;
    	    eval q( &KTR_EVENT4($m, $egroup, $ident, \\"point:\\\\\\"%s\\\\\\"\\", $point, $a0, ($v0), $a1, ($v1), $a2, ($v2), $a3, ($v3)));
	}' unless defined(&KTR_POINT4);
	eval 'sub KTR_START0 {
	    my($m, $egroup, $ident, $key) = @_;
    	    eval q( &KTR_EVENT0($m, $egroup, $ident, \\"start:0x%jX\\", ( &uintmax_t)$key));
	}' unless defined(&KTR_START0);
	eval 'sub KTR_START1 {
	    my($m, $egroup, $ident, $key, $a0, $v0) = @_;
    	    eval q( &KTR_EVENT1($m, $egroup, $ident, \\"start:0x%jX\\", ( &uintmax_t)$key, $a0, ($v0)));
	}' unless defined(&KTR_START1);
	eval 'sub KTR_START2 {
	    my($m, $egroup, $ident, $key, $a0, $v0, $a1, $v1) = @_;
    	    eval q( &KTR_EVENT2($m, $egroup, $ident, \\"start:0x%jX\\", ( &uintmax_t)$key, $a0, ($v0), $a1, ($v1)));
	}' unless defined(&KTR_START2);
	eval 'sub KTR_START3 {
	    my($m, $egroup, $ident, $key, $a0, $v0, $a1, $v1, $a2, $v2) = @_;
    	    eval q( &KTR_EVENT3($m, $egroup, $ident, \\"start:0x%jX\\", ( &uintmax_t)$key, $a0, ($v0), $a1, ($v1), $a2, ($v2)));
	}' unless defined(&KTR_START3);
	eval 'sub KTR_START4 {
	    my($m, $egroup, $ident, $key,					    $a0, $v0, $a1, $v1, $a2, $v2, $a3, $v3) = @_;
    	    eval q( &KTR_EVENT4($m, $egroup, $ident, \\"start:0x%jX\\", ( &uintmax_t)$key, $a0, ($v0), $a1, ($v1), $a2, ($v2), $a3, ($v3)));
	}' unless defined(&KTR_START4);
	eval 'sub KTR_STOP0 {
	    my($m, $egroup, $ident, $key) = @_;
    	    eval q( &KTR_EVENT0($m, $egroup, $ident, \\"stop:0x%jX\\", ( &uintmax_t)$key));
	}' unless defined(&KTR_STOP0);
	eval 'sub KTR_STOP1 {
	    my($m, $egroup, $ident, $key, $a0, $v0) = @_;
    	    eval q( &KTR_EVENT1($m, $egroup, $ident, \\"stop:0x%jX\\", ( &uintmax_t)$key, $a0, ($v0)));
	}' unless defined(&KTR_STOP1);
	eval 'sub KTR_STOP2 {
	    my($m, $egroup, $ident, $key, $a0, $v0, $a1, $v1) = @_;
    	    eval q( &KTR_EVENT2($m, $egroup, $ident, \\"stop:0x%jX\\", ( &uintmax_t)$key, $a0, ($v0), $a1, ($v1)));
	}' unless defined(&KTR_STOP2);
	eval 'sub KTR_STOP3 {
	    my($m, $egroup, $ident, $key, $a0, $v0, $a1, $v1, $a2, $v2) = @_;
    	    eval q( &KTR_EVENT3($m, $egroup, $ident, \\"stop:0x%jX\\", ( &uintmax_t)$key, $a0, ($v0), $a1, ($v1), $a2, ($v2)));
	}' unless defined(&KTR_STOP3);
	eval 'sub KTR_STOP4 {
	    my($m, $egroup, $ident, 						    $key, $a0, $v0, $a1, $v1, $a2, $v2, $a3, $v3) = @_;
    	    eval q( &KTR_EVENT4($m, $egroup, $ident, \\"stop:0x%jX\\", ( &uintmax_t)$key, $a0, ($v0), $a1, ($v1), $a2, ($v2), $a3, ($v3)));
	}' unless defined(&KTR_STOP4);
	if(((defined(&KTR_COMPILE) ? &KTR_COMPILE : undef) & (defined(&KTR_INIT) ? &KTR_INIT : undef)) != 0) {
	    eval 'sub ITR0 {
	        my($d) = @_;
    		eval q( &CTR0( &KTR_INIT, $d));
	    }' unless defined(&ITR0);
	    eval 'sub ITR1 {
	        my($d, $p1) = @_;
    		eval q( &CTR1( &KTR_INIT, $d, $p1));
	    }' unless defined(&ITR1);
	    eval 'sub ITR2 {
	        my($d, $p1, $p2) = @_;
    		eval q( &CTR2( &KTR_INIT, $d, $p1, $p2));
	    }' unless defined(&ITR2);
	    eval 'sub ITR3 {
	        my($d, $p1, $p2, $p3) = @_;
    		eval q( &CTR3( &KTR_INIT, $d, $p1, $p2, $p3));
	    }' unless defined(&ITR3);
	    eval 'sub ITR4 {
	        my($d, $p1, $p2, $p3, $p4) = @_;
    		eval q( &CTR4( &KTR_INIT, $d, $p1, $p2, $p3, $p4));
	    }' unless defined(&ITR4);
	    eval 'sub ITR5 {
	        my($d, $p1, $p2, $p3, $p4, $p5) = @_;
    		eval q( &CTR5( &KTR_INIT, $d, $p1, $p2, $p3, $p4, $p5));
	    }' unless defined(&ITR5);
	    eval 'sub ITR6 {
	        my($d, $p1, $p2, $p3, $p4, $p5, $p6) = @_;
    		eval q( &CTR6( &KTR_INIT, $d, $p1, $p2, $p3, $p4, $p5, $p6));
	    }' unless defined(&ITR6);
	} else {
	    eval 'sub ITR0 {
	        my($d) = @_;
    		eval q();
	    }' unless defined(&ITR0);
	    eval 'sub ITR1 {
	        my($d, $p1) = @_;
    		eval q();
	    }' unless defined(&ITR1);
	    eval 'sub ITR2 {
	        my($d, $p1, $p2) = @_;
    		eval q();
	    }' unless defined(&ITR2);
	    eval 'sub ITR3 {
	        my($d, $p1, $p2, $p3) = @_;
    		eval q();
	    }' unless defined(&ITR3);
	    eval 'sub ITR4 {
	        my($d, $p1, $p2, $p3, $p4) = @_;
    		eval q();
	    }' unless defined(&ITR4);
	    eval 'sub ITR5 {
	        my($d, $p1, $p2, $p3, $p4, $p5) = @_;
    		eval q();
	    }' unless defined(&ITR5);
	    eval 'sub ITR6 {
	        my($d, $p1, $p2, $p3, $p4, $p5, $p6) = @_;
    		eval q();
	    }' unless defined(&ITR6);
	}
    }
}
1;

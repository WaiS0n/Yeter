require '_h2ph_pre.ph';

no warnings qw(redefine misc);

unless(defined(&_SYS_GMON_H_)) {
    eval 'sub _SYS_GMON_H_ () {1;}' unless defined(&_SYS_GMON_H_);
    require 'machine/profile.ph';
    eval 'sub GMONVERSION () {0x51879;}' unless defined(&GMONVERSION);
    if(defined(&GPROF4)) {
	eval 'sub HISTCOUNTER () { &int64_t;}' unless defined(&HISTCOUNTER);
    } else {
	eval 'sub HISTCOUNTER () {\'unsigned short\';}' unless defined(&HISTCOUNTER);
    }
    eval 'sub HISTFRACTION () {( &FUNCTION_ALIGNMENT / $sizeof{ &HISTCOUNTER} == 0? 1:  &FUNCTION_ALIGNMENT / $sizeof{ &HISTCOUNTER});}' unless defined(&HISTFRACTION);
    eval 'sub HASHFRACTION () {( &FUNCTION_ALIGNMENT / $sizeof{\'unsigned short\'} == 0? 1:  &FUNCTION_ALIGNMENT / $sizeof{\'unsigned short\'});}' unless defined(&HASHFRACTION);
    eval 'sub ARCDENSITY () {2;}' unless defined(&ARCDENSITY);
    eval 'sub MINARCS () {50;}' unless defined(&MINARCS);
    eval 'sub MAXARCS () {((1<< (8* $sizeof{\'u_short\'})) - 2);}' unless defined(&MAXARCS);
    eval 'sub ROUNDDOWN {
        my($x,$y) = @_;
	    eval q( &rounddown($x,$y));
    }' unless defined(&ROUNDDOWN);
    eval 'sub ROUNDUP {
        my($x,$y) = @_;
	    eval q( &roundup($x,$y));
    }' unless defined(&ROUNDUP);
    eval 'sub GMON_PROF_ON () {0;}' unless defined(&GMON_PROF_ON);
    eval 'sub GMON_PROF_BUSY () {1;}' unless defined(&GMON_PROF_BUSY);
    eval 'sub GMON_PROF_ERROR () {2;}' unless defined(&GMON_PROF_ERROR);
    eval 'sub GMON_PROF_OFF () {3;}' unless defined(&GMON_PROF_OFF);
    eval 'sub GMON_PROF_HIRES () {4;}' unless defined(&GMON_PROF_HIRES);
    eval 'sub GPROF_STATE () {0;}' unless defined(&GPROF_STATE);
    eval 'sub GPROF_COUNT () {1;}' unless defined(&GPROF_COUNT);
    eval 'sub GPROF_FROMS () {2;}' unless defined(&GPROF_FROMS);
    eval 'sub GPROF_TOS () {3;}' unless defined(&GPROF_TOS);
    eval 'sub GPROF_GMONPARAM () {4;}' unless defined(&GPROF_GMONPARAM);
    if(defined(&_KERNEL)) {
	eval 'sub KCOUNT {
	    my($p,$index) = @_;
    	    eval q((($p)-> $kcount[($index) / ( &HISTFRACTION * $sizeof{ &HISTCOUNTER})]));
	}' unless defined(&KCOUNT);
	eval 'sub PC_TO_I {
	    my($p, $pc) = @_;
    	    eval q((( &uintfptr_t)($pc) - ( &uintfptr_t)($p)-> &lowpc));
	}' unless defined(&PC_TO_I);
	if(defined(&GUPROF)) {
	    eval 'sub CALIB_SCALE () {1000;}' unless defined(&CALIB_SCALE);
	} else {
	    eval 'sub startguprof {
	        my($p) = @_;
    		eval q();
	    }' unless defined(&startguprof);
	    eval 'sub stopguprof {
	        my($p) = @_;
    		eval q();
	    }' unless defined(&stopguprof);
	}
    } else {
	require 'sys/cdefs.ph';
    }
}
1;

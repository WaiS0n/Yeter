require '_h2ph_pre.ph';

no warnings qw(redefine misc);

unless(defined(&_BZLIB_H)) {
    eval 'sub _BZLIB_H () {1;}' unless defined(&_BZLIB_H);
    if(defined(&__cplusplus)) {
    }
    eval 'sub BZ_RUN () {0;}' unless defined(&BZ_RUN);
    eval 'sub BZ_FLUSH () {1;}' unless defined(&BZ_FLUSH);
    eval 'sub BZ_FINISH () {2;}' unless defined(&BZ_FINISH);
    eval 'sub BZ_OK () {0;}' unless defined(&BZ_OK);
    eval 'sub BZ_RUN_OK () {1;}' unless defined(&BZ_RUN_OK);
    eval 'sub BZ_FLUSH_OK () {2;}' unless defined(&BZ_FLUSH_OK);
    eval 'sub BZ_FINISH_OK () {3;}' unless defined(&BZ_FINISH_OK);
    eval 'sub BZ_STREAM_END () {4;}' unless defined(&BZ_STREAM_END);
    eval 'sub BZ_SEQUENCE_ERROR () {(-1);}' unless defined(&BZ_SEQUENCE_ERROR);
    eval 'sub BZ_PARAM_ERROR () {(-2);}' unless defined(&BZ_PARAM_ERROR);
    eval 'sub BZ_MEM_ERROR () {(-3);}' unless defined(&BZ_MEM_ERROR);
    eval 'sub BZ_DATA_ERROR () {(-4);}' unless defined(&BZ_DATA_ERROR);
    eval 'sub BZ_DATA_ERROR_MAGIC () {(-5);}' unless defined(&BZ_DATA_ERROR_MAGIC);
    eval 'sub BZ_IO_ERROR () {(-6);}' unless defined(&BZ_IO_ERROR);
    eval 'sub BZ_UNEXPECTED_EOF () {(-7);}' unless defined(&BZ_UNEXPECTED_EOF);
    eval 'sub BZ_OUTBUFF_FULL () {(-8);}' unless defined(&BZ_OUTBUFF_FULL);
    eval 'sub BZ_CONFIG_ERROR () {(-9);}' unless defined(&BZ_CONFIG_ERROR);
    unless(defined(&BZ_IMPORT)) {
	eval 'sub BZ_EXPORT () {1;}' unless defined(&BZ_EXPORT);
    }
    unless(defined(&BZ_NO_STDIO)) {
	require 'stdio.ph';
    }
    if(defined(&_WIN32)) {
	require 'windows.ph';
	if(defined(&small)) {
	    undef(&small) if defined(&small);
	}
	if(defined(&BZ_EXPORT)) {
	    eval 'sub BZ_API {
	        my($func) = @_;
    		eval q( &WINAPI $func);
	    }' unless defined(&BZ_API);
	    eval 'sub BZ_EXTERN () { &extern;}' unless defined(&BZ_EXTERN);
	} else {
	    eval 'sub BZ_API {
	        my($func) = @_;
    		eval q(( &WINAPI * $func));
	    }' unless defined(&BZ_API);
	    eval 'sub BZ_EXTERN () {1;}' unless defined(&BZ_EXTERN);
	}
    } else {
	eval 'sub BZ_API {
	    my($func) = @_;
    	    eval q($func);
	}' unless defined(&BZ_API);
	eval 'sub BZ_EXTERN () { &extern;}' unless defined(&BZ_EXTERN);
    }
    unless(defined(&BZ_NO_STDIO)) {
	eval 'sub BZ_MAX_UNUSED () {5000;}' unless defined(&BZ_MAX_UNUSED);
    }
    unless(defined(&BZ_NO_STDIO)) {
    }
    if(defined(&__cplusplus)) {
    }
}
1;

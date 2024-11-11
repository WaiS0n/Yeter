require '_h2ph_pre.ph';

no warnings qw(redefine misc);

unless(defined(&NCURSES_DLL_H_incl)) {
    eval 'sub NCURSES_DLL_H_incl () {1;}' unless defined(&NCURSES_DLL_H_incl);
    if(defined(&__MINGW64__)) {
	unless(defined(&_WIN64)) {
	    eval 'sub _WIN64 () {1;}' unless defined(&_WIN64);
	}
    }
 elsif(defined(&__MINGW32__)) {
	unless(defined(&_WIN32)) {
	    eval 'sub _WIN32 () {1;}' unless defined(&_WIN32);
	}
	if(((defined(&__GNUC__) ? &__GNUC__ : undef) == 4)  && ((defined(&__GNUC_MINOR__) ? &__GNUC_MINOR__ : undef) == 8)) {
	    if(defined(&trace)) {
		undef(&trace) if defined(&trace);
		eval 'sub TRACE () {1;}' unless defined(&TRACE);
	    }
	}
    }
    eval 'sub NCURSES_PUBLIC_VAR {
        my($name) = @_;
	    eval q( &_nc_$name);
    }' unless defined(&NCURSES_PUBLIC_VAR);
    if(defined(&BUILDING_NCURSES)) {
	eval 'sub NCURSES_IMPEXP () { &NCURSES_EXPORT_GENERAL_EXPORT;}' unless defined(&NCURSES_IMPEXP);
    } else {
	eval 'sub NCURSES_IMPEXP () { &NCURSES_EXPORT_GENERAL_IMPORT;}' unless defined(&NCURSES_IMPEXP);
    }
    eval 'sub NCURSES_WRAPPED_VAR {
        my($type,$name) = @_;
	    eval q( &extern  &NCURSES_IMPEXP $type  &NCURSES_PUBLIC_VAR($name)( &void));
    }' unless defined(&NCURSES_WRAPPED_VAR);
    eval 'sub NCURSES_EXPORT {
        my($type) = @_;
	    eval q( &NCURSES_IMPEXP $type  &NCURSES_API);
    }' unless defined(&NCURSES_EXPORT);
    eval 'sub NCURSES_EXPORT_VAR {
        my($type) = @_;
	    eval q( &NCURSES_IMPEXP $type);
    }' unless defined(&NCURSES_EXPORT_VAR);
    if(defined(&__CYGWIN__) || (defined(&_WIN32) || defined(&_WIN64))) {
	if(defined(&NCURSES_STATIC) ) {
	    eval 'sub NCURSES_EXPORT_GENERAL_IMPORT () {1;}' unless defined(&NCURSES_EXPORT_GENERAL_IMPORT);
	    eval 'sub NCURSES_EXPORT_GENERAL_EXPORT () {1;}' unless defined(&NCURSES_EXPORT_GENERAL_EXPORT);
	} else {
	    eval 'sub NCURSES_EXPORT_GENERAL_IMPORT () { &__declspec( &dllimport);}' unless defined(&NCURSES_EXPORT_GENERAL_IMPORT);
	    eval 'sub NCURSES_EXPORT_GENERAL_EXPORT () { &__declspec( &dllexport);}' unless defined(&NCURSES_EXPORT_GENERAL_EXPORT);
	}
	eval 'sub NCURSES_API () { &__cdecl;}' unless defined(&NCURSES_API);
    } else {
	eval 'sub NCURSES_EXPORT_GENERAL_IMPORT () {1;}' unless defined(&NCURSES_EXPORT_GENERAL_IMPORT);
	eval 'sub NCURSES_EXPORT_GENERAL_EXPORT () {1;}' unless defined(&NCURSES_EXPORT_GENERAL_EXPORT);
	eval 'sub NCURSES_API () {1;}' unless defined(&NCURSES_API);
    }
}
1;

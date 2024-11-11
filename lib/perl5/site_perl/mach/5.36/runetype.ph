require '_h2ph_pre.ph';

no warnings qw(redefine misc);

unless(defined(&_RUNETYPE_H_)) {
    eval 'sub _RUNETYPE_H_ () {1;}' unless defined(&_RUNETYPE_H_);
    require 'sys/cdefs.ph';
    require 'sys/_types.ph';
    eval 'sub _CACHED_RUNES () {(1<<8);}' unless defined(&_CACHED_RUNES);
    eval 'sub _CRMASK () {(~( &_CACHED_RUNES - 1));}' unless defined(&_CRMASK);
    eval 'sub _RUNE_MAGIC_1 () {"RuneMagi";}' unless defined(&_RUNE_MAGIC_1);
    if(defined(&__RUNETYPE_INTERNAL)) {
    } else {
	eval 'sub _RuneLocale () {
	    eval q(* &__getCurrentRuneLocale( &void) {  &if ( &_ThreadRuneLocale)  &_ThreadRuneLocale;  &_CurrentRuneLocale; });
	}' unless defined(&_RuneLocale);
    }
    eval 'sub _CurrentRuneLocale () {( &__getCurrentRuneLocale());}' unless defined(&_CurrentRuneLocale);
}
1;

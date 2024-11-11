require '_h2ph_pre.ph';

no warnings qw(redefine misc);

unless(defined(&_XLOCALE_H_)) {
    eval 'sub _XLOCALE_H_ () {1;}' unless defined(&_XLOCALE_H_);
    require 'locale.ph';
    require 'xlocale/_locale.ph';
    if(defined(&_STRING_H_)) {
	require 'xlocale/_string.ph';
    }
    if(defined(&_INTTYPES_H_)) {
	require 'xlocale/_inttypes.ph';
    }
    if(defined(&_MONETARY_H_)) {
	require 'xlocale/_monetary.ph';
    }
    if(defined(&_STDLIB_H_)) {
	require 'xlocale/_stdlib.ph';
    }
    if(defined(&_TIME_H_)) {
	require 'xlocale/_time.ph';
    }
    if(defined(&_LANGINFO_H_)) {
	require 'xlocale/_langinfo.ph';
    }
    if(defined(&_CTYPE_H_)) {
	require 'xlocale/_ctype.ph';
    }
    if(defined(&_WCTYPE_H_)) {
	eval 'sub _XLOCALE_WCTYPES () {1;}' unless defined(&_XLOCALE_WCTYPES);
	require 'xlocale/_ctype.ph';
    }
    if(defined(&_STDIO_H_)) {
	require 'xlocale/_stdio.ph';
    }
    if(defined(&_WCHAR_H_)) {
	require 'xlocale/_wchar.ph';
    }
}
1;

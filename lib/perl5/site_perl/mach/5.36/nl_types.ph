require '_h2ph_pre.ph';

no warnings qw(redefine misc);

unless(defined(&_NL_TYPES_H_)) {
    eval 'sub _NL_TYPES_H_ () {1;}' unless defined(&_NL_TYPES_H_);
    require 'sys/cdefs.ph';
    require 'sys/types.ph';
    if(defined(&_NLS_PRIVATE)) {
	eval 'sub _NLS_MAGIC () {0xff88ff89;}' unless defined(&_NLS_MAGIC);
    }
    eval 'sub NL_SETD () {0;}' unless defined(&NL_SETD);
    eval 'sub NL_CAT_LOCALE () {1;}' unless defined(&NL_CAT_LOCALE);
    unless(defined(&_NL_ITEM_DECLARED)) {
	eval 'sub _NL_ITEM_DECLARED () {1;}' unless defined(&_NL_ITEM_DECLARED);
    }
}
1;

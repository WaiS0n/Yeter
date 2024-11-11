require '_h2ph_pre.ph';

no warnings qw(redefine misc);

unless(defined(&_ICONV_H_)) {
    eval 'sub _ICONV_H_ () {1;}' unless defined(&_ICONV_H_);
    require 'sys/cdefs.ph';
    require 'sys/types.ph';
    require 'wchar.ph';
    require 'sys/cdefs.ph';
    require 'sys/types.ph';
    if(defined(&__cplusplus)) {
    }
 elsif((defined(&__STDC_VERSION__) ? &__STDC_VERSION__ : undef) >= 199901) {
    } else {
    }
    eval 'sub __ICONV_F_HIDE_INVALID () {0x1;}' unless defined(&__ICONV_F_HIDE_INVALID);
    eval 'sub ICONV_TRIVIALP () {0;}' unless defined(&ICONV_TRIVIALP);
    eval 'sub ICONV_GET_TRANSLITERATE () {1;}' unless defined(&ICONV_GET_TRANSLITERATE);
    eval 'sub ICONV_SET_TRANSLITERATE () {2;}' unless defined(&ICONV_SET_TRANSLITERATE);
    eval 'sub ICONV_GET_DISCARD_ILSEQ () {3;}' unless defined(&ICONV_GET_DISCARD_ILSEQ);
    eval 'sub ICONV_SET_DISCARD_ILSEQ () {4;}' unless defined(&ICONV_SET_DISCARD_ILSEQ);
    eval 'sub ICONV_SET_HOOKS () {5;}' unless defined(&ICONV_SET_HOOKS);
    eval 'sub ICONV_SET_FALLBACKS () {6;}' unless defined(&ICONV_SET_FALLBACKS);
    eval 'sub ICONV_GET_ILSEQ_INVALID () {128;}' unless defined(&ICONV_GET_ILSEQ_INVALID);
    eval 'sub ICONV_SET_ILSEQ_INVALID () {129;}' unless defined(&ICONV_SET_ILSEQ_INVALID);
}
1;

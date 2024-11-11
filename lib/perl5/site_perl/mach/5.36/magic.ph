require '_h2ph_pre.ph';

no warnings qw(redefine misc);

unless(defined(&_MAGIC_H)) {
    eval 'sub _MAGIC_H () {1;}' unless defined(&_MAGIC_H);
    require 'sys/types.ph';
    eval 'sub MAGIC_NONE () {0x;}' unless defined(&MAGIC_NONE);
    eval 'sub MAGIC_DEBUG () {0x1;}' unless defined(&MAGIC_DEBUG);
    eval 'sub MAGIC_SYMLINK () {0x2;}' unless defined(&MAGIC_SYMLINK);
    eval 'sub MAGIC_COMPRESS () {0x4;}' unless defined(&MAGIC_COMPRESS);
    eval 'sub MAGIC_DEVICES () {0x8;}' unless defined(&MAGIC_DEVICES);
    eval 'sub MAGIC_MIME_TYPE () {0x10;}' unless defined(&MAGIC_MIME_TYPE);
    eval 'sub MAGIC_CONTINUE () {0x20;}' unless defined(&MAGIC_CONTINUE);
    eval 'sub MAGIC_CHECK () {0x40;}' unless defined(&MAGIC_CHECK);
    eval 'sub MAGIC_PRESERVE_ATIME () {0x80;}' unless defined(&MAGIC_PRESERVE_ATIME);
    eval 'sub MAGIC_RAW () {0x100;}' unless defined(&MAGIC_RAW);
    eval 'sub MAGIC_ERROR () {0x200;}' unless defined(&MAGIC_ERROR);
    eval 'sub MAGIC_MIME_ENCODING () {0x400;}' unless defined(&MAGIC_MIME_ENCODING);
    eval 'sub MAGIC_MIME () {( &MAGIC_MIME_TYPE| &MAGIC_MIME_ENCODING);}' unless defined(&MAGIC_MIME);
    eval 'sub MAGIC_APPLE () {0x800;}' unless defined(&MAGIC_APPLE);
    eval 'sub MAGIC_EXTENSION () {0x1000000;}' unless defined(&MAGIC_EXTENSION);
    eval 'sub MAGIC_COMPRESS_TRANSP () {0x2000000;}' unless defined(&MAGIC_COMPRESS_TRANSP);
    eval 'sub MAGIC_NO_COMPRESS_FORK () {0x4000000;}' unless defined(&MAGIC_NO_COMPRESS_FORK);
    eval 'sub MAGIC_NODESC () {( &MAGIC_EXTENSION| &MAGIC_MIME| &MAGIC_APPLE);}' unless defined(&MAGIC_NODESC);
    eval 'sub MAGIC_NO_CHECK_COMPRESS () {0x1000;}' unless defined(&MAGIC_NO_CHECK_COMPRESS);
    eval 'sub MAGIC_NO_CHECK_TAR () {0x2000;}' unless defined(&MAGIC_NO_CHECK_TAR);
    eval 'sub MAGIC_NO_CHECK_SOFT () {0x4000;}' unless defined(&MAGIC_NO_CHECK_SOFT);
    eval 'sub MAGIC_NO_CHECK_APPTYPE () {0x8000;}' unless defined(&MAGIC_NO_CHECK_APPTYPE);
    eval 'sub MAGIC_NO_CHECK_ELF () {0x10000;}' unless defined(&MAGIC_NO_CHECK_ELF);
    eval 'sub MAGIC_NO_CHECK_TEXT () {0x20000;}' unless defined(&MAGIC_NO_CHECK_TEXT);
    eval 'sub MAGIC_NO_CHECK_CDF () {0x40000;}' unless defined(&MAGIC_NO_CHECK_CDF);
    eval 'sub MAGIC_NO_CHECK_CSV () {0x80000;}' unless defined(&MAGIC_NO_CHECK_CSV);
    eval 'sub MAGIC_NO_CHECK_TOKENS () {0x100000;}' unless defined(&MAGIC_NO_CHECK_TOKENS);
    eval 'sub MAGIC_NO_CHECK_ENCODING () {0x200000;}' unless defined(&MAGIC_NO_CHECK_ENCODING);
    eval 'sub MAGIC_NO_CHECK_JSON () {0x400000;}' unless defined(&MAGIC_NO_CHECK_JSON);
    eval 'sub MAGIC_NO_CHECK_SIMH () {0x800000;}' unless defined(&MAGIC_NO_CHECK_SIMH);
    eval 'sub MAGIC_NO_CHECK_BUILTIN () {(  &MAGIC_NO_CHECK_COMPRESS |  &MAGIC_NO_CHECK_TAR |  &MAGIC_NO_CHECK_APPTYPE |  &MAGIC_NO_CHECK_ELF |  &MAGIC_NO_CHECK_TEXT |  &MAGIC_NO_CHECK_CSV |  &MAGIC_NO_CHECK_CDF |  &MAGIC_NO_CHECK_TOKENS |  &MAGIC_NO_CHECK_ENCODING |  &MAGIC_NO_CHECK_JSON |  &MAGIC_NO_CHECK_SIMH | 0);}' unless defined(&MAGIC_NO_CHECK_BUILTIN);
    eval 'sub MAGIC_SNPRINTB () {"\\177\\020b\\0debug\\0b\\1symlink\\0b\\2compress\\0b\\3devices\\0b\\4mime_type\\0b\\5continue\\0b\\6check\\0b\\7preserve_atime\\0b\\10raw\\0b\\11error\\0b\\12mime_encoding\\0b\\13apple\\0b\\14no_check_compress\\0b\\15no_check_tar\\0b\\16no_check_soft\\0b\\17no_check_sapptype\\0b\\20no_check_elf\\0b\\21no_check_text\\0b\\22no_check_cdf\\0b\\23no_check_csv\\0b\\24no_check_tokens\\0b\\25no_check_encoding\\0b\\26no_check_json\\0b\\27no_check_simh\\0b\\30extension\\0b\\31transp_compression\\0";}' unless defined(&MAGIC_SNPRINTB);
    eval 'sub MAGIC_NO_CHECK_ASCII () { &MAGIC_NO_CHECK_TEXT;}' unless defined(&MAGIC_NO_CHECK_ASCII);
    eval 'sub MAGIC_NO_CHECK_FORTRAN () {0x;}' unless defined(&MAGIC_NO_CHECK_FORTRAN);
    eval 'sub MAGIC_NO_CHECK_TROFF () {0x;}' unless defined(&MAGIC_NO_CHECK_TROFF);
    eval 'sub MAGIC_VERSION () {545;}' unless defined(&MAGIC_VERSION);
    if(defined(&__cplusplus)) {
    }
    eval 'sub MAGIC_PARAM_INDIR_MAX () {0;}' unless defined(&MAGIC_PARAM_INDIR_MAX);
    eval 'sub MAGIC_PARAM_NAME_MAX () {1;}' unless defined(&MAGIC_PARAM_NAME_MAX);
    eval 'sub MAGIC_PARAM_ELF_PHNUM_MAX () {2;}' unless defined(&MAGIC_PARAM_ELF_PHNUM_MAX);
    eval 'sub MAGIC_PARAM_ELF_SHNUM_MAX () {3;}' unless defined(&MAGIC_PARAM_ELF_SHNUM_MAX);
    eval 'sub MAGIC_PARAM_ELF_NOTES_MAX () {4;}' unless defined(&MAGIC_PARAM_ELF_NOTES_MAX);
    eval 'sub MAGIC_PARAM_REGEX_MAX () {5;}' unless defined(&MAGIC_PARAM_REGEX_MAX);
    eval 'sub MAGIC_PARAM_BYTES_MAX () {6;}' unless defined(&MAGIC_PARAM_BYTES_MAX);
    eval 'sub MAGIC_PARAM_ENCODING_MAX () {7;}' unless defined(&MAGIC_PARAM_ENCODING_MAX);
    eval 'sub MAGIC_PARAM_ELF_SHSIZE_MAX () {8;}' unless defined(&MAGIC_PARAM_ELF_SHSIZE_MAX);
    if(defined(&__cplusplus)) {
    }
}
1;

require '_h2ph_pre.ph';

no warnings qw(redefine misc);

unless(defined(&_TAR_H)) {
    eval 'sub _TAR_H () {1;}' unless defined(&_TAR_H);
    eval 'sub TMAGIC () {"ustar";}' unless defined(&TMAGIC);
    eval 'sub TMAGLEN () {6;}' unless defined(&TMAGLEN);
    eval 'sub TVERSION () {"00";}' unless defined(&TVERSION);
    eval 'sub TVERSLEN () {2;}' unless defined(&TVERSLEN);
    eval 'sub REGTYPE () {ord(\'0\');}' unless defined(&REGTYPE);
    eval 'sub AREGTYPE () {ord(\'\\0\');}' unless defined(&AREGTYPE);
    eval 'sub LNKTYPE () {ord(\'1\');}' unless defined(&LNKTYPE);
    eval 'sub SYMTYPE () {ord(\'2\');}' unless defined(&SYMTYPE);
    eval 'sub CHRTYPE () {ord(\'3\');}' unless defined(&CHRTYPE);
    eval 'sub BLKTYPE () {ord(\'4\');}' unless defined(&BLKTYPE);
    eval 'sub DIRTYPE () {ord(\'5\');}' unless defined(&DIRTYPE);
    eval 'sub FIFOTYPE () {ord(\'6\');}' unless defined(&FIFOTYPE);
    eval 'sub CONTTYPE () {ord(\'7\');}' unless defined(&CONTTYPE);
    eval 'sub TSUID () {04000;}' unless defined(&TSUID);
    eval 'sub TSGID () {02000;}' unless defined(&TSGID);
    eval 'sub TSVTX () {01000;}' unless defined(&TSVTX);
    eval 'sub TUREAD () {00400;}' unless defined(&TUREAD);
    eval 'sub TUWRITE () {00200;}' unless defined(&TUWRITE);
    eval 'sub TUEXEC () {00100;}' unless defined(&TUEXEC);
    eval 'sub TGREAD () {00040;}' unless defined(&TGREAD);
    eval 'sub TGWRITE () {00020;}' unless defined(&TGWRITE);
    eval 'sub TGEXEC () {00010;}' unless defined(&TGEXEC);
    eval 'sub TOREAD () {00004;}' unless defined(&TOREAD);
    eval 'sub TOWRITE () {00002;}' unless defined(&TOWRITE);
    eval 'sub TOEXEC () {00001;}' unless defined(&TOEXEC);
}
1;

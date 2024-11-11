require '_h2ph_pre.ph';

no warnings qw(redefine misc);

unless(defined(&_STAB_H_)) {
    eval 'sub _STAB_H_ () {1;}' unless defined(&_STAB_H_);
    eval 'sub N_GSYM () {0x20;}' unless defined(&N_GSYM);
    eval 'sub N_FNAME () {0x22;}' unless defined(&N_FNAME);
    eval 'sub N_FUN () {0x24;}' unless defined(&N_FUN);
    eval 'sub N_STSYM () {0x26;}' unless defined(&N_STSYM);
    eval 'sub N_LCSYM () {0x28;}' unless defined(&N_LCSYM);
    eval 'sub N_MAIN () {0x2a;}' unless defined(&N_MAIN);
    eval 'sub N_PC () {0x30;}' unless defined(&N_PC);
    eval 'sub N_RSYM () {0x40;}' unless defined(&N_RSYM);
    eval 'sub N_SLINE () {0x44;}' unless defined(&N_SLINE);
    eval 'sub N_DSLINE () {0x46;}' unless defined(&N_DSLINE);
    eval 'sub N_BSLINE () {0x48;}' unless defined(&N_BSLINE);
    eval 'sub N_SSYM () {0x60;}' unless defined(&N_SSYM);
    eval 'sub N_SO () {0x64;}' unless defined(&N_SO);
    eval 'sub N_LSYM () {0x80;}' unless defined(&N_LSYM);
    eval 'sub N_BINCL () {0x82;}' unless defined(&N_BINCL);
    eval 'sub N_SOL () {0x84;}' unless defined(&N_SOL);
    eval 'sub N_PSYM () {0xa0;}' unless defined(&N_PSYM);
    eval 'sub N_EINCL () {0xa2;}' unless defined(&N_EINCL);
    eval 'sub N_ENTRY () {0xa4;}' unless defined(&N_ENTRY);
    eval 'sub N_LBRAC () {0xc0;}' unless defined(&N_LBRAC);
    eval 'sub N_EXCL () {0xc2;}' unless defined(&N_EXCL);
    eval 'sub N_RBRAC () {0xe0;}' unless defined(&N_RBRAC);
    eval 'sub N_BCOMM () {0xe2;}' unless defined(&N_BCOMM);
    eval 'sub N_ECOMM () {0xe4;}' unless defined(&N_ECOMM);
    eval 'sub N_ECOML () {0xe8;}' unless defined(&N_ECOML);
    eval 'sub N_LENG () {0xfe;}' unless defined(&N_LENG);
}
1;

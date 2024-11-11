require '_h2ph_pre.ph';

no warnings qw(redefine misc);

unless(defined(&_SYS_MCHAIN_H_)) {
    eval 'sub _SYS_MCHAIN_H_ () {1;}' unless defined(&_SYS_MCHAIN_H_);
    if(defined(&_KERNEL)) {
	eval 'sub MB_MSYSTEM () {0;}' unless defined(&MB_MSYSTEM);
	eval 'sub MB_MUSER () {1;}' unless defined(&MB_MUSER);
	eval 'sub MB_MINLINE () {2;}' unless defined(&MB_MINLINE);
	eval 'sub MB_MZERO () {3;}' unless defined(&MB_MZERO);
	eval 'sub MB_MCUSTOM () {4;}' unless defined(&MB_MCUSTOM);
    }
}
1;

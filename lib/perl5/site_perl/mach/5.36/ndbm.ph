require '_h2ph_pre.ph';

no warnings qw(redefine misc);

unless(defined(&_NDBM_H_)) {
    eval 'sub _NDBM_H_ () {1;}' unless defined(&_NDBM_H_);
    require 'db.ph';
    eval 'sub DBM_RDONLY () { &O_RDONLY;}' unless defined(&DBM_RDONLY);
    eval 'sub DBM_INSERT () {0;}' unless defined(&DBM_INSERT);
    eval 'sub DBM_REPLACE () {1;}' unless defined(&DBM_REPLACE);
    eval 'sub DBM_SUFFIX () {".db";}' unless defined(&DBM_SUFFIX);
    eval 'sub dbm_pagfno {
        my($a) = @_;
	    eval q( &DBM_PAGFNO_NOT_AVAILABLE);
    }' unless defined(&dbm_pagfno);
    if((defined(&__BSD_VISIBLE) ? &__BSD_VISIBLE : undef)) {
    }
    if((defined(&__BSD_VISIBLE) ? &__BSD_VISIBLE : undef)) {
    }
}
1;

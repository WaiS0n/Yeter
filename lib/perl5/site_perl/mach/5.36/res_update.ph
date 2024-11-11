require '_h2ph_pre.ph';

no warnings qw(redefine misc);

unless(defined(&__RES_UPDATE_H)) {
    eval 'sub __RES_UPDATE_H () {1;}' unless defined(&__RES_UPDATE_H);
    require 'sys/types.ph';
    require 'arpa/nameser.ph';
    require 'resolv.ph';
    eval 'sub res_mkupdate () { &__res_mkupdate;}' unless defined(&res_mkupdate);
    eval 'sub res_update () { &__res_update;}' unless defined(&res_update);
    eval 'sub res_mkupdrec () { &__res_mkupdrec;}' unless defined(&res_mkupdrec);
    eval 'sub res_freeupdrec () { &__res_freeupdrec;}' unless defined(&res_freeupdrec);
    eval 'sub res_nmkupdate () { &__res_nmkupdate;}' unless defined(&res_nmkupdate);
    eval 'sub res_nupdate () { &__res_nupdate;}' unless defined(&res_nupdate);
}
1;

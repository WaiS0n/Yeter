require '_h2ph_pre.ph';

no warnings qw(redefine misc);

unless(defined(&LIBNETMAP_H_)) {
    eval 'sub LIBNETMAP_H_ () {1;}' unless defined(&LIBNETMAP_H_);
    require 'net/netmap_user.ph';
    eval 'sub NMREQ_OPT_MAXKEYS () {16;}' unless defined(&NMREQ_OPT_MAXKEYS);
    eval 'sub NMREQ_OPTK_ALLOWEMPTY () {(1 << 0);}' unless defined(&NMREQ_OPTK_ALLOWEMPTY);
    eval 'sub NMREQ_OPTK_MUSTSET () {(1 << 1);}' unless defined(&NMREQ_OPTK_MUSTSET);
    eval 'sub NMREQ_OPTK_DEFAULT () {(1 << 2);}' unless defined(&NMREQ_OPTK_DEFAULT);
    eval 'sub NMREQ_OPTF_DISABLED () {(1 << 0);}' unless defined(&NMREQ_OPTF_DISABLED);
    eval 'sub NMREQ_OPTF_ALLOWEMPTY () {(1 << 1);}' unless defined(&NMREQ_OPTF_ALLOWEMPTY);
    eval 'sub nmreq_foreach_option {
        my($h_, $o_) = @_;
	    eval q( &for (($o_) = (( &uintptr_t)(($h_)-> &nr_options)); ($o_) !=  &NULL; ($o_) = (( &uintptr_t)(($o_)-> &nro_next))));
    }' unless defined(&nmreq_foreach_option);
    unless(defined(&LIBNETMAP_NOTHREADSAFE)) {
    }
}
1;

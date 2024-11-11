require '_h2ph_pre.ph';

no warnings qw(redefine misc);

unless(defined(&_MEMSTAT_H_)) {
    eval 'sub _MEMSTAT_H_ () {1;}' unless defined(&_MEMSTAT_H_);
    eval 'sub MEMSTAT_MAXCALLER () {16;}' unless defined(&MEMSTAT_MAXCALLER);
    eval 'sub ALLOCATOR_UNKNOWN () {0;}' unless defined(&ALLOCATOR_UNKNOWN);
    eval 'sub ALLOCATOR_MALLOC () {1;}' unless defined(&ALLOCATOR_MALLOC);
    eval 'sub ALLOCATOR_UMA () {2;}' unless defined(&ALLOCATOR_UMA);
    eval 'sub ALLOCATOR_ANY () {255;}' unless defined(&ALLOCATOR_ANY);
    eval 'sub MEMTYPE_MAXNAME () {32;}' unless defined(&MEMTYPE_MAXNAME);
    eval 'sub MEMSTAT_ERROR_UNDEFINED () {0;}' unless defined(&MEMSTAT_ERROR_UNDEFINED);
    eval 'sub MEMSTAT_ERROR_NOMEMORY () {1;}' unless defined(&MEMSTAT_ERROR_NOMEMORY);
    eval 'sub MEMSTAT_ERROR_VERSION () {2;}' unless defined(&MEMSTAT_ERROR_VERSION);
    eval 'sub MEMSTAT_ERROR_PERMISSION () {3;}' unless defined(&MEMSTAT_ERROR_PERMISSION);
    eval 'sub MEMSTAT_ERROR_DATAERROR () {5;}' unless defined(&MEMSTAT_ERROR_DATAERROR);
    eval 'sub MEMSTAT_ERROR_KVM () {6;}' unless defined(&MEMSTAT_ERROR_KVM);
    eval 'sub MEMSTAT_ERROR_KVM_NOSYMBOL () {7;}' unless defined(&MEMSTAT_ERROR_KVM_NOSYMBOL);
    eval 'sub MEMSTAT_ERROR_KVM_SHORTREAD () {8;}' unless defined(&MEMSTAT_ERROR_KVM_SHORTREAD);
}
1;

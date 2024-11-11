require '_h2ph_pre.ph';

no warnings qw(redefine misc);

unless(defined(&_SYS_BLIST_H_)) {
    eval 'sub _SYS_BLIST_H_ () {1;}' unless defined(&_SYS_BLIST_H_);
    eval 'sub SWAPBLK_MASK () {(( &daddr_t)(( &u_daddr_t)-1>> 1));}' unless defined(&SWAPBLK_MASK);
    eval 'sub SWAPBLK_NONE () {(( &daddr_t)(( &u_daddr_t) &SWAPBLK_MASK + 1));}' unless defined(&SWAPBLK_NONE);
    eval 'sub BLIST_RADIX () {($sizeof{ &u_daddr_t} * 8);}' unless defined(&BLIST_RADIX);
    eval 'sub BLIST_MAX_ALLOC () { &BLIST_RADIX;}' unless defined(&BLIST_MAX_ALLOC);
}
1;

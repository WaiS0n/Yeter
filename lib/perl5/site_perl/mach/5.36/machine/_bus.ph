require '_h2ph_pre.ph';

no warnings qw(redefine misc);

unless(defined(&AMD64_INCLUDE__BUS_H)) {
    eval 'sub AMD64_INCLUDE__BUS_H () {1;}' unless defined(&AMD64_INCLUDE__BUS_H);
}
1;

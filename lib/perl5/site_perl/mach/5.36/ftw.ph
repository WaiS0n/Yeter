require '_h2ph_pre.ph';

no warnings qw(redefine misc);

unless(defined(&_FTW_H)) {
    eval 'sub _FTW_H () {1;}' unless defined(&_FTW_H);
    require 'sys/types.ph';
    require 'sys/stat.ph';
    eval 'sub FTW_F () {0;}' unless defined(&FTW_F);
    eval 'sub FTW_D () {1;}' unless defined(&FTW_D);
    eval 'sub FTW_DNR () {2;}' unless defined(&FTW_DNR);
    eval 'sub FTW_DP () {3;}' unless defined(&FTW_DP);
    eval 'sub FTW_NS () {4;}' unless defined(&FTW_NS);
    eval 'sub FTW_SL () {5;}' unless defined(&FTW_SL);
    eval 'sub FTW_SLN () {6;}' unless defined(&FTW_SLN);
    eval 'sub FTW_PHYS () {0x1;}' unless defined(&FTW_PHYS);
    eval 'sub FTW_MOUNT () {0x2;}' unless defined(&FTW_MOUNT);
    eval 'sub FTW_DEPTH () {0x4;}' unless defined(&FTW_DEPTH);
    eval 'sub FTW_CHDIR () {0x8;}' unless defined(&FTW_CHDIR);
}
1;
